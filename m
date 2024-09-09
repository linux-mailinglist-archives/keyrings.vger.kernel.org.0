Return-Path: <keyrings+bounces-1936-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 705E69721D6
	for <lists+keyrings@lfdr.de>; Mon,  9 Sep 2024 20:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26A361F23D13
	for <lists+keyrings@lfdr.de>; Mon,  9 Sep 2024 18:25:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2671187856;
	Mon,  9 Sep 2024 18:25:54 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642EA54278;
	Mon,  9 Sep 2024 18:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725906354; cv=none; b=K6fDFa337B/bB7cyi7voxRSBK1npYORObCEJCj60fn5qoOr1C2M52KwrJMv5oUJbPPMxWOq8jGZa56JtYB31i0RjGEyCLRfUOQy3e25LTw4EnHsn+hlSMGF1ia5BUx3j629uM9jxOBgnsfMmKeHb1o/OWKy+iaSz+d4san7pQ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725906354; c=relaxed/simple;
	bh=IN6wpwySbo/t6LNShmmbuRlhOJoFQ6h5dJpybnFw0TI=;
	h=From:Subject:To:CC:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=SQ+xdFXlJ22Vn83HEZmufa57kPNSJtdNitOY+p2+tnUBGTPmLEUZHdBdyerpTlC/XD5SjkZvm7DaUUlHrd7l/PnJa7wzOb2mtZu/s12iqTzrw8Gx545NAUccMzMQmOWUMQR1Uv5lRiZWbi0Usnj5za59AB2H+7GjM4DLOtLUjy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from [192.168.1.106] (31.173.81.96) by msexch01.omp.ru (10.188.4.12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Mon, 9 Sep
 2024 21:25:29 +0300
From: Sergey Shtylyov <s.shtylyov@omp.ru>
Subject: Re: [PATCH] KEYS: prevent NULL pointer dereference in
 find_asymmetric_key()
To: Jarkko Sakkinen <jarkko@kernel.org>, Roman Smirnov <r.smirnov@omp.ru>,
	David Howells <dhowells@redhat.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
	Andrew Zaborowski <andrew.zaborowski@intel.com>
CC: "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
References: <20240315103320.18754-1-r.smirnov@omp.ru>
 <CZX9T3TU6YU0.3JE9M7M3ENUE0@kernel.org>
 <b5f21d1175c142efb52e68a24bc4165a@omp.ru>
 <CZY02YNBTGYQ.3KG8NLH8X3RQE@kernel.org>
 <7fd0f2a8252d4a6aa295adc1e76bc0e2@omp.ru>
 <CZZK77BY3FK4.2WMP1X5H9GTL1@kernel.org>
Organization: Open Mobile Platform
Message-ID: <2ba02cfc-b866-bda4-4996-f7f95148832c@omp.ru>
Date: Mon, 9 Sep 2024 21:25:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CZZK77BY3FK4.2WMP1X5H9GTL1@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/09/2024 18:08:05
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 187636 [Sep 09 2024]
X-KSE-AntiSpam-Info: Version: 6.1.1.5
X-KSE-AntiSpam-Info: Envelope from: s.shtylyov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 32 0.3.32
 766319f57b3d5e49f2c79a76e7d7087b621090df
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_uf_ne_domains}
X-KSE-AntiSpam-Info: {Tracking_bl_eng_cat, c15}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.81.96 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 31.173.81.96 in (user) dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	127.0.0.199:7.1.2;omp.ru:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;linuxtesting.org:7.1.1;git.kernel.org:7.1.1
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
X-KSE-Antiphishing-Bases: 09/09/2024 18:12:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/9/2024 4:30:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

Hello!

   Sorry for (so long!) delay -- we're trying to finalize the status
of our yet unmerged patches...

On 3/21/24 7:12 PM, Jarkko Sakkinen wrote:
[...]

>>>>>> Found by Linux Verification Center (linuxtesting.org) with Svace.
>>>>>
>>>>> I'm not sure if this should be part of the commit message.
>>>>
>>>> I have already submitted patches with this line, some have been
>>>> accepted. It is important for the Linux Verification Center to mark
>>>> patches as closing issues found with Svace.
>>>>
>>>>>>
>>>>>> Fixes: 7d30198ee24f ("keys: X.509 public key issuer lookup without AKID")
>>>>>> Suggested-by: Sergey Shtylyov <s.shtylyov@omp.ru>
>>>>>
>>>>> Should be reported-by.
>>>>
>>>> The suggested-by tag belongs to Sergey because he suggested the fix,
>>>> subject/description of the patch. The tag reported-by belongs to
>>>> Svace tool.
>>>
>>> 1. I did not see any reported-by tags in this which is requirement.
>>> 2. Who did find the issue using that tool? I don't put reported-by to
>>>    GDB even if I use that find the bug.
>>
>> Svace is an automated bug finding tool. This error was found during
>> source code analysis by the program, so the tag reported-by does not
>> belong to any person. I don't know what to do in such a situation,
>> but write something like:
>>
>>     Reported-by: Svace
>>
>> would be weird. I think that the line "Found by Linux ... with Svace"
>> could be a substitute for the tag.
> 
> I'd prefer a person here that used the tool as it is not korg hosted
> automated tool.

   It's a long ago established practice with the Linux Verification Center (http://linuxtesting.org): you can find 700+ merged patches with a similar
line (mentioning the LVC's website) and without the Reported-by tag:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/?qt=grep&q=linuxtesting.org

> BR, Jarkko

MBR, Sergey

