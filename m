Return-Path: <keyrings+bounces-1846-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5483C945039
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 18:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 096271F214D0
	for <lists+keyrings@lfdr.de>; Thu,  1 Aug 2024 16:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D54D913D2B7;
	Thu,  1 Aug 2024 16:12:13 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FD41DA58;
	Thu,  1 Aug 2024 16:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722528733; cv=none; b=tQDOZhPMxrrA/jAs31bVDfgk8/st/ui5n4udKwpCQ9/dADHomTa/LR5bO/dE1HSzAkruHTgwStHuGDko1NDL7HTzUB0wagasB2LXRnarzUuSh2enBODM+MUlw3TAELhQE0X1yOqXkIFZviy42N/cNFDB9RQPZuGmryyhaBJM0EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722528733; c=relaxed/simple;
	bh=kLB/reUUpZEnbSEgyD2zdvuYSUtkDGErZQE6POhR2Mg=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JkIopEnQl/BLk0UJeOWbhJyApiuac2GxdA99N5pkvbWkSKdwQEnv5eJjsl1zikBOt+qDG30pVlGjqO28EGgnWjPzbC054V04eTNtyHB/XNDEJ49Ld+0OIFSj3IP4C528838Im8hz9Xp/BL2z+nRA0c3AQtJA7TrOnb/DJjzNBe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WZYnR5QSbz6K6Xn;
	Fri,  2 Aug 2024 00:09:31 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 9FDB2140680;
	Fri,  2 Aug 2024 00:12:07 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 1 Aug
 2024 17:12:07 +0100
Date: Thu, 1 Aug 2024 17:12:06 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Lukas Wunner <lukas@wunner.de>
CC: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
	<davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>, David Howells
	<dhowells@redhat.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk
	<tstruk@gigaio.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, "Saulo
 Alessandre" <saulo.alessandre@tse.jus.br>, <linux-crypto@vger.kernel.org>,
	<keyrings@vger.kernel.org>
Subject: Re: [PATCH 3/5] crypto: ecdsa - Avoid signed integer overflow on
 signature decoding
Message-ID: <20240801171206.00006d93@Huawei.com>
In-Reply-To: <919ce5664ab3883f1bc15aadfc6b6a2d9b30ecbd.1722260176.git.lukas@wunner.de>
References: <cover.1722260176.git.lukas@wunner.de>
	<919ce5664ab3883f1bc15aadfc6b6a2d9b30ecbd.1722260176.git.lukas@wunner.de>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)

On Mon, 29 Jul 2024 15:49:00 +0200
Lukas Wunner <lukas@wunner.de> wrote:

> When extracting a signature component r or s from an ASN.1-encoded
> integer, ecdsa_get_signature_rs() subtracts the expected length
> "bufsize" from the ASN.1 length "vlen" (both of unsigned type size_t)
> and stores the result in "diff" (of signed type ssize_t).
> 
> This results in a signed integer overflow if vlen > SSIZE_MAX + bufsize.
> 
> The kernel is compiled with -fno-strict-overflow, which implies -fwrapv,
> meaning signed integer overflow is not undefined behavior.  And the
> function does check for overflow:
> 
>        if (-diff >= bufsize)
>                return -EINVAL;
> 
> So the code is fine in principle but not very obvious.  In the future it
> might trigger a false-positive with CONFIG_UBSAN_SIGNED_WRAP=y.
> 
> Avoid by comparing the two unsigned variables directly and erroring out
> if "vlen" is too large.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
Change looks fine to me.
Random musing inline.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  crypto/ecdsa.c | 17 ++++-------------
>  1 file changed, 4 insertions(+), 13 deletions(-)
> 
> diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
> index f63731fb7535..03f608132242 100644
> --- a/crypto/ecdsa.c
> +++ b/crypto/ecdsa.c
> @@ -35,29 +35,20 @@ static int ecdsa_get_signature_rs(u64 *dest, size_t hdrlen, unsigned char tag,
>  				  const void *value, size_t vlen, unsigned int ndigits)
>  {
>  	size_t bufsize = ndigits * sizeof(u64);
> -	ssize_t diff = vlen - bufsize;
>  	const char *d = value;
>  
> -	if (!value || !vlen)
> +	if (!value || !vlen || vlen > bufsize + 1)

Given vlen and bufsize unsigned. Even in the weird case of bufsize + 1 == 0
vlen cannot be zero.  So could drop the second condition? (or am I
missing something?) Maybe it's easier to reason that vlen == 0 is invalid though.


>  		return -EINVAL;
>  
> -	/* diff = 0: 'value' has exacly the right size
> -	 * diff > 0: 'value' has too many bytes; one leading zero is allowed that
> -	 *           makes the value a positive integer; error on more
> -	 * diff < 0: 'value' is missing leading zeros
> -	 */
> -	if (diff > 0) {
> +	if (vlen > bufsize) {
>  		/* skip over leading zeros that make 'value' a positive int */
>  		if (*d == 0) {
>  			vlen -= 1;
> -			diff--;
>  			d++;
> -		}
> -		if (diff)
> +		} else {
>  			return -EINVAL;
> +		}
>  	}
> -	if (-diff >= bufsize)
> -		return -EINVAL;
>  
>  	ecc_digits_from_bytes(d, vlen, dest, ndigits);
>  


