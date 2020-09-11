Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA1726630A
	for <lists+keyrings@lfdr.de>; Fri, 11 Sep 2020 18:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbgIKQJj (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 11 Sep 2020 12:09:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726306AbgIKQJZ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 11 Sep 2020 12:09:25 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C22CDC061573;
        Fri, 11 Sep 2020 09:09:24 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id a17so12024196wrn.6;
        Fri, 11 Sep 2020 09:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=kF3M0VHm/sZfXwfpUGn8gtMPq/WOXn1La3E2HQo2qRw=;
        b=VCEJZlPMh5mA2vGW4gRyTeLdCCDcyrkFNhS12DFsiIl5+rolnD1UiT/mAe/4gP7jGr
         hnVn0ci+b+dRkWITbUWPh8EFNvFUcOA0l0zDpSyh8Wj/2nmwtzL1ZWIGNrVtWcEvxakh
         a3ImdXgytvz4ocdSnmjHVdzakdA0AZ8z3VOzMmnPvtVocpDiuFowH/JOSsS2IUixcwIf
         VkNZzuEqwOyRY8bEwRe7npCOZIi0B5gkRLVJHBXHvh672gZY4rBLjX60FwG+dPQDc5v5
         9IfIsRl9P7cNxzO7dpoFS3D8XP5QC+UqO0IYMARNteCcKjSUgoFQUuiWZdV8zsg9ypNZ
         X2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=kF3M0VHm/sZfXwfpUGn8gtMPq/WOXn1La3E2HQo2qRw=;
        b=GDNefyjaofVl6H4mFXkSfa9USG9uhDH0qV2cMEQE0Zq0iob9zLnNKKmWj02G3miRK7
         34cAyw2U1c/rC8yGaW02h+eaB1ul126UN2WJh13iMMWes2HxdKoFLZ1+smsHOa6avzbt
         EXG27BHkfRv7crJqEo3ruOdFb+dJDoP8xXIxbwvTlbubuL2xc6AL6KeJqHB7YQcZZ9BK
         7HeNh0WuxXURkhqQ/lAwhuMEDyiy3gmh4Xc4lFZEuQB2oNlEmDkNYZnBGZigUFre6j9b
         EsGlznvRYBvtCrhePrHI5JbfJHbOfdb/ZVHW2BfogXIGaLDZcsRl6EEB9w4v8dFG7+os
         hXWQ==
X-Gm-Message-State: AOAM5336yXgxMYZ05JXtpEFj7TfObdjA1x/MwqHVEEppJIDj76FHadaH
        pQJpSHZr6qBk7xsibUpP69TcWk36JXc7PIDm
X-Google-Smtp-Source: ABdhPJwPSqvu2enCOLMILSViYbHAZKMDV0Qz699kBYQoxBPTIngm0AbKoSXr+gpWwdsHqKjeKG5nBA==
X-Received: by 2002:a5d:53d1:: with SMTP id a17mr2638483wrw.98.1599840562399;
        Fri, 11 Sep 2020 09:09:22 -0700 (PDT)
Received: from [192.168.0.18] (cpc83661-brig20-2-0-cust443.3-3.cable.virginm.net. [82.28.105.188])
        by smtp.gmail.com with ESMTPSA id b187sm5244540wmb.8.2020.09.11.09.09.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 09:09:21 -0700 (PDT)
Subject: Re: [PATCH] security: keys: Use kvfree_sensitive in a few places
To:     efremov@linux.com
Cc:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200911114400.82207-1-alex.dewar90@gmail.com>
 <f97076d2-de8a-4600-ee81-4cf4fcdc3ec1@linux.com>
From:   Alex Dewar <alex.dewar90@gmail.com>
Message-ID: <f0ac74e6-6e33-e736-494c-001e85327fdb@gmail.com>
Date:   Fri, 11 Sep 2020 17:09:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <f97076d2-de8a-4600-ee81-4cf4fcdc3ec1@linux.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 2020-09-11 17:05, Denis Efremov wrote:
> Hi,
>
> same patch
>
> https://lkml.org/lkml/2020/8/27/168
>
> Thanks,
> Denis
Ah ok. Sorry for the noise!
>
> On 9/11/20 2:44 PM, Alex Dewar wrote:
>> In big_key.c, there are a few places where memzero_explicit + kvfree is
>> used. It is better to use kvfree_sensitive instead, which is more
>> readable and also prevents the compiler from eliding the call to
>> memzero_explicit. Fix this.
>>
>> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
>> ---
>>   security/keys/big_key.c | 9 +++------
>>   1 file changed, 3 insertions(+), 6 deletions(-)
>>
>> diff --git a/security/keys/big_key.c b/security/keys/big_key.c
>> index 691347dea3c1..d17e5f09eeb8 100644
>> --- a/security/keys/big_key.c
>> +++ b/security/keys/big_key.c
>> @@ -121,8 +121,7 @@ int big_key_preparse(struct key_preparsed_payload *prep)
>>   		*path = file->f_path;
>>   		path_get(path);
>>   		fput(file);
>> -		memzero_explicit(buf, enclen);
>> -		kvfree(buf);
>> +		kvfree_sensitive(buf, enclen);
>>   	} else {
>>   		/* Just store the data in a buffer */
>>   		void *data = kmalloc(datalen, GFP_KERNEL);
>> @@ -140,8 +139,7 @@ int big_key_preparse(struct key_preparsed_payload *prep)
>>   err_enckey:
>>   	kfree_sensitive(enckey);
>>   error:
>> -	memzero_explicit(buf, enclen);
>> -	kvfree(buf);
>> +	kvfree_sensitive(buf, enclen);
>>   	return ret;
>>   }
>>   
>> @@ -273,8 +271,7 @@ long big_key_read(const struct key *key, char *buffer, size_t buflen)
>>   err_fput:
>>   		fput(file);
>>   error:
>> -		memzero_explicit(buf, enclen);
>> -		kvfree(buf);
>> +		kvfree_sensitive(buf, enclen);
>>   	} else {
>>   		ret = datalen;
>>   		memcpy(buffer, key->payload.data[big_key_data], datalen);
>>

