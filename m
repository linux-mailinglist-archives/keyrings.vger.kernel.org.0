Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E827304376
	for <lists+keyrings@lfdr.de>; Tue, 26 Jan 2021 17:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389512AbhAZQFB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Jan 2021 11:05:01 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:18922 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404815AbhAZQE0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 26 Jan 2021 11:04:26 -0500
X-Greylist: delayed 34348 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 Jan 2021 11:04:13 EST
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 10QG3AXH031750;
        Wed, 27 Jan 2021 01:03:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 10QG3AXH031750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611676991;
        bh=Gp5wucTUhPUQty6GR8f7UIG+jue6LBq9QX+xmaU1YYU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wUEyqvtznc/E42rfaUwJXINJP5WJSl+qk7R0X36X6WPctBzw/WjYgDQrEHrHLbX75
         W4IgdH0OL4C3xfXovhomSi6Xxv4Gie0wI45oPuP4IKNyzY6CRR5HSOQN2uoVurFlT4
         vP+RJMvt5qtk9OTyv6ljoAU6Il4I0pIZQJTXNBjsw4P2yn8CsnPhvOBrJx2lqwOvBK
         3zYYU1qeAgXKWPMGznsxAjpuq7UW5qdvEyBlFUWAv5yt5C81QJlia4DdqVuUynmWdS
         T1RuJalfzxEyQ5S4nHeKHnp//z++8nz9eAcA5TnzZILFNcwjxIOdxzhOSc8E240FTx
         rybA0TLiG/I5g==
X-Nifty-SrcIP: [209.85.214.171]
Received: by mail-pl1-f171.google.com with SMTP id h15so7525689pli.8;
        Tue, 26 Jan 2021 08:03:10 -0800 (PST)
X-Gm-Message-State: AOAM530XTjR1Gpy3/VbYs1N9H+jtElzKfAgDLrDqCp6Yqw/bkEndLVAV
        OqcB3ukE9vpAygQPowmIoGkafyCgNRyqciqEK7A=
X-Google-Smtp-Source: ABdhPJxZYzwgnmeNFlAEI1rCQW/OqM+5EYQP/ZNPNPsMV7gV7nA1637Dk6q6gAqi4iufU5LzZz5IUQxBBbhqSXyp6vs=
X-Received: by 2002:a17:90a:9a84:: with SMTP id e4mr458003pjp.87.1611676989939;
 Tue, 26 Jan 2021 08:03:09 -0800 (PST)
MIME-Version: 1.0
References: <20538915.Wj2CyUsUYa@devpool35> <2525730.a3zTd9XyL1@devpool47>
 <CAK7LNAQykaDV4DfOv2xzK1fQLEK_hVY3CamAWNXn+-ELJOJdiA@mail.gmail.com> <2384276.IbH9z7ADXJ@devpool47>
In-Reply-To: <2384276.IbH9z7ADXJ@devpool47>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 27 Jan 2021 01:02:32 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT8-jpAbkjA-pvy4nM+QX9uxVpnjnjW0n+hyyqwX09=7Q@mail.gmail.com>
Message-ID: <CAK7LNAT8-jpAbkjA-pvy4nM+QX9uxVpnjnjW0n+hyyqwX09=7Q@mail.gmail.com>
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

On Tue, Jan 26, 2021 at 5:01 PM Rolf Eike Beer <eb@emlix.com> wrote:
>
> Am Dienstag, 26. Januar 2021, 07:30:03 CET schrieb Masahiro Yamada:
> > On Tue, Jan 26, 2021 at 2:42 PM Rolf Eike Beer <eb@emlix.com> wrote:
> > > Am Mittwoch, 13. Januar 2021, 13:49:12 CET schrieb Rolf Eike Beer:
> > > > Otherwise build fails if the headers are not in the default locatio=
n.
> > > > While
> > > > at it also ask pkg-config for the libs, with fallback to the existi=
ng
> > > > value.
> > >
> > > Can someone please take this through the kbuild-tree? Noone seems to =
be
> > > interested in picking this up so far.
>
> > Is 'PKG_CONFIG' necessary?
> >
> > I see many Makefiles hard-coding 'pkg-config'.
>
> Well, it depends ;)
>
> When people use pkgconf then this usually installs a pkg-config alias, to=
o, so
> that would be no problem. The problem comes when other places in the kern=
el
> start copying that code over, and then hardcode pkg-config for stuff that
> needs a prefixed pkg-config because it is about target code.
>
> Given that I would prefer it this way, but YMMV. If it is that variable t=
hat
> blocks integrating I'll change it.
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


What I understood from commit a8a5cd8b472c is
the cross-compile prefix is needed
only for the target CC.


$(CC)      ->  $(CROSS_COMPILE)pkg-config  (i.e. $(PKG_CONFIG))
$(HOSTCC)  ->  pkg-config


For cross-compiling, the prefixing makes sense
because $(CC) !=3D $(HOSTCC)


In this case, scripts/extract-cert is a host tool
compiled by $(HOSTCC), so I do not see
a good reason to use $(PKG_CONFIG).


If somebody copy-pastes the code without understanding it,
that is their problem.

Let's do proper engineering. :-)



--
Best Regards
Masahiro Yamada
