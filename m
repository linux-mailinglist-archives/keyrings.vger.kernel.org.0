Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4459D39B038
	for <lists+keyrings@lfdr.de>; Fri,  4 Jun 2021 04:13:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhFDCPD (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 3 Jun 2021 22:15:03 -0400
Received: from mail-lf1-f47.google.com ([209.85.167.47]:33716 "EHLO
        mail-lf1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229758AbhFDCPD (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 3 Jun 2021 22:15:03 -0400
Received: by mail-lf1-f47.google.com with SMTP id t7so4596469lff.0;
        Thu, 03 Jun 2021 19:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e938uIx3j0ytYF43Gu2UvAvTYhUrU4CqL39m4sXKDLo=;
        b=jB1o57YFZ/z0UbSQMIix1odWKf3OKj1Vgv/cx+oEn2BynbKVvg9pupzQed/QD90X11
         lu72W+nmvPDDJe4OzPjww9OIaoAxobSsxWT/KDppr2lZViTBJWNNRF74KBCrvSDE8AWB
         csSm2g1MuA7/AD9ML5bsrsX8MUOT7hqq2A+oOj8Sicsww+XmeiJuVzPBKGf/F6wzs0W9
         7G1EMfBsXShX55BN2MAShuDehdhr9Zmhs3nJ57j7/plSPpHJ5s1xuAzK2tAYrA8iueWs
         RH22q1SxsROzvJUFrgnae0Sbs7qfVptfoE6Xt1AZH/efiOCCfL1MsplNcDDOR37oL8RM
         LAcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e938uIx3j0ytYF43Gu2UvAvTYhUrU4CqL39m4sXKDLo=;
        b=UcZ1vmj32dOQnwaivpAQSdh1a0MlGbonCxtfmd7txy4pAKjl2lBGMf1tOk8EK3Kq55
         y/VTjrAZs64wTCWQzNVPbzYhRfNeMWUAmd5e5Qgho2dyhrw6T47/M4mbY4OFZOd1ELh/
         QkZ48ijlS9ruav2hXQ32QnnFyzREApZXR2kBL9XKPbvfmiIxqN42M7oXonJEVD1IrDDC
         jcRD96pQRu5sBdLWUvGvJnGUBPS2fy/nIEKDusViqMjMDCcvVsIATmuKxfEkZYs61FPj
         OK599bXZ9HeOZzWmwykbYQBBxh1Ik9pCgTjthY5r5zxHdircOZQyv+/xUHubOnXGopDb
         b96Q==
X-Gm-Message-State: AOAM530WlJP767ZoEI3PPdr3WywbG5vQnyvbFyNAblLU3IDtD4goKeHg
        gla57hbrgfP51rCHtLB5cFxk6Ky4ScRJ4y0G71g=
X-Google-Smtp-Source: ABdhPJyS7VJbQHWYeAVHWleNzp1SXF1+rmRnM1VyuMhNAt40ga1HjAGJ1WD9vjZKZle7LrPwk2tDKOOYpuiB8Hw9yNE=
X-Received: by 2002:a05:6512:21ae:: with SMTP id c14mr1162158lft.483.1622772721138;
 Thu, 03 Jun 2021 19:12:01 -0700 (PDT)
MIME-Version: 1.0
References: <1622552752-15501-1-git-send-email-herbert.tencent@gmail.com> <20210603123357.GM6161@gondor.apana.org.au>
In-Reply-To: <20210603123357.GM6161@gondor.apana.org.au>
From:   hongbo li <herbert.tencent@gmail.com>
Date:   Fri, 4 Jun 2021 10:11:51 +0800
Message-ID: <CABpmuwJepSr3eE9OQoNUV6761agn7+OU1eG766W2B96rVo1S3A@mail.gmail.com>
Subject: Re: [PATCH] crypto: sm2 - fix a memory leak in sm2
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        linux-crypto@vger.kernel.org, Eric Biggers <ebiggers@kernel.org>,
        David Howells <dhowells@redhat.com>, jarkko@kernel.org,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        =?UTF-8?B?aGVyYmVydGhibGko5p2O5byY5Y2aKQ==?= 
        <herberthbli@tencent.com>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Thank you for your review, I will resend this patch.
Regards,
Hongbo

Herbert Xu <herbert@gondor.apana.org.au> =E4=BA=8E2021=E5=B9=B46=E6=9C=883=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=888:34=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On Tue, Jun 01, 2021 at 09:05:52PM +0800, Hongbo Li wrote:
> > From: Hongbo Li <herberthbli@tencent.com>
> >
> > SM2 module alloc ec->Q in sm2_set_pub_key(), when doing alg test in
> > test_akcipher_one(), it will set public key for every test vector,
> > and don't free ec->Q. This will cause a memory leak.
> >
> > This patch alloc ec->Q in sm2_ec_ctx_init().
> >
> > Fixes: ea7ecb66440b ("crypto: sm2 - introduce OSCCA SM2 asymmetric ciph=
er algorithm")
> > Signed-off-by: Hongbo Li <herberthbli@tencent.com>
> > Cc: stable@vger.kernel.org # v5.10+
> > Reviewed-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
> > ---
> >  crypto/sm2.c | 24 ++++++++++--------------
> >  1 file changed, 10 insertions(+), 14 deletions(-)
>
> Your patch has been discarded by patchwork because you didn't
> update the Subject.  The usual method is to use a version prefix
> such as v2, v3, etc. so that the Subject remains distinct.
>
> Please resubmit with a new Subject.
>
> Oh and don't cc stable@vger.kernel.org.
>
> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
