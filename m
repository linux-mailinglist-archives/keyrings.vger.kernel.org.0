Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44A231FE39
	for <lists+keyrings@lfdr.de>; Fri, 19 Feb 2021 18:49:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbhBSRsK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 19 Feb 2021 12:48:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:39196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229527AbhBSRsJ (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 19 Feb 2021 12:48:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFD3964E15;
        Fri, 19 Feb 2021 17:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613756849;
        bh=m6rAWAFgOM3ef0SD8I84idRS7AgJL+jWbMk1gCQij+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bGHuD922XC1b45O1tiaggLTuMTRp7NKr7H1mV4tmsmPqeQr4B2pw2FVTl9kmO9MHF
         xGROBgGp1QL6pu43GCxIyU/02C3EERLfWmpSxCyexdKsAXpPJh2FHwD+p+34tFKOw7
         8a433nSSRoFXaSMSKA0xuu8mrHxOq4cydZw/Qh7/NiPD4ofijUxSpwoidpWHVZnwao
         Y57cxop8pYJzwcQneiL3e+pDahWhNBdX7MUNvi6uwrnprnquULBpuS/AVHTkPdxC9/
         pdtBMNeQXUy5b2i4M8wUCqLSMRrCxPG2bO5KeEddECdZs8oA7gbSgXilwDc0upM9HL
         o8r+f2mFf1cVQ==
Date:   Fri, 19 Feb 2021 19:47:14 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     Lukas Bulwahn <lukas.bulwahn@gmail.com>, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        mchehab+huawei@kernel.org, linux-doc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] watch_queue: rectify kernel-doc for init_watch()
Message-ID: <YC/5ojC2fwkY5Y9T@kernel.org>
References: <161373161298.2157082.10755433120775444271.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161373161298.2157082.10755433120775444271.stgit@warthog.procyon.org.uk>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Feb 19, 2021 at 10:46:53AM +0000, David Howells wrote:
> From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> 
> The command './scripts/kernel-doc -none kernel/watch_queue.c'
> reported a mismatch in the kernel-doc of init_watch().
> 
> Rectify the kernel-doc, such that no issues remain for watch_queue.c.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: David Howells <dhowells@redhat.com>
> Link: https://lore.kernel.org/lkml/20210125161409.8478-1-lukas.bulwahn@gmail.com
> ---
> 
>  kernel/watch_queue.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/kernel/watch_queue.c b/kernel/watch_queue.c
> index 0ef8f65bd2d7..9c9eb20dd2c5 100644
> --- a/kernel/watch_queue.c
> +++ b/kernel/watch_queue.c
> @@ -413,7 +413,7 @@ static void put_watch(struct watch *watch)
>  }
>  
>  /**
> - * init_watch_queue - Initialise a watch
> + * init_watch - Initialise a watch
>   * @watch: The watch to initialise.
>   * @wqueue: The queue to assign.
>   *
> 
> 
> 

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

/Jarkko
