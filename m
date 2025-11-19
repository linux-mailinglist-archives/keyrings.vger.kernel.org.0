Return-Path: <keyrings+bounces-3382-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B60C6CAA1
	for <lists+keyrings@lfdr.de>; Wed, 19 Nov 2025 05:00:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B284B4E3CAB
	for <lists+keyrings@lfdr.de>; Wed, 19 Nov 2025 04:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1FE2236FC;
	Wed, 19 Nov 2025 04:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QIX9mcMl"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBB71487F6;
	Wed, 19 Nov 2025 04:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763524850; cv=none; b=cc+Jbg1MdFsBrYg5pXbvxjLrH1KGbDJ8N+6QS/VVfEdr3jWSb7xPccmXzzYnd8d0ghIz8S/PoTd8Z6zEkPJ2NoveGdraCpPn00C7PX121EgKMgmw85vosp1PF9i69Lq9WMSLpMuK9RnZpAIpCRQXUQoJ2uenxFLQcXtxLkgfgf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763524850; c=relaxed/simple;
	bh=XJs/aGHI3VwP9T/GRAPPiAmowyjyGM+9eQqVOL9p4/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZH8Z1zt2kZIJ7msXrnCX90gcUMPTWRiJWGWfsef2qftbodvwlY8x+uTNkQdPASSiB4w3MBwipFeMmkp9K0fRs5P6VVXHuBKCVWoz01GL4Yn/p+N8M0dBHJzusuKc8xPTCkHGnL6/3ZrtJm/W+L2DoeHXMyxOwSx4wQWBwBMRqvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QIX9mcMl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7484C16AAE;
	Wed, 19 Nov 2025 04:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763524850;
	bh=XJs/aGHI3VwP9T/GRAPPiAmowyjyGM+9eQqVOL9p4/g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QIX9mcMleXbcL82UI93ArPsVBOuUIEolWfVRb9xoLGr4fUPntcH7gJwABOKWHOpNb
	 Irax2FJcjgcD7j7+1qbjIFJD5Hwsgq32O5Pz/32pHGGWFIVat/odpeOIVU5tr5e55q
	 eJigfr98oz9avv+3gsOUqN0qfuQlceIhWYpF7+C6ch6ljXvxAxF7IC672FuhDhqBUV
	 tUxfUCVrw+UXA6ItOTqSTchdIRp1cLxv6ZJziNXSJqMsn66GDiQ+d36+OlSjzeDbrh
	 SiNxx0wQpKZt6V5gfLLxYq7+bFXThY2t+DrEqFjpN38kWfGGIErF+4a+mymNha+Fvp
	 Oa1KC6xxeaU+g==
Date: Tue, 18 Nov 2025 19:59:05 -0800
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
Message-ID: <20251119035905.GA1743@sol>
References: <20251117171003.GC1584@sol>
 <20251117145606.2155773-1-dhowells@redhat.com>
 <20251117145606.2155773-3-dhowells@redhat.com>
 <2165074.1763409175@warthog.procyon.org.uk>
 <20251117201233.GA3993@sol>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117201233.GA3993@sol>

On Mon, Nov 17, 2025 at 12:12:33PM -0800, Eric Biggers wrote:
> My point is that a smaller, cleaner, and more maintainable
> implementation of ML-DSA is possible,

I've written an implementation of ML-DSA verification in about 600
lines.  It may grow slightly as I clean it up and test it, but we
definitely don't need 4800 lines.  I'll send it out once it's ready.

By the way, your proposed KUnit test suite has no negative test cases :(
We can do better than that.

- Eric

