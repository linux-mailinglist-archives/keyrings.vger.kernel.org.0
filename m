Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60EED445471
	for <lists+keyrings@lfdr.de>; Thu,  4 Nov 2021 15:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhKDOGI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 4 Nov 2021 10:06:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44759 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230420AbhKDOGH (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 4 Nov 2021 10:06:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636034608;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mVpli9yCwDhWcX4uAnPsLbN0S8JKiEVaHJuyehAQrU8=;
        b=ZlvhSNdOrxNcL0VxbZ0U5shyjlSj1vHfnZfU6ThovMeI9Hc/phpd8ov0W/V+m9NX+2niEp
        1ssNkeYIq+qHuBLhgjVi/h3N3LTLw2ZNlSOAjstOFAlR94lb0romEj6urzMojQwehDxuMo
        +1bj10X+VqDK956syL3e47TlgdbCRFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-ZYZbysfsM-KKtmIxb_-D4g-1; Thu, 04 Nov 2021 10:03:27 -0400
X-MC-Unique: ZYZbysfsM-KKtmIxb_-D4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1ED7A100CE84;
        Thu,  4 Nov 2021 14:03:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.144])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 393A019EF9;
        Thu,  4 Nov 2021 14:03:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20211019075935.74627-1-andrew.zaborowski@intel.com>
References: <20211019075935.74627-1-andrew.zaborowski@intel.com>
To:     Andrew Zaborowski <andrew.zaborowski@intel.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org
Subject: Re: [RESEND][PATCH] keys: X.509 public key issuer lookup without AKID
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1724748.1636034601.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date:   Thu, 04 Nov 2021 14:03:21 +0000
Message-ID: <1724749.1636034601@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Andrew Zaborowski <andrew.zaborowski@intel.com> wrote:

> There are non-root X.509 v3 certificates in use out there that contain
> no Authority Key Identifier extension (RFC5280 section 4.2.1.1).  For
> trust verification purposes the kernel asymmetric key type keeps two
> struct asymmetric_key_id instances that the key can be looked up by,
> and another two to look up the key's issuer.  The x509 public key type
> and the PKCS7 type generate them from the SKID and AKID extensions in
> the certificate.  In effect current code has no way to look up the
> issuer certificate for verification without the AKID.
> =

> To remedy this, add a third asymmetric_key_id blob to the arrays in
> both asymmetric_key_id's (for certficate subject) and in the
> public_keys_signature's auth_ids (for issuer lookup), using just raw
> subject and issuer DNs from the certificate.  Adapt
> asymmetric_key_ids() and its callers to use the third ID for lookups
> when none of the other two are available.  Attempt to keep the logic
> intact when they are, to minimise behaviour changes.  Adapt the
> restrict functions' NULL-checks to include that ID too.  Do not modify
> the lookup logic in pkcs7_verify.c, the AKID extensions are still
> required there.
> =

> Internally use a new "dn:" prefix to the search specifier string
> generated for the key lookup in find_asymmetric_key().  This tells
> asymmetric_key_match_preparse to only match the data against the raw
> DN in the third ID and shouldn't conflict with search specifiers
> already in use.
> =

> In effect implement what (2) in the struct asymmetric_key_id comment
> (include/keys/asymmetric-type.h) is probably talking about already, so
> do not modify that comment.  It is also how "openssl verify" looks up
> issuer certificates without the AKID available.  Lookups by the raw
> DN are unambiguous only provided that the CAs respect the condition in
> RFC5280 4.2.1.1 that the AKID may only be omitted if the CA uses
> a single signing key.
> =

> The following is an example of two things that this change enables.
> A self-signed ceritficate is generated following the example from
> https://letsencrypt.org/docs/certificates-for-localhost/, and can be
> looked up by an identifier and verified against itself by linking to a
> restricted keyring -- both things not possible before due to the missing
> AKID extension:
> =

> $ openssl req -x509 -out localhost.crt -outform DER -keyout localhost.ke=
y \
>   -newkey rsa:2048 -nodes -sha256 \
>   -subj '/CN=3Dlocalhost' -extensions EXT -config <( \
>    echo -e "[dn]\nCN=3Dlocalhost\n[req]\ndistinguished_name =3D dn\n[EXT=
]\n" \
>           "subjectAltName=3DDNS:localhost\nkeyUsage=3DdigitalSignature\n=
" \
> 	  "extendedKeyUsage=3DserverAuth")
> $ keyring=3D`keyctl newring test @u`
> $ trusted=3D`keyctl padd asymmetric trusted $keyring < localhost.crt`; \
>   echo $trusted
> 39726322
> $ keyctl search $keyring asymmetric dn:3112301006035504030c096c6f63616c6=
86f7374
> 39726322
> $ keyctl restrict_keyring $keyring asymmetric key_or_keyring:$trusted
> $ keyctl padd asymmetric verified $keyring < localhost.crt
> =

> Signed-off-by: Andrew Zaborowski <andrew.zaborowski@intel.com>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> ...
> +			 * 3rd are the fallbacks. If excatly one of

"exactly".

But, apart from that:

Acked-by: David Howells <dhowells@redhat.com>

