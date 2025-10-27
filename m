Return-Path: <keyrings+bounces-3283-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD8CC115B3
	for <lists+keyrings@lfdr.de>; Mon, 27 Oct 2025 21:17:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14695567084
	for <lists+keyrings@lfdr.de>; Mon, 27 Oct 2025 20:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 151D232C925;
	Mon, 27 Oct 2025 20:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjbPN3uR"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9C5321F5F;
	Mon, 27 Oct 2025 20:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761596001; cv=none; b=hiKUGS9+DzPH//MaKzDsUpuLw3rBFzUckV1LESwgABudYlQX4PFBLL71mZtnrUaZXENymLukTQHUX/U7hNCyS/uo+VElXCbX/73Ep7wEcjYKmzGkl173WpNnzRuRPtiqkcE8wTv6PTkC7FR824Ss3T0El6nmLfF4XEPwAhEN650=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761596001; c=relaxed/simple;
	bh=cWmHocblzK6HrbCInkBPidE1YaTRod4k9KFD2JoSyNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKjWrU9QmQyiSKTh9qqhNWYOVYR+m6smU0959kOWvHQ6VX/MwmZzzdqpHMA1eHPud0WnhgxPBIVxoPSOEms21YaAg73EIK9K6Wmgde0yZA5TKi3gwWy5rCTqqlZKs4Xv9lNuo+qmDDC7IUpRvoHMnSVfa2PaVVkR2H6RgUCHL6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjbPN3uR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7D7C113D0;
	Mon, 27 Oct 2025 20:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761596000;
	bh=cWmHocblzK6HrbCInkBPidE1YaTRod4k9KFD2JoSyNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjbPN3uReqMVb+iVO2VgAt0BGa5IdW7iGxflEswrsIWXBrKphqy+p2mxPY2XTjAKH
	 dnvqcg8Ppsf+5HqWHgynZy5whafA8H4loeWHd5+0/aBhefnligKvJgRW3vQNpNANDZ
	 yEos8Zbpysf1gZI1iwjnQcempTRuf5LRS1Wd4sYMwxyXWjkkBED6Y7Vho1I6TxDVaN
	 hTHullSMH81oPwzNd/Iecv+Hhsiqfp+gHOghCTLx26sgsmeQ6zZtfWd4c7cVzBygbK
	 SKlr/RwCb/+atHiP3lgbBIP6SGZvJAqqfpK+GwlwYiDtI8mGIVCwve0VOQpziRcTLX
	 VN0FkKBTOlaxQ==
Date: Mon, 27 Oct 2025 22:13:17 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] keys: Fix typos in 'struct key_type' function pointer
 comments
Message-ID: <aP_SXZq7TuYau4Kx@kernel.org>
References: <20251025095519.84361-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251025095519.84361-1-thorsten.blum@linux.dev>

On Sat, Oct 25, 2025 at 11:55:19AM +0200, Thorsten Blum wrote:
> s/it/if/ and s/revokation/revocation/ and adjust the formatting to be
> consistent with the other comments.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
> Changes in v2:
> - Adjust the trailing '*/' as suggested by Jarkko
> - Link to v1: https://lore.kernel.org/lkml/20251016123619.98728-2-thorsten.blum@linux.dev/
> ---
>  include/linux/key-type.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/key-type.h b/include/linux/key-type.h
> index 5caf3ce82373..5dfda728ff69 100644
> --- a/include/linux/key-type.h
> +++ b/include/linux/key-type.h
> @@ -107,11 +107,12 @@ struct key_type {
>  	 */
>  	int (*match_preparse)(struct key_match_data *match_data);
>  
> -	/* Free preparsed match data (optional).  This should be supplied it
> -	 * ->match_preparse() is supplied. */
> +	/* Free preparsed match data (optional).  This should be supplied if
> +	 * ->match_preparse() is supplied.
> +	 */
>  	void (*match_free)(struct key_match_data *match_data);
>  
> -	/* clear some of the data from a key on revokation (optional)
> +	/* clear some of the data from a key on revocation (optional)

A sentence starts with capital.

>  	 * - the key's semaphore will be write-locked by the caller

And end with preiod. It makes no to fix surgical issue in a source
code commit if you still leave it half broken.

>  	 */
>  	void (*revoke)(struct key *key);

Please address the comment format ie. have it.

/*
 * text

> -- 
> 2.51.0
> 

BR, Jarkko

