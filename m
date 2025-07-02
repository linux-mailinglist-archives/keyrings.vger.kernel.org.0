Return-Path: <keyrings+bounces-2885-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDC4AF5C9F
	for <lists+keyrings@lfdr.de>; Wed,  2 Jul 2025 17:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D8C74A493F
	for <lists+keyrings@lfdr.de>; Wed,  2 Jul 2025 15:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B20E2D46D0;
	Wed,  2 Jul 2025 15:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="KOp3c9XS"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0839E2D46C3
	for <keyrings@vger.kernel.org>; Wed,  2 Jul 2025 15:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469547; cv=none; b=N2smm01QxSpQs2qNCA5RJpbWv95IHDdgCwEJvg+XdSLvizGN1nVF69jUP1x/36QQb92WwP1QhrWSSH1mD45PW0XDpZQJbP4YC7G+y6UP2Asrjual6RJRCJaS0GDHCgBVoqjZe5gDxlqo++cb/7NJ34Ke+VWZCOVCcmfmkHNyj4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469547; c=relaxed/simple;
	bh=13+zE3uKWcvUdSv/7midhh2nniFfJjVu+wMzuf/5gnw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A07Ic/JsQGFF9v0A/qykEhS+ADXgGtEnjKJuV5WZXvmDaKM9K1UA3b6NttXWy6xS7yaLy5fAtxfzIgTNcZ+4NdZyfN9avt4JWt/YEexhIeiL3VHQuUmAqHf1VdspdhUfEswDNiR+Prwftg6kSRNlBQCuTVraSCUkGNcoMtnJWE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=KOp3c9XS; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553dceb345eso5515117e87.1
        for <keyrings@vger.kernel.org>; Wed, 02 Jul 2025 08:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1751469541; x=1752074341; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BV8n+D4VGUgwbjgUPQvH9ZBfWn4L9sMLPwN7nX9DO8=;
        b=KOp3c9XS3oj3F/vRVro1oP4BgfmD9i4zjVsS0iTERNYfbmp64vMxb55nbRy4BKL+xh
         UprwwPCm43I0LtxsSOjCIWA8WB+X1ep4nYykvYps8eLrtZWrgyPPPdRydpYql63zY3DF
         PNs99rcMKUnN15OFlYk89/E2X0/tCH98rjtnY6GxixodTyxU9OcV6V/8OTyHR1/+Smd5
         qcamqmwQrtqxFbkMmNlFfE27Rpj3amEd/i2AqTkBd5h23f8YwdTK3IgpD3PJ50CsEqqC
         beL8GB1ImNJCuHrqWkiTcRcwX1SoFmK/lTDoAoK/F40YIw1VYkuK1cKCNrR/ad9UgVaE
         E/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751469541; x=1752074341;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BV8n+D4VGUgwbjgUPQvH9ZBfWn4L9sMLPwN7nX9DO8=;
        b=Hdx6g0DAWaIfX085f4Rqp/MWQksklO8sQ/VvmzcFn7xWZjuEU1BJStrubAWqNjK6zo
         psllPqRsjU/NdB2a/Sqc1Ri7vzWCmIBj9o2t7YwAEiPF8miODMTZ2gruGU8Ma63C8xJM
         BnSV0qJixWN9PMuCX/JW1MkTHjiYF1GcM68y8/hvob6hYHQnHJ5UV6TzjHqDX4QwAv6o
         J2MSYJebEuPoCdOc62ooaEPz15yYdFPE8Sa2qnedJd6ue0Z66KJq1UWMHRbIA7enPGb/
         /y1hDWlGwzaSrIQZRfFSxVMd1xb6EQ98v0i+ewOQsVKzqPd+jvFXsdeT45k6Uc5GgxO+
         v3ig==
X-Forwarded-Encrypted: i=1; AJvYcCVGmdtoXzVMs2cuHhXs/nT5u2jjdmqtpF3M3BMbRgjmmhJpd2Oe87JxZsV5Fi74i1Yo3B3XAVjyWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YydXX4TgX7LNg7Lpim7OsMwc8YtEFwxbmT3ouOqjE++9rkO2E0g
	QjlvF9xQnIL32TfmCpZ9g1Jf1oD4w74ppOpf7nvEbzWlxDCN+fUIIPNarOKLXW+B+/OK9Xf1jni
	FpAd6QkrseuzA6WiAdWELCAjkdeb0cO+QYkOakEYcgw==
X-Gm-Gg: ASbGnctGhKYExgxchvWHhvnkRTwjixfJveIb8ZJjOjXVJWs6KnyVfpGy73YxATrtwsJ
	J9Cxzs/2s1oOHy1EDbokzG6BCcWm31+9Uir25M++5cXcdlG0K8WJnG8o3B1vvJH4s34bFoh2ypG
	hvxbl7Gr+hkk6LHTdOZ3zVr3G2OA5SborLueqXLWuh+m1m/GAz2zy0u6WazjNO0g==
X-Google-Smtp-Source: AGHT+IFxHEOdSGlJLIK38kiaq5SwHkvm+3ND0I1z4IibuqsZ0Y+JUoqsZgmcSI6nvlbIE/RU4+x2mjOUcpnpIzP80C8=
X-Received: by 2002:a05:6512:32d4:b0:554:f72c:819d with SMTP id
 2adb3069b0e04-556283b7916mr1392886e87.43.1751469540638; Wed, 02 Jul 2025
 08:19:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630133934.766646-1-gubowen5@huawei.com> <20250630133934.766646-3-gubowen5@huawei.com>
In-Reply-To: <20250630133934.766646-3-gubowen5@huawei.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 2 Jul 2025 17:18:49 +0200
X-Gm-Features: Ac12FXyYRnEL-1Uj3OUuloWaRY2cvuRpfvQGIbFYbS8m841ci4F7qYjFM0dIrTA
Message-ID: <CALrw=nH7OcaH5xscCDuANkEsfytmCLVgLEhF8zzRnpaFAqjGsg@mail.gmail.com>
Subject: Re: [PATCH RFC 2/4] Revert "Revert "lib/mpi: Introduce ec
 implementation to MPI library""
To: Gu Bowen <gubowen5@huawei.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, David Howells <dhowells@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Lukas Wunner <lukas@wunner.de>, 
	"David S . Miller" <davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Eric Biggers <ebiggers@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Lu Jialin <lujialin4@huawei.com>, 
	GONG Ruiqi <gongruiqi1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 3:27=E2=80=AFPM Gu Bowen <gubowen5@huawei.com> wrot=
e:
>
> This reverts commit da4fe6815aca25603944a64b0965310512e867d0.
>
> Reintroduce ec implementation to MPI library to support sm2.

Sorry for my potential ignorance on the question, but can it be
implemented by extending existing ECC primitives (the ones used for
ECDSA)? Feels a bit weird having different ECC primitives for
different algorithms (well curve25519 being an exception...)

> Signed-off-by: Gu Bowen <gubowen5@huawei.com>
> ---
>  include/linux/mpi.h     |  105 +++
>  lib/crypto/mpi/Makefile |    1 +
>  lib/crypto/mpi/ec.c     | 1507 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1613 insertions(+)
>  create mode 100644 lib/crypto/mpi/ec.c
>
> diff --git a/include/linux/mpi.h b/include/linux/mpi.h
> index 9ad7e7231ee9..3317effe57ba 100644
> --- a/include/linux/mpi.h
> +++ b/include/linux/mpi.h
> @@ -157,6 +157,111 @@ void mpi_fdiv_q(MPI quot, MPI dividend, MPI divisor=
);
>  /*-- mpi-inv.c --*/
>  int mpi_invm(MPI x, MPI a, MPI n);
>
> +/*-- ec.c --*/
> +
> +/* Object to represent a point in projective coordinates */
> +struct gcry_mpi_point {
> +       MPI x;
> +       MPI y;
> +       MPI z;
> +};
> +
> +typedef struct gcry_mpi_point *MPI_POINT;
> +
> +/* Models describing an elliptic curve */
> +enum gcry_mpi_ec_models {
> +       /* The Short Weierstrass equation is
> +        *      y^2 =3D x^3 + ax + b
> +        */
> +       MPI_EC_WEIERSTRASS =3D 0,
> +       /* The Montgomery equation is
> +        *      by^2 =3D x^3 + ax^2 + x
> +        */
> +       MPI_EC_MONTGOMERY,
> +       /* The Twisted Edwards equation is
> +        *      ax^2 + y^2 =3D 1 + bx^2y^2
> +        * Note that we use 'b' instead of the commonly used 'd'.
> +        */
> +       MPI_EC_EDWARDS
> +};
> +
> +/* Dialects used with elliptic curves */
> +enum ecc_dialects {
> +       ECC_DIALECT_STANDARD =3D 0,
> +       ECC_DIALECT_ED25519,
> +       ECC_DIALECT_SAFECURVE
> +};
> +
> +/* This context is used with all our EC functions. */
> +struct mpi_ec_ctx {
> +       enum gcry_mpi_ec_models model; /* The model describing this curve=
. */
> +       enum ecc_dialects dialect;     /* The ECC dialect used with the c=
urve. */
> +       int flags;                     /* Public key flags (not always us=
ed). */
> +       unsigned int nbits;            /* Number of bits.  */
> +
> +       /* Domain parameters.  Note that they may not all be set and if s=
et
> +        * the MPIs may be flagged as constant.
> +        */
> +       MPI p;         /* Prime specifying the field GF(p).  */
> +       MPI a;         /* First coefficient of the Weierstrass equation. =
 */
> +       MPI b;         /* Second coefficient of the Weierstrass equation.=
  */
> +       MPI_POINT G;   /* Base point (generator).  */
> +       MPI n;         /* Order of G.  */
> +       unsigned int h;       /* Cofactor.  */
> +
> +       /* The actual key.  May not be set.  */
> +       MPI_POINT Q;   /* Public key.   */
> +       MPI d;         /* Private key.  */
> +
> +       const char *name;      /* Name of the curve.  */
> +
> +       /* This structure is private to mpi/ec.c! */
> +       struct {
> +               struct {
> +                       unsigned int a_is_pminus3:1;
> +                       unsigned int two_inv_p:1;
> +               } valid; /* Flags to help setting the helper vars below. =
 */
> +
> +               int a_is_pminus3;  /* True if A =3D P - 3. */
> +
> +               MPI two_inv_p;
> +
> +               mpi_barrett_t p_barrett;
> +
> +               /* Scratch variables.  */
> +               MPI scratch[11];
> +
> +               /* Helper for fast reduction.  */
> +               /*   int nist_nbits; /\* If this is a NIST curve, the # o=
f bits. *\/ */
> +               /*   MPI s[10]; */
> +               /*   MPI c; */
> +       } t;
> +
> +       /* Curve specific computation routines for the field.  */
> +       void (*addm)(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ctx);
> +       void (*subm)(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ec);
> +       void (*mulm)(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ctx);
> +       void (*pow2)(MPI w, const MPI b, struct mpi_ec_ctx *ctx);
> +       void (*mul2)(MPI w, MPI u, struct mpi_ec_ctx *ctx);
> +};
> +
> +void mpi_ec_init(struct mpi_ec_ctx *ctx, enum gcry_mpi_ec_models model,
> +                       enum ecc_dialects dialect,
> +                       int flags, MPI p, MPI a, MPI b);
> +void mpi_ec_deinit(struct mpi_ec_ctx *ctx);
> +MPI_POINT mpi_point_new(unsigned int nbits);
> +void mpi_point_release(MPI_POINT p);
> +void mpi_point_init(MPI_POINT p);
> +void mpi_point_free_parts(MPI_POINT p);
> +int mpi_ec_get_affine(MPI x, MPI y, MPI_POINT point, struct mpi_ec_ctx *=
ctx);
> +void mpi_ec_add_points(MPI_POINT result,
> +                       MPI_POINT p1, MPI_POINT p2,
> +                       struct mpi_ec_ctx *ctx);
> +void mpi_ec_mul_point(MPI_POINT result,
> +                       MPI scalar, MPI_POINT point,
> +                       struct mpi_ec_ctx *ctx);
> +int mpi_ec_curve_point(MPI_POINT point, struct mpi_ec_ctx *ctx);
> +
>  /* inline functions */
>
>  /**
> diff --git a/lib/crypto/mpi/Makefile b/lib/crypto/mpi/Makefile
> index 477debd7ed50..6e6ef9a34fe1 100644
> --- a/lib/crypto/mpi/Makefile
> +++ b/lib/crypto/mpi/Makefile
> @@ -13,6 +13,7 @@ mpi-y =3D \
>         generic_mpih-rshift.o           \
>         generic_mpih-sub1.o             \
>         generic_mpih-add1.o             \
> +       ec.o                            \
>         mpicoder.o                      \
>         mpi-add.o                       \
>         mpi-bit.o                       \
> diff --git a/lib/crypto/mpi/ec.c b/lib/crypto/mpi/ec.c
> new file mode 100644
> index 000000000000..4781f00982ef
> --- /dev/null
> +++ b/lib/crypto/mpi/ec.c
> @@ -0,0 +1,1507 @@
> +/* ec.c -  Elliptic Curve functions
> + * Copyright (C) 2007 Free Software Foundation, Inc.
> + * Copyright (C) 2013 g10 Code GmbH
> + *
> + * This file is part of Libgcrypt.
> + *
> + * Libgcrypt is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU Lesser General Public License as
> + * published by the Free Software Foundation; either version 2.1 of
> + * the License, or (at your option) any later version.
> + *
> + * Libgcrypt is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this program; if not, see <http://www.gnu.org/lice=
nses/>.
> + */
> +
> +#include "mpi-internal.h"
> +#include "longlong.h"
> +
> +#define point_init(a)  mpi_point_init((a))
> +#define point_free(a)  mpi_point_free_parts((a))
> +
> +#define log_error(fmt, ...) pr_err(fmt, ##__VA_ARGS__)
> +#define log_fatal(fmt, ...) pr_err(fmt, ##__VA_ARGS__)
> +
> +#define DIM(v) (sizeof(v)/sizeof((v)[0]))
> +
> +
> +/* Create a new point option.  NBITS gives the size in bits of one
> + * coordinate; it is only used to pre-allocate some resources and
> + * might also be passed as 0 to use a default value.
> + */
> +MPI_POINT mpi_point_new(unsigned int nbits)
> +{
> +       MPI_POINT p;
> +
> +       (void)nbits;  /* Currently not used.  */
> +
> +       p =3D kmalloc(sizeof(*p), GFP_KERNEL);
> +       if (p)
> +               mpi_point_init(p);
> +       return p;
> +}
> +EXPORT_SYMBOL_GPL(mpi_point_new);
> +
> +/* Release the point object P.  P may be NULL. */
> +void mpi_point_release(MPI_POINT p)
> +{
> +       if (p) {
> +               mpi_point_free_parts(p);
> +               kfree(p);
> +       }
> +}
> +EXPORT_SYMBOL_GPL(mpi_point_release);
> +
> +/* Initialize the fields of a point object.  gcry_mpi_point_free_parts
> + * may be used to release the fields.
> + */
> +void mpi_point_init(MPI_POINT p)
> +{
> +       p->x =3D mpi_new(0);
> +       p->y =3D mpi_new(0);
> +       p->z =3D mpi_new(0);
> +}
> +EXPORT_SYMBOL_GPL(mpi_point_init);
> +
> +/* Release the parts of a point object. */
> +void mpi_point_free_parts(MPI_POINT p)
> +{
> +       mpi_free(p->x); p->x =3D NULL;
> +       mpi_free(p->y); p->y =3D NULL;
> +       mpi_free(p->z); p->z =3D NULL;
> +}
> +EXPORT_SYMBOL_GPL(mpi_point_free_parts);
> +
> +/* Set the value from S into D.  */
> +static void point_set(MPI_POINT d, MPI_POINT s)
> +{
> +       mpi_set(d->x, s->x);
> +       mpi_set(d->y, s->y);
> +       mpi_set(d->z, s->z);
> +}
> +
> +static void point_resize(MPI_POINT p, struct mpi_ec_ctx *ctx)
> +{
> +       size_t nlimbs =3D ctx->p->nlimbs;
> +
> +       mpi_resize(p->x, nlimbs);
> +       p->x->nlimbs =3D nlimbs;
> +       mpi_resize(p->z, nlimbs);
> +       p->z->nlimbs =3D nlimbs;
> +
> +       if (ctx->model !=3D MPI_EC_MONTGOMERY) {
> +               mpi_resize(p->y, nlimbs);
> +               p->y->nlimbs =3D nlimbs;
> +       }
> +}
> +
> +static void point_swap_cond(MPI_POINT d, MPI_POINT s, unsigned long swap=
,
> +               struct mpi_ec_ctx *ctx)
> +{
> +       mpi_swap_cond(d->x, s->x, swap);
> +       if (ctx->model !=3D MPI_EC_MONTGOMERY)
> +               mpi_swap_cond(d->y, s->y, swap);
> +       mpi_swap_cond(d->z, s->z, swap);
> +}
> +
> +
> +/* W =3D W mod P.  */
> +static void ec_mod(MPI w, struct mpi_ec_ctx *ec)
> +{
> +       if (ec->t.p_barrett)
> +               mpi_mod_barrett(w, w, ec->t.p_barrett);
> +       else
> +               mpi_mod(w, w, ec->p);
> +}
> +
> +static void ec_addm(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ctx)
> +{
> +       mpi_add(w, u, v);
> +       ec_mod(w, ctx);
> +}
> +
> +static void ec_subm(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ec)
> +{
> +       mpi_sub(w, u, v);
> +       while (w->sign)
> +               mpi_add(w, w, ec->p);
> +       /*ec_mod(w, ec);*/
> +}
> +
> +static void ec_mulm(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ctx)
> +{
> +       mpi_mul(w, u, v);
> +       ec_mod(w, ctx);
> +}
> +
> +/* W =3D 2 * U mod P.  */
> +static void ec_mul2(MPI w, MPI u, struct mpi_ec_ctx *ctx)
> +{
> +       mpi_lshift(w, u, 1);
> +       ec_mod(w, ctx);
> +}
> +
> +static void ec_powm(MPI w, const MPI b, const MPI e,
> +               struct mpi_ec_ctx *ctx)
> +{
> +       mpi_powm(w, b, e, ctx->p);
> +       /* mpi_abs(w); */
> +}
> +
> +/* Shortcut for
> + * ec_powm(B, B, mpi_const(MPI_C_TWO), ctx);
> + * for easier optimization.
> + */
> +static void ec_pow2(MPI w, const MPI b, struct mpi_ec_ctx *ctx)
> +{
> +       /* Using mpi_mul is slightly faster (at least on amd64).  */
> +       /* mpi_powm(w, b, mpi_const(MPI_C_TWO), ctx->p); */
> +       ec_mulm(w, b, b, ctx);
> +}
> +
> +/* Shortcut for
> + * ec_powm(B, B, mpi_const(MPI_C_THREE), ctx);
> + * for easier optimization.
> + */
> +static void ec_pow3(MPI w, const MPI b, struct mpi_ec_ctx *ctx)
> +{
> +       mpi_powm(w, b, mpi_const(MPI_C_THREE), ctx->p);
> +}
> +
> +static void ec_invm(MPI x, MPI a, struct mpi_ec_ctx *ctx)
> +{
> +       if (!mpi_invm(x, a, ctx->p))
> +               log_error("ec_invm: inverse does not exist:\n");
> +}
> +
> +static void mpih_set_cond(mpi_ptr_t wp, mpi_ptr_t up,
> +               mpi_size_t usize, unsigned long set)
> +{
> +       mpi_size_t i;
> +       mpi_limb_t mask =3D ((mpi_limb_t)0) - set;
> +       mpi_limb_t x;
> +
> +       for (i =3D 0; i < usize; i++) {
> +               x =3D mask & (wp[i] ^ up[i]);
> +               wp[i] =3D wp[i] ^ x;
> +       }
> +}
> +
> +/* Routines for 2^255 - 19.  */
> +
> +#define LIMB_SIZE_25519 ((256+BITS_PER_MPI_LIMB-1)/BITS_PER_MPI_LIMB)
> +
> +static void ec_addm_25519(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ctx)
> +{
> +       mpi_ptr_t wp, up, vp;
> +       mpi_size_t wsize =3D LIMB_SIZE_25519;
> +       mpi_limb_t n[LIMB_SIZE_25519];
> +       mpi_limb_t borrow;
> +
> +       if (w->nlimbs !=3D wsize || u->nlimbs !=3D wsize || v->nlimbs !=
=3D wsize)
> +               log_bug("addm_25519: different sizes\n");
> +
> +       memset(n, 0, sizeof(n));
> +       up =3D u->d;
> +       vp =3D v->d;
> +       wp =3D w->d;
> +
> +       mpihelp_add_n(wp, up, vp, wsize);
> +       borrow =3D mpihelp_sub_n(wp, wp, ctx->p->d, wsize);
> +       mpih_set_cond(n, ctx->p->d, wsize, (borrow !=3D 0UL));
> +       mpihelp_add_n(wp, wp, n, wsize);
> +       wp[LIMB_SIZE_25519-1] &=3D ~((mpi_limb_t)1 << (255 % BITS_PER_MPI=
_LIMB));
> +}
> +
> +static void ec_subm_25519(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ctx)
> +{
> +       mpi_ptr_t wp, up, vp;
> +       mpi_size_t wsize =3D LIMB_SIZE_25519;
> +       mpi_limb_t n[LIMB_SIZE_25519];
> +       mpi_limb_t borrow;
> +
> +       if (w->nlimbs !=3D wsize || u->nlimbs !=3D wsize || v->nlimbs !=
=3D wsize)
> +               log_bug("subm_25519: different sizes\n");
> +
> +       memset(n, 0, sizeof(n));
> +       up =3D u->d;
> +       vp =3D v->d;
> +       wp =3D w->d;
> +
> +       borrow =3D mpihelp_sub_n(wp, up, vp, wsize);
> +       mpih_set_cond(n, ctx->p->d, wsize, (borrow !=3D 0UL));
> +       mpihelp_add_n(wp, wp, n, wsize);
> +       wp[LIMB_SIZE_25519-1] &=3D ~((mpi_limb_t)1 << (255 % BITS_PER_MPI=
_LIMB));
> +}
> +
> +static void ec_mulm_25519(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ctx)
> +{
> +       mpi_ptr_t wp, up, vp;
> +       mpi_size_t wsize =3D LIMB_SIZE_25519;
> +       mpi_limb_t n[LIMB_SIZE_25519*2];
> +       mpi_limb_t m[LIMB_SIZE_25519+1];
> +       mpi_limb_t cy;
> +       int msb;
> +
> +       (void)ctx;
> +       if (w->nlimbs !=3D wsize || u->nlimbs !=3D wsize || v->nlimbs !=
=3D wsize)
> +               log_bug("mulm_25519: different sizes\n");
> +
> +       up =3D u->d;
> +       vp =3D v->d;
> +       wp =3D w->d;
> +
> +       mpihelp_mul_n(n, up, vp, wsize);
> +       memcpy(wp, n, wsize * BYTES_PER_MPI_LIMB);
> +       wp[LIMB_SIZE_25519-1] &=3D ~((mpi_limb_t)1 << (255 % BITS_PER_MPI=
_LIMB));
> +
> +       memcpy(m, n+LIMB_SIZE_25519-1, (wsize+1) * BYTES_PER_MPI_LIMB);
> +       mpihelp_rshift(m, m, LIMB_SIZE_25519+1, (255 % BITS_PER_MPI_LIMB)=
);
> +
> +       memcpy(n, m, wsize * BYTES_PER_MPI_LIMB);
> +       cy =3D mpihelp_lshift(m, m, LIMB_SIZE_25519, 4);
> +       m[LIMB_SIZE_25519] =3D cy;
> +       cy =3D mpihelp_add_n(m, m, n, wsize);
> +       m[LIMB_SIZE_25519] +=3D cy;
> +       cy =3D mpihelp_add_n(m, m, n, wsize);
> +       m[LIMB_SIZE_25519] +=3D cy;
> +       cy =3D mpihelp_add_n(m, m, n, wsize);
> +       m[LIMB_SIZE_25519] +=3D cy;
> +
> +       cy =3D mpihelp_add_n(wp, wp, m, wsize);
> +       m[LIMB_SIZE_25519] +=3D cy;
> +
> +       memset(m, 0, wsize * BYTES_PER_MPI_LIMB);
> +       msb =3D (wp[LIMB_SIZE_25519-1] >> (255 % BITS_PER_MPI_LIMB));
> +       m[0] =3D (m[LIMB_SIZE_25519] * 2 + msb) * 19;
> +       wp[LIMB_SIZE_25519-1] &=3D ~((mpi_limb_t)1 << (255 % BITS_PER_MPI=
_LIMB));
> +       mpihelp_add_n(wp, wp, m, wsize);
> +
> +       m[0] =3D 0;
> +       cy =3D mpihelp_sub_n(wp, wp, ctx->p->d, wsize);
> +       mpih_set_cond(m, ctx->p->d, wsize, (cy !=3D 0UL));
> +       mpihelp_add_n(wp, wp, m, wsize);
> +}
> +
> +static void ec_mul2_25519(MPI w, MPI u, struct mpi_ec_ctx *ctx)
> +{
> +       ec_addm_25519(w, u, u, ctx);
> +}
> +
> +static void ec_pow2_25519(MPI w, const MPI b, struct mpi_ec_ctx *ctx)
> +{
> +       ec_mulm_25519(w, b, b, ctx);
> +}
> +
> +/* Routines for 2^448 - 2^224 - 1.  */
> +
> +#define LIMB_SIZE_448 ((448+BITS_PER_MPI_LIMB-1)/BITS_PER_MPI_LIMB)
> +#define LIMB_SIZE_HALF_448 ((LIMB_SIZE_448+1)/2)
> +
> +static void ec_addm_448(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ctx)
> +{
> +       mpi_ptr_t wp, up, vp;
> +       mpi_size_t wsize =3D LIMB_SIZE_448;
> +       mpi_limb_t n[LIMB_SIZE_448];
> +       mpi_limb_t cy;
> +
> +       if (w->nlimbs !=3D wsize || u->nlimbs !=3D wsize || v->nlimbs !=
=3D wsize)
> +               log_bug("addm_448: different sizes\n");
> +
> +       memset(n, 0, sizeof(n));
> +       up =3D u->d;
> +       vp =3D v->d;
> +       wp =3D w->d;
> +
> +       cy =3D mpihelp_add_n(wp, up, vp, wsize);
> +       mpih_set_cond(n, ctx->p->d, wsize, (cy !=3D 0UL));
> +       mpihelp_sub_n(wp, wp, n, wsize);
> +}
> +
> +static void ec_subm_448(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ctx)
> +{
> +       mpi_ptr_t wp, up, vp;
> +       mpi_size_t wsize =3D LIMB_SIZE_448;
> +       mpi_limb_t n[LIMB_SIZE_448];
> +       mpi_limb_t borrow;
> +
> +       if (w->nlimbs !=3D wsize || u->nlimbs !=3D wsize || v->nlimbs !=
=3D wsize)
> +               log_bug("subm_448: different sizes\n");
> +
> +       memset(n, 0, sizeof(n));
> +       up =3D u->d;
> +       vp =3D v->d;
> +       wp =3D w->d;
> +
> +       borrow =3D mpihelp_sub_n(wp, up, vp, wsize);
> +       mpih_set_cond(n, ctx->p->d, wsize, (borrow !=3D 0UL));
> +       mpihelp_add_n(wp, wp, n, wsize);
> +}
> +
> +static void ec_mulm_448(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ctx)
> +{
> +       mpi_ptr_t wp, up, vp;
> +       mpi_size_t wsize =3D LIMB_SIZE_448;
> +       mpi_limb_t n[LIMB_SIZE_448*2];
> +       mpi_limb_t a2[LIMB_SIZE_HALF_448];
> +       mpi_limb_t a3[LIMB_SIZE_HALF_448];
> +       mpi_limb_t b0[LIMB_SIZE_HALF_448];
> +       mpi_limb_t b1[LIMB_SIZE_HALF_448];
> +       mpi_limb_t cy;
> +       int i;
> +#if (LIMB_SIZE_HALF_448 > LIMB_SIZE_448/2)
> +       mpi_limb_t b1_rest, a3_rest;
> +#endif
> +
> +       if (w->nlimbs !=3D wsize || u->nlimbs !=3D wsize || v->nlimbs !=
=3D wsize)
> +               log_bug("mulm_448: different sizes\n");
> +
> +       up =3D u->d;
> +       vp =3D v->d;
> +       wp =3D w->d;
> +
> +       mpihelp_mul_n(n, up, vp, wsize);
> +
> +       for (i =3D 0; i < (wsize + 1) / 2; i++) {
> +               b0[i] =3D n[i];
> +               b1[i] =3D n[i+wsize/2];
> +               a2[i] =3D n[i+wsize];
> +               a3[i] =3D n[i+wsize+wsize/2];
> +       }
> +
> +#if (LIMB_SIZE_HALF_448 > LIMB_SIZE_448/2)
> +       b0[LIMB_SIZE_HALF_448-1] &=3D ((mpi_limb_t)1UL << 32)-1;
> +       a2[LIMB_SIZE_HALF_448-1] &=3D ((mpi_limb_t)1UL << 32)-1;
> +
> +       b1_rest =3D 0;
> +       a3_rest =3D 0;
> +
> +       for (i =3D (wsize + 1) / 2 - 1; i >=3D 0; i--) {
> +               mpi_limb_t b1v, a3v;
> +               b1v =3D b1[i];
> +               a3v =3D a3[i];
> +               b1[i] =3D (b1_rest << 32) | (b1v >> 32);
> +               a3[i] =3D (a3_rest << 32) | (a3v >> 32);
> +               b1_rest =3D b1v & (((mpi_limb_t)1UL << 32)-1);
> +               a3_rest =3D a3v & (((mpi_limb_t)1UL << 32)-1);
> +       }
> +#endif
> +
> +       cy =3D mpihelp_add_n(b0, b0, a2, LIMB_SIZE_HALF_448);
> +       cy +=3D mpihelp_add_n(b0, b0, a3, LIMB_SIZE_HALF_448);
> +       for (i =3D 0; i < (wsize + 1) / 2; i++)
> +               wp[i] =3D b0[i];
> +#if (LIMB_SIZE_HALF_448 > LIMB_SIZE_448/2)
> +       wp[LIMB_SIZE_HALF_448-1] &=3D (((mpi_limb_t)1UL << 32)-1);
> +#endif
> +
> +#if (LIMB_SIZE_HALF_448 > LIMB_SIZE_448/2)
> +       cy =3D b0[LIMB_SIZE_HALF_448-1] >> 32;
> +#endif
> +
> +       cy =3D mpihelp_add_1(b1, b1, LIMB_SIZE_HALF_448, cy);
> +       cy +=3D mpihelp_add_n(b1, b1, a2, LIMB_SIZE_HALF_448);
> +       cy +=3D mpihelp_add_n(b1, b1, a3, LIMB_SIZE_HALF_448);
> +       cy +=3D mpihelp_add_n(b1, b1, a3, LIMB_SIZE_HALF_448);
> +#if (LIMB_SIZE_HALF_448 > LIMB_SIZE_448/2)
> +       b1_rest =3D 0;
> +       for (i =3D (wsize + 1) / 2 - 1; i >=3D 0; i--) {
> +               mpi_limb_t b1v =3D b1[i];
> +               b1[i] =3D (b1_rest << 32) | (b1v >> 32);
> +               b1_rest =3D b1v & (((mpi_limb_t)1UL << 32)-1);
> +       }
> +       wp[LIMB_SIZE_HALF_448-1] |=3D (b1_rest << 32);
> +#endif
> +       for (i =3D 0; i < wsize / 2; i++)
> +               wp[i+(wsize + 1) / 2] =3D b1[i];
> +
> +#if (LIMB_SIZE_HALF_448 > LIMB_SIZE_448/2)
> +       cy =3D b1[LIMB_SIZE_HALF_448-1];
> +#endif
> +
> +       memset(n, 0, wsize * BYTES_PER_MPI_LIMB);
> +
> +#if (LIMB_SIZE_HALF_448 > LIMB_SIZE_448/2)
> +       n[LIMB_SIZE_HALF_448-1] =3D cy << 32;
> +#else
> +       n[LIMB_SIZE_HALF_448] =3D cy;
> +#endif
> +       n[0] =3D cy;
> +       mpihelp_add_n(wp, wp, n, wsize);
> +
> +       memset(n, 0, wsize * BYTES_PER_MPI_LIMB);
> +       cy =3D mpihelp_sub_n(wp, wp, ctx->p->d, wsize);
> +       mpih_set_cond(n, ctx->p->d, wsize, (cy !=3D 0UL));
> +       mpihelp_add_n(wp, wp, n, wsize);
> +}
> +
> +static void ec_mul2_448(MPI w, MPI u, struct mpi_ec_ctx *ctx)
> +{
> +       ec_addm_448(w, u, u, ctx);
> +}
> +
> +static void ec_pow2_448(MPI w, const MPI b, struct mpi_ec_ctx *ctx)
> +{
> +       ec_mulm_448(w, b, b, ctx);
> +}
> +
> +struct field_table {
> +       const char *p;
> +
> +       /* computation routines for the field.  */
> +       void (*addm)(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ctx);
> +       void (*subm)(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ctx);
> +       void (*mulm)(MPI w, MPI u, MPI v, struct mpi_ec_ctx *ctx);
> +       void (*mul2)(MPI w, MPI u, struct mpi_ec_ctx *ctx);
> +       void (*pow2)(MPI w, const MPI b, struct mpi_ec_ctx *ctx);
> +};
> +
> +static const struct field_table field_table[] =3D {
> +       {
> +               "0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF=
FFFFFFFFED",
> +               ec_addm_25519,
> +               ec_subm_25519,
> +               ec_mulm_25519,
> +               ec_mul2_25519,
> +               ec_pow2_25519
> +       },
> +       {
> +               "0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF=
FE"
> +               "FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF=
",
> +               ec_addm_448,
> +               ec_subm_448,
> +               ec_mulm_448,
> +               ec_mul2_448,
> +               ec_pow2_448
> +       },
> +       { NULL, NULL, NULL, NULL, NULL, NULL },
> +};
> +
> +/* Force recomputation of all helper variables.  */
> +static void mpi_ec_get_reset(struct mpi_ec_ctx *ec)
> +{
> +       ec->t.valid.a_is_pminus3 =3D 0;
> +       ec->t.valid.two_inv_p =3D 0;
> +}
> +
> +/* Accessor for helper variable.  */
> +static int ec_get_a_is_pminus3(struct mpi_ec_ctx *ec)
> +{
> +       MPI tmp;
> +
> +       if (!ec->t.valid.a_is_pminus3) {
> +               ec->t.valid.a_is_pminus3 =3D 1;
> +               tmp =3D mpi_alloc_like(ec->p);
> +               mpi_sub_ui(tmp, ec->p, 3);
> +               ec->t.a_is_pminus3 =3D !mpi_cmp(ec->a, tmp);
> +               mpi_free(tmp);
> +       }
> +
> +       return ec->t.a_is_pminus3;
> +}
> +
> +/* Accessor for helper variable.  */
> +static MPI ec_get_two_inv_p(struct mpi_ec_ctx *ec)
> +{
> +       if (!ec->t.valid.two_inv_p) {
> +               ec->t.valid.two_inv_p =3D 1;
> +               if (!ec->t.two_inv_p)
> +                       ec->t.two_inv_p =3D mpi_alloc(0);
> +               ec_invm(ec->t.two_inv_p, mpi_const(MPI_C_TWO), ec);
> +       }
> +       return ec->t.two_inv_p;
> +}
> +
> +static const char *const curve25519_bad_points[] =3D {
> +       "0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff=
ed",
> +       "0x00000000000000000000000000000000000000000000000000000000000000=
00",
> +       "0x00000000000000000000000000000000000000000000000000000000000000=
01",
> +       "0x00b8495f16056286fdb1329ceb8d09da6ac49ff1fae35616aeb8413b7c7aeb=
e0",
> +       "0x57119fd0dd4e22d8868e1c58c45c44045bef839c55b1d0b1248c50a3bc959c=
5f",
> +       "0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff=
ec",
> +       "0x7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff=
ee",
> +       NULL
> +};
> +
> +static const char *const curve448_bad_points[] =3D {
> +       "0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffe"
> +       "ffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
> +       "0x00000000000000000000000000000000000000000000000000000000"
> +       "00000000000000000000000000000000000000000000000000000000",
> +       "0x00000000000000000000000000000000000000000000000000000000"
> +       "00000000000000000000000000000000000000000000000000000001",
> +       "0xfffffffffffffffffffffffffffffffffffffffffffffffffffffffe"
> +       "fffffffffffffffffffffffffffffffffffffffffffffffffffffffe",
> +       "0xffffffffffffffffffffffffffffffffffffffffffffffffffffffff"
> +       "00000000000000000000000000000000000000000000000000000000",
> +       NULL
> +};
> +
> +static const char *const *bad_points_table[] =3D {
> +       curve25519_bad_points,
> +       curve448_bad_points,
> +};
> +
> +static void mpi_ec_coefficient_normalize(MPI a, MPI p)
> +{
> +       if (a->sign) {
> +               mpi_resize(a, p->nlimbs);
> +               mpihelp_sub_n(a->d, p->d, a->d, p->nlimbs);
> +               a->nlimbs =3D p->nlimbs;
> +               a->sign =3D 0;
> +       }
> +}
> +
> +/* This function initialized a context for elliptic curve based on the
> + * field GF(p).  P is the prime specifying this field, A is the first
> + * coefficient.  CTX is expected to be zeroized.
> + */
> +void mpi_ec_init(struct mpi_ec_ctx *ctx, enum gcry_mpi_ec_models model,
> +                       enum ecc_dialects dialect,
> +                       int flags, MPI p, MPI a, MPI b)
> +{
> +       int i;
> +       static int use_barrett =3D -1 /* TODO: 1 or -1 */;
> +
> +       mpi_ec_coefficient_normalize(a, p);
> +       mpi_ec_coefficient_normalize(b, p);
> +
> +       /* Fixme: Do we want to check some constraints? e.g.  a < p  */
> +
> +       ctx->model =3D model;
> +       ctx->dialect =3D dialect;
> +       ctx->flags =3D flags;
> +       if (dialect =3D=3D ECC_DIALECT_ED25519)
> +               ctx->nbits =3D 256;
> +       else
> +               ctx->nbits =3D mpi_get_nbits(p);
> +       ctx->p =3D mpi_copy(p);
> +       ctx->a =3D mpi_copy(a);
> +       ctx->b =3D mpi_copy(b);
> +
> +       ctx->d =3D NULL;
> +       ctx->t.two_inv_p =3D NULL;
> +
> +       ctx->t.p_barrett =3D use_barrett > 0 ? mpi_barrett_init(ctx->p, 0=
) : NULL;
> +
> +       mpi_ec_get_reset(ctx);
> +
> +       if (model =3D=3D MPI_EC_MONTGOMERY) {
> +               for (i =3D 0; i < DIM(bad_points_table); i++) {
> +                       MPI p_candidate =3D mpi_scanval(bad_points_table[=
i][0]);
> +                       int match_p =3D !mpi_cmp(ctx->p, p_candidate);
> +                       int j;
> +
> +                       mpi_free(p_candidate);
> +                       if (!match_p)
> +                               continue;
> +
> +                       for (j =3D 0; i < DIM(ctx->t.scratch) && bad_poin=
ts_table[i][j]; j++)
> +                               ctx->t.scratch[j] =3D mpi_scanval(bad_poi=
nts_table[i][j]);
> +               }
> +       } else {
> +               /* Allocate scratch variables.  */
> +               for (i =3D 0; i < DIM(ctx->t.scratch); i++)
> +                       ctx->t.scratch[i] =3D mpi_alloc_like(ctx->p);
> +       }
> +
> +       ctx->addm =3D ec_addm;
> +       ctx->subm =3D ec_subm;
> +       ctx->mulm =3D ec_mulm;
> +       ctx->mul2 =3D ec_mul2;
> +       ctx->pow2 =3D ec_pow2;
> +
> +       for (i =3D 0; field_table[i].p; i++) {
> +               MPI f_p;
> +
> +               f_p =3D mpi_scanval(field_table[i].p);
> +               if (!f_p)
> +                       break;
> +
> +               if (!mpi_cmp(p, f_p)) {
> +                       ctx->addm =3D field_table[i].addm;
> +                       ctx->subm =3D field_table[i].subm;
> +                       ctx->mulm =3D field_table[i].mulm;
> +                       ctx->mul2 =3D field_table[i].mul2;
> +                       ctx->pow2 =3D field_table[i].pow2;
> +                       mpi_free(f_p);
> +
> +                       mpi_resize(ctx->a, ctx->p->nlimbs);
> +                       ctx->a->nlimbs =3D ctx->p->nlimbs;
> +
> +                       mpi_resize(ctx->b, ctx->p->nlimbs);
> +                       ctx->b->nlimbs =3D ctx->p->nlimbs;
> +
> +                       for (i =3D 0; i < DIM(ctx->t.scratch) && ctx->t.s=
cratch[i]; i++)
> +                               ctx->t.scratch[i]->nlimbs =3D ctx->p->nli=
mbs;
> +
> +                       break;
> +               }
> +
> +               mpi_free(f_p);
> +       }
> +}
> +EXPORT_SYMBOL_GPL(mpi_ec_init);
> +
> +void mpi_ec_deinit(struct mpi_ec_ctx *ctx)
> +{
> +       int i;
> +
> +       mpi_barrett_free(ctx->t.p_barrett);
> +
> +       /* Domain parameter.  */
> +       mpi_free(ctx->p);
> +       mpi_free(ctx->a);
> +       mpi_free(ctx->b);
> +       mpi_point_release(ctx->G);
> +       mpi_free(ctx->n);
> +
> +       /* The key.  */
> +       mpi_point_release(ctx->Q);
> +       mpi_free(ctx->d);
> +
> +       /* Private data of ec.c.  */
> +       mpi_free(ctx->t.two_inv_p);
> +
> +       for (i =3D 0; i < DIM(ctx->t.scratch); i++)
> +               mpi_free(ctx->t.scratch[i]);
> +}
> +EXPORT_SYMBOL_GPL(mpi_ec_deinit);
> +
> +/* Compute the affine coordinates from the projective coordinates in
> + * POINT.  Set them into X and Y.  If one coordinate is not required,
> + * X or Y may be passed as NULL.  CTX is the usual context. Returns: 0
> + * on success or !0 if POINT is at infinity.
> + */
> +int mpi_ec_get_affine(MPI x, MPI y, MPI_POINT point, struct mpi_ec_ctx *=
ctx)
> +{
> +       if (!mpi_cmp_ui(point->z, 0))
> +               return -1;
> +
> +       switch (ctx->model) {
> +       case MPI_EC_WEIERSTRASS: /* Using Jacobian coordinates.  */
> +               {
> +                       MPI z1, z2, z3;
> +
> +                       z1 =3D mpi_new(0);
> +                       z2 =3D mpi_new(0);
> +                       ec_invm(z1, point->z, ctx);  /* z1 =3D z^(-1) mod=
 p  */
> +                       ec_mulm(z2, z1, z1, ctx);    /* z2 =3D z^(-2) mod=
 p  */
> +
> +                       if (x)
> +                               ec_mulm(x, point->x, z2, ctx);
> +
> +                       if (y) {
> +                               z3 =3D mpi_new(0);
> +                               ec_mulm(z3, z2, z1, ctx);      /* z3 =3D =
z^(-3) mod p */
> +                               ec_mulm(y, point->y, z3, ctx);
> +                               mpi_free(z3);
> +                       }
> +
> +                       mpi_free(z2);
> +                       mpi_free(z1);
> +               }
> +               return 0;
> +
> +       case MPI_EC_MONTGOMERY:
> +               {
> +                       if (x)
> +                               mpi_set(x, point->x);
> +
> +                       if (y) {
> +                               log_fatal("%s: Getting Y-coordinate on %s=
 is not supported\n",
> +                                               "mpi_ec_get_affine", "Mon=
tgomery");
> +                               return -1;
> +                       }
> +               }
> +               return 0;
> +
> +       case MPI_EC_EDWARDS:
> +               {
> +                       MPI z;
> +
> +                       z =3D mpi_new(0);
> +                       ec_invm(z, point->z, ctx);
> +
> +                       mpi_resize(z, ctx->p->nlimbs);
> +                       z->nlimbs =3D ctx->p->nlimbs;
> +
> +                       if (x) {
> +                               mpi_resize(x, ctx->p->nlimbs);
> +                               x->nlimbs =3D ctx->p->nlimbs;
> +                               ctx->mulm(x, point->x, z, ctx);
> +                       }
> +                       if (y) {
> +                               mpi_resize(y, ctx->p->nlimbs);
> +                               y->nlimbs =3D ctx->p->nlimbs;
> +                               ctx->mulm(y, point->y, z, ctx);
> +                       }
> +
> +                       mpi_free(z);
> +               }
> +               return 0;
> +
> +       default:
> +               return -1;
> +       }
> +}
> +EXPORT_SYMBOL_GPL(mpi_ec_get_affine);
> +
> +/*  RESULT =3D 2 * POINT  (Weierstrass version). */
> +static void dup_point_weierstrass(MPI_POINT result,
> +               MPI_POINT point, struct mpi_ec_ctx *ctx)
> +{
> +#define x3 (result->x)
> +#define y3 (result->y)
> +#define z3 (result->z)
> +#define t1 (ctx->t.scratch[0])
> +#define t2 (ctx->t.scratch[1])
> +#define t3 (ctx->t.scratch[2])
> +#define l1 (ctx->t.scratch[3])
> +#define l2 (ctx->t.scratch[4])
> +#define l3 (ctx->t.scratch[5])
> +
> +       if (!mpi_cmp_ui(point->y, 0) || !mpi_cmp_ui(point->z, 0)) {
> +               /* P_y =3D=3D 0 || P_z =3D=3D 0 =3D> [1:1:0] */
> +               mpi_set_ui(x3, 1);
> +               mpi_set_ui(y3, 1);
> +               mpi_set_ui(z3, 0);
> +       } else {
> +               if (ec_get_a_is_pminus3(ctx)) {
> +                       /* Use the faster case.  */
> +                       /* L1 =3D 3(X - Z^2)(X + Z^2) */
> +                       /*                          T1: used for Z^2. */
> +                       /*                          T2: used for the righ=
t term. */
> +                       ec_pow2(t1, point->z, ctx);
> +                       ec_subm(l1, point->x, t1, ctx);
> +                       ec_mulm(l1, l1, mpi_const(MPI_C_THREE), ctx);
> +                       ec_addm(t2, point->x, t1, ctx);
> +                       ec_mulm(l1, l1, t2, ctx);
> +               } else {
> +                       /* Standard case. */
> +                       /* L1 =3D 3X^2 + aZ^4 */
> +                       /*                          T1: used for aZ^4. */
> +                       ec_pow2(l1, point->x, ctx);
> +                       ec_mulm(l1, l1, mpi_const(MPI_C_THREE), ctx);
> +                       ec_powm(t1, point->z, mpi_const(MPI_C_FOUR), ctx)=
;
> +                       ec_mulm(t1, t1, ctx->a, ctx);
> +                       ec_addm(l1, l1, t1, ctx);
> +               }
> +               /* Z3 =3D 2YZ */
> +               ec_mulm(z3, point->y, point->z, ctx);
> +               ec_mul2(z3, z3, ctx);
> +
> +               /* L2 =3D 4XY^2 */
> +               /*                              T2: used for Y2; required=
 later. */
> +               ec_pow2(t2, point->y, ctx);
> +               ec_mulm(l2, t2, point->x, ctx);
> +               ec_mulm(l2, l2, mpi_const(MPI_C_FOUR), ctx);
> +
> +               /* X3 =3D L1^2 - 2L2 */
> +               /*                              T1: used for L2^2. */
> +               ec_pow2(x3, l1, ctx);
> +               ec_mul2(t1, l2, ctx);
> +               ec_subm(x3, x3, t1, ctx);
> +
> +               /* L3 =3D 8Y^4 */
> +               /*                              T2: taken from above. */
> +               ec_pow2(t2, t2, ctx);
> +               ec_mulm(l3, t2, mpi_const(MPI_C_EIGHT), ctx);
> +
> +               /* Y3 =3D L1(L2 - X3) - L3 */
> +               ec_subm(y3, l2, x3, ctx);
> +               ec_mulm(y3, y3, l1, ctx);
> +               ec_subm(y3, y3, l3, ctx);
> +       }
> +
> +#undef x3
> +#undef y3
> +#undef z3
> +#undef t1
> +#undef t2
> +#undef t3
> +#undef l1
> +#undef l2
> +#undef l3
> +}
> +
> +/*  RESULT =3D 2 * POINT  (Montgomery version). */
> +static void dup_point_montgomery(MPI_POINT result,
> +                               MPI_POINT point, struct mpi_ec_ctx *ctx)
> +{
> +       (void)result;
> +       (void)point;
> +       (void)ctx;
> +       log_fatal("%s: %s not yet supported\n",
> +                       "mpi_ec_dup_point", "Montgomery");
> +}
> +
> +/*  RESULT =3D 2 * POINT  (Twisted Edwards version). */
> +static void dup_point_edwards(MPI_POINT result,
> +               MPI_POINT point, struct mpi_ec_ctx *ctx)
> +{
> +#define X1 (point->x)
> +#define Y1 (point->y)
> +#define Z1 (point->z)
> +#define X3 (result->x)
> +#define Y3 (result->y)
> +#define Z3 (result->z)
> +#define B (ctx->t.scratch[0])
> +#define C (ctx->t.scratch[1])
> +#define D (ctx->t.scratch[2])
> +#define E (ctx->t.scratch[3])
> +#define F (ctx->t.scratch[4])
> +#define H (ctx->t.scratch[5])
> +#define J (ctx->t.scratch[6])
> +
> +       /* Compute: (X_3 : Y_3 : Z_3) =3D 2( X_1 : Y_1 : Z_1 ) */
> +
> +       /* B =3D (X_1 + Y_1)^2  */
> +       ctx->addm(B, X1, Y1, ctx);
> +       ctx->pow2(B, B, ctx);
> +
> +       /* C =3D X_1^2 */
> +       /* D =3D Y_1^2 */
> +       ctx->pow2(C, X1, ctx);
> +       ctx->pow2(D, Y1, ctx);
> +
> +       /* E =3D aC */
> +       if (ctx->dialect =3D=3D ECC_DIALECT_ED25519)
> +               ctx->subm(E, ctx->p, C, ctx);
> +       else
> +               ctx->mulm(E, ctx->a, C, ctx);
> +
> +       /* F =3D E + D */
> +       ctx->addm(F, E, D, ctx);
> +
> +       /* H =3D Z_1^2 */
> +       ctx->pow2(H, Z1, ctx);
> +
> +       /* J =3D F - 2H */
> +       ctx->mul2(J, H, ctx);
> +       ctx->subm(J, F, J, ctx);
> +
> +       /* X_3 =3D (B - C - D) =C2=B7 J */
> +       ctx->subm(X3, B, C, ctx);
> +       ctx->subm(X3, X3, D, ctx);
> +       ctx->mulm(X3, X3, J, ctx);
> +
> +       /* Y_3 =3D F =C2=B7 (E - D) */
> +       ctx->subm(Y3, E, D, ctx);
> +       ctx->mulm(Y3, Y3, F, ctx);
> +
> +       /* Z_3 =3D F =C2=B7 J */
> +       ctx->mulm(Z3, F, J, ctx);
> +
> +#undef X1
> +#undef Y1
> +#undef Z1
> +#undef X3
> +#undef Y3
> +#undef Z3
> +#undef B
> +#undef C
> +#undef D
> +#undef E
> +#undef F
> +#undef H
> +#undef J
> +}
> +
> +/*  RESULT =3D 2 * POINT  */
> +static void
> +mpi_ec_dup_point(MPI_POINT result, MPI_POINT point, struct mpi_ec_ctx *c=
tx)
> +{
> +       switch (ctx->model) {
> +       case MPI_EC_WEIERSTRASS:
> +               dup_point_weierstrass(result, point, ctx);
> +               break;
> +       case MPI_EC_MONTGOMERY:
> +               dup_point_montgomery(result, point, ctx);
> +               break;
> +       case MPI_EC_EDWARDS:
> +               dup_point_edwards(result, point, ctx);
> +               break;
> +       }
> +}
> +
> +/* RESULT =3D P1 + P2  (Weierstrass version).*/
> +static void add_points_weierstrass(MPI_POINT result,
> +               MPI_POINT p1, MPI_POINT p2,
> +               struct mpi_ec_ctx *ctx)
> +{
> +#define x1 (p1->x)
> +#define y1 (p1->y)
> +#define z1 (p1->z)
> +#define x2 (p2->x)
> +#define y2 (p2->y)
> +#define z2 (p2->z)
> +#define x3 (result->x)
> +#define y3 (result->y)
> +#define z3 (result->z)
> +#define l1 (ctx->t.scratch[0])
> +#define l2 (ctx->t.scratch[1])
> +#define l3 (ctx->t.scratch[2])
> +#define l4 (ctx->t.scratch[3])
> +#define l5 (ctx->t.scratch[4])
> +#define l6 (ctx->t.scratch[5])
> +#define l7 (ctx->t.scratch[6])
> +#define l8 (ctx->t.scratch[7])
> +#define l9 (ctx->t.scratch[8])
> +#define t1 (ctx->t.scratch[9])
> +#define t2 (ctx->t.scratch[10])
> +
> +       if ((!mpi_cmp(x1, x2)) && (!mpi_cmp(y1, y2)) && (!mpi_cmp(z1, z2)=
)) {
> +               /* Same point; need to call the duplicate function.  */
> +               mpi_ec_dup_point(result, p1, ctx);
> +       } else if (!mpi_cmp_ui(z1, 0)) {
> +               /* P1 is at infinity.  */
> +               mpi_set(x3, p2->x);
> +               mpi_set(y3, p2->y);
> +               mpi_set(z3, p2->z);
> +       } else if (!mpi_cmp_ui(z2, 0)) {
> +               /* P2 is at infinity.  */
> +               mpi_set(x3, p1->x);
> +               mpi_set(y3, p1->y);
> +               mpi_set(z3, p1->z);
> +       } else {
> +               int z1_is_one =3D !mpi_cmp_ui(z1, 1);
> +               int z2_is_one =3D !mpi_cmp_ui(z2, 1);
> +
> +               /* l1 =3D x1 z2^2  */
> +               /* l2 =3D x2 z1^2  */
> +               if (z2_is_one)
> +                       mpi_set(l1, x1);
> +               else {
> +                       ec_pow2(l1, z2, ctx);
> +                       ec_mulm(l1, l1, x1, ctx);
> +               }
> +               if (z1_is_one)
> +                       mpi_set(l2, x2);
> +               else {
> +                       ec_pow2(l2, z1, ctx);
> +                       ec_mulm(l2, l2, x2, ctx);
> +               }
> +               /* l3 =3D l1 - l2 */
> +               ec_subm(l3, l1, l2, ctx);
> +               /* l4 =3D y1 z2^3  */
> +               ec_powm(l4, z2, mpi_const(MPI_C_THREE), ctx);
> +               ec_mulm(l4, l4, y1, ctx);
> +               /* l5 =3D y2 z1^3  */
> +               ec_powm(l5, z1, mpi_const(MPI_C_THREE), ctx);
> +               ec_mulm(l5, l5, y2, ctx);
> +               /* l6 =3D l4 - l5  */
> +               ec_subm(l6, l4, l5, ctx);
> +
> +               if (!mpi_cmp_ui(l3, 0)) {
> +                       if (!mpi_cmp_ui(l6, 0)) {
> +                               /* P1 and P2 are the same - use duplicate=
 function. */
> +                               mpi_ec_dup_point(result, p1, ctx);
> +                       } else {
> +                               /* P1 is the inverse of P2.  */
> +                               mpi_set_ui(x3, 1);
> +                               mpi_set_ui(y3, 1);
> +                               mpi_set_ui(z3, 0);
> +                       }
> +               } else {
> +                       /* l7 =3D l1 + l2  */
> +                       ec_addm(l7, l1, l2, ctx);
> +                       /* l8 =3D l4 + l5  */
> +                       ec_addm(l8, l4, l5, ctx);
> +                       /* z3 =3D z1 z2 l3  */
> +                       ec_mulm(z3, z1, z2, ctx);
> +                       ec_mulm(z3, z3, l3, ctx);
> +                       /* x3 =3D l6^2 - l7 l3^2  */
> +                       ec_pow2(t1, l6, ctx);
> +                       ec_pow2(t2, l3, ctx);
> +                       ec_mulm(t2, t2, l7, ctx);
> +                       ec_subm(x3, t1, t2, ctx);
> +                       /* l9 =3D l7 l3^2 - 2 x3  */
> +                       ec_mul2(t1, x3, ctx);
> +                       ec_subm(l9, t2, t1, ctx);
> +                       /* y3 =3D (l9 l6 - l8 l3^3)/2  */
> +                       ec_mulm(l9, l9, l6, ctx);
> +                       ec_powm(t1, l3, mpi_const(MPI_C_THREE), ctx); /* =
fixme: Use saved value*/
> +                       ec_mulm(t1, t1, l8, ctx);
> +                       ec_subm(y3, l9, t1, ctx);
> +                       ec_mulm(y3, y3, ec_get_two_inv_p(ctx), ctx);
> +               }
> +       }
> +
> +#undef x1
> +#undef y1
> +#undef z1
> +#undef x2
> +#undef y2
> +#undef z2
> +#undef x3
> +#undef y3
> +#undef z3
> +#undef l1
> +#undef l2
> +#undef l3
> +#undef l4
> +#undef l5
> +#undef l6
> +#undef l7
> +#undef l8
> +#undef l9
> +#undef t1
> +#undef t2
> +}
> +
> +/* RESULT =3D P1 + P2  (Montgomery version).*/
> +static void add_points_montgomery(MPI_POINT result,
> +               MPI_POINT p1, MPI_POINT p2,
> +               struct mpi_ec_ctx *ctx)
> +{
> +       (void)result;
> +       (void)p1;
> +       (void)p2;
> +       (void)ctx;
> +       log_fatal("%s: %s not yet supported\n",
> +                       "mpi_ec_add_points", "Montgomery");
> +}
> +
> +/* RESULT =3D P1 + P2  (Twisted Edwards version).*/
> +static void add_points_edwards(MPI_POINT result,
> +               MPI_POINT p1, MPI_POINT p2,
> +               struct mpi_ec_ctx *ctx)
> +{
> +#define X1 (p1->x)
> +#define Y1 (p1->y)
> +#define Z1 (p1->z)
> +#define X2 (p2->x)
> +#define Y2 (p2->y)
> +#define Z2 (p2->z)
> +#define X3 (result->x)
> +#define Y3 (result->y)
> +#define Z3 (result->z)
> +#define A (ctx->t.scratch[0])
> +#define B (ctx->t.scratch[1])
> +#define C (ctx->t.scratch[2])
> +#define D (ctx->t.scratch[3])
> +#define E (ctx->t.scratch[4])
> +#define F (ctx->t.scratch[5])
> +#define G (ctx->t.scratch[6])
> +#define tmp (ctx->t.scratch[7])
> +
> +       point_resize(result, ctx);
> +
> +       /* Compute: (X_3 : Y_3 : Z_3) =3D (X_1 : Y_1 : Z_1) + (X_2 : Y_2 =
: Z_3) */
> +
> +       /* A =3D Z1 =C2=B7 Z2 */
> +       ctx->mulm(A, Z1, Z2, ctx);
> +
> +       /* B =3D A^2 */
> +       ctx->pow2(B, A, ctx);
> +
> +       /* C =3D X1 =C2=B7 X2 */
> +       ctx->mulm(C, X1, X2, ctx);
> +
> +       /* D =3D Y1 =C2=B7 Y2 */
> +       ctx->mulm(D, Y1, Y2, ctx);
> +
> +       /* E =3D d =C2=B7 C =C2=B7 D */
> +       ctx->mulm(E, ctx->b, C, ctx);
> +       ctx->mulm(E, E, D, ctx);
> +
> +       /* F =3D B - E */
> +       ctx->subm(F, B, E, ctx);
> +
> +       /* G =3D B + E */
> +       ctx->addm(G, B, E, ctx);
> +
> +       /* X_3 =3D A =C2=B7 F =C2=B7 ((X_1 + Y_1) =C2=B7 (X_2 + Y_2) - C =
- D) */
> +       ctx->addm(tmp, X1, Y1, ctx);
> +       ctx->addm(X3, X2, Y2, ctx);
> +       ctx->mulm(X3, X3, tmp, ctx);
> +       ctx->subm(X3, X3, C, ctx);
> +       ctx->subm(X3, X3, D, ctx);
> +       ctx->mulm(X3, X3, F, ctx);
> +       ctx->mulm(X3, X3, A, ctx);
> +
> +       /* Y_3 =3D A =C2=B7 G =C2=B7 (D - aC) */
> +       if (ctx->dialect =3D=3D ECC_DIALECT_ED25519) {
> +               ctx->addm(Y3, D, C, ctx);
> +       } else {
> +               ctx->mulm(Y3, ctx->a, C, ctx);
> +               ctx->subm(Y3, D, Y3, ctx);
> +       }
> +       ctx->mulm(Y3, Y3, G, ctx);
> +       ctx->mulm(Y3, Y3, A, ctx);
> +
> +       /* Z_3 =3D F =C2=B7 G */
> +       ctx->mulm(Z3, F, G, ctx);
> +
> +
> +#undef X1
> +#undef Y1
> +#undef Z1
> +#undef X2
> +#undef Y2
> +#undef Z2
> +#undef X3
> +#undef Y3
> +#undef Z3
> +#undef A
> +#undef B
> +#undef C
> +#undef D
> +#undef E
> +#undef F
> +#undef G
> +#undef tmp
> +}
> +
> +/* Compute a step of Montgomery Ladder (only use X and Z in the point).
> + * Inputs:  P1, P2, and x-coordinate of DIF =3D P1 - P1.
> + * Outputs: PRD =3D 2 * P1 and  SUM =3D P1 + P2.
> + */
> +static void montgomery_ladder(MPI_POINT prd, MPI_POINT sum,
> +               MPI_POINT p1, MPI_POINT p2, MPI dif_x,
> +               struct mpi_ec_ctx *ctx)
> +{
> +       ctx->addm(sum->x, p2->x, p2->z, ctx);
> +       ctx->subm(p2->z, p2->x, p2->z, ctx);
> +       ctx->addm(prd->x, p1->x, p1->z, ctx);
> +       ctx->subm(p1->z, p1->x, p1->z, ctx);
> +       ctx->mulm(p2->x, p1->z, sum->x, ctx);
> +       ctx->mulm(p2->z, prd->x, p2->z, ctx);
> +       ctx->pow2(p1->x, prd->x, ctx);
> +       ctx->pow2(p1->z, p1->z, ctx);
> +       ctx->addm(sum->x, p2->x, p2->z, ctx);
> +       ctx->subm(p2->z, p2->x, p2->z, ctx);
> +       ctx->mulm(prd->x, p1->x, p1->z, ctx);
> +       ctx->subm(p1->z, p1->x, p1->z, ctx);
> +       ctx->pow2(sum->x, sum->x, ctx);
> +       ctx->pow2(sum->z, p2->z, ctx);
> +       ctx->mulm(prd->z, p1->z, ctx->a, ctx); /* CTX->A: (a-2)/4 */
> +       ctx->mulm(sum->z, sum->z, dif_x, ctx);
> +       ctx->addm(prd->z, p1->x, prd->z, ctx);
> +       ctx->mulm(prd->z, prd->z, p1->z, ctx);
> +}
> +
> +/* RESULT =3D P1 + P2 */
> +void mpi_ec_add_points(MPI_POINT result,
> +               MPI_POINT p1, MPI_POINT p2,
> +               struct mpi_ec_ctx *ctx)
> +{
> +       switch (ctx->model) {
> +       case MPI_EC_WEIERSTRASS:
> +               add_points_weierstrass(result, p1, p2, ctx);
> +               break;
> +       case MPI_EC_MONTGOMERY:
> +               add_points_montgomery(result, p1, p2, ctx);
> +               break;
> +       case MPI_EC_EDWARDS:
> +               add_points_edwards(result, p1, p2, ctx);
> +               break;
> +       }
> +}
> +EXPORT_SYMBOL_GPL(mpi_ec_add_points);
> +
> +/* Scalar point multiplication - the main function for ECC.  If takes
> + * an integer SCALAR and a POINT as well as the usual context CTX.
> + * RESULT will be set to the resulting point.
> + */
> +void mpi_ec_mul_point(MPI_POINT result,
> +                       MPI scalar, MPI_POINT point,
> +                       struct mpi_ec_ctx *ctx)
> +{
> +       MPI x1, y1, z1, k, h, yy;
> +       unsigned int i, loops;
> +       struct gcry_mpi_point p1, p2, p1inv;
> +
> +       if (ctx->model =3D=3D MPI_EC_EDWARDS) {
> +               /* Simple left to right binary method.  Algorithm 3.27 fr=
om
> +                * {author=3D{Hankerson, Darrel and Menezes, Alfred J. an=
d Vanstone, Scott},
> +                *  title =3D {Guide to Elliptic Curve Cryptography},
> +                *  year =3D {2003}, isbn =3D {038795273X},
> +                *  url =3D {http://www.cacr.math.uwaterloo.ca/ecc/},
> +                *  publisher =3D {Springer-Verlag New York, Inc.}}
> +                */
> +               unsigned int nbits;
> +               int j;
> +
> +               if (mpi_cmp(scalar, ctx->p) >=3D 0)
> +                       nbits =3D mpi_get_nbits(scalar);
> +               else
> +                       nbits =3D mpi_get_nbits(ctx->p);
> +
> +               mpi_set_ui(result->x, 0);
> +               mpi_set_ui(result->y, 1);
> +               mpi_set_ui(result->z, 1);
> +               point_resize(point, ctx);
> +
> +               point_resize(result, ctx);
> +               point_resize(point, ctx);
> +
> +               for (j =3D nbits-1; j >=3D 0; j--) {
> +                       mpi_ec_dup_point(result, result, ctx);
> +                       if (mpi_test_bit(scalar, j))
> +                               mpi_ec_add_points(result, result, point, =
ctx);
> +               }
> +               return;
> +       } else if (ctx->model =3D=3D MPI_EC_MONTGOMERY) {
> +               unsigned int nbits;
> +               int j;
> +               struct gcry_mpi_point p1_, p2_;
> +               MPI_POINT q1, q2, prd, sum;
> +               unsigned long sw;
> +               mpi_size_t rsize;
> +
> +               /* Compute scalar point multiplication with Montgomery La=
dder.
> +                * Note that we don't use Y-coordinate in the points at a=
ll.
> +                * RESULT->Y will be filled by zero.
> +                */
> +
> +               nbits =3D mpi_get_nbits(scalar);
> +               point_init(&p1);
> +               point_init(&p2);
> +               point_init(&p1_);
> +               point_init(&p2_);
> +               mpi_set_ui(p1.x, 1);
> +               mpi_free(p2.x);
> +               p2.x =3D mpi_copy(point->x);
> +               mpi_set_ui(p2.z, 1);
> +
> +               point_resize(&p1, ctx);
> +               point_resize(&p2, ctx);
> +               point_resize(&p1_, ctx);
> +               point_resize(&p2_, ctx);
> +
> +               mpi_resize(point->x, ctx->p->nlimbs);
> +               point->x->nlimbs =3D ctx->p->nlimbs;
> +
> +               q1 =3D &p1;
> +               q2 =3D &p2;
> +               prd =3D &p1_;
> +               sum =3D &p2_;
> +
> +               for (j =3D nbits-1; j >=3D 0; j--) {
> +                       sw =3D mpi_test_bit(scalar, j);
> +                       point_swap_cond(q1, q2, sw, ctx);
> +                       montgomery_ladder(prd, sum, q1, q2, point->x, ctx=
);
> +                       point_swap_cond(prd, sum, sw, ctx);
> +                       swap(q1, prd);
> +                       swap(q2, sum);
> +               }
> +
> +               mpi_clear(result->y);
> +               sw =3D (nbits & 1);
> +               point_swap_cond(&p1, &p1_, sw, ctx);
> +
> +               rsize =3D p1.z->nlimbs;
> +               MPN_NORMALIZE(p1.z->d, rsize);
> +               if (rsize =3D=3D 0) {
> +                       mpi_set_ui(result->x, 1);
> +                       mpi_set_ui(result->z, 0);
> +               } else {
> +                       z1 =3D mpi_new(0);
> +                       ec_invm(z1, p1.z, ctx);
> +                       ec_mulm(result->x, p1.x, z1, ctx);
> +                       mpi_set_ui(result->z, 1);
> +                       mpi_free(z1);
> +               }
> +
> +               point_free(&p1);
> +               point_free(&p2);
> +               point_free(&p1_);
> +               point_free(&p2_);
> +               return;
> +       }
> +
> +       x1 =3D mpi_alloc_like(ctx->p);
> +       y1 =3D mpi_alloc_like(ctx->p);
> +       h  =3D mpi_alloc_like(ctx->p);
> +       k  =3D mpi_copy(scalar);
> +       yy =3D mpi_copy(point->y);
> +
> +       if (mpi_has_sign(k)) {
> +               k->sign =3D 0;
> +               ec_invm(yy, yy, ctx);
> +       }
> +
> +       if (!mpi_cmp_ui(point->z, 1)) {
> +               mpi_set(x1, point->x);
> +               mpi_set(y1, yy);
> +       } else {
> +               MPI z2, z3;
> +
> +               z2 =3D mpi_alloc_like(ctx->p);
> +               z3 =3D mpi_alloc_like(ctx->p);
> +               ec_mulm(z2, point->z, point->z, ctx);
> +               ec_mulm(z3, point->z, z2, ctx);
> +               ec_invm(z2, z2, ctx);
> +               ec_mulm(x1, point->x, z2, ctx);
> +               ec_invm(z3, z3, ctx);
> +               ec_mulm(y1, yy, z3, ctx);
> +               mpi_free(z2);
> +               mpi_free(z3);
> +       }
> +       z1 =3D mpi_copy(mpi_const(MPI_C_ONE));
> +
> +       mpi_mul(h, k, mpi_const(MPI_C_THREE)); /* h =3D 3k */
> +       loops =3D mpi_get_nbits(h);
> +       if (loops < 2) {
> +               /* If SCALAR is zero, the above mpi_mul sets H to zero an=
d thus
> +                * LOOPs will be zero.  To avoid an underflow of I in the=
 main
> +                * loop we set LOOP to 2 and the result to (0,0,0).
> +                */
> +               loops =3D 2;
> +               mpi_clear(result->x);
> +               mpi_clear(result->y);
> +               mpi_clear(result->z);
> +       } else {
> +               mpi_set(result->x, point->x);
> +               mpi_set(result->y, yy);
> +               mpi_set(result->z, point->z);
> +       }
> +       mpi_free(yy); yy =3D NULL;
> +
> +       p1.x =3D x1; x1 =3D NULL;
> +       p1.y =3D y1; y1 =3D NULL;
> +       p1.z =3D z1; z1 =3D NULL;
> +       point_init(&p2);
> +       point_init(&p1inv);
> +
> +       /* Invert point: y =3D p - y mod p  */
> +       point_set(&p1inv, &p1);
> +       ec_subm(p1inv.y, ctx->p, p1inv.y, ctx);
> +
> +       for (i =3D loops-2; i > 0; i--) {
> +               mpi_ec_dup_point(result, result, ctx);
> +               if (mpi_test_bit(h, i) =3D=3D 1 && mpi_test_bit(k, i) =3D=
=3D 0) {
> +                       point_set(&p2, result);
> +                       mpi_ec_add_points(result, &p2, &p1, ctx);
> +               }
> +               if (mpi_test_bit(h, i) =3D=3D 0 && mpi_test_bit(k, i) =3D=
=3D 1) {
> +                       point_set(&p2, result);
> +                       mpi_ec_add_points(result, &p2, &p1inv, ctx);
> +               }
> +       }
> +
> +       point_free(&p1);
> +       point_free(&p2);
> +       point_free(&p1inv);
> +       mpi_free(h);
> +       mpi_free(k);
> +}
> +EXPORT_SYMBOL_GPL(mpi_ec_mul_point);
> +
> +/* Return true if POINT is on the curve described by CTX.  */
> +int mpi_ec_curve_point(MPI_POINT point, struct mpi_ec_ctx *ctx)
> +{
> +       int res =3D 0;
> +       MPI x, y, w;
> +
> +       x =3D mpi_new(0);
> +       y =3D mpi_new(0);
> +       w =3D mpi_new(0);
> +
> +       /* Check that the point is in range.  This needs to be done here =
and
> +        * not after conversion to affine coordinates.
> +        */
> +       if (mpi_cmpabs(point->x, ctx->p) >=3D 0)
> +               goto leave;
> +       if (mpi_cmpabs(point->y, ctx->p) >=3D 0)
> +               goto leave;
> +       if (mpi_cmpabs(point->z, ctx->p) >=3D 0)
> +               goto leave;
> +
> +       switch (ctx->model) {
> +       case MPI_EC_WEIERSTRASS:
> +               {
> +                       MPI xxx;
> +
> +                       if (mpi_ec_get_affine(x, y, point, ctx))
> +                               goto leave;
> +
> +                       xxx =3D mpi_new(0);
> +
> +                       /* y^2 =3D=3D x^3 + a=C2=B7x + b */
> +                       ec_pow2(y, y, ctx);
> +
> +                       ec_pow3(xxx, x, ctx);
> +                       ec_mulm(w, ctx->a, x, ctx);
> +                       ec_addm(w, w, ctx->b, ctx);
> +                       ec_addm(w, w, xxx, ctx);
> +
> +                       if (!mpi_cmp(y, w))
> +                               res =3D 1;
> +
> +                       mpi_free(xxx);
> +               }
> +               break;
> +
> +       case MPI_EC_MONTGOMERY:
> +               {
> +#define xx y
> +                       /* With Montgomery curve, only X-coordinate is va=
lid. */
> +                       if (mpi_ec_get_affine(x, NULL, point, ctx))
> +                               goto leave;
> +
> +                       /* The equation is: b * y^2 =3D=3D x^3 + a =C2=B7=
 x^2 + x */
> +                       /* We check if right hand is quadratic residue or=
 not by
> +                        * Euler's criterion.
> +                        */
> +                       /* CTX->A has (a-2)/4 and CTX->B has b^-1 */
> +                       ec_mulm(w, ctx->a, mpi_const(MPI_C_FOUR), ctx);
> +                       ec_addm(w, w, mpi_const(MPI_C_TWO), ctx);
> +                       ec_mulm(w, w, x, ctx);
> +                       ec_pow2(xx, x, ctx);
> +                       ec_addm(w, w, xx, ctx);
> +                       ec_addm(w, w, mpi_const(MPI_C_ONE), ctx);
> +                       ec_mulm(w, w, x, ctx);
> +                       ec_mulm(w, w, ctx->b, ctx);
> +#undef xx
> +                       /* Compute Euler's criterion: w^(p-1)/2 */
> +#define p_minus1 y
> +                       ec_subm(p_minus1, ctx->p, mpi_const(MPI_C_ONE), c=
tx);
> +                       mpi_rshift(p_minus1, p_minus1, 1);
> +                       ec_powm(w, w, p_minus1, ctx);
> +
> +                       res =3D !mpi_cmp_ui(w, 1);
> +#undef p_minus1
> +               }
> +               break;
> +
> +       case MPI_EC_EDWARDS:
> +               {
> +                       if (mpi_ec_get_affine(x, y, point, ctx))
> +                               goto leave;
> +
> +                       mpi_resize(w, ctx->p->nlimbs);
> +                       w->nlimbs =3D ctx->p->nlimbs;
> +
> +                       /* a =C2=B7 x^2 + y^2 - 1 - b =C2=B7 x^2 =C2=B7 y=
^2 =3D=3D 0 */
> +                       ctx->pow2(x, x, ctx);
> +                       ctx->pow2(y, y, ctx);
> +                       if (ctx->dialect =3D=3D ECC_DIALECT_ED25519)
> +                               ctx->subm(w, ctx->p, x, ctx);
> +                       else
> +                               ctx->mulm(w, ctx->a, x, ctx);
> +                       ctx->addm(w, w, y, ctx);
> +                       ctx->mulm(x, x, y, ctx);
> +                       ctx->mulm(x, x, ctx->b, ctx);
> +                       ctx->subm(w, w, x, ctx);
> +                       if (!mpi_cmp_ui(w, 1))
> +                               res =3D 1;
> +               }
> +               break;
> +       }
> +
> +leave:
> +       mpi_free(w);
> +       mpi_free(x);
> +       mpi_free(y);
> +
> +       return res;
> +}
> +EXPORT_SYMBOL_GPL(mpi_ec_curve_point);
> --
> 2.25.1
>

Ignat

