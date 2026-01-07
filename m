Return-Path: <keyrings+bounces-3742-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4312CCFF47E
	for <lists+keyrings@lfdr.de>; Wed, 07 Jan 2026 19:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D46F130C556C
	for <lists+keyrings@lfdr.de>; Wed,  7 Jan 2026 16:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9249136C0AB;
	Wed,  7 Jan 2026 16:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="GWYT5nx1"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D261539E171
	for <keyrings@vger.kernel.org>; Wed,  7 Jan 2026 16:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803931; cv=none; b=u0DX/sqELxAv3vPfIIzSwaU7DRByYqVHw3lPHTHtiEAoUNh2YuC74oaXssrrkP4Mv+/MNys/wV5mAKBU+fR2RYKrHTEJ6dgjRDzlSUR+pIetMzxROGfrZ93JtDw3anN+n2gcgwhAT7b0LPozS/YYCYLKKkS0G0DjT8CGnFI4ba4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803931; c=relaxed/simple;
	bh=fRsEUwtHorbtdkW1jrhWLB7v+CG3d0JqqtIPkpcXTO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bIVU+W1D951502MVwl41Z9ewNDrTqMPGej13S1T7y69fcMQROY1+vS0kOJDhfm1z2F4+/nXKHlEisonYhqZPX+PvUj7vVAgzQnLn8IhrSFxC2H04PmzFsyKqu5TUde/h7Yf5omxmBtcwkaHLmFAaeQerlww5qdNGeblabqCygkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=GWYT5nx1; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-598f59996aaso2692953e87.1
        for <keyrings@vger.kernel.org>; Wed, 07 Jan 2026 08:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1767803918; x=1768408718; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kW846dKKsvB937IYHg57MK2wxwUFHhgVJ3+JvFFPElU=;
        b=GWYT5nx1llV/EqfT4RHaicIR7DWQtgQWlM4MD41cV13TQzyXKOY6iIvNneHhNIz0l/
         XtRYEgEXhABOna1O1qkZuGF1YOHz+Fmaagzeo1ZrJOMnbYoYXi3YsKKw7FVFVY7K6Exv
         ya67yUf6xx5g5L5fr9Qma8xViIoVKFCIvSSOfnoZhbj/nuBcXXxCxF9bDSxk6ma0ePp/
         tcBjKgDX9xPe+Duydnu2ogF0FdFvwtmuDu0a8KsXevk/v3dvnA2QZSJgw3U4QbJuZXjm
         Kl1qRNEx6KjFI3kZxnFev8+lunxJCJH5jnYTxNvPuABEA/R0OV0slKHFYK0h+lPvIcrs
         uY5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803918; x=1768408718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kW846dKKsvB937IYHg57MK2wxwUFHhgVJ3+JvFFPElU=;
        b=Ru2X6hNAVjGekYVV/Q0/47AIIjc4/YGFodxoOdYpPPpUM3lOGS1EglqU7oVhbzRInG
         hCFQZKWhuWrrBwg1Alrhou/FfnRnfGC7tR8NC1R8CocIH8MzFeilQgqk11o24L21YnU+
         mR01JtvarODw7lxDPF6zEBVdhIyKEptNmv75LGHL82tJDZrrfOUlpJtTCiH3AoSrOsTl
         05dR97hlLG/UiXzOZafZd6nVOz6D4P50RJ4bYnKvgCcriF1ZeRKk1PzTJMzVUfEMovg4
         8Ytgdc9tdu9V2xZs4HjkwAYtspN9cuEZYjYRHpz9+L+ky7joBuCPpIEboQyr7U6Vhbp5
         XlJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvVnV6Iw2T4Jl3Y4SsGKAHTmHoc81qz968e+Szgwm8P5W9mZ3XoQzWRyPnonDq1ODG0zEkQUjW0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFVS1i3mVP6+cupd5JhwI1x22DfP07Gaxl2nqNlkaaKAGlI+cI
	sEE1Tda/raR5wJdbF+XRsLk9O2mY28LhlMzTM70MNl0Nlnb2eBOgszTsQs4/zm+n0bMG4reObSL
	5X5TZORYW+ZV//wwi1aB29o7cUf+Jgvy1/p8mrgjiiA==
X-Gm-Gg: AY/fxX6YOO1jdJ9kXi+jQFhYvgtqwYRH8pabbHCrgdqd/vDyEs6lsOYtf7YSvoUNyEB
	YINYMsyFjYBf85/yuzhRyUC4tr4Pu+oWpQURyaxMpg9DQ8U/VHqu1HI4jkKzTdeZl7vzgSFFXGx
	r1LKMJi9GFxt0oBB9KDp6b94LyOoAk8YpyJyvtepo9QBcWja1jo4LUQLXxWSvf/7BdtEb09X+rS
	6bTyTXCOzu5CrxCLwIQj6bkNBEHW52puV+qsYmnNYCw4GYF5kKH++rhm3rXFht7sJS0AtCnfLNI
	o443/jZCtyB/ig==
X-Google-Smtp-Source: AGHT+IGLoWHGzRMHY6PpbgP44tMsQvOWECFXE6pLJTWOIJxsRLSDUETFtqlqqwHRUPWy9MfLR1uDc+QiEDzeOSFRbv4=
X-Received: by 2002:ac2:4e12:0:b0:594:2e7b:6f9 with SMTP id
 2adb3069b0e04-59b6f047f08mr1233343e87.27.1767803918457; Wed, 07 Jan 2026
 08:38:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105152145.1801972-1-dhowells@redhat.com> <20260105152145.1801972-9-dhowells@redhat.com>
In-Reply-To: <20260105152145.1801972-9-dhowells@redhat.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 7 Jan 2026 16:38:27 +0000
X-Gm-Features: AQt7F2p43GDavepwZCl172aMay7N5leyGJ_l1NOUP-m5QhxfdGJ64MkgnawivDo
Message-ID: <CALrw=nEkbXMLfTR9tHLZchz-UsdzCQK_27QJYv=LuEOX2=6TBQ@mail.gmail.com>
Subject: Re: [PATCH v11 8/8] modsign: Enable RSASSA-PSS module signing
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

On Mon, Jan 5, 2026 at 3:22=E2=80=AFPM David Howells <dhowells@redhat.com> =
wrote:
>
> Add support for RSASSA-PSS signatures (RFC8017) for use with module signi=
ng
> and other public key cryptography done by the kernel.
>
> Note that only signature verification is supported by the kernel.
>
> Note further that this alters some of the same code as the MLDSA support,
> so that needs to be applied first to avoid conflicts.
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Lukas Wunner <lukas@wunner.de>
> cc: Ignat Korchagin <ignat@cloudflare.com>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: keyrings@vger.kernel.org
> cc: linux-crypto@vger.kernel.org
> ---
>  certs/Kconfig       |  6 ++++++
>  certs/Makefile      |  1 +
>  scripts/sign-file.c | 39 +++++++++++++++++++++++++++++++++++++--
>  3 files changed, 44 insertions(+), 2 deletions(-)
>
> diff --git a/certs/Kconfig b/certs/Kconfig
> index 94b086684d07..beb8991ad761 100644
> --- a/certs/Kconfig
> +++ b/certs/Kconfig
> @@ -27,6 +27,12 @@ config MODULE_SIG_KEY_TYPE_RSA
>         help
>          Use an RSA key for module signing.
>
> +config MODULE_SIG_KEY_TYPE_RSASSA_PSS
> +       bool "RSASSA-PSS"
> +       select CRYPTO_RSA
> +       help
> +        Use an RSASSA-PSS key for module signing.
> +
>  config MODULE_SIG_KEY_TYPE_ECDSA
>         bool "ECDSA"
>         select CRYPTO_ECDSA
> diff --git a/certs/Makefile b/certs/Makefile
> index 3ee1960f9f4a..3b5a3a303f4c 100644
> --- a/certs/Makefile
> +++ b/certs/Makefile
> @@ -42,6 +42,7 @@ targets +=3D x509_certificate_list
>  # boolean option and we unfortunately can't make it depend on !RANDCONFI=
G.
>  ifeq ($(CONFIG_MODULE_SIG_KEY),certs/signing_key.pem)
>
> +keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_RSASSA_PSS) :=3D -newkey rsassa-pss
>  keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_ECDSA) :=3D -newkey ec -pkeyopt ec_=
paramgen_curve:secp384r1
>  keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_44) :=3D -newkey ml-dsa-44
>  keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_65) :=3D -newkey ml-dsa-65
> diff --git a/scripts/sign-file.c b/scripts/sign-file.c
> index b726581075f9..ca605095194e 100644
> --- a/scripts/sign-file.c
> +++ b/scripts/sign-file.c
> @@ -233,6 +233,7 @@ int main(int argc, char **argv)
>         EVP_PKEY *private_key;
>  #ifndef USE_PKCS7
>         CMS_ContentInfo *cms =3D NULL;
> +       CMS_SignerInfo *signer;
>         unsigned int use_keyid =3D 0;
>  #else
>         PKCS7 *pkcs7 =3D NULL;
> @@ -329,13 +330,47 @@ int main(int argc, char **argv)
>                     !EVP_PKEY_is_a(private_key, "ML-DSA-65") &&
>                     !EVP_PKEY_is_a(private_key, "ML-DSA-87"))
>                         flags |=3D use_signed_attrs;
> +               if (EVP_PKEY_is_a(private_key, "RSASSA-PSS"))
> +                       flags |=3D CMS_KEY_PARAM;
> +       if (EVP_PKEY_is_a(private_key, "RSASSA-PSS")) {
> +                       EVP_PKEY_CTX *pkctx;
> +                       char mdname[1024] =3D {};
> +
> +                       pkctx =3D EVP_PKEY_CTX_new(private_key, NULL);
> +
> +                       ERR(!EVP_PKEY_sign_init(pkctx), "EVP_PKEY_sign_in=
it");
> +                       ERR(!EVP_PKEY_CTX_set_rsa_padding(pkctx, RSA_PKCS=
1_PSS_PADDING),
> +                           "EVP_PKEY_CTX_set_rsa_padding");
> +                       ERR(!EVP_PKEY_CTX_set_rsa_mgf1_md_name(pkctx, has=
h_algo, NULL),
> +                           "EVP_PKEY_CTX_set_rsa_mgf1_md_name");
> +
> +                       ERR(!EVP_PKEY_CTX_get_rsa_mgf1_md_name(pkctx, mdn=
ame, sizeof(mdname)),
> +                           "EVP_PKEY_CTX_get_rsa_mgf1_md_name");
> +                       printf("RSASSA-PSS %s\n", mdname);
> +               }
>
>                 /* Load the signature message from the digest buffer. */
>                 cms =3D CMS_sign(NULL, NULL, NULL, NULL, flags);
>                 ERR(!cms, "CMS_sign");
>
> -               ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo,=
 flags),
> -                   "CMS_add1_signer");
> +               signer =3D CMS_add1_signer(cms, x509, private_key, digest=
_algo, flags);
> +               ERR(!signer, "CMS_add1_signer");
> +
> +               if (EVP_PKEY_is_a(private_key, "RSASSA-PSS")) {
> +                       EVP_PKEY_CTX *pkctx;
> +                       char mdname[1024] =3D {};
> +
> +                       pkctx =3D CMS_SignerInfo_get0_pkey_ctx(signer);
> +                       ERR(!EVP_PKEY_CTX_set_rsa_padding(pkctx, RSA_PKCS=
1_PSS_PADDING),
> +                           "EVP_PKEY_CTX_set_rsa_padding");
> +                       ERR(!EVP_PKEY_CTX_set_rsa_mgf1_md_name(pkctx, has=
h_algo, NULL),
> +                           "EVP_PKEY_CTX_set_rsa_mgf1_md_name");
> +
> +                       ERR(!EVP_PKEY_CTX_get_rsa_mgf1_md_name(pkctx, mdn=
ame, sizeof(mdname)),
> +                           "EVP_PKEY_CTX_get_rsa_mgf1_md_name");
> +                       printf("RSASSA-PSS %s\n", mdname);
> +               }
> +
>                 ERR(CMS_final(cms, bm, NULL, flags) !=3D 1,
>                     "CMS_final");
>
>

Reviewed-by: Ignat Korchagin <ignat@cloudflare.com>

