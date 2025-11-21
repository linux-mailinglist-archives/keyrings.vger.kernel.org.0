Return-Path: <keyrings+bounces-3410-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DF8C76FD9
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 03:22:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 25FB53416F8
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 02:15:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACC0B25782D;
	Fri, 21 Nov 2025 02:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxZ7ZFoQ"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7932C241103;
	Fri, 21 Nov 2025 02:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763691306; cv=none; b=lHxNPsobKOb0n/aOEyAG1BXMHKkOcasV41Zn7md05GVtC+4y8YCGBRvWc6dpWKw7m3cIcePhCqjfHpebB5qp5npD/mhUygWtpQNZW0afj8ipSuK93w3k3Ci8SbSleICirBD7QizyEckFcfjKzT9O54OdtXzZO+7Z1yRnaF4Mdo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763691306; c=relaxed/simple;
	bh=6bqV3PgYO5r/s5DEe1+OIJHRLy01+99I9clMdXEcjMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nvSrC/dar6Mpn+wRLz9ds6lIORIP76ubq2Qwm6MuxnDXBKlZMfSmsOGmfq5O7icEgTHiqwxjGskLFWaWgpr2qt9O0c8QPDu2ZJnpqnNA2JXBsapskwxk9GZWoXEWi4R19L1S0XKZCyMv23JSXx6sm9A1cYMdJDV7f+MFZj9Lxbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxZ7ZFoQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7901C4CEF1;
	Fri, 21 Nov 2025 02:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763691306;
	bh=6bqV3PgYO5r/s5DEe1+OIJHRLy01+99I9clMdXEcjMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oxZ7ZFoQPY7Qwq2K+yLMWWARZdskD+iVtOOEJduZPLggRHDUjIclaUfaxNgsBYc9t
	 z+VpqZchILk1cABaPqfKoOyTBN2Ux88IsW0WZQsWhqtTcSKML89TOCo6GTd58O3m6c
	 DH2kC1Pw+lc+egiXN1khGUxWV2DKOsiqtRE3GCAC6ErK52EAToWYaHvJkxGzjvsEAr
	 gYRvs6s96/AHDPsrWl1SZZgkTyGMZVo1iYpV8Ylz8g1HxjABJ+Tge58Q4cxDWzRI/p
	 F/r9unbelbn1FC28uJU1yuqCjXja6wuziD5UwF5Bc7Wrtufcq2prm/Ogjp3q27VT5n
	 dmeu0d2HlR8PQ==
Date: Fri, 21 Nov 2025 02:15:04 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Message-ID: <20251121021504.GE3078357@google.com>
References: <20251120003653.335863-2-ebiggers@kernel.org>
 <20251120003653.335863-1-ebiggers@kernel.org>
 <2534431.1763626496@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2534431.1763626496@warthog.procyon.org.uk>

On Thu, Nov 20, 2025 at 08:14:56AM +0000, David Howells wrote:
> You need to add something like:
> 
> #include <linux/module.h>
> ...
> MODULE_DESCRIPTION("ML-DSA signature verification");
> MODULE_LICENSE("GPL");
> 
> David

Yep.  Sorry, I usually build my test kernels with CONFIG_MODULES=n
because it's easier.

- Eric

