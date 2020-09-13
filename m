Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2070267E57
	for <lists+keyrings@lfdr.de>; Sun, 13 Sep 2020 09:12:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbgIMHMn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 13 Sep 2020 03:12:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbgIMHMW (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 13 Sep 2020 03:12:22 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D436C061757
        for <keyrings@vger.kernel.org>; Sun, 13 Sep 2020 00:12:20 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id kk9so3741701pjb.2
        for <keyrings@vger.kernel.org>; Sun, 13 Sep 2020 00:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=benyossef-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=GvZM5rf5aV2Zc9VWGMundiwBvF5h3OlvoOB40Du6TQg=;
        b=GBJWFNVxqHqk8jJElMjtWuriXVh3KdRKD5z/H0647c5ofUOkKOUvZPk7bXkwivl27h
         kHaEzoRCdHCaJiD1s32VXjF0WiBIZGmfcvxBDRXJsupT6WuH9y0ID5oNBeMEc8TAaiPu
         fUWNMO27vFop6ZrqR3d3GRwcJUdikIU8ONh+XwVlLe1M19I4KJHcBXFmC5sdHEz4WeLq
         YuHCfJjto3cY443Y5hiAAd/w3CfRXkAWIvf1mXcRM7MVfzfRMj9VY/LnOqlpl3UYGgZ7
         RtMK3BO9f9KOM1Bf5MSkWI04pPKpjoHBQVNXdM67/60WBiC+q7ODpbKhMkcXazNdyDR1
         Wqpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=GvZM5rf5aV2Zc9VWGMundiwBvF5h3OlvoOB40Du6TQg=;
        b=FD46rg74BnlKIjjm1xY3g327hGqr77Yxk5vureU/k3BcDsfluqNHsaYnrG2bVSH8tR
         Dc8jGFBjT3R5s+0aSSjUZQht1rJfNGYjn47sVs7st0PeuRK/ljUCW4k0d7+jGpgg58sj
         S+/uY2f+ul5BuVB4Xa7LFvriSY18X+mNo8tPfbyDo86zEJMIlIezUUpSt5OlcJ0J6Ox4
         pEm7xsNTqSuovKCmrA2HZByost/YBwO1DoAoS9fux80jnsgmUQqQXjml8I128Y5JUfZi
         tDK+s34H2cD08Kuld68W4wc/VraOA50IDl5rXpIffY7Slu32mY4d7//DD3fJg9j+oK3x
         H5cw==
X-Gm-Message-State: AOAM531FHCaPVo8D011xoE1iMMz4r+4sdDeLP84uZWZeidhjRZ04OJUA
        d8dVxieMdtnagFoW36M6ptwbRs1/qH18aAE5ftyDYw==
X-Google-Smtp-Source: ABdhPJw6YNDARVPayuQQbt53xib3TWvar5zYdHdcFp0GbBRVYl+LqmDEzsx5NZyTVnc4kR7JRLrQATbzdTiFdugFixk=
X-Received: by 2002:a17:90a:e609:: with SMTP id j9mr8481445pjy.129.1599981139628;
 Sun, 13 Sep 2020 00:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200903131242.128665-1-tianjia.zhang@linux.alibaba.com> <20200903131242.128665-8-tianjia.zhang@linux.alibaba.com>
In-Reply-To: <20200903131242.128665-8-tianjia.zhang@linux.alibaba.com>
From:   Gilad Ben-Yossef <gilad@benyossef.com>
Date:   Sun, 13 Sep 2020 10:12:09 +0300
Message-ID: <CAOtvUMfT5zgv=e9nCgz8-1r7LuYSRZ8Zdx2xc0JwckUJZufcvg@mail.gmail.com>
Subject: Re: [PATCH v6 7/8] X.509: support OSCCA sm2-with-sm3 certificate verification
To:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        David Howells <dhowells@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Stephan Mueller <smueller@chronox.de>,
        Marcelo Henrique Cerri <marcelo.cerri@canonical.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Waiman Long <longman@redhat.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Colin Ian King <colin.king@canonical.com>,
        Tushar Sugandhi <tusharsu@linux.microsoft.com>,
        Vitaly Chikunov <vt@altlinux.org>,
        Pascal van Leeuwen <pvanleeuwen@rambus.com>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>,
        keyrings@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-security-module@vger.kernel.org,
        Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>,
        Jia Zhang <zhang.jia@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,


On Thu, Sep 3, 2020 at 4:13 PM Tianjia Zhang
<tianjia.zhang@linux.alibaba.com> wrote:
>
> The digital certificate format based on SM2 crypto algorithm as
> specified in GM/T 0015-2012. It was published by State Encryption
> Management Bureau, China.
>
> The method of generating Other User Information is defined as
> ZA=3DH256(ENTLA || IDA || a || b || xG || yG || xA || yA), it also
> specified in https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02.
>
> The x509 certificate supports sm2-with-sm3 type certificate
> verification.  Because certificate verification requires ZA
> in addition to tbs data, ZA also depends on elliptic curve
> parameters and public key data, so you need to access tbs in sig
> and calculate ZA. Finally calculate the digest of the
> signature and complete the verification work. The calculation
> process of ZA is declared in specifications GM/T 0009-2012
> and GM/T 0003.2-2012.
>
> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> Tested-by: Xufeng Zhang <yunbo.xufeng@linux.alibaba.com>
> ---
>  crypto/asymmetric_keys/Makefile          |  1 +
>  crypto/asymmetric_keys/public_key.c      |  6 +++
>  crypto/asymmetric_keys/public_key_sm2.c  | 61 ++++++++++++++++++++++++
>  crypto/asymmetric_keys/x509_public_key.c |  3 ++
>  include/crypto/public_key.h              | 15 ++++++
>  5 files changed, 86 insertions(+)
>  create mode 100644 crypto/asymmetric_keys/public_key_sm2.c
>
> diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Mak=
efile
> index 28b91adba2ae..1a99ea5acb6b 100644
> --- a/crypto/asymmetric_keys/Makefile
> +++ b/crypto/asymmetric_keys/Makefile
> @@ -11,6 +11,7 @@ asymmetric_keys-y :=3D \
>         signature.o
>
>  obj-$(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE) +=3D public_key.o
> +obj-$(CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE) +=3D public_key_sm2.o
>  obj-$(CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE) +=3D asym_tpm.o
>
>  #
> diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys=
/public_key.c
> index d8410ffd7f12..1d0492098bbd 100644
> --- a/crypto/asymmetric_keys/public_key.c
> +++ b/crypto/asymmetric_keys/public_key.c
> @@ -299,6 +299,12 @@ int public_key_verify_signature(const struct public_=
key *pkey,
>         if (ret)
>                 goto error_free_key;
>
> +       if (strcmp(sig->pkey_algo, "sm2") =3D=3D 0 && sig->data_size) {
> +               ret =3D cert_sig_digest_update(sig, tfm);
> +               if (ret)
> +                       goto error_free_key;
> +       }
> +
>         sg_init_table(src_sg, 2);
>         sg_set_buf(&src_sg[0], sig->s, sig->s_size);
>         sg_set_buf(&src_sg[1], sig->digest, sig->digest_size);
> diff --git a/crypto/asymmetric_keys/public_key_sm2.c b/crypto/asymmetric_=
keys/public_key_sm2.c
> new file mode 100644
> index 000000000000..7325cf21dbb4
> --- /dev/null
> +++ b/crypto/asymmetric_keys/public_key_sm2.c
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * asymmetric public-key algorithm for SM2-with-SM3 certificate
> + * as specified by OSCCA GM/T 0003.1-2012 -- 0003.5-2012 SM2 and
> + * described at https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02
> + *
> + * Copyright (c) 2020, Alibaba Group.
> + * Authors: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> + */
> +
> +#include <crypto/sm3_base.h>
> +#include <crypto/sm2.h>
> +#include <crypto/public_key.h>
> +
> +#if IS_REACHABLE(CONFIG_CRYPTO_SM2)
> +
> +int cert_sig_digest_update(const struct public_key_signature *sig,
> +                               struct crypto_akcipher *tfm_pkey)
> +{
> +       struct crypto_shash *tfm;
> +       struct shash_desc *desc;
> +       size_t desc_size;
> +       unsigned char dgst[SM3_DIGEST_SIZE];
> +       int ret;
> +
> +       BUG_ON(!sig->data);
> +
> +       ret =3D sm2_compute_z_digest(tfm_pkey, SM2_DEFAULT_USERID,
> +                                       SM2_DEFAULT_USERID_LEN, dgst);
> +       if (ret)
> +               return ret;
> +
> +       tfm =3D crypto_alloc_shash(sig->hash_algo, 0, 0);
> +       if (IS_ERR(tfm))
> +               return PTR_ERR(tfm);
> +
> +       desc_size =3D crypto_shash_descsize(tfm) + sizeof(*desc);
> +       desc =3D kzalloc(desc_size, GFP_KERNEL);
> +       if (!desc)
> +               goto error_free_tfm;
> +
> +       desc->tfm =3D tfm;
> +
> +       ret =3D crypto_shash_init(desc);
> +       if (ret < 0)
> +               goto error_free_desc;
> +
> +       ret =3D crypto_shash_update(desc, dgst, SM3_DIGEST_SIZE);
> +       if (ret < 0)
> +               goto error_free_desc;
> +
> +       ret =3D crypto_shash_finup(desc, sig->data, sig->data_size, sig->=
digest);

It looks like you are doing a separate init, update, finup every time
- I would consider using crypto_shash_digest() in one go.

In fact, considering the fact that you are allocating a tfm just for
this use and then releasing it, I would consider switching to
crypto_shash_tfm_digest() and dropping the kzalloc all together.

This should simplify the code a bit.

Other than that I don't have anything smart to say :-)

Gilad

--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!
