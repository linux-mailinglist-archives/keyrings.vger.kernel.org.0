Return-Path: <keyrings+bounces-3435-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 51084C83508
	for <lists+keyrings@lfdr.de>; Tue, 25 Nov 2025 05:12:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E2BEF348F2C
	for <lists+keyrings@lfdr.de>; Tue, 25 Nov 2025 04:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7C227FD59;
	Tue, 25 Nov 2025 04:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7qglHNC"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27915223DD6;
	Tue, 25 Nov 2025 04:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764043960; cv=none; b=DL29tkuFa+haoL56w5p1Z3tgwyq71vxLhXYL3ucQMiWEIRdGkHT6JhHh/AXC7/YyJP5Itj+oOio0WmH7MwZgRz1SbedY65w2XiIC31xijiLEer78jPEtGZk4ex58VXg3Uealu2yiS/npfyaUaLoJrkBVd8rulNjAmbRcQLkLD5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764043960; c=relaxed/simple;
	bh=STJQHSOBK3yqfPlM/sXNDIiTEw+NTeEwuEm+qbxT+3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWXuHHqYBBHByFgBwRHpEPsbevccM+f+F5fkggOFukN6+QypEiFFOtotyjZ32dKuwOoyqpUVKlQ0QpTYD3E57rlhC2UiNdronJ9GzYoSV1f0qj05WL2sNn6z5aDr8Jj/aITanExHeBdnsKubLkndZ4ha6wNShEZwDTpZkJrvZO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7qglHNC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2779CC4CEF1;
	Tue, 25 Nov 2025 04:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764043959;
	bh=STJQHSOBK3yqfPlM/sXNDIiTEw+NTeEwuEm+qbxT+3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7qglHNCuMu9DeRcfozB/MVSS7K5OvPpjcUnUWctBgO3xL7Ayj9QO+252T2wZXEdm
	 YezsTJLqlLJN6Wn9H5w8GdjefmW+DE01q/iiSy4+WoLtsCV6ne3o2qrViI19AcYL3Z
	 +YcH3yM3rnzujo4qGPCOGV4kaDWVhHMogGRNOK2oLeD3meN1sm4Ptx0eiogyMF/4i/
	 LXTp0m2wzJEH7IjVkhnyJf1lskSrXcJ4gBjTmARMSOqGEx7SmcvRg01EnDxil8w90U
	 GWHOjX9wT7YJ/1F0p9z66wYi6qjueD1xZOIWf+ZhClUbZ/caq28laXiNDBBIbchwUx
	 u5JXYpkKRp02g==
Date: Mon, 24 Nov 2025 20:10:50 -0800
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
Message-ID: <20251125041050.GA1608@sol>
References: <20251117145606.2155773-1-dhowells@redhat.com>
 <20251117145606.2155773-3-dhowells@redhat.com>
 <20251121013716.GE3532564@google.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121013716.GE3532564@google.com>

On Fri, Nov 21, 2025 at 01:37:16AM +0000, Eric Biggers wrote:
> On Mon, Nov 17, 2025 at 02:55:51PM +0000, David Howells wrote:
> > +/*
> > + * @brief poly_uniform - Sample polynomial with uniformly random coefficients
> > + *			 in [0,Q-1] by performing rejection sampling on the
> > + *			 output stream of SHAKE128(seed|nonce).
> > + *
> > + * @param [out] a pointer to output polynomial
> > + * @param [in] seed byte array with seed of length DILITHIUM_SEEDBYTES
> > + * @param [in] nonce 2-byte nonce
> > + */
> > +void poly_uniform(poly *a, const uint8_t seed[DILITHIUM_SEEDBYTES],
> > +		  __le16 nonce, void *ws_buf)
> > +{
> > +	struct shake_ctx hash_ctx;
> > +	unsigned int i, ctr, off;
> > +	unsigned int buflen = POLY_UNIFORM_NBLOCKS * SHAKE128_BLOCK_SIZE;
> > +	uint8_t *buf = ws_buf;
> > +
> > +	shake128_init(&hash_ctx);
> > +	shake_update(&hash_ctx, seed, DILITHIUM_SEEDBYTES);
> > +	shake_update(&hash_ctx, (uint8_t *)&nonce, sizeof(nonce));
> > +	shake_squeeze(&hash_ctx, buf, buflen);
> > +
> > +	ctr = rej_uniform(a->coeffs, DILITHIUM_N, buf, buflen);
> > +
> > +	while (ctr < DILITHIUM_N) {
> > +		off = buflen % 3;
> > +		for (i = 0; i < off; ++i)
> > +			buf[i] = buf[buflen - off + i];
> > +
> > +		shake_squeeze(&hash_ctx, buf + off, SHAKE128_BLOCK_SIZE);
> > +		buflen = DILITHIUM_SEEDBYTES + off;
> > +		ctr += rej_uniform(a->coeffs + ctr, DILITHIUM_N - ctr, buf,
> > +				   buflen);
> > +	}
> > +
> > +	shake_zeroize_ctx(&hash_ctx);
> > +}
> 
> By the way, the above has a bug.  In the second and later squeezes, it
> squeezes SHAKE128_BLOCK_SIZE (168) bytes, but then it uses only the
> first DILITHIUM_SEEDBYTES (32) bytes.
> 
> Now, that 32 is on top of the 840-byte first squeeze, so there are 872
> correct bytes which is enough for 290 samples.  So an incorrect matrix
> would be generated only if more than 290 samples happen to be required
> to get the 256 coefficients.  q / 2^23 = ~99.9% of coefficients are
> accepted, so that number of rejections would be pretty unlikely.
> 
> Still, it's a bug.  Anyway, we're not going to use this code (we'll use
> my code that does this correctly and in a simpler way), but I thought
> I'd point it out so that Stephan can fix it.  This seems to be a
> "leancrypto" specific bug.
> 
> Note: this feedback should not be taken as implying that I've reviewed
> the entire 4800 lines of code.  I just happened to notice this.

No reply from Stephan yet, so to make sure this doesn't get missed I
also opened an issue at
https://github.com/smuellerDD/leancrypto/issues/42

- Eric

