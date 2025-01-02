Return-Path: <keyrings+bounces-2325-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC38B9FFA36
	for <lists+keyrings@lfdr.de>; Thu,  2 Jan 2025 15:10:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C0A16216D
	for <lists+keyrings@lfdr.de>; Thu,  2 Jan 2025 14:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3791B415B;
	Thu,  2 Jan 2025 14:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Vvt/uIVk"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE881B4153;
	Thu,  2 Jan 2025 14:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735826989; cv=none; b=nMZAycBDw98Xo/DkREXuzvyBAg+O3glzh3dW3UHyxvgI33D2xQ/d6pp8x+89a3nP0MT2fgCGSPwiTcn9cN1lfQqpR4ntRJ8xFwV5/UsTc3I00DP+X1K43EMoLTQ38kfcwpFHVXezfUae8J2nI9DN0b9uxfvOU2/5zbfnCOn8tDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735826989; c=relaxed/simple;
	bh=wf/BXTqUwyks0L686WRhCdaGqZcMEo7BEfnvb0XG8Qo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aOfQ8YsN4QtKxk+OhezbF1V8YIOwfyirRsQKgJ1j+biPhLxkQtw5sohZDCRWta5tI7kc4F5UXLcR+MFEZkl91/Q2N9y43eZJHr9ta9PmMaGcKM1D/u4sA0y2SaEZ94U2iLxsXCIy4+4vCyYe7QpL64IVGB9K8MxGqwINb09tPdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Vvt/uIVk; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5020tWw8008721;
	Thu, 2 Jan 2025 14:09:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=pQMZq6
	I1aBXhJpThb5Lh40IO10ywPDLwljQqV+aBvls=; b=Vvt/uIVkHkwDXhEBjQ2eVg
	VziGChpmRow7V25kfEPtkvUr2tthHWWNTSkwuHNIDMQ7XjRrnNmWBYI4q8RyFNUb
	Vakr8HNoopd6v+qzk0tjIWcBZZTZvRdk0+01D6be4J+WFSR0982dWvNroPYbX6pI
	D78361t5LewDl6I3zguMpzPFazGz7AwvVrCzn0YVKud596dsJIcG3xZIXeYM9blz
	r/D8FD1V3bTj8DMKwA/1+Ae2j04rkDbYpV0racr8ZctPp5zY1e1p2fu/nEihp192
	wrdjxzcrsoStRZ068LzSxOS7abSxP4TExIP+PTqyRflNXwHVtQibjFvpl8y/ngIQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43wfhaaeq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 14:09:36 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5028ocW6014589;
	Thu, 2 Jan 2025 14:09:35 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43tunstf62-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 14:09:35 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 502E9YLL21758500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 14:09:34 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A19A65805A;
	Thu,  2 Jan 2025 14:09:34 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E063858054;
	Thu,  2 Jan 2025 14:09:33 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Jan 2025 14:09:33 +0000 (GMT)
Message-ID: <8f46d1a5-8ac5-4e41-b73f-da56c765bca1@linux.ibm.com>
Date: Thu, 2 Jan 2025 09:09:33 -0500
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] crypto: ecdsa - Fix enc/dec size reported by
 KEYCTL_PKEY_QUERY
To: Lukas Wunner <lukas@wunner.de>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Vitaly Chikunov <vt@altlinux.org>
Cc: David Howells <dhowells@redhat.com>,
        Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org,
        keyrings@vger.kernel.org
References: <cover.1735236227.git.lukas@wunner.de>
 <0de2a7e0c0f35e468486693a7db2f6e0b0092a64.1735236227.git.lukas@wunner.de>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <0de2a7e0c0f35e468486693a7db2f6e0b0092a64.1735236227.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M2J3eLsfo3mChW26BG-v0_6L-YukTRA2
X-Proofpoint-ORIG-GUID: M2J3eLsfo3mChW26BG-v0_6L-YukTRA2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 mlxscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501020123



On 12/26/24 1:08 PM, Lukas Wunner wrote:
> KEYCTL_PKEY_QUERY system calls for ecdsa keys return the key size as
> max_enc_size and max_dec_size, even though such keys cannot be used for
> encryption/decryption.  They're exclusively for signature generation or
> verification.
> 
> Only rsa keys with pkcs1 encoding can also be used for encryption or
> decryption.
> 
> Return 0 instead for ecdsa keys (as well as ecrdsa keys).
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>   crypto/asymmetric_keys/public_key.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
> index bf165d321440..dd44a966947f 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -188,6 +188,8 @@ static int software_key_query(const struct kernel_pkey_params *params,
>   	ptr = pkey_pack_u32(ptr, pkey->paramlen);
>   	memcpy(ptr, pkey->params, pkey->paramlen);
>   
> +	memset(info, 0, sizeof(*info));
> +
>   	if (issig) {
>   		sig = crypto_alloc_sig(alg_name, 0, 0);
>   		if (IS_ERR(sig)) {
> @@ -211,6 +213,9 @@ static int software_key_query(const struct kernel_pkey_params *params,
>   			info->supported_ops |= KEYCTL_SUPPORTS_SIGN;
>   
>   		if (strcmp(params->encoding, "pkcs1") == 0) {
> +			info->max_enc_size = len;
> +			info->max_dec_size = len;
> +
>   			info->supported_ops |= KEYCTL_SUPPORTS_ENCRYPT;
>   			if (pkey->key_is_private)
>   				info->supported_ops |= KEYCTL_SUPPORTS_DECRYPT;
> @@ -232,6 +237,8 @@ static int software_key_query(const struct kernel_pkey_params *params,
>   		len = crypto_akcipher_maxsize(tfm);
>   		info->max_sig_size = len;
>   		info->max_data_size = len;
> +		info->max_enc_size = len;
> +		info->max_dec_size = len;
>   
>   		info->supported_ops = KEYCTL_SUPPORTS_ENCRYPT;
>   		if (pkey->key_is_private)
> @@ -239,8 +246,6 @@ static int software_key_query(const struct kernel_pkey_params *params,
>   	}
>   
>   	info->key_size = len * 8;
> -	info->max_enc_size = len;
> -	info->max_dec_size = len;
>   
>   	ret = 0;
>   

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


