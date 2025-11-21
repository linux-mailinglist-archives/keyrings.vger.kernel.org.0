Return-Path: <keyrings+bounces-3408-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D2FC76CCE
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 01:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 0149428A0E
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 00:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D66D26D4C1;
	Fri, 21 Nov 2025 00:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atggcTSO"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4B2214A8B;
	Fri, 21 Nov 2025 00:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763686220; cv=none; b=kDDPN/DVV64+JhIG8e38xXCTrtsL+ws7tk74R1YG5JSRjF6W2egVV6gQ3halqZvdbnw1nzIT3mWagXAmy4vhBYdbqMhxvWmEK3yKAnBoy/ec+113PdqhW5+CGdvcY4eNxh/4gBLx6BMmJN9Xj2Z2GTvvDJCZQg+LFBFDzL9OrQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763686220; c=relaxed/simple;
	bh=Nq9D8cA2BbUDDoPKU9XGaoHwh7jpwNq770cJAHnySpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jrbMUj6JTIbOjNB4PDRp3W2XJlaH21uuK51kD9MMpIg7eEQ/Um/IwfcULCuQvNiwNnb5j/OP9kVkSdmqwvdRPhKlDbckbtLiZF/OaBEjn17oEtcrLJyMQ3UotXCm04X2g1NpxGJbNFptVpqxhzK1UEyVBkQ5oLijikT7fiLEO/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atggcTSO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EB3C4CEF1;
	Fri, 21 Nov 2025 00:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763686219;
	bh=Nq9D8cA2BbUDDoPKU9XGaoHwh7jpwNq770cJAHnySpU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=atggcTSOkLBmeYnkoGoSPlqX5/UZ4OO5IfzsDZ8SlbAyFazv42pIW6/U/cqLb1Eqg
	 vONrzpUkfp6y+zE/0EIf2sM2Ig6QxY8u3spZILmlREZJ/711/odLm+2VZTKIqoaBnN
	 a43eckylHcRwwsFT959Keam2tts+uhy+nfZzFJoOOZgwGzFuHQW1CM3stFlwh1PgWh
	 0AlToawQtQ0mAAH7/Xp+zidNfHgwg/LqoU4rzpLzEPnXvkG5VT8zIUPVYU+L965bR+
	 aCdYxLZLbyfw1JFXhR2nE7RiBQQOdXwPJzxFiLJi1Bd/fh6Kotsoc6KGWG9WumRpRT
	 PxYRh3vkvIpVg==
Date: Fri, 21 Nov 2025 00:50:17 +0000
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
Message-ID: <20251121005017.GD3532564@google.com>
References: <20251120003653.335863-2-ebiggers@kernel.org>
 <20251120003653.335863-1-ebiggers@kernel.org>
 <2624664.1763646918@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2624664.1763646918@warthog.procyon.org.uk>

On Thu, Nov 20, 2025 at 01:55:18PM +0000, David Howells wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > +	/* Compute d = (c mod 2^32) * (q^-1 mod 2^32). */
> > +	s32 d = (s32)c * QINV_MOD_R;
> 
> Hmmm...  is "(s32)c" actually "(c mod 2^32)"?  Should that be:
> 
> 	u32 d = (u32)c * QINV_MOD_R;
> 
> This is followed up by casting 'd' to "s64".  I don't think that should
> sign-extend it, but...

It selects the representative in the range [INT32_MIN, INT32_MAX],
rather than the representative in the range [0, UINT32_MAX].  The sign
extension is intentional.  This makes the reduction more symmetric so
that the range of supported unreduced products is roughly symmetric.
I'll update the comments to clarify this.

> > +	for (int m = 0, len = 128; len >= 1; len /= 2) {
> 
> Can you put "int m = 0" outside of the for-statement?  I know putting it
> inside saves a line or two, but 'm' is not the loop counter - which it seems
> like it should be by virtue of being listed first.
> 
> > +	for (int m = 256, len = 1; len < 256; len *= 2) {
> 
> Ditto.

Sure.

> 
> > +static const u8 *decode_t1_elem(struct mldsa_ring_elem *out,
> > +				const u8 *t1_encoded)
> 
> I think this is (more or less) pkDecode()?  Can you put something like:
> 
>   * Decode the vector 't1' from the public key.
>   * Reference: FIPS 204 Algorithm 23, sigDecode.
> 
> in the comment before it?

Sure.

> > +/*
> > + * Use @seed to generate a ring element @c with coefficients in {-1, 0, 1},
> > + * exactly @tau of them nonzero.  Reference: FIPS 204 Algorithm 29, SampleInBall
> > + */
> > +static void sample_in_ball(struct mldsa_ring_elem *c, const u8 *seed,
> > +			   size_t seed_len, int tau, struct shake_ctx *shake)
> 
> Should "seed" actually be labelled "rho"?  I know a seed is what it is, but
> the algo description has a different label - and the caller passes it ctilde,
> not rho:-/.

FIPS 204 Algorithm 29 SampleInBall uses the variable rho for the seed,
while also calling it a "seed" in the descriptive text.  However,
elsewhere rho refers specifically to the public key's random seed.  I
think just calling it "seed" makes sense here.

> > +	u8 (*h)[N]; /* The signer's hint vector, length k */
> > +	h = (u8 (*)[N])&ws->z[l];
> 
> C is weird sometimes.

We could make it a 'u8 *', but then we'd have to use array indices like
h[i*k + j] rather than h[i][j].  May be worth it anyway, to avoid the
slightly-unusual syntax.

> > +		/* Reduce to [0, q), then tmp = w'_1 = UseHint(h, w'_Approx) */
> 
> Bracket mismatch.  "[0, q]"

It's intentional, since it denotes a mathematical range.  Elsewhere I
used the words "the range" explicitly, so I'll add that above too.  (Or
maybe reword it differently.)

> 
> > +		/* w1Encode(w'_1) */
> > +		w1_pos = 0;
> > ...
> 
> Given you put the decode functions into helpers, don't you want to do that
> with this?

Sure, I'll move the w1Encode part into a helper function.

> > +	if (memcmp(ws->ctildeprime, ctilde, params->ctilde_len) != 0)
> > +		return -EBADMSG;
> 
> Actually, this should return -EKEYREJECTED, not -EBADMSG.

Who/what decided that?  A lot of the crypto code uses -EBADMSG already.
crypto_aead uses it, for example.

> I guess you don't need to use crypto_memneq() as timing doesn't matter.

Correct.

> The maths look okay, I think.  You can add:
> 
> 	Reviewed-by: David Howells <dhowells@redhat.com>

Thanks,

- Eric

