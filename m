Return-Path: <keyrings+bounces-1722-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E55B92C424
	for <lists+keyrings@lfdr.de>; Tue,  9 Jul 2024 21:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F44C1F231A2
	for <lists+keyrings@lfdr.de>; Tue,  9 Jul 2024 19:54:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C927318003D;
	Tue,  9 Jul 2024 19:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FbZ8zPRF"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0411B86ED
	for <keyrings@vger.kernel.org>; Tue,  9 Jul 2024 19:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720554869; cv=none; b=frFDfCowyH4eQlG7CyMfvwwpr6tsVd7vlBduEkwJYWGIrXRQ99xHwZScDomg4J726QuoB4Ynns3JYw0/bY/ryw6xof6Yrcu9P4dEWDNrBfL9AOIzVnCRcp+Ss9OcECv5n74aIjJFVQ3UInDvV8MlrKLeUjnSU8i102tilcO2+3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720554869; c=relaxed/simple;
	bh=F2wXmRek6YBnQqYBNjjKnvx4WQZikqbxi87I6aK933Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=sdFmh886fX6SKLBmoJeJi+bwyT+3PXC0gYGBp53pacVZTVBTld+KrVIX+rHMlckgsTV4tmYRs2VdlxjkQh5uGEzy5aq34ZFdlPL+yIVLYXFQ5PvB94k8Wf2xG4uPFg/kvm7OAkP7gIjlcySYsxVUalWcWzQZhfXaManjkqMpDDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FbZ8zPRF; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dff17fd97b3so6202461276.2
        for <keyrings@vger.kernel.org>; Tue, 09 Jul 2024 12:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720554867; x=1721159667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DnugVKK+54l4QK1zgVw9TdK2IhYnZnX2s63RrR/MzKo=;
        b=FbZ8zPRFqXn85bTF8K5UOk0wZ6cNZEMAbKRLV3DQOWBBQMCvAhhPdwerEMHcgG+qGo
         SGw5BzvZkY+qqP94S7ybg5gaY6giAZSJ62p8ycG6Bssz08zaFPIpfV7HZefNXqed38R/
         fibHCBanPcUDEd+FYbKtlPrgtgFPXWSGeM1hDzwpwEtZm/jQRQn3gJsuVwZqsKw+yjar
         2GR8BLlHVQdwlgIwRI9gjeKIobMqqja5eEfyaTF3VGDobx68KRfjaDQVmBFKGvtsJ50U
         GdJ3vt79rQrr3iTpxxWYxOV9lZXNZtOuwbvmDwHKrQJPZ0mMpNaCSW3oT1GmSDioWIA0
         9N1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720554867; x=1721159667;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DnugVKK+54l4QK1zgVw9TdK2IhYnZnX2s63RrR/MzKo=;
        b=lUVbXD+M+piUDk4o0uFwZhPwoEm8C7E2aadm3s/GYxW515efC7iWAj/qY1MnbmoJmY
         8RJCb+kBC6yubWid1n/5P7rzr0zvGOlAo8B6uIC0q87KMjuOMkjLBP/JFFMuNGpcAMPS
         /x7XHpIXxSl0CycW9qu6TA8SEWNFZd8t7Bmxzzn16/XwSyEMjqjyjbqcEj532rX0V7Pa
         AxrggBiIZxqQAWIONzYP7RHF9pb2wQ8/sihEFUsFIUmf7NBAsPzv0Nm9dUxVHhtE4sKC
         WLsgrPx4aA0FpnMbiD7RPeVQx0wh2dsPVHXXObMuD3kefF6D6vpGS0IRqIbtqgxtNugM
         kGXg==
X-Forwarded-Encrypted: i=1; AJvYcCVhWe+mf0rF4zI2XSLWvZdS9HLd/R69y1T9FwINoBo2XBLizx9qx0uPX5+vlR2gCR2f9JizfnzE7z0wbDvo2H/IczaOwRzP5lA=
X-Gm-Message-State: AOJu0YyiHSd4l7CDB4YOtYuBQmb8cKtEG/7ksVkz5v3flXYBSl4qETcq
	mmlvfcpN3gvZBqxgJhlZQr5IIUvv7dUj/uVSRfsoWAdOCEfJBup0
X-Google-Smtp-Source: AGHT+IFfXjvvrQZHevFym1HXI7XVChyGjlfELpeucNxKkZD6n4aVWXk4ie0kDeQzEtsQXgH0cX6Esw==
X-Received: by 2002:a25:86c1:0:b0:e03:530d:3a1a with SMTP id 3f1490d57ef6-e041b05943emr4339835276.25.1720554867073;
        Tue, 09 Jul 2024 12:54:27 -0700 (PDT)
Received: from ?IPV6:2602:47:d945:d000:262b:8251:6cea:1863? ([2602:47:d945:d000:262b:8251:6cea:1863])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f19016456sm128869185a.47.2024.07.09.12.54.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jul 2024 12:54:26 -0700 (PDT)
Message-ID: <50fb8adc-0827-47da-bd2b-e29ca73781af@gmail.com>
Date: Tue, 9 Jul 2024 15:54:25 -0400
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [keyutils] Remove undefined functions afrom version.lds
From: Nicholas Vinson <nvinson234@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
 dhowells@redhat.com
References: <85561febfcf0618a9280448d5c53775646f470d6.1703712863.git.nvinson234@gmail.com>
 <CY54S7MB53ZC.1RD8JLZDE1MKF@suppilovahvero>
 <22b2df74-ca8d-419d-8d5c-3780c1d6e26e@gmail.com>
 <22c30a36-5e52-4602-b24e-9d02d137ccfa@gmail.com>
Content-Language: en-US
In-Reply-To: <22c30a36-5e52-4602-b24e-9d02d137ccfa@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 3/4/24 01:06, Nicholas Vinson wrote:
> 
> 
> On 1/3/24 10:00, Nicholas Vinson wrote:
>>
>> On 1/3/24 09:12, Jarkko Sakkinen wrote:
>>> On Wed Dec 27, 2023 at 11:35 PM EET, Nicholas Vinson wrote:
>>>> Functions keyctl_restrict() and keyctl_dh_compute_kdf_alloc() are
>>>> nodefined. Their inclusion in version.lds causes clang/llvm LTO
>>> What does "nodefined" mean?
>>
>> It's a typographical error I failed to catch before sending the 
>> email.It is supposed to say "not defined".
>>
>>>> optimizations to fail with error messages similar to
>>>>
>>>>      error: version script assignment of KEYUTILS_1.7 to symbol
>>>>      keyctl_restrict failed: symbol not defined
>>>>
>>>> This patch fixes the issue by removing the symbol names from
>>>> version.lds.
>>>>
>>>> Fixes Gentoo bug 914637 (https://bugs.gentoo.org/914637)
>>> I wonder if we can uses here "Closes: <url>" similarly as with
>>> kernel bugzilla (question to more broad audience)?
>>>
>>>> Signed-off-by: Nicholas Vinson<nvinson234@gmail.com>
>>>> ---
>>>>   version.lds | 2 --
>>>>   1 file changed, 2 deletions(-)
>>>>
>>>> diff --git a/version.lds b/version.lds
>>>> index 6c34adf..6186fb6 100644
>>>> --- a/version.lds
>>>> +++ b/version.lds
>>>> @@ -76,9 +76,7 @@ KEYUTILS_1.6 {
>>>>   KEYUTILS_1.7 {
>>>>       /* management functions */
>>>> -    keyctl_restrict;
>>>>       keyctl_dh_compute_kdf;
>>>> -    keyctl_dh_compute_kdf_alloc;
>>>>   } KEYUTILS_1.6;
>>> BR, Jarkko
> 
> May I get a status update for this PR please?
> 
> Thanks,
> Nicholas Vinson

Hello, any status updates on this? It's been about 4 months since my 
last request and I haven't heard anything.

Thanks,
Nicholas Vinson

