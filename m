Return-Path: <keyrings+bounces-349-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D52881F418
	for <lists+keyrings@lfdr.de>; Thu, 28 Dec 2023 03:20:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04B49281F29
	for <lists+keyrings@lfdr.de>; Thu, 28 Dec 2023 02:20:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A441A10E5;
	Thu, 28 Dec 2023 02:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WClK4R3K"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C05710E4
	for <keyrings@vger.kernel.org>; Thu, 28 Dec 2023 02:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7813c90e61aso230184385a.0
        for <keyrings@vger.kernel.org>; Wed, 27 Dec 2023 18:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703730015; x=1704334815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VWerluZuTy6KxQuQ+PaIJE+DPruR0SsddHgOKZeouSg=;
        b=WClK4R3KcbcjHXkAjEaqyPK2t7rgIvtM7bdD64qC2GhwF7T9R/MxrNRjzMJuxawAnR
         CBjrT3pn7A17ZOVVjllrii7q39fcOv08mUUX/8ZAbHuudUKWb/33gbbusOXiOUfV4Geo
         6nS44baL7mT8HxX9uGV9pBmabLkNxRd6dFvYwtfOSwYRA0D4z8T7unqSa1bqkNXFjmo9
         syTPIQzTtS6ueaX9lYU442ykvS7+lwskjE/b6Ggo8AmsuiNHG+ksW1aIgxr9+Blf3YCl
         jS/5oWTDl89eUKXIwxnuWcK4twj3noeqdwY1V3l/cKF07UllBTUQH8xvX7cBz2i/bwaP
         4k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703730015; x=1704334815;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VWerluZuTy6KxQuQ+PaIJE+DPruR0SsddHgOKZeouSg=;
        b=mpXBgA38smH6yrsQ2Fmva3S6TRBIrr9UedrWKPBXz0Ej3BVcLJWza/CD7nvJ/SU3cF
         njBDLnZkYk0A4ay5c51FPoT3y6l6u7D93zHFdFT42lAeVMgRMh7KHvGf1vVqJXf0iWHc
         Z54InDHJMpu1N8TU5shYnYGqBhYXR2ewoupLNosxFR7GZuPTO8m8NwKzdvSUGG3W/ou1
         BCW2BKp45id5Z1P8CToTBeu8S8zwJlwb0DhdxuDMx1yUOsrIBW2j5wW84DgTvqIjx6uB
         ZOlczFXC2DEwARXbTd/U+h3YiwkgDgk5vibzIF7dTvHRA+LTs0DVy77z7/db9xnnxME0
         93qg==
X-Gm-Message-State: AOJu0YytIh1XLbmM5K+XzD10OLx2FnF/pm1sx4IwIAFsUrz6l0Co44/x
	QlZ4+YPGUuQD9epfk6ulu9e9Rvvnc80=
X-Google-Smtp-Source: AGHT+IEuok96SstpXlLHw28WDz/wMo23yPVRFV0smz5tldBC6LAfwQT3Ure+uv6/NBe/ud46cPavAQ==
X-Received: by 2002:a05:620a:a85:b0:781:56b0:b67f with SMTP id v5-20020a05620a0a8500b0078156b0b67fmr2399364qkg.97.1703730015125;
        Wed, 27 Dec 2023 18:20:15 -0800 (PST)
Received: from ?IPV6:2602:47:d950:3e00:fc87:be9f:ec65:1c92? ([2602:47:d950:3e00:fc87:be9f:ec65:1c92])
        by smtp.gmail.com with ESMTPSA id bi41-20020a05620a31a900b0077d7e9a134bsm5535029qkb.129.2023.12.27.18.20.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 18:20:14 -0800 (PST)
Message-ID: <fe5c7770-7fbc-4332-aa85-80e281cda8c2@gmail.com>
Date: Wed, 27 Dec 2023 21:20:13 -0500
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [keyutils] Remove undefined functions afrom version.lds
To: Ben Boeckel <me@benboeckel.net>
Cc: keyrings@vger.kernel.org, dhowells@redhat.com
References: <85561febfcf0618a9280448d5c53775646f470d6.1703712863.git.nvinson234@gmail.com>
 <ZYzVtdviEYQ6AN-6@farprobe>
Content-Language: en-US
From: Nicholas Vinson <nvinson234@gmail.com>
In-Reply-To: <ZYzVtdviEYQ6AN-6@farprobe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/27/23 20:56, Ben Boeckel wrote:
> On Wed, Dec 27, 2023 at 16:35:16 -0500, Nicholas Vinson wrote:
>> Functions keyctl_restrict() and keyctl_dh_compute_kdf_alloc() are
>> nodefined. Their inclusion in version.lds causes clang/llvm LTO
>> optimizations to fail with error messages similar to
>>
>>      error: version script assignment of KEYUTILS_1.7 to symbol
>>      keyctl_restrict failed: symbol not defined
>>
>> This patch fixes the issue by removing the symbol names from
>> version.lds.
> FYI, there is also a GitLab repo here if you want to submit an MR:
>
>      https://gitlab.com/linux-afs/keyutils
>
> I believe it has yet to be seen if this is preferred or GitLab. Or
> whether the ML will get GitLab MR notifications.

Thanks for the information. Would it be possible to add the information 
to the SUBMITTING_PATCHES file?

Regards,

Nicholas Vinson

>
> --Ben

