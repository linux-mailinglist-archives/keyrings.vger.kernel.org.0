Return-Path: <keyrings+bounces-1937-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EF497221A
	for <lists+keyrings@lfdr.de>; Mon,  9 Sep 2024 20:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DAA328333B
	for <lists+keyrings@lfdr.de>; Mon,  9 Sep 2024 18:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D3417B515;
	Mon,  9 Sep 2024 18:51:55 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18E814B06C;
	Mon,  9 Sep 2024 18:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725907915; cv=none; b=WKtmtOd0XUrJZO0EaKO+1LUTZm17PNKISXqzV7ZU66A/ogMU5TAnyt+zi7lwY25y2WDI4AsyG82E7SHNymcAuKNf68640a2igI8zB4+OBRVpingMW3vE/mzgkLqMsDe89AnryKT/FVY8CfKPG5pY+sSum+hFM1EWEnaxDrZMAjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725907915; c=relaxed/simple;
	bh=CrCefix7HM2ao+Rd4VzDYmJ9W2K1egmuhqgLJjj2hiM=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=cO0Dm3R08SrHrvbtSi0cb8RoP0Yt/M737Wy8qbQX59FhNJa6JqDZ/EcG+c1Zz7BgwaKTtr+s60S7JNudDJCLEF1DlXruD3mg2wbOm7YX+a3iPDg0ul0HREoe6DFJM6jkflWJs+BVEsHVnH/FfgUdtVY604YFWv1+bnv/n40Ib+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.106] (31.173.81.96) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 9 Sep
 2024 21:51:40 +0300
Subject: Re: [PATCH] KEYS: prevent NULL pointer dereference in
 find_asymmetric_key()
To: Jarkko Sakkinen <jarkko@kernel.org>, Roman Smirnov <r.smirnov@omp.ru>,
	David Howells <dhowells@redhat.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
	Andrew Zaborowski <andrew.zaborowski@intel.com>
CC: <keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lvc-project@linuxtesting.org>
References: <20240315103320.18754-1-r.smirnov@omp.ru>
 <CZX9T3TU6YU0.3JE9M7M3ENUE0@kernel.org>
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <1b7e4576-7b64-aba1-9e23-e58605b1f5bd@omp.ru>
Date: Mon, 9 Sep 2024 21:51:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CZX9T3TU6YU0.3JE9M7M3ENUE0@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/09/2024 18:32:10
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 187637 [Sep 09 2024]
X-KSE-AntiSpam-Info: Version: 6.1.1.5
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 32 0.3.32
 766319f57b3d5e49f2c79a76e7d7087b621090df
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.81.96 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.81.96 in (user) dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	omp.ru:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;lore.kernel.org:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 31.173.81.96
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/09/2024 18:36:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/9/2024 4:30:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 3/19/24 2:39 AM, Jarkko Sakkinen wrote:
[...]

>> With the current code, in case all NULLs are passed in id_{0,1,2},
> 
> "current code" is not unambigious reference of any part of the kernel
> tree. Please just write down the function name instead.
> 
>> the kernel will first print out a WARNING and then have an oops
>> because id_2 gets dereferenced anyway.
> 
> Would be more exact":
> 
> s/print out a WARNING/emit WARN/

   Well, technically calling WARN_ON() it prints out WARNING: ... --
hence the wording... :-)

>> Note that WARN_ON() is also considered harmful by Greg Kroah-
>> Hartman since it causes the Android kernels to panic as they
>> get booted with the panic_on_warn option.

   As it turns out, not all Android kernels really do this thging
(at least the Samsung's ones do, according to Greg)...

> Despite full respect to Greg, and agreeing what he had said about
> the topic (which you are lacking lore link meaning that in all
> cases the current description is incomplete), the only thing that
> should be documented should be that since WARN_ON() can emit
> panic when panic_on_warn is set in the *kernel command-line*
> (not "option") this condition should be relaxed.

   Linus' opinion seems to be that the people using panic_on_warn
get what they deserve -- see:

https://lore.kernel.org/all/CAHk-=wgF7K2gSSpy=m_=K3Nov4zaceUX9puQf1TjkTJLA2XC_g@mail.gmail.com/

>> Found by Linux Verification Center (linuxtesting.org) with Svace.
> 
> I'm not sure if this should be part of the commit message.
> 
>>
>> Fixes: 7d30198ee24f ("keys: X.509 public key issuer lookup without AKID")
>> Suggested-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> 
> Should be reported-by.
> 
>> Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
>> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> ---
>>  crypto/asymmetric_keys/asymmetric_type.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
>> index a5da8ccd353e..f5cbd6ff14e2 100644
>> --- a/crypto/asymmetric_keys/asymmetric_type.c
>> +++ b/crypto/asymmetric_keys/asymmetric_type.c
>> @@ -60,17 +60,17 @@ struct key *find_asymmetric_key(struct key *keyring,
>>  	char *req, *p;
>>  	int len;
>>  
>> -	WARN_ON(!id_0 && !id_1 && !id_2);
>> -
> 
> Weird, I recall discussing about this issue in the past. Unfortunately
> could not find the thread from lore.

   There was also that (denied) patch:

https://lore.kernel.org/all/20240414170850.148122-1-elder@linaro.org/

> Anyway I agree with the code change.
> 
>>  	if (id_0) {
>>  		lookup = id_0->data;
>>  		len = id_0->len;
>>  	} else if (id_1) {
>>  		lookup = id_1->data;
>>  		len = id_1->len;
>> -	} else {
>> +	} else if (id_2) {
>>  		lookup = id_2->data;
>>  		len = id_2->len;
>> +	} else {

   We can perhaps place the WARN_ON(1) call here instead of where it
is now...

>> +		return ERR_PTR(-EINVAL);
>>  	}
>>  
>>  	/* Construct an identifier "id:<keyid>". */

> BR, Jarkko

MBR, Sergey

