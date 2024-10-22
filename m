Return-Path: <keyrings+bounces-2248-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E24839A9FC1
	for <lists+keyrings@lfdr.de>; Tue, 22 Oct 2024 12:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DCD4283D1A
	for <lists+keyrings@lfdr.de>; Tue, 22 Oct 2024 10:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A3D613D8B4;
	Tue, 22 Oct 2024 10:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nj+gS+9P"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C124C12D1EA;
	Tue, 22 Oct 2024 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729592130; cv=none; b=CyINK2x5oVgwDg8KR5Yc8kf/xggAhhj3A7ornHW5L7V6uIqzIzL1lwrzU8KNpRBt8532L4DBfNH2hr6FvRmxF7KYf2rO0xHvG6ttI3cTdWJQQmq7QcT5XBQI8tn+JmHwsL8SKuK6+SEsr0JldmKToijgOH1JytKPk6n8OxXCKYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729592130; c=relaxed/simple;
	bh=UTwJrs2yVAn8KRaDzTylSmfTFxosn++e9C5oH8HqsEU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=UvY83BgphmdsE5itMLPP4JMqBlgbAzPl8Xakh/DooQRfD0lyhB9qmOsygkrrjox0kj++uWxXxyKr9p0o4UqsjLhhSmjYfgmz4Jqwbshtr12PKGHF2aaMtiW9xSzORBG/oWhlog1bbHNm7F7L9E5qCL9oGexXaklA0T1wYgxBL/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nj+gS+9P; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f8490856so5796404e87.2;
        Tue, 22 Oct 2024 03:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729592126; x=1730196926; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=i/Wbghi14ljA8Z94XLpAf+/kbdn54HUC6HPvaiTf5u0=;
        b=nj+gS+9PVEa6SWSGX8FpiCmGiBD+m0XAkh7FbIkflSpHuqShM/61YhQDa1oHn1i6KF
         5i55GX3GmOXJxKJBewu7PRA/x6HgLLZFAZE1+gZW5xrAcqJPunmdOgsu/HL0GsUszkR0
         wjgD3T86aOo/Eb/+moTK8kRxhaoXpYwAh9DbWQ4Ss/Uh54s9JFaiCW3zYZ8fsBnROK5y
         LJvfW/MPusikGDQe5DROaNbupShASdg/ic5jg8k+QgUlwCFx8R9eh0Ud1bfp1Sr7HX5/
         rMSWIqxObv/AfguK1eXvys269st1N1tMboDp1911rWM5208Tuz4EAlPvZrNTjF4FuqTH
         WyhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729592126; x=1730196926;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i/Wbghi14ljA8Z94XLpAf+/kbdn54HUC6HPvaiTf5u0=;
        b=xGaRAhJw82FREeXqvd6lCfIlND5bOOh0GXUj0SV2L8+Z31q+l2oO5a1LT6Pij4BtXr
         jC1/WWOifU8wj2uk2RQDHUBubUNQGsijWWS2mWB0MRE5sD5qNpqVG0WYXMAINKIIC/9x
         shO8zrbStlQBcwXEQukp2GmYM/HRDUR3Vc+NXnGkhj8Pnvf2340HKL+Z7SlCN8+eaeJC
         QBO32RvFO5WuP6lDj1HM7RUbi7ZTcF0sKQ1NU6s6goBD3SElPAkhUMhxP1eaDsDWggKh
         7zmQCeGln8REseOQ6VZJ5omXeu7yCHRAZzIV3ZwrHcSgV/kI3+vem7EGAiC7qwYm3jDj
         AjyA==
X-Forwarded-Encrypted: i=1; AJvYcCU0z00uuCQ8It0IKwvUYLBvzloDf0r30mVK0ZsBMbofdkxfDMAmXZTC63ZyKbEJctbDhOcSfJm1Rw==@vger.kernel.org, AJvYcCWd5Fl/R7oInR4aebpLif+6eXRNlHy48yfCuXjdA9N5WCHaFDW/p4D6FUHjzayKoptAyiPTNklZVAWovIh5@vger.kernel.org, AJvYcCX9R680T8wXCer0CtrOBG3wrnrD+FrOdnS3TvLrIe1k9Sar92vKsBH+3skfHMkvIWmpz0D9YWuZZxB71wijQjw/1WhAP/ib@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo7A/GCFTQYQH1aeFOIpanQ+rGc1K/3fJRx1L9rljt5iTRS8yx
	MCD4UDEe6Vzeb3s/5qY28lMEblfE+rdNspyJw4Z8ChW57epHOaKh
X-Google-Smtp-Source: AGHT+IH/q8NTouZVA58dM5PNmlo9nSs75gaWTMHaPr+u0KM6Mw5dYwlgAfRI2b+TvcWuXiqn1q25SQ==
X-Received: by 2002:a05:6512:31d5:b0:539:f763:789d with SMTP id 2adb3069b0e04-53b13a23d86mr944567e87.43.1729592125431;
        Tue, 22 Oct 2024 03:15:25 -0700 (PDT)
Received: from ?IPV6:2001:678:a5c:1202:4fb5:f16a:579c:6dcb? (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a224563d1sm720993e87.307.2024.10.22.03.15.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 03:15:24 -0700 (PDT)
Message-ID: <f969c93b-d770-4fce-83f4-05184b66e511@gmail.com>
Date: Tue, 22 Oct 2024 12:15:20 +0200
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Klara Modin <klarasmodin@gmail.com>
Subject: Re: [PATCH v2 06/19] crypto: rsassa-pkcs1 - Migrate to sig_alg
 backend
To: Lukas Wunner <lukas@wunner.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>,
 Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>,
 Tadeusz Struk <tstruk@gigaio.com>, David Howells <dhowells@redhat.com>,
 Andrew Zaborowski <andrew.zaborowski@intel.com>,
 Saulo Alessandre <saulo.alessandre@tse.jus.br>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>,
 Varad Gautam <varadgautam@google.com>, Stephan Mueller
 <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, Roberto Sassu <roberto.sassu@huawei.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Eric Snowberg <eric.snowberg@oracle.com>,
 linux-security-module@vger.kernel.org
References: <cover.1725972333.git.lukas@wunner.de>
 <743afd4f298a3fad03e42ab46f913d1f51cb8b7c.1725972335.git.lukas@wunner.de>
 <2ed09a22-86c0-4cf0-8bda-ef804ccb3413@gmail.com> <ZxalYZwH5UiGX5uj@wunner.de>
Content-Language: en-US, sv-SE
In-Reply-To: <ZxalYZwH5UiGX5uj@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2024-10-21 21:02, Lukas Wunner wrote:
> On Mon, Oct 21, 2024 at 06:08:03PM +0200, Klara Modin wrote:
>> On 2024-09-10 16:30, Lukas Wunner wrote:
>>> A sig_alg backend has just been introduced with the intent of moving all
>>> asymmetric sign/verify algorithms to it one by one.
>>>
>>> Migrate the sign/verify operations from rsa-pkcs1pad.c to a separate
>>> rsassa-pkcs1.c which uses the new backend.
> [...]
>> This commit (1e562deacecca1f1bec7d23da526904a1e87525e in next-20241021)
>> seems to break connecting to wpa2-enterprise with iwd.
> 
> Thanks for the report and sorry for the breakage.
> 
> There is one pending fix for an issue I inadvertently introduced
> with my sig_alg rework:
> 
> https://lore.kernel.org/r/ff7a28cddfc28e7a3fb8292c680510f35ec54391.1728898147.git.lukas@wunner.de/
> 
> However it fixes a different commit than the one you found through
> bisection, so I suspect it won't fix the problem, though it would
> still be good if you could test it.
> 
> There is a *second* issue I discovered last week.  I cooked up
> a fix this morning, but haven't written a commit message yet.
> The patch is included below and it could indeed solve the
> problem because it fixes an issue introduced by the commit you
> identified as culprit.  So if you could test the patch below as well
> I'd be grateful.
> 
> I'll now look at the config and dmesg output you've provided.
> Just wanted to get this e-mail out the door quickly to point you
> to potential fixes.
> 
> Thanks!
> 
> Lukas
> 
> -- >8 --
> 
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
> index c98c158..af19f9c 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -165,14 +165,22 @@ static int software_key_query(const struct kernel_pkey_params *params,
>   {
>   	struct crypto_akcipher *tfm;
>   	struct public_key *pkey = params->key->payload.data[asym_crypto];
> +	const char *hash_algo = params->hash_algo;
>   	char alg_name[CRYPTO_MAX_ALG_NAME];
>   	struct crypto_sig *sig;
>   	u8 *key, *ptr;
>   	int ret, len;
>   	bool issig;
>   
> +	/*
> +	 * Specifying hash_algo has historically been optional for pkcs1,
> +	 * so use an arbitrary algorithm for backward compatibility.
> +	 */
> +	if (strcmp(params->encoding, "pkcs1") == 0 && !hash_algo)
> +		hash_algo = "sha256";
> +
>   	ret = software_key_determine_akcipher(pkey, params->encoding,
> -					      params->hash_algo, alg_name,
> +					      hash_algo, alg_name,
>   					      &issig, kernel_pkey_sign);
>   	if (ret < 0)
>   		return ret;
> 

I don't think I have hit the first issue you mention but I'll apply the 
fix and see if it changes anything. I'll probably be able to test these 
two sometime tomorrow.

Thanks,
Klara Modin

