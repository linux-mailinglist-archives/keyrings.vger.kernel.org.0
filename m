Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42C3644563F
	for <lists+keyrings@lfdr.de>; Thu,  4 Nov 2021 16:22:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231325AbhKDPZU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 4 Nov 2021 11:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231265AbhKDPZT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 4 Nov 2021 11:25:19 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88097C061714
        for <keyrings@vger.kernel.org>; Thu,  4 Nov 2021 08:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=MIME-Version:Content-Transfer-Encoding:Content-Type:References
        :In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=v1zn/WofemxXZMMynb/1kFY8V904aqdP0hiMtC2sQDY=; b=Jedys6uQYvYluoicAGjC/xqMNp
        di0/99zCscJurdQGmldTtDAg+UKaQsIQRdODHo5Ot3PbvM74Bs8CfdQvzaEdBGCm0j5olDL69hNRh
        mz7gz609PLjKLpHY48QS1/3W9MgEX2pT8yHdhYrIdFtmoNCl4a1cK9RNGBO22sVfoNtEjVVRUpCUd
        /Qe28OqRviq9MF16fYvR2cN/mvwDZGwlnwC6lr5ldxd66sBaY0mU6BfRfoj95b2PzbiUUMy6AqVGa
        6yMexKS4i7KssKX5vkuRmFZLryjt04NBQfTi8/hBL4y4C0ftZxIz0RURCNwOExCnE45LAFRJy9EYO
        eQ6MxgEg==;
Received: from 91-152-16-26.elisa-laajakaista.fi ([91.152.16.26] helo=localhost)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <jarkko.sakkinen@iki.fi>)
        id 1mieZS-0006IQ-Q4; Thu, 04 Nov 2021 17:22:30 +0200
Message-ID: <18d15248251412c5c56e75358875ace4e91e219b.camel@iki.fi>
Subject: Re: [RESEND][PATCH] keys: X.509 public key issuer lookup without
 AKID
From:   Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
To:     David Howells <dhowells@redhat.com>,
        Andrew Zaborowski <andrew.zaborowski@intel.com>
Cc:     keyrings@vger.kernel.org
Date:   Thu, 04 Nov 2021 17:22:30 +0200
In-Reply-To: <1724749.1636034601@warthog.procyon.org.uk>
References: <20211019075935.74627-1-andrew.zaborowski@intel.com>
         <1724749.1636034601@warthog.procyon.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 91.152.16.26
X-SA-Exim-Mail-From: jarkko.sakkinen@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 2021-11-04 at 14:03 +0000, David Howells wrote:
> Andrew Zaborowski <andrew.zaborowski@intel.com> wrote:
>=20
> > There are non-root X.509 v3 certificates in use out there that contain
> > no Authority Key Identifier extension (RFC5280 section 4.2.1.1).=C2=A0 =
For
> > trust verification purposes the kernel asymmetric key type keeps two
> > struct asymmetric_key_id instances that the key can be looked up by,
> > and another two to look up the key's issuer.=C2=A0 The x509 public key =
type
> > and the PKCS7 type generate them from the SKID and AKID extensions in
> > the certificate.=C2=A0 In effect current code has no way to look up the
> > issuer certificate for verification without the AKID.
> >=20
> > To remedy this, add a third asymmetric_key_id blob to the arrays in
> > both asymmetric_key_id's (for certficate subject) and in the
> > public_keys_signature's auth_ids (for issuer lookup), using just raw
> > subject and issuer DNs from the certificate.=C2=A0 Adapt
> > asymmetric_key_ids() and its callers to use the third ID for lookups
> > when none of the other two are available.=C2=A0 Attempt to keep the log=
ic
> > intact when they are, to minimise behaviour changes.=C2=A0 Adapt the
> > restrict functions' NULL-checks to include that ID too.=C2=A0 Do not mo=
dify
> > the lookup logic in pkcs7_verify.c, the AKID extensions are still
> > required there.
> >=20
> > Internally use a new "dn:" prefix to the search specifier string
> > generated for the key lookup in find_asymmetric_key().=C2=A0 This tells
> > asymmetric_key_match_preparse to only match the data against the raw
> > DN in the third ID and shouldn't conflict with search specifiers
> > already in use.
> >=20
> > In effect implement what (2) in the struct asymmetric_key_id comment
> > (include/keys/asymmetric-type.h) is probably talking about already, so
> > do not modify that comment.=C2=A0 It is also how "openssl verify" looks=
 up
> > issuer certificates without the AKID available.=C2=A0 Lookups by the ra=
w
> > DN are unambiguous only provided that the CAs respect the condition in
> > RFC5280 4.2.1.1 that the AKID may only be omitted if the CA uses
> > a single signing key.
> >=20
> > The following is an example of two things that this change enables.
> > A self-signed ceritficate is generated following the example from
> > https://letsencrypt.org/docs/certificates-for-localhost/, and can be
> > looked up by an identifier and verified against itself by linking to a
> > restricted keyring -- both things not possible before due to the missin=
g
> > AKID extension:
> >=20
> > $ openssl req -x509 -out localhost.crt -outform DER -keyout localhost.k=
ey \
> > =C2=A0 -newkey rsa:2048 -nodes -sha256 \
> > =C2=A0 -subj '/CN=3Dlocalhost' -extensions EXT -config <( \
> > =C2=A0=C2=A0 echo -e "[dn]\nCN=3Dlocalhost\n[req]\ndistinguished_name =
=3D dn\n[EXT]\n" \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "subjectAltName=
=3DDNS:localhost\nkeyUsage=3DdigitalSignature\n" \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "extendedKeyUsag=
e=3DserverAuth")
> > $ keyring=3D`keyctl newring test @u`
> > $ trusted=3D`keyctl padd asymmetric trusted $keyring < localhost.crt`; =
\
> > =C2=A0 echo $trusted
> > 39726322
> > $ keyctl search $keyring asymmetric dn:3112301006035504030c096c6f63616c=
686f7374
> > 39726322
> > $ keyctl restrict_keyring $keyring asymmetric key_or_keyring:$trusted
> > $ keyctl padd asymmetric verified $keyring < localhost.crt
> >=20
> > Signed-off-by: Andrew Zaborowski <andrew.zaborowski@intel.com>
> > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > ...
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * 3rd=
 are the fallbacks. If excatly one of
>=20
> "exactly".
>=20
> But, apart from that:
>=20
> Acked-by: David Howells <dhowells@redhat.com>

Thanks, I'll pick this up for my rc2 PR for v5.16.

/Jarkko

