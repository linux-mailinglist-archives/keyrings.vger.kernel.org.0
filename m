Return-Path: <keyrings+bounces-2024-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CCB8976B31
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 15:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E231D28121C
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 13:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EFD1A3037;
	Thu, 12 Sep 2024 13:51:50 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7BF1A0BD4;
	Thu, 12 Sep 2024 13:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726149110; cv=none; b=i5g2GSqvNnLlOGboZKUfGZq3v5ib9eGKcjxlIJ8+CnLCzZEBofmfqGzlAqqqBSIbSjRXthtWBSGZHakxOf9qhp28fnuvKZVo1KPsSvObSZd+xBJG7n7sGuVEZkIMVg3+62V68NZplQjs3da7JdzXDU14Sym4KLDPxyXUqCtaBi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726149110; c=relaxed/simple;
	bh=qzHvcMNowk6NzrnJnzjlLOM0xR+661lK3QZTiFzxQc0=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=cezc3LNYIg3pXDIYllHma2ukaGt5Kg04lAHGO8XYu6+Awpxs6UwOG/7J0ukJ2a2JTB1CSZaZ9D/ZCOSWzsFsgU19OsbvkKfTNO174h7R5uOcmg6Lw5ATjS1oFqTV1W0Fhy7QvFNwa9nJGTzFYC0D35KvDMaggsd9yUTGd6dCp14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.106] (31.173.87.196) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Thu, 12 Sep
 2024 16:51:35 +0300
Subject: Re: [PATCH v2] KEYS: prevent NULL pointer dereference in
 find_asymmetric_key()
To: Jarkko Sakkinen <jarkko@kernel.org>, Roman Smirnov <r.smirnov@omp.ru>,
	David Howells <dhowells@redhat.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
	Andrew Zaborowski <andrew.zaborowski@intel.com>
CC: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
References: <20240910111806.65945-1-r.smirnov@omp.ru>
 <D42N9ASJJSUD.EG094MFWZA4Q@kernel.org>
 <84d6b0fa-4948-fe58-c766-17f87c2a2dba@omp.ru>
 <D43HG3PEBR4I.2INNPVZIT19ZZ@kernel.org>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <8774f6a2-9bec-b699-6b68-63a26019c5b3@omp.ru>
Date: Thu, 12 Sep 2024 16:51:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <D43HG3PEBR4I.2INNPVZIT19ZZ@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/12/2024 13:36:58
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 187710 [Sep 12 2024]
X-KSE-AntiSpam-Info: Version: 6.1.1.5
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 34 0.3.34
 8a1fac695d5606478feba790382a59668a4f0039
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.87.196 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.87.196 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;31.173.87.196:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.87.196
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/12/2024 13:41:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/12/2024 10:54:00 AM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 9/11/24 4:18 PM, Jarkko Sakkinen wrote:
[...]

>>>> In find_asymmetric_key(), if all NULLs are passed in id_{0,1,2} parameters
>>>> the kernel will first emit WARN and then have an oops because id_2 gets
>>>> dereferenced anyway.
>>>>
>>>> Found by Linux Verification Center (linuxtesting.org) with Svace static
>>>> analysis tool.
>>>
>>> Weird, I recall that I've either sent a patch to address the same site
>>> OR have commented a patch with similar reasoning. Well, it does not
>>> matter, I think it this makes sense to me.
>>>
>>> You could further add to the motivation that given the panic_on_warn
>>> kernel command-line parameter, it is for the best limit the scope and
>>> use of the WARN-macro.
>>
>>    I don't understand what you mean -- this version of the patch keeps
>> the WARN_ON() call, it just moves that call, so that the duplicate id_{0,1,2}
>> checks are avoided...
> 
> I overlooked the code change (my bad sorry). Here's a better version of
> the first paragraph:
> 
> "find_asymmetric_keys() has nullity checks of id_0 and id_1 but ignores
> validation for id_2. Check nullity also for id_2."

   Hm, what about WARN_ON(!id_0 && !id_1 && !id_2) -- it used to check all
the pointers, right? I think our variant was closer to reality... :-)

[...]

> BR, Jarkko

MBR, Sergey

