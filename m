Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDE381D2DBD
	for <lists+keyrings@lfdr.de>; Thu, 14 May 2020 13:00:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726050AbgENLAv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 14 May 2020 07:00:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgENLAv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 14 May 2020 07:00:51 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8810C061A0C;
        Thu, 14 May 2020 04:00:50 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id g11so1047424plp.1;
        Thu, 14 May 2020 04:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nCYPouTEVyWrjV4/wzLJ8vCaI1yhsCtPiVNPnd+kwzY=;
        b=d6iEM7ilJpB0RC/oDT2/jP0WB8ov8gQwbG6gKgnKwMaZ3zXfKVUwX34q0+kx7GEuNE
         gN/yYPZX1Px1GaWlo0R/OoJithp9aagA7F6+fuxJB/Oa0oqRdX39+6haVgesVb3iKQ7K
         095Uq60lc0ZnqC95QDpvfggj3K31e6LAJKP4N2laHhCjqpUSfY+CH5wbdbiEEaUoo08W
         8g4SDDwQuCYYLJXk95qx/eJQsX3gxs9H9ZzbUq5rIi6nFAC73Hue/j/VFicam4JEb8Tt
         FdXkyHhA+lZ6m5YsY/Iuo48OmoIx6TsD/Kzu+oTy/fMry9r5wY1CsvYBYh/ldQltFgOu
         SDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nCYPouTEVyWrjV4/wzLJ8vCaI1yhsCtPiVNPnd+kwzY=;
        b=m3lJCKOD1/XjWkh/nzTKno5DVLA0C7grQGIICnQ7d0dZ4XuDLVbSdrtcfLPWGaXrgC
         MUq2Qw7OZlDsOwSCuTmAt4/bWgQHoudZh8ygCnAfOdCe5gsNi19xeabC/lyrvSJpNxo1
         06bU3FjU7w3LXRSk8N9pE7ffhUhB5jEWS/jp2uXew7Q5Uio4wJqXft/bzoQacgccKYgN
         mpQ5fR9xZo1SZqnNq/UV+D3mx87J8PTAHwx1vMK67kEV7CFA231zjPqf0Fi/VaXi/mHo
         rGbdFBq9QgqA8tJjHk+YximLz5ZhF9bBgVGnniw9am4+E0aBDis9jluG6UL9O4RR38M+
         4qQw==
X-Gm-Message-State: AOAM531B/BPrqGTYUC9P3ZXe7z8GP1aNIAV2V37TBtV59UMhLOtTOGLD
        kXrA0YPsGx+CVsjfQfIL2kE=
X-Google-Smtp-Source: ABdhPJwJCqf2FDczWBK+N+5lUukXOnTYsn/cActeavqnFJs7IEpwz/686zyZKMuQew8MweFQuzXfPw==
X-Received: by 2002:a17:90a:6301:: with SMTP id e1mr1489251pjj.183.1589454049998;
        Thu, 14 May 2020 04:00:49 -0700 (PDT)
Received: from [192.168.68.125] ([210.185.116.244])
        by smtp.gmail.com with ESMTPSA id i10sm2105025pfa.166.2020.05.14.04.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2020 04:00:47 -0700 (PDT)
Subject: Re: [PATCH v3] mm: Add kvfree_sensitive() for freeing sensitive data
 objects
To:     Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Cc:     linux-mm@kvack.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>
References: <20200407200318.11711-1-longman@redhat.com>
From:   Balbir Singh <bsingharora@gmail.com>
Message-ID: <1158ff38-c65d-379f-8ae7-6f507d9fc8dd@gmail.com>
Date:   Thu, 14 May 2020 21:00:40 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200407200318.11711-1-longman@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


On 8/4/20 6:03 am, Waiman Long wrote:
> For kvmalloc'ed data object that contains sensitive information like
> cryptographic key, we need to make sure that the buffer is always
> cleared before freeing it. Using memset() alone for buffer clearing may
> not provide certainty as the compiler may compile it away. To be sure,
> the special memzero_explicit() has to be used.
> 
> This patch introduces a new kvfree_sensitive() for freeing those
> sensitive data objects allocated by kvmalloc(). The relevnat places
> where kvfree_sensitive() can be used are modified to use it.
> 
> Fixes: 4f0882491a14 ("KEYS: Avoid false positive ENOMEM error on key read")
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  include/linux/mm.h       |  1 +
>  mm/util.c                | 18 ++++++++++++++++++
>  security/keys/internal.h | 11 -----------
>  security/keys/keyctl.c   | 16 +++++-----------
>  4 files changed, 24 insertions(+), 22 deletions(-)
> 
>  [v3: Fix kerneldoc errors]
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 7dd5c4ccbf85..9b3130b20f42 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -757,6 +757,7 @@ static inline void *kvcalloc(size_t n, size_t size, gfp_t flags)
>  }
>  
>  extern void kvfree(const void *addr);
> +extern void kvfree_sensitive(const void *addr, size_t len);
>  
>  static inline int compound_mapcount(struct page *page)
>  {
> diff --git a/mm/util.c b/mm/util.c
> index 988d11e6c17c..dc1c877d5481 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -604,6 +604,24 @@ void kvfree(const void *addr)
>  }
>  EXPORT_SYMBOL(kvfree);
>  
> +/**
> + * kvfree_sensitive - Free a data object containing sensitive information.
> + * @addr: address of the data object to be freed.
> + * @len: length of the data object.
> + *
> + * Use the special memzero_explicit() function to clear the content of a
> + * kvmalloc'ed object containing sensitive data to make sure that the
> + * compiler won't optimize out the data clearing.
> + */
> +void kvfree_sensitive(const void *addr, size_t len)
> +{
> +	if (likely(!ZERO_OR_NULL_PTR(addr))) {
> +		memzero_explicit((void *)addr, len);
> +		kvfree(addr);
> +	}
> +}
> +EXPORT_SYMBOL(kvfree_sensitive);
> +

I wonder if the right thing to do is also to disable pre-emption, just so that the thread does not linger on with sensitive data.

void kvfree_sensitive(const void *addr, size_t len)
{
	preempt_disable();
	if (likely(!ZERO_OR_NULL_PTR(addr))) {
		memzero_explicit((void *)addr, len);
		kvfree(addr);
	}
	preempt_enable();
}
EXPORT_SYMBOL(kvfree_sensitive);



Balbir Singh.
