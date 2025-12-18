Return-Path: <keyrings+bounces-3685-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B48C5CCD559
	for <lists+keyrings@lfdr.de>; Thu, 18 Dec 2025 20:08:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E49B302AABD
	for <lists+keyrings@lfdr.de>; Thu, 18 Dec 2025 19:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 551902FBE0A;
	Thu, 18 Dec 2025 19:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVt7IRjs"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263282D7387;
	Thu, 18 Dec 2025 19:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766084897; cv=none; b=V/uDh4soK1R59kpy8KVoJRuW6+lQb3v7Oou5/w+bLar+BC4rmJFKQDFWBeajOkF8iO2hnaNC727uCFvdF/QlEv3MnMf1xI4kAjnO+FhzIG6fAXguZ9D8c8F3oTtJtKu4fSWt5rmPQfRTGAxJ1F2rp55OUOSanVeIN3hgq0wQvYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766084897; c=relaxed/simple;
	bh=Z9a4e2kqMkKgECN326Qvq7UbuTUqk+wZb7MlxJlWTR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XFCwg2FtC3qLYEAgNwe9f/WBxdnAnYbQLkhqNgwfKfFb8VAzTVQJF6isUifEGSfJG2DDs8HDTMtUc1fEsebReS8O8oxT7jXTn7hb4mMDnfk2Wf34pc3KN6CnzxS0r1o7soPQks8pmKKq9kDccN5pe8r0R5AARai8kfBcJTj0nFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVt7IRjs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5813BC4CEFB;
	Thu, 18 Dec 2025 19:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766084896;
	bh=Z9a4e2kqMkKgECN326Qvq7UbuTUqk+wZb7MlxJlWTR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TVt7IRjs2ghTWN3c/22Tqxzt7YfvoutHaPj12OH2pkrYO0vk7kdjC1PcIN3tbB8jx
	 saNOCAOq1OkKPa6P3kT1vqi+EGUX3VOKj25mztYDS+7+S1g+mNPD2p9EbKXfxdEyPE
	 pPCT7Y6SXCKA9irZLQ8j2wjwLOHurx3Lw79KgxSXDrb57WfAlxu8vZVKfJ1fpwsaug
	 5mBinKohEUuxMrO9B0eBjiE0nH3RWbdJwMTNs1OgL6O6Ct6Hk+dEo+Fq7pgIiELPWj
	 LSakdMvRzAC40tGgo3jrVCZik7E+2oN9buaWBIY2PUAy4SxRJEEyddTXD/mo/Gps8s
	 BEW4+wBo38ikg==
Date: Thu, 18 Dec 2025 11:08:07 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
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
Subject: Re: [PATCH v4 0/2] lib/crypto: ML-DSA verification support
Message-ID: <20251218190807.GC21380@sol>
References: <20251214181712.29132-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251214181712.29132-1-ebiggers@kernel.org>

On Sun, Dec 14, 2025 at 10:17:10AM -0800, Eric Biggers wrote:
> This series can also be retrieved from:
> 
>     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git mldsa-v4
> 
> This series adds support for verifying ML-DSA signatures to lib/crypto/.
> Patch 1 is the ML-DSA implementation itself.  See that for full details.
> Patch 2 adds the KUnit test suite.
> 
> The initial use case for this will be kernel module signature
> verification.  For more details, see David Howells' patchset
> https://lore.kernel.org/linux-crypto/20251120104439.2620205-1-dhowells@redhat.com/
> 
> Note: I'm planning to apply this to libcrypto-next for 6.20.

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=libcrypto-next

- Eric

