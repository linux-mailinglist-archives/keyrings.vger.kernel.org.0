Return-Path: <keyrings+bounces-2442-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DB7A50A5E
	for <lists+keyrings@lfdr.de>; Wed,  5 Mar 2025 19:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 20CD01886522
	for <lists+keyrings@lfdr.de>; Wed,  5 Mar 2025 18:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB54B2459FC;
	Wed,  5 Mar 2025 18:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="bny9FZEo"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3381A5BB7;
	Wed,  5 Mar 2025 18:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741200873; cv=none; b=XXkGgASbhO0KjkvLWu/x/2G2BKUYKdeQBYI18P3nIAjH3QSK6H92JjL6EG+HxYXA9eTPcczI/UB2IIcPIY6Bs74Lvo/sXrGgXLL0TJyxlmAihhWq3OLs9xsTN8RXt4lwrnuApd+DC97uliOM5Wa1511sXFz9DSTGdyt7puZIHEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741200873; c=relaxed/simple;
	bh=CbChfp8lJfvdn5jPVYnbn3Uig3yhhhPAVMBtVdz6QXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AtQmdDDg7It5CJImMoqyIbuiu6MV/Y5sZvgS7FB9NbdjKXCJmm9pDSR5ftChKwoQ4Vzp+HEGg/T9fUH5Eum7ShIXyGtAoMyHiQcyCyp5wQgr33HW1/jo3bHCRY1DVgkc3krFTMjnq4zqZhJglYoJ9uuXnCwyPDGm04WrR/YXp/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=bny9FZEo; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525HZCmh009045;
	Wed, 5 Mar 2025 18:54:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wExP9N
	uZBv+RC3GF+ZvNlxJ+lro0zFwpBLXKWYDV2Vw=; b=bny9FZEocGvs/gbQnyOFrt
	GXTNcrOxJbqw5VIosbHZdJS1Gwgw+KSlNksucl+7b4sdt3ZouJxUImxN024ntphT
	rXIvp1ZT02KOS7LZYIJfdfXcHg9MQQbh/rYuzQp2qhGnrX8pPh53zTekAaZGs3L+
	aE8w9ypIrMn+XF0JpnnwmnDW6fWNd9KIeS7W4rA6cl7DXeD57h6JQ1E2diqpBi0e
	d1qDN7sgDUnHZFSMYCPkLtG2GucToQQGy3wLv4LgDQFSHtT12VoXPRT+cJwHWS/O
	gt5azrFbZ/OUqdzgjdEDvKzlqEU3G1ZF9IfcSjB8wionj3HZVbgYE+JvLJvoOYkQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4568ppdf99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 18:54:08 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 525InFUe002660;
	Wed, 5 Mar 2025 18:54:08 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4568ppdf97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 18:54:08 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 525GRgrk025044;
	Wed, 5 Mar 2025 18:54:07 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 454f923x4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Mar 2025 18:54:07 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 525Is6sn25100598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Mar 2025 18:54:06 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8122A58055;
	Wed,  5 Mar 2025 18:54:06 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE65258043;
	Wed,  5 Mar 2025 18:54:05 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Mar 2025 18:54:05 +0000 (GMT)
Message-ID: <9689ce4c-0e8c-408f-b89a-7b285d41fe60@linux.ibm.com>
Date: Wed, 5 Mar 2025 13:54:05 -0500
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add Lukas & Ignat & Stefan for asymmetric
 keys
To: Lukas Wunner <lukas@wunner.de>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        David Howells
 <dhowells@redhat.com>,
        Ignat Korchagin <ignat@cloudflare.com>
Cc: Tadeusz Struk <tstruk@gmail.com>, Tadeusz Struk <tstruk@gigaio.com>,
        Vitaly Chikunov <vt@altlinux.org>, linux-crypto@vger.kernel.org,
        keyrings@vger.kernel.org, Eric Biggers <ebiggers@google.com>
References: <90c171d5beed08bcf65ec2df6357a7ac97520b91.1741194399.git.lukas@wunner.de>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <90c171d5beed08bcf65ec2df6357a7ac97520b91.1741194399.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: myFb4A2B3YBpefhkMKTWlJVhX7OVsZYM
X-Proofpoint-ORIG-GUID: VbJmzrYICTbKD_su0BEbQNVnTiYBZ6hg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_07,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011 malwarescore=0
 mlxscore=0 impostorscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503050142



On 3/5/25 12:14 PM, Lukas Wunner wrote:
> Herbert asks for long-term maintenance of everything under
> crypto/asymmetric_keys/ and associated algorithms (ECDSA, GOST, RSA) [1].
> 
> Ignat has kindly agreed to co-maintain this with me going forward.
> 
> Stefan has agreed to be added as reviewer for ECDSA.  He introduced it
> in 2021 and has been meticulously providing reviews for 3rd party
> patches anyway.
> 
> Retain David Howells' maintainer entry until he explicitly requests to
> be removed.  He originally introduced asymmetric keys in 2012.
> 
> RSA was introduced by Tadeusz Struk as an employee of Intel in 2015,
> but he's changed jobs and last contributed to the implementation in 2016.
> 
> GOST was introduced by Vitaly Chikunov as an employee of Basealt LLC [2]
> (Базальт СПО [3]) in 2019.  This company is an OFAC sanctioned entity
> [4][5], which makes employees ineligible as maintainer [6].  It's not
> clear if Vitaly is still working for Basealt, he did not immediately
> respond to my e-mail.  Since knowledge and use of GOST algorithms is
> relatively limited outside the Russian Federation, assign "Odd fixes"
> status for now.
> 
> [1] https://lore.kernel.org/r/Z8QNJqQKhyyft_gz@gondor.apana.org.au/
> [2] https://prohoster.info/ru/blog/novosti-interneta/reliz-yadra-linux-5-2
> [3] https://www.basealt.ru/
> [4] https://ofac.treasury.gov/recent-actions/20240823
> [5] https://sanctionssearch.ofac.treas.gov/Details.aspx?id=50178
> [6] https://lore.kernel.org/r/7ee74c1b5b589619a13c6318c9fbd0d6ac7c334a.camel@HansenPartnership.com/
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

> ---
>   MAINTAINERS | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8e0736d..b16a1cc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3595,14 +3595,42 @@ F:	drivers/hwmon/asus_wmi_sensors.c
>   
>   ASYMMETRIC KEYS
>   M:	David Howells <dhowells@redhat.com>
> +M:	Lukas Wunner <lukas@wunner.de>
> +M:	Ignat Korchagin <ignat@cloudflare.com>
>   L:	keyrings@vger.kernel.org
> +L:	linux-crypto@vger.kernel.org
>   S:	Maintained
>   F:	Documentation/crypto/asymmetric-keys.rst
>   F:	crypto/asymmetric_keys/
>   F:	include/crypto/pkcs7.h
>   F:	include/crypto/public_key.h
> +F:	include/keys/asymmetric-*.h
>   F:	include/linux/verification.h
>   
> +ASYMMETRIC KEYS - ECDSA
> +M:	Lukas Wunner <lukas@wunner.de>
> +M:	Ignat Korchagin <ignat@cloudflare.com>
> +R:	Stefan Berger <stefanb@linux.ibm.com>
> +L:	linux-crypto@vger.kernel.org
> +S:	Maintained
> +F:	crypto/ecc*
> +F:	crypto/ecdsa*
> +F:	include/crypto/ecc*
> +
> +ASYMMETRIC KEYS - GOST
> +M:	Lukas Wunner <lukas@wunner.de>
> +M:	Ignat Korchagin <ignat@cloudflare.com>
> +L:	linux-crypto@vger.kernel.org
> +S:	Odd fixes
> +F:	crypto/ecrdsa*
> +
> +ASYMMETRIC KEYS - RSA
> +M:	Lukas Wunner <lukas@wunner.de>
> +M:	Ignat Korchagin <ignat@cloudflare.com>
> +L:	linux-crypto@vger.kernel.org
> +S:	Maintained
> +F:	crypto/rsa*
> +
>   ASYNCHRONOUS TRANSFERS/TRANSFORMS (IOAT) API
>   R:	Dan Williams <dan.j.williams@intel.com>
>   S:	Odd fixes


