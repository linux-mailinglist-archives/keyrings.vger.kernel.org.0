Return-Path: <keyrings+bounces-3078-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEF2B969B4
	for <lists+keyrings@lfdr.de>; Tue, 23 Sep 2025 17:33:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76003173A4B
	for <lists+keyrings@lfdr.de>; Tue, 23 Sep 2025 15:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E941F4622;
	Tue, 23 Sep 2025 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NX3Q5WBM"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB3617A5BE;
	Tue, 23 Sep 2025 15:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758641626; cv=none; b=ZDyCTsPVmpnM97432nlzZT+Qm3qScWopUsN2D9Rh8xu6Vx8q2bytyzytkxgMFxom1YtD0TpOPyv64h/u1pM8yQ+2DZ4tc4vimOfWhRM7PgaGSPhVqfoIdkuw19adIxbtKHhQBSqWkYtwwIjhokI5dj7Wsm/p7wnMEED+ABx5xwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758641626; c=relaxed/simple;
	bh=ZSDQWfBtJVUblxhYyaSBTsgHuoeUC2Mk5dPjvgq3aGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ppJslHdNabkzclnXT6lXYlcMUdcXy8xba4LIaRzZi0xXZ79fDYk4N9YsShpFX/6O8b8wcILL/MI6Im5MqP+XVwPQszF04wlEqWCf7tn/GkIHad60dJYalD1f5j7HPiP967nz8+0D2Pnc1BsO0H8ZxYsRfVrP+jmWw4iCQLxHEWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NX3Q5WBM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A138C4CEF5;
	Tue, 23 Sep 2025 15:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758641626;
	bh=ZSDQWfBtJVUblxhYyaSBTsgHuoeUC2Mk5dPjvgq3aGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NX3Q5WBMFKgGCRE/3nV7OKVIdUiGGfFSsNZv+CYrL9NciW2eNEM3sHle8pNQKTKV1
	 jbp1v9n230M948GI9QwjrS9zmJEdBz4hz48oJ3zfb2tL/yDiWnM0CQ9BC+oMPVCHyk
	 PAZkt8Dy3wdG5zCgKlTMpRqiIlku7HTDado8SvCzpaM/QsCEHKStey7nNI76R7/5q3
	 fTsu4d/GDHURX3yQsoM1ohusQ7rScRiN7RXm0ZdQdvA2YDsP4wL/HgJ6ABzwZX7TOq
	 vfnnjrk0FfGGIIvMDmVz3S6S+3fiU+zKWv4VAB4cdl9gLD+OKK4Bs0X/Gd+7f3ZnpA
	 hqbLgLBeGMPzw==
Date: Tue, 23 Sep 2025 08:32:28 -0700
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
Message-ID: <20250923153228.GA1570@sol>
References: <20250921192757.GB22468@sol>
 <3936580.1758299519@warthog.procyon.org.uk>
 <506171.1758637355@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <506171.1758637355@warthog.procyon.org.uk>

On Tue, Sep 23, 2025 at 03:22:35PM +0100, David Howells wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > Also, the parameter should be strongly typed: 'struct sha3_state *'
> > Likewise in all the other functions that take the raw u64 array.
> 
> Those function may be directly substituted by calls to assembly code - so
> u64[] is probably more appropriate.

We've been using strongly-typed state even for assembly functions.  See
the SHA-1, SHA-2, and ChaCha code.

> > > +	for (round = 0; round < KECCAK_ROUNDS; round++) {
> > > +		keccakf_round(st);
> > > +		/* Iota */
> > > +		st[0] ^= keccakf_rndc[round];
> > > +	}
> > 
> > In the spec, "Iota" is part of the round.  Having it be separate from
> > keccakf_round() in the code is confusing.
> 
> I assume that pertains to the comment about inlining in some way.  This is as
> is in sha3_generic.c.  I can move it into the round function if you like, but
> can you tell me what the effect will be?

The effect will be that the code will align more closely with how the
algorithm is described in the SHA-3 spec and other publications.

> > Second, the support for update() + squeeze() + update() + squeeze()
> > seems to be trying to achieve something that is not defined in the SHA-3
> > spec.  Could you elaborate on what it is meant to be doing, and why it's
> > here?  According to the spec, the XOFs SHAKE128 and SHAKE256 actually
> > just take a single message as their input.
> 
> Turns out I was misunderstanding what I was looking at whilst trying to adapt
> Leancrypto's dilithium code.  Whilst it does squeeze a context several times,
> it doesn't update it after finalising it without reinitialising it.

Yes, that's what I thought.

- Eric

