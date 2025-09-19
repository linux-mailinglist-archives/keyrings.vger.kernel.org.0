Return-Path: <keyrings+bounces-3036-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8013AB8A518
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 17:35:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB7FFB62A22
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 15:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5F5314A68;
	Fri, 19 Sep 2025 15:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="adYonroL"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C650263F52
	for <keyrings@vger.kernel.org>; Fri, 19 Sep 2025 15:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758296089; cv=none; b=ITABUsiZcieRpnC6nqGgeOhlVfog7VDe7W+pKEdxNPxro26E79sXOuubyCgHFZQTsMGyB912TsZTr5ed3fCx5squaHPrCdiOuchdXIWwBPoCiZUgkDWCIipMixG33aLOC65BVprCw+BJls0G1n79AageQDWUzal/oDOYIvnD66Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758296089; c=relaxed/simple;
	bh=Ue1Vx4FYQrX5dCM08CjZdMK7j411yWuuKLF8iHVnj1Y=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=YGp6BdGcQGFWb7kar8rYjDXHtWhILQBMh2C41EE04scLQSJoeIpVAbnloozQg1npc3RrIAjFIz9nQ61cit5DH/6svDkAB3Bjr6G9Oi8pKy3zDN/hf1Dh+vtXh2gklWe/wcoLXVXLvI6g+88ybuYsUL3BOgVZg7ixnwfsZ3TaH8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=adYonroL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758296087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ue1Vx4FYQrX5dCM08CjZdMK7j411yWuuKLF8iHVnj1Y=;
	b=adYonroL2aYYG1PxYLdMF6b5K3B7z8sWfgsTfHRHUvVmvPxjKa48yy/ZE224H6vRX987H0
	93epG2RxgHl6OzkmoJS7eV+EjPIcNPFqWs7mJH6+cerFrP0HXP2GrOtLDXC6B+DBJogXFU
	MeVC1P2jWps2x6hjPhO6ZYWa4xUX6lI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-258-lf8UawQ5NIi7Ct5wjQC1Cw-1; Fri,
 19 Sep 2025 11:34:42 -0400
X-MC-Unique: lf8UawQ5NIi7Ct5wjQC1Cw-1
X-Mimecast-MFC-AGG-ID: lf8UawQ5NIi7Ct5wjQC1Cw_1758296081
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1A50D195608B;
	Fri, 19 Sep 2025 15:34:41 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.155])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7A78A30002C5;
	Fri, 19 Sep 2025 15:34:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2df4e63a5c34354ebeb6603f81a662380517fbc4.camel@redhat.com>
References: <2df4e63a5c34354ebeb6603f81a662380517fbc4.camel@redhat.com> <2952535.lGaqSPkdTl@graviton.chronox.de> <3605112.1758233248@warthog.procyon.org.uk> <3788819.1758262666@warthog.procyon.org.uk>
To: Simo Sorce <simo@redhat.com>
Cc: dhowells@redhat.com,
    Stephan =?ISO-8859-1?Q?M=FCller?= <smueller@chronox.de>,
    Eric Biggers <ebiggers@kernel.org>,
    "Jason A. Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA-512, SHAKE128, SHAKE256
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3878471.1758296076.1@warthog.procyon.org.uk>
Date: Fri, 19 Sep 2025 16:34:36 +0100
Message-ID: <3878472.1758296076@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Simo Sorce <simo@redhat.com> wrote:

> I strongly suggest creating a test vector where multiple absorb and
> squeeze operations are done in intermixed order, and then use that test
> vector in your Kunit tests to ensure changes to the code do not break
> this fundamental property of the keccak sponge algorithm.

I'm putting such a beast in the module init function at least.

Annoyingly, Eric's hash-test-template.h makes some unwarranted assumptions
about the hashes it is testing - such as the final function zeroing out the
hash struct.

David


