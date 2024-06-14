Return-Path: <keyrings+bounces-1616-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A20D908392
	for <lists+keyrings@lfdr.de>; Fri, 14 Jun 2024 08:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 584EE1C22EA1
	for <lists+keyrings@lfdr.de>; Fri, 14 Jun 2024 06:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B929D1448D7;
	Fri, 14 Jun 2024 06:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TGbh30l1"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0061B3EA7B;
	Fri, 14 Jun 2024 06:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718345868; cv=none; b=bBCKyPPpE7O3CfiTa2fpq8OFIJb0nyC8QzKzSQxfp/akfrMBWywhvg51fT6IiVtAZyktKIvFYqEZGfeY49odMy18gOWk9obMKBYmBWyOng/V0wDETncgTrmyLrJ8QooXExZS88rd/fu47LSAHXsASd58lFbzX69y6VgizUNh/pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718345868; c=relaxed/simple;
	bh=eUysjo7n92xhbgcglYOc+3gcPHLAzDqyZv5RxuoqAYw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uTpXZLt+c3PfveIrFDdhCKMD1p0cvVdoYIbQ2nXnughBj/LR5tF6xGn2r4W7iiqfQxlIslxSnSddPP7cObdpOVeWepSBjMRDS4aAnoZkU73Bvxfovt+HADq1Ew/BQ871GFlSqfVuxKVgv/SQOaGQsacl22kjidBMkn/icGJNd4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; spf=none smtp.mailfrom=linux.vnet.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TGbh30l1; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.vnet.ibm.com
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45E4Qvd7023215;
	Fri, 14 Jun 2024 06:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	8H4T+4b8Bi/qkliYB7EjavN/cd30fvA4EnVz2Kbvl0w=; b=TGbh30l1/IGYvogj
	ZPRiXcR0TUdsBbyzzXS+BwAI+vJIM+rC9iJEwWvwM2CKFPVEO5hNoxBT0d15/O7l
	EKb/O/yRm4fdysz42aE5s0g7fo9W3MCA9RYoLmZUz3XHHkNZEa6LCBwTUaMHanj3
	ba6Ek8dLORILhpiu5mVA8a+pg/tbj0/9M0sm3NzSYyuML+MIMjYfCfzYFYjAD49C
	uPlZdBcodfWS5f3rfigysu4YL3FZNnwtDnVNFdSW9+3yLUdmHRDVUgIkCocOickP
	unI8SZOQZIEil213HmBYurxSXTKdb+zzUKeaGgyrfsLJKVDngpEHcQXq7R9vxEvE
	CKhQOw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yrbbt8pbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 06:17:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45E61PGR027225;
	Fri, 14 Jun 2024 06:17:34 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yn211ey8y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jun 2024 06:17:34 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45E6HW9r1442366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jun 2024 06:17:34 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E2925805B;
	Fri, 14 Jun 2024 06:17:32 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E07F15805E;
	Fri, 14 Jun 2024 06:17:28 +0000 (GMT)
Received: from [9.43.5.15] (unknown [9.43.5.15])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Jun 2024 06:17:28 +0000 (GMT)
Message-ID: <e44fab6a-8ae7-4cbc-86c6-c9a50458b0d5@linux.vnet.ibm.com>
Date: Fri, 14 Jun 2024 11:47:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: ecc - Fix off-by-one missing to clear most
 significant digit
Content-Language: en-GB
To: Stefan Berger <stefanb@linux.ibm.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, jarkko@kernel.org
References: <20240613213820.995832-1-stefanb@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
In-Reply-To: <20240613213820.995832-1-stefanb@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XMLOpWWF7ZPVMXnNL9lQjP25GFo0udVk
X-Proofpoint-ORIG-GUID: XMLOpWWF7ZPVMXnNL9lQjP25GFo0udVk
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_15,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1011 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406140038

Tested with the proposed patch and issue is fixed.


Tested-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>

Regards,

Venkat.

On 14/06/24 3:08 am, Stefan Berger wrote:
> Fix an off-by-one error where the most significant digit was not
> initialized leading to signature verification failures by the testmgr.
>
> Example: If a curve requires ndigits (=9) and diff (=2) indicates that
> 2 digits need to be set to zero then start with digit 'ndigits - diff' (=7)
> and clear 'diff' digits starting from there, so 7 and 8.
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
> Closes: https://lore.kernel.org/linux-crypto/619bc2de-b18a-4939-a652-9ca886bf6349@linux.ibm.com/T/#m045d8812409ce233c17fcdb8b88b6629c671f9f4
> Fixes: 2fd2a82ccbfc ("crypto: ecdsa - Use ecc_digits_from_bytes to create hash digits array")
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> ---
>   crypto/ecc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/crypto/ecc.c b/crypto/ecc.c
> index fe761256e335..dd48d9928a21 100644
> --- a/crypto/ecc.c
> +++ b/crypto/ecc.c
> @@ -78,7 +78,7 @@ void ecc_digits_from_bytes(const u8 *in, unsigned int nbytes,
>   	/* diff > 0: not enough input bytes: set most significant digits to 0 */
>   	if (diff > 0) {
>   		ndigits -= diff;
> -		memset(&out[ndigits - 1], 0, diff * sizeof(u64));
> +		memset(&out[ndigits], 0, diff * sizeof(u64));
>   	}
>   
>   	if (o) {

