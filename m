Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A023F178C
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 12:53:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238337AbhHSKx6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Aug 2021 06:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237959AbhHSKx5 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 19 Aug 2021 06:53:57 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82812C061575
        for <keyrings@vger.kernel.org>; Thu, 19 Aug 2021 03:53:21 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id a21so5096616pfh.5
        for <keyrings@vger.kernel.org>; Thu, 19 Aug 2021 03:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=h4KO30BvVWuiGQptVgC51BO6IaUhsm/PFOqkXub0zOs=;
        b=qdBDfQ3KQ8bOclGbW+YW5iLXEbXFbaNA2jYCdJxlEmpZDDyTAIGXluu4zcw/lM9Qnp
         1/8mNapQvN5b9ytb2YRudIEw24n6777t0coWFgvmkWGN2FHxC3DHa2aWBF1FnWldG6hU
         8Z0+bdamP7zND5vrX4FAtMATsp9a5s1p0D8VH3qYZUPaYwe0j3o86CJ4ZNJDHEzK6hCW
         mDljIFR6G11Ets0juG53oEfIjZP0GaLW+G/CFrwE6BGZLfyJohGjIglQiyoR+Qta3CLp
         4lm+1mBE5dVuAQ1LEP63mV6yy9m4EzOxEITeEQ/iySAjNTNsnQ9af/Ayf5obtjJfnUy0
         ICKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h4KO30BvVWuiGQptVgC51BO6IaUhsm/PFOqkXub0zOs=;
        b=oximZU4NyTo0Se07wtFV3BlqnkwlsJ227m5qtOy/DWU7RtpqKhXZolrSKyklGugwo7
         MkOba2h0YtkaJhyMpUFutmzzxdEUHdGfJf2yFh0IkVuOfeaniY7YJlDNJWuib9YoA92n
         n05cmAbFfOUelLvAzXA1Xs4drk4FHr4k6FuFHr2uVXu949LYFgMlRE3K7EqPJWiJJufJ
         0leex7Z1FgEwfwqz56IBwM1gUuTKvlP2fXOjlc8vVSz1xzENra0rvMe5jB64Zr5uWFo2
         Kxpybpu5l/XkXdGmzdFyAvwAl/A8IbjVPv7CSAZVBSiy/RmUdB+yXBXe7UeWO463p6wq
         5wvA==
X-Gm-Message-State: AOAM531l30gUdvZpcrmq/pwNwsDKeUYvHlGhqUpktXlnoIouzmhNwisd
        AYXA1DhX71IgWuGf8zhty9sShQ==
X-Google-Smtp-Source: ABdhPJx7Cx0+w3t1VnEIYAFnOAtwgswFS8P0T8A5W04ehcDbeTPEkzsi01Ezbe2oOvGZB88G9/ekJQ==
X-Received: by 2002:a65:6805:: with SMTP id l5mr13823371pgt.0.1629370400929;
        Thu, 19 Aug 2021 03:53:20 -0700 (PDT)
Received: from [10.2.24.177] ([61.120.150.70])
        by smtp.gmail.com with ESMTPSA id c196sm3516747pga.92.2021.08.19.03.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 03:53:18 -0700 (PDT)
Subject: Re: Re: Re: PING: [PATCH] crypto: public_key: fix overflow during
 implicit conversion
To:     Jarkko Sakkinen <jarkko@kernel.org>, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210810063954.628244-1-pizhenwei@bytedance.com>
 <4dcd4254-030b-4489-d5d3-e320eb2953e7@bytedance.com>
 <74aef8a2f2331358371a87931e632287dad9af59.camel@iki.fi>
 <8bf3a04d-f1a7-cd8c-5c5a-ace3de500b2f@bytedance.com>
 <6db55147350d81ed205d37031d81b03b80f639cc.camel@kernel.org>
From:   zhenwei pi <pizhenwei@bytedance.com>
Message-ID: <7ae0836f-884b-e262-6ade-d0ca6ea0eb93@bytedance.com>
Date:   Thu, 19 Aug 2021 18:52:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6db55147350d81ed205d37031d81b03b80f639cc.camel@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 8/19/21 6:35 PM, Jarkko Sakkinen wrote:
> On Thu, 2021-08-19 at 10:03 +0800, zhenwei pi wrote:
>> On 8/18/21 8:33 PM, Jarkko Sakkinen wrote:
>>> On Wed, 2021-08-18 at 16:33 +0800, zhenwei pi wrote:
>>>> PING
>>>
>>> Please, do not top-post.
>>>
>>> You are lacking Herbert Xu:
>>>
>>> $ scripts/get_maintainer.pl crypto/asymmetric_keys/public_key.c
>>> David Howells <dhowells@redhat.com> (maintainer:ASYMMETRIC KEYS)
>>> Herbert Xu <herbert@gondor.apana.org.au> (maintainer:CRYPTO API)
>>> "David S. Miller" <davem@davemloft.net> (maintainer:CRYPTO API)
>>> keyrings@vger.kernel.org (open list:ASYMMETRIC KEYS)
>>> linux-crypto@vger.kernel.org (open list:CRYPTO API)
>>> linux-kernel@vger.kernel.org (open list)
>>>
>>>> On 8/10/21 2:39 PM, zhenwei pi wrote:
>>>>> Hit kernel warning like this, it can be reproduced by verifying
>>>>> 256
>>>>> bytes datafile by keyctl command.
>>>>>
>>>>>     WARNING: CPU: 5 PID: 344556 at crypto/rsa-pkcs1pad.c:540
>>>>> pkcs1pad_verify+0x160/0x190
>>>>>     ...
>>>>>     Call Trace:
>>>>>      public_key_verify_signature+0x282/0x380
>>>>>      ? software_key_query+0x12d/0x180
>>>>>      ? keyctl_pkey_params_get+0xd6/0x130
>>>>>      asymmetric_key_verify_signature+0x66/0x80
>>>>>      keyctl_pkey_verify+0xa5/0x100
>>>>>      do_syscall_64+0x35/0xb0
>>>>>      entry_SYSCALL_64_after_hwframe+0x44/0xae
>>>>>
>>>>> '.digest_size(u8) = params->in_len(u32)' leads overflow of an
>>>>> u8
>>>
>>> Where is this statement?
>>>
>>
>> In function "static int asymmetric_key_verify_signature(struct
>> kernel_pkey_params *params, const void *in, const void *in2)"
>>
>>>>> value,
>>>>> so use u32 instead of u8 of digest. And reorder struct
>>>>> public_key_signature, it could save 8 bytes on a 64 bit
>>>>> machine.
>>>                                                        ~~~~~
>>>                                                        64-bit
>>>                                                        
>>> What do you mean by "could"? Does it, or does it
>>> not?
>>>                                          				
>>> 	
>>>
>> After reordering struct public_key_signature, sizeof(struct
>> public_key_signature) gets smaller than the original version.
> 
> OK, then just state is as "it saves" instead of "it could save".
> 
> Not a requirement but have you been able to trigger this for a
> kernel that does not have this fix?
> 
This kernel warning can be reproduced on debian11(Linux-5.10.0-8-amd64) 
by the following script:

RAWDATA=rawdata
SIGDATA=sigdata

modprobe pkcs8_key_parser

rm -rf *.der *.pem *.pfx
rm -rf $RAWDATA
dd if=/dev/random of=$RAWDATA bs=256 count=1

openssl req -nodes -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem 
-subj "/C=CN/ST=GD/L=SZ/O=vihoo/OU=dev/CN=xx.com/emailAddress=yy@xx.com"

KEY_ID=`openssl pkcs8 -in key.pem -topk8 -nocrypt -outform DER | keyctl 
padd asymmetric 123 @s`

keyctl pkey_sign $KEY_ID 0 $RAWDATA enc=pkcs1 hash=sha1 > $SIGDATA
keyctl pkey_verify $KEY_ID 0 $RAWDATA $SIGDATA enc=pkcs1 hash=sha1


> /Jarkko
> 

-- 
zhenwei pi
