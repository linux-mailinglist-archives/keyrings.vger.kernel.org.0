Return-Path: <keyrings+bounces-2007-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEF2975303
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 14:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1295E286712
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 12:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 984E51885B4;
	Wed, 11 Sep 2024 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etStbOFS"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702D2186E24;
	Wed, 11 Sep 2024 12:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726059487; cv=none; b=QeyTGOUF3DAuMcoF0d3QxI1/OLVmtcOLmA+vy2NsMdVBVBXTMApnFEx4emZwcqTIzbBHSXjrOoVrh4aK7vYTRLFCo9tZoYjaGksWDAfMOjIcZGXskNDGdM0sZF3bSNmYx8FPUodr16R///UvCe8gUQMf2I5Oa5k2SSHjTkAn6w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726059487; c=relaxed/simple;
	bh=hK9OWLeIGJiq6IEBJyrkBJ/XcgfyRt4r7tdHlPNHIFY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=QoFg5EsHAl09YZhX7B+Nzs0ce6543z5+mModiq/MFcaT9+5n7cQ+O2hqBwa8ed8DXENyRefQCjMG8dm4oRgt8hLuV9ReUh7fDe+C936C93bupoKZHNI4otRqYFqBT47GUHAsl1Q8vx1TqKJciHTSYZIqV4TUC2PliOlTseWZIu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etStbOFS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE79C4CEC5;
	Wed, 11 Sep 2024 12:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726059487;
	bh=hK9OWLeIGJiq6IEBJyrkBJ/XcgfyRt4r7tdHlPNHIFY=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=etStbOFSsRcQUkavZ+0JRGV5NzQl7FvnIsOoD6CwvYqwkPCZTo9u8sgPIQePmbUL2
	 U4rntf/RxPSBFi+HQmhosilN8QrMEhgdbh1cCvnAove0L6oI29biPn+6xWl6+kEoyd
	 ryLSVUYSEZ4/HAwUNrIZq0k7cwfSvyB9F+toTqhe98sqbv0Yck2tOP0HWJmhGGnWor
	 AvLAqHxEQkHEDJHIdLEnEhJgaMGUqNB87UjjzJ3sZVUBfC6Z5t4h/aP6CSj5t698L3
	 yqYMKevZbMXoOyxfgBES3cpDFat5AACFpnGICTL/xrlHIXW12pUSUGK5GqS++azckO
	 8gqnst8BknP1A==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Sep 2024 15:58:03 +0300
Message-Id: <D43H0S1K6HYK.2LR4T5KH8KCHI@kernel.org>
Cc: "David Howells" <dhowells@redhat.com>, "Andrew Zaborowski"
 <andrew.zaborowski@intel.com>, "Saulo Alessandre"
 <saulo.alessandre@tse.jus.br>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Ignat Korchagin" <ignat@cloudflare.com>,
 "Marek Behun" <kabel@kernel.org>, "Varad Gautam" <varadgautam@google.com>,
 "Stephan Mueller" <smueller@chronox.de>, "Denis Kenzior"
 <denkenz@gmail.com>, <linux-crypto@vger.kernel.org>,
 <keyrings@vger.kernel.org>
Subject: Re: [PATCH v2 07/19] crypto: rsassa-pkcs1 - Harden digest length
 verification
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Eric Biggers" <ebiggers@google.com>, "Stefan Berger"
 <stefanb@linux.ibm.com>, "Vitaly Chikunov" <vt@altlinux.org>, "Tadeusz
 Struk" <tstruk@gigaio.com>
X-Mailer: aerc 0.18.2
References: <cover.1725972333.git.lukas@wunner.de>
 <dcb40882817bb4c9396ca2dc209360ed7d4b9af9.1725972335.git.lukas@wunner.de>
In-Reply-To: <dcb40882817bb4c9396ca2dc209360ed7d4b9af9.1725972335.git.lukas@wunner.de>

On Tue Sep 10, 2024 at 5:30 PM EEST, Lukas Wunner wrote:
> The RSASSA-PKCS1-v1_5 sign operation currently only checks that the
> digest length is less than "key_size - hash_prefix->size - 11".
> The verify operation merely checks that it's more than zero.
>
> Actually the precise digest length is known because the hash algorithm
> is specified upon instance creation and the digest length is encoded
> into the final byte of the hash algorithm's Full Hash Prefix.
>
> So check for the exact digest length rather than solely relying on
> imprecise maximum/minimum checks.
>
> Keep the maximum length check for the sign operation as a safety net,
> but drop the now unnecessary minimum check for the verify operation.
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  crypto/rsassa-pkcs1.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
> index 779c080fc013..8f42a5712806 100644
> --- a/crypto/rsassa-pkcs1.c
> +++ b/crypto/rsassa-pkcs1.c
> @@ -11,6 +11,7 @@
>  #include <linux/scatterlist.h>
>  #include <crypto/akcipher.h>
>  #include <crypto/algapi.h>
> +#include <crypto/hash.h>
>  #include <crypto/sig.h>
>  #include <crypto/internal/akcipher.h>
>  #include <crypto/internal/rsa.h>
> @@ -118,6 +119,20 @@ static const struct hash_prefix *rsassa_pkcs1_find_h=
ash_prefix(const char *name)
>  	return NULL;
>  }
> =20
> +static unsigned int rsassa_pkcs1_hash_len(const struct hash_prefix *p)
> +{
> +	/*
> +	 * The final byte of the Full Hash Prefix encodes the hash length.
> +	 *
> +	 * This needs to be revisited should hash algorithms with more than
> +	 * 1016 bits (127 bytes * 8) ever be added.  The length would then
> +	 * be encoded into more than one byte by ASN.1.
> +	 */

Maybe this could be moved outside the function.

> +	static_assert(HASH_MAX_DIGESTSIZE <=3D 127);
> +
> +	return p->data[p->size - 1];
> +}
> +
>  struct rsassa_pkcs1_ctx {
>  	struct crypto_akcipher *child;
>  	unsigned int key_size;
> @@ -152,6 +167,9 @@ static int rsassa_pkcs1_sign(struct crypto_sig *tfm,
>  	if (dlen < ctx->key_size)
>  		return -EOVERFLOW;
> =20
> +	if (slen !=3D rsassa_pkcs1_hash_len(hash_prefix))
> +		return -EINVAL;
> +
>  	if (slen + hash_prefix->size > ctx->key_size - 11)
>  		return -EOVERFLOW;
> =20
> @@ -217,7 +235,7 @@ static int rsassa_pkcs1_verify(struct crypto_sig *tfm=
,
>  	/* RFC 8017 sec 8.2.2 step 1 - length checking */
>  	if (!ctx->key_size ||
>  	    slen !=3D ctx->key_size ||
> -	    !dlen)
> +	    dlen !=3D rsassa_pkcs1_hash_len(hash_prefix))
>  		return -EINVAL;
> =20
>  	/* RFC 8017 sec 8.2.2 step 2 - RSA verification */


BR, Jarkko

