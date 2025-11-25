Return-Path: <keyrings+bounces-3436-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 726BDC8355B
	for <lists+keyrings@lfdr.de>; Tue, 25 Nov 2025 05:31:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D398634C54F
	for <lists+keyrings@lfdr.de>; Tue, 25 Nov 2025 04:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65F322D4C8;
	Tue, 25 Nov 2025 04:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z/AsasmN"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BAA288D6;
	Tue, 25 Nov 2025 04:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764045076; cv=none; b=j3J+CaLJXeNb8bqawVL3DV16owkgTjpIrweInIt1GT9I9h6WiEVurWRTBwIe59aW+C0UpP+QCsrxqP1G6fXVvFot3r62DCXcQ/ubJPLr+QM8dYdn0//bwkmQ7boQETGC+SlvaPYQUSNldICwp+MhqDJnNi8QY25vWpMmvMVNTDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764045076; c=relaxed/simple;
	bh=8hb18tpyX5aLuMx/txnw3GHN1H/pPt8/p+1pxe2wZ38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/UT9tG9RgV4VNhk/Q397DBg2K6Z1I5gZ7PGung5JZMK4U8xRESQl+ARxIFEynyfv2YiRX/nvBek6UPRoobnymNj4mtdoYvOa/xOomfFBFJXC7Jk8su1v+DCdB9fWF+EodUSS2FqKA2Jam5MeCiiBN0YjB15KuOrbk9dCKXri98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z/AsasmN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC60C4CEF1;
	Tue, 25 Nov 2025 04:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764045076;
	bh=8hb18tpyX5aLuMx/txnw3GHN1H/pPt8/p+1pxe2wZ38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z/AsasmN4OwREeTA8aC7lt+morNoQxZQGwPmxdDCXYBuPjoOPGpkJaT0fFa/kcijQ
	 3H8Y5dCI8HI/gk4JCPscf+tO/rkjqXtA/HhhE2i6RGKCsFpzvfVnfP66X8QRfFjw+E
	 cJjqgELGbtpk1UNJrWrYNwnCFuA8zsZwxgblotoXlwFfk9T/bol1W4tr8Fi1ozoR5J
	 sRKRboVa9PR5rUgw0S8VW2/IorqSDog139MFi4Ko2SmQq0NAZGq8NdZtLjiEOFWpN7
	 0TYq5s65fj+ng+drBi8WXI3HQWlHLeWHnZz/lCrkDMW5Z+nk/TFADJKP5rXJaMe/eL
	 ETk7osZmA+qag==
Date: Mon, 24 Nov 2025 20:29:27 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
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
Subject: Re: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Message-ID: <20251125042927.GB1608@sol>
References: <20251121005017.GD3532564@google.com>
 <20251120003653.335863-2-ebiggers@kernel.org>
 <20251120003653.335863-1-ebiggers@kernel.org>
 <2624664.1763646918@warthog.procyon.org.uk>
 <2755899.1763728901@warthog.procyon.org.uk>
 <20251121171421.GA1737@sol>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121171421.GA1737@sol>

On Fri, Nov 21, 2025 at 09:14:21AM -0800, Eric Biggers wrote:
> However, unfortunately neither source explains it properly, and they
> actually provide incorrect information.  The comment in the reference
> code says the the input can be in "-2^{31}Q <= a <= Q*2^31", which isn't
> quite correct; the upper bound is actually exclusive.  In my code, I
> correctly document the upper bound as being exclusive.

I opened https://github.com/pq-crystals/dilithium/issues/108 against the
reference implementation.  So hopefully that comment will get fixed.

> FIPS 204 documents the same incorrect interval, but then sort of gets
> around it by only claiming that the output is less than 2q in absolute
> value (rather than q) and also by not clarifying whether sign extension
> is done.  They may have thought that sign extension shouldn't be done,
> as you seem to have thought.  Either way, their explanation is
> misleading.  The very-nearly-symmetric version that produces an output
> less than q in absolute value is the logical version when working with
> signed values, and it seems to be what the Dilithium authors intended.

I'm collecting the mistakes that I've found in FIPS 204 into a list,
which I'll send in to NIST as an errata request at some point...

- Eric

