Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C78763F102F
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 04:04:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235618AbhHSCFT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Aug 2021 22:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235567AbhHSCFS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Aug 2021 22:05:18 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C6EC061764
        for <keyrings@vger.kernel.org>; Wed, 18 Aug 2021 19:04:43 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id j12-20020a17090aeb0c00b00179530520b3so10322925pjz.0
        for <keyrings@vger.kernel.org>; Wed, 18 Aug 2021 19:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=BOxUoQivjgFZ1DLgZNdPrhR+Bg8R8i8R1VkSNL8IUig=;
        b=FMDMJuSUoxzv2j2BjBXZdfACsrSN4wx7jPmQuppjrKGGhDIoyhGPzQi4jow3zQApfV
         sExsGeDHmjzzHqimerdbHVXnsvK62jw14eJSjjM8ptwyp53X0Pk/SJIZzx7cZ30J2VIj
         zypkx+SADaWkWjGdTxlPxb5sRGSEQL4Fr+oaUg9EBvCQUM32BlgKOK8g/vEEAb179uZX
         fw1S61dcsgNWV2M1/fj/BdCZudO846By6xhBufZxS5UfSpBXQm4/6ukpnyEeVu6pYOGa
         L648ej+yvZy1lR3FFSqmbBKCjrhv6mVreSn+1RGjI0Aqvy0J2Ubo7rfz7TrbsyDnR+Bu
         SIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BOxUoQivjgFZ1DLgZNdPrhR+Bg8R8i8R1VkSNL8IUig=;
        b=HDrfApZ0Nl3NvkS/qgIdpFySuxq69I28XVKKVSDtbSwMqaSIvht9aBfvQOIVnDt3E3
         XU7wKMHfg/ee2ATmjtIjXa7PDG5kvbaCCaWUwmA0MK9YjkVVPF/K98FSVyRtD1Av6GC6
         UzrHj2C50ghwFIMV8BLcQy3yS815I/pobOCt+g2Ac7oXYp0/3d1G28Pz4I1xXHM1FMGc
         DINRZgMaVXV6df00wLM8cZ8+B0rqP/oh8TI3ZpU6dMoiC4ds/2bJdEbjATbrE1Gr+z66
         f8Y3JiK6rh/x5yiM9Klosq+aLcprvNx5reoGX22nEe/S8cSTN1N7aZAHvso3GZeSpRob
         wH7A==
X-Gm-Message-State: AOAM530LfGrv4RhqbQpSiU6mDlHS7Ul7pW1sZCrigiJpJCOa8xRKPNIJ
        ahV0mU0M6LnIuAhrkjIttn/dsQ==
X-Google-Smtp-Source: ABdhPJynUCx+JXpaZSG119iXqCmKTow+CkUyVO/V/bIlaBAxFzTXpQl8K6D/1St/I9rCpmAqVk2Blw==
X-Received: by 2002:a17:90a:d3d2:: with SMTP id d18mr12526374pjw.102.1629338682812;
        Wed, 18 Aug 2021 19:04:42 -0700 (PDT)
Received: from [10.2.24.177] ([61.120.150.70])
        by smtp.gmail.com with ESMTPSA id y3sm1285397pgc.67.2021.08.18.19.04.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Aug 2021 19:04:42 -0700 (PDT)
Subject: Re: Re: PING: [PATCH] crypto: public_key: fix overflow during
 implicit conversion
To:     Jarkko Sakkinen <jarkko.sakkinen@iki.fi>, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210810063954.628244-1-pizhenwei@bytedance.com>
 <4dcd4254-030b-4489-d5d3-e320eb2953e7@bytedance.com>
 <74aef8a2f2331358371a87931e632287dad9af59.camel@iki.fi>
From:   zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <8bf3a04d-f1a7-cd8c-5c5a-ace3de500b2f@bytedance.com>
Date:   Thu, 19 Aug 2021 10:03:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <74aef8a2f2331358371a87931e632287dad9af59.camel@iki.fi>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 8/18/21 8:33 PM, Jarkko Sakkinen wrote:
> On Wed, 2021-08-18 at 16:33 +0800, zhenwei pi wrote:
>> PING
> 
> Please, do not top-post.
> 
> You are lacking Herbert Xu:
> 
> $ scripts/get_maintainer.pl crypto/asymmetric_keys/public_key.c
> David Howells <dhowells@redhat.com> (maintainer:ASYMMETRIC KEYS)
> Herbert Xu <herbert@gondor.apana.org.au> (maintainer:CRYPTO API)
> "David S. Miller" <davem@davemloft.net> (maintainer:CRYPTO API)
> keyrings@vger.kernel.org (open list:ASYMMETRIC KEYS)
> linux-crypto@vger.kernel.org (open list:CRYPTO API)
> linux-kernel@vger.kernel.org (open list)
> 
>> On 8/10/21 2:39 PM, zhenwei pi wrote:
>>> Hit kernel warning like this, it can be reproduced by verifying 256
>>> bytes datafile by keyctl command.
>>>
>>>    WARNING: CPU: 5 PID: 344556 at crypto/rsa-pkcs1pad.c:540
>>> pkcs1pad_verify+0x160/0x190
>>>    ...
>>>    Call Trace:
>>>     public_key_verify_signature+0x282/0x380
>>>     ? software_key_query+0x12d/0x180
>>>     ? keyctl_pkey_params_get+0xd6/0x130
>>>     asymmetric_key_verify_signature+0x66/0x80
>>>     keyctl_pkey_verify+0xa5/0x100
>>>     do_syscall_64+0x35/0xb0
>>>     entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>
>>> '.digest_size(u8) = params->in_len(u32)' leads overflow of an u8
> 
> Where is this statement?
> 

In function "static int asymmetric_key_verify_signature(struct 
kernel_pkey_params *params, const void *in, const void *in2)"

>>> value,
>>> so use u32 instead of u8 of digest. And reorder struct
>>> public_key_signature, it could save 8 bytes on a 64 bit machine.
>                                                       ~~~~~
>                                                       64-bit
>                                                       
> What do you mean by "could"? Does it, or does it
> not?
>                                         					
> 
After reordering struct public_key_signature, sizeof(struct 
public_key_signature) gets smaller than the original version.
	  								
> 									
> 		
> 
>>>
>>> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
> 
> Nit: "Firstname Lastname" (first letters capitalized)
> 
>>> ---
>>>    include/crypto/public_key.h | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/crypto/public_key.h
>>> b/include/crypto/public_key.h
>>> index 47accec68cb0..f603325c0c30 100644
>>> --- a/include/crypto/public_key.h
>>> +++ b/include/crypto/public_key.h
>>> @@ -38,9 +38,9 @@ extern void public_key_free(struct public_key
>>> *key);
>>>    struct public_key_signature {
>>>    	struct asymmetric_key_id *auth_ids[2];
>>>    	u8 *s;			/* Signature */
>>> -	u32 s_size;		/* Number of bytes in signature */
>>>    	u8 *digest;
>>> -	u8 digest_size;		/* Number of bytes in digest */
>>> +	u32 s_size;		/* Number of bytes in signature */
>>> +	u32 digest_size;	/* Number of bytes in digest */
>>>    	const char *pkey_algo;
>>>    	const char *hash_algo;
>>>    	const char *encoding;
>>>
> 
> /Jarkko
> 

-- 
zhenwei pi
