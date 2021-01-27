Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA300305E28
	for <lists+keyrings@lfdr.de>; Wed, 27 Jan 2021 15:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbhA0OXr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Jan 2021 09:23:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39143 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233891AbhA0OXm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Jan 2021 09:23:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611757336;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=3x3v94BjOwEDdN4Q5vF6tZl1Pibldsq9m5DYt5qg7Fk=;
        b=Uy70EYuclV31XoO3Divx0/PSZsgE7hbrvl2FFGuBcLiRavWovgmPWWwmyBME9cio66k4k9
        2upvdNxgs2O0bKAfc1JCNioNxz+5Ejh2OdowaMRF8171GqHTXrUg9YpYP7C1Jk2WudyWrV
        r66y8XbJ2D0TTLzC3m4yHjzxKAysCxU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-hrOrMKrXOam1O0EEU5Fuow-1; Wed, 27 Jan 2021 09:22:12 -0500
X-MC-Unique: hrOrMKrXOam1O0EEU5Fuow-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA00B193578E;
        Wed, 27 Jan 2021 14:22:10 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-115-23.rdu2.redhat.com [10.10.115.23])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4A5F519716;
        Wed, 27 Jan 2021 14:22:09 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <20210127123350.817593-1-stefanb@linux.vnet.ibm.com>
References: <20210127123350.817593-1-stefanb@linux.vnet.ibm.com>
To:     Stefan Berger <stefanb@linux.vnet.ibm.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, linux-crypto@vger.kernel.org,
        patrick@puiterwijk.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v3 0/3] Add support for x509 certs with NIST p256 and p192 keys
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3114061.1611757328.1@warthog.procyon.org.uk>
Date:   Wed, 27 Jan 2021 14:22:08 +0000
Message-ID: <3114062.1611757328@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Stefan Berger <stefanb@linux.vnet.ibm.com> wrote:

> This series of patches adds support for x509 certificates signed by a CA
> that uses NIST p256 or p192 keys for signing. It also adds support for
> certificates where the public key is a NIST p256 or p192 key. The math
> for ECDSA signature verification is also added.
> 
> Since self-signed certificates are verified upon loading, the following
> script can be used for testing:
> 
> k=$(keyctrl newring test @u)
> 
> while :; do
> 	for hash in sha1 sha224 sha256 sha384 sha512; do
> 		openssl req \
> 			-x509 \
> 			-${hash} \
> 			-newkey ec \
> 			-pkeyopt ec_paramgen_curve:prime256v1 \
> 			-keyout key.pem \
> 			-days 365 \
> 			-subj '/CN=test' \
> 			-nodes \
> 			-outform der \
> 			-out cert.der
> 		keyctl padd asymmetric testkey $k < cert.der
> 		if [ $? -ne 0 ]; then
> 			echo "ERROR"
> 			exit 1
> 		fi
> 	done
> done
> 
> It also works with restricted keyrings where an RSA key is used to sign
> a NIST P256/P192 key. Scripts for testing are here:
> 
> https://github.com/stefanberger/eckey-testing
> 
> The ECDSA signature verification will be used by IMA Appraisal where ECDSA
> file signatures stored in RPM packages will use substantially less space
> than if RSA signatures were to be used.

I've pulled this into my keys-next branch.

David

