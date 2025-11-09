Return-Path: <keyrings+bounces-3312-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0386AC43860
	for <lists+keyrings@lfdr.de>; Sun, 09 Nov 2025 05:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5BC7F346FAC
	for <lists+keyrings@lfdr.de>; Sun,  9 Nov 2025 04:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32ECF3D994;
	Sun,  9 Nov 2025 04:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BTVTBHuT"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FA729A1;
	Sun,  9 Nov 2025 04:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762663027; cv=none; b=Mtz+R5+fpNfBQnBo4bf9j/QRJZv3Qm8ywUGGpDF2e0xmbvuOpzN9Zn4OpHC7R9MyUDbRyqlZo+kkzybhY68AnvNnixq3zgJDd+RE0X5MA3ED3HWsbnD+ezkjtu+DQX9/6WN3G8dyn6CbOaCzlSv64ZC6r+1VQyx0tj3ZR8MTV54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762663027; c=relaxed/simple;
	bh=JoxMDa+4HgV3beWyKgaRrYff5xzpCh4MsyKdXH6IvM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPIgijOLpF9JOVV5c2+zsqKdVAIOoHXc+1/PACrGe5K4WNWTLpQP2R7CIX8KwFiTdMRYYhQu7+USQUDCvNPj/oW8j0SoQhWWDnBrGhHdI8G0QuCOzr+/AVk0olJ2e98M9b2UZ6OvSKTvJOrsnrUsMfGVO9TAH7JTP4ZW1YPvx1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BTVTBHuT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24CC3C19425;
	Sun,  9 Nov 2025 04:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762663026;
	bh=JoxMDa+4HgV3beWyKgaRrYff5xzpCh4MsyKdXH6IvM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BTVTBHuTSMMPtV0sESIPs7SxDGnrvLsqjpDkH7TlP1i5HmlEOyWYlDi9ctwE3eI2F
	 FnRwukMVmRagdEc2aF/+Gwz6V/EgKPXkB+Fr/wuBQXXbSX3P0WmdjkNoCtOKcP0Bac
	 orXcaTTrv3vDmI/J1/S6flHrbJeULBJ5pWpR7MGcpd1ztGNrB3SAZ9f0vb8QlbD4Ho
	 eUM2jU0JQLzGNVggKSMYjh+Qii+K1CD35DeYV4YtDEUUZ2rmXsCGLqF0tTDw/9j+0a
	 BMHpRLBiaS+4FcAfHSdXfM4mHMGZqNzwUMv0vQxf6LOHsDcaLVJM6UFgGm4mWRVgkU
	 RFnkHSLYDFlwA==
Date: Sun, 9 Nov 2025 06:37:02 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] keys: Fix grammar and formatting in 'struct key_type'
 comments
Message-ID: <aRAabhvp7tweVqNf@kernel.org>
References: <20251027223259.190625-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027223259.190625-2-thorsten.blum@linux.dev>

On Mon, Oct 27, 2025 at 11:33:00PM +0100, Thorsten Blum wrote:
> s/it/if/ and s/revokation/revocation/, capitalize "clear", and add a
> period after the sentence. Fix the comment formatting.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v3:
> - Capitalize "clear", add a period, and fix comment formatting (Jarkko)
> - Link to v2: https://lore.kernel.org/lkml/20251025095519.84361-1-thorsten.blum@linux.dev/
> 
> Changes in v2:
> - Adjust the trailing '*/' as suggested by Jarkko
> - Link to v1: https://lore.kernel.org/lkml/20251016123619.98728-2-thorsten.blum@linux.dev/
> ---
>  include/linux/key-type.h | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/key-type.h b/include/linux/key-type.h
> index 5caf3ce82373..bb97bd3e5af4 100644
> --- a/include/linux/key-type.h
> +++ b/include/linux/key-type.h
> @@ -107,11 +107,14 @@ struct key_type {
>  	 */
>  	int (*match_preparse)(struct key_match_data *match_data);
>  
> -	/* Free preparsed match data (optional).  This should be supplied it
> -	 * ->match_preparse() is supplied. */
> +	/*
> +	 * Free preparsed match data (optional).  This should be supplied if
> +	 * ->match_preparse() is supplied.
> +	 */
>  	void (*match_free)(struct key_match_data *match_data);
>  
> -	/* clear some of the data from a key on revokation (optional)
> +	/*
> +	 * Clear some of the data from a key on revocation (optional).
>  	 * - the key's semaphore will be write-locked by the caller
>  	 */
>  	void (*revoke)(struct key *key);
> -- 
> 2.51.0
> 

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

