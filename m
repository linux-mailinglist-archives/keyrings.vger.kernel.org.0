Return-Path: <keyrings+bounces-3303-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 769D8C3D380
	for <lists+keyrings@lfdr.de>; Thu, 06 Nov 2025 20:20:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2CB713B1EA3
	for <lists+keyrings@lfdr.de>; Thu,  6 Nov 2025 19:20:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB7034DB42;
	Thu,  6 Nov 2025 19:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrDGUFA+"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A1252292;
	Thu,  6 Nov 2025 19:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762456833; cv=none; b=lCm7P1vgODKCPJxbxQBB58l4MLETNJA5Yt+b4f5osIf/WDKTQfUJYyJ4COhVZCh2xdFQeH3IAPcVhmNLYtuahK5+1W5MpQYLoHukR0vqxteedNtj9XfdxRTCnyhaYsFxQB8iLo8KGy+y11rSlKmjyEHKjxOSNsoh/2PgtOO+lBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762456833; c=relaxed/simple;
	bh=meXPx+Ve4o9hI+5SdxRh+xUBm23b+aWsTT9FzIutTmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzSHEpV04MjXqLrBzT0o1d7dh/WOfqeDH0nhRG30D2NcnMYud2TLHKrdTboXnzprjwaR87qaJ063Ro+3a2HCgG+VOUr/BoZAyFCP4NZGhg6JSwoXlpBSuJThrxHwb98A+6ADgKgcvz2Tno/F2D6DRNHVWd/ZRUAGY0eg70DaAl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrDGUFA+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBE7C116C6;
	Thu,  6 Nov 2025 19:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762456832;
	bh=meXPx+Ve4o9hI+5SdxRh+xUBm23b+aWsTT9FzIutTmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PrDGUFA+YVH1Eyvc3ASnW7Wie28hxo+ReZAccLnn9UOeyUNutsF1ougrzS3nI0qod
	 RqT9bmespxma70jexSVHf6ZiBX/3DTtqt9Aoztt21eqZrAaHvGikx45VgiSQw6qrE6
	 am2kBD9oAl5YWz0Guxr/EEvDYywiKBPPvN6bm5SlXVW7nP7gRLcSFrQF5Atmf8c45f
	 dTVHGRfumQKCUgYe3Mo0QLXjW9rJBN5aF8l9dmzaarA77piTXPYCnoYVL10ARWdSD/
	 NhlVhgzA7dR7KacQCAHrHxwf49aD3Z+2aB31q2b7U4/pf7mYcJ/ZpYm/tgi82YTz4l
	 VzjGqPC7qIgbg==
Date: Thu, 6 Nov 2025 11:20:16 -0800
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
Subject: Re: [PATCH v7 2/8] crypto: Add ML-DSA/Dilithium verify support
Message-ID: <20251106192016.GA3318@quark>
References: <20251106174456.31818-1-dhowells@redhat.com>
 <20251106174456.31818-3-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106174456.31818-3-dhowells@redhat.com>

On Thu, Nov 06, 2025 at 05:44:46PM +0000, David Howells wrote:
> The interface to this code is through the crypto_sig API as the PKCS#7 code
> wants to use that rather than calling it directly.  As such, I've placed it
> in crypto/ rather than lib/crypto/.  Only the verification hooks are
> implemented; the signing hooks return an error.

As I mentioned before
(https://lore.kernel.org/linux-crypto/20250613170456.GA1284@sol/), this
code should go in lib/crypto/.  There seems to be a clean API in
crypto/ml_dsa/dilithium.h already.  Just make that the library API.

If "crypto_sig" support is really needed too, then put that in
crypto/ml-dsa.c, built on top of the library API.  It's not clear the
crypto_sig support is very useful, though.  For one, you had to add
ML-DSA specific logic to the calling code anyway (see "pkcs7: Allow the
signing algo to calculate the digest itself").

- Eric

