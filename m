Return-Path: <keyrings+bounces-3481-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30198C953A3
	for <lists+keyrings@lfdr.de>; Sun, 30 Nov 2025 20:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBA2D3A1924
	for <lists+keyrings@lfdr.de>; Sun, 30 Nov 2025 19:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D615727CB02;
	Sun, 30 Nov 2025 19:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mu3gT8+5"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08E913A3ED;
	Sun, 30 Nov 2025 19:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764529674; cv=none; b=D07G4o2qr3aUX1wpgPmKMETaAjy3jIF+Z0pgww+wr5ahAYecXTdWTfwX3ZSNfHTXI+5+XID92aFPsE2P/VTvCefxmaKQrhmewJqblBWUzw7Qvtg93dWwWxkZvhkZ+PaCwHdAUBVy4F+RGD3Rsu1OC2VNNCN5JP5qE97Jr7lOJ24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764529674; c=relaxed/simple;
	bh=LyS8TZOVxr4rQNbi7Nu//tsFFGALTqeYPgQi1HdllXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EJ4vpttMClkVfGBYZvbdAQ7MJDPe59cyH1DDQ9V5BaM93d20JAZEi3pHKzaa3Dv7picy+dwHRJ1g7baXk9HgLmBxyQF5D1f6MaDdXqVyQwehhFL87YQQ/qTfurnUTmdGrmeDzmPbK7LCiqZPMy3U0wqDlDiyYpL5S2UaHhGeXS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mu3gT8+5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CC40C4CEF8;
	Sun, 30 Nov 2025 19:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764529672;
	bh=LyS8TZOVxr4rQNbi7Nu//tsFFGALTqeYPgQi1HdllXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mu3gT8+5+SDi6FjE/H1gPtOCd8cxyTAEO79V0X8CT9vzGKWi021+V/mOYnf+nw3QP
	 ka6mIVjnAY7ZyP70tvBkk00LNLymkK5iRzrmsZuD8T1GIJ1GuYNT9FRCkfXyG9K4YJ
	 x4+zc1uPS2CF9bx1a5iZR7mj3Jbis0YJvqxS217rWBLrwVWwkiGNqnFBz6YZjg0UMX
	 tpypL0Ydl/nglOZeSiqvIUcBvphrcgLYQYLNIoqfpBF1aDVWSGQ0RXdB3k4M2fUfks
	 LGQy1LIQsltE708qponAn84WMw7wcacKHSz0V0qE25xpGUR3x4y60XF/geHDLRXh4F
	 9TdjduUaks+Dw==
Date: Sun, 30 Nov 2025 11:06:01 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Becker, Hanno" <beckphan@amazon.co.uk>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	"keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"matthias@kannwischer.eu" <matthias@kannwischer.eu>
Subject: Re: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Message-ID: <20251130190601.GC1395@sol>
References: <20251120003653.335863-1-ebiggers@kernel.org>
 <20251120003653.335863-2-ebiggers@kernel.org>
 <A7135B59-BAB5-451E-AD71-971F828054F0@amazon.co.uk>
 <20251130001911.GA12664@sol>
 <aSuYUDdlZvZrXuUo@zx2c4.com>
 <1CB2640E-B918-4C90-933D-61D5B1954E6C@amazon.co.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1CB2640E-B918-4C90-933D-61D5B1954E6C@amazon.co.uk>

On Sun, Nov 30, 2025 at 07:15:22AM +0000, Becker, Hanno wrote:
> > - Vector registers (e.g. AVX) can be used in the kernel only in some
> >  contexts, and only when they are explicitly saved and restored.  So
> >  we have to do our own integration of any code that uses them anyway.
> >  There is also more overhead to each vector-optimized function than
> >  there is in userspace, so very fine-grained optimization (e.g. as is
> >  used in the Dilithium reference code) doesn't work too well.
> 
> That's very useful, can you say more? Would one want some sort of
> configurable preamble/postamble in the top-level API which takes care of
> the necessary save/restore logic?
> 
> What is the per-function overhead?

It varies by architecture, but usually it looks something like:

    if (irq_fpu_usable()) {
            kernel_fpu_begin();
            avx_function();
            kernel_fpu_end();
    } else {
            generic_function();
    }

The overhead varies significantly by CPU, kernel config options, and
whether it's the first use since the current task last entered the
kernel.  But it can be up to a few hundred cycles.

> > Note that the kernel already has optimized Keccak code.  That already
> > covers the most performance-critical part of ML-DSA.
> 
> No, this would need _batched_ Keccak. An ML-DSA implementation using
> only 1x-Keccak will never have competitive performance. See
> https://github.com/pq-code-package/mldsa-native/pull/754 for the
> performance loss from using unbatched Keccak only, on a variety of
> platforms; it's >2x for some.
> 
> In turn, if you want to integrate batched Keccak -- but perhaps only on
> some platforms? -- you need to rewrite your entire code to make use of
> it. That's not a simple change, and part of what I mean when I say that
> the challenges are just deferred. Note that the official reference and
> AVX2 implementations duck this problem by duplicating the code and
> adjusting it, rather than looking for a common structure that could host
> both 'plain' and batched Keccak. I assume the amount of code duplication
> this brings would be unacceptable.

At least in my code, only the matrix expansion code would need to change
to take advantage of interleaved Keccak.  The fact that other
implementations apparently are having trouble with this actually
suggests to me that perhaps they're not good implementations to use.

Anyway, no one has said they want this particular optimization in the
kernel anyway.  And hopefully the future is native Keccak support
anyway; s390 already has it, and (at least) RISC-V is working on it.

- Eric

