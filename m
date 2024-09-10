Return-Path: <keyrings+bounces-1976-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CF097437E
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 21:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E697A1C24933
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 19:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3C2192D6C;
	Tue, 10 Sep 2024 19:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="lrX/vH1U"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6D017C7C4;
	Tue, 10 Sep 2024 19:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725996614; cv=none; b=DZSXHpir2AIiKygfozf34MUoN7zpgaqBtiPmvUuSQRSPC7Y8vwyGHtQoC4YlZsZmkEG5U4RtnclDvQqtwfsn4Wp/ZSz/X9T+9wg8eibL1lowSEwO7VWrk+BnQRTBWi9SU8qAr82AzuVYaWxx1IbpPeJ/s1IJTKrS+Uc39ybpGxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725996614; c=relaxed/simple;
	bh=NzIteahWsR/8lxm1A1NB0eWE4FxXmXBbB6oFSDuJq/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l5ftz3Ia4cNE4AiedaZRi2QH16jGXU2XMER15FK0ePvD3b+MyOkMxF3VOg1WmpTMuqtTT1ANBL966RUhT5TNsVtY3deD42cFV52V66VDqmM6q1e4w/DpTCAj6jaovuppyMRaIm33igte9EgSTo2N0mhdxdpttSo2Y43USPrEvKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=lrX/vH1U; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48A9a1oX007077;
	Tue, 10 Sep 2024 19:24:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=G
	ntVu4sxoZ//QQVa6FFw7BpccMh+fJ34m8scW/CvNnw=; b=lrX/vH1UKJO7MQzLz
	5edI7/lrOFerBED3/ZPMWX73evMAUfK/aOAjB4Rps2aGPozL5iU//k7RlKkU7+Tq
	j3iWa4NTqKeMjayB4lGz3+nyxyKYXTXR9wZv4QBi1J9n7jpdbq9YEqlImsIIA+Pn
	ykrKQvFs+wZQDaD3bQj/+TuO9A2yG6zqsmBYRiuOW76Xo6iTb8Amvv+Sxybg9paf
	lHtQO1dBv550lWqCjr+UgzZAke/kgpDSSCGX64SEtaAgMue5CRUxEQzsTfbZI+uG
	wtVE1+RW/5uJZg8FBHdBH62qf8j+oR2hFpbjbjhjmb9vs1LilRXH7xBtj6frmI5o
	8IbYA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gegwsjqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 19:24:46 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48AJOjcL005994;
	Tue, 10 Sep 2024 19:24:45 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gegwsjqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 19:24:45 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48AGFPma032069;
	Tue, 10 Sep 2024 19:24:44 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41h2nmn4ct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Sep 2024 19:24:44 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48AJOhaq11338466
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Sep 2024 19:24:44 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2DE358045;
	Tue, 10 Sep 2024 19:24:43 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDB5B58052;
	Tue, 10 Sep 2024 19:24:39 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Sep 2024 19:24:39 +0000 (GMT)
Message-ID: <bed47a64-a9b3-43ec-b89d-378505f890a7@linux.ibm.com>
Date: Tue, 10 Sep 2024 15:24:39 -0400
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/19] crypto: sig - Move crypto_sig_*() API calls to
 include file
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
 <1f15cfe8b380af55cd1bd0535abfefcbb68f6b1f.1725972335.git.lukas@wunner.de>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <1f15cfe8b380af55cd1bd0535abfefcbb68f6b1f.1725972335.git.lukas@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dgKiFo1_L8lx0USkdJtuPMMPXjgBFlcv
X-Proofpoint-ORIG-GUID: N6Cj2R4cBHabud-5Lb96XCxcnwpQe-i_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_06,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409100141



On 9/10/24 10:30 AM, Lukas Wunner wrote:
> The crypto_sig_*() API calls lived in sig.c so far because they needed
> access to struct crypto_sig_type:  This was necessary to differentiate
> between signature algorithms that had already been migrated from
> crypto_akcipher to crypto_sig and those that hadn't yet.
> 
> Now that all algorithms have been migrated, the API calls can become
> static inlines in <crypto/sig.h> to mimic what <crypto/akcipher.h> is
> doing.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>   crypto/sig.c         | 46 -------------------------------------------
>   include/crypto/sig.h | 47 +++++++++++++++++++++++++++++++++-----------
>   2 files changed, 36 insertions(+), 57 deletions(-)
> 
> diff --git a/crypto/sig.c b/crypto/sig.c
> index 1e6b0d677472..84d0ea9fd73b 100644
> --- a/crypto/sig.c
> +++ b/crypto/sig.c
> @@ -84,52 +84,6 @@ struct crypto_sig *crypto_alloc_sig(const char *alg_name, u32 type, u32 mask)
>   }
>   EXPORT_SYMBOL_GPL(crypto_alloc_sig);
>   
> -int crypto_sig_maxsize(struct crypto_sig *tfm)
> -{
> -	struct sig_alg *alg = crypto_sig_alg(tfm);
> -
> -	return alg->max_size(tfm);
> -}
> -EXPORT_SYMBOL_GPL(crypto_sig_maxsize);
> -
> -int crypto_sig_sign(struct crypto_sig *tfm,
> -		    const void *src, unsigned int slen,
> -		    void *dst, unsigned int dlen)
> -{
> -	struct sig_alg *alg = crypto_sig_alg(tfm);
> -
> -	return alg->sign(tfm, src, slen, dst, dlen);
> -}
> -EXPORT_SYMBOL_GPL(crypto_sig_sign);
> -
> -int crypto_sig_verify(struct crypto_sig *tfm,
> -		      const void *src, unsigned int slen,
> -		      const void *digest, unsigned int dlen)
> -{
> -	struct sig_alg *alg = crypto_sig_alg(tfm);
> -
> -	return alg->verify(tfm, src, slen, digest, dlen);
> -}
> -EXPORT_SYMBOL_GPL(crypto_sig_verify);
> -
> -int crypto_sig_set_pubkey(struct crypto_sig *tfm,
> -			  const void *key, unsigned int keylen)
> -{
> -	struct sig_alg *alg = crypto_sig_alg(tfm);
> -
> -	return alg->set_pub_key(tfm, key, keylen);
> -}
> -EXPORT_SYMBOL_GPL(crypto_sig_set_pubkey);
> -
> -int crypto_sig_set_privkey(struct crypto_sig *tfm,
> -			  const void *key, unsigned int keylen)
> -{
> -	struct sig_alg *alg = crypto_sig_alg(tfm);
> -
> -	return alg->set_priv_key(tfm, key, keylen);
> -}
> -EXPORT_SYMBOL_GPL(crypto_sig_set_privkey);
> -
>   static void sig_prepare_alg(struct sig_alg *alg)
>   {
>   	struct crypto_alg *base = &alg->base;
> diff --git a/include/crypto/sig.h b/include/crypto/sig.h
> index f0f52a7c5ae7..bbc902642bf5 100644
> --- a/include/crypto/sig.h
> +++ b/include/crypto/sig.h
> @@ -130,7 +130,12 @@ static inline void crypto_free_sig(struct crypto_sig *tfm)
>    *
>    * @tfm:	signature tfm handle allocated with crypto_alloc_sig()
>    */
> -int crypto_sig_maxsize(struct crypto_sig *tfm);
> +static inline int crypto_sig_maxsize(struct crypto_sig *tfm)
> +{
> +	struct sig_alg *alg = crypto_sig_alg(tfm);
> +
> +	return alg->max_size(tfm);
> +}
>   
>   /**
>    * crypto_sig_sign() - Invoke signing operation
> @@ -145,9 +150,14 @@ int crypto_sig_maxsize(struct crypto_sig *tfm);
>    *
>    * Return: zero on success; error code in case of error
>    */
> -int crypto_sig_sign(struct crypto_sig *tfm,
> -		    const void *src, unsigned int slen,
> -		    void *dst, unsigned int dlen);
> +static inline int crypto_sig_sign(struct crypto_sig *tfm,
> +				  const void *src, unsigned int slen,
> +				  void *dst, unsigned int dlen)
> +{
> +	struct sig_alg *alg = crypto_sig_alg(tfm);
> +
> +	return alg->sign(tfm, src, slen, dst, dlen);
> +}
>   
>   /**
>    * crypto_sig_verify() - Invoke signature verification
> @@ -163,9 +173,14 @@ int crypto_sig_sign(struct crypto_sig *tfm,
>    *
>    * Return: zero on verification success; error code in case of error.
>    */
> -int crypto_sig_verify(struct crypto_sig *tfm,
> -		      const void *src, unsigned int slen,
> -		      const void *digest, unsigned int dlen);
> +static inline int crypto_sig_verify(struct crypto_sig *tfm,
> +				    const void *src, unsigned int slen,
> +				    const void *digest, unsigned int dlen)
> +{
> +	struct sig_alg *alg = crypto_sig_alg(tfm);
> +
> +	return alg->verify(tfm, src, slen, digest, dlen);
> +}
>   
>   /**
>    * crypto_sig_set_pubkey() - Invoke set public key operation
> @@ -180,8 +195,13 @@ int crypto_sig_verify(struct crypto_sig *tfm,
>    *
>    * Return: zero on success; error code in case of error
>    */
> -int crypto_sig_set_pubkey(struct crypto_sig *tfm,
> -			  const void *key, unsigned int keylen);
> +static inline int crypto_sig_set_pubkey(struct crypto_sig *tfm,
> +					const void *key, unsigned int keylen)
> +{
> +	struct sig_alg *alg = crypto_sig_alg(tfm);
> +
> +	return alg->set_pub_key(tfm, key, keylen);
> +}
>   
>   /**
>    * crypto_sig_set_privkey() - Invoke set private key operation
> @@ -196,6 +216,11 @@ int crypto_sig_set_pubkey(struct crypto_sig *tfm,
>    *
>    * Return: zero on success; error code in case of error
>    */
> -int crypto_sig_set_privkey(struct crypto_sig *tfm,
> -			   const void *key, unsigned int keylen);
> +static inline int crypto_sig_set_privkey(struct crypto_sig *tfm,
> +					 const void *key, unsigned int keylen)
> +{
> +	struct sig_alg *alg = crypto_sig_alg(tfm);
> +
> +	return alg->set_priv_key(tfm, key, keylen);
> +}
>   #endif

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

