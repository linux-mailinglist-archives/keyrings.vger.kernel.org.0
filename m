Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 906EF346BEE
	for <lists+keyrings@lfdr.de>; Tue, 23 Mar 2021 23:16:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233825AbhCWWPY (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 23 Mar 2021 18:15:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:37774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233659AbhCWWOX (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 23 Mar 2021 18:14:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 00619601FC;
        Tue, 23 Mar 2021 22:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616537662;
        bh=euLud26DLs6jpGe+Y94fxhCgdNwfvxm3zvQ/VXv5ZOc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Okjtu5KPyaRWk3iFbNOzKPKjKekuvwvfvzB8HP8gNF/43MS/dCAopmtk/C/aAa5z2
         Fwz97NDoeTvvCIz9TqIG+/b0JskLNtbfyRCp9f5m3cOiFbkBlxp69wJ23m7ERlUkDG
         A3s2c3sPzJVXPD1ngDIsjVfxNNsbh/fdAPkgPyQVBDTIOPyUEeXJQtYz4gcZDeyUtl
         rlhjKFdwvsEAKZrDGmK2Vbkd9Jx56hJVLj9LsBd94IQbHKS926z3ZqIQrCtqFKfnnX
         ang0K0PeM81iNfL7QyPLdUH7TKpui3lNQCNRv37E9yfi0NWquUg6oihDBuWiFDe7AI
         w9Q2Pw0ZyXP4Q==
Received: by mail-ot1-f45.google.com with SMTP id f73-20020a9d03cf0000b02901b4d889bce0so21035357otf.12;
        Tue, 23 Mar 2021 15:14:21 -0700 (PDT)
X-Gm-Message-State: AOAM532lvk+3hIaxT3F5XORwou4Vaq4vxe2So8E1BdwU4YFnUgxPQHaQ
        Or+cBEuHtSgO2m3XfkoqbyyAaJq/g6dr8GUrVJU=
X-Google-Smtp-Source: ABdhPJzRrDcK+Z1w4yNXAoPMG4HuCGZnCsRiH1f1t1OAoW5YC9blqGf3Xz/P4ibyIPF7aFTBli233c73W2uEJspUMHo=
X-Received: by 2002:a9d:12cb:: with SMTP id g69mr413585otg.77.1616537661122;
 Tue, 23 Mar 2021 15:14:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210323083528.25678-1-tianjia.zhang@linux.alibaba.com>
In-Reply-To: <20210323083528.25678-1-tianjia.zhang@linux.alibaba.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Tue, 23 Mar 2021 23:14:09 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE5x82SZUvo9=hjjE=Z9QrzggzfvBHbjaaGExRfQ8PDxw@mail.gmail.com>
Message-ID: <CAMj1kXE5x82SZUvo9=hjjE=Z9QrzggzfvBHbjaaGExRfQ8PDxw@mail.gmail.com>
Subject: Re: [PATCH] init/Kconfig: Support sign module with SM3 hash algorithm
To:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Cc:     David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Nick Terrell <terrelln@fb.com>, KP Singh <kpsingh@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Vlastimil Babka <vbabka@suse.cz>, keyrings@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Jia Zhang <zhang.jia@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 23 Mar 2021 at 09:36, Tianjia Zhang
<tianjia.zhang@linux.alibaba.com> wrote:
>
> The kernel module signature supports the option to use the SM3
> secure hash (OSCCA GM/T 0004-2012 SM3).
>
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>

A secure hash is not the same as a signature. Looking at the patch,
the asymmetric algorithm that is used to sign the SM3 digest is SM2,
is that correct? How does one create such signed modules?

In any case, please provide more context in the commit log on how this
is intended to be used.


> ---
>  Documentation/admin-guide/module-signing.rst | 5 +++--
>  crypto/asymmetric_keys/pkcs7_parser.c        | 7 +++++++
>  init/Kconfig                                 | 5 +++++
>  3 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
> index 7d7c7c8a545c..8d8980808b5b 100644
> --- a/Documentation/admin-guide/module-signing.rst
> +++ b/Documentation/admin-guide/module-signing.rst
> @@ -30,8 +30,8 @@ This facility uses X.509 ITU-T standard certificates to encode the public keys
>  involved.  The signatures are not themselves encoded in any industrial standard
>  type.  The facility currently only supports the RSA public key encryption
>  standard (though it is pluggable and permits others to be used).  The possible
> -hash algorithms that can be used are SHA-1, SHA-224, SHA-256, SHA-384, and
> -SHA-512 (the algorithm is selected by data in the signature).
> +hash algorithms that can be used are SHA-1, SHA-224, SHA-256, SHA-384, SHA-512,
> +and SM3 (the algorithm is selected by data in the signature).
>
>
>  ==========================
> @@ -86,6 +86,7 @@ This has a number of options available:
>         ``CONFIG_MODULE_SIG_SHA256``    :menuselection:`Sign modules with SHA-256`
>         ``CONFIG_MODULE_SIG_SHA384``    :menuselection:`Sign modules with SHA-384`
>         ``CONFIG_MODULE_SIG_SHA512``    :menuselection:`Sign modules with SHA-512`
> +       ``CONFIG_MODULE_SIG_SM3``       :menuselection:`Sign modules with SM3`
>          =============================== ==========================================
>
>       The algorithm selected here will also be built into the kernel (rather
> diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
> index 967329e0a07b..6cf6c4552c11 100644
> --- a/crypto/asymmetric_keys/pkcs7_parser.c
> +++ b/crypto/asymmetric_keys/pkcs7_parser.c
> @@ -248,6 +248,9 @@ int pkcs7_sig_note_digest_algo(void *context, size_t hdrlen,
>         case OID_sha224:
>                 ctx->sinfo->sig->hash_algo = "sha224";
>                 break;
> +       case OID_sm3:
> +               ctx->sinfo->sig->hash_algo = "sm3";
> +               break;
>         default:
>                 printk("Unsupported digest algo: %u\n", ctx->last_oid);
>                 return -ENOPKG;
> @@ -269,6 +272,10 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t hdrlen,
>                 ctx->sinfo->sig->pkey_algo = "rsa";
>                 ctx->sinfo->sig->encoding = "pkcs1";
>                 break;
> +       case OID_SM2_with_SM3:
> +               ctx->sinfo->sig->pkey_algo = "sm2";
> +               ctx->sinfo->sig->encoding = "raw";
> +               break;
>         default:
>                 printk("Unsupported pkey algo: %u\n", ctx->last_oid);
>                 return -ENOPKG;
> diff --git a/init/Kconfig b/init/Kconfig
> index 5f5c776ef192..fed9236078e4 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2202,6 +2202,10 @@ config MODULE_SIG_SHA512
>         bool "Sign modules with SHA-512"
>         select CRYPTO_SHA512
>
> +config MODULE_SIG_SM3
> +       bool "Sign modules with SM3"
> +       select CRYPTO_SM3
> +
>  endchoice
>
>  config MODULE_SIG_HASH
> @@ -2212,6 +2216,7 @@ config MODULE_SIG_HASH
>         default "sha256" if MODULE_SIG_SHA256
>         default "sha384" if MODULE_SIG_SHA384
>         default "sha512" if MODULE_SIG_SHA512
> +       default "sm3" if MODULE_SIG_SM3
>
>  config MODULE_COMPRESS
>         bool "Compress modules on installation"
> --
> 2.19.1.3.ge56e4f7
>
