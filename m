Return-Path: <keyrings+bounces-3739-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57397CFE796
	for <lists+keyrings@lfdr.de>; Wed, 07 Jan 2026 16:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9E6EE30C4899
	for <lists+keyrings@lfdr.de>; Wed,  7 Jan 2026 15:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C55F3451B2;
	Wed,  7 Jan 2026 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="J6KL3eXy"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1613446C3
	for <keyrings@vger.kernel.org>; Wed,  7 Jan 2026 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795854; cv=none; b=QlI81Xz+9dijX5OZmTOGPHhbxZB3rXgGZETa1bNRcuz+hVxVgbIexntQrL+jITvUdnQNfrh5ZEy3lfsNBslUR5dfaXd77FWeCnILsUPJfHzod5ZtL/W478AuJT5Tda6d9FI5rHepQDo+L8TLWxsNUDFOIOXJ1yNfHo2DFOjaSn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795854; c=relaxed/simple;
	bh=1NyDTV+QeKS+GoljArocQbp81Y7Q+EJ7UIi07NAHbi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iu9hi43/dAy/X5wGisaUO3ZHcdBnX0yWKmxAgKBVDZpBaVb1a2M1O/xsgPk5VYhi7E4BtUpv6ve/MFfMv8eJaHhIWsLvhcSXGqr4aBDj0F/ARGD0MaKinzFvcKTLRDwyDgv7pV1tl+FWOh8mpuEiUSfsIw5b9ow8uJGbwEd0MMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=fail smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=J6KL3eXy; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=cloudflare.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59583505988so1318204e87.1
        for <keyrings@vger.kernel.org>; Wed, 07 Jan 2026 06:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1767795851; x=1768400651; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nuwWbehwvV7avh9lROjzqp+ZoFWxp7GeiaNyFlNZXIc=;
        b=J6KL3eXyxhWVq0notlBBSywsHua2pZ1GYRSA4RH4pU8VKeUN9ANnfisgHF5uFw6AAN
         lDt7lnmVjyRzsugcio0h6/CkMKee7hOHNGNmh0Y94io7W1YQ5l082J2RiPjBqL8RLy8w
         3XmKpDLZsZMMmz24HwEu2gY0MCaTDA8AnQeoJCAjmBEu/efDWl6BRfmFowgPpGWao3XD
         gO0xLnpJ4GZz50XOEVfs95CL5qC7d2KPIIDiXo4i9Z5mVNxdcWNhk05wfVH/H5xGVLWJ
         rdVJe1ePw3sye2MVQHKXu7sSZ25H6kmnNq8DryYJ1eELUX5MSSO7NrLB0WNeqT+/j80Z
         WsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767795851; x=1768400651;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nuwWbehwvV7avh9lROjzqp+ZoFWxp7GeiaNyFlNZXIc=;
        b=QWYKKgZXFEi54SQ3aNamI9f34jDl1In42zlT03WpFcrSugoqi+YCTqsKBSx0NB+hW5
         tgHdmFfuCrXdscomaV9c4P0Vd70ZdvZUNIQFBsIIMPcJPjLS5hWfXHh2wQRAPgWJv5Kh
         xALy8JHO4JtRwoD6xxVcuuMV893TooTaNH+pQtQz9ywLLSgmPl+7iMMHgw0Fkm1/SzkG
         nxfkfFHDw/DI2YRNMWd4gC8ykA0BHDGshNJpcp9YQ+IgXYGtdJvyVrOI/ud5xwNn1xjB
         tx9r2wOFZdAJAqmP4WlrNqfIm17TLAIQgSyuPbIHQz36V69lAX66RMBuy26jJlogFECf
         cA5g==
X-Forwarded-Encrypted: i=1; AJvYcCXDQgrHW0lY/dWaZbgQcVtJVK+fuXGP9NtShw9xfCqXg4eXEZwsLtzJmUtoqrHK2gVcZyM5YacR0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIIlasvsVgnWkfJTlK8sBg/2hj/ozpyoQRJOEJn3G7DDWYPbJe
	K9EbpKbs7OA2Hpd7kWRt3brchQ3Mv2pwINfbvlaAb+QBgxEcqTBcpacd/QG6pjFrH2OydL2qYlT
	WRUg7d3K2UVE5Sq3LILR0I2n01tOl7Ho2o5urzqAvrA==
X-Gm-Gg: AY/fxX509cYWHz5Ptmgmfm7rmRyiLBmeBJ2shzShzJT+tlwcjH4NTqL+duoq5VUtnLv
	zjjPeeYtUI/tUsJROH0dfkZ47wQ3VMwnZ5dUHsCqhmCM+lqucnl6TM5CVBS/x/bBp/pR/WHjdVl
	GagxNqRfYnm40IMciooDpSP/wGYi+1sviA2tSq7qSxvIuMd3h4MHSvdzdKmPrpOTUFkCqJOtSUR
	O8Q/NPLMF6MyB/n5+yqeOB2cd9ySyfzOCxbRY4YHSxlFkvOizIch46B50LTD4ulRyMdsBZ5DHRV
	wjLIuOvpTnbiXw==
X-Google-Smtp-Source: AGHT+IHdSPcZIvSn6a8aPJJ8FK2xjEqy8Ke28u5UZ+8XEpc0l5rOwf+iWQZ0EBNd9iJyMo+KwuhLZJOhbTPAbKfw94I=
X-Received: by 2002:a05:6512:3ba7:b0:595:9195:338f with SMTP id
 2adb3069b0e04-59b6eb6b29dmr885391e87.23.1767795850606; Wed, 07 Jan 2026
 06:24:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105152145.1801972-1-dhowells@redhat.com> <20260105152145.1801972-6-dhowells@redhat.com>
In-Reply-To: <20260105152145.1801972-6-dhowells@redhat.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 7 Jan 2026 14:23:58 +0000
X-Gm-Features: AQt7F2oANTpmBIEId1fXP6-7B2OlGJuWFeUPHu3yiPwPtiGF-_xCSvXRgOafBRg
Message-ID: <CALrw=nGjpmPh6YNPJf-=0P5=RVs+zWz5cza4xrm-AKK3VDkOng@mail.gmail.com>
Subject: Re: [PATCH v11 5/8] crypto: Add supplementary info param to
 asymmetric key signature verification
To: David Howells <dhowells@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Stephan Mueller <smueller@chronox.de>, 
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 3:22=E2=80=AFPM David Howells <dhowells@redhat.com> =
wrote:
>
> Add a supplementary information parameter to the asymmetric key signature
> verification API, in particular crypto_sig_verify() and sig_alg::verify.
> This takes the form of a printable string containing of key=3Dval element=
s.
>
> This is needed as some algorithms require additional metadata
> (e.g. RSASSA-PSS) and this extra metadata is included in the X.509
> certificates and PKCS#7 messages.  Furthermore, keyctl(KEYCTL_PKEY_VERIFY=
)
> already allows for this to be passed to the kernel, as do the _SIGN,
> _ENCRYPT and _DECRYPT keyctls.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: "David S. Miller" <davem@davemloft.net>
> cc: Lukas Wunner <lukas@wunner.de>
> cc: Ignat Korchagin <ignat@cloudflare.com>
> cc: keyrings@vger.kernel.org
> cc: linux-crypto@vger.kernel.org
> ---
>  crypto/asymmetric_keys/asymmetric_type.c | 1 +
>  crypto/asymmetric_keys/public_key.c      | 2 +-
>  crypto/asymmetric_keys/signature.c       | 1 +
>  crypto/ecdsa-p1363.c                     | 5 +++--
>  crypto/ecdsa-x962.c                      | 5 +++--
>  crypto/ecdsa.c                           | 3 ++-
>  crypto/ecrdsa.c                          | 3 ++-
>  crypto/mldsa.c                           | 3 ++-
>  crypto/rsassa-pkcs1.c                    | 3 ++-
>  crypto/sig.c                             | 3 ++-
>  include/crypto/public_key.h              | 1 +
>  include/crypto/sig.h                     | 9 ++++++---
>  12 files changed, 26 insertions(+), 13 deletions(-)
>
> diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric=
_keys/asymmetric_type.c
> index 348966ea2175..dad4f0edfa25 100644
> --- a/crypto/asymmetric_keys/asymmetric_type.c
> +++ b/crypto/asymmetric_keys/asymmetric_type.c
> @@ -596,6 +596,7 @@ static int asymmetric_key_verify_signature(struct ker=
nel_pkey_params *params,
>                 .digest_size    =3D params->in_len,
>                 .encoding       =3D params->encoding,
>                 .hash_algo      =3D params->hash_algo,
> +               .info           =3D params->info,
>                 .digest         =3D (void *)in,
>                 .s              =3D (void *)in2,
>         };
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys=
/public_key.c
> index ed6b4b5ae4ef..61dc4f626620 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -433,7 +433,7 @@ int public_key_verify_signature(const struct public_k=
ey *pkey,
>                 goto error_free_key;
>
>         ret =3D crypto_sig_verify(tfm, sig->s, sig->s_size,
> -                               sig->digest, sig->digest_size);
> +                               sig->digest, sig->digest_size, sig->info)=
;
>
>  error_free_key:
>         kfree_sensitive(key);
> diff --git a/crypto/asymmetric_keys/signature.c b/crypto/asymmetric_keys/=
signature.c
> index 041d04b5c953..26c0c0112ac4 100644
> --- a/crypto/asymmetric_keys/signature.c
> +++ b/crypto/asymmetric_keys/signature.c
> @@ -29,6 +29,7 @@ void public_key_signature_free(struct public_key_signat=
ure *sig)
>                         kfree(sig->auth_ids[i]);
>                 kfree(sig->s);
>                 kfree(sig->digest);
> +               kfree(sig->info);
>                 kfree(sig);
>         }
>  }
> diff --git a/crypto/ecdsa-p1363.c b/crypto/ecdsa-p1363.c
> index e0c55c64711c..fa987dba1213 100644
> --- a/crypto/ecdsa-p1363.c
> +++ b/crypto/ecdsa-p1363.c
> @@ -18,7 +18,8 @@ struct ecdsa_p1363_ctx {
>
>  static int ecdsa_p1363_verify(struct crypto_sig *tfm,
>                               const void *src, unsigned int slen,
> -                             const void *digest, unsigned int dlen)
> +                             const void *digest, unsigned int dlen,
> +                             const char *info)
>  {
>         struct ecdsa_p1363_ctx *ctx =3D crypto_sig_ctx(tfm);
>         unsigned int keylen =3D DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx-=
>child),
> @@ -32,7 +33,7 @@ static int ecdsa_p1363_verify(struct crypto_sig *tfm,
>         ecc_digits_from_bytes(src, keylen, sig.r, ndigits);
>         ecc_digits_from_bytes(src + keylen, keylen, sig.s, ndigits);
>
> -       return crypto_sig_verify(ctx->child, &sig, sizeof(sig), digest, d=
len);
> +       return crypto_sig_verify(ctx->child, &sig, sizeof(sig), digest, d=
len, info);
>  }
>
>  static unsigned int ecdsa_p1363_key_size(struct crypto_sig *tfm)
> diff --git a/crypto/ecdsa-x962.c b/crypto/ecdsa-x962.c
> index ee71594d10a0..5d7f1078989c 100644
> --- a/crypto/ecdsa-x962.c
> +++ b/crypto/ecdsa-x962.c
> @@ -75,7 +75,8 @@ int ecdsa_get_signature_s(void *context, size_t hdrlen,=
 unsigned char tag,
>
>  static int ecdsa_x962_verify(struct crypto_sig *tfm,
>                              const void *src, unsigned int slen,
> -                            const void *digest, unsigned int dlen)
> +                            const void *digest, unsigned int dlen,
> +                            const char *info)
>  {
>         struct ecdsa_x962_ctx *ctx =3D crypto_sig_ctx(tfm);
>         struct ecdsa_x962_signature_ctx sig_ctx;
> @@ -89,7 +90,7 @@ static int ecdsa_x962_verify(struct crypto_sig *tfm,
>                 return err;
>
>         return crypto_sig_verify(ctx->child, &sig_ctx.sig, sizeof(sig_ctx=
.sig),
> -                                digest, dlen);
> +                                digest, dlen, info);
>  }
>
>  static unsigned int ecdsa_x962_key_size(struct crypto_sig *tfm)
> diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
> index ce8e4364842f..144fd6b9168b 100644
> --- a/crypto/ecdsa.c
> +++ b/crypto/ecdsa.c
> @@ -65,7 +65,8 @@ static int _ecdsa_verify(struct ecc_ctx *ctx, const u64=
 *hash, const u64 *r, con
>   */
>  static int ecdsa_verify(struct crypto_sig *tfm,
>                         const void *src, unsigned int slen,
> -                       const void *digest, unsigned int dlen)
> +                       const void *digest, unsigned int dlen,
> +                       const char *info)
>  {
>         struct ecc_ctx *ctx =3D crypto_sig_ctx(tfm);
>         size_t bufsize =3D ctx->curve->g.ndigits * sizeof(u64);
> diff --git a/crypto/ecrdsa.c b/crypto/ecrdsa.c
> index 2c0602f0cd40..59f2d5bb3be4 100644
> --- a/crypto/ecrdsa.c
> +++ b/crypto/ecrdsa.c
> @@ -69,7 +69,8 @@ static const struct ecc_curve *get_curve_by_oid(enum OI=
D oid)
>
>  static int ecrdsa_verify(struct crypto_sig *tfm,
>                          const void *src, unsigned int slen,
> -                        const void *digest, unsigned int dlen)
> +                        const void *digest, unsigned int dlen,
> +                        const char *info)
>  {
>         struct ecrdsa_ctx *ctx =3D crypto_sig_ctx(tfm);
>         unsigned int ndigits =3D dlen / sizeof(u64);
> diff --git a/crypto/mldsa.c b/crypto/mldsa.c
> index 2146c774b5ca..ba071d030ab0 100644
> --- a/crypto/mldsa.c
> +++ b/crypto/mldsa.c
> @@ -25,7 +25,8 @@ static int crypto_mldsa_sign(struct crypto_sig *tfm,
>
>  static int crypto_mldsa_verify(struct crypto_sig *tfm,
>                                const void *sig, unsigned int sig_len,
> -                              const void *msg, unsigned int msg_len)
> +                              const void *msg, unsigned int msg_len,
> +                              const char *info)
>  {
>         const struct crypto_mldsa_ctx *ctx =3D crypto_sig_ctx(tfm);
>
> diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
> index 94fa5e9600e7..6283050e609a 100644
> --- a/crypto/rsassa-pkcs1.c
> +++ b/crypto/rsassa-pkcs1.c
> @@ -215,7 +215,8 @@ static int rsassa_pkcs1_sign(struct crypto_sig *tfm,
>
>  static int rsassa_pkcs1_verify(struct crypto_sig *tfm,
>                                const void *src, unsigned int slen,
> -                              const void *digest, unsigned int dlen)
> +                              const void *digest, unsigned int dlen,
> +                              const char *info)
>  {
>         struct sig_instance *inst =3D sig_alg_instance(tfm);
>         struct rsassa_pkcs1_inst_ctx *ictx =3D sig_instance_ctx(inst);
> diff --git a/crypto/sig.c b/crypto/sig.c
> index beba745b6405..c56fea3a53ae 100644
> --- a/crypto/sig.c
> +++ b/crypto/sig.c
> @@ -92,7 +92,8 @@ static int sig_default_sign(struct crypto_sig *tfm,
>
>  static int sig_default_verify(struct crypto_sig *tfm,
>                               const void *src, unsigned int slen,
> -                             const void *dst, unsigned int dlen)
> +                             const void *dst, unsigned int dlen,
> +                             const char *info)
>  {
>         return -ENOSYS;
>  }
> diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
> index e4ec8003a3a4..1e9a1e4e9916 100644
> --- a/include/crypto/public_key.h
> +++ b/include/crypto/public_key.h
> @@ -47,6 +47,7 @@ struct public_key_signature {
>         u32 s_size;             /* Number of bytes in signature */
>         u32 digest_size;        /* Number of bytes in digest */
>         bool algo_does_hash;    /* Public key algo does its own hashing *=
/
> +       char *info;             /* Supplementary parameters */
>         const char *pkey_algo;
>         const char *hash_algo;
>         const char *encoding;
> diff --git a/include/crypto/sig.h b/include/crypto/sig.h
> index fa6dafafab3f..885fa6487780 100644
> --- a/include/crypto/sig.h
> +++ b/include/crypto/sig.h
> @@ -56,7 +56,8 @@ struct sig_alg {
>                     void *dst, unsigned int dlen);
>         int (*verify)(struct crypto_sig *tfm,
>                       const void *src, unsigned int slen,
> -                     const void *digest, unsigned int dlen);
> +                     const void *digest, unsigned int dlen,
> +                     const char *info);
>         int (*set_pub_key)(struct crypto_sig *tfm,
>                            const void *key, unsigned int keylen);
>         int (*set_priv_key)(struct crypto_sig *tfm,
> @@ -209,16 +210,18 @@ static inline int crypto_sig_sign(struct crypto_sig=
 *tfm,
>   * @slen:      source length
>   * @digest:    digest
>   * @dlen:      digest length
> + * @info:      Additional parameters as a set of k=3Dv
>   *
>   * Return: zero on verification success; error code in case of error.
>   */
>  static inline int crypto_sig_verify(struct crypto_sig *tfm,
>                                     const void *src, unsigned int slen,
> -                                   const void *digest, unsigned int dlen=
)
> +                                   const void *digest, unsigned int dlen=
,
> +                                   const char *info)
>  {
>         struct sig_alg *alg =3D crypto_sig_alg(tfm);
>
> -       return alg->verify(tfm, src, slen, digest, dlen);
> +       return alg->verify(tfm, src, slen, digest, dlen, info);
>  }
>
>  /**
>

Reviewed-by: Ignat Korchagin <ignat@cloudflare.com>

