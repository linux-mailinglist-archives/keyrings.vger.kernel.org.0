Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B490446058
	for <lists+keyrings@lfdr.de>; Fri,  5 Nov 2021 08:56:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231708AbhKEH6y (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 5 Nov 2021 03:58:54 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:65031 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbhKEH6y (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 5 Nov 2021 03:58:54 -0400
X-Greylist: delayed 14121 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Nov 2021 03:58:53 EDT
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 1A57tw8L003117;
        Fri, 5 Nov 2021 16:55:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 1A57tw8L003117
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636098959;
        bh=eUeAMxtwxFFh8Dwf2BE8J5fy9OSlHDE5RkEUpDimoWA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=eHv2TFOD2/lGIBDU2aeiIYblXhXO033DBnKQ11fCNHZpEVYC1GdKUzT+OmLDA0ET1
         esjbD124Fz78rGhRM9SjnqwuQ3lVZdjmqDDwRlNNUts9pvatbxm67V/c7RDSflrFeS
         L+qEdZZHmSTu/keMuRkpDfUZ2kGK3PI3aXMRHAbq56n3H3Oxt9MtJ++aKOpouTc2bS
         CkgWXdow3rB0DBohVPF6N8qpfK6u4ib99NniXOwN9t1JK/WpoZlM1X0EQWf/HQNPz+
         ICRzzPLyZPmGdl84h4XxYGlY9dcueTacCMRmBfd37NCrSULcVh0EWLeQaBPq2RHVNH
         RiFlboMCVP6RA==
X-Nifty-SrcIP: [209.85.210.172]
Received: by mail-pf1-f172.google.com with SMTP id x131so3015874pfc.12;
        Fri, 05 Nov 2021 00:55:59 -0700 (PDT)
X-Gm-Message-State: AOAM530eVafANLCq5HJKaKAIKxj8genqPfxUSNzCn1P7f9ZglENLd3uj
        LcvvClb0MA1iwBlvC7dW0mowHAP9+TVJjTZJfJY=
X-Google-Smtp-Source: ABdhPJyhFL6Tp/ZS4djPor06mdMxajCscy5SE9HhwBdmwd5K7yoOPvj4u1mDzVtPVlUeCN6lyWYjAxCrTEK2GfPni4Q=
X-Received: by 2002:a05:6a00:1584:b0:489:4f9c:6e3a with SMTP id
 u4-20020a056a00158400b004894f9c6e3amr20905091pfk.32.1636098958464; Fri, 05
 Nov 2021 00:55:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211105035959.93748-1-masahiroy@kernel.org> <20211105035959.93748-4-masahiroy@kernel.org>
 <CAK8P3a3YshR=gXWL1co0ZhAAV+7CymC437-=77rcgTQjPiDfQg@mail.gmail.com>
In-Reply-To: <CAK8P3a3YshR=gXWL1co0ZhAAV+7CymC437-=77rcgTQjPiDfQg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 5 Nov 2021 16:55:21 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQs5jCQ0kNKXWrTGEu45K+1mTGXWZrhgA3u8hv+yNfeSg@mail.gmail.com>
Message-ID: <CAK7LNAQs5jCQ0kNKXWrTGEu45K+1mTGXWZrhgA3u8hv+yNfeSg@mail.gmail.com>
Subject: Re: [PATCH 3/5] certs: remove noisy messages while generating the
 signing key
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Nov 5, 2021 at 4:34 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Nov 5, 2021 at 4:59 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > When you run Kbuild with the parallel option -j, the messages from this
> > rule and others are interleaved, like follows:
> >
> >     ###
> >       CC      arch/x86/mm/pat/set_memory.o
> >     ### Now generating an X.509 key pair to be used for signing modules.
> >     ###
> >     ### If this takes a long time, you might wish to run rngd in the
> >     ### background to keep the supply of entropy topped up.  It
> >       CC      arch/x86/events/intel/bts.o
> >       HDRTEST usr/include/linux/qnx4_fs.h
> >       CC      arch/x86/events/zhaoxin/core.o
> >     ### needs to be run as root, and uses a hardware random
> >     ### number generator if one is available.
> >       AR      init/built-in.a
> >     ###
> >
> > On modern machines, it does not take a long time to generate the key.
> >
> > Remove the ugly log messages.
>
> I have no real objection to this, but I would still point out that
> the warning message may still be helpful for those building
> in a virtual machine or some other environment without a hwrng,
> and that most people wouldn't see the message anway if they
> built with 'make -s', at least after my 5d06ee20b662 ("modsign:
> hide openssl output in silent builds").
>
> I wonder if it would be time to change the default output to
> be more quiet, by degrading it one level, like
>
>                     old           new
> only warnings       make -s       make
> CC file.o           make          make V=1
> full cmdline        make V=1      make V=2
>
> This would take some time to adjust to, but it does sound like
> a more reasonable default. Does anyone still build without -s
> in practice?


Yes, me.

I usually build normally (CC file.o log style).

I am opposed to making silent builds default.

People would be upset if they do 'make' to
see nothing in the terminal.




-- 
Best Regards
Masahiro Yamada
