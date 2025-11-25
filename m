Return-Path: <keyrings+bounces-3439-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D13AC87072
	for <lists+keyrings@lfdr.de>; Tue, 25 Nov 2025 21:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BE684EB37F
	for <lists+keyrings@lfdr.de>; Tue, 25 Nov 2025 20:24:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C6A33BBBB;
	Tue, 25 Nov 2025 20:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dxNvE3xR"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6974A33B96F;
	Tue, 25 Nov 2025 20:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764102262; cv=none; b=r2PaLlcD+u09tEoer+VZ0vJ1xEv8eDJ/WneNoH0mswR9D207jrvYWJMUa6z7ATHVaulvv84e3nCZ5QNz8mD5vORHmBZZgpFnOYxzQuBEKuxM0USQQUg6I37iITOJ9C7+gP+I/lI+van8xr+LrC/967zVPEa4cvU5v3xl10I4CQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764102262; c=relaxed/simple;
	bh=IF3zxg6vSqG7eDpZdkTklgqMEg9K+BK9bCEP6T58x+w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AajCogpB3KEOZvBBvahEWaUYcW7rE4NjCuc7uBL2BJiukJcGs3dn8z5gye8w8AtpxAbBSUrQJTgvZJ31egbWz8rbfO6g+tFYd2NU9vUhDNXSojbwlfG4NJK/JJ5Ip8X8dfjVcGcUj6rNaQzRJlhKszczwvpGtd4SrLVmz09vssk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dxNvE3xR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41346C4CEF1;
	Tue, 25 Nov 2025 20:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764102261;
	bh=IF3zxg6vSqG7eDpZdkTklgqMEg9K+BK9bCEP6T58x+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dxNvE3xRvlOrasOVf9QYAZHjK1SBFVBxQMQKJEYCxcwq5Jl8DbEhuBwBA1fJPwxdk
	 LSHJBdWPFm7V17BZ3FSo+mwlVg36hj40z/aQOZEP07QQlZ2kYySN6kKNF1yg9GQHbp
	 dYkJZ/sL57g4Utj+6uS7HYhqLG03+rrFsKBgMgY9SeXSvfMQWbBcFaRrJY8spGM4q6
	 0WiDbevs+Mk+1sCcJcceo827p6esezqmJTHHGMT3vitH3BBAj/e+HTw+dZIwDgkna7
	 djejdJ3WgBgrKPmYvSZ5smEOXvCPjb0rh7raRSOrYV4eYpzUDIuqLMRCbHUlYv4RMZ
	 dkrYWA0rDa9mQ==
Date: Tue, 25 Nov 2025 20:24:19 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Ignat Korchagin <ignat@cloudflare.com>
Cc: David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/9] crypto: Add ML-DSA/Dilithium verify support
Message-ID: <20251125202419.GB3061247@google.com>
References: <20251117145606.2155773-1-dhowells@redhat.com>
 <20251117145606.2155773-3-dhowells@redhat.com>
 <20251117171003.GC1584@sol>
 <CALrw=nG6X5Opjb1H4VVzCNpJ4QtmHUK3nQ1XQ5GKMvnE9NnZsQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALrw=nG6X5Opjb1H4VVzCNpJ4QtmHUK3nQ1XQ5GKMvnE9NnZsQ@mail.gmail.com>

On Tue, Nov 25, 2025 at 10:10:18AM +0000, Ignat Korchagin wrote:
> Hi all,
> 
> On Mon, Nov 17, 2025 at 5:11 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Mon, Nov 17, 2025 at 02:55:51PM +0000, David Howells wrote:
> > >  lib/crypto/Kconfig                            |   1 +
> > >  lib/crypto/Makefile                           |   2 +
> > >  lib/crypto/mldsa/Kconfig                      |  29 ++
> > >  lib/crypto/mldsa/Makefile                     |  20 +
> > >  lib/crypto/mldsa/crypto_mldsa_44.c            | 166 ++++++++
> > >  lib/crypto/mldsa/crypto_mldsa_65.c            | 166 ++++++++
> > >  lib/crypto/mldsa/crypto_mldsa_87.c            | 166 ++++++++
> > >  lib/crypto/mldsa/dilithium.h                  | 304 ++++++++++++++
> > >  lib/crypto/mldsa/dilithium_44.c               |  33 ++
> > >  lib/crypto/mldsa/dilithium_44.h               | 291 ++++++++++++++
> > >  lib/crypto/mldsa/dilithium_65.c               |  33 ++
> > >  lib/crypto/mldsa/dilithium_65.h               | 291 ++++++++++++++
> > >  lib/crypto/mldsa/dilithium_87.c               |  33 ++
> > >  lib/crypto/mldsa/dilithium_87.h               | 291 ++++++++++++++
> > >  lib/crypto/mldsa/dilithium_common.c           | 117 ++++++
> > >  lib/crypto/mldsa/dilithium_debug.h            |  49 +++
> > >  lib/crypto/mldsa/dilithium_ntt.c              |  89 +++++
> > >  lib/crypto/mldsa/dilithium_ntt.h              |  35 ++
> > >  lib/crypto/mldsa/dilithium_pack.h             | 119 ++++++
> > >  lib/crypto/mldsa/dilithium_poly.c             | 377 ++++++++++++++++++
> > >  lib/crypto/mldsa/dilithium_poly.h             | 181 +++++++++
> > >  lib/crypto/mldsa/dilithium_poly_c.h           | 141 +++++++
> > >  lib/crypto/mldsa/dilithium_poly_common.h      |  35 ++
> > >  lib/crypto/mldsa/dilithium_polyvec.h          | 343 ++++++++++++++++
> > >  lib/crypto/mldsa/dilithium_polyvec_c.h        |  81 ++++
> > >  lib/crypto/mldsa/dilithium_reduce.h           |  85 ++++
> > >  lib/crypto/mldsa/dilithium_rounding.c         | 128 ++++++
> > >  lib/crypto/mldsa/dilithium_service_helpers.h  |  99 +++++
> > >  lib/crypto/mldsa/dilithium_signature_c.c      | 279 +++++++++++++
> > >  lib/crypto/mldsa/dilithium_signature_c.h      |  37 ++
> > >  lib/crypto/mldsa/dilithium_signature_impl.h   | 370 +++++++++++++++++
> > >  lib/crypto/mldsa/dilithium_type.h             | 108 +++++
> > >  lib/crypto/mldsa/dilithium_zetas.c            |  68 ++++
> > >  .../mldsa/signature_domain_separation.c       | 204 ++++++++++
> > >  .../mldsa/signature_domain_separation.h       |  30 ++
> > >  35 files changed, 4801 insertions(+)
> >
> > Over the past week I've been starting to review this massive addition.
> >
> > I don't think this is on the right track.  This implementation is really
> > messy, with lots of unused functionality and unnecessary abstractions,
> > and code that doesn't follow kernel conventions.
> >
> > In comparison, BoringSSL has an entire implementation of ML-DSA,
> > *including key generation and signing*, in a bit over 3000 lines in one
> > file.  But about half of that code is specific to key generation or
> > signing, which the kernel doesn't need, so in principle
> > verification-only shouldn't be much more than a thousand.  I find it to
> > be much easier to understand than leancrypto as well.
> >
> > Historically we've had a lot of problems with people integrating code
> > from external sources into the kernel, like mpi, with properly "owning"
> > it because they feel like it's not their code and someone else is
> > responsible.  I feel like that's going to be a big problem here.
> >
> > I think we can do better here and put together a smaller implementation
> > for the kernel that we'll actually be able to maintain.
> 
> I was thinking about this lately for some time - even put forward a
> small discussion proposal for upcoming Plumbers (which wasn't accepted
> unfortunately). Should we consider somehow safely "outsourcing" at
> least some (asymmetric - potentially slow anyway) crypto
> implementations to userspace? Something similar to
> request_module/request_firmware/request_key usermode helpers or an
> io_uring interface or a crypto socket? This way we can bring any
> well-maintained crypto library (and even multiple ones) to the kernel:
>   * it can have any software license
>   * can be written in any programming language
>   * can use architecture vector instructions more easily
>   * can have any certifications out of the box (looking at you - FIPS)
>   * distros would have the ability to plug their own
>   * maybe it can even do private key crypto (which I personally would
> really like more support of and it would be acceptable to Herbert)
> 
> Given the past experience of RSA and mpi - it is not that difficult to
> port something to the kernel, but quite hard to maintain it over time
> in a secure manner. With a userspace approach the kernel can
> piggy-back on proven vendors like any other piece of open source
> software out there.
> 
> I understand that there probably still be a need for some in-kernel
> crypto, so the proposal here is not to fully replace things, but
> rather complement the current offerings with an interface, which could
> enable faster adoption of newer (and more secure versions of existing)
> crypto algorithms.

The performance cost of that would be very high, so it would only have
any chance at possibly being reasonable for some of the asymmetric
algorithms.  It would also introduce reliability issues.

I'll also note that the main reason that people seem to want private key
operations in the kernel is for the keyctl() UAPIs for userspace, which
is already a bad idea.  So I guess we end up with userspace calling into
the kernel, which calls back into userspace to use some userspace crypto
library which the original userspace program refused to use in the first
place for some reason?  It makes no sense to me, sorry.

There is the opportunity to share more code with userspace projects at
the source code level.  Just it doesn't always work out due to different
languages, licences, requirements, conventions, and implementation
qualities.  For ML-DSA verification I didn't see a good alternative to
just writing it myself.  But in other cases a different conclusion could
be reached.  The kernel uses a lot of the assembly files from
CRYPTOGAMS, for example, and some of the Curve25519 code (including
formally verified code) is imported from other sources.

- Eric

