Return-Path: <keyrings+bounces-3740-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0BBCFF43E
	for <lists+keyrings@lfdr.de>; Wed, 07 Jan 2026 19:03:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 181EC34795A2
	for <lists+keyrings@lfdr.de>; Wed,  7 Jan 2026 16:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AA73A63E8;
	Wed,  7 Jan 2026 16:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="JPmNDrAE"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFFB3A5259
	for <keyrings@vger.kernel.org>; Wed,  7 Jan 2026 16:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803099; cv=none; b=Fd35iofFChQc9r6yfq3iFZ0hnTJ7blQA7IjGv+DblKBW+LjkwVc8xHRRJyycJUd0pKV+La+AbijmSysc5uSIoAyeHafchdczy/UPWpk2hCO7X9S6GVQgXoUSYmIo3sy+bUgO//0Ue8Vu/g5VGvFfpym6RsecMiaGZWk0FNzQ91Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803099; c=relaxed/simple;
	bh=UCh8nJRZ63iYxsf1IEMFgaYFizOgL9SwccsUrpEAmJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=COZFKXh4sSfM3eGeSU1a9pDmWGCUyY8wRcbzuvxbwj6PdN0QuLnJM0bavxpt6tBDlQqV1znxTUAHAnkqobXpfWAkuORqNai1d4MosdJ1kcGWuQKg7RPlx8yAay0H3AAUribp/vq4v7l+V0AaJeaxzUpCgXASwNmZrwD7F9ZGaYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=JPmNDrAE; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b685d2b79so1963232e87.3
        for <keyrings@vger.kernel.org>; Wed, 07 Jan 2026 08:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1767803077; x=1768407877; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mG9WS3J20SVfxYggope7lCqGhjLWVuHZEaE4ff4AqRo=;
        b=JPmNDrAEnHN7+AOSCnEgit38zEki1RVNgba4hfqbcbkuDgQyjjr+KGXckHRVxe0dYq
         gwmUoXcGdp+zl2eoUW1kESRYtNUxgjqvEa42i0+oKP4IbBTBMz2KpE7YMURfxHeM1URY
         VRyoX1BG2lHDBH1pqpuib7CA9nsHBUQY8/V+/b/H2N/3CqgfScMsdAEovWItFXgv8IHn
         Fx0NffSsTmjTctzKjn+qmR49qoSsSwm/QUoYKamBiz8lNPSVTiPc1up0bJlXOVgrMnd9
         0qvwX4sHXSw5eNecm3nSl5SFLoiQdh0hjHYlSkX+cemkhKKdYbzOX5kPRuqAlJLBzxeM
         IxXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803077; x=1768407877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mG9WS3J20SVfxYggope7lCqGhjLWVuHZEaE4ff4AqRo=;
        b=NspV9/F+ukU3o3+5zkIisWoO71iYV3LnXe+w8C5i70jqWyhc0fS37t05PZjwQ9DhM+
         U/94nAMtKR/nTP72O5dhl1SBgLQ0rVVjnUANu5DaWRxsnUVp909pOeRJQCRd2gUZwUgJ
         FeWMCrQCg5GdT4L73X/ck+n2AKziWt3qOGd5jp68rueyv7PJz99eD9tnR3z05pLFVWI0
         II0ly1XTjxVjjwD2gfFENXw5I2/Edb8/xuT4kYU+w9xa5B1R8QJtnDcyPBxHUZArzi00
         bQ57brQCjs8+DOkUyJha5l+85x6N1Q6b3XRysvBuAO33PQcJJ1BY1lqVXX9X0dX14RAV
         dAFA==
X-Forwarded-Encrypted: i=1; AJvYcCVJHhB/+Z5eF6IC5ZMqy3u97WuefqsoF5qytvK9yED+g4VgGN1FX9f3X7T0YWSvAbkpJGR461w7VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYaDmOqyo67fAF9SO744bKeX+CzYuiBPKKFZJSDkAJPIRddX8l
	BOgu6NwxL+vPkU4V7QJ7R/+28m+pyaashTiyVkjSlzzlssojnPvSP/2MVaYtuJzx1V9wxPo+vjO
	0DjD4azEDHMtJFQPizw078PUXujG6HYz3Cd/DWA/GKg==
X-Gm-Gg: AY/fxX7K0YBwt/mEoMe3bMPfTRGxy0+oGlc5qacZK1PnxMJokRnEtupBOiJhsnARpLq
	ZGvkClINzrOz8v172L9h6LL5gzSOV86wZUwnkrHPeCebzpgecKDvHU3nGig2NyfuqJvVtH2qGfm
	P5qGTM3XymX2lmCHSZz4ijnqv3VtmgtGgYbn29hAO3bDUI1OYGbZBvWefXalBual8jT1+GIXgqH
	R6WKafYHTJ/MlP+TRT900h1E2gEsK1ccRKnbE0LyNaPxI3SInCVL1J8ILhJ8mr5E15XjvORQz+y
	gLHrNDMe9Omkjg==
X-Google-Smtp-Source: AGHT+IFJxbJZrhSVkLen4nGs0e5xFGBesfKbk8pIBFxWfFfk2MiRruxaqLIUdQTheC+P8YXWteEjBpnBFiuMov9QsyY=
X-Received: by 2002:a05:6512:3e1b:b0:595:81e5:7574 with SMTP id
 2adb3069b0e04-59b6f025c29mr1099924e87.20.1767803076764; Wed, 07 Jan 2026
 08:24:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105152145.1801972-1-dhowells@redhat.com> <20260105152145.1801972-7-dhowells@redhat.com>
In-Reply-To: <20260105152145.1801972-7-dhowells@redhat.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 7 Jan 2026 16:24:25 +0000
X-Gm-Features: AQt7F2r3V5w6neNECxm5zev_XO688kUl3dFn8a1CAAQwUxA7xiYcirO_LhWSq8A
Message-ID: <CALrw=nHhs61yqkLkK9F4UGU_ujnniMzrkbhjRDc+Aa69XTFTvg@mail.gmail.com>
Subject: Re: [PATCH v11 6/8] crypto: Add RSASSA-PSS support
To: David Howells <dhowells@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Stephan Mueller <smueller@chronox.de>, 
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tadeusz Struk <tadeusz.struk@intel.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Jan 5, 2026 at 3:23=E2=80=AFPM David Howells <dhowells@redhat.com> =
wrote:
>
> Add support for RSASSA-PSS [RFC8017 sec 8.1] signature verification suppo=
rt
> to the RSA driver in crypto/.  Note that signing support is not provided.
>
> The verification function requires an info string formatted as a
> space-separated list of key=3Dvalue pairs.  The following parameters need=
 to
> be provided:
>
>  (1) sighash=3D<algo>
>
>      The hash algorithm to be used to digest the data.
>
>  (2) pss_mask=3D<type>,...
>
>      The mask generation function (MGF) and its parameters.
>
>  (3) pss_salt=3D<len>
>
>      The length of the salt used.
>
> The only MGF currently supported is "mgf1".  This takes an additional
> parameter indicating the mask-generating hash (which need not be the same
> as the data hash).  E.g.:
>
>      "sighash=3Dsha256 pss_mask=3Dmgf1,sha256 pss_salt=3D32"
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Tadeusz Struk <tadeusz.struk@intel.com>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: David S. Miller <davem@davemloft.net>
> cc: Lukas Wunner <lukas@wunner.de>
> cc: Ignat Korchagin <ignat@cloudflare.com>
> cc: keyrings@vger.kernel.org
> cc: linux-crypto@vger.kernel.org
> ---
>  crypto/Makefile               |   1 +
>  crypto/rsa.c                  |   8 +
>  crypto/rsassa-pss.c           | 397 ++++++++++++++++++++++++++++++++++
>  include/crypto/internal/rsa.h |   2 +
>  4 files changed, 408 insertions(+)
>  create mode 100644 crypto/rsassa-pss.c
>
> diff --git a/crypto/Makefile b/crypto/Makefile
> index 267d5403045b..5c91440d1751 100644
> --- a/crypto/Makefile
> +++ b/crypto/Makefile
> @@ -50,6 +50,7 @@ rsa_generic-y +=3D rsa.o
>  rsa_generic-y +=3D rsa_helper.o
>  rsa_generic-y +=3D rsa-pkcs1pad.o
>  rsa_generic-y +=3D rsassa-pkcs1.o
> +rsa_generic-y +=3D rsassa-pss.o
>  obj-$(CONFIG_CRYPTO_RSA) +=3D rsa_generic.o
>
>  $(obj)/ecdsasignature.asn1.o: $(obj)/ecdsasignature.asn1.c $(obj)/ecdsas=
ignature.asn1.h
> diff --git a/crypto/rsa.c b/crypto/rsa.c
> index 6c7734083c98..189a09d54c16 100644
> --- a/crypto/rsa.c
> +++ b/crypto/rsa.c
> @@ -10,6 +10,7 @@
>  #include <linux/mpi.h>
>  #include <crypto/internal/rsa.h>
>  #include <crypto/internal/akcipher.h>
> +#include <crypto/internal/sig.h>
>  #include <crypto/akcipher.h>
>  #include <crypto/algapi.h>
>
> @@ -414,8 +415,14 @@ static int __init rsa_init(void)
>         if (err)
>                 goto err_unregister_rsa_pkcs1pad;
>
> +       err =3D crypto_register_sig(&rsassa_pss_alg);
> +       if (err)
> +               goto err_rsassa_pss;
> +
>         return 0;
>
> +err_rsassa_pss:
> +       crypto_unregister_template(&rsassa_pkcs1_tmpl);
>  err_unregister_rsa_pkcs1pad:
>         crypto_unregister_template(&rsa_pkcs1pad_tmpl);
>  err_unregister_rsa:
> @@ -425,6 +432,7 @@ static int __init rsa_init(void)
>
>  static void __exit rsa_exit(void)
>  {
> +       crypto_unregister_sig(&rsassa_pss_alg);
>         crypto_unregister_template(&rsassa_pkcs1_tmpl);
>         crypto_unregister_template(&rsa_pkcs1pad_tmpl);
>         crypto_unregister_akcipher(&rsa);
> diff --git a/crypto/rsassa-pss.c b/crypto/rsassa-pss.c
> new file mode 100644
> index 000000000000..7f27e8fa6fa7
> --- /dev/null
> +++ b/crypto/rsassa-pss.c
> @@ -0,0 +1,397 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * RSA Signature Scheme combined with EMSA-PSS encoding (RFC 8017 sec 8.=
2)
> + *
> + * https://www.rfc-editor.org/rfc/rfc8017#section-8.1
> + *
> + * Copyright (c) 2025 Red Hat
> + */
> +
> +#define pr_fmt(fmt) "RSAPSS: "fmt
> +#include <linux/ctype.h>
> +#include <linux/module.h>
> +#include <linux/oid_registry.h>
> +#include <linux/parser.h>
> +#include <linux/scatterlist.h>
> +#include <crypto/akcipher.h>
> +#include <crypto/algapi.h>
> +#include <crypto/hash.h>
> +#include <crypto/sig.h>
> +#include <crypto/internal/akcipher.h>
> +#include <crypto/internal/rsa.h>
> +#include <crypto/internal/sig.h>
> +
> +struct rsassa_pss_ctx {
> +       struct crypto_akcipher *rsa;
> +       unsigned int    key_size;
> +       unsigned int    salt_len;
> +       char            *pss_hash;
> +       char            *mgf1_hash;
> +};
> +
> +enum {
> +       rsassa_pss_verify_hash_algo,
> +       rsassa_pss_verify_pss_mask,
> +       rsassa_pss_verify_pss_salt,
> +};
> +
> +static const match_table_t rsassa_pss_verify_params =3D {
> +       { rsassa_pss_verify_hash_algo,  "sighash=3D%s" },
> +       { rsassa_pss_verify_pss_mask,   "pss_mask=3D%s" },
> +       { rsassa_pss_verify_pss_salt,   "pss_salt=3D%u" },
> +       {}
> +};
> +
> +/*
> + * Parse the signature parameters out of the info string.
> + */
> +static int rsassa_pss_vinfo_parse(struct rsassa_pss_ctx *ctx,
> +                                 char *info)
> +{
> +       substring_t args[MAX_OPT_ARGS];
> +       char *p, *q;
> +
> +       ctx->pss_hash =3D NULL;
> +       ctx->mgf1_hash =3D NULL;
> +       ctx->salt_len =3D 0;
> +
> +       for (p =3D info; p && *p;) {
> +               if (isspace(*p)) {
> +                       p++;
> +                       continue;
> +               }
> +               q =3D p++;
> +               while (*p && !isspace(*p))
> +                       p++;
> +
> +               if (!*p)
> +                       p =3D NULL;
> +               else
> +                       *p++ =3D 0;

A lot of pointers and arithmetic here. Wouldn't it be easier to do
something like in [1]?

> +               switch (match_token(q, rsassa_pss_verify_params, args)) {
> +               case rsassa_pss_verify_hash_algo:
> +                       *args[0].to =3D 0;
> +                       ctx->pss_hash =3D args[0].from;
> +                       break;
> +               case rsassa_pss_verify_pss_mask:
> +                       if (memcmp(args[0].from, "mgf1", 4) !=3D 0)
> +                               return -ENOPKG;
> +                       if (args[0].from[4] !=3D ',')
> +                               return -EINVAL;
> +                       args[0].from +=3D 5;
> +                       if (args[0].from >=3D args[0].to)
> +                               return -EINVAL;
> +                       *args[0].to =3D 0;
> +                       ctx->mgf1_hash =3D args[0].from;
> +                       break;
> +               case rsassa_pss_verify_pss_salt:
> +                       if (match_uint(&args[0], &ctx->salt_len) < 0)
> +                               return -EINVAL;
> +                       break;
> +               default:
> +                       pr_debug("Unknown info param\n");
> +                       return -EINVAL; /* Ignoring it might be better. *=
/
> +               }
> +       }
> +
> +       if (!ctx->pss_hash ||
> +           !ctx->mgf1_hash ||
> +           !ctx->salt_len)
> +               return -EINVAL;
> +       return 0;
> +}
> +
> +DEFINE_FREE(crypto_free_shash, struct crypto_shash*,
> +           if (!IS_ERR_OR_NULL(_T)) { crypto_free_shash(_T); });

Is this useful enough to go into some commonly used header for shash?

> +/*
> + * Perform mask =3D MGF1(mgfSeed, masklen) - RFC8017 appendix B.2.1.
> + */
> +static int MGF1(struct rsassa_pss_ctx *ctx,
> +               const u8 *mgfSeed, unsigned int mgfSeed_len,
> +               u8 *mask, unsigned int maskLen)
> +{
> +       struct crypto_shash *hash_tfm __free(crypto_free_shash) =3D NULL;
> +       struct shash_desc *Hash __free(kfree) =3D NULL;

So even though x509/pkcs7 code now has a counterexample (partially due
to my fault) seems the consensus [2] is to declare and initialise the
variable with the __free attribute at the same time meaning it is OK
to declare the variables later and not follow the "declaration at the
top" rule.

> +       unsigned int counter, count_to, hLen, T_len;
> +       __be32 *C;
> +       int err;
> +       u8 *T, *t, *to_hash;
> +
> +       hash_tfm =3D crypto_alloc_shash(ctx->mgf1_hash, 0, 0);
> +       if (IS_ERR(hash_tfm))
> +               return PTR_ERR(hash_tfm);
> +
> +       hLen =3D crypto_shash_digestsize(hash_tfm);
> +       count_to =3D DIV_ROUND_UP(maskLen, hLen);
> +       T_len =3D hLen * count_to;
> +
> +       Hash =3D kmalloc(roundup(sizeof(struct shash_desc) +
> +                              crypto_shash_descsize(hash_tfm), 64) +
> +                      roundup(T_len, 64) + /* T */
> +                      roundup(mgfSeed_len + 4, 64), /* mgfSeed||C */
> +                      GFP_KERNEL);
> +       if (!Hash)
> +               return -ENOMEM;
> +
> +       Hash->tfm =3D hash_tfm;
> +
> +       /* 2: Let T be the empty octet string. */
> +       T =3D (void *)Hash +
> +               roundup(sizeof(struct shash_desc) +
> +                       crypto_shash_descsize(hash_tfm), 64);
> +
> +       /* 3: Generate the mask. */
> +       to_hash =3D T + roundup(T_len, 64);
> +       memcpy(to_hash, mgfSeed, mgfSeed_len);
> +       C =3D (__be32 *)(to_hash + mgfSeed_len);
> +
> +       t =3D T;
> +       for (counter =3D 0; counter < count_to; counter++) {
> +               /* 3A: C =3D I2OSP(counter, 4). */
> +               put_unaligned_be32(counter, C);
> +
> +               /* 3B: T =3D T || Hash(mgfSeed || C). */
> +               err =3D crypto_shash_digest(Hash, to_hash, mgfSeed_len + =
4, t);
> +               if (err < 0)
> +                       return err;
> +
> +               t +=3D hLen;
> +       }
> +
> +       /* 4: Output T to mask */
> +       memcpy(mask, T, maskLen);
> +       return 0;
> +}
> +
> +/*
> + * Perform EMSA-PSS-VERIFY(M, EM, emBits) - RFC8017 sec 9.1.2.
> + */
> +static int emsa_pss_verify(struct rsassa_pss_ctx *ctx,
> +                          const u8 *M, unsigned int M_len,
> +                          const u8 *EM, unsigned int emLen)
> +{
> +       struct crypto_shash *hash_tfm __free(crypto_free_shash);
> +       struct shash_desc *Hash __free(kfree) =3D NULL;

Same here: declare when initialised

> +       unsigned int emBits, hLen, sLen, DB_len;
> +       const u8 *maskedDB, *H;
> +       u8 *mHash, *dbMask, *DB, *salt, *Mprime, *Hprime;
> +       int err, i;
> +
> +       emBits =3D 8 - fls(EM[0]);
> +       emBits =3D emLen * 8 - emBits;
> +
> +       hash_tfm =3D crypto_alloc_shash(ctx->pss_hash, 0, 0);
> +       if (IS_ERR(hash_tfm))
> +               return PTR_ERR(hash_tfm);
> +
> +       hLen =3D crypto_shash_digestsize(hash_tfm);
> +       sLen =3D ctx->salt_len;
> +
> +       if (sLen > 65536 ||
> +           emBits < 8 * (hLen + sLen) + 9)
> +               return -EBADMSG;
> +
> +       DB_len =3D emLen - hLen - 1;
> +
> +       Hash =3D kmalloc(roundup(sizeof(struct shash_desc) +
> +                              crypto_shash_descsize(hash_tfm), 64) +
> +                      roundup(hLen, 64) + /* mHash */
> +                      roundup(DB_len, 64) + /* DB and dbMask */
> +                      roundup(8 + hLen + sLen, 64) + /* M' */
> +                      roundup(hLen, 64), /* H' */
> +                      GFP_KERNEL);
> +       if (!Hash)
> +               return -ENOMEM;
> +
> +       Hash->tfm =3D hash_tfm;
> +
> +       mHash =3D (void *)Hash +
> +               roundup(sizeof(struct shash_desc) +
> +                       crypto_shash_descsize(hash_tfm), 64);
> +       DB =3D dbMask =3D mHash + roundup(hLen, 64);
> +       Mprime =3D dbMask + roundup(DB_len, 64);
> +       Hprime =3D Mprime + roundup(8 + hLen + sLen, 64);
> +
> +       /* 1. Check len M against hash input limitation. */
> +       /* The standard says ~2EiB for SHA1, so I think we can ignore thi=
s. */
> +
> +       /* 2. mHash =3D Hash(M).
> +        * In theory, we would do:
> +        *      err =3D crypto_shash_digest(Hash, M, M_len, mHash);
> +        * but the caller is assumed to already have done that for us.
> +        */
> +       if (M_len !=3D hLen)
> +               return -EINVAL;
> +       memcpy(mHash, M, hLen);
> +
> +       /* 3. Check emLen against hLen + sLen + 2. */
> +       if (emLen < hLen + sLen + 2)
> +               return -EBADMSG;
> +
> +       /* 4. Validate EM. */
> +       if (EM[emLen - 1] !=3D 0xbc)
> +               return -EKEYREJECTED;
> +
> +       /* 5. Pick maskedDB and H. */
> +       maskedDB =3D EM;
> +       H =3D EM + DB_len;
> +
> +       /* 6. Check leftmost 8emLen-emBits bits of maskedDB are 0. */
> +       /* Can only find emBits by counting the zeros on the Left. */
> +
> +       /* 7. Let dbMask =3D MGF(H, emLen - hLen - 1). */
> +       err =3D MGF1(ctx, H, hLen, dbMask, DB_len);
> +       if (err < 0)
> +               return err;
> +
> +       /* 8. Let DB =3D maskedDB XOR dbMask. */
> +       for (i =3D 0; i < DB_len; i++)
> +               DB[i] =3D maskedDB[i] ^ dbMask[i];
> +
> +       /* 9. Set leftmost bits in DB to zero. */
> +       int z =3D 8 * emLen - emBits;
> +       if (z > 0) {
> +               if (z >=3D 8) {
> +                       DB[0] =3D 0;
> +               } else {
> +                       z =3D 8 - z;
> +                       DB[0] &=3D (1 << z) - 1;
> +               }
> +       }
> +
> +       /* 10. Check the left part of DB is {0,0,...,1}. */
> +       for (i =3D 0; i < emLen - hLen - sLen - 2; i++)
> +               if (DB[i] !=3D 0)
> +                       return -EKEYREJECTED;
> +       if (DB[i] !=3D 0x01)
> +               return -EKEYREJECTED;
> +
> +       /* 11. Let salt be the last sLen octets of DB. */
> +       salt =3D DB + DB_len - sLen;
> +
> +       /* 12. Let M' be 00 00 00 00 00 00 00 00 || mHash || salt. */
> +       memset(Mprime, 0, 8);
> +       memcpy(Mprime + 8, mHash, hLen);
> +       memcpy(Mprime + 8 + hLen, salt, sLen);
> +
> +       /* 13. Let H' =3D Hash(M'). */
> +       err =3D crypto_shash_digest(Hash, Mprime, 8 + hLen + sLen, Hprime=
);
> +       if (err < 0)
> +               return err;
> +
> +       /* 14. Check H =3D H'. */
> +       if (memcmp(H, Hprime, hLen) !=3D 0)
> +               return -EKEYREJECTED;
> +       return 0;
> +}
> +
> +/*
> + * Perform RSASSA-PSS-VERIFY((n,e),M,S) - RFC8017 sec 8.1.2.
> + */
> +static int rsassa_pss_verify(struct crypto_sig *tfm,
> +                            const void *src, unsigned int slen,
> +                            const void *digest, unsigned int dlen,
> +                            const char *info)
> +{
> +       struct akcipher_request *rsa_req __free(kfree) =3D NULL;

And here: declare at the time of init.

> +       struct rsassa_pss_ctx *ctx =3D crypto_sig_ctx(tfm);
> +       struct crypto_wait cwait;
> +       struct scatterlist sg;
> +       unsigned int rsa_reqsize =3D crypto_akcipher_reqsize(ctx->rsa);
> +       char *str __free(kfree) =3D NULL;

Declare at the time of init.

> +       u8 *EM;
> +       int err;
> +
> +       if (!info)
> +               return -EINVAL;
> +
> +       str =3D kstrdup(info, GFP_KERNEL);
> +       if (!str)
> +               return -ENOMEM;
> +
> +       err =3D rsassa_pss_vinfo_parse(ctx, str);
> +       if (err < 0)
> +               return err;
> +
> +       /* RFC8017 sec 8.1.2 step 1 - length checking */
> +       if (!ctx->key_size || slen !=3D ctx->key_size)
> +               return -EINVAL;
> +
> +       /* RFC8017 sec 8.1.2 step 2 - RSA verification */
> +       rsa_req =3D kmalloc(sizeof(*rsa_req) + rsa_reqsize + ctx->key_siz=
e,
> +                         GFP_KERNEL);
> +       if (!rsa_req)
> +               return -ENOMEM;
> +
> +       EM =3D (u8 *)(rsa_req + 1) + rsa_reqsize;
> +       memcpy(EM, src, slen);
> +
> +       crypto_init_wait(&cwait);
> +       sg_init_one(&sg, EM, slen);
> +       akcipher_request_set_tfm(rsa_req, ctx->rsa);
> +       akcipher_request_set_crypt(rsa_req, &sg, &sg, slen, slen);
> +       akcipher_request_set_callback(rsa_req, CRYPTO_TFM_REQ_MAY_SLEEP,
> +                                     crypto_req_done, &cwait);
> +
> +       err =3D crypto_akcipher_encrypt(rsa_req);
> +       err =3D crypto_wait_req(err, &cwait);
> +       if (err)
> +               return err;
> +
> +       /* RFC 8017 sec 8.1.2 step 3 - EMSA-PSS(M, EM, modbits-1) */
> +       return emsa_pss_verify(ctx, digest, dlen, EM, slen);
> +}
> +
> +static unsigned int rsassa_pss_key_size(struct crypto_sig *tfm)
> +{
> +       struct rsassa_pss_ctx *ctx =3D crypto_sig_ctx(tfm);
> +
> +       return ctx->key_size * BITS_PER_BYTE;
> +}
> +
> +static int rsassa_pss_set_pub_key(struct crypto_sig *tfm,
> +                                   const void *key, unsigned int keylen)
> +{
> +       struct rsassa_pss_ctx *ctx =3D crypto_sig_ctx(tfm);
> +
> +       return rsa_set_key(ctx->rsa, &ctx->key_size, RSA_PUB, key, keylen=
);
> +}
> +
> +static int rsassa_pss_init_tfm(struct crypto_sig *tfm)
> +{
> +       struct crypto_akcipher *rsa;
> +       struct rsassa_pss_ctx *ctx =3D crypto_sig_ctx(tfm);
> +
> +       rsa =3D crypto_alloc_akcipher("rsa", 0, 0);
> +       if (IS_ERR(rsa))
> +               return PTR_ERR(rsa);
> +
> +       ctx->rsa =3D rsa;
> +       return 0;
> +}
> +
> +static void rsassa_pss_exit_tfm(struct crypto_sig *tfm)
> +{
> +       struct rsassa_pss_ctx *ctx =3D crypto_sig_ctx(tfm);
> +
> +       crypto_free_akcipher(ctx->rsa);
> +}
> +
> +struct sig_alg rsassa_pss_alg =3D {
> +       .verify         =3D rsassa_pss_verify,
> +       .set_pub_key    =3D rsassa_pss_set_pub_key,
> +       .key_size       =3D rsassa_pss_key_size,
> +       .init           =3D rsassa_pss_init_tfm,
> +       .exit           =3D rsassa_pss_exit_tfm,
> +       .base =3D {
> +               .cra_name        =3D "rsassa-pss",
> +               .cra_driver_name =3D "rsassa-pss-generic",
> +               .cra_priority    =3D 100,
> +               .cra_module      =3D THIS_MODULE,
> +               .cra_ctxsize     =3D sizeof(struct rsassa_pss_ctx),
> +       },
> +};
> +
> +MODULE_ALIAS_CRYPTO("rsassa-pss");
> diff --git a/include/crypto/internal/rsa.h b/include/crypto/internal/rsa.=
h
> index 071a1951b992..d7f38a273949 100644
> --- a/include/crypto/internal/rsa.h
> +++ b/include/crypto/internal/rsa.h
> @@ -83,4 +83,6 @@ static inline int rsa_set_key(struct crypto_akcipher *c=
hild,
>
>  extern struct crypto_template rsa_pkcs1pad_tmpl;
>  extern struct crypto_template rsassa_pkcs1_tmpl;
> +extern struct sig_alg rsassa_pss_alg;
> +
>  #endif
>

Ignat

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/security/keys/trusted-keys/trusted_tpm1.c?id=3D720a485d12c590750f40f4ffbe=
41e36725f43f3d#n718
[2]: https://lore.kernel.org/lkml/58fd478f408a34b578ee8d949c5c4b4da4d4f41d.=
camel@HansenPartnership.com/T/

