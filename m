Return-Path: <keyrings+bounces-2004-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B0F9752DE
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 14:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9898DB248F1
	for <lists+keyrings@lfdr.de>; Wed, 11 Sep 2024 12:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198B91714CF;
	Wed, 11 Sep 2024 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGIkK9md"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45C518EFD4;
	Wed, 11 Sep 2024 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726058952; cv=none; b=dJINBaYuqzIBrAiPjT3SOGdL991FKEW4QSoV5A8cHpU5sFt5+cuAHGNClZgC/2/88/aDOJnNIWyM5uB5R+VXTaArFI0CgQlkXKTN2zec1qJ19HfdZyKD//UuxQ5OzJSxpCbUfdo3fxL3ZS0pntv3P5fCGbrytDwrXvadRG207fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726058952; c=relaxed/simple;
	bh=DmfDciZfAQsHzD1twt2/wDXPYs9oqTXB5QYAdBZT594=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=WTBsTx2Wo0zOj9YimT0nzuUnDrfNYLeMboD145c7bGEkcZ2x1xS3M4ADzQZNQ0mreVq+1Ut4DlDPDn9aUCgKGapLQjTkhQMahOGUKoc0KCvM255CvypcKQWyRVWGi/ZSJVhGLLKPhKkBLdy46Ke5mkO11/36uR4UQg2vTgHyCuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGIkK9md; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 376EFC4CEC5;
	Wed, 11 Sep 2024 12:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726058951;
	bh=DmfDciZfAQsHzD1twt2/wDXPYs9oqTXB5QYAdBZT594=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=UGIkK9mdrpxLovJiBE9Fz6Ei40rAL2RVLejP1Jks8yQPXaGabmnczOiY2Iktf4NpH
	 IGi1E7zriIf6flMuUhKca7BqQ7bvx83go/gDnu527VuNRHLf80dQTT9vefjPcWMyyc
	 gaZyLRUbkydv7+KlPHRBq0NGRNoklPmV0hczfKgzpYL6SKlU5Pdz6e1MO4nQ89kG80
	 Mz8JTcWccrubBbsuaXa+gekJX3Tziziojb5O8vCgHL6GshMeOYeywq9nXTLAgM3o/d
	 mNQuNsjoJUpEW/+c/2e9r6pMLUf/SeAzRC7LeXe4RiD/xmv4pcfwA365B3pGvg7t5c
	 iprM1qkpK2A/w==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Sep 2024 15:49:07 +0300
Message-Id: <D43GTXWLMJ2E.258ZI34E5JRK6@kernel.org>
Cc: "David Howells" <dhowells@redhat.com>, "Andrew Zaborowski"
 <andrew.zaborowski@intel.com>, "Saulo Alessandre"
 <saulo.alessandre@tse.jus.br>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Ignat Korchagin" <ignat@cloudflare.com>,
 "Marek Behun" <kabel@kernel.org>, "Varad Gautam" <varadgautam@google.com>,
 "Stephan Mueller" <smueller@chronox.de>, "Denis Kenzior"
 <denkenz@gmail.com>, <linux-crypto@vger.kernel.org>,
 <keyrings@vger.kernel.org>
Subject: Re: [PATCH v2 04/19] crypto: ecrdsa - Migrate to sig_alg backend
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Lukas Wunner" <lukas@wunner.de>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Eric Biggers" <ebiggers@google.com>, "Stefan Berger"
 <stefanb@linux.ibm.com>, "Vitaly Chikunov" <vt@altlinux.org>, "Tadeusz
 Struk" <tstruk@gigaio.com>
X-Mailer: aerc 0.18.2
References: <cover.1725972333.git.lukas@wunner.de>
 <45acc8db555f80408c8b975771da34c569da45da.1725972334.git.lukas@wunner.de>
In-Reply-To: <45acc8db555f80408c8b975771da34c569da45da.1725972334.git.lukas@wunner.de>

On Tue Sep 10, 2024 at 5:30 PM EEST, Lukas Wunner wrote:
> A sig_alg backend has just been introduced with the intent of moving all
> asymmetric sign/verify algorithms to it one by one.
>
> Migrate ecrdsa.c to the new backend.
>
> One benefit of the new API is the use of kernel buffers instead of
> sglists, which avoids the overhead of copying signature and digest
> sglists back into kernel buffers.  ecrdsa.c is thus simplified quite
> a bit.
>
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  crypto/Kconfig   |  2 +-
>  crypto/ecrdsa.c  | 56 +++++++++++++++++++++---------------------------
>  crypto/testmgr.c |  4 ++--
>  crypto/testmgr.h |  7 +-----
>  4 files changed, 28 insertions(+), 41 deletions(-)
>
> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 89b728c72f07..e8488b8c45e3 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -302,7 +302,7 @@ config CRYPTO_ECDSA
>  config CRYPTO_ECRDSA
>  	tristate "EC-RDSA (Elliptic Curve Russian Digital Signature Algorithm)"
>  	select CRYPTO_ECC
> -	select CRYPTO_AKCIPHER
> +	select CRYPTO_SIG
>  	select CRYPTO_STREEBOG
>  	select OID_REGISTRY
>  	select ASN1
> diff --git a/crypto/ecrdsa.c b/crypto/ecrdsa.c
> index 3811f3805b5d..7383dd11089b 100644
> --- a/crypto/ecrdsa.c
> +++ b/crypto/ecrdsa.c
> @@ -18,12 +18,11 @@
> =20
>  #include <linux/module.h>
>  #include <linux/crypto.h>
> +#include <crypto/sig.h>
>  #include <crypto/streebog.h>
> -#include <crypto/internal/akcipher.h>
>  #include <crypto/internal/ecc.h>
> -#include <crypto/akcipher.h>
> +#include <crypto/internal/sig.h>
>  #include <linux/oid_registry.h>
> -#include <linux/scatterlist.h>
>  #include "ecrdsa_params.asn1.h"
>  #include "ecrdsa_pub_key.asn1.h"
>  #include "ecrdsa_defs.h"
> @@ -68,13 +67,12 @@ static const struct ecc_curve *get_curve_by_oid(enum =
OID oid)
>  	}
>  }
> =20
> -static int ecrdsa_verify(struct akcipher_request *req)
> +static int ecrdsa_verify(struct crypto_sig *tfm,
> +			 const void *src, unsigned int slen,
> +			 const void *digest, unsigned int dlen)
>  {
> -	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
> -	struct ecrdsa_ctx *ctx =3D akcipher_tfm_ctx(tfm);
> -	unsigned char sig[ECRDSA_MAX_SIG_SIZE];
> -	unsigned char digest[STREEBOG512_DIGEST_SIZE];
> -	unsigned int ndigits =3D req->dst_len / sizeof(u64);
> +	struct ecrdsa_ctx *ctx =3D crypto_sig_ctx(tfm);
> +	unsigned int ndigits =3D dlen / sizeof(u64);
>  	u64 r[ECRDSA_MAX_DIGITS]; /* witness (r) */
>  	u64 _r[ECRDSA_MAX_DIGITS]; /* -r */
>  	u64 s[ECRDSA_MAX_DIGITS]; /* second part of sig (s) */
> @@ -91,25 +89,19 @@ static int ecrdsa_verify(struct akcipher_request *req=
)
>  	 */
>  	if (!ctx->curve ||
>  	    !ctx->digest ||
> -	    !req->src ||
> +	    !src ||
> +	    !digest ||
>  	    !ctx->pub_key.x ||
> -	    req->dst_len !=3D ctx->digest_len ||
> -	    req->dst_len !=3D ctx->curve->g.ndigits * sizeof(u64) ||
> +	    dlen !=3D ctx->digest_len ||
> +	    dlen !=3D ctx->curve->g.ndigits * sizeof(u64) ||
>  	    ctx->pub_key.ndigits !=3D ctx->curve->g.ndigits ||
> -	    req->dst_len * 2 !=3D req->src_len ||
> -	    WARN_ON(req->src_len > sizeof(sig)) ||
> -	    WARN_ON(req->dst_len > sizeof(digest)))
> +	    dlen * 2 !=3D slen ||
> +	    WARN_ON(slen > ECRDSA_MAX_SIG_SIZE) ||
> +	    WARN_ON(dlen > STREEBOG512_DIGEST_SIZE))

Despite being migration I don't see no point recycling use of WARN_ON()
here, given panic_on_warn kernel command-line flag.

If you want to print to something, please do separate checks and use
pr_warn() instead at most.

BR, Jarkko

