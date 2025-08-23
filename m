Return-Path: <keyrings+bounces-2978-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8906FB32C9F
	for <lists+keyrings@lfdr.de>; Sun, 24 Aug 2025 01:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E18A77AC79B
	for <lists+keyrings@lfdr.de>; Sat, 23 Aug 2025 23:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B344924BD1A;
	Sat, 23 Aug 2025 23:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqG90Svv"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CF278F2F;
	Sat, 23 Aug 2025 23:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755993579; cv=none; b=JA19pE+hzpaiyRJlxbHJ14J0MR/euemnyvZfIND3qZFU7QtTz6QVG2opcQYgDNjY80D+CNxoWvT3j+UwFNlaIdiPC+W88PQEx3sn+mBQyMp2HQXen2B3KqGn5tMUPljexM6VMEJ5sHa4dk80FHei4jCP8ZgIHM5CxsAMPgbONXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755993579; c=relaxed/simple;
	bh=j7KLObljEjjoKBQlwCJyWsEPhICNs2Hg847qzEF9ghk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlzUhs097MkU++pD+UfjoLmSxWEPIIpuFWzNlH2cPD06Tp0iXegIX3aATqdvmLXlfUolF36988BYC0pY+oGuCWhuJ0iBiisX5F/7Sb8bgnD2DJ0FWcClH35Pe05ACY7dvLlUevP44T8A6tePm/xzTB5KgfPAlgPRxRHJu76XaGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqG90Svv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A66AC4CEE7;
	Sat, 23 Aug 2025 23:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755993576;
	bh=j7KLObljEjjoKBQlwCJyWsEPhICNs2Hg847qzEF9ghk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqG90SvvsksRX39LwQSU94bZ9lyJ2Q7gjLrGjLCFvVPUOy8KyCHLCqGM3EMErw8C6
	 RtN+cFYGvfL00VmGMpIg4ipXy0m/o5vknPJY+hEwraRILTatIhwqnbIRZ17/9+Al8s
	 PYxSO4+ujevVCi0VmBpUGaOl0wDZov366WnZx63rjL0sBWo2INZIeE8Yk/uwBrFJj6
	 sqDWD9a+cq7BOIL35xLVHodukiXNc7aRX+hhamdMsfDnZHoS8u2ektf5AxxeRcDh6K
	 pPC2WTPVQWJ0+4qu76qaasoEWYt/+I123g2zJWxb7ETkRzngBEHlmvkS7HCLcC3Clo
	 D3KyrPiEsbErg==
Date: Sun, 24 Aug 2025 02:59:33 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] request-key: Fix mishandling of last line of config
 file
Message-ID: <aKpV5fk5X-plntzk@kernel.org>
References: <20250822142215.2475014-1-dhowells@redhat.com>
 <20250822142215.2475014-3-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822142215.2475014-3-dhowells@redhat.com>

On Fri, Aug 22, 2025 at 03:22:09PM +0100, David Howells wrote:
> Fix mishandling of the config file by /sbin/request-key whereby the last
> line of a file, if it is lacking a newline, will trim off the last
> character and then try and use that.  Return an error instead if we find a
> line without a newline char at the end.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> ---
>  request-key.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/request-key.c b/request-key.c
> index bf47c0a..d1feec3 100644
> --- a/request-key.c
> +++ b/request-key.c
> @@ -367,6 +367,8 @@ static void scan_conf_file(struct parameters *params, int dirfd, const char *con
>  		/* ignore blank lines and comments */
>  		if (len == 1 || buf[0] == '#' || isspace(buf[0]))
>  			continue;
> +		if (len == 0 || buf[len - 1] != '\n')
> +			line_error("Line missing newline\n");
>  
>  		buf[--len] = 0;
>  		p = buf;
> 

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Looks good to me. And the next question is not directly related to
this patch per se.

Just a hypothetical question. What if for spurious reasons the config
file would have carriage returns?

BR, Jarkko

