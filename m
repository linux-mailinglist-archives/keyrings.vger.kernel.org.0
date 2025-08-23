Return-Path: <keyrings+bounces-2977-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED167B32C8D
	for <lists+keyrings@lfdr.de>; Sun, 24 Aug 2025 01:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64C3B1896FCA
	for <lists+keyrings@lfdr.de>; Sat, 23 Aug 2025 23:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADB1245023;
	Sat, 23 Aug 2025 23:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UN63WCN2"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A372E192B7D;
	Sat, 23 Aug 2025 23:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755991547; cv=none; b=d1SFPgMSJm/9/b9uX9CvgSmklyUawbdyXzq0HUXQgsAKjAvoeFeW3xfFIa4QpOl1nkWIohykcSRJ3vsXzYh3DiuK46Xk6ukN/FmI4hxcG3p+aqXZ53ZleslMYxykh6fvxiTvM0nWKlORSkq1eNwtpB2QKl7MpxyMcBAgcZDM1y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755991547; c=relaxed/simple;
	bh=MRBVB/uTH2GsT4FPSoaIe96ENDogXURL6V1MIokoRl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sn1YPS7/SQz4SVrA5YdTvpzFv9nS+Z80axquQdl0RLXbhLwmm54rm3G/JReeupGotej8Qes74ECp8h3O5QjsH8/Tg+jr0r1FnOsK4BsO9rvDlxgx/UpN/rY5finRBzS4f7znpSg88NlPT71wMiKCKqs2G0q+k0kth6i9lUV1Kgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UN63WCN2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD912C4CEE7;
	Sat, 23 Aug 2025 23:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755991547;
	bh=MRBVB/uTH2GsT4FPSoaIe96ENDogXURL6V1MIokoRl0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UN63WCN2kw27T7gGnuB4QHlLXCzf7Bij+e8qVn25XqmWNDEDOxGIS/L7ddGl/A2E4
	 Bk6ZqQGT+tb7gsG6mM54198YKx9GCvgla7DDCGPdL2U3CCU882BIU0UjoUjGrJHmVM
	 drdlsZuAhjiIwzql32nUkzLPX4OnqFwGjDfpbDy9AbcoTbXkheZubeEQuEOrtIrAad
	 2LqHuxYGPEhGYPVWvwHhfjme2N1aubuaim++yQdlE53/wanoJ5f63b6h6JDRD+ztHr
	 Y/6Spe3ZCDSdGe1NbllYlgWU1ZMB3tWzoZfTHmFQ2NS5ldhOZ01hs5iNnORGmNBj6u
	 eTqE9W5yB3I7g==
Date: Sun, 24 Aug 2025 02:25:44 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] lib: Fix a couple of potential signed oveflows
Message-ID: <aKpN-NuTets9EExp@kernel.org>
References: <20250822142215.2475014-1-dhowells@redhat.com>
 <20250822142215.2475014-2-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822142215.2475014-2-dhowells@redhat.com>

On Fri, Aug 22, 2025 at 03:22:08PM +0100, David Howells wrote:
> Fix keyctl_read_alloc() to check for a potential unsigned overflow when we
> allocate a buffer with an extra byte added on the end for a NUL.
> 
> Fix keyctl_dh_compute_alloc() for the same thing.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
>  keyutils.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/keyutils.c b/keyutils.c
> index 37b6cc3..fd02cda 100644
> --- a/keyutils.c
> +++ b/keyutils.c
> @@ -18,6 +18,7 @@
>  #include <dlfcn.h>
>  #include <sys/uio.h>
>  #include <errno.h>
> +#include <limits.h>
>  #include <asm/unistd.h>
>  #include "keyutils.h"
>  
> @@ -442,6 +443,8 @@ int keyctl_read_alloc(key_serial_t id, void **_buffer)
>  		return -1;
>  
>  	for (;;) {
> +		if (ret == LONG_MAX)
> +			return -EFBIG; /* Don't let buflen+1 overflow. */
>  		buflen = ret;
>  		buf = malloc(buflen + 1);
>  		if (!buf)
> @@ -515,6 +518,8 @@ int keyctl_dh_compute_alloc(key_serial_t priv, key_serial_t prime,
>  	if (ret < 0)
>  		return -1;
>  
> +	if (ret == LONG_MAX)
> +		return -EFBIG; /* Don't let buflen+1 overflow. */
>  	buflen = ret;
>  	buf = malloc(buflen + 1);
>  	if (!buf)
> 


Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

