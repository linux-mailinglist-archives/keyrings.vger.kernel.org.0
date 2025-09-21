Return-Path: <keyrings+bounces-3055-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8068AB8E61C
	for <lists+keyrings@lfdr.de>; Sun, 21 Sep 2025 23:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C31F1894AC3
	for <lists+keyrings@lfdr.de>; Sun, 21 Sep 2025 21:19:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47FD2286410;
	Sun, 21 Sep 2025 21:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FB/iuT7g"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1782258ED5
	for <keyrings@vger.kernel.org>; Sun, 21 Sep 2025 21:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758489530; cv=none; b=anG4uUOWalC1S54DH4Ej6GvesARWbk5DsRJMilDZAUckSiDVI2Fyfne8AuFphBHj3hjDSO4hD7P8evEWYcwozZFkW3ySGl9DRGL+iMAchhpgp32ZQUjugUSWNrjGyxnGd0FetakKGSH42uxB6UHR8gRJGZTRUvO9codlQqGdL5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758489530; c=relaxed/simple;
	bh=F3V6phVlqiJpPjZVlJn6ktDCbdth6m+NuBIwTzfMHug=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=WPndUUbBV8Q/RgIpDsK/+Qe+6wjqjdKfJJ8S1G41pyo7aisr5+Y7Bs6GVh58o4tyaB21/ZOxS/SoWCfC3WA6sY9Xook16sxN9xshn4BwQ+r1sOTLo1xKR9DtjRN5kd7uS6xIPHne2M0mxAD6AFEk0TXhLOLrRsvZ7GK6RcWG+IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FB/iuT7g; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758489526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qbRPIXwisXnLZm5sZTSNIa7kRk3ZMMRYzA1ZmKfs6xY=;
	b=FB/iuT7gu++8bazxMV6uPAXYv6BvSQrW9pmuNM7CagsZLT+zEd34xN53wUvrzxHQZlKRRK
	PNXnEiFVxEFfHIQSmTxJ53gwvp+fISBgJTveq81zI3ucPJAf3qZCPinWjbk9yYbueXfiz/
	Hf1zo711uYqwD+TnY4HDpsjqdWrcTgc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-206-mubll4vwMeOaITLE80GOSQ-1; Sun,
 21 Sep 2025 17:18:44 -0400
X-MC-Unique: mubll4vwMeOaITLE80GOSQ-1
X-Mimecast-MFC-AGG-ID: mubll4vwMeOaITLE80GOSQ_1758489522
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A8378180047F;
	Sun, 21 Sep 2025 21:18:41 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.155])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8953C18004A3;
	Sun, 21 Sep 2025 21:18:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250921192757.GB22468@sol>
References: <20250921192757.GB22468@sol> <3936580.1758299519@warthog.procyon.org.uk>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, "Jason A. Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Harald Freudenberger <freude@linux.ibm.com>,
    Holger Dengler <dengler@linux.ibm.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Stephan Mueller <smueller@chronox.de>, Simo Sorce <simo@redhat.com>,
    linux-crypto@vger.kernel.org, linux-s390@vger.kernel.org,
    keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA-512, SHAKE128, SHAKE256
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <38636.1758489516.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Sun, 21 Sep 2025 22:18:36 +0100
Message-ID: <38637.1758489516@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Eric Biggers <ebiggers@kernel.org> wrote:

> > +/* update the state with given number of rounds */
> > +
> > +static SHA3_INLINE void keccakf_round(u64 st[25])
> =

> The above comment doesn't match the code.  keccakf_round() does only one
> round.

This is exactly as in crypto/sha3_generic.c.  You may want to fix that als=
o.

> > +static void sha3_be_swap_state(u64 st[25])
> > +{
> > +#ifdef __BIG_ENDIAN
> > +	for (int i =3D 0; i < 25; i++)
> > +		st[i] =3D __builtin_bswap64(st[i]);
> > +#endif
> > +}
> =

> As noted by the kernel test robot, this doesn't compile on all
> architectures.  How about:
> =

> 	for (size_t i =3D 0; i < ARRAY_SIZE(state->st); i++)
> 		cpu_to_le64s(&state->st[i]);

Um.  Maybe.  If I'm going to do that I should probably do:

 	for (size_t i =3D 0; i < ARRAY_SIZE(state->st); i++)
 		le64_to_cpus(&state->st[i]);

on the way in and:

 	for (size_t i =3D 0; i < ARRAY_SIZE(state->st); i++)
 		cpu_to_le64s(&state->st[i]);

on the way out.  You never know if it's PDP-11 Linux, right? ;-)

> > +/*
> > + * Perform the mixing step.
> > + */
> > +static void sha3_keccakf_generic(u64 st[25])
> > +{
> > +	int round;
> > +
> > +	sha3_be_swap_state(st);
> > +
> > +	for (round =3D 0; round < KECCAK_ROUNDS; round++) {
> > +		keccakf_round(st);
> > +		/* Iota */
> > +		st[0] ^=3D keccakf_rndc[round];
> > +	}
> =

> In the spec, "Iota" is part of the round.  Having it be separate from
> keccakf_round() in the code is confusing.

It's as crypto/sha3_generic.c.

> Would you mind putting all the kerneldoc comments for the public API in
> the .h file, similar to sha1.h and sha2.h?  Then they'll all be in a
> consistent place, and they won't have to be moved around each time we
> change functions to inline functions or vice versa.

Yes.  I know include/crypto/ does it, but that really makes the header fil=
es
suck as the doc-to-code ratio is too heavily in the doc's favour.

Actually, this should be done properly and I'll add an API doc to
Documention/crypto/.

> > +	if (len >=3D bsize) {
> > +		size_t nblocks =3D len / bsize;
> > +
> > +		if (nblocks) {
> > +			sha3_absorb_blocks(ctx, data, nblocks);
> > +			data +=3D nblocks * bsize;
> > +			len  -=3D nblocks * bsize;
> > +		}
> =

> The 'if (nblocks)' check above is unnecessary, since 'len >=3D bsize'
> implies there is at least one block.

Fair point.

> > +/**
> > + * sha3_squeeze() - Finalize a SHA3 digest of any type and extract th=
e digest
> > + * @ctx: the context to finalize; must have been initialized
> > + * @out: Where to write the resulting message digest
> > + * @out_size: The amount of digest to extract to @out
> > + *
> > + * Finish the computation of a SHA3 message digest of any type and pe=
rform the
> > + * "Keccak sponge squeezing" phase.  @out_size amount of digest is wr=
itten to
> > + * @out buffer.
> > + *
> > + * This may be called multiple times to extract continuations of the =
digest.
> > + * Note that, for example, two consecutive 16-byte squeezes laid end-=
to-end
> > + * will yield the same as one 32-byte squeeze.
> > + *
> > + * The state will have the end marker added again if any new updates =
have
> > + * happened since the last time it was squeezed.
> > + */
> =

> First, this patch's proposed API is error-prone due to the weak typing
> that allows mixing steps of different algorithms together.  For example,
> users could initialize a sha3_ctx with sha3_256_init() and then squeeze
> an arbitrary amount from it, incorrectly treating it as a XOF.  It would
> be worth considering separating the APIs for the different algorithms
> that are part of SHA-3, similar to what I did with SHA-224 and SHA-256.
> (They would of course still share code internally, just like SHA-2.)

I disagree.  You're adding excessive complexity.  I would be more inclined=
 to
agree if the thing might crash because you used the wrong thing.  That sai=
d,
sha3_final() uses the digestsize set by sha3_whatever_init(), which could
cause a problem, so I think it's better on balance to just add an extra
parameter to sha3_final() to say how much digest you want and ditch
ctx->digest_size.

> Second, the support for update() + squeeze() + update() + squeeze()
> seems to be trying to achieve something that is not defined in the SHA-3
> spec.  Could you elaborate on what it is meant to be doing, and why it's
> here?  According to the spec, the XOFs SHAKE128 and SHAKE256 actually
> just take a single message as their input.
>
> One might think the above sequence would compute SHAKE*() on the first
> message as well as SHAKE*() of the two messages concatenated together.
> But that's not what you've made it do, as you've made it apply padding
> after *both* messages.  So, then one might think that it's meant to be a
> XOF on the sequence of messages, built on top of SHAKE*().  But it's not
> that either, since the way that you've proposed to format the sequence
> of messages into a longer message isn't injective.  So, I can't figure
> out why you're supporting this usage and what it is meant to be doing.

I can't speak to that except to say that ML-DSA does exactly this as far a=
s I
can tell.

> > +void sha3_squeeze(struct sha3_ctx *ctx, u8 *out, size_t out_size)
> > +{
> > +	unsigned int squeeze_offset =3D ctx->squeeze_offset;
> > +	unsigned int digest_size =3D out_size;
> =

> The digest_size variable is unnecessary, and it's also misleading since
> this function is used both for the digests and the XOFs.  Just use the
> already-existing 'out_size' variable.

Fair point.  I was setting digest_size to ctx->cigest_size if out_size was=
 0
and then returning it, but I'm no longer doing that.

> > +	unsigned int bsize =3D ctx->block_size;
> > +	u8 *p =3D (u8 *)ctx->state.st, end_marker =3D 0x80;
> > +
> > +	if (!ctx->end_marked) {
> > +		sha3_absorb_xorle(ctx, &ctx->padding, ctx->partial, 1);
> > +		sha3_absorb_xorle(ctx, &end_marker, bsize - 1, 1);
> > +		ctx->end_marked =3D true;
> > +	}
> > +
> > +	for (;;) {
> > +		if (squeeze_offset =3D=3D 0) {
> > +			sha3_keccakf(ctx->state.st);
> > +		}
> > +
> > +		unsigned int part =3D umin(digest_size, bsize - squeeze_offset);
> > +
> > +		if (part > 0) {
> > +			memcpy(out, p + squeeze_offset, part);
> > +			digest_size -=3D part;
> > +			out +=3D part;
> > +			squeeze_offset +=3D part;
> > +		}
> > +		if (!digest_size)
> > +			break;
> > +		if (squeeze_offset >=3D bsize)
> > +			squeeze_offset -=3D bsize;
> =

> The last two lines could just set squeeze_offset to 0 unconditionally,
> given that the block must have been filled.

Also a good point.  I'm sure I tried that at some point, but it didn't wor=
k.
I can't see why that should be the case though, and it should be an error =
if
squeeze_offset > bsize.

> > +/**
> > + * sha3_init() - Initialize a SHA3 context for a new message
> > + * @ctx: the context to initialize
> > + *
> > + * Initialize a SHA3 context for any size of SHA-3 digest.
> > + */
> > +void sha3_init(struct sha3_ctx *ctx)
> > +{
> > +	memset(ctx, 0, sizeof(*ctx));
> > +}
> > +EXPORT_SYMBOL_GPL(sha3_init);
> =

> Here's another place where the proposed API invites misuse.  If someone
> calls sha3_init() followed by sha3_update(), which would be a very
> intuitive thing to do, there will be an infinite loop, because the
> block_size wouldn't have been initialized.  sha3_init() is actually an
> internal implementation detail of the real initialization functions.
> =

> I recommend just removing it, and making the real initialization
> functions use designated initializers to assign to the whole sha3_ctx.

Okay, that's reasonable.

> > +/**
> > + * shake128() - Convenience wrapper to digest a simple buffer as SHAK=
E128
> > + * @in: The data to be digested
> > + * @in_len: The amount of data to be digested
> > + * @out: The buffer into which the digest will be stored
> > + * @out_len: The size of the digest desired (variable length)
> > + */
> =

> Shouldn't the term "digest" be avoided when talking about the output
> from a XOF, to avoid confusion with traditional hash functions?

No idea.  There's not any real programmatic difference except for the padd=
ing
byte.  I can change it to "output" if it makes you happy.

> > +/*
> > + * Do a quick test using SHAKE256 and a 200 byte digest.
> > + */
> > +static const u8 sha3_sample1[] __initconst =3D
> > +	"The quick red fox jumped over the lazy brown dog!\n"
> > +	"The quick red fox jumped over the lazy brown dog!\n"
> > +	"The quick red fox jumped over the lazy brown dog!\n"
> > +	"The quick red fox jumped over the lazy brown dog!\n";
> > +static const u8 sha3_sample2[] __initconst =3D
> > +	"hello\n";
> > +static const u8 sha3_sample_shake256_200_step1[] __initconst =3D {
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guar=
d */
> > +	0xab, 0x06, 0xd4, 0xf9, 0x8b, 0xfd, 0xb2, 0xc4, 0xfe, 0xf1, 0xcc, 0x=
e2,
> > +	0x40, 0x45, 0xdd, 0x15, 0xcb, 0xdd, 0x02, 0x8d, 0xb7, 0x9f, 0x1e, 0x=
67,
> > +	0xd6, 0x7f, 0x98, 0x5e, 0x1b, 0x19, 0xf8, 0x01, 0x43, 0x82, 0xcb, 0x=
d8,
> > +	0x5d, 0x21, 0x64, 0xa8, 0x80, 0xc9, 0x22, 0xe5, 0x07, 0xaf, 0xe2, 0x=
5d,
> > +	0xcd, 0xc6, 0x23, 0x36, 0x2b, 0xc7, 0xc7, 0x7d, 0x09, 0x9d, 0x68, 0x=
05,
> > +	0xe4, 0x62, 0x63, 0x1b, 0x67, 0xbc, 0xf8, 0x95, 0x07, 0xd2, 0xe4, 0x=
d0,
> > +	0xba, 0xa2, 0x67, 0xf5, 0xe3, 0x15, 0xbc, 0x85, 0xa1, 0x50, 0xd6, 0x=
6f,
> > +	0x6f, 0xd4, 0x54, 0x4c, 0x3f, 0x4f, 0xe5, 0x1f, 0xb7, 0x00, 0x27, 0x=
fc,
> > +	0x15, 0x33, 0xc2, 0xf9, 0xb3, 0x4b, 0x9e, 0x81, 0xe5, 0x96, 0xbe, 0x=
05,
> > +	0x6c, 0xac, 0xf9, 0x9f, 0x65, 0x36, 0xbb, 0x11, 0x47, 0x6d, 0xf6, 0x=
8f,
> > +	0x9f, 0xa2, 0x77, 0x37, 0x3b, 0x18, 0x77, 0xcf, 0x65, 0xc5, 0xa1, 0x=
7e,
> > +	0x2c, 0x0e, 0x71, 0xf0, 0x4d, 0x18, 0x67, 0xb9, 0xc4, 0x8c, 0x64, 0x=
3b,
> > +	0x4b, 0x45, 0xea, 0x16, 0xb2, 0x4a, 0xc5, 0xf5, 0x85, 0xdc, 0xd2, 0x=
d9,
> > +	0x13, 0x77, 0xb3, 0x19, 0xd9, 0x8c, 0x9f, 0x28, 0xe7, 0x64, 0x91, 0x=
0f,
> > +	0x6f, 0x32, 0xbf, 0xa8, 0xa8, 0xa3, 0xff, 0x99, 0x0e, 0x0b, 0x62, 0x=
50,
> > +	0xf8, 0x3a, 0xc2, 0xf5, 0x98, 0x21, 0xeb, 0x9d, 0xe8, 0x45, 0xf4, 0x=
46,
> > +	0x1e, 0x8b, 0xbd, 0x10, 0x59, 0x2c, 0x87, 0xe2,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard=
 */
> > +};
> > +static const u8 sha3_sample_shake256_200_step2[] __initconst =3D {
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guar=
d */
> > +	0x5b, 0x43, 0x98, 0x3a, 0x4a, 0x5f, 0xa9, 0x14, 0xa5, 0x98, 0x26, 0x=
e2,
> > +	0xed, 0x45, 0x6a, 0x1d, 0x61, 0x24, 0xf5, 0x0c, 0xef, 0xda, 0xc2, 0x=
8a,
> > +	0x30, 0x0e, 0x03, 0xe5, 0x67, 0xdd, 0x7e, 0x9f, 0xa0, 0xa4, 0x07, 0x=
63,
> > +	0xdc, 0x6b, 0x7e, 0xbd, 0xd7, 0x7d, 0x7a, 0x6d, 0x55, 0x03, 0x02, 0x=
18,
> > +	0x12, 0x5d, 0xf9, 0x21, 0xc8, 0x78, 0x69, 0x7c, 0x64, 0x39, 0xfd, 0x=
f4,
> > +	0xd6, 0x06, 0xe6, 0xd8, 0x6f, 0xaa, 0x04, 0x5b, 0x40, 0xf3, 0x96, 0x=
b2,
> > +	0xb5, 0xd0, 0xb5, 0x43, 0x50, 0x9c, 0x08, 0xd6, 0x54, 0x8e, 0x8c, 0x=
85,
> > +	0xc2, 0x34, 0xce, 0x0c, 0x24, 0x31, 0x6f, 0x49, 0xec, 0x3d, 0x13, 0x=
1f,
> > +	0x36, 0x0a, 0x14, 0xa6, 0x5d, 0x51, 0x9a, 0x90, 0x1f, 0xf5, 0x1f, 0x=
61,
> > +	0xb7, 0x65, 0x64, 0x2a, 0x00, 0x07, 0xe4, 0x56, 0x80, 0x5c, 0xfa, 0x=
03,
> > +	0xc4, 0x97, 0xc1, 0x09, 0x35, 0xa2, 0x55, 0x72, 0x28, 0xe5, 0xb6, 0x=
ef,
> > +	0x8e, 0xf4, 0xc2, 0x82, 0x22, 0xc7, 0x23, 0xac, 0xcb, 0xc1, 0x03, 0x=
52,
> > +	0x46, 0x9c, 0x17, 0xe0, 0xa3, 0x1b, 0x59, 0x9f, 0x01, 0xef, 0x5b, 0x=
46,
> > +	0xb2, 0x4b, 0x98, 0x6b, 0x32, 0x52, 0xe3, 0x29, 0x36, 0x8f, 0x66, 0x=
98,
> > +	0x5f, 0x6a, 0xa2, 0xf4, 0x68, 0x13, 0x5c, 0x94, 0xe4, 0x22, 0xb6, 0x=
83,
> > +	0xa0, 0xd7, 0xa3, 0xda, 0xa4, 0x84, 0x0c, 0xf6, 0xa2, 0xa4, 0x0e, 0x=
08,
> > +	0x6d, 0x2b, 0xd2, 0x31, 0x77, 0x36, 0xae, 0x53,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard=
 */
> > +};
> > +
> > +static const u8 sha3_sample_shake256_200_step3[] __initconst =3D {
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guar=
d */
> > +	0x61, 0x0a, 0x5e, 0xdf, 0xf1, 0x29, 0xae, 0x82, 0xab, 0x57, 0xa8, 0x=
1b,
> > +	0x4e, 0x7c, 0xb9, 0x14, 0x4a, 0x32, 0x7d, 0x82, 0xdc, 0xc2, 0x48, 0x=
1c,
> > +	0xf4, 0xa4, 0x18, 0xd5, 0x97, 0x35, 0x9a, 0x25, 0x0f, 0x5f, 0x1b, 0x=
04,
> > +	0xf1, 0x09, 0x2a, 0xe8, 0xb6, 0xa7, 0xe1, 0x90, 0xb6, 0x4d, 0x96, 0x=
f1,
> > +	0x7d, 0x4d, 0xb0, 0x4f, 0x44, 0xaf, 0x16, 0x4e, 0x63, 0xce, 0x46, 0x=
4c,
> > +	0x76, 0x18, 0xbe, 0x5f, 0xf4, 0x35, 0xef, 0x1f, 0xb1, 0x97, 0x94, 0x=
70,
> > +	0x96, 0x2f, 0xa2, 0x1b, 0xd6, 0x02, 0x51, 0x88, 0x33, 0x2b, 0x54, 0x=
b9,
> > +	0x44, 0xb4, 0xab, 0x6f, 0xeb, 0xfc, 0xe5, 0xee, 0xe3, 0x77, 0x91, 0x=
ed,
> > +	0x3a, 0x4e, 0x60, 0x00, 0x44, 0xd1, 0xc7, 0x4a, 0x54, 0x77, 0x71, 0x=
95,
> > +	0x53, 0x88, 0x6b, 0x1e, 0x0f, 0xfd, 0x62, 0x02, 0xa7, 0x8e, 0x05, 0x=
6d,
> > +	0x21, 0x8f, 0x97, 0x20, 0xa0, 0xd7, 0xcf, 0xd8, 0x54, 0xec, 0x50, 0x=
72,
> > +	0x07, 0xb8, 0x9c, 0x76, 0xdb, 0x12, 0x00, 0xd2, 0x2e, 0x93, 0xee, 0x=
b9,
> > +	0x6a, 0x28, 0x5a, 0x46, 0x87, 0x90, 0xd5, 0xd6, 0x1d, 0x14, 0x0e, 0x=
16,
> > +	0xf1, 0x2c, 0xed, 0x7f, 0x28, 0x34, 0x8c, 0x2b, 0x96, 0x03, 0x80, 0x=
80,
> > +	0x9f, 0xc8, 0xf4, 0x2c, 0x53, 0xe0, 0x4b, 0x7b, 0xf4, 0x19, 0x8a, 0x=
c5,
> > +	0xb3, 0x21, 0x17, 0xce, 0xdb, 0xbf, 0xb7, 0x6b, 0x9a, 0xb5, 0x19, 0x=
89,
> > +	0x4c, 0x54, 0x28, 0x32, 0xe6, 0x85, 0xfa, 0x8f,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard=
 */
> > +};
> > +static const u8 sha3_sample_shake256_200_step4[] __initconst =3D {
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guar=
d */
> > +	0x83, 0x99, 0xc6, 0xda, 0x75, 0x79, 0x8e, 0x47, 0x06, 0xad, 0x19, 0x=
cb,
> > +	0x47, 0x61, 0x25, 0x6a, 0x8c, 0xa4, 0x7e, 0x74, 0xba, 0xbd, 0xda, 0x=
b6,
> > +	0x3b, 0x08, 0x48, 0x0f, 0x55, 0xd5, 0x85, 0x78, 0x5b, 0xd4, 0x31, 0x=
cb,
> > +	0x59, 0xff, 0x93, 0xff, 0xf6, 0x65, 0x4c, 0xf7, 0x6e, 0x4b, 0xef, 0x=
4d,
> > +	0x0e, 0x43, 0x8a, 0x2b, 0xed, 0x10, 0x26, 0x68, 0x12, 0x63, 0xed, 0x=
7a,
> > +	0x38, 0x0a, 0xa5, 0xd0, 0x79, 0x26, 0x75, 0xef, 0xce, 0xad, 0x6c, 0x=
12,
> > +	0x52, 0x33, 0xec, 0xe8, 0xe1, 0x89, 0x2f, 0x0f, 0x29, 0xb0, 0xf6, 0x=
ff,
> > +	0x54, 0x11, 0xb2, 0x6b, 0x22, 0xb3, 0x48, 0x01, 0xa5, 0xcf, 0x29, 0x=
b7,
> > +	0xaf, 0x8c, 0xec, 0x1e, 0x75, 0x3e, 0xff, 0xfb, 0x31, 0xb8, 0xf6, 0x=
ab,
> > +	0xae, 0xac, 0xec, 0xed, 0x27, 0x0b, 0x79, 0x10, 0x4f, 0x87, 0xe8, 0x=
43,
> > +	0x28, 0x94, 0x09, 0xca, 0x48, 0x63, 0x65, 0x61, 0x86, 0x83, 0x33, 0x=
30,
> > +	0x02, 0x6d, 0xf4, 0xef, 0x3c, 0x1a, 0x47, 0x8a, 0x25, 0x90, 0x31, 0x=
39,
> > +	0x95, 0x1d, 0x6f, 0x11, 0x5c, 0x0c, 0x72, 0xe6, 0x1b, 0xe1, 0x60, 0x=
45,
> > +	0x79, 0x89, 0x39, 0x48, 0x31, 0x4c, 0xc4, 0xd1, 0x08, 0x12, 0xf3, 0x=
5f,
> > +	0x84, 0x8c, 0x86, 0xba, 0xe5, 0xf1, 0x24, 0x61, 0x2f, 0xef, 0x17, 0x=
16,
> > +	0x4a, 0x29, 0xc0, 0xc6, 0x38, 0x47, 0x3a, 0x11, 0xc5, 0x7d, 0x62, 0x=
85,
> > +	0x9b, 0x18, 0x92, 0x4c, 0x12, 0x92, 0x9c, 0x0b,
> > +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard=
 */
> > +};
> > +
> > +static void __init sha3_check_digest(const u8 *digest, const u8 *samp=
le_digest,
> > +				    int digest_len)
> > +{
> > +	if (memcmp(digest, sample_digest, digest_len) !=3D 0) {
> > +		pr_err("SHAKE256(200) failed\n");
> > +		for (int i =3D 0; i < digest_len;) {
> > +			int part =3D min(digest_len - i, 32);
> > +
> > +			pr_err("%*phN\n", part, digest + i);
> > +			i +=3D part;
> > +		}
> > +	}
> > +}
> =

> If a test is included at all here, it should be simpler, e.g. just
> compute the SHA3-256 of some short hardcoded message.  That will be
> sufficient to test the implementation of the Keccak permutation.  The
> real tests will be in the KUnit suite, as discussed previously.

No.  Please stick with the one I have.  It exercises the extended features
used by ML-DSA that will be used for PQ module signing.

David


