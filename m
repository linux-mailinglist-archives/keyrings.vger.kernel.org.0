Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDB1B3566C9
	for <lists+keyrings@lfdr.de>; Wed,  7 Apr 2021 10:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238293AbhDGI2A (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 7 Apr 2021 04:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbhDGI2A (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 7 Apr 2021 04:28:00 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DFE9C06174A;
        Wed,  7 Apr 2021 01:27:51 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id z136so9784577iof.10;
        Wed, 07 Apr 2021 01:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=djudLDvHwEVU2WU8NDvA4IyM3ENxYTXigjVkyoD/6zA=;
        b=YVtMO4qROFI2J7M7msR5I/ifZpotUbDk9w+rRLP04uVJomAUAtR/Cx3JpT4QpCyUHM
         tuBEsVUO0hE/v7uXs1ya24JtCLYFtHoUZ6sEYqJ8A3YAL9lTR+R+7CKgKCOvE+0Xomuk
         KNigI7Dio0f1Zf7shf5vIB4C6Q6xxMddkBhg3JsDHMMa0O95ssdrFvlWtouiMmrbrn8s
         e51SarZBEa5r42cLvUEWPKlum5z5LAojm65hyX575gDM6zMsixt7/pBB/lVuT1twp2xI
         DJ43xcs5AUUBQCboa9vzR1L94GEQhZ7UHStB14o/EvqUk7RguwIWDm17z9alJ00F/nzJ
         AoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=djudLDvHwEVU2WU8NDvA4IyM3ENxYTXigjVkyoD/6zA=;
        b=Qu6+ECK9IlZpy8S4bR3FAdI4iA/iTqIp3FhHd1caxjc6eIvIQsjpBTakvDx0YZGETS
         daIqjOvpwx6mEJYEcskazeUGL7h9hKPbWZ+dM0OVFET7Erbyt75gh51TvngNIdKo4kUI
         e+K2jqsQ936FUwRd2xb/5kGQp6lDZ7azNWu0ucM2hrcD7qLvMEZfSYKCvCBSKvYoG8CJ
         UcE4NRW34+POxIGaeT27wy+Icpx8ms2oS+BJoZHeT/ZtD+Nx94P3Y6lQHtq+poUxYx8E
         DOAC9bEoWndL9RZSPtHkUm45lHhtEfG3nVfpSii6kA+ihhb1q9ds4y+Uvc+AZYsUEkX/
         1QnA==
X-Gm-Message-State: AOAM532nyKE3qUSBRId0+m/JTWKC/Xj4QwPI/ekh8wF/SFRfSO+X6lra
        Zmz9JH5e+CPaEPsPYRH/IW1TxdsCRCIcpjdnaYA=
X-Google-Smtp-Source: ABdhPJzL90CZ4H7yfHpvZX2YphgdvTHneERnJtP3zRX/dAAcA0ssysTUIBIrRDUmiyQcAxOXB2AvkybJU9h30AuRX+Q=
X-Received: by 2002:a02:9645:: with SMTP id c63mr2375068jai.84.1617784070654;
 Wed, 07 Apr 2021 01:27:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210330202829.4825-1-varad.gautam@suse.com> <20210330202829.4825-2-varad.gautam@suse.com>
In-Reply-To: <20210330202829.4825-2-varad.gautam@suse.com>
From:   hongbo li <herbert.tencent@gmail.com>
Date:   Wed, 7 Apr 2021 16:27:40 +0800
Message-ID: <CABpmuw+ht5BmNtqN+pJt7A0ZHp7JJArZtj51hkhBc96L8iwvwg@mail.gmail.com>
Subject: Re: [PATCH 01/18] X.509: Parse RSASSA-PSS style certificates
To:     Varad Gautam <varad.gautam@suse.com>
Cc:     linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Vitaly Chikunov <vt@altlinux.org>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello Varad=EF=BC=8C

I also made an implementation of rsa pss: "[PATCH v3 0/4] crypto: add
rsa pss support for x509".
I notice your patches and did some review,  find the following
differences between our patches:
1. You rework the rsa pad framework. This is reasonable.
2. You did some changes on the keyctl and asymmetric struct. I don't
see the reason.
    Because for x509 layer, it only need to know the hash param, and
could ignore other params(salt len, mgfhash).
    Let rsa-pss itself parse the pss related params. So it seems we
don't need to change asymmetric's
    common struct.
3. Why reject the cert whose MGF is different from the hash function
used for signature generation?
   My implementation could support different hashes, so don't get your poin=
t.
4. I add a test vector and a patch to support using rsa-pss for iam.
5. Other implementation difference, i.e. the mgf and verify functions.

Maybe we could merge our patches, what's your opinion?

Best regards

Hongbo

Varad Gautam <varad.gautam@suse.com> =E4=BA=8E2021=E5=B9=B43=E6=9C=8831=E6=
=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=884:31=E5=86=99=E9=81=93=EF=BC=9A
>
> An X.509 wrapper for a RSASSA-PSS signature contains additional
> signature parameters over the PKCSv.15 encoding scheme. Extend the
> x509 parser to allow parsing RSASSA-PSS encoded certificates, with
> the defaults taken from RFC8017.
>
> A certificate is rejected if the hash function used for the MGF is
> different from the hash function used for signature generation,
> although this is allowed in RFC8017.
>
> References: https://tools.ietf.org/html/rfc8017#appendix-C
> Signed-off-by: Varad Gautam <varad.gautam@suse.com>
> ---
>  crypto/asymmetric_keys/Makefile           |   5 +-
>  crypto/asymmetric_keys/x509_cert_parser.c | 152 ++++++++++++++++++++++
>  crypto/asymmetric_keys/x509_rsassa.asn1   |  17 +++
>  include/crypto/public_key.h               |   4 +
>  include/linux/oid_registry.h              |   3 +
>  5 files changed, 180 insertions(+), 1 deletion(-)
>  create mode 100644 crypto/asymmetric_keys/x509_rsassa.asn1
>
