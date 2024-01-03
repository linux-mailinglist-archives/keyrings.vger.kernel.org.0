Return-Path: <keyrings+bounces-388-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F23C823028
	for <lists+keyrings@lfdr.de>; Wed,  3 Jan 2024 16:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A2A02862D1
	for <lists+keyrings@lfdr.de>; Wed,  3 Jan 2024 15:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62C121A713;
	Wed,  3 Jan 2024 15:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3WTKoqa"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F741A704
	for <keyrings@vger.kernel.org>; Wed,  3 Jan 2024 15:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3bbc649c275so3053188b6e.0
        for <keyrings@vger.kernel.org>; Wed, 03 Jan 2024 07:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704294058; x=1704898858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6OEWxALkMu3u+cExaprmsBqW1bk06nrav/J91dqy0hU=;
        b=h3WTKoqa5J6QAT9n1KvlUjif2RIwuWIfw2lxoi66zdHZ/+JsjEDwYG1JeotaruowGN
         QofQi2n88ZeX4M5WzonGItzbSeevrrT6purTAw5U48rY/jcG0XkQ/hLEA7RkYrY+FTwx
         cAxILgTHxpMcPlqyYsTM68maxncGO6WEyUOCicCHKYpOz/2qXGtPwMC5PaSZbYLOcMuS
         f7bp9u3TFnZ4T72+X5CKHCO0Q5O1wDZx6D0vht4H+YZ5p8cXGC6bIAiAhi7lt8/oEkc4
         yCYtPZyzUD5Mjv6M1KKwIwrWw2H8hgDUKw+jyKyXOnseb04xLQyeF1pSE75aRJjOL8z3
         0+HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704294058; x=1704898858;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6OEWxALkMu3u+cExaprmsBqW1bk06nrav/J91dqy0hU=;
        b=BMOyCMbV8Q9DM394xW34I1yRj2xuDqMjJ/aIs0hw11ZfbjxSvImBD35Ti1fSWBGTiQ
         jF0cqsgR3bSu1pCynrhvdjMx1rWR8+pdz0wmODSPyRxv7+nBmt7Es/Tgg2S0deOfosiM
         ucowvELGI52NYS+TmI/doIQffTqO7NDH23fqMIAE4Ij6Z+/aY0xxfEOIXRp6wwDRdaH1
         gQRd8KtFvPT240v/LB9h75s7mLm8xuGJRcKMGCHBmaI9YFNQ/WjEfSWwWO/s1l3OUnvm
         xxW0p9ubcaabA/mlkKDAh3p8kVG98pxFTSbKRYSf++ADh8DqIAgaVhE1qF9MunMrWG8V
         /Y0Q==
X-Gm-Message-State: AOJu0YxLz+/zxFr1CsZ4XrZN8yVawKhSsloeGOLsUgl/sA0oeMjqJZUW
	+mlghmmWDYaoPlmju6+7tN4=
X-Google-Smtp-Source: AGHT+IEd7vU8zUQyWXmIz0TXIKcNcdtL4tFGeRcrReAbc8qJiFgULpE8r5RFe1NT0jV1kK5cvFnrmw==
X-Received: by 2002:a05:6808:3844:b0:3bb:d4a4:cebf with SMTP id ej4-20020a056808384400b003bbd4a4cebfmr6416457oib.116.1704294057969;
        Wed, 03 Jan 2024 07:00:57 -0800 (PST)
Received: from ?IPV6:2602:47:d950:3e00:e895:751c:cca6:f658? ([2602:47:d950:3e00:e895:751c:cca6:f658])
        by smtp.gmail.com with ESMTPSA id fc18-20020ad44f32000000b0067f7fe53cbdsm10883948qvb.1.2024.01.03.07.00.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jan 2024 07:00:57 -0800 (PST)
Message-ID: <22b2df74-ca8d-419d-8d5c-3780c1d6e26e@gmail.com>
Date: Wed, 3 Jan 2024 10:00:56 -0500
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nicholas Vinson <nvinson234@gmail.com>
Subject: Re: [keyutils] Remove undefined functions afrom version.lds
To: Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
 dhowells@redhat.com
References: <85561febfcf0618a9280448d5c53775646f470d6.1703712863.git.nvinson234@gmail.com>
 <CY54S7MB53ZC.1RD8JLZDE1MKF@suppilovahvero>
Content-Language: en-US
In-Reply-To: <CY54S7MB53ZC.1RD8JLZDE1MKF@suppilovahvero>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/3/24 09:12, Jarkko Sakkinen wrote:
> On Wed Dec 27, 2023 at 11:35 PM EET, Nicholas Vinson wrote:
>> Functions keyctl_restrict() and keyctl_dh_compute_kdf_alloc() are
>> nodefined. Their inclusion in version.lds causes clang/llvm LTO
> What does "nodefined" mean?

It's a typographical error I failed to catch before sending the email.It 
is supposed to say "not defined".

>> optimizations to fail with error messages similar to
>>
>>      error: version script assignment of KEYUTILS_1.7 to symbol
>>      keyctl_restrict failed: symbol not defined
>>
>> This patch fixes the issue by removing the symbol names from
>> version.lds.
>>
>> Fixes Gentoo bug 914637 (https://bugs.gentoo.org/914637)
> I wonder if we can uses here "Closes: <url>" similarly as with
> kernel bugzilla (question to more broad audience)?
>
>> Signed-off-by: Nicholas Vinson<nvinson234@gmail.com>
>> ---
>>   version.lds | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/version.lds b/version.lds
>> index 6c34adf..6186fb6 100644
>> --- a/version.lds
>> +++ b/version.lds
>> @@ -76,9 +76,7 @@ KEYUTILS_1.6 {
>>   
>>   KEYUTILS_1.7 {
>>   	/* management functions */
>> -	keyctl_restrict;
>>   	keyctl_dh_compute_kdf;
>> -	keyctl_dh_compute_kdf_alloc;
>>   
>>   } KEYUTILS_1.6;
>>   
> BR, Jarkko

