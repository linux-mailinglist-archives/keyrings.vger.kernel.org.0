Return-Path: <keyrings+bounces-2047-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A00D978808
	for <lists+keyrings@lfdr.de>; Fri, 13 Sep 2024 20:41:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 061E51F25F06
	for <lists+keyrings@lfdr.de>; Fri, 13 Sep 2024 18:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE0286AE3;
	Fri, 13 Sep 2024 18:40:59 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E62A811EB;
	Fri, 13 Sep 2024 18:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726252859; cv=none; b=nCXnzOSqTT2N3dBoPB9MMu7LpFz1HhbfgYXeDiUTc2HIIOO/nxbeW5yWzNz/irwYxTVyt0xcB0mW1LDwlC39xL2nVeQD6DDqq6uUlcNjDE1UOqmp62J83Ag3qXDHfGyZP8pGytO22N5QRx0xb7j+l+LuCDk3AIMqPZxE9e2TLcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726252859; c=relaxed/simple;
	bh=D+I8GQYbtdFqu//u3VQ9wkisq1yyy0w6iTNBsqfKPiA=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nStzvArSglSQD94n8+E+uFBMolcY48VzQCZ9dWTTWfRbw39yrlnoLAlTCcYl9BO3JsdZ2CwTlmub+hX9+pxK8spxSMnfzgE5xdzdioY4xvnOpygzbRanJK7Q0gw1dlbmaiJPZezRzLvmELRLmxQ/Kqt5b7A19ZjIvKJCAhvDLuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X53213XD4z67kr9;
	Sat, 14 Sep 2024 02:37:13 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id DF2A8140A77;
	Sat, 14 Sep 2024 02:40:53 +0800 (CST)
Received: from localhost (10.48.150.243) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 13 Sep
 2024 20:40:52 +0200
Date: Fri, 13 Sep 2024 19:40:49 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Lukas Wunner <lukas@wunner.de>
CC: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller"
	<davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger
	<stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk
	<tstruk@gigaio.com>, David Howells <dhowells@redhat.com>, Andrew Zaborowski
	<andrew.zaborowski@intel.com>, Saulo Alessandre
	<saulo.alessandre@tse.jus.br>, Ignat Korchagin <ignat@cloudflare.com>, Marek
 Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Denis
 Kenzior <denkenz@gmail.com>, <linux-crypto@vger.kernel.org>,
	<keyrings@vger.kernel.org>
Subject: Re: [PATCH v2 02/19] crypto: sig - Introduce sig_alg backend
Message-ID: <20240913194049.000030d9@Huawei.com>
In-Reply-To: <688e92e7db6f2de1778691bb7cdafe3bb39e73c6.1725972334.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
	<688e92e7db6f2de1778691bb7cdafe3bb39e73c6.1725972334.git.lukas@wunner.de>
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
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)

On Tue, 10 Sep 2024 16:30:12 +0200
Lukas Wunner <lukas@wunner.de> wrote:

> Commit 6cb8815f41a9 ("crypto: sig - Add interface for sign/verify")
> began a transition of asymmetric sign/verify operations from
> crypto_akcipher to a new crypto_sig frontend.
> 
> Internally, the crypto_sig frontend still uses akcipher_alg as backend,
> however:
> 
>    "The link between sig and akcipher is meant to be temporary.  The
>     plan is to create a new low-level API for sig and then migrate
>     the signature code over to that from akcipher."
>     https://lore.kernel.org/r/ZrG6w9wsb-iiLZIF@gondor.apana.org.au/
> 
>    "having a separate alg for sig is definitely where we want to
>     be since there is very little that the two types actually share."
>     https://lore.kernel.org/r/ZrHlpz4qnre0zWJO@gondor.apana.org.au/
> 
> Take the next step of that migration and augment the crypto_sig frontend
> with a sig_alg backend to which all algorithms can be moved.
> 
> During the migration, there will briefly be signature algorithms that
> are still based on crypto_akcipher, whilst others are already based on
> crypto_sig.  Allow for that by building a fork into crypto_sig_*() API
> calls (i.e. crypto_sig_maxsize() and friends) such that one of the two
> backends is selected based on the transform's cra_type.
> 
> Signed-off-by: Lukas Wunner <lukas@wunner.de>

Hi Lukas,

A few trivial comments.

Jonathan

> diff --git a/crypto/sig.c b/crypto/sig.c
> index 7645bedf3a1f..4f36ceb7a90b 100644
> --- a/crypto/sig.c
> +++ b/crypto/sig.c

> @@ -68,6 +93,14 @@ EXPORT_SYMBOL_GPL(crypto_alloc_sig);
>  
>  int crypto_sig_maxsize(struct crypto_sig *tfm)
>  {
> +	if (crypto_sig_tfm(tfm)->__crt_alg->cra_type != &crypto_sig_type)
> +		goto akcipher;
> +
> +	struct sig_alg *alg = crypto_sig_alg(tfm);
> +
> +	return alg->max_size(tfm);
> +
> +akcipher:

Neat trick for temporary retention of the code.
Hideous code in the meantime ;) Not that I have a better idea.

>  	struct crypto_akcipher **ctx = crypto_sig_ctx(tfm);
>  
>  	return crypto_akcipher_maxsize(*ctx);

> diff --git a/crypto/testmgr.c b/crypto/testmgr.c
> index f02cb075bd68..bb21378aa510 100644
> --- a/crypto/testmgr.c
> +++ b/crypto/testmgr.c
...

> @@ -4317,6 +4324,114 @@ static int alg_test_akcipher(const struct alg_test_desc *desc,
>  	return err;
>  }
>  
> +static int test_sig_one(struct crypto_sig *tfm, const struct sig_testvec *vecs)
> +{
> +	u8 *ptr, *key __free(kfree);
I would move definition of key down to where the constructor is.
Current pattern is fine until some extra code sneaks inbetween with
an error return.

> +	int err, sig_size;
> +
> +	key = kmalloc(vecs->key_len + 2 * sizeof(u32) + vecs->param_len,
> +		      GFP_KERNEL);
> +	if (!key)
> +		return -ENOMEM;

git a/include/crypto/internal/sig.h b/include/crypto/internal/sig.h
> index 97cb26ef8115..b16648c1a986 100644
> --- a/include/crypto/internal/sig.h
> +++ b/include/crypto/internal/sig.h

> +static inline struct crypto_sig *crypto_spawn_sig(struct crypto_sig_spawn
> +								   *spawn)

That's an odd wrap. I'd just go long where this happens and slightly past 80 chars.


> +{
> +	return crypto_spawn_tfm2(&spawn->base);
> +}


