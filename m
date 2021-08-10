Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D562F3E52E4
	for <lists+keyrings@lfdr.de>; Tue, 10 Aug 2021 07:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbhHJFZW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 10 Aug 2021 01:25:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237645AbhHJFZV (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 10 Aug 2021 01:25:21 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2506C06179A
        for <keyrings@vger.kernel.org>; Mon,  9 Aug 2021 22:24:59 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id u13so27219302lje.5
        for <keyrings@vger.kernel.org>; Mon, 09 Aug 2021 22:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=CFWqBCQp2YlhCV7jSxWtmoCr8RILzISB86MNoTEBHeU=;
        b=kOohwNbQp4KuzGJcZF4yy50pxkQN5Pb3iyD+ksrmfBVybK+TUfjtOwUyb7bKShe8tW
         SdRFWAigtNDsjm+fYfhVo3pIxT6X/DNEHzlL1Yb+k45momrT3GI3kLzx/UC1L3NV5WvG
         6dFgkqQwdB9tsG044F0FDPRv7bPPwEyO0WdNtgH2iU48kKdX3L++yX8EzxA0ZGhCs3f8
         fJ5M+aYhbYV2OGcTpV+3ZpCUjy6t4JcreBfppE3CEU/cX5lIAyYfeMjg11Z4yiCF8DEQ
         bxpEyJUVg8TveXXvdXTMtRzWZrcVTWIQZBTGaawTSWC3BK3cVJm1GvVbvcK1fDoPfnOF
         sDYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=CFWqBCQp2YlhCV7jSxWtmoCr8RILzISB86MNoTEBHeU=;
        b=FkPhm394tGJ46Ln4uAfZDbNw8j/m0tEXlRT+HIam6AQNyvT8XQ1TJt5CdEXfuFCEb5
         tTuyzv+xHJVU/v0XDTMbQJxjZOlHgg+jky82dMcMoP7DjE+IKEkfHjh4wKiSiOH3UBsU
         lCzaExHpS+XxKUXeMSm0UooZpnfTSwKDvb94tnkq9hCbrA6+GYOuMUUc7RP4iJ5UHein
         8paQkCXmKjQYuKDXV9pMoJzEzMo5HiyTULhDgvVqUfkAMUQlW7IlLCuSnWgjSjJFHpuY
         ZM8jwENZIyfCGZyYjJBr8dLjQNwmEFltdaUYuhJeouq/Z0yYbpI5PzB8p5Z00BDdg+iL
         DFrA==
X-Gm-Message-State: AOAM532mMPeE+RfqyeaJPFbDwIxFf3pVQYsWmIgJdWIojAntkKTDpwap
        tgcU0xAfFWGvmoGfgbOVjgj52Ui/ifkGHSHJ/yp5jw==
X-Google-Smtp-Source: ABdhPJwAO97YdfcdCAmTaAWes9GxsrI5CP30XQe+NgCZoBVV5RVlt4j0z3ZrFIcGb4t5MvWxg/JuOLFUnrMQtk2HCJI=
X-Received: by 2002:a05:651c:516:: with SMTP id o22mr17678549ljp.152.1628573097700;
 Mon, 09 Aug 2021 22:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <cover.9fc9298fd9d63553491871d043a18affc2dbc8a8.1626885907.git-series.a.fatoum@pengutronix.de>
 <7b771da7b09a01c8b4da2ed21f05251ea797b2e8.1626885907.git-series.a.fatoum@pengutronix.de>
 <CAFA6WYOskwZNe5Wb5PTtnSHQBonSXZ48eEex0w9jQ+JW4vG=+w@mail.gmail.com>
 <7537c853-3641-a6d3-91d8-70fea9f01a89@pengutronix.de> <20210809095647.7xcxjeot5gyvmlpj@kernel.org>
In-Reply-To: <20210809095647.7xcxjeot5gyvmlpj@kernel.org>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Tue, 10 Aug 2021 10:54:46 +0530
Message-ID: <CAFA6WYPg20EiYATXStt1mgGJVjkOK5BK7WDbTdzOujBdcH6KLg@mail.gmail.com>
Subject: Re: [PATCH 2/4] KEYS: trusted: allow trust sources to use kernel RNG
 for key material
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Ahmad Fatoum <a.fatoum@pengutronix.de>,
        James Bottomley <jejb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        kernel <kernel@pengutronix.de>, James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        =?UTF-8?Q?Horia_Geant=C4=83?= <horia.geanta@nxp.com>,
        Aymen Sghaier <aymen.sghaier@nxp.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Agarwal <udit.agarwal@nxp.com>,
        Eric Biggers <ebiggers@kernel.org>,
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

On Mon, 9 Aug 2021 at 15:26, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Mon, Aug 09, 2021 at 09:52:20AM +0200, Ahmad Fatoum wrote:
> > Hello Sumit,
> >
> > On 22.07.21 08:31, Sumit Garg wrote:
> > > On Wed, 21 Jul 2021 at 22:19, Ahmad Fatoum <a.fatoum@pengutronix.de> =
wrote:
> > >>
> > >> The two existing trusted key sources don't make use of the kernel RN=
G,
> > >> but instead let the hardware that does the sealing/unsealing also
> > >> generate the random key material. While a previous change offers use=
rs
> > >> the choice to use the kernel RNG instead for both, new trust sources
> > >> may want to unconditionally use the kernel RNG for generating key
> > >> material, like it's done elsewhere in the kernel.
> > >>
> > >> This is especially prudent for hardware that has proven-in-productio=
n
> > >> HWRNG drivers implemented, as otherwise code would have to be duplic=
ated
> > >> only to arrive at a possibly worse result.
> > >>
> > >> Make this possible by turning struct trusted_key_ops::get_random
> > >> into an optional member. If a driver leaves it NULL, kernel RNG
> > >> will be used instead.
> > >>
> > >> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> > >> ---
> > >> To: James Bottomley <jejb@linux.ibm.com>
> > >> To: Jarkko Sakkinen <jarkko@kernel.org>
> > >> To: Mimi Zohar <zohar@linux.ibm.com>
> > >> To: David Howells <dhowells@redhat.com>
> > >> Cc: James Morris <jmorris@namei.org>
> > >> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> > >> Cc: "Horia Geant=C4=83" <horia.geanta@nxp.com>
> > >> Cc: Aymen Sghaier <aymen.sghaier@nxp.com>
> > >> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > >> Cc: "David S. Miller" <davem@davemloft.net>
> > >> Cc: Udit Agarwal <udit.agarwal@nxp.com>
> > >> Cc: Eric Biggers <ebiggers@kernel.org>
> > >> Cc: Jan Luebbe <j.luebbe@pengutronix.de>
> > >> Cc: David Gstir <david@sigma-star.at>
> > >> Cc: Richard Weinberger <richard@nod.at>
> > >> Cc: Franck LENORMAND <franck.lenormand@nxp.com>
> > >> Cc: Sumit Garg <sumit.garg@linaro.org>
> > >> Cc: keyrings@vger.kernel.org
> > >> Cc: linux-crypto@vger.kernel.org
> > >> Cc: linux-integrity@vger.kernel.org
> > >> Cc: linux-kernel@vger.kernel.org
> > >> Cc: linux-security-module@vger.kernel.org
> > >> ---
> > >>  include/keys/trusted-type.h               | 2 +-
> > >>  security/keys/trusted-keys/trusted_core.c | 2 +-
> > >>  2 files changed, 2 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/include/keys/trusted-type.h b/include/keys/trusted-type=
.h
> > >> index d89fa2579ac0..4eb64548a74f 100644
> > >> --- a/include/keys/trusted-type.h
> > >> +++ b/include/keys/trusted-type.h
> > >> @@ -64,7 +64,7 @@ struct trusted_key_ops {
> > >>         /* Unseal a key. */
> > >>         int (*unseal)(struct trusted_key_payload *p, char *datablob)=
;
> > >>
> > >> -       /* Get a randomized key. */
> > >> +       /* Optional: Get a randomized key. */
> > >>         int (*get_random)(unsigned char *key, size_t key_len);
> > >>
> > >>         /* Exit key interface. */
> > >> diff --git a/security/keys/trusted-keys/trusted_core.c b/security/ke=
ys/trusted-keys/trusted_core.c
> > >> index 569af9af8df0..d2b7626cde8b 100644
> > >> --- a/security/keys/trusted-keys/trusted_core.c
> > >> +++ b/security/keys/trusted-keys/trusted_core.c
> > >> @@ -334,7 +334,7 @@ static int __init init_trusted(void)
> > >>                         continue;
> > >>
> > >>                 get_random =3D trusted_key_sources[i].ops->get_rando=
m;
> > >> -               if (trusted_kernel_rng)
> > >> +               if (trusted_kernel_rng || !get_random)
> > >>                         get_random =3D kernel_get_random;
> > >>
> > >
> > > For ease of understanding, I would prefer to write it as:
> > >
> > >                   get_random =3D trusted_key_sources[i].ops->get_rand=
om ?:
> > >                                          kernel_get_random;
> > >                   if (trusted_kernel_rng)
> > >                         get_random =3D kernel_get_random;
> > >
> > > With that:
> > >
> > > Acked-by: Sumit Garg <sumit.garg@linaro.org>
> >
> > I don't think it improves readability to split up the conditional.
> > At least I need to take a second pass over the code to understand
> > the second conditional.
>
> Ternary operators are pain to read, unless a super trivial case.
>
> I'd stick to what you did.

Fair enough, I am fine with the current patch.

-Sumit

>
> /Jarkko
