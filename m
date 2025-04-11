Return-Path: <keyrings+bounces-2611-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 788A9A852F9
	for <lists+keyrings@lfdr.de>; Fri, 11 Apr 2025 07:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E02F1BA0DB8
	for <lists+keyrings@lfdr.de>; Fri, 11 Apr 2025 05:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C625C26F462;
	Fri, 11 Apr 2025 05:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="SEJsE1vc"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A03800;
	Fri, 11 Apr 2025 05:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744348744; cv=none; b=LtSSdfh1gq330nLBTxEhY4NF+Xf9PUTT6UUE4rXb6BtUTmr8+bcRuWHBz85BmxfzzEoldl97j9VyYTmgEW2Kkp89uMrPJlOOfLOZo1PJxXZ/y8MRfk0bWcveoVfKX1qlMbve+9K/aus/iBbjRAc68bdqaHGWPRisAOh4nnDRwZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744348744; c=relaxed/simple;
	bh=IqSRQOutg+lSKvgxnPhObEbWxO6AaTi44G63FPoeKyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDZvq+DbC0NG6JsRWjrIJRx6vf6IPYbow0++ObtevrGblLarKeg7CGlcVIstGllabrjhFaAX7i6ikF3Hoq7pqhtVnV1mANGRtNedFvvMXrB2WutvRRBJ6Da1A4MEYYXu+6kxpY3LMhrUKyEa8H4GPKqe+IMikMgm7vtprxWZ1U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=SEJsE1vc; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ZEklUjidFtoZ8deAmHVTu5AXS7JqIfMBRiWA0f30O4w=; b=SEJsE1vcfLwUzViAOvFAa03FHq
	hKs8L2h5zIqqPxeOtapJSUfDV4xVQxLdGV8ObjLEpAg2SQ1wtZnR81UTflRwhygxJLC+CZ+WInIky
	zPFxN0hV3W1iVlN74szYpV2KswJ/rV/yvB124B3IcL8MKZDrbuL4wje7PmyyMMdpAC1hElC0sKPwH
	TdxAKqEflV1FCBOKb1z9MvJJsYRW6elY81+mfCSnGnLHKhnpWCPVV4Jb21LGNs949jM/gLMYWquy/
	hE9c4q+YWLmYZemAd1GNg1h2UvPlma0ybfbgZRwhgRN4AeSb1bYww6f9mSRQ2vRd5FnulN1P3rolD
	AwCpb9SA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u36m2-00Ek2o-1T;
	Fri, 11 Apr 2025 13:17:55 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 11 Apr 2025 13:17:54 +0800
Date: Fri, 11 Apr 2025 13:17:54 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Gupta, Nipun" <nipun.gupta@amd.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, davem@davemloft.net,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org,
	ogabbay@kernel.org, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, derek.kiernan@amd.com, dragan.cvetic@amd.com,
	arnd@arndb.de, praveen.jain@amd.com, harpreet.anand@amd.com,
	nikhil.agarwal@amd.com, srivatsa@csail.mit.edu, code@tyhicks.com,
	ptsm@linux.microsoft.com, linux-crypto@vger.kernel.org,
	David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org
Subject: Re: [PATCH v2 2/3] accel/amdpk: add driver for AMD PKI accelerator
Message-ID: <Z_imAnYu1hGRb8An@gondor.apana.org.au>
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
 <20250409173033.2261755-2-nipun.gupta@amd.com>
 <20250410-sly-inventive-squirrel-ddecbc@shite>
 <bf851be7-74a5-8f9d-375b-b617691b6765@amd.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf851be7-74a5-8f9d-375b-b617691b6765@amd.com>

On Fri, Apr 11, 2025 at 10:21:03AM +0530, Gupta, Nipun wrote:
>
> added crypto maintainers for comments.
> IMO, as accel framework is designed to support any type of compute
> accelerators, the PKI crypto accelerator in accel framework is not
> completely out of place here, as also suggested at:
> https://lore.kernel.org/all/2025031352-gyration-deceit-5563@gregkh/
> 
> Having the crypto accelerator as part of accel also enables to extract
> the most performance from the HW PKI engines, given that the queue
> assignment is handled per drm device open call.

There is actually a user-space interface for asymmetric crypto
through the keyring subsystem.  Adding the maintainers of those
in case they wish to comment on your driver.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

