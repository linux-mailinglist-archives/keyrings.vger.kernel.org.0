Return-Path: <keyrings+bounces-3039-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFDDB8B09E
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 21:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1105D5A4159
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 19:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A8A3271470;
	Fri, 19 Sep 2025 19:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNanpnCj"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B82264636;
	Fri, 19 Sep 2025 19:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758308661; cv=none; b=MBE9quc8XjfP5oTSdV/7FRjWayzSqKX2fyzVSeQwWhcC4EPFE7fyZh/UOcJIrLhspQ6/HUsZEeyKzGcQ/7bpdnHjZ4lN+D6C8LtmKlQ8UEynhaWNJ/6wU3rmhuM5xTXBZG93M77wuKv4ZuO5x/kl5v7UL6rfuJskRxa9iNELA5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758308661; c=relaxed/simple;
	bh=+1gH9nh7Z9jLWMfLfJ0dorAYo0y8h0IdTCU2qgAMylM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swYlnnjAWyF5694egKSZ4wSAr88mRhcR1oDB0/lv29QFfynEG+CLV3lHsC+yVWc8ilyxk3QH6tsEg8YDm+u6DF3CX0gNTODj6sf/zXAzEpgxyKU2jS33lYR1OzMUijaltrfOxwL6ZUwYZGxgGt+BCJHVf88DLeED5NXVM3MSFD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNanpnCj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86C1C4CEF0;
	Fri, 19 Sep 2025 19:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758308658;
	bh=+1gH9nh7Z9jLWMfLfJ0dorAYo0y8h0IdTCU2qgAMylM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oNanpnCjSjsll5K2MuYanlRd4lQmwPAdpDsKOByL4FDhlwNKLVMWRpEMQ8JwfHYzQ
	 EbRS5CEdk1MKvwQS4YWvyNe5I4QwimcJsNv2MfIZtIKna3+FtziWMzz4P1AQiuIAQr
	 mN1BEDVpW6rSeBcWeaXgk2z9TmJr62oMLPGsFBAgShUSKOYJpkTWbcUahsgI55KPyy
	 ghL13KQIKGbyjfUTSnfLUwRiN2Epqhd75pjPC1uPVV5WaZdC0Oem/coNbupssSoXnU
	 QfTQt3uEaVbyv9WKfn2cmLbDgEwNjPlS63rwKHU4viKw7D+OgSNTvYPCIDADeWN/aB
	 ZxLbcQrzXQHCg==
Date: Fri, 19 Sep 2025 14:04:13 -0500
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>, Simo Sorce <simo@redhat.com>,
	linux-crypto@vger.kernel.org, linux-s390@vger.kernel.org,
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384,
 SHA-512, SHAKE128, SHAKE256
Message-ID: <20250919190413.GA2249@quark>
References: <3936580.1758299519@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3936580.1758299519@warthog.procyon.org.uk>

On Fri, Sep 19, 2025 at 05:31:59PM +0100, David Howells wrote:
> Add SHA3, providing SHA3-224, SHA3-256, SHA3-384, SHA-512, SHAKE128 and
> SHAKE256 to lib/crypto.
> 
> The state array handling is simplified from what's in crypto/sha3_generic.c
> by keeping the state array (a u64[25]) in LE form and byteswapping all the
> entries before and after applying the keccak function on a BE system.  This
> means no byteswapping is required when XOR'ing data into the state array or
> when extracting the digest.  Further, this is a no-op on LE systems.
> 
> Also:
> 
>  - Perform a multistage shake256 hash check in the module initialisation.
> 
>  - Add kunit tests for each algorithm based on the gen-hash-testvecs.
> 
>  - The conflicting static s390x crypto function names are renamed to have
>    an s390_ prefix.
> 
>  - gen-hash-testvecs.py had to be modified to be able to generate SHAKE
>    hashes because Python's hashlib requires the output digest size
>    supplying for those two algorithms as they produce arbitrary length
>    digests.
> 
> Notes:
> 
>  (1) I've left hooks in sha3.c for asm-optimised variants, but as I don't
>      entirely know what those might look like, not having implemented any,
>      the hooks' usability is uncertain.
> 
>  (2) The SHAKE algorithms will be required for ML-DSA.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Eric Biggers <ebiggers@kernel.org>
> cc: Jason A. Donenfeld <Jason@zx2c4.com>
> cc: Ard Biesheuvel <ardb@kernel.org>
> cc: Harald Freudenberger <freude@linux.ibm.com>
> cc: Holger Dengler <dengler@linux.ibm.com>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: Stephan Mueller <smueller@chronox.de>
> cc: linux-crypto@vger.kernel.org
> cc: linux-s390@vger.kernel.org
> ---    
>  Changes
>  =======
>  v2)
>   - Simplify the endianness handling.
>  
>   - Rename sha3_final() to sha3_squeeze() and don't clear the context at the
>     end as it's permitted to continue calling sha3_final() to extract
>     continuations of the digest (needed by ML-DSA).
>  
>   - Don't reapply the end marker to the hash state in continuation
>     sha3_squeeze() unless sha3_update() gets called again (needed by
>     ML-DSA).
>  
>   - Give sha3_squeeze() the amount of digest to produce as a parameter
>     rather than using ctx->digest_size and don't return the amount digested.
>  
>   - Reimplement sha3_final() as a wrapper around sha3_squeeze() that
>     extracts ctx->digest_size amount of digest and then zeroes out the
>     context.  The latter is necessary to avoid upsetting
>     hash-test-template.h.
>  
>   - Provide a sha3_reinit() function to clear the state, but to leave the
>     parameters that indicate the hash properties unaffected, allowing for
>     reuse.
>  
>   - Provide a sha3_set_digestsize() function to change the size of the
>     digest to be extracted by sha3_final().  sha3_squeeze() takes a
>     parameter for this instead.
>  
>   - Don't pass the digest size as a parameter to shake128/256_init() but
>     rather default to 128/256 bits as per the function name.
>  
>   - Provide a sha3_clear() function to zero out the context.
> 
>  arch/s390/crypto/sha3_256_s390.c          |   26 -
>  include/crypto/sha3.h                     |  160 +++++++-
>  lib/crypto/Kconfig                        |    7 
>  lib/crypto/Makefile                       |    6 
>  lib/crypto/sha3.c                         |  597 ++++++++++++++++++++++++++++++
>  lib/crypto/tests/Kconfig                  |   12 
>  lib/crypto/tests/Makefile                 |    7 
>  lib/crypto/tests/sha3_224_kunit.c         |   32 +
>  lib/crypto/tests/sha3_224_testvecs.h      |  231 +++++++++++
>  lib/crypto/tests/sha3_256_kunit.c         |   32 +
>  lib/crypto/tests/sha3_256_testvecs.h      |  231 +++++++++++
>  lib/crypto/tests/sha3_384_kunit.c         |   32 +
>  lib/crypto/tests/sha3_384_testvecs.h      |  281 ++++++++++++++
>  lib/crypto/tests/sha3_512_kunit.c         |   32 +
>  lib/crypto/tests/sha3_512_testvecs.h      |  331 ++++++++++++++++
>  lib/crypto/tests/sha3_shake128_kunit.c    |   37 +
>  lib/crypto/tests/sha3_shake128_testvecs.h |  181 +++++++++
>  lib/crypto/tests/sha3_shake256_kunit.c    |   37 +
>  lib/crypto/tests/sha3_shake256_testvecs.h |  231 +++++++++++
>  scripts/crypto/gen-hash-testvecs.py       |    8 
>  20 files changed, 2495 insertions(+), 16 deletions(-)

Thanks for working on this!  Some preliminary comments (it will take a
few days for me to find time to fully review this):

This should be based on libcrypto-next.  And as with any kernel patch,
it should include a base-commit so that people know where it applies to.

This should be split into three patches: (1) the arch/s390/ changes, (2)
adding the library functions themselves, and (3) adding the tests.

We'll also need to integrate the existing arch-optimized SHA-3 code, and
reimplement the SHA-3 crypto_shash algorithms on top of the library.
Let me know whether you're planning to do that to.  If not, I can do it.

In kerneldoc comments, please make it clear that lengths are measured in
bytes, and that the functions can be called in any context.

The testing situation looks odd.  This patch adds six KUnit test suites:
one for each of the SHA-3 algorithms.  But they only include the
hash-test-template.h test cases, and they don't test the unique behavior
of SHAKE.  The KUnit tests need to fully test the library.

I see you also have a test in sha3_mod_init(), which doesn't make sense.
The tests should be in the KUnit test suite(s).  If you intended for the
sha3_mod_init() test to be a FIPS pre-operational self-test, then (1) it
would first need to be confirmed with the people doing FIPS
certifications that a FIPS pre-operational self-test is actually
necessary here, (2) it would need to be fixed to actually fulfill the
requirements for that type of test such as panicing the kernel on
failure, and (3) it would need to come in its own patch with its own
explanation.  But, unless you are sure you actually need the FIPS test,
just omit it out for now and focus on the real tests.

I also think that splitting the SHA-3 tests into six KUnit test suites
is awkward.  I know I did something similar for SHA-2, but it made more
sense for SHA-2 because (1) there are only four SHA-2 variants, (2)
SHA-256 and SHA-512 don't share any code, and (3) there wasn't anything
more to add on top of hash-test-template.h.  In contrast, SHA-3 has six
variants, which all share most of their code, and there will need to be
SHA-3 specific tests (for the XOFs).

I think what I'd recommend is creating a single sha3_kunit test suite.
Make it instantiate hash-test-template.h once to test one of the
algorithms, maybe SHA3-256.  Then add test cases (that is, additional
KUnit test cases in the same KUnit test suite) that cover the code
specific to the other variants, including the XOFs.

- Eric

