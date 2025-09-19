Return-Path: <keyrings+bounces-3042-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 706CBB8B31B
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 22:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3086E3BE198
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 20:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCEC722370D;
	Fri, 19 Sep 2025 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VEivrP8/"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5A9469D;
	Fri, 19 Sep 2025 20:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758313934; cv=none; b=lQIXRw/pVVangv1ax8n9sp/theSy3gF1vGwEcKg0eYvDAweHAGubQRRFDNwbrAOosG2bZ/aAevnIkNZfFG/H/dKZ2v3t0fDZ5H47t44LI0iRzB7fE3NO7xc/Aq9P5mOCRYNKmVhy4VijIiaIHSso2ZRjoxxV1/RWPZrhX9g4rQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758313934; c=relaxed/simple;
	bh=S3n2bU40f4PTbsQs85QjCGeUlVU9YAXSJZHZZh9Whbw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+XlBNJvhFaUHBRGxn/EYWGw2EJOxGL4gP3bLiZ3zgfugBK4vA4Cyvo9pe0jkA6TpmlbRAjzenjS+1HLJ7+fYycTonbyvq4gw7NJOHv8VIiAHafd03JQMr/OkWiMHyrsrspkqX3MyCAps/bg7GyszfuJTA5E2G/U+96FcVsky9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VEivrP8/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A519C4CEF7;
	Fri, 19 Sep 2025 20:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758313934;
	bh=S3n2bU40f4PTbsQs85QjCGeUlVU9YAXSJZHZZh9Whbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VEivrP8/PIN4+zGNTGt7kkBpdM/r+7M8eHcn6khQeQK7egKD5pvdt5m//UmFqXWtr
	 MSGNzkNA0mToKRvQYCg8bvC17Vbn1jh+Wlv2YYYwi7Hx1N5pise5wCASfZYVKqyXk+
	 y0myOMx+5q4XSa5KYZwBxvmVCgZXXPT/KNQZVZ/tCnN81gb1YD4pvcBgONNthnyl5U
	 tJW/BceQ2IkBwM7WdDRkBJnXdwGtzWVUy86Zwe+4bs3mb4jOSvUHitQZkbl4Zl2fg0
	 burfE0S/Ww67yh5MwMka5zEdpiis1Zsh/wSAYHnBE9/R3Uax7Dr54z08e4spEurjaP
	 OzV94xNp7P59g==
Date: Fri, 19 Sep 2025 15:32:08 -0500
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
Message-ID: <20250919203208.GA8350@quark>
References: <20250919190413.GA2249@quark>
 <3936580.1758299519@warthog.procyon.org.uk>
 <3975735.1758311280@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3975735.1758311280@warthog.procyon.org.uk>

On Fri, Sep 19, 2025 at 08:48:00PM +0100, David Howells wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > This should be based on libcrypto-next.
> 
> This?
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-next

Yes.

> > and that the functions can be called in any context.
> 
> "Context" as in?

See the "Function context" section of
Documentation/doc-guide/kernel-doc.rst

> > The testing situation looks odd.  This patch adds six KUnit test suites:
> > one for each of the SHA-3 algorithms.  But they only include the
> > hash-test-template.h test cases, and they don't test the unique behavior
> > of SHAKE.  The KUnit tests need to fully test the library.
> 
> Yes, I'm aware of that.  The hash-test-template template is rather rigid

hash-test-template.h is designed for traditional hash functions.  If
you'd like to extend it to support XOFs, that's one option.  But I think
just keeping the XOF testing in sha3_kunit.c would make sense for now.

> and not always correct in its assertions (for instance requiring the
> final function to have zeroed the context - I had to modify my API to
> work around the testsuite).

But that's the correct behavior.  Callers may be hashing sensitize data,
so *_final() zeroizes the context.

The "multiple squeezes" use case should use different functions.

> > I also think that splitting the SHA-3 tests into six KUnit test suites
> > is awkward.  I know I did something similar for SHA-2, but it made more
> > sense for SHA-2 because (1) there are only four SHA-2 variants, (2)
> > SHA-256 and SHA-512 don't share any code, and (3) there wasn't anything
> > more to add on top of hash-test-template.h.  In contrast, SHA-3 has six
> > variants, which all share most of their code, and there will need to be
> > SHA-3 specific tests (for the XOFs).
> 
> Yes, but I believe you wanted me to use hash-test-template.  The problem is
> that it hard-encodes by macroisation of the #include's file various parameters
> including the hash size.

Did you miss my response at
https://lore.kernel.org/linux-crypto/20250917192829.GA8743@quark/ ?

- Eric

