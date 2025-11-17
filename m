Return-Path: <keyrings+bounces-3374-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA2BC66130
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 21:14:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5A55D4E1685
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 20:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5454532B9A9;
	Mon, 17 Nov 2025 20:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojcS00gq"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F6429E0E9;
	Mon, 17 Nov 2025 20:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763410458; cv=none; b=VBDKS3UnKtagzQSkbkdiSxqzUC8BEMkFvMFIuZZvZH/cch7LX7XOTbqQnDPUW+M9FoFPhJN/x0A6E+yMDdYWy5rAKinhJ3p2NPDJcz7usU8yi4SR2laOgMZAwkJzDuP9cwXWt1+DCwUZTqI0p4qapbl5jKkTe561E3LVP1i8nbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763410458; c=relaxed/simple;
	bh=3RrRIVVEg4XKIJ5zloRokmCYGtairOMQadpCu/YDyZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EoBEXXYzKjAHRi02KgcEPQiwoRWkRh2yGlqhjFsL9ujHjso2yPnyOR6Z1dCnDOfrbloSTINqwXCZeOgRkmmdTZPBFt/nvGvujxmBuyTaiC9WWQzRb04cwsL5u7Q74fSNICdmy/3ZXfxmcPhJ2EHcoK1sOauRV6ni2CXqJf7Dgwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojcS00gq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09EC2C2BC86;
	Mon, 17 Nov 2025 20:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763410457;
	bh=3RrRIVVEg4XKIJ5zloRokmCYGtairOMQadpCu/YDyZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojcS00gqZYycJlusK1fmbxaXtGRwqen8wsrelpDDthBx9WLbIobQurE7Eo8Yf0bie
	 X0ncIh12mqWWd51hq2ciYmS47pV09LyZurTPJyZIPJyTHos3dIthp0yUQ2i6pHFnsp
	 +7XHd3an7InYtQlE5XFxjdEa7OXA9P3hS4AGpu/MV1k7q6WyjnDURWZEXtnctoWKW/
	 DTwtGCgcHg9GNKkXP13ebwf8+G4AaCpU+aFVBnmYKsV5ERJo0EuQ/G3b7FlFBmWI79
	 KH3QEkI/tygBFngTvNvPgNAqX3iIEUJJEPiel7cQak4PR2QP8fD7RxdRRmcYRmeZJ1
	 vKafBeAIV6pMw==
Date: Mon, 17 Nov 2025 12:12:33 -0800
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
Message-ID: <20251117201233.GA3993@sol>
References: <20251117171003.GC1584@sol>
 <20251117145606.2155773-1-dhowells@redhat.com>
 <20251117145606.2155773-3-dhowells@redhat.com>
 <2165074.1763409175@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2165074.1763409175@warthog.procyon.org.uk>

On Mon, Nov 17, 2025 at 07:52:55PM +0000, David Howells wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > In comparison, BoringSSL has an entire implementation of ML-DSA, ...
> 
> ... which cannot be used in the kernel due to the licence.
> 
> David

First, BoringSSL's license changed to Apache only recently.  An older
version of the code is available under a BSD style license.

Second, even with the new license I can get permission to relicense it
if needed.

Third, regardless of license BoringSSL's code can't be reused directly
in the kernel anyway, for various reasons.  My point is that a smaller,
cleaner, and more maintainable implementation of ML-DSA is possible, and
your submission misses the mark.

- Eric

