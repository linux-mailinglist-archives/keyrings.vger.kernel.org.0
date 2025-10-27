Return-Path: <keyrings+bounces-3280-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E60C114B9
	for <lists+keyrings@lfdr.de>; Mon, 27 Oct 2025 21:00:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1FA3560327
	for <lists+keyrings@lfdr.de>; Mon, 27 Oct 2025 19:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C9F31B80E;
	Mon, 27 Oct 2025 19:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KJvqHj6e"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D1E308F35;
	Mon, 27 Oct 2025 19:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761595082; cv=none; b=IS1NrOR1B0AeznaiEywoV99npLSPNdc8rsb28k4dl0Txugi5nzOaA4NxoGUIaFwOTxl60JFAX3URKS9k+zOD5Pab33jIQbUBZ9n1+l0p6Vg6LaW/7AW+UFovQNe8gvQ5EX8KvrFEnxSy6blZDYmjnUGFSlnGLTswCwXLfdycxdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761595082; c=relaxed/simple;
	bh=Ng03B/maD6lMR0eaS2eBOidLYRkO4OlY8lz6H+r3S1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhxyZCwentvhmtAAbZmw5bYEsJnpO/C/+AfRvv2tbKFx3qSFGlbek9M6LpCCnl6f/8Mm7eUS9NTAznB5VqGfEV76poRYAOQm6utUPW7F/Z8KbsHpGon8+V3GR3RHAkE+bdHsv5rxj9HNLEx6Px44GrqrcYHYUhXXYV5GpGWsDAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KJvqHj6e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED466C4CEF1;
	Mon, 27 Oct 2025 19:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761595080;
	bh=Ng03B/maD6lMR0eaS2eBOidLYRkO4OlY8lz6H+r3S1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KJvqHj6eCZIvK/j801mk6loSMVFfz+73xGSV9F/6C5GACsNIvN8j9wVhlD5iU8Fwm
	 GDuOZl4oKQHF0NxK2f9fjXBwhjIwFtJXuJ5EZbQufuYvythkjOczTP3fn422curGn8
	 X3hkvN1HHHf8/6zAVoF4TTP2CLmh94wRcHqzTofN0YrdNcABmAMyKAPQtbcxd5jq/q
	 E7YZmft5vKbQdd9pXln7+vgY18uSObfbUcFWFj2RPOYXP9sW4WEBcT/tW05nMDO9Z1
	 JsgiU17LcIJW5gV+MPIwdnyhTx5ZtNCI8fu5dL4QIppKgcy4lAyOx5syLevlS2JvDV
	 /VD3xjYfuoWkg==
Date: Mon, 27 Oct 2025 21:57:56 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] keys: Annotate struct asymmetric_key_id with __counted_by
Message-ID: <aP_OxDIHanHij4q2@kernel.org>
References: <20251023174810.75805-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023174810.75805-2-thorsten.blum@linux.dev>

On Thu, Oct 23, 2025 at 07:48:11PM +0200, Thorsten Blum wrote:
> Add the __counted_by() compiler attribute to the flexible array member
> 'data' to improve access bounds-checking via CONFIG_UBSAN_BOUNDS and
> CONFIG_FORTIFY_SOURCE.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  include/keys/asymmetric-type.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/keys/asymmetric-type.h b/include/keys/asymmetric-type.h
> index 69a13e1e5b2e..1b91c8f98688 100644
> --- a/include/keys/asymmetric-type.h
> +++ b/include/keys/asymmetric-type.h
> @@ -49,7 +49,7 @@ enum asymmetric_payload_bits {
>   */
>  struct asymmetric_key_id {
>  	unsigned short	len;
> -	unsigned char	data[];
> +	unsigned char	data[] __counted_by(len);
>  };
>  
>  struct asymmetric_key_ids {
> -- 
> 2.51.0
> 

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

