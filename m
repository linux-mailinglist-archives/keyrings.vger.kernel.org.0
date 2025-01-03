Return-Path: <keyrings+bounces-2329-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AA4A00D55
	for <lists+keyrings@lfdr.de>; Fri,  3 Jan 2025 19:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4697C3A4221
	for <lists+keyrings@lfdr.de>; Fri,  3 Jan 2025 18:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAA61FA8C3;
	Fri,  3 Jan 2025 18:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dnDENwhs"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA2CBE4F;
	Fri,  3 Jan 2025 18:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735927586; cv=none; b=SzFXF9uIXLhh5km6eOjsTJNztTYO6er4xx2Rs6df10+tXmuU4PGdnFblHP/lSkNSe9jmiQD3cngBGLKuPtIYLCmceWFka9BWWAOihYPfPNierYdzFeoSf2f2qRm9v3yuDgPGfaE59msE7KrxzWrSuZqLbU0Ayu6+HV3RMkEkR4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735927586; c=relaxed/simple;
	bh=f+sTa128/PdS46RYIGNQvILVzWdG98f5fQunrNaKAIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ap2KFesD/P7p8BbPhBa0VtGYmQSwMuFn00gq6pIhDTDku5aDzLuc1OtS3bXE653Dh6I/w/JQql1o0kEL993XqnN5GtfKfmnbm0Lj6jhK/WDmMRRb0u/rxUUWDbdc0Nt0AUf+YhE9Elr9IBF+9Vqcyp8HdjKq6Aa931ZzULVArWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dnDENwhs; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 503EmJMS026675;
	Fri, 3 Jan 2025 18:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ZMG2j7
	FhSBJtYTqoOV4vUzmIcTchqywRByqn3eCapCA=; b=dnDENwhs2Ul00PXBrAMwk3
	gGMoCir35yCt/1c9JzqxFA38w2fmWqNjIa85hzkpgEFxQY75lsnCHYFDokPXiPwn
	PaEmGwZM8hzxFihQin6PytxanDZjkj0wHf+vmtF9EnMSmSDdLllJmg7uNbnx0isQ
	OSHYzWsnCpvBmPw/HmqYEuScATMxGEKKtJFWcTL2ABRyw/ZKh1DphqAVjK/OPXWq
	PSG6L6B7hv/icY+rQCicRCwNT2mLpIXSzrBgHSDodix+Y0P9MvqqxcTrT53q/68S
	W34Hx0KYtUqLIjzqHQUo0t7rX9Ai1uKt3F5XPXa9kAspasFlJjoU9GYd0v2kNgzg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43x4mabejp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 18:06:16 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 503FY1D4010120;
	Fri, 3 Jan 2025 18:06:15 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43tvnnqan3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Jan 2025 18:06:15 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 503I6F1910682946
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Jan 2025 18:06:15 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 481A45805A;
	Fri,  3 Jan 2025 18:06:15 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E26358054;
	Fri,  3 Jan 2025 18:06:14 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  3 Jan 2025 18:06:14 +0000 (GMT)
Message-ID: <462aae86-70b5-47ad-84ef-de062c3851f8@linux.ibm.com>
Date: Fri, 3 Jan 2025 13:06:14 -0500
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] crypto: ecdsa - Fix NIST P521 key size reported by
 KEYCTL_PKEY_QUERY
To: Lukas Wunner <lukas@wunner.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Vitaly Chikunov <vt@altlinux.org>, David Howells <dhowells@redhat.com>,
        Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org,
        keyrings@vger.kernel.org
References: <cover.1735236227.git.lukas@wunner.de>
 <a0e1aa407de754e03a7012049e45e25d7af10e08.1735236227.git.lukas@wunner.de>
 <b8d40d86-21b5-40c6-89c7-3d792e3a791c@linux.ibm.com>
 <Z3ggfuaY9WgApXbW@wunner.de>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <Z3ggfuaY9WgApXbW@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SSpeyntOs41kYGCxsl-ZAQz56D9SzWeu
X-Proofpoint-ORIG-GUID: SSpeyntOs41kYGCxsl-ZAQz56D9SzWeu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 mlxlogscore=822
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030159



On 1/3/25 12:38 PM, Lukas Wunner wrote:
> On Thu, Jan 02, 2025 at 12:45:47PM -0500, Stefan Berger wrote:
>> On 12/26/24 1:08 PM, Lukas Wunner wrote:
>>> When user space issues a KEYCTL_PKEY_QUERY system call for a NIST P521
>>> key, the key_size is incorrectly reported as 528 bits instead of 521.
>>
>> Is there a way to query this with keyctl pkey_query?
> 
> Yes, these are the commands I've used for testing:
> 
>    id=`keyctl padd asymmetric "" %:_uid.0 < end_responder.cert.der`
>    keyctl pkey_query $id 0 enc=x962 hash=sha256
> 

I had tried with these here as root:

# keyctl show %keyring:.ima
Keyring
  461728044 ---lswrv      0     0  keyring: .ima
  579203092 ---lswrv      0     0   \_ asymmetric: Fedora kernel signing 
key: 50e9f2a484a5b9e7279e7bf7f3ad54b0572c2f1e
  774765589 --als--v      0     0   \_ asymmetric: my rsa signing key: 
69f518ae20dbb4a412f33b8950b2fd1e2b850fd1
   15381609 --als--v      0     0   \_ asymmetric: my ecc signing key: 
0ab4280f3df700f2cb6711b930748e1224eae40d
   72176491 --als--v      0     0   \_ asymmetric: Fedora 42 IMA 
Code-signing cert: a1a5c4c8d90554e0ce5c07c9e127f20362f02aa4
  612838334 --als--v      0     0   \_ asymmetric: Fedora 41 IMA 
Code-signing cert: 158befb98fc2ee070833d1a2a46669e7876d7435
   51623090 --als--v      0     0   \_ asymmetric: Fedora 40 IMA 
Code-signing cert: 2defa2e1d528db308d3e1ca28274aa40a3204a9e
   85986135 --als--v      0     0   \_ asymmetric: Fedora 39 IMA 
Code-signing cert: 155266a4a3ea7bdddc9e38ddb192c2d2388b603e
# keyctl pkey_query 612838334 0 enc=x962
keyctl_pkey_query: Permission denied
# keyctl pkey_query 612838334 0 enc=x962 hash=sha256
keyctl_pkey_query: Permission denied
# keyctl pkey_query 579203092 0 enc=x962 hash=sha256
keyctl_pkey_query: Permission denied
# keyctl pkey_query 774765589 0 enc=x962 hash=sha256
keyctl_pkey_query: Permission denied


> This is the certificate I've used:
> 
>    https://github.com/DMTF/libspdm/raw/refs/heads/main/unit_test/sample_key/ecp521/end_responder.cert.der

# keyctl show
Session Keyring
  377868180 --alswrv      0     0  keyring: _ses
1014059943 --alswrv      0 65534   \_ keyring: _uid.0
  138203159 --als--v      0     0       \_ asymmetric: DMTF libspdm 
ECP521 responder cert: e4bcd74895d3a7bd230ad2a46941c3be6d5c91cc

# keyctl pkey_query $id 0 enc=x962 hash=sha256
key_size=528
max_data_size=64
max_sig_size=139
max_enc_size=66
max_dec_size=66
encrypt=n
decrypt=n
sign=n
verify=y

more favorable permissions - obviously

Thanks!

   Stefan

 > > Before:
> 
>    key_size=528
>    max_data_size=64
>    max_sig_size=139
>    max_enc_size=66
>    max_dec_size=66
>    encrypt=n
>    decrypt=n
>    sign=n
>    verify=y
> 
> After:
> 
>    key_size=521
>    max_data_size=64
>    max_sig_size=139
>    max_enc_size=0
>    max_dec_size=0
>    encrypt=n
>    decrypt=n
>    sign=n
>    verify=y
> 
> Thanks,
> 
> Lukas
> 


