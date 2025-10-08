Return-Path: <keyrings+bounces-3187-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B86EBC38A1
	for <lists+keyrings@lfdr.de>; Wed, 08 Oct 2025 09:08:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A55A19E044E
	for <lists+keyrings@lfdr.de>; Wed,  8 Oct 2025 07:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D95F2BF3F3;
	Wed,  8 Oct 2025 07:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=lublin.se header.i=@lublin.se header.b="BXaV/Sjy"
X-Original-To: keyrings@vger.kernel.org
Received: from mailgate01.uberspace.is (mailgate01.uberspace.is [95.143.172.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920B12F0C6D
	for <keyrings@vger.kernel.org>; Wed,  8 Oct 2025 07:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.143.172.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759907298; cv=none; b=AhaXEnTyGJU+e7w8xaTL6elR+NyfDBkbIuQB4/D8xeQv1IVumRraY3SS5N6XAwtOZ8j3mZ4mvNiG9Uv36WUNnnPz8LV3vnjAHW5vtSuY0RZQvJo9LMkXWY3EI3JjB2WmALpAj8+FZNG738ORakTEaQtMjBm9ovDXk7eVypJchuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759907298; c=relaxed/simple;
	bh=SuUvUUOMrXv9aKVf/ayIBD+ut6qLodp8LTtULaKwLS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAAo808eDTguHKbleGUwPLDZsRoRSFLiGNVq9pkNbYM7TQz3mduTRRQDcqiBLWGJ0tIG6Fb0bV8GazZ9vcNBzUAHhbDrSUkkdTSdPOtwJ2rdhi+cL1iI8FGzknfz2CvmYIiZDXMFMWYSXhsqwUt4OpB32tiqI58p5XommorQZfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lublin.se; spf=pass smtp.mailfrom=lublin.se; dkim=fail (0-bit key) header.d=lublin.se header.i=@lublin.se header.b=BXaV/Sjy reason="key not found in DNS"; arc=none smtp.client-ip=95.143.172.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lublin.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lublin.se
Received: from dysnomia.uberspace.de (dysnomia.uberspace.de [185.26.156.223])
	by mailgate01.uberspace.is (Postfix) with ESMTPS id 3A68360C3D
	for <keyrings@vger.kernel.org>; Wed,  8 Oct 2025 09:08:08 +0200 (CEST)
Received: (qmail 31825 invoked by uid 989); 8 Oct 2025 07:08:02 -0000
Authentication-Results: dysnomia.uberspace.de;
	auth=pass (login)
Received: from unknown (HELO unkown) (::1)
	by dysnomia.uberspace.de (Haraka/3.0.1) with ESMTPSA; id 2D81A2689AB6; Wed, 08 Oct 2025 09:08:02 +0200 (CEST)
Date: Wed, 8 Oct 2025 09:08:02 +0200
From: Daniel Lublin <daniel@lublin.se>
To: David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>
Cc: keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sign-file: Show -k flag in usage when built for CMS
 signing
Message-ID: <22283629-6386-4d04-99c9-947669f013a2@corax>
References: <e66415d1953fbb074e2e32f0e6cdcaa0d027b550.1748951428.git.daniel@lublin.se>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e66415d1953fbb074e2e32f0e6cdcaa0d027b550.1748951428.git.daniel@lublin.se>
X-Rspamd-Bar: --
X-Rspamd-Report: BAYES_HAM(-2.835451) MID_RHS_NOT_FQDN(0.5) MIME_GOOD(-0.1)
X-Rspamd-Score: -2.435451
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=lublin.se; s=uberspace;
	h=from:to:cc:subject:date;
	bh=SuUvUUOMrXv9aKVf/ayIBD+ut6qLodp8LTtULaKwLS4=;
	b=BXaV/SjyYpgocKr7tuvCYGrfmJo4s8MRkEHb3dSyVDi0/TJibgBIzzJ/aH/gDQS/a7i1fPxqta
	W6BayWbnVSoIvsHXQFWc0Fbp/XfYlA5EtyJ1rTqHQr63R+nXLyROqz6MSV80R9Yz6IonO2cmP6on
	cj8gz4an5bbmfSMxfJaSL/gTj+4o7OxAfGESlmzWo5/l8LXKvtxKCMNSjHPLnRe/FVrg4KPzFDmf
	4f1JNt8xsWUjVqg8HBC0oe6UtIctL0UsGt5aUs0QDwogHGjnN1G2pndIeDREsVvzO1fpTywEY1tm
	bmvtlT029HuozlqZU0xSHn3NrEO2FrPdweopIF9n9fMt03lUG+ewHoENwAZ/GB2WT4UEi2SlM7Ua
	NMisG+aowDIyDnUyyxd2IdRbw6PJ9QI7OG0nifqGT2Xf/LzKDVoHkIvj84ZkyXpNtlxx0Ly+aL2L
	Xm1KmsF8vYY4ziR52vpMsu6oeAnxEQNEAblPsDr36zi5UYYRZSYcYHYPMD9Fzc6H5OYUlOOTeHqp
	mFtVDFhFcPTAQ9yc+3GZw+9dcFnWX8b59O8x63y/TpyZ0giAR/LB3VGHUyKfJj9CXD5zhkvcQpyh
	sEcZ827dW16VwRKvIJ1kvs93aApVmjAYhofY5sX127IRiqxkeB54cRZosAJP4ExCaVTD7FXqjuQY
	E=

Any comments on this? Yay, or should we forget it?

-- 
Daniel
lublin.se

