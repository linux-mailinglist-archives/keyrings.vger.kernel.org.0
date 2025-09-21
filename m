Return-Path: <keyrings+bounces-3056-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDC3B8E7F0
	for <lists+keyrings@lfdr.de>; Sun, 21 Sep 2025 23:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85104189CD7C
	for <lists+keyrings@lfdr.de>; Sun, 21 Sep 2025 21:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCE31E5B7A;
	Sun, 21 Sep 2025 21:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s8z6p4Lw"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA8C140E34;
	Sun, 21 Sep 2025 21:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758491925; cv=none; b=V58bi6G72Eu2LTMSAIIrgeM4UBH4ee4WlJbXxsvbcTt9WItUldAuQ6NWgbG6SS0WVOW0A3vd5OPOMFgU/tgAsi9VRp6aLxx4fhcKAeY2h1tENgr1pyN5lQqKlAGkJSXkHMo2B5jLrM8OJ49R5pTtj9dT1A6c+J+e8ZEA++b6/rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758491925; c=relaxed/simple;
	bh=/tZjPgAJdBpcSzn5Osdrz4wtBYeaEV6KDmnIc7IqSp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JHOgBXKS6P2/QunlGEQ+AvTCPfZYmsKTcoMQPVrH34dn6G+51iTiLX5ftMn/J/rh1albHUUExZG/YMIpgBI/1n1gON/7t7pjsBkCYoEu9E8qOQnKl1yD+Jbv68fwpFGbESldUOzfkrPJ3IPYaCZxvkqYhA9G7HdITwN9dYQH1yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s8z6p4Lw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5E2C4CEE7;
	Sun, 21 Sep 2025 21:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758491924;
	bh=/tZjPgAJdBpcSzn5Osdrz4wtBYeaEV6KDmnIc7IqSp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8z6p4Lw8w7OohgU7E5Ynwl2ifDKKBc0m26J3XhD63TAsoxgfKl6NG4m/Z30wCUGz
	 lsQ5tG34XupdhXMr47mQO4XhcdhiljadGlEjAkHYTqRFiM8RMqyKk/L/QejKXnvn24
	 0eZ5LwkDoDDBDMgjJl1tmscRlyRkUR7x+k43Qu0u88BMZHaSVqrIP7TY3Q6vc85yjb
	 pKsvnCJYJK08zSK9OfL4Tdj5xOp1DGdnuL4rW7nxg17OguCkzMRpASaiEnyxIhp1fG
	 O/DYiGjS903zdrZzfArWpWm+V0/CLZREgtVfTHf/Qz9mx6oTSAYrAbQGa0d9ioY3B+
	 vY14IH8GxwNkQ==
Date: Sun, 21 Sep 2025 14:57:28 -0700
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
Message-ID: <20250921215728.GA6409@sol>
References: <20250921192757.GB22468@sol>
 <3936580.1758299519@warthog.procyon.org.uk>
 <38637.1758489516@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38637.1758489516@warthog.procyon.org.uk>

On Sun, Sep 21, 2025 at 10:18:36PM +0100, David Howells wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > > +/* update the state with given number of rounds */
> > > +
> > > +static SHA3_INLINE void keccakf_round(u64 st[25])
> > 
> > The above comment doesn't match the code.  keccakf_round() does only one
> > round.
> 
> This is exactly as in crypto/sha3_generic.c.  You may want to fix that also.

First, as I've mentioned, the SHA-3 crypto_shash algorithms will
eventually need to be reimplemented on top of the library.  We shouldn't
have two competing SHA-3 implementations in the kernel.  So
sha3_generic.c will get replaced soon anyway.

Second, this patch already makes changes to the SHA-3 code and doesn't
simply copy it.  Cleaning up some additional small things like incorrect
comments would make sense, similar to how you've also cleaned up the
endianness handling.  If you'd like for it to instead be a simple copy
followed by a separate cleanup patch, that could be okay too, but the
submission would need to be organized that way.

> > Would you mind putting all the kerneldoc comments for the public API in
> > the .h file, similar to sha1.h and sha2.h?  Then they'll all be in a
> > consistent place, and they won't have to be moved around each time we
> > change functions to inline functions or vice versa.
> 
> Yes.  I know include/crypto/ does it, but that really makes the header files
> suck as the doc-to-code ratio is too heavily in the doc's favour.
> 
> Actually, this should be done properly and I'll add an API doc to
> Documention/crypto/.
 
These are just functions.  The first priority should be kerneldoc, as
that's where most people will look.  Documention/crypto/ maybe could
contain a high-level overview of the various hash function APIs (not
just SHA-3), but it should not be duplicative of the kerneldoc and it
doesn't eliminate the need to write high-quality kerneldoc.

> > First, this patch's proposed API is error-prone due to the weak typing
> > that allows mixing steps of different algorithms together.  For example,
> > users could initialize a sha3_ctx with sha3_256_init() and then squeeze
> > an arbitrary amount from it, incorrectly treating it as a XOF.  It would
> > be worth considering separating the APIs for the different algorithms
> > that are part of SHA-3, similar to what I did with SHA-224 and SHA-256.
> > (They would of course still share code internally, just like SHA-2.)
> 
> I disagree.  You're adding excessive complexity.  I would be more inclined to
> agree if the thing might crash because you used the wrong thing.  That said,
> sha3_final() uses the digestsize set by sha3_whatever_init(), which could
> cause a problem, so I think it's better on balance to just add an extra
> parameter to sha3_final() to say how much digest you want and ditch
> ctx->digest_size.

A cryptographic flaw can be as bad or worse than a crash.  We need to
design APIs that are easy to use correctly and hard to use incorrectly.

> > Second, the support for update() + squeeze() + update() + squeeze()
> > seems to be trying to achieve something that is not defined in the SHA-3
> > spec.  Could you elaborate on what it is meant to be doing, and why it's
> > here?  According to the spec, the XOFs SHAKE128 and SHAKE256 actually
> > just take a single message as their input.
> >
> > One might think the above sequence would compute SHAKE*() on the first
> > message as well as SHAKE*() of the two messages concatenated together.
> > But that's not what you've made it do, as you've made it apply padding
> > after *both* messages.  So, then one might think that it's meant to be a
> > XOF on the sequence of messages, built on top of SHAKE*().  But it's not
> > that either, since the way that you've proposed to format the sequence
> > of messages into a longer message isn't injective.  So, I can't figure
> > out why you're supporting this usage and what it is meant to be doing.
> 
> I can't speak to that except to say that ML-DSA does exactly this as far as I
> can tell.

Citation needed.

> > Shouldn't the term "digest" be avoided when talking about the output
> > from a XOF, to avoid confusion with traditional hash functions?
> 
> No idea.  There's not any real programmatic difference except for the padding
> byte.  I can change it to "output" if it makes you happy.

How about reviewing the specs and seeing what terms are used?  It's not
about what makes me happy, but rather about using standard terminology.

> > If a test is included at all here, it should be simpler, e.g. just
> > compute the SHA3-256 of some short hardcoded message.  That will be
> > sufficient to test the implementation of the Keccak permutation.  The
> > real tests will be in the KUnit suite, as discussed previously.
> 
> No.  Please stick with the one I have.  It exercises the extended features
> used by ML-DSA that will be used for PQ module signing.

That should go in the KUnit test suite.

- Eric

