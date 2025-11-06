Return-Path: <keyrings+bounces-3294-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D99C3CE6A
	for <lists+keyrings@lfdr.de>; Thu, 06 Nov 2025 18:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E59923AB103
	for <lists+keyrings@lfdr.de>; Thu,  6 Nov 2025 17:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E9F34C801;
	Thu,  6 Nov 2025 17:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tx8rWW5u"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD7634A3A2
	for <keyrings@vger.kernel.org>; Thu,  6 Nov 2025 17:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762450678; cv=none; b=CopgAJ80xO4bo9WiRbyI9j3VZM3undx22j5198ugsItwp/Kf9b2Ncep7K2abHKpE/3TaUVNcYgb7RWunFzbYUCjcTyGmkUy4AfboRoEjrACCIGzsJufSgSbv4KinuZCnm1/5JaOYV2siarVI/Mnp4RRL74ESRnZHDAxVcELVbWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762450678; c=relaxed/simple;
	bh=+nJx01PZoIhVVk4jUct5UQsityQ6G/mROL/5XbpZOO4=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=FT0PLlV7E3oek5Wnx4fDCqL4NvpalVbkk8w1jTUbWe1T4/VDiFuTjllzkfBtOg/W5t2aHjG0D5QEEA+SqGDCp/3lfJYXdMghkOdAhT1T1THG9mcQF/437FJp2wvh2mzG2seyS6AKpO6+zX1SXsCfP20fwokt6qtXPQDM0tQfMPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tx8rWW5u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762450675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NwD7CPpHKizbf1uy1rhnrkRajkdGEoQUg1lkgWgfy3U=;
	b=Tx8rWW5u4qEcYo3sElqYg3mErbPMh591V1eINCo2PFtdjT8HCWMdDIsd0UaJ4SWkZa9fy/
	zE5m0RTWzTRZJ0SMNYU2Sjearqkg+UwYc3yY/N6cdX7aZaRTH4Vav13TmwTaF0tN2sXgBs
	QViRfgm7f4qIb6x07aNln4geZxK5h+Y=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-HPwJs847Poa2f_AwZAVzBQ-1; Thu,
 06 Nov 2025 12:37:50 -0500
X-MC-Unique: HPwJs847Poa2f_AwZAVzBQ-1
X-Mimecast-MFC-AGG-ID: HPwJs847Poa2f_AwZAVzBQ_1762450668
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B596E1956096;
	Thu,  6 Nov 2025 17:37:47 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.6])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7AAD2196B8F6;
	Thu,  6 Nov 2025 17:37:43 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <81080a24-e4a9-4287-8653-9d707e574d95@suse.com>
References: <81080a24-e4a9-4287-8653-9d707e574d95@suse.com> <20251017144311.817771-1-dhowells@redhat.com> <20251017144311.817771-18-dhowells@redhat.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: dhowells@redhat.com, Eric Biggers <ebiggers@kernel.org>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Stephan Mueller <smueller@chronox.de>,
    Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
    linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 17/17] modsign: Enable ML-DSA module signing
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <31210.1762450662.1@warthog.procyon.org.uk>
Date: Thu, 06 Nov 2025 17:37:42 +0000
Message-ID: <31211.1762450662@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Petr Pavlu <petr.pavlu@suse.com> wrote:

> This update looks ok to me. However, I'll note some problems that
> I noticed in the original text, notably:
> 
> The text doesn't match the implementation because kernel/module/Kconfig
> still allows selecting SHA-1 for module signing. What happened is that
> commit 16ab7cb5825f ("crypto: pkcs7 - remove sha1 support") initially
> removed CONFIG_MODULE_SIG_SHA1. Then, commit f2b88bab69c8
> ("Documentation/module-signing.txt: bring up to date") removed it from
> the documentation. However, commit 203a6763ab69 ("Revert "crypto: pkcs7
> - remove sha1 support"") brought back CONFIG_MODULE_SIG_SHA1 without
> reverting the documentation update.
> 
> Another problem is that for MODULE_SIG_KEY_TYPE_ECDSA, certs/Kconfig
> contains the line
> "depends on !(MODULE_SIG_SHA256 || MODULE_SIG_SHA3_256)",
> which intends to allow ECDSA only with MODULE_SIG_SHA384,
> MODULE_SIG_SHA512, MODULE_SIG_SHA3_384 and MODULE_SIG_SHA3_512. This
> restriction was added in commit d4f5bfe20da9 ("certs: Limit
> MODULE_SIG_KEY_TYPE_ECDSA to SHA384 or SHA512") and 446b1e0b7b39
> ("module: enable automatic module signing with FIPS 202 SHA-3").
> However, the documentation suggests that ECDSA can still be used with
> SHA-2/3 of size 256.
> 
> I'll prepare fixes for these issues. For the first problem, I think we
> can drop CONFIG_MODULE_SIG_SHA1 instead of correcting the documentation.

Sounds good.

> > +	  Use an ML-DSA (Dilithium) 87 key (NIST FIPS 204) for module signing
> > +	  with a SHAKE256 'hash' of the message.
> 
> Copy-and-paste error in the help message: 87 -> 44.
> ...
> Similarly here: 87 -> 65.

Fixed.

> Should all MODULE_SIG_KEY_TYPE_ML_DSA_* options depend on
> MODULE_SIG_SHAKE256 to match the updated
> Documentation/admin-guide/module-signing.rst?
> 
> Similarly, do MODULE_SIG_KEY_TYPE_RSA and MODULE_SIG_KEY_TYPE_ECDSA
> require any "depends on" update with respect to the addition of
> MODULE_SIG_SHAKE256?

Um.  In theory ML-DSA can use hashes other than SHAKE256, but I'm not sure
that OIDs exist yet to indicate that.  Also, I'm not sure how to implement the
crypto API interface such that you can ask for, say, "ml-dsa87(sha512)" from
crypto_sig.

Anyway, for the moment, I'm going to post a v7 as I've made some substantial
cleanups.

David


