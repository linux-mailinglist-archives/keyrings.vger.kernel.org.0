Return-Path: <keyrings+bounces-1620-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01645909BC1
	for <lists+keyrings@lfdr.de>; Sun, 16 Jun 2024 08:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26ED41C212D4
	for <lists+keyrings@lfdr.de>; Sun, 16 Jun 2024 06:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7EF16C87A;
	Sun, 16 Jun 2024 06:06:50 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2620C125;
	Sun, 16 Jun 2024 06:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718518010; cv=none; b=N/u1MafEPCroqWNB430ebFzBqLYaLTSM6HPpZ8OuyjMcV45oluKCrqBSWabw5d3LW2GmwRYeIw5u23DED6b6F9ROarwd0WefkMnAfKO0XhAEBcaaLlXdoLA+hBKeM0o9W7HY1XEdzaP3LMERr5TxJp6q8Yndd1s1AiqkvM3wzGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718518010; c=relaxed/simple;
	bh=0GniDaCbdr/ZlowgX9D1bPurm9iKq+3wiB/TrWq0L2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTtj5K7r2NnOJj+MHQp7WkvjDI0EguLiJXe3+D/2jInWfkkyDNfbbQ4RHzZtlnvKGOSR7VqwW25gdwM3VinBvSI+LOfNKAcx/bn/AikdaD+H6X2aYr4fdQVDXU/vyQRJqchFAMOiZUniWTGzsaugAKFmLTvv8zjvL7azObJK9ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1sIivF-000aPg-17;
	Sun, 16 Jun 2024 13:59:26 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 16 Jun 2024 13:59:25 +0800
Date: Sun, 16 Jun 2024 13:59:25 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	davem@davemloft.net, linux-kernel@vger.kernel.org,
	jarkko@kernel.org,
	Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Subject: Re: [PATCH] crypto: ecc - Fix off-by-one missing to clear most
 significant digit
Message-ID: <Zm5_PWhbE49tcUbH@gondor.apana.org.au>
References: <20240613213820.995832-1-stefanb@linux.ibm.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613213820.995832-1-stefanb@linux.ibm.com>

On Thu, Jun 13, 2024 at 05:38:20PM -0400, Stefan Berger wrote:
> Fix an off-by-one error where the most significant digit was not
> initialized leading to signature verification failures by the testmgr.
> 
> Example: If a curve requires ndigits (=9) and diff (=2) indicates that
> 2 digits need to be set to zero then start with digit 'ndigits - diff' (=7)
> and clear 'diff' digits starting from there, so 7 and 8.
> 
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
> Closes: https://lore.kernel.org/linux-crypto/619bc2de-b18a-4939-a652-9ca886bf6349@linux.ibm.com/T/#m045d8812409ce233c17fcdb8b88b6629c671f9f4
> Fixes: 2fd2a82ccbfc ("crypto: ecdsa - Use ecc_digits_from_bytes to create hash digits array")
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>  crypto/ecc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

