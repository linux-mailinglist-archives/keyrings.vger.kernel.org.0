Return-Path: <keyrings+bounces-3407-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F75C76B56
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 01:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8F7A435662D
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 00:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AD0D282EB;
	Fri, 21 Nov 2025 00:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MamHEi2R"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE99476;
	Fri, 21 Nov 2025 00:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763683786; cv=none; b=DDlwmdOCv77TiHFrKCBjHCPCsjiJugXs4bZfZzRjCzGpmPA/GmhnPI/Dv3X0rwHONMcXL2A9d612V27ZQKsPnQ75HzUDl+PtEA4bLDG+ugfjYaT0bLzvulw0ZgjEYSYSu/RID9cJLYGZW6nSDD0dQkTLrH0WaDQHxwt9KrA+/sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763683786; c=relaxed/simple;
	bh=qJeYy15vtPqwGsQU7p8Rd2ERq3apxfUHdVQWfByJmq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F2I1yKQGjWRDI4bYjBPOokZ9TwZlI7DSmac56pywR9iFkCSaf63ZPuzKf1JNPuclF79rWsT3zUwafbnMBNTvw6PcjXslz+xiJPt2KgxNXC98Lxhh+Z2MLK2nm09hp3E/X1iBES8X62YeTd6QrsWS6X1BSiIoMw3g+nN9hSYpmx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MamHEi2R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59316C116B1;
	Fri, 21 Nov 2025 00:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763683786;
	bh=qJeYy15vtPqwGsQU7p8Rd2ERq3apxfUHdVQWfByJmq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MamHEi2Rl38tQKhP8eR9ILjZS5faQFVPLDCaWuUsDLHVS635HCGlXP5t/uSD6EIce
	 SJ821npDyBxe0z37ff+oVrk5ueu3ToNIxeP8KHqRO291C2hVzTAp0Gp9LSPUAeFFeW
	 yN4zBubioiDKrUgBVdjXwIxmGLk1Mb5R3Jlav753lpqguVjAZU9H8xOjKYi31yM/Hl
	 Bj//uThepUxWTY7jOdDPKzaWSGQUO5Yttzw4pGTA8v+99Y/etqH7p9m8Xn4YPVPQUk
	 NmfWKnP/4Vi8c6gzcx2xp2i/7q28bK2WjVwWziHTvGCYpJKy7BpDsDRt2P4VuDIcsW
	 YlGRdwylMPLXQ==
Date: Fri, 21 Nov 2025 00:09:43 +0000
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
Message-ID: <20251121000943.GC3532564@google.com>
References: <20251120003653.335863-2-ebiggers@kernel.org>
 <20251120003653.335863-1-ebiggers@kernel.org>
 <2590973.1763629800@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2590973.1763629800@warthog.procyon.org.uk>

On Thu, Nov 20, 2025 at 09:10:00AM +0000, David Howells wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> >   - Is about 600 lines of source code instead of 4800.
> 
> There's less shareable code for other algos that I'm sure people are going to
> ask for, but that's probably fine.

The "advanced" verification features that people could conceivably want
in the future (public key preloading, nonempty contexts, HashML-DSA,
external mu, incremental message hashing) would all be fairly
straightforward to add, in the event that that they ever become needed.

Signing support would of course be challenging.  But that's expected,
and we should try to keep that out of the kernel anyway.

> >   - Generates about 4 KB of object code instead of 28 KB.
> >   - Uses 9-13 KB of memory to verify a signature instead of 31-84 KB.
> 
> That's definitely good.
> 
> >   - Is 3-5% faster, depending on the ML-DSA parameter set.
> 
> That's not quite what I see.  For Leancrypto:
> 
>     # benchmark_mldsa44: 8672 ops/s
>     # benchmark_mldsa65: 5470 ops/s
>     # benchmark_mldsa87: 3350 ops/s
> 
> For your implementation:
> 
>     # benchmark_mldsa44: 8707 ops/s
>     # benchmark_mldsa65: 5423 ops/s
>     # benchmark_mldsa87: 3352 ops/s
> 
> This may reflect differences in CPU (mine's an i3-4170).
> 
> The numbers are pretty stable with the cpu frequency governor set to
> performance and without rebooting betweentimes.
> 
> Interesting that your mldsa44 is consistently faster, but your mldsa65 is
> consistently slower.  mldsa87 is consistently about the same.
> 
> I don't think the time differences are particularly significant.

Sure, I had just tested one CPU.  Slightly different results on
different CPUs are expected.  It's also expected that the ops/s for
verification in a loop is still in roughly the same ballpark as your
integration of leancrypto (or the Dilithium reference code which
leancrypto seems to be based on, for that matter).  There aren't too
many ways to implement the most time-consuming parts.  Generally,
arch-optimized code would be needed to do significantly better.

Of course, the greatly reduced icache and dcache usage is much more
important for performance.  But that doesn't show up in the "just verify
the same signature in a loop repeatedly" benchmark.

I'll clarify that part of the commit message accordingly.

- Eric

