Return-Path: <keyrings+bounces-2616-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82169A866BC
	for <lists+keyrings@lfdr.de>; Fri, 11 Apr 2025 22:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 787B08A75F5
	for <lists+keyrings@lfdr.de>; Fri, 11 Apr 2025 20:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD14202C50;
	Fri, 11 Apr 2025 20:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="Xcjw5uMI"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79B623026C
	for <keyrings@vger.kernel.org>; Fri, 11 Apr 2025 20:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744401624; cv=none; b=XGKfm8ppOrkJ6g+QnMn71nFe385plKgK1+eETJjmF9IN5LHRskm+FlBDDt4xKG9k/TMEO+1FzIQj6tgPX1omlX804omW85LeFSfg8oOdbkKEsbyLssMQNiwFlkDLik8qYRueGOCnM/4GpzEtfrIfqi5xOZ8cGI7N3rZW4mnsk8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744401624; c=relaxed/simple;
	bh=4M3lKfvUq0P1wj2dazt9r3vkrk/O0UhhQpX0jQk0v+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QIVXZ3u9Y85UnJnm+dmf0+FdFkKS8SL8HEmPLiVZ6DeU2tJFrEyHSMvJSNr86oa/oZGkQkO+8EE1TWkK9Dw62I/p9XRNoFtxiJUN8iaHu50dSaWBIKmQF2gIbAKPkrKzuyqC5ETI16JFEBq2xV9bac3YoXugIxfjfkkLFe+DNBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=Xcjw5uMI; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30828fc17adso862578a91.1
        for <keyrings@vger.kernel.org>; Fri, 11 Apr 2025 13:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1744401622; x=1745006422; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHuvdBy5fJv1R0jykazKr6Dm447AKmOurSWdgqMplAE=;
        b=Xcjw5uMImtX64Qh1lZl/laxXcCoTwMNTlktiWiO3+NaQJXhpl71FjwWdqrQCe/ncr7
         Ad4fqcOS4NSuy826/9Ek56evNr20GkhJygmUgSs/MFTDN6EUsYSNbg2x6H1AQa+MHHBG
         mgs88uNFjISlZp1veRNGbh/1G00e1zkVB5MBlt/N8ch9kleRGLDNb5oodwGBBygtrtdo
         DnnLvJTuNV3FhD0j07UImpeorccgzsw7Y3CzuY0wcl2WRVjj5Y3s+VJA6mlCplovfwJ+
         18g8FgEBZqRJpHHXlvhnpfuoL9s6VxzacAFLY9kstWA057jWo6i71EZaTp7VU9d0MZWF
         mI/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744401622; x=1745006422;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHuvdBy5fJv1R0jykazKr6Dm447AKmOurSWdgqMplAE=;
        b=o67D3TSEdGQv4Co2h2uuO/I6i9q2qQmkLGUpm2sp05e8ayLANoHatUT1rwPmude3kb
         Dej6JBhnC9553FldYJDxSOm+mSj/WiKjFsvZpZXP+vL/nA2K189cqDEdhntj1w0tw4nP
         Eq3L+mbka/swFjxH+PmbVb8sq89iFZIoThEw+QfFFKnuRBJaKOC9aJtw1PCgLez913r2
         vqtqv2cXTVuChtoZJmyzfZlT6ffZ5NzdmO94Dl5RfkIcuRE4QDH6dwJBFQHNAL9Dq1al
         cMm1AFTZg0Gjva+wzVTOeDHMyc+Op8vRGY2LyJbpyPGg5JcInl/OCv0+u2+zLa2qrPol
         9wrA==
X-Forwarded-Encrypted: i=1; AJvYcCVdAT8ZI96EqsxM09v0tEcjZgXFK4efS3d+58bpdkQ6VVQNYEViMdqpS+2G619RK0LVma6fkTIuIA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+/9bmkXahJCCcH3wNsViMMZKtlV15ATuRViI18n4sEvtLHCSG
	mA9erWJgyx7j4aQwK4gNZcFYAqad68UABhjwtGYjBZrqabVlK5NxMcE+/bH4Z78g7HCbokGQ+za
	PdCXzutyuiM6cqJ2AVbhmm4nwQ8ofCWRYVVo4fA==
X-Gm-Gg: ASbGncuoZMPr4CBdOR3erkP/p7P35BUTCyRc94CMEUZIq0OT8La2MeJNAfzviw2LqrB
	WoY6YEPRw4Cboq6k/QaO59GUN0ZqKgYcZCE0J0Q7PRNX2pLW1Qub4G3Z/rLhSkW+NjeuRlu6G6h
	8xrq0Qpnr5SSjvIw5osxMJEP5p2IkxgujsN53WeI+/
X-Google-Smtp-Source: AGHT+IELp6J3mc8HVoX5rPyRO2vOlsijlbcrnLWy6MCHGe9HW9QJzgYX1XTgltO9zwp5Y0H2VutGZ0I8v4CVOXqONbo=
X-Received: by 2002:a17:90b:2ed0:b0:2ee:e518:c1d8 with SMTP id
 98e67ed59e1d1-30823680aafmr6248934a91.30.1744401622077; Fri, 11 Apr 2025
 13:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1744052920.git.lukas@wunner.de> <6c5b85bf2dc8bb7852ff0ba961f1622dcc57f7ae.1744052920.git.lukas@wunner.de>
In-Reply-To: <6c5b85bf2dc8bb7852ff0ba961f1622dcc57f7ae.1744052920.git.lukas@wunner.de>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Fri, 11 Apr 2025 21:00:09 +0100
X-Gm-Features: ATxdqUEgKZzz_wTH_akf3IRbXPo5-K7S2Lm_18HJe1bK4yryrC-gwWulD4OdPJs
Message-ID: <CALrw=nEZ-gDjYi7nyOiXFxmu-xBu+rY3TbWs30tojd7wwr+uHA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 2/2] crypto: ecdsa - Fix NIST P521 key size
 reported by KEYCTL_PKEY_QUERY
To: Lukas Wunner <lukas@wunner.de>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	David Howells <dhowells@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>, 
	Vitaly Chikunov <vt@altlinux.org>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 8:43=E2=80=AFPM Lukas Wunner <lukas@wunner.de> wrote=
:
>
> When user space issues a KEYCTL_PKEY_QUERY system call for a NIST P521
> key, the key_size is incorrectly reported as 528 bits instead of 521.
>
> That's because the key size obtained through crypto_sig_keysize() is in
> bytes and software_key_query() multiplies by 8 to yield the size in bits.
> The underlying assumption is that the key size is always a multiple of 8.
> With the recent addition of NIST P521, that's no longer the case.
>
> Fix by returning the key_size in bits from crypto_sig_keysize() and
> adjusting the calculations in software_key_query().
>
> The ->key_size() callbacks of sig_alg algorithms now return the size in
> bits, whereas the ->digest_size() and ->max_size() callbacks return the
> size in bytes.  This matches with the units in struct keyctl_pkey_query.
>
> Fixes: a7d45ba77d3d ("crypto: ecdsa - Register NIST P521 and extend test =
suite")
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>

Reviewed-by: Ignat Korchagin <ignat@cloudflare.com>

> ---
>  crypto/asymmetric_keys/public_key.c | 8 ++++----
>  crypto/ecdsa-p1363.c                | 6 ++++--
>  crypto/ecdsa-x962.c                 | 5 +++--
>  crypto/ecdsa.c                      | 2 +-
>  crypto/ecrdsa.c                     | 2 +-
>  crypto/rsassa-pkcs1.c               | 2 +-
>  crypto/sig.c                        | 9 +++++++--
>  include/crypto/sig.h                | 2 +-
>  8 files changed, 22 insertions(+), 14 deletions(-)
>
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys=
/public_key.c
> index dd44a96..89dc887 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -205,6 +205,7 @@ static int software_key_query(const struct kernel_pke=
y_params *params,
>                         goto error_free_tfm;
>
>                 len =3D crypto_sig_keysize(sig);
> +               info->key_size =3D len;
>                 info->max_sig_size =3D crypto_sig_maxsize(sig);
>                 info->max_data_size =3D crypto_sig_digestsize(sig);
>
> @@ -213,8 +214,8 @@ static int software_key_query(const struct kernel_pke=
y_params *params,
>                         info->supported_ops |=3D KEYCTL_SUPPORTS_SIGN;
>
>                 if (strcmp(params->encoding, "pkcs1") =3D=3D 0) {
> -                       info->max_enc_size =3D len;
> -                       info->max_dec_size =3D len;
> +                       info->max_enc_size =3D len / BITS_PER_BYTE;
> +                       info->max_dec_size =3D len / BITS_PER_BYTE;
>
>                         info->supported_ops |=3D KEYCTL_SUPPORTS_ENCRYPT;
>                         if (pkey->key_is_private)
> @@ -235,6 +236,7 @@ static int software_key_query(const struct kernel_pke=
y_params *params,
>                         goto error_free_tfm;
>
>                 len =3D crypto_akcipher_maxsize(tfm);
> +               info->key_size =3D len * BITS_PER_BYTE;
>                 info->max_sig_size =3D len;
>                 info->max_data_size =3D len;
>                 info->max_enc_size =3D len;
> @@ -245,8 +247,6 @@ static int software_key_query(const struct kernel_pke=
y_params *params,
>                         info->supported_ops |=3D KEYCTL_SUPPORTS_DECRYPT;
>         }
>
> -       info->key_size =3D len * 8;
> -
>         ret =3D 0;
>
>  error_free_tfm:
> diff --git a/crypto/ecdsa-p1363.c b/crypto/ecdsa-p1363.c
> index 4454f1f..e0c55c6 100644
> --- a/crypto/ecdsa-p1363.c
> +++ b/crypto/ecdsa-p1363.c
> @@ -21,7 +21,8 @@ static int ecdsa_p1363_verify(struct crypto_sig *tfm,
>                               const void *digest, unsigned int dlen)
>  {
>         struct ecdsa_p1363_ctx *ctx =3D crypto_sig_ctx(tfm);
> -       unsigned int keylen =3D crypto_sig_keysize(ctx->child);
> +       unsigned int keylen =3D DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx-=
>child),
> +                                               BITS_PER_BYTE);
>         unsigned int ndigits =3D DIV_ROUND_UP_POW2(keylen, sizeof(u64));
>         struct ecdsa_raw_sig sig;
>
> @@ -45,7 +46,8 @@ static unsigned int ecdsa_p1363_max_size(struct crypto_=
sig *tfm)
>  {
>         struct ecdsa_p1363_ctx *ctx =3D crypto_sig_ctx(tfm);
>
> -       return 2 * crypto_sig_keysize(ctx->child);
> +       return 2 * DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx->child),
> +                                    BITS_PER_BYTE);
>  }
>
>  static unsigned int ecdsa_p1363_digest_size(struct crypto_sig *tfm)
> diff --git a/crypto/ecdsa-x962.c b/crypto/ecdsa-x962.c
> index 90a04f4..ee71594 100644
> --- a/crypto/ecdsa-x962.c
> +++ b/crypto/ecdsa-x962.c
> @@ -82,7 +82,7 @@ static int ecdsa_x962_verify(struct crypto_sig *tfm,
>         int err;
>
>         sig_ctx.ndigits =3D DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx->chi=
ld),
> -                                           sizeof(u64));
> +                                           sizeof(u64) * BITS_PER_BYTE);
>
>         err =3D asn1_ber_decoder(&ecdsasignature_decoder, &sig_ctx, src, =
slen);
>         if (err < 0)
> @@ -103,7 +103,8 @@ static unsigned int ecdsa_x962_max_size(struct crypto=
_sig *tfm)
>  {
>         struct ecdsa_x962_ctx *ctx =3D crypto_sig_ctx(tfm);
>         struct sig_alg *alg =3D crypto_sig_alg(ctx->child);
> -       int slen =3D crypto_sig_keysize(ctx->child);
> +       int slen =3D DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx->child),
> +                                    BITS_PER_BYTE);
>
>         /*
>          * Verify takes ECDSA-Sig-Value (described in RFC 5480) as input,
> diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
> index 117526d..a70b60a 100644
> --- a/crypto/ecdsa.c
> +++ b/crypto/ecdsa.c
> @@ -167,7 +167,7 @@ static unsigned int ecdsa_key_size(struct crypto_sig =
*tfm)
>  {
>         struct ecc_ctx *ctx =3D crypto_sig_ctx(tfm);
>
> -       return DIV_ROUND_UP(ctx->curve->nbits, 8);
> +       return ctx->curve->nbits;
>  }
>
>  static unsigned int ecdsa_digest_size(struct crypto_sig *tfm)
> diff --git a/crypto/ecrdsa.c b/crypto/ecrdsa.c
> index b3dd8a3..2c0602f 100644
> --- a/crypto/ecrdsa.c
> +++ b/crypto/ecrdsa.c
> @@ -249,7 +249,7 @@ static unsigned int ecrdsa_key_size(struct crypto_sig=
 *tfm)
>          * Verify doesn't need any output, so it's just informational
>          * for keyctl to determine the key bit size.
>          */
> -       return ctx->pub_key.ndigits * sizeof(u64);
> +       return ctx->pub_key.ndigits * sizeof(u64) * BITS_PER_BYTE;
>  }
>
>  static unsigned int ecrdsa_max_size(struct crypto_sig *tfm)
> diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
> index d01ac75..94fa5e9 100644
> --- a/crypto/rsassa-pkcs1.c
> +++ b/crypto/rsassa-pkcs1.c
> @@ -301,7 +301,7 @@ static unsigned int rsassa_pkcs1_key_size(struct cryp=
to_sig *tfm)
>  {
>         struct rsassa_pkcs1_ctx *ctx =3D crypto_sig_ctx(tfm);
>
> -       return ctx->key_size;
> +       return ctx->key_size * BITS_PER_BYTE;
>  }
>
>  static int rsassa_pkcs1_set_pub_key(struct crypto_sig *tfm,
> diff --git a/crypto/sig.c b/crypto/sig.c
> index dfc7cae..53a3dd6 100644
> --- a/crypto/sig.c
> +++ b/crypto/sig.c
> @@ -102,6 +102,11 @@ static int sig_default_set_key(struct crypto_sig *tf=
m,
>         return -ENOSYS;
>  }
>
> +static unsigned int sig_default_size(struct crypto_sig *tfm)
> +{
> +       return DIV_ROUND_UP_POW2(crypto_sig_keysize(tfm), BITS_PER_BYTE);
> +}
> +
>  static int sig_prepare_alg(struct sig_alg *alg)
>  {
>         struct crypto_alg *base =3D &alg->base;
> @@ -117,9 +122,9 @@ static int sig_prepare_alg(struct sig_alg *alg)
>         if (!alg->key_size)
>                 return -EINVAL;
>         if (!alg->max_size)
> -               alg->max_size =3D alg->key_size;
> +               alg->max_size =3D sig_default_size;
>         if (!alg->digest_size)
> -               alg->digest_size =3D alg->key_size;
> +               alg->digest_size =3D sig_default_size;
>
>         base->cra_type =3D &crypto_sig_type;
>         base->cra_flags &=3D ~CRYPTO_ALG_TYPE_MASK;
> diff --git a/include/crypto/sig.h b/include/crypto/sig.h
> index 1102470..fa6dafaf 100644
> --- a/include/crypto/sig.h
> +++ b/include/crypto/sig.h
> @@ -128,7 +128,7 @@ static inline void crypto_free_sig(struct crypto_sig =
*tfm)
>  /**
>   * crypto_sig_keysize() - Get key size
>   *
> - * Function returns the key size in bytes.
> + * Function returns the key size in bits.
>   * Function assumes that the key is already set in the transformation. I=
f this
>   * function is called without a setkey or with a failed setkey, you may =
end up
>   * in a NULL dereference.
> --
> 2.43.0
>

