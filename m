Return-Path: <keyrings+bounces-3054-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DBCB8E41E
	for <lists+keyrings@lfdr.de>; Sun, 21 Sep 2025 21:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9C70189926F
	for <lists+keyrings@lfdr.de>; Sun, 21 Sep 2025 19:29:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E0E23D29A;
	Sun, 21 Sep 2025 19:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBJMfwlQ"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F17175D53;
	Sun, 21 Sep 2025 19:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758482954; cv=none; b=HAr/k89GWCl8yNMD5LttBC4sPIzoQR9JsuWqII2gSEA/usXEpLtGWepTt7WlBIBqW+nUCiuXfOJg74AuQYZS3J7U5Xy1fDM1auBdo2tCZ79RgnSe7z4EPvt+dRUoYVYr3QgYxnOzYdVqoYgt14K0QXJL2APBGFvwaCKnQk/I4Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758482954; c=relaxed/simple;
	bh=QpQXR6w4LbeL2wmKIzL9ZqGSFfN5M9GXE2S2LP2JffM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUHWaSdDN5A2mIaArYx9MZfvvIj9ldZ80xBOjvVCFdbZBSPDMkHsTUFATcdUyhQ98MqarK8FGYijChgfrzL7yVB6rxVplGNzYNXO1EqaBz6LcRaCCKq1oOE6mr3IEJy+ohcye1TUEAUE8vZK3LrWJFzUPwJG98pv/aNH0ougdv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBJMfwlQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9042C4CEE7;
	Sun, 21 Sep 2025 19:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758482953;
	bh=QpQXR6w4LbeL2wmKIzL9ZqGSFfN5M9GXE2S2LP2JffM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBJMfwlQjhfBScU+ycmHnGGpajcZcauMM6o8j0wZ8QJNr89c57AyIA2bhjgV52NeZ
	 BiUusToChmqJabgDGV601GVUkzM/vzXwXX6axvmHG4ivYa/vj88o/8D+stYD/2PbXn
	 DEoGkW60SbTqdulfayT7GF9+n7AHZwWRwPoIuQCjydqoHhCf4opys8omOUD/wyaFxZ
	 4TeDLNpdWNor0ltKmKt6wBXulEgH6yRM13lz8a2F7bSbtiKJMvjRAtWfxo0Y0sXOwB
	 EogLmp2aGqsLibqzcuRKJ2BSPUeKF1yTzt9fWyyQxyjOJnSqXCZ9Tiyd+F4QMbf8bv
	 mbXSt8eKdeDzw==
Date: Sun, 21 Sep 2025 12:27:57 -0700
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
Message-ID: <20250921192757.GB22468@sol>
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

Some more comments:

On Fri, Sep 19, 2025 at 05:31:59PM +0100, David Howells wrote:
> +#if 0
> +static void sha3_dump_state(const struct sha3_ctx *ctx, const char *prefix)
> +{
> +	const __be64 *p = (const __be64 *)ctx->state.st;
> +
> +	for (int i = 0; i < 6; i++) {
> +		pr_info("SHA3 %s %016llx %016llx %016llx %016llx\n",
> +			prefix,
> +			be64_to_cpu(p[0]), be64_to_cpu(p[1]),
> +			be64_to_cpu(p[2]), be64_to_cpu(p[3]));
> +		p += 4;
> +	}
> +	pr_info("SHA3 %s %016llx\n", prefix, be64_to_cpu(p[0]));
> +}
> +#endif

Unused code should not be added.

> +/*
> + * On some 32-bit architectures (h8300), GCC ends up using
> + * over 1 KB of stack if we inline the round calculation into the loop
> + * in keccakf(). On the other hand, on 64-bit architectures with plenty
> + * of [64-bit wide] general purpose registers, not inlining it severely
> + * hurts performance. So let's use 64-bitness as a heuristic to decide
> + * whether to inline or not.
> + */

The above comment doesn't match the code.  "keccakf()" should be
sha3_keccakf_generic().

> +/* update the state with given number of rounds */
> +
> +static SHA3_INLINE void keccakf_round(u64 st[25])

The above comment doesn't match the code.  keccakf_round() does only one
round.

Also, the parameter should be strongly typed: 'struct sha3_state *'
Likewise in all the other functions that take the raw u64 array.

> +static void sha3_be_swap_state(u64 st[25])
> +{
> +#ifdef __BIG_ENDIAN
> +	for (int i = 0; i < 25; i++)
> +		st[i] = __builtin_bswap64(st[i]);
> +#endif
> +}

As noted by the kernel test robot, this doesn't compile on all
architectures.  How about:

	for (size_t i = 0; i < ARRAY_SIZE(state->st); i++)
		cpu_to_le64s(&state->st[i]);

There also should be a comment somewhere that describes what's going on
with the state endianness.  I.e., on big endian CPUs we keep the state
words as little endian to make XOR'ing data into them easier, and we
swap them to native endianness temporarily when doing the permutation.

> +/*
> + * Perform the mixing step.
> + */
> +static void sha3_keccakf_generic(u64 st[25])
> +{
> +	int round;
> +
> +	sha3_be_swap_state(st);
> +
> +	for (round = 0; round < KECCAK_ROUNDS; round++) {
> +		keccakf_round(st);
> +		/* Iota */
> +		st[0] ^= keccakf_rndc[round];
> +	}

In the spec, "Iota" is part of the round.  Having it be separate from
keccakf_round() in the code is confusing.

> +/**
> + * sha3_update() - Update a SHA3 context of any type with message data
> + * @ctx: the context to update; must have been initialized
> + * @data: the message data
> + * @len: the data length in bytes
> + *
> + * This can be called any number of times to perform the "keccak sponge
> + * absorbing" phase.
> + *
> + * It may be called again after @sha3_final() has been called to add more data
> + * to the hash.  Note, however, that finalising a hash modifies the state, so
> + * {update,final,update} is not equivalent to {update,update}.
> + */

Would you mind putting all the kerneldoc comments for the public API in
the .h file, similar to sha1.h and sha2.h?  Then they'll all be in a
consistent place, and they won't have to be moved around each time we
change functions to inline functions or vice versa.

> +void sha3_update(struct sha3_ctx *ctx, const u8 *data, unsigned int len)
> +{
> +	unsigned int partial = ctx->partial;
> +	unsigned int bsize = ctx->block_size;
> +
> +	if (partial && partial + len >= bsize) {
> +		sha3_absorb_xorle(ctx, data, partial, bsize - partial);
> +		len  -= bsize - partial;
> +		data += bsize - partial;
> +		sha3_keccakf(ctx->state.st);
> +		ctx->partial = 0;
> +	}
> +
> +	if (len >= bsize) {
> +		size_t nblocks = len / bsize;
> +
> +		if (nblocks) {
> +			sha3_absorb_blocks(ctx, data, nblocks);
> +			data += nblocks * bsize;
> +			len  -= nblocks * bsize;
> +		}

The 'if (nblocks)' check above is unnecessary, since 'len >= bsize'
implies there is at least one block.

> +/**
> + * sha3_squeeze() - Finalize a SHA3 digest of any type and extract the digest
> + * @ctx: the context to finalize; must have been initialized
> + * @out: Where to write the resulting message digest
> + * @out_size: The amount of digest to extract to @out
> + *
> + * Finish the computation of a SHA3 message digest of any type and perform the
> + * "Keccak sponge squeezing" phase.  @out_size amount of digest is written to
> + * @out buffer.
> + *
> + * This may be called multiple times to extract continuations of the digest.
> + * Note that, for example, two consecutive 16-byte squeezes laid end-to-end
> + * will yield the same as one 32-byte squeeze.
> + *
> + * The state will have the end marker added again if any new updates have
> + * happened since the last time it was squeezed.
> + */

First, this patch's proposed API is error-prone due to the weak typing
that allows mixing steps of different algorithms together.  For example,
users could initialize a sha3_ctx with sha3_256_init() and then squeeze
an arbitrary amount from it, incorrectly treating it as a XOF.  It would
be worth considering separating the APIs for the different algorithms
that are part of SHA-3, similar to what I did with SHA-224 and SHA-256.
(They would of course still share code internally, just like SHA-2.)

Second, the support for update() + squeeze() + update() + squeeze()
seems to be trying to achieve something that is not defined in the SHA-3
spec.  Could you elaborate on what it is meant to be doing, and why it's
here?  According to the spec, the XOFs SHAKE128 and SHAKE256 actually
just take a single message as their input.

One might think the above sequence would compute SHAKE*() on the first
message as well as SHAKE*() of the two messages concatenated together.
But that's not what you've made it do, as you've made it apply padding
after *both* messages.  So, then one might think that it's meant to be a
XOF on the sequence of messages, built on top of SHAKE*().  But it's not
that either, since the way that you've proposed to format the sequence
of messages into a longer message isn't injective.  So, I can't figure
out why you're supporting this usage and what it is meant to be doing.

> +void sha3_squeeze(struct sha3_ctx *ctx, u8 *out, size_t out_size)
> +{
> +	unsigned int squeeze_offset = ctx->squeeze_offset;
> +	unsigned int digest_size = out_size;

The digest_size variable is unnecessary, and it's also misleading since
this function is used both for the digests and the XOFs.  Just use the
already-existing 'out_size' variable.

> +	unsigned int bsize = ctx->block_size;
> +	u8 *p = (u8 *)ctx->state.st, end_marker = 0x80;
> +
> +	if (!ctx->end_marked) {
> +		sha3_absorb_xorle(ctx, &ctx->padding, ctx->partial, 1);
> +		sha3_absorb_xorle(ctx, &end_marker, bsize - 1, 1);
> +		ctx->end_marked = true;
> +	}
> +
> +	for (;;) {
> +		if (squeeze_offset == 0) {
> +			sha3_keccakf(ctx->state.st);
> +		}
> +
> +		unsigned int part = umin(digest_size, bsize - squeeze_offset);
> +
> +		if (part > 0) {
> +			memcpy(out, p + squeeze_offset, part);
> +			digest_size -= part;
> +			out += part;
> +			squeeze_offset += part;
> +		}
> +		if (!digest_size)
> +			break;
> +		if (squeeze_offset >= bsize)
> +			squeeze_offset -= bsize;

The last two lines could just set squeeze_offset to 0 unconditionally,
given that the block must have been filled.

> +/**
> + * sha3_init() - Initialize a SHA3 context for a new message
> + * @ctx: the context to initialize
> + *
> + * Initialize a SHA3 context for any size of SHA-3 digest.
> + */
> +void sha3_init(struct sha3_ctx *ctx)
> +{
> +	memset(ctx, 0, sizeof(*ctx));
> +}
> +EXPORT_SYMBOL_GPL(sha3_init);

Here's another place where the proposed API invites misuse.  If someone
calls sha3_init() followed by sha3_update(), which would be a very
intuitive thing to do, there will be an infinite loop, because the
block_size wouldn't have been initialized.  sha3_init() is actually an
internal implementation detail of the real initialization functions.

I recommend just removing it, and making the real initialization
functions use designated initializers to assign to the whole sha3_ctx.

> +/**
> + * shake128() - Convenience wrapper to digest a simple buffer as SHAKE128
> + * @in: The data to be digested
> + * @in_len: The amount of data to be digested
> + * @out: The buffer into which the digest will be stored
> + * @out_len: The size of the digest desired (variable length)
> + */

Shouldn't the term "digest" be avoided when talking about the output
from a XOF, to avoid confusion with traditional hash functions?

> +/*
> + * Do a quick test using SHAKE256 and a 200 byte digest.
> + */
> +static const u8 sha3_sample1[] __initconst =
> +	"The quick red fox jumped over the lazy brown dog!\n"
> +	"The quick red fox jumped over the lazy brown dog!\n"
> +	"The quick red fox jumped over the lazy brown dog!\n"
> +	"The quick red fox jumped over the lazy brown dog!\n";
> +static const u8 sha3_sample2[] __initconst =
> +	"hello\n";
> +static const u8 sha3_sample_shake256_200_step1[] __initconst = {
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guard */
> +	0xab, 0x06, 0xd4, 0xf9, 0x8b, 0xfd, 0xb2, 0xc4, 0xfe, 0xf1, 0xcc, 0xe2,
> +	0x40, 0x45, 0xdd, 0x15, 0xcb, 0xdd, 0x02, 0x8d, 0xb7, 0x9f, 0x1e, 0x67,
> +	0xd6, 0x7f, 0x98, 0x5e, 0x1b, 0x19, 0xf8, 0x01, 0x43, 0x82, 0xcb, 0xd8,
> +	0x5d, 0x21, 0x64, 0xa8, 0x80, 0xc9, 0x22, 0xe5, 0x07, 0xaf, 0xe2, 0x5d,
> +	0xcd, 0xc6, 0x23, 0x36, 0x2b, 0xc7, 0xc7, 0x7d, 0x09, 0x9d, 0x68, 0x05,
> +	0xe4, 0x62, 0x63, 0x1b, 0x67, 0xbc, 0xf8, 0x95, 0x07, 0xd2, 0xe4, 0xd0,
> +	0xba, 0xa2, 0x67, 0xf5, 0xe3, 0x15, 0xbc, 0x85, 0xa1, 0x50, 0xd6, 0x6f,
> +	0x6f, 0xd4, 0x54, 0x4c, 0x3f, 0x4f, 0xe5, 0x1f, 0xb7, 0x00, 0x27, 0xfc,
> +	0x15, 0x33, 0xc2, 0xf9, 0xb3, 0x4b, 0x9e, 0x81, 0xe5, 0x96, 0xbe, 0x05,
> +	0x6c, 0xac, 0xf9, 0x9f, 0x65, 0x36, 0xbb, 0x11, 0x47, 0x6d, 0xf6, 0x8f,
> +	0x9f, 0xa2, 0x77, 0x37, 0x3b, 0x18, 0x77, 0xcf, 0x65, 0xc5, 0xa1, 0x7e,
> +	0x2c, 0x0e, 0x71, 0xf0, 0x4d, 0x18, 0x67, 0xb9, 0xc4, 0x8c, 0x64, 0x3b,
> +	0x4b, 0x45, 0xea, 0x16, 0xb2, 0x4a, 0xc5, 0xf5, 0x85, 0xdc, 0xd2, 0xd9,
> +	0x13, 0x77, 0xb3, 0x19, 0xd9, 0x8c, 0x9f, 0x28, 0xe7, 0x64, 0x91, 0x0f,
> +	0x6f, 0x32, 0xbf, 0xa8, 0xa8, 0xa3, 0xff, 0x99, 0x0e, 0x0b, 0x62, 0x50,
> +	0xf8, 0x3a, 0xc2, 0xf5, 0x98, 0x21, 0xeb, 0x9d, 0xe8, 0x45, 0xf4, 0x46,
> +	0x1e, 0x8b, 0xbd, 0x10, 0x59, 0x2c, 0x87, 0xe2,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard */
> +};
> +static const u8 sha3_sample_shake256_200_step2[] __initconst = {
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guard */
> +	0x5b, 0x43, 0x98, 0x3a, 0x4a, 0x5f, 0xa9, 0x14, 0xa5, 0x98, 0x26, 0xe2,
> +	0xed, 0x45, 0x6a, 0x1d, 0x61, 0x24, 0xf5, 0x0c, 0xef, 0xda, 0xc2, 0x8a,
> +	0x30, 0x0e, 0x03, 0xe5, 0x67, 0xdd, 0x7e, 0x9f, 0xa0, 0xa4, 0x07, 0x63,
> +	0xdc, 0x6b, 0x7e, 0xbd, 0xd7, 0x7d, 0x7a, 0x6d, 0x55, 0x03, 0x02, 0x18,
> +	0x12, 0x5d, 0xf9, 0x21, 0xc8, 0x78, 0x69, 0x7c, 0x64, 0x39, 0xfd, 0xf4,
> +	0xd6, 0x06, 0xe6, 0xd8, 0x6f, 0xaa, 0x04, 0x5b, 0x40, 0xf3, 0x96, 0xb2,
> +	0xb5, 0xd0, 0xb5, 0x43, 0x50, 0x9c, 0x08, 0xd6, 0x54, 0x8e, 0x8c, 0x85,
> +	0xc2, 0x34, 0xce, 0x0c, 0x24, 0x31, 0x6f, 0x49, 0xec, 0x3d, 0x13, 0x1f,
> +	0x36, 0x0a, 0x14, 0xa6, 0x5d, 0x51, 0x9a, 0x90, 0x1f, 0xf5, 0x1f, 0x61,
> +	0xb7, 0x65, 0x64, 0x2a, 0x00, 0x07, 0xe4, 0x56, 0x80, 0x5c, 0xfa, 0x03,
> +	0xc4, 0x97, 0xc1, 0x09, 0x35, 0xa2, 0x55, 0x72, 0x28, 0xe5, 0xb6, 0xef,
> +	0x8e, 0xf4, 0xc2, 0x82, 0x22, 0xc7, 0x23, 0xac, 0xcb, 0xc1, 0x03, 0x52,
> +	0x46, 0x9c, 0x17, 0xe0, 0xa3, 0x1b, 0x59, 0x9f, 0x01, 0xef, 0x5b, 0x46,
> +	0xb2, 0x4b, 0x98, 0x6b, 0x32, 0x52, 0xe3, 0x29, 0x36, 0x8f, 0x66, 0x98,
> +	0x5f, 0x6a, 0xa2, 0xf4, 0x68, 0x13, 0x5c, 0x94, 0xe4, 0x22, 0xb6, 0x83,
> +	0xa0, 0xd7, 0xa3, 0xda, 0xa4, 0x84, 0x0c, 0xf6, 0xa2, 0xa4, 0x0e, 0x08,
> +	0x6d, 0x2b, 0xd2, 0x31, 0x77, 0x36, 0xae, 0x53,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard */
> +};
> +
> +static const u8 sha3_sample_shake256_200_step3[] __initconst = {
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guard */
> +	0x61, 0x0a, 0x5e, 0xdf, 0xf1, 0x29, 0xae, 0x82, 0xab, 0x57, 0xa8, 0x1b,
> +	0x4e, 0x7c, 0xb9, 0x14, 0x4a, 0x32, 0x7d, 0x82, 0xdc, 0xc2, 0x48, 0x1c,
> +	0xf4, 0xa4, 0x18, 0xd5, 0x97, 0x35, 0x9a, 0x25, 0x0f, 0x5f, 0x1b, 0x04,
> +	0xf1, 0x09, 0x2a, 0xe8, 0xb6, 0xa7, 0xe1, 0x90, 0xb6, 0x4d, 0x96, 0xf1,
> +	0x7d, 0x4d, 0xb0, 0x4f, 0x44, 0xaf, 0x16, 0x4e, 0x63, 0xce, 0x46, 0x4c,
> +	0x76, 0x18, 0xbe, 0x5f, 0xf4, 0x35, 0xef, 0x1f, 0xb1, 0x97, 0x94, 0x70,
> +	0x96, 0x2f, 0xa2, 0x1b, 0xd6, 0x02, 0x51, 0x88, 0x33, 0x2b, 0x54, 0xb9,
> +	0x44, 0xb4, 0xab, 0x6f, 0xeb, 0xfc, 0xe5, 0xee, 0xe3, 0x77, 0x91, 0xed,
> +	0x3a, 0x4e, 0x60, 0x00, 0x44, 0xd1, 0xc7, 0x4a, 0x54, 0x77, 0x71, 0x95,
> +	0x53, 0x88, 0x6b, 0x1e, 0x0f, 0xfd, 0x62, 0x02, 0xa7, 0x8e, 0x05, 0x6d,
> +	0x21, 0x8f, 0x97, 0x20, 0xa0, 0xd7, 0xcf, 0xd8, 0x54, 0xec, 0x50, 0x72,
> +	0x07, 0xb8, 0x9c, 0x76, 0xdb, 0x12, 0x00, 0xd2, 0x2e, 0x93, 0xee, 0xb9,
> +	0x6a, 0x28, 0x5a, 0x46, 0x87, 0x90, 0xd5, 0xd6, 0x1d, 0x14, 0x0e, 0x16,
> +	0xf1, 0x2c, 0xed, 0x7f, 0x28, 0x34, 0x8c, 0x2b, 0x96, 0x03, 0x80, 0x80,
> +	0x9f, 0xc8, 0xf4, 0x2c, 0x53, 0xe0, 0x4b, 0x7b, 0xf4, 0x19, 0x8a, 0xc5,
> +	0xb3, 0x21, 0x17, 0xce, 0xdb, 0xbf, 0xb7, 0x6b, 0x9a, 0xb5, 0x19, 0x89,
> +	0x4c, 0x54, 0x28, 0x32, 0xe6, 0x85, 0xfa, 0x8f,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard */
> +};
> +static const u8 sha3_sample_shake256_200_step4[] __initconst = {
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guard */
> +	0x83, 0x99, 0xc6, 0xda, 0x75, 0x79, 0x8e, 0x47, 0x06, 0xad, 0x19, 0xcb,
> +	0x47, 0x61, 0x25, 0x6a, 0x8c, 0xa4, 0x7e, 0x74, 0xba, 0xbd, 0xda, 0xb6,
> +	0x3b, 0x08, 0x48, 0x0f, 0x55, 0xd5, 0x85, 0x78, 0x5b, 0xd4, 0x31, 0xcb,
> +	0x59, 0xff, 0x93, 0xff, 0xf6, 0x65, 0x4c, 0xf7, 0x6e, 0x4b, 0xef, 0x4d,
> +	0x0e, 0x43, 0x8a, 0x2b, 0xed, 0x10, 0x26, 0x68, 0x12, 0x63, 0xed, 0x7a,
> +	0x38, 0x0a, 0xa5, 0xd0, 0x79, 0x26, 0x75, 0xef, 0xce, 0xad, 0x6c, 0x12,
> +	0x52, 0x33, 0xec, 0xe8, 0xe1, 0x89, 0x2f, 0x0f, 0x29, 0xb0, 0xf6, 0xff,
> +	0x54, 0x11, 0xb2, 0x6b, 0x22, 0xb3, 0x48, 0x01, 0xa5, 0xcf, 0x29, 0xb7,
> +	0xaf, 0x8c, 0xec, 0x1e, 0x75, 0x3e, 0xff, 0xfb, 0x31, 0xb8, 0xf6, 0xab,
> +	0xae, 0xac, 0xec, 0xed, 0x27, 0x0b, 0x79, 0x10, 0x4f, 0x87, 0xe8, 0x43,
> +	0x28, 0x94, 0x09, 0xca, 0x48, 0x63, 0x65, 0x61, 0x86, 0x83, 0x33, 0x30,
> +	0x02, 0x6d, 0xf4, 0xef, 0x3c, 0x1a, 0x47, 0x8a, 0x25, 0x90, 0x31, 0x39,
> +	0x95, 0x1d, 0x6f, 0x11, 0x5c, 0x0c, 0x72, 0xe6, 0x1b, 0xe1, 0x60, 0x45,
> +	0x79, 0x89, 0x39, 0x48, 0x31, 0x4c, 0xc4, 0xd1, 0x08, 0x12, 0xf3, 0x5f,
> +	0x84, 0x8c, 0x86, 0xba, 0xe5, 0xf1, 0x24, 0x61, 0x2f, 0xef, 0x17, 0x16,
> +	0x4a, 0x29, 0xc0, 0xc6, 0x38, 0x47, 0x3a, 0x11, 0xc5, 0x7d, 0x62, 0x85,
> +	0x9b, 0x18, 0x92, 0x4c, 0x12, 0x92, 0x9c, 0x0b,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard */
> +};
> +
> +static void __init sha3_check_digest(const u8 *digest, const u8 *sample_digest,
> +				    int digest_len)
> +{
> +	if (memcmp(digest, sample_digest, digest_len) != 0) {
> +		pr_err("SHAKE256(200) failed\n");
> +		for (int i = 0; i < digest_len;) {
> +			int part = min(digest_len - i, 32);
> +
> +			pr_err("%*phN\n", part, digest + i);
> +			i += part;
> +		}
> +	}
> +}

If a test is included at all here, it should be simpler, e.g. just
compute the SHA3-256 of some short hardcoded message.  That will be
sufficient to test the implementation of the Keccak permutation.  The
real tests will be in the KUnit suite, as discussed previously.

- Eric

