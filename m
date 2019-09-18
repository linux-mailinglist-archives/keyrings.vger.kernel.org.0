Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90AD4B660E
	for <lists+keyrings@lfdr.de>; Wed, 18 Sep 2019 16:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728948AbfIRO1O (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Sep 2019 10:27:14 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:45107 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfIRO1O (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Sep 2019 10:27:14 -0400
Received: by mail-oi1-f194.google.com with SMTP id o205so6088924oib.12;
        Wed, 18 Sep 2019 07:27:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BHV/5Y+4+cCMm6daXLOGdlbWIRWLheVwhv0/ivXbcAE=;
        b=nq4h3v3EIBQhp3sB2ecGD04KWW1+dbvayQTY5UyWMQ+3juIbkpnBrygYDCalljWovR
         BvjDKzzATCSkJxy2GEqac0D8zGjlWecYPftUoq1WULP6PW4GhnQ5sE5etzsbI9IPKvR4
         o3BYxgC+y4qec1jlnFJOB3lpVv8ugn28PWdU3dBVkKk4aXbdAZm5E+/VkGENzNFiz3d6
         tavhTNupDYcH1G1Cf5bOWge+usJFTC9JuWx6znSigkrXTyr5pN0aNJ5Z1dtpiHiuzL4b
         M7qBNYwv+nOXFUyFNQ3Vy5dY2lgCIov5rsm4SMrINGfamBstelOuQ1bDmFFouNvKI7v7
         Ckcg==
X-Gm-Message-State: APjAAAVCNIARJtLNjEMbxFT9W2r/SwIpro32+yuvyek2ftlB8BEfRzdD
        ndhFsWCuQ9yzp7BY9RIdkHmLxj4ikmeAYV89r/M=
X-Google-Smtp-Source: APXvYqzTTZhnmal8UUl1l4fGKNj0vwH/8ztgh2Jwww8ltwigjgo6QuJG49rHLYVXKdkoJ0D+Bgnwc/c/39GCFzhd/4s=
X-Received: by 2002:aca:f305:: with SMTP id r5mr2285556oih.131.1568816833580;
 Wed, 18 Sep 2019 07:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <278d9706-162d-28a4-4640-31b697924473@physik.fu-berlin.de>
 <c5acb1c0-7a5b-ce42-8b2f-5fd30cbdab6e@physik.fu-berlin.de>
 <6304acd1-7b71-b1fb-f8d8-298cb3025e69@physik.fu-berlin.de>
 <6725b972-05d4-fed4-7094-16401e86b452@gmail.com> <578d8a91-aaee-087f-1742-65e64001b8fa@physik.fu-berlin.de>
 <CAMuHMdUU6ejc168-ksqXrkE+PjCXFJumaRaWjRtj12NjG_TFSg@mail.gmail.com>
 <CAMuHMdWfTrx8VuJoifEEBc1n+3MiiuwKNWcRnUw+TgWJCtOWag@mail.gmail.com>
 <fea74ca3-4b24-780f-af74-a786646b1668@physik.fu-berlin.de> <CAMuHMdVeedJZE6mrGdYqRgawUtfu_ww5p-Qg1rLXNmGWiY7Nxg@mail.gmail.com>
In-Reply-To: <CAMuHMdVeedJZE6mrGdYqRgawUtfu_ww5p-Qg1rLXNmGWiY7Nxg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 18 Sep 2019 16:27:02 +0200
Message-ID: <CAMuHMdVHZ9srJcK+PY=YoP55z1NSjBAtkSr2ROA8i84C75v0zQ@mail.gmail.com>
Subject: Can KEY_DH_OPERATIONS become tristate? (was: Re: Kernel 5.3.0 stuck
 during boot on Amiga)
To:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc:     Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        David Howells <dhowells@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

CC crypto keys people

TL;DR: CONFIG_CRYPTO_DH=y is reported to cause boot delays of several
minutes on old and slow machines. Can KEY_DH_OPERATIONS be made tristate?

On Wed, Sep 18, 2019 at 4:08 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, Sep 18, 2019 at 3:57 PM John Paul Adrian Glaubitz
> <glaubitz@physik.fu-berlin.de> wrote:
> > On 9/18/19 3:48 PM, Geert Uytterhoeven wrote:
> > >> Diffie-Hellman doing some heavy crypto lifting on a poor m68k CPU?
> > >>
> > >> Disable CONFIG_CRYPTO_DH?
> > >
> > > See also https://lists.debian.org/debian-68k/2019/04/msg00033.html
> > >
> > > CRYPTO_DH is selected by CRYPTO_DEV_QAT and KEY_DH_OPERATIONS.
> > > The latter is bool, forcing CRYPTO_DH builtin.
> > >
> > > If KEY_DH_OPERATIONS needs to be enabled in a Debian kernel, perhaps
> > > it can be made tristate?
> > It was enabled in [1] as it's required for certain WiFi drivers [2].
> >
> > So, should it be fixed as you suggest or should we selectively disable it on m68k?
>
> Disabling it on m68k could be a first step (any WiFi drivers supported
> on m68k yet?).
>
> Making it tristate is non-trivial, as there are some interdependencies:
>
>     security/keys/Makefile:compat-obj-$(CONFIG_KEY_DH_OPERATIONS) += compat_dh.o
>     security/keys/Makefile:obj-$(CONFIG_KEY_DH_OPERATIONS) += dh.o
>     security/keys/internal.h:#ifdef CONFIG_KEY_DH_OPERATIONS
>     security/keys/keyctl.c:
> (IS_ENABLED(CONFIG_KEY_DH_OPERATIONS)    ? KEYCTL_CAPS0_DIFFIE_HELLMAN
> : 0) |
>
> > > [1] https://salsa.debian.org/kernel-team/linux/commit/88f44cb9eb34098138c79bdab5fae434492866d1
> > > [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=911998

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
