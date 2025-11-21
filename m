Return-Path: <keyrings+bounces-3414-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F77CC7B0BC
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 18:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D9DC84EE012
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 17:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB253344035;
	Fri, 21 Nov 2025 17:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kIGxZxdp"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A952338930;
	Fri, 21 Nov 2025 17:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763745368; cv=none; b=t0lnudqFLoTdQagI/U5dUolxhnDwW79AG6gut5Lbn9NAl4LRraGjf1Fd+vmtkY3dI3/RsbAeDCoSwLRaueTogO9fsFkL+tFCZnCrd6X6iVpzyGU4CxUZbsYrkiH0rqCjLtFna89lMbdMjuiXheJ5NRW8tHZiq9kpQuWVzjx+xpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763745368; c=relaxed/simple;
	bh=5viuxS+I/cjXRipWkU+oShVwBH4G5jomU0gyg8v/XLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/7s06/lFu6Yzias8DsQbzwGYNYoQLFGQu0Yv/L53QLKRV5Z0l+LeY12rq9UnzoQSwknofmw27xueCanSmLCcdSNfIpr/G6Sb1hjpkpmbujoQjA+B7zXyetzTR6OpHb/8gDd6lSePPLhgW5coearOgJ5OLlXLZ+BxUvJvHPzQhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kIGxZxdp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8FA9C4CEF1;
	Fri, 21 Nov 2025 17:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763745367;
	bh=5viuxS+I/cjXRipWkU+oShVwBH4G5jomU0gyg8v/XLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kIGxZxdpWxCPfsq3BQXW6Lf9rIAahY2XiPkAvKlYYxmmGCNQAcSlGljoPlHCG43J+
	 Sw48MvlB0zwIAKQjb7nbk4XlhQCpw/Hmg6Nant+V9Um5JvwfcNrvO8LRQ9kPkEKSpH
	 MljzuBoJxNxFNxeKE62+mHyq9o/j3+zKSO93LjbfFMu/Yw8x+jx1vw1BouaPWnvcgk
	 IqwcVNPDbwX5NvvSXh1Z3Uuj5a3vbwkzCA2txAkbrDQz3gU/WvzV/PEPFhNpFcrChB
	 I+xvTlkE9wGHBvM6dp9rq6ZAa0HpbpF28hzxVidiH1Sk+jjjAdWmlC7bJUEFR2EXSu
	 7zLgJQ7vqeAHQ==
Date: Fri, 21 Nov 2025 09:14:21 -0800
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
Message-ID: <20251121171421.GA1737@sol>
References: <20251121005017.GD3532564@google.com>
 <20251120003653.335863-2-ebiggers@kernel.org>
 <20251120003653.335863-1-ebiggers@kernel.org>
 <2624664.1763646918@warthog.procyon.org.uk>
 <2755899.1763728901@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2755899.1763728901@warthog.procyon.org.uk>

On Fri, Nov 21, 2025 at 12:41:41PM +0000, David Howells wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > On Thu, Nov 20, 2025 at 01:55:18PM +0000, David Howells wrote:
> > > Eric Biggers <ebiggers@kernel.org> wrote:
> > > 
> > > > +	/* Compute d = (c mod 2^32) * (q^-1 mod 2^32). */
> > > > +	s32 d = (s32)c * QINV_MOD_R;
> > > 
> > > Hmmm...  is "(s32)c" actually "(c mod 2^32)"?  Should that be:
> > > 
> > > 	u32 d = (u32)c * QINV_MOD_R;
> > > 
> > > This is followed up by casting 'd' to "s64".  I don't think that should
> > > sign-extend it, but...
> > 
> > It selects the representative in the range [INT32_MIN, INT32_MAX],
> > rather than the representative in the range [0, UINT32_MAX].  The sign
> > extension is intentional.
> 
> I'm concerned about the basis on which it becomes positive or negative.  It
> looks like the sign bit ends up being chosen arbitrarily.

Right, it's unrelated to the sign of the s64 value, unless the s64 value
happens to fit in a s32.  And that's okay: the worst-case analysis,
which considers the largest possible absolute value that can be built
up, assumes the signs happen to match repeatedly.

By the way, lest you think I'd doing anything particularly novel here,
the Dilithium reference code also uses this same (very-nearly-symmetric)
Montgomery reduction formula including the sign extension, where it made
its way into leancrypto and your patchset too.  It also appears in FIPS
204 as Algorithm 49, MontgomeryReduce.  There are other ways to
implement this stuff, but they would be less efficient.

However, unfortunately neither source explains it properly, and they
actually provide incorrect information.  The comment in the reference
code says the the input can be in "-2^{31}Q <= a <= Q*2^31", which isn't
quite correct; the upper bound is actually exclusive.  In my code, I
correctly document the upper bound as being exclusive.

FIPS 204 documents the same incorrect interval, but then sort of gets
around it by only claiming that the output is less than 2q in absolute
value (rather than q) and also by not clarifying whether sign extension
is done.  They may have thought that sign extension shouldn't be done,
as you seem to have thought.  Either way, their explanation is
misleading.  The very-nearly-symmetric version that produces an output
less than q in absolute value is the logical version when working with
signed values, and it seems to be what the Dilithium authors intended.

Anyway, it's clear that my code comments still didn't explain it
properly either, so I'll work on that.

> > > > +		/* Reduce to [0, q), then tmp = w'_1 = UseHint(h, w'_Approx) */
> > > 
> > > Bracket mismatch.  "[0, q]"
> > 
> > It's intentional, since it denotes a mathematical range.  Elsewhere I
> > used the words "the range" explicitly, so I'll add that above too.  (Or
> > maybe reword it differently.)
> 
> I meant you have an opening square bracket and a closing round bracket in
> "[0, q)".

That means the lower end is inclusive and the upper end is exclusive.
We're taking mod q, so we do *not* want q to be included.

I could write it another way that wouldn't assume familiarity with open
interval notation, like [0, q - 1] or 0 <= val < q.

- Eric

