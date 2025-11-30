Return-Path: <keyrings+bounces-3478-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 01792C9498F
	for <lists+keyrings@lfdr.de>; Sun, 30 Nov 2025 01:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BB3B64E2A73
	for <lists+keyrings@lfdr.de>; Sun, 30 Nov 2025 00:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC1119DF4D;
	Sun, 30 Nov 2025 00:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5dI8Usz"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9660718FDDB;
	Sun, 30 Nov 2025 00:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764462063; cv=none; b=UY3WNHzfu2Ns41aHgpKiiNncB9Zizy9pgI7K0m90UMpc0D2NaWI3yk8vGeQA85IjDoskU9AaH84Rb9/MpZUmdpLLQV2haObzlMt4JTYWEeScWWSJGoR/RuGjHqlPgqjxMcjXk7xrpkycNLmW1ZySmxTVN1XE2GzW53BobFc2sWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764462063; c=relaxed/simple;
	bh=qZoO4tVhdF3RN8R6/vxK9hC4gIDNIcBABiJYQqxDwkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZraLdYPhtTPhcYbCmhWBsJDvFoB7EcZvc7rKMlQjg+KZCI4li2I672y7nzFhLm3Wsye8SQRiSSDrfa20R5S3dVhujLkA/Xcn+ccVmhowienPjTFdF4KPax709PK+oqxaN6Y0Qxwn+2uJcs/lNEeINE3rlXo7jO4OHQFBzXRCR/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5dI8Usz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9328AC4CEF7;
	Sun, 30 Nov 2025 00:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764462062;
	bh=qZoO4tVhdF3RN8R6/vxK9hC4gIDNIcBABiJYQqxDwkU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5dI8Uszlg35BssPzBCNo9Y34RWp+8R3GR7SKeo2MiuNRxK5Jiy69tEWkH1O/iwoo
	 K28v8wCuHv2q6kHqu5zv8Njp8BW9MA77Jizq2Csmt7AFKg3WtZpkKhbI0rxiJbp/ER
	 pll5yLKGvKzPu4WwHxIvl9ufmzFEF1oUjsB5erGVp1OcRSWGIX9AjcLnvxR4IlxmQA
	 nAEhcQZpFpixnbFIT+jqWMu6gHZBwvtyLZ7PWhf8ZqelUSve6ZdRWYLApVhutbWrwh
	 3totwJsX/BNVtHJwCz0fyfLvBp0iFS5y7OW919Q540ndAHfZ9gFUoSCaG3EKOPMXMS
	 koM/jmcpJLfzA==
Date: Sat, 29 Nov 2025 16:19:11 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: "Becker, Hanno" <beckphan@amazon.co.uk>
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	"keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
	"linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"matthias@kannwischer.eu" <matthias@kannwischer.eu>
Subject: Re: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Message-ID: <20251130001911.GA12664@sol>
References: <20251120003653.335863-1-ebiggers@kernel.org>
 <20251120003653.335863-2-ebiggers@kernel.org>
 <A7135B59-BAB5-451E-AD71-971F828054F0@amazon.co.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A7135B59-BAB5-451E-AD71-971F828054F0@amazon.co.uk>

On Sat, Nov 29, 2025 at 08:00:17PM +0000, Becker, Hanno wrote:
> It looks like this may be close, but for the record:
> 
> The LF has a dedicated project for ML-DSA: https://github.com/pq-code-package/mldsa-native (part of the Post-Quantum Cryptography Alliance). It's derived from the reference implementation and adds automatically verified memory-safety + type-safety (= bounds-tracking) and a uniform backend interface for assembly optimizations; see the README for more details. It's licensed under Apache-2.0 OR MIT OR ISC.
> 
> If you are sure that the kernel will never need sign/keygen support, or support for optimized assembly, the current ad-hoc patch may be fine. Otherwise, the challenges are likely just delayed, e.g. how to safely re-use parts of the current code for the timing-sensitive signing, or in contexts with other bounds assumptions, or how to integrate assembly optimizations. It may not seem so, but this is difficult to get right and where maintainability gets challenging.
> 
> Verification here is a vehicle for maintainability: If you change any arithmetic code -- say you decide to do less modular reduction for performance -- you currently need very careful review that the bounds still check out in the worst case. In mldsa-native, this is re-checked automatically.
> 
> mldsa-native is production-ready and in the process of being integrated into Amazon's AWS-LC crypto library; the sibling-project mlkem-native https://github.com/pq-code-package/mlkem-native already has been. mldsa-native is not yet a drop-in for the kernel, however. At the least, memory usage needs to be brought down and allocation be made flexible. We're working on it, and if the kernel community was interested in it, it'd give impetus to accelerate the work.
> 
> This is just so you're aware. If mldsa-native is of interest, let us know -- it would be great to collaborate across the LF instead of duplicating efforts.
> 
> Thanks,
> Hanno & Matthias (maintainers of mldsa-native)

(Side note: this patch series is up to v2.  See
https://lore.kernel.org/linux-crypto/20251126203517.167040-1-ebiggers@kernel.org/
for the latest version as of this writing)

For context, this is at least the third different userspace project
that's been suggested to borrow ML-DSA code from, and not the first that
is a fork of the Dilithium reference code.

ML-DSA is also just one of dozens of algorithms the kernel supports.  In
none of them has the kernel community been successful with integrating a
project wholesale, vs. just taking individual files.

So while mldsa-native looks like a great project, for the task in
question (adding basic ML-DSA verification support to the kernel) I'm
not sure it brings much new to the table.  Of course, there's also no
corresponding kernel patch that proposes integrating mldsa-native into
the kernel, so it's a bit hypothetical at this point too.  The
leancrypto proposal at least had a patch, so it was more concrete.

I think you may be underestimating how much the requirements of the
kernel differ from userspace.  Consider the following:

- Kernel stack is 8 KB to 16 KB.  mldsa-native's signature verification
  code starts out by allocating ~100KB of memory on the stack.  If that
  code was built into the kernel, it would immediately write out of
  bounds.  Oops.  So much for the formal verification of memory bounds.

- Vector registers (e.g. AVX) can be used in the kernel only in some
  contexts, and only when they are explicitly saved and restored.  So we
  have to do our own integration of any code that uses them anyway.
  There is also more overhead to each vector-optimized function than
  there is in userspace, so very fine-grained optimization (e.g. as is
  used in the Dilithium reference code) doesn't work too well.

- The vector intrinsics like <immintrin.h> can't be used in the kernel,
  as they depend on userspace headers.  Thus, vector instructions can
  generally be used only in assembly code.  I believe this problem is
  solvable with a combination of changes to GCC, clang, and the kernel,
  and I'd like to see that happen.  But someone would need to do it.

Note that the kernel already has optimized Keccak code.  That already
covers the most performance-critical part of ML-DSA.  Besides that part,
I think we're fine with a portable implementation of ML-DSA.  Consider
that that's always been what we've done for RSA, for example.  Signature
verification performance just isn't that important in the kernel.

But even if we decide the kernel needs optimized ML-DSA ring operations
later, I don't think we get any free lunch.  Userspace libraries aren't
directly usable in the kernel anyway, for the reasons I outlined above.
And we can always borrow things piecemeal, as we've always done.

Microbenchmark throughput also isn't everything: memory usage and code
size is very important too, often even more important.  I haven't seen a
proposal that even comes close to my mldsa_verify() on those metrics.

We can't be 100% sure that the kernel will never need ML-DSA signing
support.  But it's not needed now, it's something that architecturally
doesn't make much sense, and we'd prefer to avoid adding it.  We
shouldn't overengineer things around requirements that don't exist.

Anyway, we also aren't stuck with one implementation forever.  If
someone can actually do ML-DSA better, whether that's for
verification-only right now or for everything during a hypothetical
future addition of signing support, we can replace my lib/crypto/mldsa.c
with something else.  *Usually* kernel code evolves incrementally, but
not always.  Especially with the crypto algorithms, there are examples
where we've entirely swapped out an implementation.

- Eric

