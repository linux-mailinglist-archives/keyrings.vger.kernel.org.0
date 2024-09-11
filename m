Return-Path: <keyrings+bounces-2008-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F3697531C
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 15:01:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 488491F26888
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 13:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9027198A21;
	Wed, 11 Sep 2024 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f72sITfQ"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7652E188A05;
	Wed, 11 Sep 2024 13:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726059626; cv=none; b=nU2DfJKDiwiNp0moPGhH2GqTR6+gsDHuXesdN+09OiS4a8xC+G//2+kLOqH+DK2zuF6HZgq1ucOrSZvYZG0bdToa2mtBS1aX5NwKNx6nXytX6F81CcIbMp2g4rycCZ3hy7bb42p8eVdXumK4ftThpmucDqMTenoI01A5a1Z+SG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726059626; c=relaxed/simple;
	bh=QTmYhiqNNLZFNmiH+M30PdiB472rIsTsPfVErVqcecY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=iHaIi/bTibGaZQNGSuqlmlW/LE03yYQfuv/vCLoyNYvLWC5uXjLmTtIt/TRZdy0DrHzg9G/qqhMt9POPXUrAuXMl5zTRykpI1XExGpIK2DMklDgsJFZvEdToLHj/juLMnfP7CydSYkQL9LO6/PWNto8nGl18uhuu1NnAbtt8XNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f72sITfQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891D8C4CEC6;
	Wed, 11 Sep 2024 13:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726059626;
	bh=QTmYhiqNNLZFNmiH+M30PdiB472rIsTsPfVErVqcecY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=f72sITfQV0kL1dNZU4A4Jh2CQroHyYRDwq4LAhw7D4gRmKIoGvF6HNB4c3dcOewH/
	 deNrfpi/VqXphCuzczExrO3qW79tTMnQG23eYDbE3+1u6xSahUlqF+lcr0ilkfDvEM
	 CJTlIEIWCnCi6D5Evtynle7YQz1RHv0RA5af3udSTAlt51U0ZHu5KwKMbBU9K5XAUN
	 hpHFf7usQay/nY4/GvOcC1tGSRaU7/Hwvm4teAOJLX/vaNxpfB2spd322Vds/1/181
	 noJJQb87ARbahdC6HZOSU/mWQhP2vYQZ12oLBo0//15UKAih5SZQs8c8+Z0wnjqxAs
	 XnJbIDTdr6GMA==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Sep 2024 16:00:22 +0300
Message-Id: <D43H2JV1ZCFT.3OGRNOONL2WVR@kernel.org>
Cc: "David Howells" <dhowells@redhat.com>, "Andrew Zaborowski"
 <andrew.zaborowski@intel.com>, "Saulo Alessandre"
 <saulo.alessandre@tse.jus.br>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Ignat Korchagin" <ignat@cloudflare.com>,
 "Marek Behun" <kabel@kernel.org>, "Varad Gautam" <varadgautam@google.com>,
 "Stephan Mueller" <smueller@chronox.de>, "Denis Kenzior"
 <denkenz@gmail.com>, <linux-crypto@vger.kernel.org>,
 <keyrings@vger.kernel.org>
Subject: Re: [PATCH v2 08/19] crypto: rsassa-pkcs1 - Avoid copying hash
 prefix
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Eric Biggers" <ebiggers@google.com>, "Stefan Berger"
 <stefanb@linux.ibm.com>, "Vitaly Chikunov" <vt@altlinux.org>, "Tadeusz
 Struk" <tstruk@gigaio.com>
X-Mailer: aerc 0.18.2
References: <cover.1725972333.git.lukas@wunner.de>
 <819ed9cd21975ad4d6683d46f4147659ca043f8b.1725972335.git.lukas@wunner.de>
In-Reply-To: <819ed9cd21975ad4d6683d46f4147659ca043f8b.1725972335.git.lukas@wunner.de>

On Tue Sep 10, 2024 at 5:30 PM EEST, Lukas Wunner wrote:
> When constructing the EMSA-PKCS1-v1_5 padding for the sign operation,
> a buffer for the padding is allocated and the Full Hash Prefix is copied
> into it.  The padding is then passed to the RSA decrypt operation as an
> sglist entry which is succeeded by a second sglist entry for the hash.
>
> Actually copying the hash prefix around is completely unnecessary.
> It can simply be referenced from a third sglist entry which sits
> in-between the padding and the digest.
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  crypto/rsassa-pkcs1.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
>
> diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
> index 8f42a5712806..b291ec0944a2 100644
> --- a/crypto/rsassa-pkcs1.c
> +++ b/crypto/rsassa-pkcs1.c
> @@ -153,7 +153,7 @@ static int rsassa_pkcs1_sign(struct crypto_sig *tfm,
>  	struct rsassa_pkcs1_ctx *ctx =3D crypto_sig_ctx(tfm);
>  	unsigned int child_reqsize =3D crypto_akcipher_reqsize(ctx->child);
>  	struct akcipher_request *child_req __free(kfree_sensitive) =3D NULL;
> -	struct scatterlist in_sg[2], out_sg;
> +	struct scatterlist in_sg[3], out_sg;
>  	struct crypto_wait cwait;
>  	unsigned int pad_len;
>  	unsigned int ps_end;
> @@ -173,24 +173,26 @@ static int rsassa_pkcs1_sign(struct crypto_sig *tfm=
,
>  	if (slen + hash_prefix->size > ctx->key_size - 11)
>  		return -EOVERFLOW;
> =20
> -	child_req =3D kmalloc(sizeof(*child_req) + child_reqsize +
> -			    ctx->key_size - 1 - slen, GFP_KERNEL);
> +	pad_len =3D ctx->key_size - slen - hash_prefix->size - 1;
> +
> +	child_req =3D kmalloc(sizeof(*child_req) + child_reqsize + pad_len,
> +			    GFP_KERNEL);
>  	if (!child_req)
>  		return -ENOMEM;
> =20
>  	/* RFC 8017 sec 8.2.1 step 1 - EMSA-PKCS1-v1_5 encoding generation */
>  	in_buf =3D (u8 *)(child_req + 1) + child_reqsize;
> -	ps_end =3D ctx->key_size - hash_prefix->size - slen - 2;
> +	ps_end =3D pad_len - 1;
>  	in_buf[0] =3D 0x01;
>  	memset(in_buf + 1, 0xff, ps_end - 1);
>  	in_buf[ps_end] =3D 0x00;
> -	memcpy(in_buf + ps_end + 1, hash_prefix->data, hash_prefix->size);
> =20
>  	/* RFC 8017 sec 8.2.1 step 2 - RSA signature */
>  	crypto_init_wait(&cwait);
> -	sg_init_table(in_sg, 2);
> -	sg_set_buf(&in_sg[0], in_buf, ctx->key_size - 1 - slen);
> -	sg_set_buf(&in_sg[1], src, slen);
> +	sg_init_table(in_sg, 3);
> +	sg_set_buf(&in_sg[0], in_buf, pad_len);
> +	sg_set_buf(&in_sg[1], hash_prefix->data, hash_prefix->size);
> +	sg_set_buf(&in_sg[2], src, slen);
>  	sg_init_one(&out_sg, dst, dlen);
>  	akcipher_request_set_tfm(child_req, ctx->child);
>  	akcipher_request_set_crypt(child_req, in_sg, &out_sg,

LGTM. Not giving any tags because given the size of the patch set this
could change in content and/or order (in the series). Wondering if this
could be as a clean up like more in the head of the series?

BR, Jarkko

