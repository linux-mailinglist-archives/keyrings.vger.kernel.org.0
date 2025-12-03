Return-Path: <keyrings+bounces-3498-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6753DC9E5E3
	for <lists+keyrings@lfdr.de>; Wed, 03 Dec 2025 10:02:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6D7D34E3890
	for <lists+keyrings@lfdr.de>; Wed,  3 Dec 2025 09:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95D862D6E70;
	Wed,  3 Dec 2025 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X0osmMFJ"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D778D2D0610
	for <keyrings@vger.kernel.org>; Wed,  3 Dec 2025 09:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752500; cv=none; b=FoAt68DDRHIQb5Kgjmg1ILQfXSD/E3OjP5BmXVkuTFkcmxOYE2x9dIH13xDjTicOMAyjYQupcIyIZFqDIGAIkDYnzSkscij2F/Dwgo6wcTlM7ykwfQn0o7b2IYYh9uNAxmjgljDH4ms1MVNgELRANoQdXkQYnEDkBAdkYvudrdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752500; c=relaxed/simple;
	bh=vIwUJ0goI0C1yxxERv1G3eCwXSERxKrEpSTSJJVAXIU=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=q/d3lQ1MkwNirZSLGipd0m8/RAZcSaIHan9P6QVg+5xJKZRU+wCIcmHh3Riy2Tyl8rOAR1MWX/bA7tUOOqnPVDyP5ClS4JV7ZWneSHVg+BjI/wqXFR1/hZtUTKW0ZVdc9rJSszUzsl3Y0RJMpzDSJFq7GjSofeUj0QMihMgQ8qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X0osmMFJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764752497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lv4nzr1Qaoy5VKC0VGHotmxyvcmCxUkHsPe1OGF9+6I=;
	b=X0osmMFJ3KX55+B69L0tDe1fzTBJZSH6cX8blIYIJc58PtnaYujGTBmXJf2cr+DG3aIcaB
	YIjp2XWAQsF8h2XdqvgsNnsoxfkgVBk0P7CuR/hNyzaIHuTO26g1FkFZbcCu4knOVF/1o+
	3KBlSKa9PssdIYw9aSIIwCUnOEWhywo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-120-7GVZsr8WPAqCrCQfbqBWyg-1; Wed,
 03 Dec 2025 04:01:23 -0500
X-MC-Unique: 7GVZsr8WPAqCrCQfbqBWyg-1
X-Mimecast-MFC-AGG-ID: 7GVZsr8WPAqCrCQfbqBWyg_1764752480
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C2A418001E8;
	Wed,  3 Dec 2025 09:01:20 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.14])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4B618180057E;
	Wed,  3 Dec 2025 09:01:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251203072844.484893-3-ebiggers@kernel.org>
References: <20251203072844.484893-3-ebiggers@kernel.org> <20251203072844.484893-1-ebiggers@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, linux-crypto@vger.kernel.org,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>,
    Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org,
    linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] lib/crypto: tests: Add KUnit tests for ML-DSA verification
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1682767.1764752475.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Dec 2025 09:01:15 +0000
Message-ID: <1682768.1764752475@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

I'm seeing:

	ERROR: modpost: module mldsa_kunit uses symbol mldsa_use_hint from namesp=
ace EXPORTED_FOR_KUNIT_TESTING, but does not import it.

I have this in my .config:

	CONFIG_CRYPTO_LIB_MLDSA=3Dm
	CONFIG_CRYPTO_LIB_MLDSA_KUNIT_TEST=3Dm

The problem appears to be here:

	#if IS_ENABLED(CONFIG_CRYPTO_LIB_MLDSA_KUNIT_TEST)
	/* Allow the __always_inline function use_hint() to be unit-tested. */
	s32 mldsa_use_hint(u8 h, s32 r, s32 gamma2)
	{
		return use_hint(h, r, gamma2);
	}
	EXPORT_SYMBOL_IF_KUNIT(mldsa_use_hint);
	#endif

It works if EXPORT_SYMBOL_IF_KUNIT() is changed to EXPORT_SYMBOL_GPL().

David


