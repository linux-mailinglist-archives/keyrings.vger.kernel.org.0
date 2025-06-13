Return-Path: <keyrings+bounces-2837-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 211DEAD9375
	for <lists+keyrings@lfdr.de>; Fri, 13 Jun 2025 19:05:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D915016E7C2
	for <lists+keyrings@lfdr.de>; Fri, 13 Jun 2025 17:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CB1421B8F6;
	Fri, 13 Jun 2025 17:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZOkdQ7wl"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE73620F06A;
	Fri, 13 Jun 2025 17:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749834324; cv=none; b=BBnMTEpUcXpfFvOuWc4DUFEzDm17KF2UhgNTg8KkNELHo1TxJRs6RWmKWXjLJinw1HIJNglcX7w0aLkZXbs09p0Z4MsjpV5vRBG+dWq9QQuD8RHXaQFzUSKnrLms3/rVBEGwkdsW+Nw7/W1IP0eNdVFAOW/wUpT06SD1X7GNOZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749834324; c=relaxed/simple;
	bh=WwME9pJmBQE1KuzRr2fQ17L6tr6IhXaxBzR+1QCHfTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpWDUMlZitVV1AjuFrU7uuXgoKJ49/gkbAmeGwIu+ybyIXEMKLtJRd3IJZ3ftso7gTmkEShowYe/ZRmpYEZZxrbwXFGdCj5Sv2kMLRESKBmSpU+kumwDek6vpEjTu/E7uv3SL/z6g7TpTuvCZ+0gJCn9p7umAfhjOvRlksUZPh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZOkdQ7wl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E6CDC4CEE3;
	Fri, 13 Jun 2025 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749834323;
	bh=WwME9pJmBQE1KuzRr2fQ17L6tr6IhXaxBzR+1QCHfTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZOkdQ7wl383dgBdehzywwnEmOZgNbBqHekcZYXJv9w5lNDu+bGlfuuC0sU+zeCuN3
	 XYkbu6sqcqMbiXfxI6Bn/CktrFmQWmYBkyi2E2LiFsFbReOnD6glKJRbpGBcWOvNeQ
	 NWokG3wyismZTQ2BIl3xoCAWeIOMZmKpuYoL+fGd/c5hUjcfI8K9pch5b59c9+q8Bv
	 acDVHtAfG82ui3kFpTNMrPtWpYAgNR1CCsF7R7nFHFYXwlaS2ab0sPMNQSJRxfacbL
	 g/YOKgrmpmUR3cToG8PEG1ajyxp6ZKi2VOaXex1da51kTRlMxXdomBNEvI3Iqe2ldf
	 XB33TuNbIvzlg==
Date: Fri, 13 Jun 2025 10:04:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>, Simo Sorce <simo@redhat.com>,
	torvalds@linux-foundation.org, Paul Moore <paul@paul-moore.com>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Clemens Lang <cllang@redhat.com>,
	David Bohannon <dbohanno@redhat.com>,
	Roberto Sassu <roberto.sassu@huawei.com>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Module signing and post-quantum crypto public key algorithms
Message-ID: <20250613170456.GA1284@sol>
References: <501216.1749826470@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <501216.1749826470@warthog.procyon.org.uk>

On Fri, Jun 13, 2025 at 03:54:30PM +0100, David Howells wrote:
> Hi,
> 
> So we need to do something about the impending quantum-related obsolescence of
> the RSA signatures that we use for module signing, kexec, BPF signing, IMA and
> a bunch of other things.
> 
> From my point of view, the simplest way would be to implement key verification
> in the kernel for one (or more) of the available post-quantum algorithms (of
> which there are at least three), driving this with appropriate changes to the
> X.509 certificate to indicate that's what we want to use.
> 
> The good news is that Stephan Mueller has an implemementation that includes
> kernel bits that we can use, or, at least, adapt:
> 
> 	https://github.com/smuellerDD/leancrypto/
> 
> Note that we only need the signature verification bits.  One question, though:
> he's done it as a standalone "leancrypto" module, not integrated into crypto/,
> but should it be integrated into crypto/ or is the standalone fine?

The proper place for crypto algorithm implementations, both new and existing, is
lib/crypto/.  crypto/ should contain only the compatibility code to integrate
the algorithm implementations into the generic APIs like crypto_akcipher, *if*
it's needed.

ML-DSA a.k.a. Dilithium support is fairly low on my priority list at the moment,
so if someone really wants it soon they would need to drive that effort.

- Eric

