Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AA8A387A80
	for <lists+keyrings@lfdr.de>; Tue, 18 May 2021 15:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349731AbhERN7M (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 18 May 2021 09:59:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349697AbhERN7C (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 18 May 2021 09:59:02 -0400
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AF75C061573;
        Tue, 18 May 2021 06:57:44 -0700 (PDT)
Received: by mail-il1-x133.google.com with SMTP id g11so5196451ilq.3;
        Tue, 18 May 2021 06:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0oL71Oy3H/CHTvb8C+6ZsDj12BqzersACAVWISPYbd8=;
        b=eRh0T5EVi1kIcpi1vcCkBQrsbPN0jU65b5Z+Xk6EWXTHKmkZJn5WFhQ3sLu5bhKw1x
         AlcHKdW7+uhWDa5X+bF85G0Zubf6TVcj68gM5O56gi0xeq26faQsl/erGF0x6TcPA7L3
         XU5/8KBwOirlV69gr62MNbJzJnItyuzunJlqZ37iCGnm70cxw02PxlLPTtYgZ4vQrrVc
         KMq9asooN+qx3EJfEIWS+cAUNFbYmztihoHEltLxFn3RWtMcKGozUY+31ppoANwX9TzX
         6noIdVAMw7UkcKEcScIEC6KbQEkFHJQweUvRXNln4kHgJKe+6kaHJS8NUXnaVXo3PpCL
         eVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0oL71Oy3H/CHTvb8C+6ZsDj12BqzersACAVWISPYbd8=;
        b=B7K0tzZJINTvsKCUjj04YDBqc2xX08FQawvw40rseVlZ0d6kDXTn3L5BJmL/q3SSUB
         IacQMZHeTFOdlZBFmk5rPqv/+dwmCKtfT/TDCZgB7NrvlqNoUhP7Dxqpww+ZF2K10NlW
         4g+bfeDbhFlNt2sqgab7yZEhkwnaBYDJdxepyIkm1pSuaKt+dGWX14UcBqjpHOnTWS3z
         6YyU0DfSVambe0bmZ4/N9T9ANE6MKndJI5GIP8DCt18MjddLYMkLTKzmfKUIQpOOin3s
         CyEDVEPo2392nD0aSiIX3O5i9Py4MtSpYujX0ROEHfNBVGErYdcVsCuWBQupdv5rOJFq
         0CCg==
X-Gm-Message-State: AOAM531vYMi2n748MkVp7Q7CR821A/eA4+2iupXjMDwj1QsCYKvTQcQH
        3jNrRNTG3gw204+Mb3dntIIxKOaZV3VvatfWikM=
X-Google-Smtp-Source: ABdhPJyfRmH+RE7CHOWqTgnFcTBe0JQF7CKfdZc5YfxJnYKX8l2iTFLkX2Su1s1Gle6uhcKprG96xv0zR4Sz2PWQF8I=
X-Received: by 2002:a92:6b05:: with SMTP id g5mr4411861ilc.40.1621346264021;
 Tue, 18 May 2021 06:57:44 -0700 (PDT)
MIME-Version: 1.0
References: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
 <YJwodhUpsdBbknLo@gmail.com> <dade7666956c41718ce00e681156533e@tencent.com> <YKLeQjjFL88nABqP@gmail.com>
In-Reply-To: <YKLeQjjFL88nABqP@gmail.com>
From:   hongbo li <herbert.tencent@gmail.com>
Date:   Tue, 18 May 2021 21:57:32 +0800
Message-ID: <CABpmuwKjKekcU8NJ1vmH0FD8kE-p_zeTXjuFcDngx8b7qsvY5g@mail.gmail.com>
Subject: Re: [PATCH 0/7] crypto: add eddsa support for x509(Internet mail)
To:     Eric Biggers <ebiggers@kernel.org>
Cc:     =?UTF-8?B?aGVyYmVydGhibGko5p2O5byY5Y2aKQ==?= 
        <herberthbli@tencent.com>,
        "keyrings@vger.kernel.org" <keyrings@vger.kernel.org>,
        "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
        "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
        "dhowells@redhat.com" <dhowells@redhat.com>,
        "jarkko@kernel.org" <jarkko@kernel.org>,
        "tianjia.zhang@linux.alibaba.com" <tianjia.zhang@linux.alibaba.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Eric Biggers <ebiggers@kernel.org> =E4=BA=8E2021=E5=B9=B45=E6=9C=8818=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=885:21=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, May 13, 2021 at 02:44:07PM +0000, herberthbli(=E6=9D=8E=E5=BC=98=
=E5=8D=9A) wrote:
> > =E5=9C=A8 2021/5/13 3:12, Eric Biggers =E5=86=99=E9=81=93:
> >
> > On Wed, May 12, 2021 at 10:04:07PM +0800, Hongbo Li wrote:
> >
> >
> > From: Hongbo Li <herberthbli@tencent.com><mailto:herberthbli@tencent.co=
m>
> >
> > This series of patches add support for x509 cert signed by eddsa,
> > which is described in RFC8032 [1], currently ed25519 only.
> >
> >
> >
> > It would be helpful to explain how this is related to the kernel's exis=
ting
> > Curve25519 support.
> >
> > - Eric
> >
> >
> > Curve25519 is an elliptic curve used for key agreement(ECDH). It is a M=
ontgomery curve.
> >
> > Edwards25519 is a twisted Edwards curve and birationally equivalent to =
Curve25519, the
> > birational maps are described in rfc7748 section 4.1.
> > https://datatracker.ietf.org/doc/html/rfc7748#section-4.1
> >
> >
> > Ed25519 is a Digital Signature Algorithm over Edwards25519.
> >
>
> Sure, but what does that mean in terms of code.  Can you reuse any of the=
 code,
> and if not why not?  I *think* the answer is no, but this is a common poi=
nt of
> confusion, so it would be helpful to properly explain this...
>
> - Eric

Thank you for your review. No, the eddsa can't reuse the code of curve25519=
.
I'll also explain this in the next version of patches.
Regards,
Hongbo
