Return-Path: <keyrings+bounces-1975-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7FF9742E6
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 21:04:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14812286CA8
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 19:04:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1847817A922;
	Tue, 10 Sep 2024 19:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WW66xCj6"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59BE37143;
	Tue, 10 Sep 2024 19:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725995060; cv=none; b=BpOTGWYbeEa1RJUgdrb37wBhAugJ+ukh0lhOFynBO43kSdNnFMTRmjo748yukTDiHd1PW7mbv7vsJVoWuOd7gsgC9L1ZoPRf7pXkaRethaU1sKCBnd1sqE6wnnIZJhhH6jLals6zSRo4bYT2z3dKg5qxveoxLVvxpB376WV4WrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725995060; c=relaxed/simple;
	bh=T5JNfn3uiRcK0euJiFFF8yh51YBJl++76rtuFhF9NWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L+kxN8pJEpC7kSnGu3tdLinU0mlW8W1O6lG0po6bQs1Zg0LrMrcrQ3nalEbjE0JtEw0UFxmQh5mtjlPUDQq2JFTNQFHR6+CRjAmMhTBSoUE9a3m7BRoSk4OwD3jvVD2So/Om60KtOA9R4N6DgQ+GUnOpV1sso/jgyS0b5XNi9Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WW66xCj6; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48AAxRFc017217;
	Tue, 10 Sep 2024 19:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=W
	7MO5/LTdvyltj79Nt3NXwXiiF97QGR2crJS9hHNn0Q=; b=WW66xCj65e3ur6Zwc
	AK+D18HYPBQ6t0e1NYOIOFO2PzFDJ+6AqdbB8H5nqG73HRWNl48/FhP87P7+9CW5
	6c45kwg1G/Jjwkm2RRnsjWWTYQ4gvvgsSvm8cNPHLDzBcp6FS1qHzAVCu6/K9How
	jdFvMG87Mw71NN4QoSbaEDYtRAsBWxezZoybL3jazuf9YpQCBMPX9wwU2ule/BIC
	NrdZo3mPsOX090jW/14KvDBhRALyGiIrvHIEhQlIWfBRp8El2rd9Mt+y8ams2ESb
	F4VclUVSUpuCT8K1fczOuMEtPaydJ9B8hy1Hda5bpVR2B0Cmp9zfjF/UmJtKtejP
	qF/6w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gd8khbtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 19:03:51 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48AJ3oKP010728;
	Tue, 10 Sep 2024 19:03:50 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gd8khbtc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 19:03:50 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48AG6gLU019847;
	Tue, 10 Sep 2024 19:03:49 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41h25pw4n9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 19:03:49 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48AJ3mRJ50594280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Sep 2024 19:03:48 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 36BB75805F;
	Tue, 10 Sep 2024 19:03:48 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E73CC58052;
	Tue, 10 Sep 2024 19:03:46 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Sep 2024 19:03:46 +0000 (GMT)
Message-ID: <99766d53-5802-48fa-a557-124564213666@linux.ibm.com>
Date: Tue, 10 Sep 2024 15:03:46 -0400
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/19] crypto: rsa-pkcs1pad - Deduplicate
 set_{pub,priv}_key callbacks
To: Lukas Wunner <lukas@wunner.de>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Biggers <ebiggers@google.com>, Vitaly Chikunov <vt@altlinux.org>,
        Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>,
        Andrew Zaborowski <andrew.zaborowski@intel.com>,
        Saulo Alessandre <saulo.alessandre@tse.jus.br>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>,
        Varad Gautam <varadgautam@google.com>,
        Stephan Mueller
 <smueller@chronox.de>,
        Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org,
        keyrings@vger.kernel.org
References: <cover.1725972333.git.lukas@wunner.de>
 <e1254cbe30eb5bafd841d7ee50ee974bb63dda28.1725972334.git.lukas@wunner.de>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <e1254cbe30eb5bafd841d7ee50ee974bb63dda28.1725972334.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MlQJb-W0BWpyE5WU4ZygMb5dlzeSlHif
X-Proofpoint-ORIG-GUID: 4Wr0vsVWjDI2ruCxWohq6I3e3yoaq2d3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_06,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100141



On 9/10/24 10:30 AM, Lukas Wunner wrote:
> pkcs1pad_set_pub_key() and pkcs1pad_set_priv_key() are almost identical.
> 
> The upcoming migration of sign/verify operations from rsa-pkcs1pad.c
> into a separate crypto_template will require another copy of the exact
> same functions.  When RSASSA-PSS and RSAES-OAEP are introduced, each
> will need yet another copy.
> 
> Deduplicate the functions into a single one which lives in a common
> header file for reuse by RSASSA-PKCS1-v1_5, RSASSA-PSS and RSAES-OAEP.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>   crypto/rsa-pkcs1pad.c         | 30 ++----------------------------
>   include/crypto/internal/rsa.h | 28 ++++++++++++++++++++++++++++
>   2 files changed, 30 insertions(+), 28 deletions(-)
> 
> diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
> index cd501195f34a..3c5fe8c93938 100644
> --- a/crypto/rsa-pkcs1pad.c
> +++ b/crypto/rsa-pkcs1pad.c
> @@ -131,42 +131,16 @@ static int pkcs1pad_set_pub_key(struct crypto_akcipher *tfm, const void *key,
>   		unsigned int keylen)
>   {
>   	struct pkcs1pad_ctx *ctx = akcipher_tfm_ctx(tfm);
> -	int err;
> -
> -	ctx->key_size = 0;
>   
> -	err = crypto_akcipher_set_pub_key(ctx->child, key, keylen);
> -	if (err)
> -		return err;
> -
> -	/* Find out new modulus size from rsa implementation */
> -	err = crypto_akcipher_maxsize(ctx->child);
> -	if (err > PAGE_SIZE)
> -		return -ENOTSUPP;
> -
> -	ctx->key_size = err;
> -	return 0;
> +	return rsa_set_key(ctx->child, &ctx->key_size, RSA_PUB, key, keylen);
>   }
>   
>   static int pkcs1pad_set_priv_key(struct crypto_akcipher *tfm, const void *key,
>   		unsigned int keylen)
>   {
>   	struct pkcs1pad_ctx *ctx = akcipher_tfm_ctx(tfm);
> -	int err;
> -
> -	ctx->key_size = 0;
>   
> -	err = crypto_akcipher_set_priv_key(ctx->child, key, keylen);
> -	if (err)
> -		return err;
> -
> -	/* Find out new modulus size from rsa implementation */
> -	err = crypto_akcipher_maxsize(ctx->child);
> -	if (err > PAGE_SIZE)
> -		return -ENOTSUPP;
> -
> -	ctx->key_size = err;
> -	return 0;
> +	return rsa_set_key(ctx->child, &ctx->key_size, RSA_PRIV, key, keylen);
>   }
>   
>   static unsigned int pkcs1pad_get_max_size(struct crypto_akcipher *tfm)
> diff --git a/include/crypto/internal/rsa.h b/include/crypto/internal/rsa.h
> index e870133f4b77..754f687134df 100644
> --- a/include/crypto/internal/rsa.h
> +++ b/include/crypto/internal/rsa.h
> @@ -8,6 +8,7 @@
>   #ifndef _RSA_HELPER_
>   #define _RSA_HELPER_
>   #include <linux/types.h>
> +#include <crypto/akcipher.h>
>   
>   /**
>    * rsa_key - RSA key structure
> @@ -53,5 +54,32 @@ int rsa_parse_pub_key(struct rsa_key *rsa_key, const void *key,
>   int rsa_parse_priv_key(struct rsa_key *rsa_key, const void *key,
>   		       unsigned int key_len);
>   
> +#define RSA_PUB (true)
> +#define RSA_PRIV (false)
> +
> +static inline int rsa_set_key(struct crypto_akcipher *child,
> +			      unsigned int *key_size, bool is_pubkey,
> +			      const void *key, unsigned int keylen)
> +{
> +	int err;
> +
> +	*key_size = 0;
> +
> +	if (is_pubkey)
> +		err = crypto_akcipher_set_pub_key(child, key, keylen);
> +	else
> +		err = crypto_akcipher_set_priv_key(child, key, keylen);
> +	if (err)
> +		return err;
> +
> +	/* Find out new modulus size from rsa implementation */
> +	err = crypto_akcipher_maxsize(child);
> +	if (err > PAGE_SIZE)
> +		return -ENOTSUPP;
> +
> +	*key_size = err;
> +	return 0;
> +}
> +
>   extern struct crypto_template rsa_pkcs1pad_tmpl;
>   #endif

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

