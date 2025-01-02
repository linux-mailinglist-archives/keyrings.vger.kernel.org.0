Return-Path: <keyrings+bounces-2326-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3389FFAC2
	for <lists+keyrings@lfdr.de>; Thu,  2 Jan 2025 16:06:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B13A1615BD
	for <lists+keyrings@lfdr.de>; Thu,  2 Jan 2025 15:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD2A18B492;
	Thu,  2 Jan 2025 15:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="drpA8pFU"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB086BA20;
	Thu,  2 Jan 2025 15:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735830402; cv=none; b=fvvkbLdVIQq84y7qP/OQ6UgaegYWAgeGduonEZLTicVpoVtE/R6hlFNbHcB4x2Ki+P/1XDSi/zOnKvXtShu4axr3w9uEsGNEJYAvkYizwkscM887fHaxXZOrIXCHwugVrj9/1LD+Sgc11rA9eimafksO8/+3P5XapMEwSZDM424=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735830402; c=relaxed/simple;
	bh=6Zu9pNX5c4tYjpn8wKFejRtgG1QlygoQWQP6oaDR180=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mx9b2n70ElpvsZtK3jDTWloWuvb9Vnk5nh31EtP7P9W7AdHMLAqhFTbMV0PUd/CuwQ2AYEJKQ+zYHNUrYmVg8Rnn8HzhGcbmZcaH7f5WVBFukwAo4kM/dixAdbt2ZwS87yod9uF/KF403/VlyC9D2Vq74wjf4w3/gItx1usaZjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=drpA8pFU; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50285jlL014954;
	Thu, 2 Jan 2025 15:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bLaOeH
	kGBrp4SVUbqdVyY9KTAM/OaKghsMpEAfdWNts=; b=drpA8pFUm4K8uNgl9Gya3h
	1sp5pZh8yOHgjA8bOtmTlsGfqbVZG8xRgbRNQjbyxEL7HCTlhv5K1WDZDmGDDgcq
	31JhWiIuUREctIoH8vI9vPPAjbMBKE/vp7GpZPEFFB/Jec4pmkjcqmWfo+xcKqa2
	M1Fvx2iphzrszy/WAn8UyCII8udZ9GhbX5cMFMyVwa0Liw1m6bRj3/qVVZyICCvq
	NLrdCmDVpRKM3Ymc3afytXdNlva+KrG23gNdd+syGvMASdCHuKTjop77B36lKCsA
	EkFmPodMoAyzKBegYD9HaUNfBbswNCPDo8KwQeGEXraHDcnRL4vJ9GfAf/JYjjFg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43wq029d9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 15:06:33 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 502BTWEC004362;
	Thu, 2 Jan 2025 15:06:32 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43twvk28ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 15:06:32 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 502F6VYV28377770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 15:06:32 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 967285805F;
	Thu,  2 Jan 2025 15:06:31 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D83F758054;
	Thu,  2 Jan 2025 15:06:30 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Jan 2025 15:06:30 +0000 (GMT)
Message-ID: <3c05dcae-7ec6-4305-ba2b-d0368c69ac2a@linux.ibm.com>
Date: Thu, 2 Jan 2025 10:06:30 -0500
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] crypto: sig - Prepare for algorithms with variable
 signature size
To: Lukas Wunner <lukas@wunner.de>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Vitaly Chikunov <vt@altlinux.org>
Cc: David Howells <dhowells@redhat.com>,
        Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org,
        keyrings@vger.kernel.org
References: <cover.1735236227.git.lukas@wunner.de>
 <c6cc21391c52e06511d619170c443e84f28a72a4.1735236227.git.lukas@wunner.de>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <c6cc21391c52e06511d619170c443e84f28a72a4.1735236227.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: K2I7qZ6Pz7tDJaTbA7NIbqcw57ZBPQ5C
X-Proofpoint-GUID: K2I7qZ6Pz7tDJaTbA7NIbqcw57ZBPQ5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501020132



On 12/26/24 1:08 PM, Lukas Wunner wrote:
> The callers of crypto_sig_sign() assume that the signature size is
> always equivalent to the key size.
> 
> This happens to be true for RSA, which is currently the only algorithm
> implementing the ->sign() callback.  But it is false e.g. for X9.62
> encoded ECDSA signatures because they have variable length.
> 
> Prepare for addition of a ->sign() callback to such algorithms by
> letting the callback return the signature size (or a negative integer
> on error).  When testing the ->sign() callback in test_sig_one(),
> use crypto_sig_maxsize() instead of crypto_sig_keysize() to verify that
> the test vector's signature does not exceed an algorithm's maximum
> signature size.
> 
> There has been a relatively recent effort to upstream ECDSA signature
> generation support which may benefit from this change:
> 
> https://lore.kernel.org/linux-crypto/20220908200036.2034-1-ignat@cloudflare.com/
> 
> However the main motivation for this commit is to reduce the number of
> crypto_sig_keysize() callers:  This function is about to be changed to
> return the size in bits instead of bytes and that will require amending
> most callers to divide the return value by 8.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Cc: Ignat Korchagin <ignat@cloudflare.com>
> ---
>   crypto/asymmetric_keys/public_key.c | 9 ++-------
>   crypto/rsassa-pkcs1.c               | 2 +-
>   crypto/testmgr.c                    | 7 ++++---
>   include/crypto/sig.h                | 5 +++--
>   4 files changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
> index bbd07a9022e6..bf165d321440 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -267,7 +267,6 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
>   	struct crypto_sig *sig;
>   	char *key, *ptr;
>   	bool issig;
> -	int ksz;
>   	int ret;
>   
>   	pr_devel("==>%s()\n", __func__);
> @@ -302,8 +301,6 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
>   			ret = crypto_sig_set_pubkey(sig, key, pkey->keylen);
>   		if (ret)
>   			goto error_free_tfm;
> -
> -		ksz = crypto_sig_keysize(sig);
>   	} else {
>   		tfm = crypto_alloc_akcipher(alg_name, 0, 0);
>   		if (IS_ERR(tfm)) {
> @@ -317,8 +314,6 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
>   			ret = crypto_akcipher_set_pub_key(tfm, key, pkey->keylen);
>   		if (ret)
>   			goto error_free_tfm;
> -
> -		ksz = crypto_akcipher_maxsize(tfm);
>   	}
>   
>   	ret = -EINVAL;
> @@ -347,8 +342,8 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
>   		BUG();
>   	}
>   
> -	if (ret == 0)
> -		ret = ksz;
> +	if (!issig && ret == 0)
> +		ret = crypto_akcipher_maxsize(tfm);
>   
>   error_free_tfm:
>   	if (issig)
> diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
> index f68ffd338f48..d01ac75635e0 100644
> --- a/crypto/rsassa-pkcs1.c
> +++ b/crypto/rsassa-pkcs1.c
> @@ -210,7 +210,7 @@ static int rsassa_pkcs1_sign(struct crypto_sig *tfm,
>   		memset(dst, 0, pad_len);
>   	}
>   
> -	return 0;
> +	return ctx->key_size;
>   }
>   
>   static int rsassa_pkcs1_verify(struct crypto_sig *tfm,
> diff --git a/crypto/testmgr.c b/crypto/testmgr.c
> index 1f5f48ab18c7..76c013bcebe5 100644
> --- a/crypto/testmgr.c
> +++ b/crypto/testmgr.c
> @@ -4339,7 +4339,7 @@ static int test_sig_one(struct crypto_sig *tfm, const struct sig_testvec *vecs)
>   	if (vecs->public_key_vec)
>   		return 0;
>   
> -	sig_size = crypto_sig_keysize(tfm);
> +	sig_size = crypto_sig_maxsize(tfm);
>   	if (sig_size < vecs->c_size) {
>   		pr_err("alg: sig: invalid maxsize %u\n", sig_size);
>   		return -EINVAL;
> @@ -4351,13 +4351,14 @@ static int test_sig_one(struct crypto_sig *tfm, const struct sig_testvec *vecs)
>   
>   	/* Run asymmetric signature generation */
>   	err = crypto_sig_sign(tfm, vecs->m, vecs->m_size, sig, sig_size);
> -	if (err) {
> +	if (err < 0) {
>   		pr_err("alg: sig: sign test failed: err %d\n", err);
>   		return err;
>   	}
>   
>   	/* Verify that generated signature equals cooked signature */
> -	if (memcmp(sig, vecs->c, vecs->c_size) ||
> +	if (err != vecs->c_size ||
> +	    memcmp(sig, vecs->c, vecs->c_size) ||
>   	    memchr_inv(sig + vecs->c_size, 0, sig_size - vecs->c_size)) {
>   		pr_err("alg: sig: sign test failed: invalid output\n");
>   		hexdump(sig, sig_size);
> diff --git a/include/crypto/sig.h b/include/crypto/sig.h
> index cff41ad93824..11024708c069 100644
> --- a/include/crypto/sig.h
> +++ b/include/crypto/sig.h
> @@ -23,7 +23,8 @@ struct crypto_sig {
>    * struct sig_alg - generic public key signature algorithm
>    *
>    * @sign:	Function performs a sign operation as defined by public key
> - *		algorithm. Optional.
> + *		algorithm. On success, the signature size is returned.
> + *		Optional.
>    * @verify:	Function performs a complete verify operation as defined by
>    *		public key algorithm, returning verification status. Optional.
>    * @set_pub_key: Function invokes the algorithm specific set public key
> @@ -186,7 +187,7 @@ static inline unsigned int crypto_sig_maxsize(struct crypto_sig *tfm)
>    * @dst:	destination obuffer
>    * @dlen:	destination length
>    *
> - * Return: zero on success; error code in case of error
> + * Return: signature size on success; error code in case of error
>    */
>   static inline int crypto_sig_sign(struct crypto_sig *tfm,
>   				  const void *src, unsigned int slen,

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


