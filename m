Return-Path: <keyrings+bounces-3307-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AF2C3F863
	for <lists+keyrings@lfdr.de>; Fri, 07 Nov 2025 11:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C6573B9332
	for <lists+keyrings@lfdr.de>; Fri,  7 Nov 2025 10:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC2EE32ABEC;
	Fri,  7 Nov 2025 10:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MwksCqqe"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBE92868A7
	for <keyrings@vger.kernel.org>; Fri,  7 Nov 2025 10:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511663; cv=none; b=U1ogFEG43OuSqHnv90TVDeqLjIH6pQpCqlngja+hPbgbntJP53xZQP1rQ8qj86iFO14lBTXDkifjAKISnABo2nm3RCbOjn6PAWA7ZUbPCMUU3MT+si+zqM9OcqFN4D1cq4LJP0De9YQCLMjVguqo9ojdCV05wa3wwzjTtrLC+M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511663; c=relaxed/simple;
	bh=cOCGVKmVEovJesU3WW8kK1oX09gBBIpX3J0LJkfvNN8=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=eWXyfMuj8J6YHii2pp/W9w3xyGUrFwlevjcMuwFORI3HVnJx2O+AmhrI24Gu+mEYeQroxkJ88yo2i+zGuBWlkAYb4H/ALRajx1egjqrsCViyDoiSNdEb2z4lUq92wWIvwHpUWjSJ35jCtpZxC09SZEAhanPSozBoRYBIoELzYUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MwksCqqe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762511661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mRnffMyHiAhteHPeQJ+/psTcXTA9GHmSEDbZPxSCiXA=;
	b=MwksCqqeS86mMPfJUinWYRLOqqkfuGW71RpAz929SCFuElliKSF2k84soT0Gq6Cx8GCQZ+
	6tRRwfnTwTi+LcdBBhJQY/53qSLu/ysG45v50O4Bj8tQIvGGi6Yhg/gqSq890xQlgWSub+
	bmkmoHTt7WzfqyZ0iSPkNg98G9+pqew=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-633-kFb5TB9lMOqKe88aYlyBOA-1; Fri,
 07 Nov 2025 05:34:17 -0500
X-MC-Unique: kFb5TB9lMOqKe88aYlyBOA-1
X-Mimecast-MFC-AGG-ID: kFb5TB9lMOqKe88aYlyBOA_1762511655
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 24E7E1956063;
	Fri,  7 Nov 2025 10:34:15 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.6])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9EC2B1945110;
	Fri,  7 Nov 2025 10:34:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251106192016.GA3318@quark>
References: <20251106192016.GA3318@quark> <20251106174456.31818-1-dhowells@redhat.com> <20251106174456.31818-3-dhowells@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, Herbert Xu <herbert@gondor.apana.org.au>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason A .
 Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>,
    Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org,
    keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/8] crypto: Add ML-DSA/Dilithium verify support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <62629.1762511649.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Nov 2025 10:34:09 +0000
Message-ID: <62630.1762511649@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Eric Biggers <ebiggers@kernel.org> wrote:

> On Thu, Nov 06, 2025 at 05:44:46PM +0000, David Howells wrote:
> > The interface to this code is through the crypto_sig API as the PKCS#7=
 code
> > wants to use that rather than calling it directly.  As such, I've plac=
ed it
> > in crypto/ rather than lib/crypto/.  Only the verification hooks are
> > implemented; the signing hooks return an error.
> =

> As I mentioned before
> (https://lore.kernel.org/linux-crypto/20250613170456.GA1284@sol/), this
> code should go in lib/crypto/.  There seems to be a clean API in
> crypto/ml_dsa/dilithium.h already.  Just make that the library API.

Fine.  Is it ever likely to be used directly, I wonder?

There is a downside of moving stuff to lib/crypto/: dynamically loadable
algorithms now need two modules instead of one.  For initial module signin=
g,
granted, the algorithms for that must be built in.

> If "crypto_sig" support is really needed too, then put that in
> crypto/ml-dsa.c, built on top of the library API.  It's not clear the
> crypto_sig support is very useful, though.  For one, you had to add
> ML-DSA specific logic to the calling code anyway (see "pkcs7: Allow the
> signing algo to calculate the digest itself").

The actual signature check still goes through the same code path as everyt=
hing
else, so crypto_sig will remain the API.  Otherwise I have to basically
reimplement crypto_sig inside crypto/asymmetric_keys/, including the on-de=
mand
algorithm loading.

David


