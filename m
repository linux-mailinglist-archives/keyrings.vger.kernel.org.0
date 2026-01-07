Return-Path: <keyrings+bounces-3741-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 25118CFF459
	for <lists+keyrings@lfdr.de>; Wed, 07 Jan 2026 19:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F12F934EA075
	for <lists+keyrings@lfdr.de>; Wed,  7 Jan 2026 16:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EB3352F8E;
	Wed,  7 Jan 2026 16:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="E291fH8R"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BC5361DDE
	for <keyrings@vger.kernel.org>; Wed,  7 Jan 2026 16:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803828; cv=none; b=Fw7Mphzi+QIC50T0rm5ytW3IP7I0UCfJ9PUYHc8MxJ6uSF3CHlwDVLyBRl/zDzmPE2xBKAFbSyy74sZVtBnrCgX9qtveXfHTgdxeQRsRWc0RpyGNQhjGDpm4l08pQuvbgrGhtHXlt+MtXgbN6uH3AcyUt1/8lgTAfKM24+dELO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803828; c=relaxed/simple;
	bh=yE1+zIvfN7zHoNAoQcXPJaZTTBAiBc1w5uAGQJpMZWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eua8Q5pigYVRGJ1WDVPj/QuR2j8gOeoMS/dstToGWXI41I7uMn8QH9QeyAN+gT6tZ9uj//wBi7WCCrmOGWU7iIC18w7L+Pvya/CrHn1KrjH/DPyLyildgt+GwH2nhiY4TIUv5ohShw5kifwq8w0F02cBJr0Sg5M7j5JVsyjdmJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=E291fH8R; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-59583505988so1526879e87.1
        for <keyrings@vger.kernel.org>; Wed, 07 Jan 2026 08:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1767803818; x=1768408618; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1w+kaVVotLEBFxJ9sBpmoM9MCqL0pUTbWYoMVzOEC8=;
        b=E291fH8RpK2bnLZvQH9f6qNwycbPYqs8jHi9azSvNfWe6qxYizEV27nN3a0GpwvH8H
         D3Akt0Fe39piUKlwDy/w7Jl5T9qYcWv9AbdBjEVhBK4GWesNOwLQpfcOar3Era3Z9k1l
         s8M3gomCXl+Yiwwze52cQGFFb7jlHUptM3Pv3j/0mHk6RjR1d19jSbx7wyxWOpTfL5Rj
         rweCkzUXKkVoa6ytsiOrBogdo+sxokQT2ZmH7deAo+BQ7ocY9j7x1Z+P9RZ32OupJjx4
         GLl4BiVFq0Hc2Mvom4sE9rYlcq3IPmVbNWreKzQatq3KeRRSxyEgQn29xYw19gCcPlEr
         O2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803818; x=1768408618;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P1w+kaVVotLEBFxJ9sBpmoM9MCqL0pUTbWYoMVzOEC8=;
        b=tuGFUiH045jARnITaATuwFSZSON2MCoyHjEm57R+Md4d3zOfaZR+kerg1pj8RbjRFs
         ruXwZVudoy12pUcgd0nUTNlixl6fC9zEXvYr3+Ssc9gVMefmVlkvu6wzs7CQfAa/bdX0
         XX0fO8wmU5ZsuN4yyNiTcszkltNz9xnMjLYtnjI3mLUmk9vMNjUFveKRimhHvUAeN8+x
         W0xOR2T9R5VXbU/Uy8TLICxvwyLhmwtb78gxgtrxwRzIrtBkI2/wKxENSEiB8P5aYtaW
         qixBLENYHIvejBQ1n93FIyPzYJh94vAN+5aSWoO4vBhsIt3dsixz3vg08T43ai0baJ1k
         /EAg==
X-Forwarded-Encrypted: i=1; AJvYcCXo0Op3wK0ZqSco3nbR7DIodFI2Hn+toaobVVZYAAJIme3829QlcnhJa1Jv4Mw92qTyNAXUWx54JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIee3e+JguzF25MD59mq7ZN2p/8hOMv8S6S1ZjP6VuEOSYMYM0
	cwcu5ff1OHAgK2T6oCNJL93V0s3gaiHYhJesqMS4lkxAcupI1SUVa+6bWXA64ooCGGj0hwMw2A4
	2Lcu3lt7jRFzP92VOylbdkVoqHtplhiyLelk0/8/Hvg==
X-Gm-Gg: AY/fxX4NFoVd9BpawcvdMxoM/aTOTBTNfFA7O/3RdjOrKq9gWPCn4rTIFsOpj41n6F+
	OrLim5ocmeq1eO8dvT5srFfWkTgsBkUaeEa8rH3sNn5bJypnHMt+spQzwmh2VlzZ7bDNkX03g1M
	0Zw8x2dCOkBu8hAKeGPgq7GOnWHUizp6WpfeiR3/rih6i36D1UcaZ8xGUUWf54noVBsxuvPTjc0
	qcWo6bgkFgNNzkXrhC6niTXcT2Kju36ZYtsL8DgbxCEiwKHhsA31smvaT9SAmeIogcjo5MtV9zq
	eArIHdrBgxF7Og==
X-Google-Smtp-Source: AGHT+IGWx5imEdBGLN5gs/J4NnRKvJVyXIecNGMZ/ZXVTHL6+q9FISuGw5DyfVBE9xXmhu1duK8dD0PVsKEyIq/JdEY=
X-Received: by 2002:a05:6512:1105:b0:59a:1326:43c6 with SMTP id
 2adb3069b0e04-59b65894e3emr2429791e87.22.1767803817821; Wed, 07 Jan 2026
 08:36:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105152145.1801972-1-dhowells@redhat.com> <20260105152145.1801972-8-dhowells@redhat.com>
In-Reply-To: <20260105152145.1801972-8-dhowells@redhat.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 7 Jan 2026 16:36:46 +0000
X-Gm-Features: AQt7F2r4CpylCwB-dv4Ha4W0abX82HiLR-34n8t00sBQWnM2lp-k44NmqQsT-Ag
Message-ID: <CALrw=nHMm0Br9iaMyCQwbujb-vus3nsA-__1Nw=UG-an=B_jtg@mail.gmail.com>
Subject: Re: [PATCH v11 7/8] pkcs7, x509: Add RSASSA-PSS support
To: David Howells <dhowells@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Eric Biggers <ebiggers@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Stephan Mueller <smueller@chronox.de>, 
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, Jan 5, 2026 at 3:23=E2=80=AFPM David Howells <dhowells@redhat.com> =
wrote:
>
> Add support for RSASSA-PSS keys and signatures to the PKCS#7 and X.509
> implementations.  This requires adding support for algorithm parameters f=
or
> keys and signatures as RSASSA-PSS needs metadata.  The ASN.1 encoded data
> is converted into a printable key=3Dvalue list string and passed to the
> verification code.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Lukas Wunner <lukas@wunner.de>
> cc: Ignat Korchagin <ignat@cloudflare.com>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: keyrings@vger.kernel.org
> cc: linux-crypto@vger.kernel.org
> ---
>  crypto/asymmetric_keys/Makefile           |  12 +-
>  crypto/asymmetric_keys/mgf1_params.asn1   |  12 ++
>  crypto/asymmetric_keys/pkcs7.asn1         |   2 +-
>  crypto/asymmetric_keys/pkcs7_parser.c     | 113 ++++++-----
>  crypto/asymmetric_keys/public_key.c       |  10 +
>  crypto/asymmetric_keys/rsassa_params.asn1 |  25 +++
>  crypto/asymmetric_keys/rsassa_parser.c    | 233 ++++++++++++++++++++++
>  crypto/asymmetric_keys/rsassa_parser.h    |  25 +++
>  crypto/asymmetric_keys/x509.asn1          |   2 +-
>  crypto/asymmetric_keys/x509_cert_parser.c |  96 +++++----
>  crypto/asymmetric_keys/x509_parser.h      |  33 ++-
>  crypto/asymmetric_keys/x509_public_key.c  |  28 ++-
>  include/linux/oid_registry.h              |   2 +
>  13 files changed, 490 insertions(+), 103 deletions(-)
>  create mode 100644 crypto/asymmetric_keys/mgf1_params.asn1
>  create mode 100644 crypto/asymmetric_keys/rsassa_params.asn1
>  create mode 100644 crypto/asymmetric_keys/rsassa_parser.c
>  create mode 100644 crypto/asymmetric_keys/rsassa_parser.h
>
> diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Mak=
efile
> index bc65d3b98dcb..c5aed382ee8a 100644
> --- a/crypto/asymmetric_keys/Makefile
> +++ b/crypto/asymmetric_keys/Makefile
> @@ -21,7 +21,11 @@ x509_key_parser-y :=3D \
>         x509_akid.asn1.o \
>         x509_cert_parser.o \
>         x509_loader.o \
> -       x509_public_key.o
> +       x509_public_key.o \
> +       rsassa_params.asn1.o \
> +       rsassa_parser.o \
> +       mgf1_params.asn1.o
> +
>  obj-$(CONFIG_FIPS_SIGNATURE_SELFTEST) +=3D x509_selftest.o
>  x509_selftest-y +=3D selftest.o
>  x509_selftest-$(CONFIG_FIPS_SIGNATURE_SELFTEST_RSA) +=3D selftest_rsa.o
> @@ -31,8 +35,14 @@ $(obj)/x509_cert_parser.o: \
>         $(obj)/x509.asn1.h \
>         $(obj)/x509_akid.asn1.h
>
> +$(obj)/rsassa_parser.o: \
> +       $(obj)/rsassa_params.asn1.h \
> +       $(obj)/mgf1_params.asn1.h
> +
>  $(obj)/x509.asn1.o: $(obj)/x509.asn1.c $(obj)/x509.asn1.h
>  $(obj)/x509_akid.asn1.o: $(obj)/x509_akid.asn1.c $(obj)/x509_akid.asn1.h
> +$(obj)/rsassa_params.asn1.o: $(obj)/rsassa_params.asn1.c $(obj)/rsassa_p=
arams.asn1.h
> +$(obj)/mgf1_params.asn1.o: $(obj)/mgf1_params.asn1.c $(obj)/mgf1_params.=
asn1.h
>
>  #
>  # PKCS#8 private key handling
> diff --git a/crypto/asymmetric_keys/mgf1_params.asn1 b/crypto/asymmetric_=
keys/mgf1_params.asn1
> new file mode 100644
> index 000000000000..c3bc4643e72c
> --- /dev/null
> +++ b/crypto/asymmetric_keys/mgf1_params.asn1
> @@ -0,0 +1,12 @@
> +-- SPDX-License-Identifier: BSD-3-Clause
> +--
> +-- Copyright (C) 2009 IETF Trust and the persons identified as authors
> +-- of the code
> +--
> +--
> +-- https://datatracker.ietf.org/doc/html/rfc4055 Section 6.
> +
> +AlgorithmIdentifier ::=3D SEQUENCE {
> +       algorithm       OBJECT IDENTIFIER ({ mgf1_note_OID }),
> +       parameters      ANY OPTIONAL
> +}
> diff --git a/crypto/asymmetric_keys/pkcs7.asn1 b/crypto/asymmetric_keys/p=
kcs7.asn1
> index 28e1f4a41c14..03c2248f23bc 100644
> --- a/crypto/asymmetric_keys/pkcs7.asn1
> +++ b/crypto/asymmetric_keys/pkcs7.asn1
> @@ -124,7 +124,7 @@ UnauthenticatedAttribute ::=3D SEQUENCE {
>
>  DigestEncryptionAlgorithmIdentifier ::=3D SEQUENCE {
>         algorithm               OBJECT IDENTIFIER ({ pkcs7_note_OID }),
> -       parameters              ANY OPTIONAL
> +       parameters              ANY OPTIONAL ({ pkcs7_sig_note_algo_param=
s })
>  }
>
>  EncryptedDigest ::=3D OCTET STRING ({ pkcs7_sig_note_signature })
> diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_ke=
ys/pkcs7_parser.c
> index 90c36fe1b5ed..81996b60c1f1 100644
> --- a/crypto/asymmetric_keys/pkcs7_parser.c
> +++ b/crypto/asymmetric_keys/pkcs7_parser.c
> @@ -14,6 +14,7 @@
>  #include <linux/oid_registry.h>
>  #include <crypto/public_key.h>
>  #include "pkcs7_parser.h"
> +#include "rsassa_parser.h"
>  #include "pkcs7.asn1.h"
>
>  MODULE_DESCRIPTION("PKCS#7 parser");
> @@ -30,6 +31,8 @@ struct pkcs7_parse_context {
>         enum OID        last_oid;               /* Last OID encountered *=
/
>         unsigned        x509_index;
>         unsigned        sinfo_index;
> +       unsigned        algo_params_size;
> +       const void      *algo_params;
>         const void      *raw_serial;
>         unsigned        raw_serial_size;
>         unsigned        raw_issuer_size;
> @@ -225,45 +228,29 @@ int pkcs7_sig_note_digest_algo(void *context, size_=
t hdrlen,
>                                const void *value, size_t vlen)
>  {
>         struct pkcs7_parse_context *ctx =3D context;
> +       const char *algo;
>
> -       switch (ctx->last_oid) {
> -       case OID_sha1:
> -               ctx->sinfo->sig->hash_algo =3D "sha1";
> -               break;
> -       case OID_sha256:
> -               ctx->sinfo->sig->hash_algo =3D "sha256";
> -               break;
> -       case OID_sha384:
> -               ctx->sinfo->sig->hash_algo =3D "sha384";
> -               break;
> -       case OID_sha512:
> -               ctx->sinfo->sig->hash_algo =3D "sha512";
> -               break;
> -       case OID_sha224:
> -               ctx->sinfo->sig->hash_algo =3D "sha224";
> -               break;
> -       case OID_sm3:
> -               ctx->sinfo->sig->hash_algo =3D "sm3";
> -               break;
> -       case OID_gost2012Digest256:
> -               ctx->sinfo->sig->hash_algo =3D "streebog256";
> -               break;
> -       case OID_gost2012Digest512:
> -               ctx->sinfo->sig->hash_algo =3D "streebog512";
> -               break;
> -       case OID_sha3_256:
> -               ctx->sinfo->sig->hash_algo =3D "sha3-256";
> -               break;
> -       case OID_sha3_384:
> -               ctx->sinfo->sig->hash_algo =3D "sha3-384";
> -               break;
> -       case OID_sha3_512:
> -               ctx->sinfo->sig->hash_algo =3D "sha3-512";
> -               break;
> -       default:
> -               printk("Unsupported digest algo: %u\n", ctx->last_oid);
> +       algo =3D oid_to_hash(ctx->last_oid);
> +       if (!algo) {
> +               pr_notice("Unsupported digest algo: %u\n", ctx->last_oid)=
;
>                 return -ENOPKG;
>         }
> +
> +       ctx->sinfo->sig->hash_algo =3D algo;
> +       return 0;
> +}
> +
> +/*
> + * Note the parameters for the signature.
> + */
> +int pkcs7_sig_note_algo_params(void *context, size_t hdrlen,
> +                              unsigned char tag,
> +                              const void *value, size_t vlen)
> +{
> +       struct pkcs7_parse_context *ctx =3D context;
> +
> +       ctx->algo_params =3D value - hdrlen;
> +       ctx->algo_params_size =3D vlen + hdrlen;
>         return 0;
>  }
>
> @@ -275,12 +262,16 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t =
hdrlen,
>                              const void *value, size_t vlen)
>  {
>         struct pkcs7_parse_context *ctx =3D context;
> +       struct public_key_signature *sig =3D ctx->sinfo->sig;
> +       int err;
>
>         switch (ctx->last_oid) {
>         case OID_rsaEncryption:
> -               ctx->sinfo->sig->pkey_algo =3D "rsa";
> -               ctx->sinfo->sig->encoding =3D "pkcs1";
> +               sig->pkey_algo =3D "rsa";
> +               sig->encoding =3D "pkcs1";
>                 break;
> +       case OID_id_rsassa_pss:
> +               goto rsassa_pss;

I really don't like this. Is it possible to factor this out to a
separate function and just call here? Should the factored function
even be part of the implementation somehow?

>         case OID_id_ecdsa_with_sha1:
>         case OID_id_ecdsa_with_sha224:
>         case OID_id_ecdsa_with_sha256:
> @@ -289,34 +280,52 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t =
hdrlen,
>         case OID_id_ecdsa_with_sha3_256:
>         case OID_id_ecdsa_with_sha3_384:
>         case OID_id_ecdsa_with_sha3_512:
> -               ctx->sinfo->sig->pkey_algo =3D "ecdsa";
> -               ctx->sinfo->sig->encoding =3D "x962";
> +               sig->pkey_algo =3D "ecdsa";
> +               sig->encoding =3D "x962";
>                 break;
>         case OID_gost2012PKey256:
>         case OID_gost2012PKey512:
> -               ctx->sinfo->sig->pkey_algo =3D "ecrdsa";
> -               ctx->sinfo->sig->encoding =3D "raw";
> +               sig->pkey_algo =3D "ecrdsa";
> +               sig->encoding =3D "raw";
>                 break;
>         case OID_id_ml_dsa_44:
> -               ctx->sinfo->sig->pkey_algo =3D "mldsa44";
> -               ctx->sinfo->sig->encoding =3D "raw";
> -               ctx->sinfo->sig->algo_does_hash =3D true;
> +               sig->pkey_algo =3D "mldsa44";
> +               sig->encoding =3D "raw";
> +               sig->algo_does_hash =3D true;
>                 break;
>         case OID_id_ml_dsa_65:
> -               ctx->sinfo->sig->pkey_algo =3D "mldsa65";
> -               ctx->sinfo->sig->encoding =3D "raw";
> -               ctx->sinfo->sig->algo_does_hash =3D true;
> +               sig->pkey_algo =3D "mldsa65";
> +               sig->encoding =3D "raw";
> +               sig->algo_does_hash =3D true;
>                 break;
>         case OID_id_ml_dsa_87:
> -               ctx->sinfo->sig->pkey_algo =3D "mldsa87";
> -               ctx->sinfo->sig->encoding =3D "raw";
> -               ctx->sinfo->sig->algo_does_hash =3D true;
> +               sig->pkey_algo =3D "mldsa87";
> +               sig->encoding =3D "raw";
> +               sig->algo_does_hash =3D true;
>                 break;
>         default:
> -               printk("Unsupported pkey algo: %u\n", ctx->last_oid);
> +               pr_notice("Unsupported pkey algo: %u\n", ctx->last_oid);
>                 return -ENOPKG;
>         }
> +
> +out:
> +       ctx->algo_params =3D NULL;
> +       ctx->algo_params_size =3D 0;
>         return 0;
> +
> +rsassa_pss:
> +       if (!ctx->algo_params || !ctx->algo_params_size) {
> +               pr_debug("RSASSA-PSS sig algo without parameters\n");
> +               return -EBADMSG;
> +       }
> +
> +       err =3D rsassa_parse_sig_params(sig, ctx->algo_params, ctx->algo_=
params_size);
> +       if (err < 0)
> +               return err;
> +
> +       sig->pkey_algo =3D "rsa";
> +       sig->encoding =3D "emsa-pss";
> +       goto out;
>  }
>
>  /*
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys=
/public_key.c
> index 61dc4f626620..13a5616becaa 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -100,6 +100,16 @@ software_key_determine_akcipher(const struct public_=
key *pkey,
>                         }
>                         return n >=3D CRYPTO_MAX_ALG_NAME ? -EINVAL : 0;
>                 }
> +               if (strcmp(encoding, "emsa-pss") =3D=3D 0) {
> +                       if (op !=3D kernel_pkey_sign &&
> +                           op !=3D kernel_pkey_verify)
> +                               return -EINVAL;
> +                       *sig =3D true;
> +                       if (!hash_algo)
> +                               hash_algo =3D "none";
> +                       n =3D snprintf(alg_name, CRYPTO_MAX_ALG_NAME, "rs=
assa-pss");
> +                       return n >=3D CRYPTO_MAX_ALG_NAME ? -EINVAL : 0;
> +               }
>                 if (strcmp(encoding, "raw") !=3D 0)
>                         return -EINVAL;
>                 /*
> diff --git a/crypto/asymmetric_keys/rsassa_params.asn1 b/crypto/asymmetri=
c_keys/rsassa_params.asn1
> new file mode 100644
> index 000000000000..95a4e5f0dcd5
> --- /dev/null
> +++ b/crypto/asymmetric_keys/rsassa_params.asn1
> @@ -0,0 +1,25 @@
> +-- SPDX-License-Identifier: BSD-3-Clause
> +--
> +-- Copyright (C) 2009 IETF Trust and the persons identified as authors
> +-- of the code
> +--
> +--
> +-- https://datatracker.ietf.org/doc/html/rfc4055 Section 6.
> +
> +RSASSA-PSS-params ::=3D SEQUENCE {
> +       hashAlgorithm      [0] HashAlgorithm,
> +       maskGenAlgorithm   [1] MaskGenAlgorithm,
> +       saltLength         [2] INTEGER ({ rsassa_note_salt_length }),
> +       trailerField       [3] TrailerField OPTIONAL
> +}
> +
> +TrailerField ::=3D INTEGER ({ rsassa_note_trailer })
> +-- { trailerFieldBC(1) }
> +
> +HashAlgorithm ::=3D AlgorithmIdentifier ({ rsassa_note_hash_algo })
> +MaskGenAlgorithm ::=3D AlgorithmIdentifier ({ rsassa_note_maskgen_algo }=
)
> +
> +AlgorithmIdentifier ::=3D SEQUENCE {
> +       algorithm       OBJECT IDENTIFIER ({ rsassa_note_OID }),
> +       parameters      ANY OPTIONAL ({ rsassa_note_params })
> +}
> diff --git a/crypto/asymmetric_keys/rsassa_parser.c b/crypto/asymmetric_k=
eys/rsassa_parser.c
> new file mode 100644
> index 000000000000..8c598517f785
> --- /dev/null
> +++ b/crypto/asymmetric_keys/rsassa_parser.c
> @@ -0,0 +1,233 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* RSASSA-PSS ASN.1 parameter parser
> + *
> + * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
> + * Written by David Howells (dhowells@redhat.com)
> + */
> +
> +#define pr_fmt(fmt) "RSAPSS: "fmt
> +#include <linux/kernel.h>
> +#include <linux/slab.h>
> +#include <linux/err.h>
> +#include <linux/asn1.h>
> +#include <crypto/hash.h>
> +#include <crypto/hash_info.h>
> +#include <crypto/public_key.h>
> +#include "x509_parser.h"
> +#include "rsassa_parser.h"
> +#include "rsassa_params.asn1.h"
> +#include "mgf1_params.asn1.h"
> +
> +struct rsassa_parse_context {
> +       struct rsassa_parameters *rsassa;       /* The parsed parameters =
*/
> +       unsigned long   data;                   /* Start of data */
> +       const void      *params;                /* Algo parameters */
> +       unsigned int    params_len;             /* Length of algo paramet=
ers */
> +       enum OID        last_oid;               /* Last OID encountered *=
/
> +       enum OID        mgf1_last_oid;          /* Last OID encountered i=
n MGF1 */
> +};
> +
> +/*
> + * Parse an RSASSA parameter block.
> + */
> +struct rsassa_parameters *rsassa_params_parse(const void *data, size_t d=
atalen)
> +{
> +       struct rsassa_parse_context ctx =3D {};
> +       struct rsassa_parameters *rsassa __free(kfree);

Declare when initialised

> +       long ret;
> +
> +       rsassa =3D kzalloc(sizeof(*rsassa), GFP_KERNEL);
> +       if (!rsassa)
> +               return ERR_PTR(-ENOMEM);
> +
> +       ctx.rsassa =3D rsassa;
> +       ctx.data =3D (unsigned long)data;
> +
> +       /* Attempt to decode the parameters */
> +       ret =3D asn1_ber_decoder(&rsassa_params_decoder, &ctx, data, data=
len);
> +       if (ret < 0) {
> +               pr_debug("RSASSA parse failed %ld\n", ret);
> +               return ERR_PTR(ret);
> +       }
> +
> +       return no_free_ptr(rsassa);
> +}
> +
> +/*
> + * Note an OID when we find one for later processing when we know how
> + * to interpret it.
> + */
> +int rsassa_note_OID(void *context, size_t hdrlen, unsigned char tag,
> +                   const void *value, size_t vlen)
> +{
> +       struct rsassa_parse_context *ctx =3D context;
> +
> +       ctx->last_oid =3D look_up_OID(value, vlen);
> +       if (ctx->last_oid =3D=3D OID__NR) {
> +               char buffer[56];
> +               sprint_oid(value, vlen, buffer, sizeof(buffer));
> +               pr_debug("Unknown OID: %s\n", buffer);
> +       }
> +       return 0;
> +}
> +
> +/*
> + * Parse trailerField.  We only accept trailerFieldBC.
> +*/
> +int rsassa_note_trailer(void *context, size_t hdrlen, unsigned char tag,
> +                       const void *value, size_t vlen)
> +{
> +       if (vlen !=3D 1 || *(u8 *)value !=3D 0x01) {
> +               pr_debug("Unknown trailerField\n");
> +               return -EINVAL;
> +       }
> +       return 0;
> +}
> +
> +int rsassa_note_hash_algo(void *context, size_t hdrlen, unsigned char ta=
g,
> +                         const void *value, size_t vlen)
> +{
> +       struct rsassa_parse_context *ctx =3D context;
> +
> +       ctx->rsassa->hash_algo =3D ctx->last_oid;
> +       pr_debug("HASH-ALGO %u %u\n", ctx->rsassa->hash_algo, ctx->params=
_len);
> +       ctx->params =3D NULL;
> +       return 0;
> +}
> +
> +int rsassa_note_maskgen_algo(void *context, size_t hdrlen, unsigned char=
 tag,
> +                            const void *value, size_t vlen)
> +{
> +       struct rsassa_parse_context *ctx =3D context;
> +       int ret;
> +
> +       ctx->rsassa->maskgen_algo =3D ctx->last_oid;
> +       pr_debug("MGF-ALGO %u %u\n", ctx->rsassa->maskgen_algo, ctx->para=
ms_len);
> +
> +       switch (ctx->rsassa->maskgen_algo) {
> +       case OID_id_mgf1:
> +               if (!vlen) {
> +                       pr_debug("MGF1 missing parameters\n");
> +                       return -EBADMSG;
> +               }
> +
> +               ret =3D asn1_ber_decoder(&mgf1_params_decoder, ctx,
> +                                      ctx->params, ctx->params_len);
> +               if (ret < 0) {
> +                       pr_debug("MGF1 parse failed %d\n", ret);
> +                       return ret;
> +               }
> +               ctx->rsassa->maskgen_hash =3D ctx->mgf1_last_oid;
> +               break;
> +
> +       default:
> +               pr_debug("Unsupported MaskGenAlgorithm %d\n", ret);
> +               return -ENOPKG;
> +       }
> +
> +       ctx->params =3D NULL;
> +       return 0;
> +}
> +
> +int rsassa_note_salt_length(void *context, size_t hdrlen, unsigned char =
tag,
> +                           const void *value, size_t vlen)
> +{
> +       struct rsassa_parse_context *ctx =3D context;
> +       u32 salt_len =3D 0;
> +
> +       if (!vlen) {
> +               pr_debug("Salt len bad integer\n");
> +               return -EBADMSG;
> +       }
> +       if (vlen > 4) {
> +               pr_debug("Salt len too long %zu\n", vlen);
> +               return -EBADMSG;
> +       }
> +       if (((u8 *)value)[0] & 0x80) {
> +               pr_debug("Salt len negative\n");
> +               return -EBADMSG;
> +       }
> +
> +       for (size_t i =3D 0; i < vlen; i++) {
> +               salt_len <<=3D 8;
> +               salt_len |=3D ((u8 *)value)[i];
> +       }
> +
> +       ctx->rsassa->salt_len =3D salt_len;
> +       pr_debug("Salt-Len %u\n", salt_len);
> +       return 0;
> +}
> +
> +/*
> + * Extract arbitrary parameters.
> + */
> +int rsassa_note_params(void *context, size_t hdrlen, unsigned char tag,
> +                      const void *value, size_t vlen)
> +{
> +       struct rsassa_parse_context *ctx =3D context;
> +
> +       ctx->params     =3D value - hdrlen;
> +       ctx->params_len =3D vlen + hdrlen;
> +       return 0;
> +}
> +
> +/*
> + * Note an OID when we find one for later processing when we know how to
> + * interpret it.
> + */
> +int mgf1_note_OID(void *context, size_t hdrlen, unsigned char tag,
> +                 const void *value, size_t vlen)
> +{
> +       struct rsassa_parse_context *ctx =3D context;
> +
> +       ctx->mgf1_last_oid =3D look_up_OID(value, vlen);
> +       if (ctx->mgf1_last_oid =3D=3D OID__NR) {
> +               char buffer[56];
> +               sprint_oid(value, vlen, buffer, sizeof(buffer));
> +               pr_debug("Unknown MGF1 OID: %s\n", buffer);
> +       }
> +       return 0;
> +}
> +
> +/*
> + * Parse the signature parameter block and generate a suitable info stri=
ng from
> + * it.
> + */
> +int rsassa_parse_sig_params(struct public_key_signature *sig,
> +                           const u8 *sig_params, unsigned int sig_params=
_size)
> +{
> +       struct rsassa_parameters *rsassa __free(rsassa_params_free) =3D N=
ULL;

Declare when initialised or just flip the two declarations

> +       const char *mf, *mh;
> +
> +       rsassa =3D rsassa_params_parse(sig_params, sig_params_size);
> +       if (IS_ERR(rsassa))
> +               return PTR_ERR(rsassa);
> +
> +       sig->hash_algo =3D oid_to_hash(rsassa->hash_algo);
> +       if (!sig->hash_algo) {
> +               pr_notice("Unsupported hash: %u\n", rsassa->hash_algo);
> +               return -ENOPKG;
> +       }
> +
> +       switch (rsassa->maskgen_algo) {
> +       case OID_id_mgf1:
> +               mf =3D "mgf1";
> +               break;
> +       default:
> +               pr_notice("Unsupported maskgen algo: %u\n", rsassa->maskg=
en_algo);
> +               return -ENOPKG;
> +       }
> +
> +       mh =3D oid_to_hash(rsassa->maskgen_hash);
> +       if (!mh) {
> +               pr_notice("Unsupported MGF1 hash: %u\n", rsassa->maskgen_=
hash);
> +               return -ENOPKG;
> +       }
> +
> +       sig->info =3D kasprintf(GFP_KERNEL, "sighash=3D%s pss_mask=3D%s,%=
s pss_salt=3D%u",
> +                             sig->hash_algo, mf, mh, rsassa->salt_len);
> +       if (!sig->info)
> +               return -ENOMEM;
> +       pr_debug("Info string: %s\n", sig->info);
> +       return 0;
> +}
> diff --git a/crypto/asymmetric_keys/rsassa_parser.h b/crypto/asymmetric_k=
eys/rsassa_parser.h
> new file mode 100644
> index 000000000000..b80401a3de8f
> --- /dev/null
> +++ b/crypto/asymmetric_keys/rsassa_parser.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/* RSASSA-PSS parameter parsing context
> + *
> + * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
> + * Written by David Howells (dhowells@redhat.com)
> + */
> +
> +#include <linux/oid_registry.h>
> +
> +struct rsassa_parameters {
> +       enum OID        hash_algo;              /* Hash algorithm identif=
ier */
> +       enum OID        maskgen_algo;           /* Mask gen algorithm ide=
ntifier */
> +       enum OID        maskgen_hash;           /* Mask gen hash algorith=
m identifier */
> +       u32             salt_len;
> +};
> +
> +struct rsassa_parameters *rsassa_params_parse(const void *data, size_t d=
atalen);
> +int rsassa_parse_sig_params(struct public_key_signature *sig,
> +                           const u8 *sig_params, unsigned int sig_params=
_size);
> +
> +static inline void rsassa_params_free(struct rsassa_parameters *params)
> +{
> +       kfree(params);
> +}
> +DEFINE_FREE(rsassa_params_free,  struct rsassa_parameters*, rsassa_param=
s_free(_T))
> diff --git a/crypto/asymmetric_keys/x509.asn1 b/crypto/asymmetric_keys/x5=
09.asn1
> index feb9573cacce..453b72eba1fe 100644
> --- a/crypto/asymmetric_keys/x509.asn1
> +++ b/crypto/asymmetric_keys/x509.asn1
> @@ -29,7 +29,7 @@ CertificateSerialNumber ::=3D INTEGER
>
>  AlgorithmIdentifier ::=3D SEQUENCE {
>         algorithm               OBJECT IDENTIFIER ({ x509_note_OID }),
> -       parameters              ANY OPTIONAL ({ x509_note_params })
> +       parameters              ANY OPTIONAL ({ x509_note_algo_id_params =
})
>  }
>
>  Name ::=3D SEQUENCE OF RelativeDistinguishedName
> diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetri=
c_keys/x509_cert_parser.c
> index 5ab5b4e5f1b4..6c431bf181f2 100644
> --- a/crypto/asymmetric_keys/x509_cert_parser.c
> +++ b/crypto/asymmetric_keys/x509_cert_parser.c
> @@ -15,28 +15,7 @@
>  #include "x509_parser.h"
>  #include "x509.asn1.h"
>  #include "x509_akid.asn1.h"
> -
> -struct x509_parse_context {
> -       struct x509_certificate *cert;          /* Certificate being cons=
tructed */
> -       unsigned long   data;                   /* Start of data */
> -       const void      *key;                   /* Key data */
> -       size_t          key_size;               /* Size of key data */
> -       const void      *params;                /* Key parameters */
> -       size_t          params_size;            /* Size of key parameters=
 */
> -       enum OID        key_algo;               /* Algorithm used by the =
cert's key */
> -       enum OID        last_oid;               /* Last OID encountered *=
/
> -       enum OID        sig_algo;               /* Algorithm used to sign=
 the cert */
> -       u8              o_size;                 /* Size of organizationNa=
me (O) */
> -       u8              cn_size;                /* Size of commonName (CN=
) */
> -       u8              email_size;             /* Size of emailAddress *=
/
> -       u16             o_offset;               /* Offset of organization=
Name (O) */
> -       u16             cn_offset;              /* Offset of commonName (=
CN) */
> -       u16             email_offset;           /* Offset of emailAddress=
 */
> -       unsigned        raw_akid_size;
> -       const void      *raw_akid;              /* Raw authorityKeyId in =
ASN.1 */
> -       const void      *akid_raw_issuer;       /* Raw directoryName in a=
uthorityKeyId */
> -       unsigned        akid_raw_issuer_size;
> -};
> +#include "rsassa_parser.h"
>
>  /*
>   * Free an X.509 certificate
> @@ -104,15 +83,15 @@ struct x509_certificate *x509_cert_parse(const void =
*data, size_t datalen)
>
>         cert->pub->keylen =3D ctx->key_size;
>
> -       cert->pub->params =3D kmemdup(ctx->params, ctx->params_size, GFP_=
KERNEL);
> +       cert->pub->params =3D kmemdup(ctx->key_params, ctx->key_params_si=
ze, GFP_KERNEL);
>         if (!cert->pub->params)
>                 return ERR_PTR(-ENOMEM);
>
> -       cert->pub->paramlen =3D ctx->params_size;
> +       cert->pub->paramlen =3D ctx->key_params_size;
>         cert->pub->algo =3D ctx->key_algo;
>
>         /* Grab the signature bits */
> -       ret =3D x509_get_sig_params(cert);
> +       ret =3D x509_get_sig_params(cert, ctx);
>         if (ret < 0)
>                 return ERR_PTR(ret);
>
> @@ -146,7 +125,7 @@ int x509_note_OID(void *context, size_t hdrlen,
>
>         ctx->last_oid =3D look_up_OID(value, vlen);
>         if (ctx->last_oid =3D=3D OID__NR) {
> -               char buffer[50];
> +               char buffer[56];

I've seen this elsewhere in the crypto code (namely in ECC) but is it
generally a good idea to declare long buffers on the stack?

>                 sprint_oid(value, vlen, buffer, sizeof(buffer));
>                 pr_debug("Unknown OID: [%lu] %s\n",
>                          (unsigned long)value - ctx->data, buffer);
> @@ -179,6 +158,7 @@ int x509_note_sig_algo(void *context, size_t hdrlen, =
unsigned char tag,
>                        const void *value, size_t vlen)
>  {
>         struct x509_parse_context *ctx =3D context;
> +       int err;
>
>         pr_debug("PubKey Algo: %u\n", ctx->last_oid);
>
> @@ -210,6 +190,9 @@ int x509_note_sig_algo(void *context, size_t hdrlen, =
unsigned char tag,
>                 ctx->cert->sig->hash_algo =3D "sha1";
>                 goto ecdsa;
>
> +       case OID_id_rsassa_pss:
> +               goto rsassa_pss;
> +
>         case OID_id_rsassa_pkcs1_v1_5_with_sha3_256:
>                 ctx->cert->sig->hash_algo =3D "sha3-256";
>                 goto rsa_pkcs1;
> @@ -268,6 +251,24 @@ int x509_note_sig_algo(void *context, size_t hdrlen,=
 unsigned char tag,
>                 goto ml_dsa;
>         }
>
> +rsassa_pss:
> +       if (!ctx->algo_params || !ctx->algo_params_size) {
> +               pr_debug("RSASSA-PSS sig algo without parameters\n");
> +               return -EBADMSG;
> +       }
> +
> +       err =3D rsassa_parse_sig_params(ctx->cert->sig,
> +                                     ctx->algo_params, ctx->algo_params_=
size);
> +       if (err < 0)
> +               return err;
> +
> +       ctx->cert->sig->pkey_algo =3D "rsa";
> +       ctx->cert->sig->encoding =3D "emsa-pss";
> +       ctx->sig_algo =3D ctx->last_oid;
> +       ctx->algo_params =3D NULL;
> +       ctx->algo_params_size =3D 0;
> +       return 0;
> +
>  rsa_pkcs1:
>         ctx->cert->sig->pkey_algo =3D "rsa";
>         ctx->cert->sig->encoding =3D "pkcs1";
> @@ -324,8 +325,8 @@ int x509_note_signature(void *context, size_t hdrlen,
>                 vlen--;
>         }
>
> -       ctx->cert->raw_sig =3D value;
> -       ctx->cert->raw_sig_size =3D vlen;
> +       ctx->sig =3D value;
> +       ctx->sig_size =3D vlen;
>         return 0;
>  }
>
> @@ -479,23 +480,16 @@ int x509_note_subject(void *context, size_t hdrlen,
>  }
>
>  /*
> - * Extract the parameters for the public key
> + * Extract the parameters for an AlgorithmIdentifier.
>   */
> -int x509_note_params(void *context, size_t hdrlen,
> -                    unsigned char tag,
> -                    const void *value, size_t vlen)
> +int x509_note_algo_id_params(void *context, size_t hdrlen,
> +                            unsigned char tag,
> +                            const void *value, size_t vlen)
>  {
>         struct x509_parse_context *ctx =3D context;
>
> -       /*
> -        * AlgorithmIdentifier is used three times in the x509, we should=
 skip
> -        * first and ignore third, using second one which is after subjec=
t and
> -        * before subjectPublicKey.
> -        */
> -       if (!ctx->cert->raw_subject || ctx->key)
> -               return 0;
> -       ctx->params =3D value - hdrlen;
> -       ctx->params_size =3D vlen + hdrlen;
> +       ctx->algo_params =3D value - hdrlen;
> +       ctx->algo_params_size =3D vlen + hdrlen;
>         return 0;
>  }
>
> @@ -514,12 +508,28 @@ int x509_extract_key_data(void *context, size_t hdr=
len,
>         case OID_rsaEncryption:
>                 ctx->cert->pub->pkey_algo =3D "rsa";
>                 break;
> +       case OID_id_rsassa_pss:
> +               /* Parameters are optional for the key itself. */
> +               if (ctx->algo_params_size) {
> +                       struct rsassa_parameters *params __free(rsassa_pa=
rams_free) =3D NULL;
> +                       ctx->key_params =3D ctx->algo_params;
> +                       ctx->key_params_size =3D ctx->algo_params_size;
> +                       ctx->algo_params =3D NULL;
> +                       ctx->algo_params_size =3D 0;
> +
> +                       params =3D rsassa_params_parse(ctx->key_params, c=
tx->key_params_size);
> +                       if (IS_ERR(params))
> +                               return PTR_ERR(params);
> +                       break;
> +               }
> +               ctx->cert->pub->pkey_algo =3D "rsa";
> +               break;
>         case OID_gost2012PKey256:
>         case OID_gost2012PKey512:
>                 ctx->cert->pub->pkey_algo =3D "ecrdsa";
>                 break;
>         case OID_id_ecPublicKey:
> -               if (parse_OID(ctx->params, ctx->params_size, &oid) !=3D 0=
)
> +               if (parse_OID(ctx->algo_params, ctx->algo_params_size, &o=
id) !=3D 0)
>                         return -EBADMSG;
>
>                 switch (oid) {
> @@ -557,6 +567,8 @@ int x509_extract_key_data(void *context, size_t hdrle=
n,
>                 return -EBADMSG;
>         ctx->key =3D value + 1;
>         ctx->key_size =3D vlen - 1;
> +       ctx->algo_params =3D NULL;
> +       ctx->algo_params_size =3D 0;
>         return 0;
>  }
>
> diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_key=
s/x509_parser.h
> index 0688c222806b..be2e1f6cb9f5 100644
> --- a/crypto/asymmetric_keys/x509_parser.h
> +++ b/crypto/asymmetric_keys/x509_parser.h
> @@ -23,8 +23,6 @@ struct x509_certificate {
>         time64_t        valid_to;
>         const void      *tbs;                   /* Signed data */
>         unsigned        tbs_size;               /* Size of signed data */
> -       unsigned        raw_sig_size;           /* Size of signature */
> -       const void      *raw_sig;               /* Signature data */
>         const void      *raw_serial;            /* Raw serial number in A=
SN.1 */
>         unsigned        raw_serial_size;
>         unsigned        raw_issuer_size;
> @@ -41,6 +39,34 @@ struct x509_certificate {
>         bool            blacklisted;
>  };
>
> +struct x509_parse_context {
> +       struct x509_certificate *cert;          /* Certificate being cons=
tructed */
> +       unsigned long   data;                   /* Start of data */
> +       const void      *key;                   /* Key data */
> +       size_t          key_size;               /* Size of key data */
> +       const void      *algo_params;           /* AlgorithmIdentifier: p=
arameters */
> +       size_t          algo_params_size;       /* AlgorithmIdentifier: p=
arameters size */
> +       const void      *key_params;            /* Key parameters */
> +       size_t          key_params_size;        /* Size of key parameters=
 */
> +       const void      *sig_params;            /* Signature parameters *=
/
> +       unsigned int    sig_params_size;        /* Size of sig parameters=
 */
> +       unsigned int    sig_size;               /* Size of signature */
> +       const void      *sig;                   /* Signature data */
> +       enum OID        key_algo;               /* Algorithm used by the =
cert's key */
> +       enum OID        last_oid;               /* Last OID encountered *=
/
> +       enum OID        sig_algo;               /* Algorithm used to sign=
 the cert */
> +       u8              o_size;                 /* Size of organizationNa=
me (O) */
> +       u8              cn_size;                /* Size of commonName (CN=
) */
> +       u8              email_size;             /* Size of emailAddress *=
/
> +       u16             o_offset;               /* Offset of organization=
Name (O) */
> +       u16             cn_offset;              /* Offset of commonName (=
CN) */
> +       u16             email_offset;           /* Offset of emailAddress=
 */
> +       unsigned        raw_akid_size;
> +       const void      *raw_akid;              /* Raw authorityKeyId in =
ASN.1 */
> +       const void      *akid_raw_issuer;       /* Raw directoryName in a=
uthorityKeyId */
> +       unsigned        akid_raw_issuer_size;
> +};
> +
>  /*
>   * x509_cert_parser.c
>   */
> @@ -55,5 +81,6 @@ extern int x509_decode_time(time64_t *_t,  size_t hdrle=
n,
>  /*
>   * x509_public_key.c
>   */
> -extern int x509_get_sig_params(struct x509_certificate *cert);
> +extern const char *oid_to_hash(enum OID oid);
> +extern int x509_get_sig_params(struct x509_certificate *cert, struct x50=
9_parse_context *parse);
>  extern int x509_check_for_self_signed(struct x509_certificate *cert);
> diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric=
_keys/x509_public_key.c
> index 12e3341e806b..b2f8542accc4 100644
> --- a/crypto/asymmetric_keys/x509_public_key.c
> +++ b/crypto/asymmetric_keys/x509_public_key.c
> @@ -17,11 +17,32 @@
>  #include "asymmetric_keys.h"
>  #include "x509_parser.h"
>
> +/*
> + * Translate OIDs to hash algorithm names.
> + */
> +const char *oid_to_hash(enum OID oid)
> +{
> +       switch (oid) {
> +       case OID_sha1:                  return "sha1";
> +       case OID_sha256:                return "sha256";
> +       case OID_sha384:                return "sha384";
> +       case OID_sha512:                return "sha512";
> +       case OID_sha224:                return "sha224";
> +       case OID_sm3:                   return "sm3";
> +       case OID_gost2012Digest256:     return "streebog256";
> +       case OID_gost2012Digest512:     return "streebog512";
> +       case OID_sha3_256:              return "sha3-256";
> +       case OID_sha3_384:              return "sha3-384";
> +       case OID_sha3_512:              return "sha3-512";
> +       default:                        return NULL;
> +       }
> +}
> +
>  /*
>   * Set up the signature parameters in an X.509 certificate.  This involv=
es
>   * digesting the signed data and extracting the signature.
>   */
> -int x509_get_sig_params(struct x509_certificate *cert)
> +int x509_get_sig_params(struct x509_certificate *cert, struct x509_parse=
_context *parse)
>  {
>         struct public_key_signature *sig =3D cert->sig;
>         struct crypto_shash *tfm;
> @@ -31,11 +52,11 @@ int x509_get_sig_params(struct x509_certificate *cert=
)
>
>         pr_devel("=3D=3D>%s()\n", __func__);
>
> -       sig->s =3D kmemdup(cert->raw_sig, cert->raw_sig_size, GFP_KERNEL)=
;
> +       sig->s =3D kmemdup(parse->sig, parse->sig_size, GFP_KERNEL);
>         if (!sig->s)
>                 return -ENOMEM;
>
> -       sig->s_size =3D cert->raw_sig_size;
> +       sig->s_size =3D parse->sig_size;
>
>         /* Allocate the hashing algorithm we're going to need and find ou=
t how
>          * big the hash operational data will be.
> @@ -43,6 +64,7 @@ int x509_get_sig_params(struct x509_certificate *cert)
>         tfm =3D crypto_alloc_shash(sig->hash_algo, 0, 0);
>         if (IS_ERR(tfm)) {
>                 if (PTR_ERR(tfm) =3D=3D -ENOENT) {
> +                       pr_debug("Unsupported hash %s\n", sig->hash_algo)=
;
>                         cert->unsupported_sig =3D true;
>                         return 0;
>                 }
> diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
> index 30821a6a4f72..d546ea7999b9 100644
> --- a/include/linux/oid_registry.h
> +++ b/include/linux/oid_registry.h
> @@ -31,6 +31,8 @@ enum OID {
>         /* PKCS#1 {iso(1) member-body(2) us(840) rsadsi(113549) pkcs(1) p=
kcs-1(1)} */
>         OID_rsaEncryption,              /* 1.2.840.113549.1.1.1 */
>         OID_sha1WithRSAEncryption,      /* 1.2.840.113549.1.1.5 */
> +       OID_id_mgf1,                    /* 1.2.840.113549.1.1.8 */
> +       OID_id_rsassa_pss,              /* 1.2.840.113549.1.1.10 */
>         OID_sha256WithRSAEncryption,    /* 1.2.840.113549.1.1.11 */
>         OID_sha384WithRSAEncryption,    /* 1.2.840.113549.1.1.12 */
>         OID_sha512WithRSAEncryption,    /* 1.2.840.113549.1.1.13 */
>

Ignat

