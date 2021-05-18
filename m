Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C08D387A6D
	for <lists+keyrings@lfdr.de>; Tue, 18 May 2021 15:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245366AbhERNye (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 18 May 2021 09:54:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233507AbhERNye (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 18 May 2021 09:54:34 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36E77C061573;
        Tue, 18 May 2021 06:53:16 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id d24so9454982ios.2;
        Tue, 18 May 2021 06:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+Ych8DYcUXVElDmvkPUsfgZ6P/KroWcBZnZdTpumXr4=;
        b=bdrcV3bP08Sf1zJPC1aDe9qSQR5iA/bRR5RcMxSVyWXWOX4blytj7ld/Fdu/pD4itq
         RD0fE22pMo1pCoq3x8s14GLpW5BRHv6d/m4fbtrv3Kt0Wq+I3nPUzaycWnok8dEk+APG
         7nj1g2MZ2Qnvtof9jNvmdR+/4fwNyuH0VSQb2xccgwvsDXr8g/8NTwYztZ+e5JRh8Ssz
         fiTTsZw0UL0h9ro9qL1BT/NlWQ0t4VWoTiaZeb8oYivx0oWftQMooFoHew4fnSyGxons
         wbZvIzYAjlBjCbPaXn/OvO6STDZ9uT807zaRfv3hoanRk1T5qOfTPQYEzxAcUQYb3T0R
         qxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+Ych8DYcUXVElDmvkPUsfgZ6P/KroWcBZnZdTpumXr4=;
        b=DFAJtQybBm9Yr2cEyuM8c12szZDzHiD/dssH2YofSkRav/P0HPWc+OYhLwhIfHW6kK
         k9Vbu6sRx8ohQeQ13Myp+sPeEpxQQvKaF9ktQYpWgjL7HSeiq1QzWn8JtciAPSqGfq7m
         8cc7d6OGAbPukgK90pskhMiaETRE7rG6p9xseY93RKVSM/cj5355Y9YhaWhZu9vTotoP
         I86mA0Igf+QNmgQFl5ygWNCkRU1+umNlYMszjWIlkaBOHTnmnXRAd0GohS0RROCBzJ8f
         aUyE674/1Yzcb2NLazYr7NdguQv9d4AOqRgzYoCYs2pcqSrOUEIZLC4vvtHnjhrsWYYF
         Kvww==
X-Gm-Message-State: AOAM5302VKS0bN4a4XYx6YzERUyj6eJaI3SehV/8zzBPids9W5IdNF5P
        4rxZg/wjCISt1PbKQoThvl+dJCOt8NlmG3nYm10=
X-Google-Smtp-Source: ABdhPJxndrW1Lo8VxpXdKEYGyFAARChaV8tW7tce/eBW9dWnhqftRu4GyM1CgseOysEVBXnjR2nUU9VXcgTUke3ipHo=
X-Received: by 2002:a5e:a704:: with SMTP id b4mr4358884iod.35.1621345995718;
 Tue, 18 May 2021 06:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
 <1620828254-25545-3-git-send-email-herbert.tencent@gmail.com>
 <YJwnjMQcdKD3Fn25@gmail.com> <c12435701edb4f419b71bfa23be780db@tencent.com> <YKLgIbI583asXCAc@gmail.com>
In-Reply-To: <YKLgIbI583asXCAc@gmail.com>
From:   hongbo li <herbert.tencent@gmail.com>
Date:   Tue, 18 May 2021 21:53:04 +0800
Message-ID: <CABpmuw+hs6__uWF=83psNRX-PbGuo+P8u3WXixswreBsqyne0Q@mail.gmail.com>
Subject: Re: [PATCH 2/7] lib/mpi: use kcalloc in mpi_resize(Internet mail)
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

Ok=EF=BC=8C I'll explain it in the next version of patches.
Regards=EF=BC=8C
Hongbo

Eric Biggers <ebiggers@kernel.org> =E4=BA=8E2021=E5=B9=B45=E6=9C=8818=E6=97=
=A5=E5=91=A8=E4=BA=8C =E4=B8=8A=E5=8D=885:29=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, May 13, 2021 at 02:49:03PM +0000, herberthbli(=E6=9D=8E=E5=BC=98=
=E5=8D=9A) wrote:
> > =E5=9C=A8 2021/5/13 3:08, Eric Biggers =E5=86=99=E9=81=93:
> >
> > On Wed, May 12, 2021 at 10:04:09PM +0800, Hongbo Li wrote:
> >
> >
> > From: Hongbo Li <herberthbli@tencent.com><mailto:herberthbli@tencent.co=
m>
> >
> > We should set the additional space to 0 in mpi_resize().
> > So use kcalloc() instead of kmalloc_array().
> >
> > Signed-off-by: Hongbo Li <herberthbli@tencent.com><mailto:herberthbli@t=
encent.com>
> >
> >
> >
> > Is this fixing something, and if so what?
> >
> > - Eric
> >
> >
> >
> > In lib/mpi/ec.c:
> >
> > /****************
> >  * Resize the array of A to NLIMBS. the additional space is cleared
> >  * (set to 0) [done by m_realloc()]
> >  */
> > int mpi_resize(MPI a, unsigned nlimbs)
> >
> > Like the comment of kernel's mpi_resize(), the additional space need to=
 set to 0,
> > but when a->d is not NULL, it does not set.
> >
> > The kernel's mpi lib is from libgcrypt, the mpi resize in libgcrypt is =
_gcry_mpi_resize()
> > which set the additional space to 0.
> >
> > This issue will cause add_points_edwards() get a wrong result, and lead=
 to a failed
> > eddsa verification.
> >
>
> That sounds like it's fixing an existing bug, regardless of the ed25519 s=
upport.
> If that's indeed the case, what is the impact of that bug, and what commi=
t is it
> fixing?  Please explain in the commit message and not just email.
>
> - Eric
