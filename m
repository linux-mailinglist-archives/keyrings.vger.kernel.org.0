Return-Path: <keyrings+bounces-3829-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG/ADM2xb2nMKgAAu9opvQ
	(envelope-from <keyrings+bounces-3829-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 17:48:13 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6674247EC7
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 17:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B693983962
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 14:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8564A44CAE0;
	Tue, 20 Jan 2026 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="dYa1swNP"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C92343E9F4
	for <keyrings@vger.kernel.org>; Tue, 20 Jan 2026 14:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768919967; cv=pass; b=XiiySuW+zBu0LM26W8MSEVEQt8O85w5m7ckiG5Apr2Ynpe5kQ4nDpHck1JerKzXQzBNAH410idbAq7718i9MMarSVBJb4Wq9fZQs67iI3i18Dv8mZ22Q9pqjVaVz/uVW7GYYXicoCNCgY5qt9s8qS6ypQe06MlcmfyH4EgNe2N4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768919967; c=relaxed/simple;
	bh=rT22JTToowB3/PLnWrTVqxf+RaL8JqD5rOwaSxDIikg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uB5M78Lrt9Z6rwf5EkMdCJlx4PEK38uVsbg+8QI12OWmc+F0YKojvaUmdYzuO1LUL/lj48RZXbqETc0k2icH2Dq173npePXlXKd64UlKgLe3nksI9tPQojbzY4yTghEY62NrchNSPd04vYmDg2urQFmPw+1pE2HHfUILSAyHwH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=dYa1swNP; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59b6c13b68dso5723264e87.0
        for <keyrings@vger.kernel.org>; Tue, 20 Jan 2026 06:39:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768919961; cv=none;
        d=google.com; s=arc-20240605;
        b=G4XFOemwzPs+hDgBcRpBcQEOeeAce7zUPv2ph4eMRvWbMP1wM5k3++5/UoGOv2PLpA
         VSJRa2uPbnqd5yWUkvkMnn8B7/kGaqHytp0CFOxCtVTOC9lnAcdElu+tPn0MnC/LKLc0
         eEu8CaT866sk8cqBpAzi0KRb5dDOpiVWIH4wfQ0zMezlxP8dRMGJh9gUixwzrJ3Ahnik
         cg5cMFzWkweznxGyazAxoxa6AuOqR87j8/0YZqoUga4ATOPDO46azAqlERIkOxaJJzYT
         IyHKRsotml9G01orh/FArAdohr4Q1mbmdvoNbNiGIBV7lf//xtFUbhQj3lRvUTPz/SmI
         8rSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9gkt9EkwsojjZjwJhpIU5MWw/73AVx89YlTkANANrcY=;
        fh=QgStVdYayqZbwFz5nBmdA7fMd9vOd0L1crGjc04AVRs=;
        b=BSP2woLwLrEWWlEl4mJE3xJmpYTtVhxdVY09xpbnxuDrLvqBivwDuSidPouG9R+XKl
         p9GAZk7iKD8WaBXeZHIUs1GMu+zDqtxXpHncqAiwnNK1NnuEe6BeST6HivCjOzSgJfj+
         OatHp9T9dbcM75mhD2neJLYFH8m/nZTch2No4Qwy4bHC7KO3hyPrLy8OQWmKS5ECkeCO
         4W9UQjhnVm3RPyvil/4a/KwxJ593Uivyxfk4Uz+Trl0FZzJW+vy0oO51szaBvyRS5Xch
         y1nQ1RmQCkdz+CMGKrDI0iyKcwNNrFIMcweQbBerVGXeaClSCl1OGQFpL43IdmO+zd1K
         37FQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1768919961; x=1769524761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gkt9EkwsojjZjwJhpIU5MWw/73AVx89YlTkANANrcY=;
        b=dYa1swNPSHl9/vq7Iot74AleGLaqRflj94WJaPnENAlfhWji6VX1xbxhOvBTvfzg5C
         eGO5AFO/G1jxz/OjqVspKw4Gv3hLe7EaRaCEmXwoDW5cee4ccrFcv1sZ0ZIUqxvSJ0zN
         Z+YXOjxyS2UcICiLNKHqOKmnW3nvMSfYLTkdr4oFeyDTaMvZgdHuXylP9zaXxnbKgZng
         NXaJLIy6uHrPhJmDlQRYLCKf+29e+0D+Mor1XfKe+TantilxWgawub0yoS1+m/1598ho
         76dje8YuyCibM8+fwTcx43n/KqvkUOALFLFppuV/NKNofBv/1U62kyIKaeliz8nbcERc
         mVfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768919961; x=1769524761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9gkt9EkwsojjZjwJhpIU5MWw/73AVx89YlTkANANrcY=;
        b=SbWW8sksCbQmL4Bmf8kZX7ToSDAZ/othcYdc5svq7jsA6oNCXQrxlXCj7D1E2THSZr
         Dask+koFEhDkpLYdc6O8OcSv1w70J2/ZrME9QZ0h6qaidZ91HBrX/jGH2bTMQ3QIIeeK
         CTFlBVb6yRPBLesAKWF1b1pVTyx+8941y7CXoXH0uVGP+U6yz/jLuS7r7ynw4AKpdJhm
         FMp0uELyas6vR47exxQCTUfUimMW2vf1zW4KBp1SvkGxuUd584JuZI+AiWQVrUHRaUa4
         crTsbYhWVe/fcSnms2QtAsG9uf+rKUOpeE7LZU4IRhA6LUi598mPY3VZ/yLcTqhgDJQY
         9luQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlc6hwwT2VTh0szv5eDYNvHtcWGONLd9ELHf2oBkPgxvk3Wpie2mmuabs1QV7LptnpdgdshS5UHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiM+hTEn+SfVeI/k0qUopoApeoPuNQEIZuzVxfjfJhs2AdklRm
	2XxtkLuh/2PwIpS0FpnQmBiMstp0WDjXxpsi7qlnkA9mi3oU5loXHi+XHmzeLPT/RQlfyU/d2JL
	rPeLnzULl+NZ0XyNJwSyCHo6bL3OiGywBkuPfKi89nw==
X-Gm-Gg: AZuq6aLH5Gfi06Qtxqx/0yNwmY8TagUvYg90tTKBGqKAv7nm3Wqa9xgzfzNdIt8Wa6i
	cRqoQkXYneq1CEFuEt2/hRhWzjstv8+mwkhuAIR2rH2gxbz2j/qAQl2bNIpU5Rf1JnPMHmoGBzF
	JtwsysvtNz9wkfYPmXhqbOdu6iEObB9PvoUOdIehIMOFWIogRXa11RrI29fpccpbBDiJymfRFQm
	tkPFgW+MCud+YGeMXg09JJZKHK8pW0MdqdiDHScxY0qUODSGP3DDz2w7Dnzq6U4ceQcjjjuVQcX
	15kViNPi2o4=
X-Received: by 2002:a05:651c:a051:b0:383:210a:7b38 with SMTP id
 38308e7fff4ca-3836f0de3dbmr47898591fa.22.1768919961021; Tue, 20 Jan 2026
 06:39:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115215100.312611-1-dhowells@redhat.com> <20260115215100.312611-9-dhowells@redhat.com>
In-Reply-To: <20260115215100.312611-9-dhowells@redhat.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 20 Jan 2026 14:39:07 +0000
X-Gm-Features: AZwV_QjAjFqU2TbzRncQGxLNRWjHFYQuo4zN5t1INkl0GKP0jGO8PApxoRLgciQ
Message-ID: <CALrw=nENf3T=8MHPpt-wdneLupkzADpgDuHA6Gni_=C5-o_MjQ@mail.gmail.com>
Subject: Re: [PATCH v12 08/10] pkcs7, x509: Add RSASSA-PSS support
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
X-Spamd-Result: default: False [-8.96 / 15.00];
	WHITELIST_DMARC(-7.00)[cloudflare.com:D:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[cloudflare.com:s=google09082023];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3829-lists,keyrings=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[cloudflare.com,reject];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[cloudflare.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ignat@cloudflare.com,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[keyrings];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wunner.de:email,cloudflare.com:email,cloudflare.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 6674247EC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi David,

On Thu, Jan 15, 2026 at 9:52=E2=80=AFPM David Howells <dhowells@redhat.com>=
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
>  crypto/asymmetric_keys/pkcs7_parser.c     | 114 +++++-----
>  crypto/asymmetric_keys/public_key.c       |  10 +
>  crypto/asymmetric_keys/rsassa_params.asn1 |  25 +++
>  crypto/asymmetric_keys/rsassa_parser.c    | 240 ++++++++++++++++++++++
>  crypto/asymmetric_keys/rsassa_parser.h    |  25 +++
>  crypto/asymmetric_keys/x509.asn1          |   2 +-
>  crypto/asymmetric_keys/x509_cert_parser.c | 100 ++++-----
>  crypto/asymmetric_keys/x509_parser.h      |  45 +++-
>  crypto/asymmetric_keys/x509_public_key.c  |  36 +++-
>  include/linux/oid_registry.h              |   2 +
>  13 files changed, 503 insertions(+), 122 deletions(-)
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
> index 90c36fe1b5ed..47d3c1920e8f 100644
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
> @@ -28,14 +29,16 @@ struct pkcs7_parse_context {
>         struct x509_certificate **ppcerts;
>         unsigned long   data;                   /* Start of data */
>         enum OID        last_oid;               /* Last OID encountered *=
/
> -       unsigned        x509_index;
> -       unsigned        sinfo_index;
> +       unsigned int    x509_index;
> +       unsigned int    sinfo_index;
> +       unsigned int    algo_params_size;
> +       const void      *algo_params;
>         const void      *raw_serial;
> -       unsigned        raw_serial_size;
> -       unsigned        raw_issuer_size;
> +       unsigned int    raw_serial_size;
> +       unsigned int    raw_issuer_size;
>         const void      *raw_issuer;
>         const void      *raw_skid;
> -       unsigned        raw_skid_size;
> +       unsigned int    raw_skid_size;
>         bool            expect_skid;
>  };
>
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
> @@ -275,11 +262,21 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t =
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
> +               break;
> +       case OID_id_rsassa_pss:
> +               err =3D rsassa_parse_sig_params(sig, ctx->algo_params,
> +                                             ctx->algo_params_size);
> +               if (err < 0)
> +                       return err;
> +               sig->pkey_algo =3D "rsa";
> +               sig->encoding =3D "emsa-pss";
>                 break;
>         case OID_id_ecdsa_with_sha1:
>         case OID_id_ecdsa_with_sha224:
> @@ -289,33 +286,36 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t =
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
> +       ctx->algo_params =3D NULL;
> +       ctx->algo_params_size =3D 0;
>         return 0;
>  }
>
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
> index 000000000000..b80720fa94be
> --- /dev/null
> +++ b/crypto/asymmetric_keys/rsassa_parser.c
> @@ -0,0 +1,240 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/* RSASSA-PSS ASN.1 parameter parser
> + *
> + * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
> + * Written by David Howells (dhowells@redhat.com)
> + */
> +
> +#define pr_fmt(fmt) "RSASSA-PSS: "fmt
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
> +       long ret;
> +
> +       struct rsassa_parameters *rsassa __free(kfree) =3D

Did you mean to use the newly added rsassa_params_free() here?

> +               kzalloc(sizeof(*rsassa), GFP_KERNEL);
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
> +
> +               sprint_oid(value, vlen, buffer, sizeof(buffer));
> +               pr_debug("Unknown OID: %s\n", buffer);
> +       }
> +       return 0;
> +}
> +
> +/*
> + * Parse trailerField.  We only accept trailerFieldBC.
> + */
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
> +
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
> +       const char *mf, *mh;
> +
> +       if (!sig_params || !sig_params_size) {
> +               pr_debug("sig algo without parameters\n");
> +               return -EBADMSG;
> +       }
> +
> +       struct rsassa_parameters *rsassa __free(rsassa_params_free) =3D
> +               rsassa_params_parse(sig_params, sig_params_size);
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

So you use plain kfree() in one instance and this custom free
definition in another. We should probably pick one. What is the idea
behind this custom rsassa_params_free(), if it just calls into
kfree()?

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
> index 5ab5b4e5f1b4..a4b848628e37 100644
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
> @@ -60,12 +39,11 @@ EXPORT_SYMBOL_GPL(x509_free_certificate);
>   */
>  struct x509_certificate *x509_cert_parse(const void *data, size_t datale=
n)
>  {
> -       struct x509_certificate *cert __free(x509_free_certificate) =3D N=
ULL;
> -       struct x509_parse_context *ctx __free(kfree) =3D NULL;

Thank you for fixing this.

>         struct asymmetric_key_id *kid;
>         long ret;
>
> -       cert =3D kzalloc(sizeof(struct x509_certificate), GFP_KERNEL);
> +       struct x509_certificate *cert __free(x509_free_certificate) =3D
> +               kzalloc(sizeof(struct x509_certificate), GFP_KERNEL);
>         if (!cert)
>                 return ERR_PTR(-ENOMEM);
>         cert->pub =3D kzalloc(sizeof(struct public_key), GFP_KERNEL);
> @@ -74,7 +52,9 @@ struct x509_certificate *x509_cert_parse(const void *da=
ta, size_t datalen)
>         cert->sig =3D kzalloc(sizeof(struct public_key_signature), GFP_KE=
RNEL);
>         if (!cert->sig)
>                 return ERR_PTR(-ENOMEM);
> -       ctx =3D kzalloc(sizeof(struct x509_parse_context), GFP_KERNEL);
> +
> +       struct x509_parse_context *ctx __free(kfree) =3D
> +               kzalloc(sizeof(struct x509_parse_context), GFP_KERNEL);
>         if (!ctx)
>                 return ERR_PTR(-ENOMEM);
>
> @@ -104,15 +84,15 @@ struct x509_certificate *x509_cert_parse(const void =
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
> @@ -146,7 +126,7 @@ int x509_note_OID(void *context, size_t hdrlen,
>
>         ctx->last_oid =3D look_up_OID(value, vlen);
>         if (ctx->last_oid =3D=3D OID__NR) {
> -               char buffer[50];
> +               char buffer[56];
>                 sprint_oid(value, vlen, buffer, sizeof(buffer));
>                 pr_debug("Unknown OID: [%lu] %s\n",
>                          (unsigned long)value - ctx->data, buffer);
> @@ -179,6 +159,7 @@ int x509_note_sig_algo(void *context, size_t hdrlen, =
unsigned char tag,
>                        const void *value, size_t vlen)
>  {
>         struct x509_parse_context *ctx =3D context;
> +       int err;
>
>         pr_debug("PubKey Algo: %u\n", ctx->last_oid);
>
> @@ -210,6 +191,9 @@ int x509_note_sig_algo(void *context, size_t hdrlen, =
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
> @@ -268,6 +252,19 @@ int x509_note_sig_algo(void *context, size_t hdrlen,=
 unsigned char tag,
>                 goto ml_dsa;
>         }
>
> +rsassa_pss:
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
> @@ -324,8 +321,8 @@ int x509_note_signature(void *context, size_t hdrlen,
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
> @@ -479,23 +476,16 @@ int x509_note_subject(void *context, size_t hdrlen,
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
> @@ -514,12 +504,28 @@ int x509_extract_key_data(void *context, size_t hdr=
len,
>         case OID_rsaEncryption:
>                 ctx->cert->pub->pkey_algo =3D "rsa";
>                 break;
> +       case OID_id_rsassa_pss:
> +               /* Parameters are optional for the key itself. */
> +               if (ctx->algo_params_size) {
> +                       ctx->key_params =3D ctx->algo_params;
> +                       ctx->key_params_size =3D ctx->algo_params_size;
> +                       ctx->algo_params =3D NULL;
> +                       ctx->algo_params_size =3D 0;
> +
> +                       struct rsassa_parameters *params __free(rsassa_pa=
rams_free) =3D
> +                               rsassa_params_parse(ctx->key_params, ctx-=
>key_params_size);
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
> @@ -557,6 +563,8 @@ int x509_extract_key_data(void *context, size_t hdrle=
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
> index 0688c222806b..578de49c37bc 100644
> --- a/crypto/asymmetric_keys/x509_parser.h
> +++ b/crypto/asymmetric_keys/x509_parser.h
> @@ -22,18 +22,16 @@ struct x509_certificate {
>         time64_t        valid_from;
>         time64_t        valid_to;
>         const void      *tbs;                   /* Signed data */
> -       unsigned        tbs_size;               /* Size of signed data */
> -       unsigned        raw_sig_size;           /* Size of signature */
> -       const void      *raw_sig;               /* Signature data */
> +       unsigned int    tbs_size;               /* Size of signed data */
>         const void      *raw_serial;            /* Raw serial number in A=
SN.1 */
> -       unsigned        raw_serial_size;
> -       unsigned        raw_issuer_size;
> +       unsigned int    raw_serial_size;
> +       unsigned int    raw_issuer_size;
>         const void      *raw_issuer;            /* Raw issuer name in ASN=
.1 */
>         const void      *raw_subject;           /* Raw subject name in AS=
N.1 */
> -       unsigned        raw_subject_size;
> -       unsigned        raw_skid_size;
> +       unsigned int    raw_subject_size;
> +       unsigned int    raw_skid_size;
>         const void      *raw_skid;              /* Raw subjectKeyId in AS=
N.1 */
> -       unsigned        index;
> +       unsigned int    index;
>         bool            seen;                   /* Infinite recursion pre=
vention */
>         bool            verified;
>         bool            self_signed;            /* T if self-signed (chec=
k unsupported_sig too) */
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
> +       unsigned int    raw_akid_size;
> +       const void      *raw_akid;              /* Raw authorityKeyId in =
ASN.1 */
> +       const void      *akid_raw_issuer;       /* Raw directoryName in a=
uthorityKeyId */
> +       unsigned int    akid_raw_issuer_size;
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
> index 2243add11d48..4490cfa368a3 100644
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
> @@ -149,13 +171,12 @@ int x509_check_for_self_signed(struct x509_certific=
ate *cert)
>   */
>  static int x509_key_preparse(struct key_preparsed_payload *prep)
>  {
> -       struct x509_certificate *cert __free(x509_free_certificate) =3D N=
ULL;
> -       struct asymmetric_key_ids *kids __free(kfree) =3D NULL;
>         char *p, *desc __free(kfree) =3D NULL;
>         const char *q;
>         size_t srlen, sulen;
>
> -       cert =3D x509_cert_parse(prep->data, prep->datalen);
> +       struct x509_certificate *cert __free(x509_free_certificate) =3D
> +               x509_cert_parse(prep->data, prep->datalen);
>         if (IS_ERR(cert))
>                 return PTR_ERR(cert);
>
> @@ -198,7 +219,8 @@ static int x509_key_preparse(struct key_preparsed_pay=
load *prep)
>         p =3D bin2hex(p, q, srlen);
>         *p =3D 0;
>
> -       kids =3D kmalloc(sizeof(struct asymmetric_key_ids), GFP_KERNEL);
> +       struct asymmetric_key_ids *kids __free(kfree) =3D
> +               kmalloc(sizeof(struct asymmetric_key_ids), GFP_KERNEL);
>         if (!kids)
>                 return -ENOMEM;
>         kids->id[0] =3D cert->id;
> diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
> index ebce402854de..7fe168f54a6c 100644
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

