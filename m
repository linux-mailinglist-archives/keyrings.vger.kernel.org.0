Return-Path: <keyrings+bounces-3409-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F3CC76DE7
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 02:37:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76F7B4E1314
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 01:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3F51C7012;
	Fri, 21 Nov 2025 01:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VgtDEhdP"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D266146588;
	Fri, 21 Nov 2025 01:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763689039; cv=none; b=b8EktQCchLbQswPhciuiRhuL6UIyq917Ej6Btu2Ih/XBtF1UEDI8GGcucSJCrkZbDfqeGESZkNuRS0LW9bCWAE9LlFwaJTitSPDPO066wvbFTxUxSYHrh+yWNNHpB18O0Nv41rquG2OKAjYC2g/8wQl9U5QG/EkUr7BHnRwLRww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763689039; c=relaxed/simple;
	bh=ILuB0kKduRZ5ovUrptxKx/1p3/TWhEwxX4pW8HKAZJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJjg2AoXOSseP9e5CJ9Umzn/UJJ6vsoYyj2E8ns7B9WKAYUM7Mf2MXcAIhOmRvUBd3LJ5v+x6UKM00SQPVw++R1jkRHU0spQxzRFCdb++GYZdMTR40KYR/l6LH+6Ap5q2FZrKOk/T0R7bCMlWfs6jrB6lCzmwQ8Jp8T7MwyJT3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VgtDEhdP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D994C4CEF1;
	Fri, 21 Nov 2025 01:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763689038;
	bh=ILuB0kKduRZ5ovUrptxKx/1p3/TWhEwxX4pW8HKAZJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VgtDEhdPDl7a2Ko6n/5mjv4Lsng0PMBXBuWdBLIB1JPkuFWgfQE690VbvsWhF27jF
	 RtdZhPOWzqYX11r7WgjV7yrAuY9LKhtF/qBeIX8p2iGgGXhIUaWciJH69ag59N9Roy
	 gGQsdgfnk93+tOn4t9jJQdOwWfUXKvP2QzQcJF0laG1vF+znZ/3yShyye73fV1odjR
	 b+9mY2rJpjQXcGsZtjAoKkby7HVGQ+OXR34QTKypGeR/7n8RpgB+PEzm1l4k6QVX6R
	 c5Cjwrb8SUERO1+CKGdYhd2dofWNbpnwL1E6IT2dSQ9tXFm+pmZNcoRs719VoyHVR2
	 36eG5LwwTTIWQ==
Date: Fri, 21 Nov 2025 01:37:16 +0000
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
Subject: Re: [PATCH v9 2/9] crypto: Add ML-DSA/Dilithium verify support
Message-ID: <20251121013716.GE3532564@google.com>
References: <20251117145606.2155773-1-dhowells@redhat.com>
 <20251117145606.2155773-3-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117145606.2155773-3-dhowells@redhat.com>

On Mon, Nov 17, 2025 at 02:55:51PM +0000, David Howells wrote:
> +/*
> + * @brief poly_uniform - Sample polynomial with uniformly random coefficients
> + *			 in [0,Q-1] by performing rejection sampling on the
> + *			 output stream of SHAKE128(seed|nonce).
> + *
> + * @param [out] a pointer to output polynomial
> + * @param [in] seed byte array with seed of length DILITHIUM_SEEDBYTES
> + * @param [in] nonce 2-byte nonce
> + */
> +void poly_uniform(poly *a, const uint8_t seed[DILITHIUM_SEEDBYTES],
> +		  __le16 nonce, void *ws_buf)
> +{
> +	struct shake_ctx hash_ctx;
> +	unsigned int i, ctr, off;
> +	unsigned int buflen = POLY_UNIFORM_NBLOCKS * SHAKE128_BLOCK_SIZE;
> +	uint8_t *buf = ws_buf;
> +
> +	shake128_init(&hash_ctx);
> +	shake_update(&hash_ctx, seed, DILITHIUM_SEEDBYTES);
> +	shake_update(&hash_ctx, (uint8_t *)&nonce, sizeof(nonce));
> +	shake_squeeze(&hash_ctx, buf, buflen);
> +
> +	ctr = rej_uniform(a->coeffs, DILITHIUM_N, buf, buflen);
> +
> +	while (ctr < DILITHIUM_N) {
> +		off = buflen % 3;
> +		for (i = 0; i < off; ++i)
> +			buf[i] = buf[buflen - off + i];
> +
> +		shake_squeeze(&hash_ctx, buf + off, SHAKE128_BLOCK_SIZE);
> +		buflen = DILITHIUM_SEEDBYTES + off;
> +		ctr += rej_uniform(a->coeffs + ctr, DILITHIUM_N - ctr, buf,
> +				   buflen);
> +	}
> +
> +	shake_zeroize_ctx(&hash_ctx);
> +}

By the way, the above has a bug.  In the second and later squeezes, it
squeezes SHAKE128_BLOCK_SIZE (168) bytes, but then it uses only the
first DILITHIUM_SEEDBYTES (32) bytes.

Now, that 32 is on top of the 840-byte first squeeze, so there are 872
correct bytes which is enough for 290 samples.  So an incorrect matrix
would be generated only if more than 290 samples happen to be required
to get the 256 coefficients.  q / 2^23 = ~99.9% of coefficients are
accepted, so that number of rejections would be pretty unlikely.

Still, it's a bug.  Anyway, we're not going to use this code (we'll use
my code that does this correctly and in a simpler way), but I thought
I'd point it out so that Stephan can fix it.  This seems to be a
"leancrypto" specific bug.

Note: this feedback should not be taken as implying that I've reviewed
the entire 4800 lines of code.  I just happened to notice this.

- Eric

