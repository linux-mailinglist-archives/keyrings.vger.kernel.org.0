Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95C8A3CCF08
	for <lists+keyrings@lfdr.de>; Mon, 19 Jul 2021 10:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235176AbhGSIHV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 19 Jul 2021 04:07:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235173AbhGSIHT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 19 Jul 2021 04:07:19 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46C95C061766
        for <keyrings@vger.kernel.org>; Mon, 19 Jul 2021 01:04:20 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id b29so3936849ljf.11
        for <keyrings@vger.kernel.org>; Mon, 19 Jul 2021 01:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i14FRHIsMtcKq5qxkGbf8dAh+hq2PP1b1H1zAdOHpGk=;
        b=LyX69PGMB/Y+awjgV9WpZK0Mv8mjq6sjXTbvDlQ5wvVYoDdhjop8pPa46MOs3ooqC6
         F4Kug5GLmmz6OZRvN8aJBOqR4wUdXHJRxP/uLB/9nuL+0KXzrCcCEIV1pin1tNHaiHlD
         eNpkTms/X2O18dwAt0DFd1H2sfjhFh+URp6KV8OjJ1XnjLY1CtCM1hrZsiTwfmy5St8G
         d5NFM5E52p7om9qOBKFVCljlWSfKcfzZMbu7MTRfv0Lo1WJY1n/Thm0yRFhbJ6x9EKIR
         CSAIMZp1nq2fMEWNonrzzu9ChxqPoZIPH+XQPCnG8TI9rnOCQIZ0UDSgyeKcROhRbWiT
         K9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i14FRHIsMtcKq5qxkGbf8dAh+hq2PP1b1H1zAdOHpGk=;
        b=q43cidlxbNcboOZ1nLX/E1/xq+6qix8oGADq7WuD0bwdW0Io5Fe42sgN04/oylFLg4
         Kcv8Tfi1e12EUBxQpRRriyJKMDgC5PzyL8PpQezL36Ub62BI17EUyNVueLldY+7Jj5qm
         lW2eZjaIUsRIzDPn7zXbdJ0Vm8HVtKKfhnS6xpU/3FvHIBPjAY6mzbv0aLkwMWbcGwEH
         2xVjdU7H/NAzy2qgmcsc/1F1ah5kwfrgLvpq2PbSzRCVsj48ZYYGc0pqQd2fBKMjRSd/
         EClY438vxOAGbQzs24K3wQ3IOQ72yp+VYGabyS6QF3uCmokeP62BUiIgb5ejFVpB7iiZ
         pO8w==
X-Gm-Message-State: AOAM532M1EappAHebSzu/nTNKqVTwn++4uRbUG38LDzmrclWwwLdYoaq
        UJBIZltgm+EAKDHCH42EiZRuPH6nhl2I+yFud3VuZQ==
X-Google-Smtp-Source: ABdhPJxZZU7sE0a3j1z9F/OJ1zmaZrZQMMf5+0JDNkLRl2qcf6R0gpRGykBGJjnX64CsJd+nP097ZMt9DtZu3kUtmvY=
X-Received: by 2002:a2e:9059:: with SMTP id n25mr21934329ljg.314.1626681858540;
 Mon, 19 Jul 2021 01:04:18 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1dfbb73645d917b3c76d01290804a3410bd9932e.1624364386.git-series.a.fatoum@pengutronix.de>
 <f8285eb0135ba30c9d846cf9dd395d1f5f8b1efc.1624364386.git-series.a.fatoum@pengutronix.de>
In-Reply-To: <f8285eb0135ba30c9d846cf9dd395d1f5f8b1efc.1624364386.git-series.a.fatoum@pengutronix.de>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Mon, 19 Jul 2021 13:34:07 +0530
Message-ID: <CAFA6WYMJp5u_+3bNc0ykFzveakOS4nqJfPvSoaFGQApFctL47A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] KEYS: trusted: allow use of TEE as backend without
 TCG_TPM support
To:     Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc:     James Bottomley <jejb@linux.ibm.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        kernel <kernel@pengutronix.de>, James Morris <jmorris@namei.org>,
        Eric Biggers <ebiggers@kernel.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Udit Agarwal <udit.agarwal@nxp.com>,
        Jan Luebbe <j.luebbe@pengutronix.de>,
        David Gstir <david@sigma-star.at>,
        Richard Weinberger <richard@nod.at>,
        Franck LENORMAND <franck.lenormand@nxp.com>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        linux-integrity <linux-integrity@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:SECURITY SUBSYSTEM" 
        <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi Ahmad,

On Tue, 22 Jun 2021 at 18:08, Ahmad Fatoum <a.fatoum@pengutronix.de> wrote:
>
> With recent rework, trusted keys are no longer limited to TPM as trust
> source. The Kconfig symbol is unchanged however leading to a few issues:
>
>  - TCG_TPM is required, even if only TEE is to be used
>  - Enabling TCG_TPM, but excluding it from available trusted sources
>    is not possible
>  - TEE=3Dm && TRUSTED_KEYS=3Dy will lead to TEE support being silently
>    dropped, which is not the best user experience
>
> Remedy these issues by introducing two new Kconfig symbols:
> TRUSTED_KEYS_TPM and TRUSTED_KEYS_TEE with the appropriate
> dependencies.
>

This should include a fixes tag to the rework commit.

> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
> To: James Bottomley <jejb@linux.ibm.com>
> To: Jarkko Sakkinen <jarkko@kernel.org>
> To: Mimi Zohar <zohar@linux.ibm.com>
> To: David Howells <dhowells@redhat.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> Cc: "Horia Geant=C4=83" <horia.geanta@nxp.com>
> Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
> Cc: Udit Agarwal <udit.agarwal@nxp.com>
> Cc: Jan Luebbe <j.luebbe@pengutronix.de>
> Cc: David Gstir <david@sigma-star.at>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Franck LENORMAND <franck.lenormand@nxp.com>
> Cc: Sumit Garg <sumit.garg@linaro.org>
> Cc: keyrings@vger.kernel.org
> Cc: linux-crypto@vger.kernel.org
> Cc: linux-integrity@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-security-module@vger.kernel.org
> ---
>  security/keys/Kconfig                     | 14 ++++++-------
>  security/keys/trusted-keys/Kconfig        | 25 ++++++++++++++++++++++++-
>  security/keys/trusted-keys/Makefile       |  8 +++++---
>  security/keys/trusted-keys/trusted_core.c |  4 ++--
>  4 files changed, 39 insertions(+), 12 deletions(-)
>  create mode 100644 security/keys/trusted-keys/Kconfig
>
> diff --git a/security/keys/Kconfig b/security/keys/Kconfig
> index 64b81abd087e..6fdb953b319f 100644
> --- a/security/keys/Kconfig
> +++ b/security/keys/Kconfig
> @@ -70,23 +70,23 @@ config BIG_KEYS
>
>  config TRUSTED_KEYS
>         tristate "TRUSTED KEYS"
> -       depends on KEYS && TCG_TPM
> +       depends on KEYS

>         select CRYPTO
>         select CRYPTO_HMAC
>         select CRYPTO_SHA1
>         select CRYPTO_HASH_INFO

Should move these as well to TRUSTED_KEYS_TPM as the core code doesn't
mandate their need.

> -       select ASN1_ENCODER
> -       select OID_REGISTRY
> -       select ASN1
>         help
>           This option provides support for creating, sealing, and unseali=
ng
>           keys in the kernel. Trusted keys are random number symmetric ke=
ys,
> -         generated and RSA-sealed by the TPM. The TPM only unseals the k=
eys,
> -         if the boot PCRs and other criteria match.  Userspace will only=
 ever
> -         see encrypted blobs.
> +         generated and sealed by a trust source selected at kernel boot-=
time.
> +         Userspace will only ever see encrypted blobs.
>
>           If you are unsure as to whether this is required, answer N.
>
> +if TRUSTED_KEYS
> +source "security/keys/trusted-keys/Kconfig"
> +endif
> +
>  config ENCRYPTED_KEYS
>         tristate "ENCRYPTED KEYS"
>         depends on KEYS
> diff --git a/security/keys/trusted-keys/Kconfig b/security/keys/trusted-k=
eys/Kconfig
> new file mode 100644
> index 000000000000..24af4aaceebf
> --- /dev/null
> +++ b/security/keys/trusted-keys/Kconfig
> @@ -0,0 +1,25 @@
> +config TRUSTED_KEYS_TPM
> +       bool "TPM-based trusted keys"
> +       depends on TCG_TPM >=3D TRUSTED_KEYS
> +       default y
> +       select ASN1_ENCODER
> +       select OID_REGISTRY
> +       select ASN1
> +       help
> +         Enable use of the Trusted Platform Module (TPM) as trusted key
> +         backend. Trusted keys are are random number symmetric keys,
> +         which will be generated and RSA-sealed by the TPM.
> +         The TPM only unseals the keys, if the boot PCRs and other
> +         criteria match.
> +
> +config TRUSTED_KEYS_TEE
> +       bool "TEE-based trusted keys"
> +       depends on TEE >=3D TRUSTED_KEYS
> +       default y
> +       help
> +         Enable use of the Trusted Execution Environment (TEE) as truste=
d
> +         key backend.
> +
> +if !TRUSTED_KEYS_TPM && !TRUSTED_KEYS_TEE
> +comment "No trust source selected!"
> +endif
> diff --git a/security/keys/trusted-keys/Makefile b/security/keys/trusted-=
keys/Makefile
> index feb8b6c3cc79..96fc6c377398 100644
> --- a/security/keys/trusted-keys/Makefile
> +++ b/security/keys/trusted-keys/Makefile
> @@ -5,10 +5,12 @@
>
>  obj-$(CONFIG_TRUSTED_KEYS) +=3D trusted.o
>  trusted-y +=3D trusted_core.o
> -trusted-y +=3D trusted_tpm1.o
> +trusted-$(CONFIG_TRUSTED_KEYS_TPM) +=3D trusted_tpm1.o
>
>  $(obj)/trusted_tpm2.o: $(obj)/tpm2key.asn1.h
> -trusted-y +=3D trusted_tpm2.o
> -trusted-y +=3D tpm2key.asn1.o
> +trusted-$(CONFIG_TRUSTED_KEYS_TPM) +=3D trusted_tpm2.o
> +trusted-$(CONFIG_TRUSTED_KEYS_TPM) +=3D tpm2key.asn1.o
> +
> +trusted-$(CONFIG_TRUSTED_KEYS_TEE) +=3D trusted_tee.o
>
>  trusted-$(CONFIG_TEE) +=3D trusted_tee.o

This should be dropped.

-Sumit

> diff --git a/security/keys/trusted-keys/trusted_core.c b/security/keys/tr=
usted-keys/trusted_core.c
> index d5c891d8d353..8cab69e5d0da 100644
> --- a/security/keys/trusted-keys/trusted_core.c
> +++ b/security/keys/trusted-keys/trusted_core.c
> @@ -27,10 +27,10 @@ module_param_named(source, trusted_key_source, charp,=
 0);
>  MODULE_PARM_DESC(source, "Select trusted keys source (tpm or tee)");
>
>  static const struct trusted_key_source trusted_key_sources[] =3D {
> -#if defined(CONFIG_TCG_TPM)
> +#if defined(CONFIG_TRUSTED_KEYS_TPM)
>         { "tpm", &trusted_key_tpm_ops },
>  #endif
> -#if defined(CONFIG_TEE)
> +#if defined(CONFIG_TRUSTED_KEYS_TEE)
>         { "tee", &trusted_key_tee_ops },
>  #endif
>  };
> --
> git-series 0.9.1
