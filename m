Return-Path: <keyrings+bounces-3368-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E54BC6543B
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 17:55:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A8E894E9E0F
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 16:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F3922877C2;
	Mon, 17 Nov 2025 16:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nnKDcFT9"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5092C0F8F;
	Mon, 17 Nov 2025 16:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763398351; cv=none; b=EQ2u4susuqA/MILKrd/1Bz/aH+o4829kFAbEnSRMAbN9nmTeu2UKqLVd6pRW085GZ5ws9pUrL2O2XDR520X+i3bGqWPTg+A1mGiwNfLCoEGsldWtQt5yOqWcbH7IZbKsGPuTGPSwOm3qqxkpn5yToELqZTyFGTb9qOEVWLlvTWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763398351; c=relaxed/simple;
	bh=gcvUtZeqbS09AGZ6c1cgh/msOkfCj35dkoodZpbTvww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t7u7Va+/g0ysKL0ddddoKWlxzqPVlKOpwTxauOrBC/lsT2Pbhkley6tvYuEQVwqPOz1VDj/1cwG6XB/NuSob+FSqlQbfe54suJ4lXeJAHwxvgpPReZK2cVNRoZos3hA1dkW4zrrJPXT/zlBcL9J3HhareaNxDT4XP5f0DvYE5jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nnKDcFT9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F689C19423;
	Mon, 17 Nov 2025 16:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763398350;
	bh=gcvUtZeqbS09AGZ6c1cgh/msOkfCj35dkoodZpbTvww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nnKDcFT9Mqmu4v/tJqXL6iD/rv4Yv0Ma96+7y/2IE2CkveQl9xHefSFCxaORZ4/iy
	 lywhjMYzC/4JwA77O+2vDOs5FG3VettKztd3wkSD/jJQde+xerk/fUeXWTKstau6Rx
	 2H+lpHBJWdlfHSwgTHgJolsAHubVczhGPZeQF1pNegPELtGOWuQFgfH3PtQmUUpeFW
	 rMual399t6OfBO7kY69akS0zmYikkcsOKkDTqICX6yjhpBvAUEd1hBiUFrSvbvpPLS
	 OWM8Lu7Ba0epvoThxmw+nkU139+ciH1q4Ng3ct79Cq1ecUsvdhl0xptvqSISuzZy0O
	 SZ6ovPau1la5g==
Date: Mon, 17 Nov 2025 08:50:47 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/9] crypto: Add support for shake256 through
 crypto_shash
Message-ID: <20251117165047.GA1584@sol>
References: <20251117145606.2155773-1-dhowells@redhat.com>
 <20251117145606.2155773-2-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117145606.2155773-2-dhowells@redhat.com>

On Mon, Nov 17, 2025 at 02:55:50PM +0000, David Howells wrote:
> Add shake256 support to the SHA-3 crypto_sig module so that ML-DSA can use
> it.

Why?  Not only does this patch not expose SHAKE256 support correctly,
the ML-DSA code just accesses SHAKE256 via the library API, not
crypto_shash.  So this seems unnecessary.

- Eric

