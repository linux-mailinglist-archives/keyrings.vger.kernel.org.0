Return-Path: <keyrings+bounces-778-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 440CA86F9D4
	for <lists+keyrings@lfdr.de>; Mon,  4 Mar 2024 07:06:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00CE52811E9
	for <lists+keyrings@lfdr.de>; Mon,  4 Mar 2024 06:06:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A602CBA33;
	Mon,  4 Mar 2024 06:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAo+MxQf"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AB8B666
	for <keyrings@vger.kernel.org>; Mon,  4 Mar 2024 06:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709532378; cv=none; b=ilX62ww8Rie6vEplWmBnJf8PxiVWgz16IH0sKD6QRY9rIquF8vPmKGbxXhDn5wP7YnCScyYwOxEdHiwmPZFG54rXL9XRcOyysJbg+7joFwf8Fmx9ZWUHG4dFdV4USTS207NzSV69WDP7cT5p3RWxpXT69C8cdjlX345AgosIkXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709532378; c=relaxed/simple;
	bh=r9+CZzbu0skAmEr16mKX5wPVEKDp0W4lEr7XxQ/IAJY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=NwUbKZWPIBP4zkQCDOtwwIEAgJtajLRZVA3xToXvFBPSHXBFTT3oC8lWLX8eEEWSaivUUZOa6qZfVxsoUbm+yssMkOx8I07E73KrNYgvFkochhZcSAzB2CcTOOr5ta12XbgiVwSh2HF4/YR7lxc/02A6f1CZCEQ7Ipcz8iQHrKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAo+MxQf; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-42e8a130ebcso33264091cf.1
        for <keyrings@vger.kernel.org>; Sun, 03 Mar 2024 22:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709532376; x=1710137176; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QMGhvGSEaEJv5rbP5lV6qlfwbDgx9VbIiVUfwjQQXCQ=;
        b=UAo+MxQfD+DAPVo2vHgwqOxSrCSaglgPl0QQhpVOxvIJR/lKCsNwyK++RqHdZVSEvq
         62BPy30tGiDD0LssqFP/jTJWYj1/Z7OsXGdFrulawsZbgPxAV3M1S2+C7aYARk6XAMZO
         7+D21u4yTgLBYaVfHoSjT+3+X1SjIJUqtjEpWVsxw3zVOuI9/qqw37Ca/FLkxx/v8EJP
         zPubqky2s8v3lvyINYj7mBrumecZHPD6BqGzldCfZXao1gFlPnpNIyokl4RNPj1cb/Xq
         23j0mem/iq2Eu8F48YCVRihdS5gyiOwr2ZS2va0GdNNDu04s00AZpVKIEW9NNclGjdax
         6q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709532376; x=1710137176;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMGhvGSEaEJv5rbP5lV6qlfwbDgx9VbIiVUfwjQQXCQ=;
        b=sKf8a2uSKxUW56mip6rtZAy4Htu8dPeCVMbXpx7SYW9480K3gSD2b/iNeNwxp7Hui5
         KooNsc1jNAIJicwgDbOPtkA2d8ic8hrZ3/UcjhPnvlfC04SM6D1j5357WRUebXHASVUM
         WAznyyWTSrrkIjtUft29jJ4lzlpeJBIqZ0CzNgBmOjrS4RzJqBcT+5xr9KSBr9Y95sKa
         OkAB1uwth5wsPFk9WjhE7Tic0Hyx1dKyGTWMDmHVFDEuAZ4rTf6iPi0B5LKRydm3GJvn
         hK9wEvORh3xrcBD9/nltregtxj6rB7+EqAP0BlSrFmFXMWLgy8Un2e7EW3GPYshx1RS3
         mb4w==
X-Forwarded-Encrypted: i=1; AJvYcCXF3vygUX9me2TPPiPJckQE8kYuK3vFQkxGBmo5PRf/w7OR3g3dX4XLq2cY0mPYUI9nROksbgB4J7yIhhHGHC2LetAWKg7AQAM=
X-Gm-Message-State: AOJu0YxjzBEg9cJGpejYNijwl+PnWQ/Je0GCW8aut2oYLwsN3kMdtXhW
	WCV4jzAsjDzm5UzWiyL5v9xUb4TKtcv9tpJQSPQ9q/FOuYLuq55zvMFvyXh9FHU=
X-Google-Smtp-Source: AGHT+IHnMXpLelCswXwiqdEfUN1t7AOEEdJcxdZoJ377YkUxXNXWsnaDt30nxvPFIum/BlvjovAhUg==
X-Received: by 2002:a05:622a:1c1:b0:42e:ecca:c8ee with SMTP id t1-20020a05622a01c100b0042eeccac8eemr4390459qtw.16.1709532376000;
        Sun, 03 Mar 2024 22:06:16 -0800 (PST)
Received: from ?IPV6:2602:47:d95e:101:b4d2:1c82:eb6b:6162? ([2602:47:d95e:101:b4d2:1c82:eb6b:6162])
        by smtp.gmail.com with ESMTPSA id g16-20020ac84b70000000b0042edd829ecesm1939439qts.5.2024.03.03.22.06.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Mar 2024 22:06:15 -0800 (PST)
Message-ID: <22c30a36-5e52-4602-b24e-9d02d137ccfa@gmail.com>
Date: Mon, 4 Mar 2024 01:06:14 -0500
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [keyutils] Remove undefined functions afrom version.lds
Content-Language: en-US
From: Nicholas Vinson <nvinson234@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
 dhowells@redhat.com
References: <85561febfcf0618a9280448d5c53775646f470d6.1703712863.git.nvinson234@gmail.com>
 <CY54S7MB53ZC.1RD8JLZDE1MKF@suppilovahvero>
 <22b2df74-ca8d-419d-8d5c-3780c1d6e26e@gmail.com>
In-Reply-To: <22b2df74-ca8d-419d-8d5c-3780c1d6e26e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/3/24 10:00, Nicholas Vinson wrote:
> 
> On 1/3/24 09:12, Jarkko Sakkinen wrote:
>> On Wed Dec 27, 2023 at 11:35 PM EET, Nicholas Vinson wrote:
>>> Functions keyctl_restrict() and keyctl_dh_compute_kdf_alloc() are
>>> nodefined. Their inclusion in version.lds causes clang/llvm LTO
>> What does "nodefined" mean?
> 
> It's a typographical error I failed to catch before sending the email.It 
> is supposed to say "not defined".
> 
>>> optimizations to fail with error messages similar to
>>>
>>>      error: version script assignment of KEYUTILS_1.7 to symbol
>>>      keyctl_restrict failed: symbol not defined
>>>
>>> This patch fixes the issue by removing the symbol names from
>>> version.lds.
>>>
>>> Fixes Gentoo bug 914637 (https://bugs.gentoo.org/914637)
>> I wonder if we can uses here "Closes: <url>" similarly as with
>> kernel bugzilla (question to more broad audience)?
>>
>>> Signed-off-by: Nicholas Vinson<nvinson234@gmail.com>
>>> ---
>>>   version.lds | 2 --
>>>   1 file changed, 2 deletions(-)
>>>
>>> diff --git a/version.lds b/version.lds
>>> index 6c34adf..6186fb6 100644
>>> --- a/version.lds
>>> +++ b/version.lds
>>> @@ -76,9 +76,7 @@ KEYUTILS_1.6 {
>>>   KEYUTILS_1.7 {
>>>       /* management functions */
>>> -    keyctl_restrict;
>>>       keyctl_dh_compute_kdf;
>>> -    keyctl_dh_compute_kdf_alloc;
>>>   } KEYUTILS_1.6;
>> BR, Jarkko

May I get a status update for this PR please?

Thanks,
Nicholas Vinson

