Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E333306DAE
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 07:40:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbhA1Gjg (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 28 Jan 2021 01:39:36 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:16693 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbhA1Gj1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 28 Jan 2021 01:39:27 -0500
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 10S6cVto026509;
        Thu, 28 Jan 2021 15:38:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 10S6cVto026509
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611815912;
        bh=EE6oo7GF4ijvvjJyoAxlXeyJ1ZPQQAQ64OLvBXG81Qo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=zvsk1AU4PAwbQKMYzfw5a0Ra2RFqdukNUvKczCDcPMJaGjUvBeYY6kTsU2dRFE0/S
         7/RrsmurA99AN0f723zIbbJoLORO8n1Wkq6Jm9lEGlSw0xNQSLb10CUj2KJy1ZNHb9
         2b8mIJEO6EEaDa/4rD6VTXLt0zSjWulRF0CEDSTMERviFCmeQBny//6OBFHxQiudHt
         M+hsqi4SVK22CD3KnHm8pJlQOw81g6BCJ3/dFiCtGCQmy7/+QPG1NzVhHT6g9SNK6m
         bIgDuStOibW8gkHr5EBUz8tGZ3DbU1epHPOxCuqYwwOrRkbd1Q5usaJXC++jJnXCMY
         IW+mh7lZ58r/A==
X-Nifty-SrcIP: [209.85.210.169]
Received: by mail-pf1-f169.google.com with SMTP id q131so3354654pfq.10;
        Wed, 27 Jan 2021 22:38:32 -0800 (PST)
X-Gm-Message-State: AOAM5303QR6v3/cJ6oW8ee/GWQrEv6ExM1OxoIL8QLpmbtT6hCSC03fN
        VcocgOXsv4IKH/qv6Kr4eS3e2AuqQqpSdV0uhuQ=
X-Google-Smtp-Source: ABdhPJwYoK7zkT9RUEpOdut1O6wbz7EgzzQPAJEClu1M0y3kYlcXnvf+k6BNtRBrRrSNSQ7BjsT/B8AYiTABfP0ya1w=
X-Received: by 2002:a63:1f1d:: with SMTP id f29mr15124521pgf.47.1611815911327;
 Wed, 27 Jan 2021 22:38:31 -0800 (PST)
MIME-Version: 1.0
References: <20538915.Wj2CyUsUYa@devpool35> <2278760.8Yd83Mgoko@devpool35>
 <3394639.6NgGvCfkNl@devpool47> <3207945.kN7qQvqmsI@devpool47>
In-Reply-To: <3207945.kN7qQvqmsI@devpool47>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 28 Jan 2021 15:37:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNATMFicsV3Lz3RfrqjzKOOpcyEomVJOPqM29X6y4pXiFDA@mail.gmail.com>
Message-ID: <CAK7LNATMFicsV3Lz3RfrqjzKOOpcyEomVJOPqM29X6y4pXiFDA@mail.gmail.com>
Subject: Re: [PATCH v6] scripts: use pkg-config to locate libcrypto
To:     Rolf Eike Beer <eb@emlix.com>
Cc:     David Woodhouse <dwmw2@infradead.org>,
        Linux Kernel Developers List <linux-kernel@vger.kernel.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Jan 27, 2021 at 5:06 PM Rolf Eike Beer <eb@emlix.com> wrote:
>
> From f467f251e44cd406c9556ea7d68d131f56e0d832 Mon Sep 17 00:00:00 2001
> From: Rolf Eike Beer <eb@emlix.com>
> Date: Thu, 22 Nov 2018 16:40:49 +0100
> Subject: [PATCH] scripts: use pkg-config to locate libcrypto
>
> Otherwise build fails if the headers are not in the default location. Whi=
le at
> it also ask pkg-config for the libs, with fallback to the existing value.
>
> Signed-off-by: Rolf Eike Beer <eb@emlix.com>
> Cc: stable@vger.kernel.org # 5.6.x
> ---
>  scripts/Makefile | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> Changes in v6:
>  - hardcode pkg-config
>
> diff --git a/scripts/Makefile b/scripts/Makefile
> index b5418ec587fb..9de3c03b94aa 100644
> --- a/scripts/Makefile
> +++ b/scripts/Makefile
> @@ -3,6 +3,9 @@
>  # scripts contains sources for various helper programs used throughout
>  # the kernel for the build process.
>
> +CRYPTO_LIBS =3D $(shell pkg-config --libs libcrypto 2> /dev/null || echo=
 -lcrypto)
> +CRYPTO_CFLAGS =3D $(shell pkg-config --cflags libcrypto 2> /dev/null)
> +
>  hostprogs-always-$(CONFIG_BUILD_BIN2C)                 +=3D bin2c
>  hostprogs-always-$(CONFIG_KALLSYMS)                    +=3D kallsyms
>  hostprogs-always-$(BUILD_C_RECORDMCOUNT)               +=3D recordmcount
> @@ -14,8 +17,9 @@ hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)   +=
=3D insert-sys-cert
>
>  HOSTCFLAGS_sorttable.o =3D -I$(srctree)/tools/include
>  HOSTCFLAGS_asn1_compiler.o =3D -I$(srctree)/include
> -HOSTLDLIBS_sign-file =3D -lcrypto
> -HOSTLDLIBS_extract-cert =3D -lcrypto
> +HOSTLDLIBS_sign-file =3D $(CRYPTO_LIBS)
> +HOSTCFLAGS_extract-cert.o =3D $(CRYPTO_CFLAGS)
> +HOSTLDLIBS_extract-cert =3D $(CRYPTO_LIBS)
>
>  ifdef CONFIG_UNWINDER_ORC
>  ifeq ($(ARCH),x86_64)
> --
> 2.30.0
>
> --
> Rolf Eike Beer, emlix GmbH, http://www.emlix.com
> Fon +49 551 30664-0, Fax +49 551 30664-11
> Gothaer Platz 3, 37083 G=C3=B6ttingen, Germany
> Sitz der Gesellschaft: G=C3=B6ttingen, Amtsgericht G=C3=B6ttingen HR B 31=
60
> Gesch=C3=A4ftsf=C3=BChrung: Heike Jordan, Dr. Uwe Kracke =E2=80=93 Ust-Id=
Nr.: DE 205 198 055
>
> emlix - smart embedded open source
>
>
>

Applied to linux-kbuild. Thanks.

--=20
Best Regards
Masahiro Yamada
