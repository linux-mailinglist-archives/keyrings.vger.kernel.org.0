Return-Path: <keyrings+bounces-1526-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C708D4B7C
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2024 14:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76AB91C20DA0
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2024 12:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635721C9ED7;
	Thu, 30 May 2024 12:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="s+NCDqoM"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357BA1C9ECF;
	Thu, 30 May 2024 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717071890; cv=none; b=Pqk18i+gReHYVCyeA9zqG7xvi8aLvhGO0djPGYW57norRjl7i7fC7dXpe0txz6MDTVoUMK41fJxXGvnobUB0G41bbdwKnVWvO6h+pxeGGdJXU36w1UzBe2gMxfOk6oxr6meOPLFvz63reNaIg4rQD5NzACAorXfOfuyAMq0tpe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717071890; c=relaxed/simple;
	bh=+4rjW2oYixh/lu0tj44gYkkzWY2cf83FD1AqtHiK2wA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ABbe6f7kR3G27YEO5N9m/8/SbaXsFYoSKxqfRCONn9QaHqunZwNBWXOGVvzOVXaTydDx5ZzEqTMtqRhArjhIkHPHPovvbYtpniXzuq3HtqDwtchKJqsbkqIiPgwq8HK8joeHP/zTbvnkku+b7lv2JmX0hvc+9MbUI5v1e7tZBGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=s+NCDqoM; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44UC6rm5015613;
	Thu, 30 May 2024 12:24:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pp1;
 bh=y3Bmhl0vE+2bczhT5nSK1wqavoAlVqxU5VS8NJFBqjc=;
 b=s+NCDqoMXp4RhgtUCGPkHNEJrbdn8yIYAW7nNh3vC0LDmUhNYMBdFeSgOBgLX8Fax3qd
 lmmSrdB6iHCIFn985er3XyUaTnpVCczCoaMLbhwKRcfm4RbKxzD2bM0O7Ldwkq3J0vYi
 kN+LQKcDqvdIStqGHlweO/V9zYqAzIsyKLSr373On4vJAkBAqvyvMxQIwV9kk3pjDvLg
 yHNRA/Y7XJHVAAdURt9cVo8yT8TGASEpOd19FT/zSffxmFcgCEUktpgG8BHlnC0Bv30I
 OyD+SsAgBGeU298aLx4lfUsWCQTUBy25BfHOlpwLmJRfgNtaDt1It/3ZVCBoCgjE7wV1 6g== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yes5nr149-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 12:24:39 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44UBT5WZ026732;
	Thu, 30 May 2024 12:24:38 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ydpd2su4x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 12:24:38 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44UCOaMo13304340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 May 2024 12:24:38 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0ED8B58063;
	Thu, 30 May 2024 12:24:36 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44F1358067;
	Thu, 30 May 2024 12:24:35 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 May 2024 12:24:35 +0000 (GMT)
Message-ID: <899c3637-dc2a-4c73-9b8a-91e7b4da1638@linux.ibm.com>
Date: Thu, 30 May 2024 08:24:34 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] crypto: ecdsa - Use ecc_digits_from_bytes to create
 hash digits array
To: Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, lukas@wunner.de
References: <20240529230827.379111-1-stefanb@linux.ibm.com>
 <20240529230827.379111-2-stefanb@linux.ibm.com>
 <D1MQBJSYUBRS.12KH2S8FUK0XS@kernel.org>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <D1MQBJSYUBRS.12KH2S8FUK0XS@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: v_AlukYrXlA-6-2HfNZo1wAn2g3BHEk2
X-Proofpoint-ORIG-GUID: v_AlukYrXlA-6-2HfNZo1wAn2g3BHEk2
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_09,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405300094



On 5/30/24 01:28, Jarkko Sakkinen wrote:
> On Thu May 30, 2024 at 2:08 AM EEST, Stefan Berger wrote:
>> Since ecc_digits_from_bytes will provide zeros when an insufficient number
>> of bytes are passed in the input byte array, use it to create the hash
>> digits directly from the input byte array. This avoids going through an
>> intermediate byte array (rawhash) that has the first few bytes filled with
>> zeros.
>>
>> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
>> ---
>>   crypto/ecdsa.c | 17 ++++-------------
>>   1 file changed, 4 insertions(+), 13 deletions(-)
>>
>> diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
>> index 258fffbf623d..fa029f36110b 100644
>> --- a/crypto/ecdsa.c
>> +++ b/crypto/ecdsa.c
>> @@ -142,10 +142,8 @@ static int ecdsa_verify(struct akcipher_request *req)
>>   	struct ecdsa_signature_ctx sig_ctx = {
>>   		.curve = ctx->curve,
>>   	};
>> -	u8 rawhash[ECC_MAX_BYTES];
>>   	u64 hash[ECC_MAX_DIGITS];
>>   	unsigned char *buffer;
>> -	ssize_t diff;
>>   	int ret;
>>   
>>   	if (unlikely(!ctx->pub_key_set))
>> @@ -164,18 +162,11 @@ static int ecdsa_verify(struct akcipher_request *req)
>>   	if (ret < 0)
>>   		goto error;
>>   
>> -	/* if the hash is shorter then we will add leading zeros to fit to ndigits */
>> -	diff = bufsize - req->dst_len;
>> -	if (diff >= 0) {
>> -		if (diff)
>> -			memset(rawhash, 0, diff);
>> -		memcpy(&rawhash[diff], buffer + req->src_len, req->dst_len);
>> -	} else if (diff < 0) {
>> -		/* given hash is longer, we take the left-most bytes */
>> -		memcpy(&rawhash, buffer + req->src_len, bufsize);
>> -	}
>> +	if (bufsize > req->dst_len)
>> +		bufsize = req->dst_len;
>>   
>> -	ecc_swap_digits((u64 *)rawhash, hash, ctx->curve->g.ndigits);
>> +	ecc_digits_from_bytes(buffer + req->src_len, bufsize,
>> +			      hash, ctx->curve->g.ndigits);
>>   
>>   	ret = _ecdsa_verify(ctx, hash, sig_ctx.r, sig_ctx.s);
>>   
> 
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> 
> I don't think it'd be even nit-picking to say that the function
> called would really need kdoc. I had to spend about 20 minutes
> to reacall ecc_digits_from_bytes().

Here's the file with all the kdocs: 
https://elixir.bootlin.com/linux/v6.10-rc1/source/include/crypto/internal/ecc.h#L67

> 
> Like something to remind what, how and why... So that you can
> recap quickly. Once I got grip of it (for the 2nd time) the
> code itself was just fine, no complains on that.

Do you want to find there that the input byte array starts with the most 
significant byte and the functions converts this byte array into an 
internal digits representation?



> 
> BR, Jarkko
> 

