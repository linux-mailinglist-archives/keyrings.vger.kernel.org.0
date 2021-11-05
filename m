Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2702E446022
	for <lists+keyrings@lfdr.de>; Fri,  5 Nov 2021 08:34:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbhKEHgn (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 5 Nov 2021 03:36:43 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:57361 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhKEHgn (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 5 Nov 2021 03:36:43 -0400
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MhlbM-1mDwhn0QXg-00dpmI; Fri, 05 Nov 2021 08:34:03 +0100
Received: by mail-wr1-f47.google.com with SMTP id d24so12347860wra.0;
        Fri, 05 Nov 2021 00:34:02 -0700 (PDT)
X-Gm-Message-State: AOAM532B4KHfzlnjmea5CyCDL0lzYJegFrNYMJGF+gZDGX9naPQQMSBy
        attsLfFm59dKXIHU8g9RA0BhqAR5ceOYCU2hmsU=
X-Google-Smtp-Source: ABdhPJxvgRJPgoHjp3Cm93c7+bPfQdEEsl8T8GZMpa2HolMmJsY0qE+7xHA+Q4coi6dknDfQ3FB44LNPH6v6UQU/yn8=
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr6829494wrd.369.1636097642645;
 Fri, 05 Nov 2021 00:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211105035959.93748-1-masahiroy@kernel.org> <20211105035959.93748-4-masahiroy@kernel.org>
In-Reply-To: <20211105035959.93748-4-masahiroy@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 5 Nov 2021 08:33:46 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3YshR=gXWL1co0ZhAAV+7CymC437-=77rcgTQjPiDfQg@mail.gmail.com>
Message-ID: <CAK8P3a3YshR=gXWL1co0ZhAAV+7CymC437-=77rcgTQjPiDfQg@mail.gmail.com>
Subject: Re: [PATCH 3/5] certs: remove noisy messages while generating the
 signing key
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Ufv6VCK9QyNS6wKk906HEWp6XSjH1SX4vDET4vs/HrEea3MZxL8
 r3/x/1jpEUPkfMMgBEmcrgWTPCKsJKwNICZiQ9HwrnRWuzAwVUD6EEbMrOB8lFNqUB6E7wy
 tpJ04lx27RZuGHMYR4BfyZX9bc7ov5ZA2Adw/u0sOmrnR/n8pFBkoqbaq6pEK/cSoB6QAvP
 g5XmF2gxGydOWFK+fGtTQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LGcYgYDlXTk=:Ls2MeMTTvIuFoWp5GNZIZq
 xwLGMMZLpu0wLA0AdCCLR71pw581IwtUoXSQqzlsn0mCpp7EHCuIRGZSPSX1/UBg7pp2VOW7m
 Ne28zaQCIhFk4Ni2lBGepHgL7XNqvNsXN1MlwoaFzC7VbkrZuRpR67P9cQFZq1NOtsTytOteS
 Krn4Z5kElF+Q0Fn6ygenKmjjcJaAo4Ze6o59WnnaTQdeD72Heh03/X51G9CUsL0+C7aYiBxIl
 M0/tDe2rvwv5luFfwZXplHuyN69uYJsNGoZb+m4htZ33pGAdu+2l3+FP0Dtn5+Xa2cQzOJeTk
 tXJ+Kp2cDITJhea3Xer85gfrLb2aqDrzrvVQNZOHOQ4YblMntYzfyYBxzohAgnebgDx1kCA8A
 UmSyglDNEyl1sb++kVtBi2LGn201U/hxUyuclh7uHXMGR+8kCO8TeGhx03h0+T/Anl4kb2dfU
 9rSl7SfIQ3t/l5U4kzgfWMxFsXazO5NzPTYTZRA1hQ0+lG8iLlKf8P/Z3jNZKlKdeT0Hq7D87
 234WYdLcUvdbjKnotd0qgxW2n12V3UlrFY0Wt1K+ePJetf03+xeYMP/t7boBJ7L5OOocC1OzW
 0CmWiYUDT38t+jAwfCHKtHf6wtTxte0IqGJrlx0ZD+7LjinxOrU2sx3NZDrayDnHRHFrUByO+
 fpa8Trr4RMs24ND0Hdqhn6GzSecjwgycCSLSE46PovrMgLIXR48u/3otzGr4QxFG4I0I=
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Nov 5, 2021 at 4:59 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> When you run Kbuild with the parallel option -j, the messages from this
> rule and others are interleaved, like follows:
>
>     ###
>       CC      arch/x86/mm/pat/set_memory.o
>     ### Now generating an X.509 key pair to be used for signing modules.
>     ###
>     ### If this takes a long time, you might wish to run rngd in the
>     ### background to keep the supply of entropy topped up.  It
>       CC      arch/x86/events/intel/bts.o
>       HDRTEST usr/include/linux/qnx4_fs.h
>       CC      arch/x86/events/zhaoxin/core.o
>     ### needs to be run as root, and uses a hardware random
>     ### number generator if one is available.
>       AR      init/built-in.a
>     ###
>
> On modern machines, it does not take a long time to generate the key.
>
> Remove the ugly log messages.

I have no real objection to this, but I would still point out that
the warning message may still be helpful for those building
in a virtual machine or some other environment without a hwrng,
and that most people wouldn't see the message anway if they
built with 'make -s', at least after my 5d06ee20b662 ("modsign:
hide openssl output in silent builds").

I wonder if it would be time to change the default output to
be more quiet, by degrading it one level, like

                    old           new
only warnings       make -s       make
CC file.o           make          make V=1
full cmdline        make V=1      make V=2

This would take some time to adjust to, but it does sound like
a more reasonable default. Does anyone still build without -s
in practice?

        Arnd
