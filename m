Return-Path: <keyrings+bounces-2327-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2DA9FFD14
	for <lists+keyrings@lfdr.de>; Thu,  2 Jan 2025 18:46:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB74418837C0
	for <lists+keyrings@lfdr.de>; Thu,  2 Jan 2025 17:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2152C1B4258;
	Thu,  2 Jan 2025 17:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="mtcBryi3"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94E31885B8;
	Thu,  2 Jan 2025 17:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735839961; cv=none; b=tiKINQeD9aLvvr57ebA8msouOqPk2jwruF4G214s+h6UqGsTsEhXSRcm3LpNk/wyvfbuS81OAe6rZUCEv8LobTVtId8k4GZ+8P8xJzxGPJYlUi/rdmiFXRiy060dO7C1/DaflrPfFGjGSqLZ2xlKWw2BsuTzYg8ykBky2W9/BR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735839961; c=relaxed/simple;
	bh=tmQhTiCIn9gyevDh3yvNWKWA5LLYp14Rt96hYz4avzw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BO5ECKKDF6+tT90/14MfcRuipdajBY4cMBwYnso//R7Iq3z0nxVtbqnJ0/cMBuKeXarOweZHJbxZ5VpZocHt/G++sCbQYZ3KmbfnJIg6gPgteCeQi0VpdW5OP9WFTY9bGEDfyJoASmTPbODWtk2am1GH3WbRl9BrpZ5AW65lTO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mtcBryi3; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5023qV4x001190;
	Thu, 2 Jan 2025 17:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Eh1oaW
	epWklCU/f3u9qbOrrc7x4/R0zHCU+lPD3utko=; b=mtcBryi331lTOBEb/onw/3
	cxFHJwlggisRjcDLxsZz8IyKnY2EgQh94K/rHdGqSWTTiAcp+rFh8U0XksMV8jLu
	uxK8eLpBvbKQIabDBAU5BZMWVzSWJevl6yVmRgCk4N93z/wgKbTQ0nkYFvKaOSVP
	8+TZcFSbpTz6PGedjJcT7kKxSjFta4I3WrF8d1couxFaIB7Wivv8BcaTCK5US0f3
	+0/5MIBOfl9ATr+1n8QzMwTaq8+Nt4QuKF9SfSVT/nw16mnl8yo6+MRg/hmzJSKo
	W4IstohJWvx7Yaw8a11xpyt3pkd97BiX5FA0jqz4p3+P8LNitRwVSnkmnWKYDKaQ
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43wk9bawna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 17:45:49 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 502FA6Is010206;
	Thu, 2 Jan 2025 17:45:48 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43tvnnk195-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 Jan 2025 17:45:48 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 502Hjm9421103348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 2 Jan 2025 17:45:48 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59F2958054;
	Thu,  2 Jan 2025 17:45:48 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 914D25805C;
	Thu,  2 Jan 2025 17:45:47 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  2 Jan 2025 17:45:47 +0000 (GMT)
Message-ID: <b8d40d86-21b5-40c6-89c7-3d792e3a791c@linux.ibm.com>
Date: Thu, 2 Jan 2025 12:45:47 -0500
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] crypto: ecdsa - Fix NIST P521 key size reported by
 KEYCTL_PKEY_QUERY
To: Lukas Wunner <lukas@wunner.de>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Vitaly Chikunov <vt@altlinux.org>
Cc: David Howells <dhowells@redhat.com>,
        Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org,
        keyrings@vger.kernel.org
References: <cover.1735236227.git.lukas@wunner.de>
 <a0e1aa407de754e03a7012049e45e25d7af10e08.1735236227.git.lukas@wunner.de>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <a0e1aa407de754e03a7012049e45e25d7af10e08.1735236227.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rT-rakK_yrFxIboM6BwJS3zQ3aP576km
X-Proofpoint-ORIG-GUID: rT-rakK_yrFxIboM6BwJS3zQ3aP576km
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 adultscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501020154

On 12/26/24 1:08 PM, Lukas Wunner wrote:
> When user space issues a KEYCTL_PKEY_QUERY system call for a NIST P521
> key, the key_size is incorrectly reported as 528 bits instead of 521.

Is there a way to query this with keyctl pkey_query?

 > > That's because the key size obtained through crypto_sig_keysize() is in
> bytes and software_key_query() multiplies by 8 to yield the size in bits.
> The underlying assumption is that the key size is always a multiple of 8.
> With the recent addition of NIST P521, that's no longer the case.
> 
> Fix by returning the key_size in bits from crypto_sig_keysize() and
> adjusting the calculations in software_key_query().
> 
> The ->key_size() callbacks of sig_alg algorithms now return the size in
> bits, whereas the ->digest_size() and ->max_size() callbacks return the
> size in bytes.  This matches with the units in struct keyctl_pkey_query.
> 
> Fixes: a7d45ba77d3d ("crypto: ecdsa - Register NIST P521 and extend test suite")
 > Signed-off-by: Lukas Wunner <lukas@wunner.de>> ---
>   crypto/asymmetric_keys/public_key.c | 8 ++++----
>   crypto/ecdsa-p1363.c                | 4 ++--
>   crypto/ecdsa-x962.c                 | 4 ++--
>   crypto/ecdsa.c                      | 2 +-
>   crypto/ecrdsa.c                     | 2 +-
>   crypto/rsassa-pkcs1.c               | 2 +-
>   crypto/sig.c                        | 9 +++++++--
>   include/crypto/sig.h                | 2 +-
>   8 files changed, 19 insertions(+), 14 deletions(-)
> 
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
> index dd44a966947f..6cafb2b8aa22 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -205,6 +205,7 @@ static int software_key_query(const struct kernel_pkey_params *params,
>   			goto error_free_tfm;
>   
>   		len = crypto_sig_keysize(sig);
> +		info->key_size = len;
>   		info->max_sig_size = crypto_sig_maxsize(sig);
>   		info->max_data_size = crypto_sig_digestsize(sig);
>   
> @@ -213,8 +214,8 @@ static int software_key_query(const struct kernel_pkey_params *params,
>   			info->supported_ops |= KEYCTL_SUPPORTS_SIGN;
>   
>   		if (strcmp(params->encoding, "pkcs1") == 0) {
> -			info->max_enc_size = len;
> -			info->max_dec_size = len;
> +			info->max_enc_size = len / 8;
> +			info->max_dec_size = len / 8;
>   
>   			info->supported_ops |= KEYCTL_SUPPORTS_ENCRYPT;
>   			if (pkey->key_is_private)
> @@ -235,6 +236,7 @@ static int software_key_query(const struct kernel_pkey_params *params,
>   			goto error_free_tfm;
>   
>   		len = crypto_akcipher_maxsize(tfm);
> +		info->key_size = len * 8;
>   		info->max_sig_size = len;
>   		info->max_data_size = len;
>   		info->max_enc_size = len;
> @@ -245,8 +247,6 @@ static int software_key_query(const struct kernel_pkey_params *params,
>   			info->supported_ops |= KEYCTL_SUPPORTS_DECRYPT;
>   	}
>   
> -	info->key_size = len * 8;
> -
>   	ret = 0;
>   
>   error_free_tfm:
> diff --git a/crypto/ecdsa-p1363.c b/crypto/ecdsa-p1363.c
> index eaae7214d69b..c4f458df18ed 100644
> --- a/crypto/ecdsa-p1363.c
> +++ b/crypto/ecdsa-p1363.c
> @@ -21,7 +21,7 @@ static int ecdsa_p1363_verify(struct crypto_sig *tfm,
>   			      const void *digest, unsigned int dlen)
>   {
>   	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
> -	unsigned int keylen = crypto_sig_keysize(ctx->child);
> +	unsigned int keylen = DIV_ROUND_UP(crypto_sig_keysize(ctx->child), 8);
>   	unsigned int ndigits = DIV_ROUND_UP(keylen, sizeof(u64));
>   	struct ecdsa_raw_sig sig;
>   
> @@ -45,7 +45,7 @@ static unsigned int ecdsa_p1363_max_size(struct crypto_sig *tfm)
>   {
>   	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
>   
> -	return 2 * crypto_sig_keysize(ctx->child);
> +	return 2 * DIV_ROUND_UP(crypto_sig_keysize(ctx->child), 8);
>   }
>   
>   static unsigned int ecdsa_p1363_digest_size(struct crypto_sig *tfm)
> diff --git a/crypto/ecdsa-x962.c b/crypto/ecdsa-x962.c
> index 6a77c13e192b..0327e1441374 100644
> --- a/crypto/ecdsa-x962.c
> +++ b/crypto/ecdsa-x962.c
> @@ -82,7 +82,7 @@ static int ecdsa_x962_verify(struct crypto_sig *tfm,
>   	int err;
>   
>   	sig_ctx.ndigits = DIV_ROUND_UP(crypto_sig_keysize(ctx->child),
> -				       sizeof(u64));
> +				       sizeof(u64) * 8);
>   
>   	err = asn1_ber_decoder(&ecdsasignature_decoder, &sig_ctx, src, slen);
>   	if (err < 0)
> @@ -103,7 +103,7 @@ static unsigned int ecdsa_x962_max_size(struct crypto_sig *tfm)
>   {
>   	struct ecdsa_x962_ctx *ctx = crypto_sig_ctx(tfm);
>   	struct sig_alg *alg = crypto_sig_alg(ctx->child);
> -	int slen = crypto_sig_keysize(ctx->child);
> +	int slen = DIV_ROUND_UP(crypto_sig_keysize(ctx->child), 8);
>   
>   	/*
>   	 * Verify takes ECDSA-Sig-Value (described in RFC 5480) as input,
> diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
> index 117526d15dde..a70b60a90a3c 100644
> --- a/crypto/ecdsa.c
> +++ b/crypto/ecdsa.c
> @@ -167,7 +167,7 @@ static unsigned int ecdsa_key_size(struct crypto_sig *tfm)
>   {
>   	struct ecc_ctx *ctx = crypto_sig_ctx(tfm);
>   
> -	return DIV_ROUND_UP(ctx->curve->nbits, 8);
> +	return ctx->curve->nbits;
>   }
>   
>   static unsigned int ecdsa_digest_size(struct crypto_sig *tfm)
> diff --git a/crypto/ecrdsa.c b/crypto/ecrdsa.c
> index b3dd8a3ddeb7..53c9fd9f807f 100644
> --- a/crypto/ecrdsa.c
> +++ b/crypto/ecrdsa.c
> @@ -249,7 +249,7 @@ static unsigned int ecrdsa_key_size(struct crypto_sig *tfm)
>   	 * Verify doesn't need any output, so it's just informational
>   	 * for keyctl to determine the key bit size.
>   	 */
> -	return ctx->pub_key.ndigits * sizeof(u64);
> +	return ctx->pub_key.ndigits * sizeof(u64) * 8;
>   }
>   
>   static unsigned int ecrdsa_max_size(struct crypto_sig *tfm)
> diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
> index d01ac75635e0..299b2512cc95 100644
> --- a/crypto/rsassa-pkcs1.c
> +++ b/crypto/rsassa-pkcs1.c
> @@ -301,7 +301,7 @@ static unsigned int rsassa_pkcs1_key_size(struct crypto_sig *tfm)
>   {
>   	struct rsassa_pkcs1_ctx *ctx = crypto_sig_ctx(tfm);
>   
> -	return ctx->key_size;
> +	return ctx->key_size * 8;
>   }
>   
>   static int rsassa_pkcs1_set_pub_key(struct crypto_sig *tfm,
> diff --git a/crypto/sig.c b/crypto/sig.c
> index dfc7cae90802..7399e67c6f12 100644
> --- a/crypto/sig.c
> +++ b/crypto/sig.c
> @@ -102,6 +102,11 @@ static int sig_default_set_key(struct crypto_sig *tfm,
>   	return -ENOSYS;
>   }
>   
> +static unsigned int sig_default_size(struct crypto_sig *tfm)
> +{
> +	return DIV_ROUND_UP(crypto_sig_keysize(tfm), 8);
> +}
> +
>   static int sig_prepare_alg(struct sig_alg *alg)
>   {
>   	struct crypto_alg *base = &alg->base;
> @@ -117,9 +122,9 @@ static int sig_prepare_alg(struct sig_alg *alg)
>   	if (!alg->key_size)
>   		return -EINVAL;
>   	if (!alg->max_size)
> -		alg->max_size = alg->key_size;
> +		alg->max_size = sig_default_size;
>   	if (!alg->digest_size)
> -		alg->digest_size = alg->key_size;
> +		alg->digest_size = sig_default_size;
>   
>   	base->cra_type = &crypto_sig_type;
>   	base->cra_flags &= ~CRYPTO_ALG_TYPE_MASK;
> diff --git a/include/crypto/sig.h b/include/crypto/sig.h
> index 11024708c069..fa6dafafab3f 100644
> --- a/include/crypto/sig.h
> +++ b/include/crypto/sig.h
> @@ -128,7 +128,7 @@ static inline void crypto_free_sig(struct crypto_sig *tfm)
>   /**
>    * crypto_sig_keysize() - Get key size
>    *
> - * Function returns the key size in bytes.
> + * Function returns the key size in bits.
>    * Function assumes that the key is already set in the transformation. If this
>    * function is called without a setkey or with a failed setkey, you may end up
>    * in a NULL dereference.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>


