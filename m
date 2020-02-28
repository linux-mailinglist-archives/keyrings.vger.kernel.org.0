Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5C49172F57
	for <lists+keyrings@lfdr.de>; Fri, 28 Feb 2020 04:30:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730665AbgB1DaL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 27 Feb 2020 22:30:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:37020 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730646AbgB1DaL (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 27 Feb 2020 22:30:11 -0500
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B4BB624692;
        Fri, 28 Feb 2020 03:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582860610;
        bh=4c+O6G9OMu/m0Gi0xOTLhOzzXMZCqiN4q++HQSglC8o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Atk/gVJdPn9aLY/1rAo1oWjeZB9HXdM25i2YRJnLLEIUFcZCsd0c9o2zPmnRXNiNP
         uWvncL2Thckjthv2Hr4pmRDwJyMObTdTHg1GTWaVg/sUVSkAb5LTXZF3G7a9z98geq
         GGHVudsv3A5Y3LLUUzALVPQ3S6yF6nNGA9yp9tr8=
Date:   Thu, 27 Feb 2020 19:30:09 -0800
From:   Eric Biggers <ebiggers@kernel.org>
To:     Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Cc:     jarkko.sakkinen@linux.intel.com, keyrings@vger.kernel.org
Subject: Re: [PATCH v2] KEYS: reaching the keys quotas(max_bytes) correctly
Message-ID: <20200228033009.GA932@sol.localdomain>
References: <20200227162623.GG5140@linux.intel.com>
 <1582857177-29093-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1582857177-29093-1-git-send-email-xuyang2018.jy@cn.fujitsu.com>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Feb 28, 2020 at 10:32:57AM +0800, Yang Xu wrote:
> Currently, when we add a new user key, the calltrace as below:
> 
> add_key()
>   key_create_or_update()
>     key_alloc()
>     __key_instantiate_and_link
>       generic_key_instantiate
>         key_payload_reserve
>           ......
> 
> Since commit a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly"),
> we can reach max bytes/keys in key_alloc, but we forget to remove this
> limit when we reserver space for payload in key_payload_reserve. So we
> can only reach max keys but not max bytes when having delta between plen
> and type->def_datalen. Remove this limit when instantiating the key, so we
> can keep consistent with key_alloc.
> 
> Fixes: a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")
> Cc: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
> ---
>  security/keys/key.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/security/keys/key.c b/security/keys/key.c
> index 718bf7217420..e959b3c96b48 100644
> --- a/security/keys/key.c
> +++ b/security/keys/key.c
> @@ -382,7 +382,7 @@ int key_payload_reserve(struct key *key, size_t datalen)
>  		spin_lock(&key->user->lock);
>  
>  		if (delta > 0 &&
> -		    (key->user->qnbytes + delta >= maxbytes ||
> +		    (key->user->qnbytes + delta > maxbytes ||
>  		     key->user->qnbytes + delta < key->user->qnbytes)) {
>  			ret = -EDQUOT;
>  		}

This looks good, but I see that both of us forgot to update keyctl_chown_key().
Can you handle that too?

You could also use two Fixes tags:

    Fixes: 0b77f5bfb45c ("keys: make the keyring quotas controllable through /proc/sys")
    Fixes: a08bf91ce28e ("KEYS: allow reaching the keys quotas exactly")

... to make it clearer that this is fixing an incomplete fix for the original
bug, as opposed to fixing a regression.

- Eric
