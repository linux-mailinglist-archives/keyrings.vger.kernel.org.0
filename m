Return-Path: <keyrings+bounces-3420-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A06C7BE77
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 23:48:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 659AA35F97C
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 22:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C9B2D3221;
	Fri, 21 Nov 2025 22:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4DNKCUh"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BAC30B505;
	Fri, 21 Nov 2025 22:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763765289; cv=none; b=pmxijCkDdzhwMEO2dnyZeO8mfo7eiGd6U8dtYm7p0DG7/1YT6IugyB1cpefMPtE/tqbi5ATwVzn+RVvipTkXgt6zNO7IOLgOL4jutsM5e9Y1Oiav6KdT4j/3kiCHA4j4qiZBXZwSCI5aMTjxdI8HLeH973816KE0hfo4pVoG49Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763765289; c=relaxed/simple;
	bh=jSZTw7qzM42am1q447is0k1KdCW2verGxTBoYDJ5VQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0jnCcjhxHStUNieSFwwvQWtajZcE/S8YdH+tdf8j2rZSu86KyOeD4UGYqPWbnKG2TgAhzKnl3uMHLiDHUosBbHyqFWrEbKEJc2+MVPBL48HTfwqtKa2cjWgoqvPyGR9w/XbNuDfv5zXapMFXbQ6ThOfgelNDee7sSrzb+MgeFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4DNKCUh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8663AC4CEF1;
	Fri, 21 Nov 2025 22:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763765286;
	bh=jSZTw7qzM42am1q447is0k1KdCW2verGxTBoYDJ5VQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4DNKCUhc7kVc4ctiBm7YfmD1T3LMxWAlgwG3PuEdJtUXPhq8phD7m4Ao6mqCNtXZ
	 V/eHvmDrKS11fm9M2DWfI1yuGkK2lWBEEfczBXV/k5S7zIMlAiaGC7qj/KAkeIfBxd
	 4hcPrJol0gS5CnWtBsrg7hnjNdSvq/uMgZ+6yhF416Q8KV2DmH1NRA9/UJWuc7GD8O
	 sM6duuCekP7VfQ75+qjZTbm4Ge7U5DW5IRicyWqSsfICDU4rybeJn3Q14FbqU+w9wx
	 z+ghFLkRhrLavhWn8sN1+G8L5kCuH2RO5ttvAhfPmbUN6y2in30i1LSaykAZpnfJFs
	 GYCRUhoQjlMyA==
Date: Fri, 21 Nov 2025 22:48:03 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: David Howells <dhowells@redhat.com>, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Message-ID: <20251121224803.GB3300186@google.com>
References: <20251121005017.GD3532564@google.com>
 <20251120003653.335863-2-ebiggers@kernel.org>
 <20251120003653.335863-1-ebiggers@kernel.org>
 <2624664.1763646918@warthog.procyon.org.uk>
 <3067069.1763761171@warthog.procyon.org.uk>
 <20251121222309.GA3300186@google.com>
 <aSDnvNGos9qM2Uj5@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aSDnvNGos9qM2Uj5@wunner.de>

On Fri, Nov 21, 2025 at 11:29:16PM +0100, Lukas Wunner wrote:
> On Fri, Nov 21, 2025 at 10:23:09PM +0000, Eric Biggers wrote:
> > That list actually includes the same three files that use -EKEYREJECTED.
> > It looks like if the signature verification fails "early" it's -EBADMSG,
> > whereas if it fails "late" it's -EKEYREJECTED?
> 
> -EBADMSG denotes malformed data (e.g. incorrectly formatted ASN.1 payload).
> 
> -EKEYREJECTED denotes a well-formed, but incorrect signature (e.g. made
> by a wrong key).
> 
> I think it's important and useful to be able to differentiate that.

I guess.  The pseudocode in the ML-DSA specification is clear that
signature verification returns a boolean, regardless of whether the
signature is invalid due to the ctilde check, the coefficients of the
reponse vector being out of range, or the encoded hint vector being
malformed.  But if we really think it's useful we could disregard that
and use EKEYREJECTED for the ctilde check and EBADMSG for the other
cases.  I think that would align with what you're suggesting.  This is
inconsistent with the kernel's symmetric crypto code, but oh well.

- Eric

