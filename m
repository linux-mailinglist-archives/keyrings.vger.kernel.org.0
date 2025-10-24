Return-Path: <keyrings+bounces-3273-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECC3C07D5F
	for <lists+keyrings@lfdr.de>; Fri, 24 Oct 2025 21:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1C543BF34F
	for <lists+keyrings@lfdr.de>; Fri, 24 Oct 2025 19:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53CFF34D4F5;
	Fri, 24 Oct 2025 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CThPa4s0"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAD534D4EE;
	Fri, 24 Oct 2025 19:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761332654; cv=none; b=d0hhUnqi/w5MVPxdYeIYs//i8b2x2i7bwfnoelzKjvEN7RS9uKDfWuCAWE4lGNLSrkVdGmIAu0hisF+G8x0i5yDTXCDyXjFJN5t3nz0ZUVmI7gch/zoeGg373J/OZqy3JGyfZdc2pP0eKvfKVHfla3x5bM+G+WfZ7mEU6ADaz/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761332654; c=relaxed/simple;
	bh=5OHx+g8YoIqzlXMWXSG4M5gqkZw0P+ihv8h0OH2RW7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kh8aZ8a1cg0A1ubQidj1L9NMNaJuIuSkybh2wKX6kJt6WYip6+/H/NroIsAzYVuf2ov251UWa/ApT/Lmsl1xPY2UYez6knlpLW2BkPQRkRYe09v5uCh99rdcS6zwTJjmoc93aVYFPKf/KdsymoLTzmVOqenCiteR3sYL/F9in+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CThPa4s0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F392C4CEF1;
	Fri, 24 Oct 2025 19:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761332652;
	bh=5OHx+g8YoIqzlXMWXSG4M5gqkZw0P+ihv8h0OH2RW7Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CThPa4s0ODWejOicDfOlbkuKQZSxQRA9CGpWnTN7EeHmgI0Qw61usVe9xR1CxfaY5
	 65THjRN/qGKktWySFUMMA8WslJpjo1jF+jkdT86Lijpa/kBaM7HORHP/7r+o85AaHs
	 nahRJympom+M1zUwIlXMMHftgtBZfqJw8owGaEplO58piF/MfIDZo370wN3uVwOHH6
	 sFXpJIdRZSHnA9dhrM1lfGAkjCUXJ6PVZuJeeC45R1+2McXnhUbNahv7T/zphQGEm+
	 lt2SLu5PXWDyQq1ElOqmjc7ywhHoDllWauIeN7XAwGG7yiM4CWDKn1hinpvy/DXGXa
	 s2Q6vYRWWHbgA==
Date: Fri, 24 Oct 2025 22:04:08 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: Fix typos in 'struct key_type' function pointer
 comments
Message-ID: <aPvNqCRlMN5c8GaR@kernel.org>
References: <20251016123619.98728-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016123619.98728-2-thorsten.blum@linux.dev>

 On Thu, Oct 16, 2025 at 02:36:19PM +0200, Thorsten Blum wrote:
> s/it/if/ and s/revokation/revocation/
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  include/linux/key-type.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/key-type.h b/include/linux/key-type.h
> index 5caf3ce82373..5eb2e64803db 100644
> --- a/include/linux/key-type.h
> +++ b/include/linux/key-type.h
> @@ -107,11 +107,11 @@ struct key_type {
>  	 */
>  	int (*match_preparse)(struct key_match_data *match_data);
>  
> -	/* Free preparsed match data (optional).  This should be supplied it
> +	/* Free preparsed match data (optional).  This should be supplied if
>  	 * ->match_preparse() is supplied. */

The comment is also formatted incorrectly. It should be:

	/* 
	 * Free preparsed match data (optional).  This should be supplied if
	 * ->match_preparse() is supplied. 
	 */

>  	void (*match_free)(struct key_match_data *match_data);
>  
> -	/* clear some of the data from a key on revokation (optional)
> +	/* clear some of the data from a key on revocation (optional)
>  	 * - the key's semaphore will be write-locked by the caller
>  	 */

Ditto.

>  	void (*revoke)(struct key *key);
> -- 
> 2.51.0
> 

BR, Jarkko

