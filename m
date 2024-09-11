Return-Path: <keyrings+bounces-2005-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 520FE9752F3
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 14:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29535B21E01
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 12:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C803719755E;
	Wed, 11 Sep 2024 12:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSWrjSif"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D61618EFE1;
	Wed, 11 Sep 2024 12:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726059284; cv=none; b=AUYYHXQh4ntdryqIF39iFcOVCJC70gvzkILhCReQYVBWePWGQu6+5N9cC6faPZwCxu7UH32MotO4n9IgTACthRw1UI7lebpOaA0vLnZU2CpAcvUsBpAWyQbhPXGlDtDf6O2nL3agI/4WbJmJnCtyQ5uue2CfacWwdjdbYdTDauU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726059284; c=relaxed/simple;
	bh=xHp9gzT0PRMcQxvxcHrqHHiWpDm6dqaKVII1OT9QnYo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lzbEn2l3wlhihlyRgcvnxc7gnIDsQIPBvFcpj4QjCI2hp4K4dGUhqsfmMYHHzG9fqzpnLSiE9mhgVA0vHszYPxtt7z6u8ZbixtRNXGCQ/EA5g1B/HVBlRaib0REj8moOEuhpnYab02dpppWVcAlcYrRzp3+8QPDvCD3ieduA+XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSWrjSif; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C962DC4CEC5;
	Wed, 11 Sep 2024 12:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726059284;
	bh=xHp9gzT0PRMcQxvxcHrqHHiWpDm6dqaKVII1OT9QnYo=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=FSWrjSif3nISoZJXfAb14kUZDWkOV3e0yU7FFW5YhSiC0y/vz6W+VOH4PCAOe74pS
	 qJsgn4aj481//7LQj84CQNPzQJXFXjJi7Di/ahslovAT3fNTSxhWep1PJFmT+CJAkR
	 6dMyL6ZQfO+jdBe1StXjfRxOxR0RvPtml53VQjeg8sLzUQ5lVWlEE2TwkNzqhcyNi2
	 UNxZcemvYb7iH84fARRe+yXytlnC8wXGcn7Jl5vvPj51Gwl8IfJbGYIXOkpwrWbVUT
	 PuLco90CZYixCqN4V5hD7SXSIJ93t87xehWnl0cqY9/E6xB0J8Lxm8LGcTIvrFk7oi
	 Y0Neyp30TV0dw==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Sep 2024 15:54:40 +0300
Message-Id: <D43GY6TUUDCV.6XX0CLQP4RTE@kernel.org>
Cc: "David Howells" <dhowells@redhat.com>, "Andrew Zaborowski"
 <andrew.zaborowski@intel.com>, "Saulo Alessandre"
 <saulo.alessandre@tse.jus.br>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Ignat Korchagin" <ignat@cloudflare.com>,
 "Marek Behun" <kabel@kernel.org>, "Varad Gautam" <varadgautam@google.com>,
 "Stephan Mueller" <smueller@chronox.de>, "Denis Kenzior"
 <denkenz@gmail.com>, <linux-crypto@vger.kernel.org>,
 <keyrings@vger.kernel.org>
Subject: Re: [PATCH v2 05/19] crypto: rsa-pkcs1pad - Deduplicate
 set_{pub,priv}_key callbacks
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Eric Biggers" <ebiggers@google.com>, "Stefan Berger"
 <stefanb@linux.ibm.com>, "Vitaly Chikunov" <vt@altlinux.org>, "Tadeusz
 Struk" <tstruk@gigaio.com>
X-Mailer: aerc 0.18.2
References: <cover.1725972333.git.lukas@wunner.de>
 <e1254cbe30eb5bafd841d7ee50ee974bb63dda28.1725972334.git.lukas@wunner.de>
In-Reply-To: <e1254cbe30eb5bafd841d7ee50ee974bb63dda28.1725972334.git.lukas@wunner.de>

On Tue Sep 10, 2024 at 5:30 PM EEST, Lukas Wunner wrote:
> pkcs1pad_set_pub_key() and pkcs1pad_set_priv_key() are almost identical.
>
> The upcoming migration of sign/verify operations from rsa-pkcs1pad.c
> into a separate crypto_template will require another copy of the exact
> same functions.  When RSASSA-PSS and RSAES-OAEP are introduced, each
> will need yet another copy.
>
> Deduplicate the functions into a single one which lives in a common
> header file for reuse by RSASSA-PKCS1-v1_5, RSASSA-PSS and RSAES-OAEP.

Nit: I'd simply swap the order of the two last paragraphs. I.e. I get
the question and then I have energy to read the answer ;-) For longer
feature patch starting with motivation makes more sense but here I
think opposite order would serve better...

>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  crypto/rsa-pkcs1pad.c         | 30 ++----------------------------
>  include/crypto/internal/rsa.h | 28 ++++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+), 28 deletions(-)
>
> diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
> index cd501195f34a..3c5fe8c93938 100644
> --- a/crypto/rsa-pkcs1pad.c
> +++ b/crypto/rsa-pkcs1pad.c
> @@ -131,42 +131,16 @@ static int pkcs1pad_set_pub_key(struct crypto_akcip=
her *tfm, const void *key,
>  		unsigned int keylen)
>  {
>  	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
> -	int err;
> -
> -	ctx->key_size =3D 0;
> =20
> -	err =3D crypto_akcipher_set_pub_key(ctx->child, key, keylen);
> -	if (err)
> -		return err;
> -
> -	/* Find out new modulus size from rsa implementation */
> -	err =3D crypto_akcipher_maxsize(ctx->child);
> -	if (err > PAGE_SIZE)
> -		return -ENOTSUPP;
> -
> -	ctx->key_size =3D err;
> -	return 0;
> +	return rsa_set_key(ctx->child, &ctx->key_size, RSA_PUB, key, keylen);
>  }
> =20
>  static int pkcs1pad_set_priv_key(struct crypto_akcipher *tfm, const void=
 *key,
>  		unsigned int keylen)
>  {
>  	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
> -	int err;
> -
> -	ctx->key_size =3D 0;
> =20
> -	err =3D crypto_akcipher_set_priv_key(ctx->child, key, keylen);
> -	if (err)
> -		return err;
> -
> -	/* Find out new modulus size from rsa implementation */
> -	err =3D crypto_akcipher_maxsize(ctx->child);
> -	if (err > PAGE_SIZE)
> -		return -ENOTSUPP;
> -
> -	ctx->key_size =3D err;
> -	return 0;
> +	return rsa_set_key(ctx->child, &ctx->key_size, RSA_PRIV, key, keylen);
>  }
> =20
>  static unsigned int pkcs1pad_get_max_size(struct crypto_akcipher *tfm)
> diff --git a/include/crypto/internal/rsa.h b/include/crypto/internal/rsa.=
h
> index e870133f4b77..754f687134df 100644
> --- a/include/crypto/internal/rsa.h
> +++ b/include/crypto/internal/rsa.h
> @@ -8,6 +8,7 @@
>  #ifndef _RSA_HELPER_
>  #define _RSA_HELPER_
>  #include <linux/types.h>
> +#include <crypto/akcipher.h>
> =20
>  /**
>   * rsa_key - RSA key structure
> @@ -53,5 +54,32 @@ int rsa_parse_pub_key(struct rsa_key *rsa_key, const v=
oid *key,
>  int rsa_parse_priv_key(struct rsa_key *rsa_key, const void *key,
>  		       unsigned int key_len);
> =20
> +#define RSA_PUB (true)
> +#define RSA_PRIV (false)
> +

/**
 * rsa_set_key() - <summary>
 * <params>
 *
 * <description>
 */
> +static inline int rsa_set_key(struct crypto_akcipher *child,
> +			      unsigned int *key_size, bool is_pubkey,
> +			      const void *key, unsigned int keylen)
> +{
> +	int err;
> +
> +	*key_size =3D 0;
> +
> +	if (is_pubkey)
> +		err =3D crypto_akcipher_set_pub_key(child, key, keylen);
> +	else
> +		err =3D crypto_akcipher_set_priv_key(child, key, keylen);
> +	if (err)
> +		return err;
> +
> +	/* Find out new modulus size from rsa implementation */
> +	err =3D crypto_akcipher_maxsize(child);
> +	if (err > PAGE_SIZE)
> +		return -ENOTSUPP;
> +
> +	*key_size =3D err;
> +	return 0;
> +}
> +
>  extern struct crypto_template rsa_pkcs1pad_tmpl;
>  #endif

BR, Jarkko

