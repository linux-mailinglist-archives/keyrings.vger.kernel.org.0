Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2800730466F
	for <lists+keyrings@lfdr.de>; Tue, 26 Jan 2021 19:38:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731342AbhAZRXN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Jan 2021 12:23:13 -0500
Received: from condef-07.nifty.com ([202.248.20.72]:22969 "EHLO
        condef-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388483AbhAZGni (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 26 Jan 2021 01:43:38 -0500
X-Greylist: delayed 480 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 Jan 2021 01:43:37 EST
Received: from conssluserg-03.nifty.com ([10.126.8.82])by condef-07.nifty.com with ESMTP id 10Q6W1mZ024327
        for <keyrings@vger.kernel.org>; Tue, 26 Jan 2021 15:32:01 +0900
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 10Q6UflO000379;
        Tue, 26 Jan 2021 15:30:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 10Q6UflO000379
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611642641;
        bh=iVaE8IL3BJxmTNmvbOKH4R8adawBu8l6ZHniwssBbIw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=xaAfKfEv9KCwzr40/PlSGZ6mtWVEZEtY96Qby5ePeFFxHwjTrvvPVH3RvTSBvAxow
         zJkQ88d+rP5UY2+avG9lYCxmlQJoiFYyOw3WHy0A1ce/94XJ+Ap3RKPHVFFc+abu9D
         f+2zL8IvSppf/5dx8i7BRRePdglIKfnk4JrfZok1sV78dyrsA66MHMUbENdOw6foVs
         fTx9zWm1O4Js5EMAST0To82whkhYpF/m0g+m6N+gdA/k7ZXbtAtfg4nG9RXXMakTCe
         Nh7AITfcSkUwEA3GEE5YSpFHpYZZN6z9Sk5CHW051lVxpPacgOIjukWp3u2WxKE8YE
         xS6cLvOAry5iw==
X-Nifty-SrcIP: [209.85.214.176]
Received: by mail-pl1-f176.google.com with SMTP id 31so9235929plb.10;
        Mon, 25 Jan 2021 22:30:41 -0800 (PST)
X-Gm-Message-State: AOAM530taaRtw77IHUyIVjGAGxLXGdW5+D2lfuT2P13eChQR1wkW/738
        blYzEPIqw5t4ZySgvLDl0xiT7DD2EHa04Q3m2xE=
X-Google-Smtp-Source: ABdhPJy+7jU88obY9na00ufhW7PvUPgr5fiOuqVCD80+WRyTnU06O0/OflCyXFnPiKeY9a85NjSH5DgbnP60wo8nns4=
X-Received: by 2002:a17:90a:9a84:: with SMTP id e4mr4435656pjp.87.1611642640784;
 Mon, 25 Jan 2021 22:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20538915.Wj2CyUsUYa@devpool35> <2278760.8Yd83Mgoko@devpool35>
 <3394639.6NgGvCfkNl@devpool47> <2525730.a3zTd9XyL1@devpool47>
In-Reply-To: <2525730.a3zTd9XyL1@devpool47>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 26 Jan 2021 15:30:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQykaDV4DfOv2xzK1fQLEK_hVY3CamAWNXn+-ELJOJdiA@mail.gmail.com>
Message-ID: <CAK7LNAQykaDV4DfOv2xzK1fQLEK_hVY3CamAWNXn+-ELJOJdiA@mail.gmail.com>
Subject: Re: [PATCH v5] scripts: use pkg-config to locate libcrypto
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

On Tue, Jan 26, 2021 at 2:42 PM Rolf Eike Beer <eb@emlix.com> wrote:
>
> Am Mittwoch, 13. Januar 2021, 13:49:12 CET schrieb Rolf Eike Beer:
> > Otherwise build fails if the headers are not in the default location. W=
hile
> > at it also ask pkg-config for the libs, with fallback to the existing
> > value.
>
> Can someone please take this through the kbuild-tree? Noone seems to be
> interested in picking this up so far.
>
> Thanks,
>
> Eike
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



Is 'PKG_CONFIG' necessary?

I see many Makefiles hard-coding 'pkg-config'.



--=20
Best Regards
Masahiro Yamada
