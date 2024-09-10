Return-Path: <keyrings+bounces-1973-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AA09740CD
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 19:42:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73FB11C2101E
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE0141A4AAA;
	Tue, 10 Sep 2024 17:38:41 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9064D1A3BCA;
	Tue, 10 Sep 2024 17:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725989921; cv=none; b=gQm+hjcC30jIgq7PvfR5RzX4RDXqrEPKnmghHUENz8ij1R88ZCRicxESBUnzLawjB6yPw4X8fbFF0MiGEWauIthzo+nqcYzPaVgALkX+b3BNPnB6uWT4TgrcPzf3fC+rCJ0OLR7JFwqlMOobVsWIrN7RL7TfPwEAkFAnowb6+UI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725989921; c=relaxed/simple;
	bh=5dohZWBS/7W3nObqx7vNRfXJnQ+q1SPUZ+exJOqVwpQ=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=pP/OcLsLEUN2u5T1Unoj9AA3x1WUDe6xlwQNirg/RhjHvACc0H9G/Y61KEHoruvdQndTbRfbuI/j1yDgesWuKfNV4ihQ2yC8HW3POOcAwyC9C7Ev8YWXxyvIY86v1Fcrx+KZ5FSxeHLm3YayU/ZQnI8xZPLHn9VHzJ7iN0Raguw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.106] (178.176.76.166) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Tue, 10 Sep
 2024 20:38:32 +0300
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
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Organization: Open Mobile Platform
Message-ID: <84d6b0fa-4948-fe58-c766-17f87c2a2dba@omp.ru>
Date: Tue, 10 Sep 2024 20:38:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <D42N9ASJJSUD.EG094MFWZA4Q@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/10/2024 17:22:53
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 187670 [Sep 10 2024]
X-KSE-AntiSpam-Info: Version: 6.1.1.5
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 32 0.3.32
 766319f57b3d5e49f2c79a76e7d7087b621090df
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;omp.ru:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.176.76.166
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/10/2024 17:27:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/10/2024 3:10:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

On 9/10/24 4:38 PM, Jarkko Sakkinen wrote:
[...]

>> In find_asymmetric_key(), if all NULLs are passed in id_{0,1,2} parameters
>> the kernel will first emit WARN and then have an oops because id_2 gets
>> dereferenced anyway.
>>
>> Found by Linux Verification Center (linuxtesting.org) with Svace static
>> analysis tool.
> 
> Weird, I recall that I've either sent a patch to address the same site
> OR have commented a patch with similar reasoning. Well, it does not
> matter, I think it this makes sense to me.
> 
> You could further add to the motivation that given the panic_on_warn
> kernel command-line parameter, it is for the best limit the scope and
> use of the WARN-macro.

   I don't understand what you mean -- this version of the patch keeps
the WARN_ON() call, it just moves that call, so that the duplicate id_{0,1,2}
checks are avoided...

>> Fixes: 7d30198ee24f ("keys: X.509 public key issuer lookup without AKID")
> 
> I would still call this an improvement. It overuses warn but I don't
> think this a bug. 

   I think warning about passing all NULL ptrs but then causing a NULL ptr
deref anyway wasn't really intended -- seems like a bug to me...
 
>> Suggested-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
>> Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>> ---

   I forgot to tell Roman to place the changelog here when doing an internal
review. Anyway, here is some from me:

Changed in v2:
- kept the WARN_ON() call, just moved it to avoid extra prr checks, updated
  the patch description accordingly;
- reworded the patch description according to feedback.

[...]

>> diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
>> index a5da8ccd353e..43af5fa510c0 100644
>> --- a/crypto/asymmetric_keys/asymmetric_type.c
>> +++ b/crypto/asymmetric_keys/asymmetric_type.c
>> @@ -60,17 +60,18 @@ struct key *find_asymmetric_key(struct key *keyring,
>>  	char *req, *p;
>>  	int len;
>>  
>> -	WARN_ON(!id_0 && !id_1 && !id_2);
>> -
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
>> +		WARN_ON(1);
> 
> This is totally fine. It is an improvement to the current situation.

   That update also fixes a kernel oops...

>> +		return ERR_PTR(-EINVAL);
>>  	}
>>  
>>  	/* Construct an identifier "id:<keyid>". */
> 
> Can be applied as an improvement and with the added bits about
> panic_on_warn to the commit message.

   We no longer care about panic_on_warn...

> BR, Jarkko

MBR, Sergey

