Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E556B337514
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 15:08:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233563AbhCKOHu (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Mar 2021 09:07:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233716AbhCKOHS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Mar 2021 09:07:18 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192DDC061760
        for <keyrings@vger.kernel.org>; Thu, 11 Mar 2021 06:07:18 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id r20so2290329ljk.4
        for <keyrings@vger.kernel.org>; Thu, 11 Mar 2021 06:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CHnGCeoowP5PFesTvIESZpd7+nGkmxFN1dwqmxmprX0=;
        b=P9jt8a/PZFgZ7/tm4OY+mMakXBfjAqCxLNc6hLIgsguSdWN+nw9CovlkNe3KK5Tmm0
         9cTobVG9wP6LXfdR3gKpkt9q/YmzFNYCeVMlrGeA+PZJLepUZmSrIEhG0Ghd3ZFyg3JB
         kfBsIL3bPaLsqZH+HPi3KYwe8BcF90sxYez8S7jZ9bWMiog+XmtKQgDKHZOUgoUQC3fw
         xtedydsZXIpmMrz8LXXH8XzApOPD0h+75d5pIFB8aAk5K2qhq35R1Jv9i2HEecEtnoBA
         WylYvJkZIKq+BX2l6xYPvS0nFLZQyIQH+OSzO1wCq3pVD8Q93813Cspex8me5vTILhVT
         hPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CHnGCeoowP5PFesTvIESZpd7+nGkmxFN1dwqmxmprX0=;
        b=TTCLLV6te4/WXvsdlWURVENXqrWEzci23wmK04CZFrBnlbF6iqV4v+WlcMbyo1/7ZO
         nZjEdn+paPwDLdCEMpKT9xnkNNdn+n4a+kBA3JRtkIeaxkwHtD2YVU8btWzMUgW8Gbz2
         lY2XVYOIYwcRbXMUKZ/gAU3CSk8Hy3atywZaUfzMYdXr7sc0e9hrS/99FfMVdeRJOk4R
         YG76UTbz2HBSEbwKvbuzpER63hfttYyZULy7BqaAcHMj01DPuToILAvF8T1gNlIxk4D6
         Oovwmb8oq4mL1MBIHnONruTPx8fIMxtDntOlSKAaUGxzjdgPAOeEPtTdWa/f8lPCAil3
         wyAA==
X-Gm-Message-State: AOAM533k+5Bij99dJua5vlk5pOemtBIfNo2jWDgn7fUehS6Y6tsbk4bN
        riSW7Dxljujwu/zYvGat98o4B5sCD+oqp8lRBTiGYA==
X-Google-Smtp-Source: ABdhPJwQ5esO5Sin3fijGmoE+OqN66wCX8HD+BkG0ZXsi8bRbxw+rjWiMQ9W9fBkMMlpK8/9mHZZhTuy1tNh/JkXIy8=
X-Received: by 2002:a2e:864a:: with SMTP id i10mr4758406ljj.467.1615471636398;
 Thu, 11 Mar 2021 06:07:16 -0800 (PST)
MIME-Version: 1.0
References: <20210303135500.24673-1-alex.bennee@linaro.org>
 <20210303135500.24673-2-alex.bennee@linaro.org> <CAK8P3a0W5X8Mvq0tDrz7d67SfQA=PqthpnGDhn8w1Xhwa030-A@mail.gmail.com>
 <20210305075131.GA15940@goby> <CAK8P3a0qtByN4Fnutr1yetdVZkPJn87yK+w+_DAUXOMif-13aA@mail.gmail.com>
 <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com>
 <6c542548-cc16-af68-c755-df52bd13b209@marcan.st> <CAFA6WYOYmTgguVDwpyjnt3gLssqW48qzAkRD_nyPYg0nNhxT2A@mail.gmail.com>
 <beca6bc8-8970-bd01-8de0-6ded1fb69be2@marcan.st> <CACRpkdbQks5pRFNHkNLVvLHCBhh0XCv7pHYq25EVAbU60PcwsA@mail.gmail.com>
 <0a26713a-8988-1713-4358-bc62364b9e25@marcan.st> <CACRpkda9f-BNmu-CaNsghnDoOcSXvvvji=tag2Xos+tg_nNZ0w@mail.gmail.com>
 <32bdceb1-e70d-7481-96e3-a064a7108eb9@marcan.st>
In-Reply-To: <32bdceb1-e70d-7481-96e3-a064a7108eb9@marcan.st>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 15:06:57 +0100
Message-ID: <CACRpkdZ_-rqGBUOxUcBPeqVkLzX=Q9pjO9M+zY20-S9tNXAE0Q@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB) subsystem
To:     Hector Martin <marcan@marcan.st>
Cc:     David Howells <dhowells@redhat.com>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Sumit Garg <sumit.garg@linaro.org>,
        Arnd Bergmann <arnd@linaro.org>,
        Joakim Bech <joakim.bech@linaro.org>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Maxim Uvarov <maxim.uvarov@linaro.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Ruchika Gupta <ruchika.gupta@linaro.org>,
        "Winkler, Tomas" <tomas.winkler@intel.com>, yang.huang@intel.com,
        bing.zhu@intel.com, Matti.Moell@opensynergy.com,
        hmo@opensynergy.com, linux-mmc <linux-mmc@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        linux-nvme@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Arnd Bergmann <arnd.bergmann@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Mar 11, 2021 at 10:22 AM Hector Martin <marcan@marcan.st> wrote:
> On 11/03/2021 09.36, Linus Walleij wrote:

> > The typical use-case mentioned in one reference is to restrict
> > the number of password/pin attempts and  combine that with
> > secure time to make sure that longer and longer intervals are
> > required between password attempts.
> >
> > This seems pretty neat to me.
>
> Yes, but to implement that you don't need any secure storage *at all*.
> If all the RPMB did was authenticate an incrementing counter, you could
> just store the <last timestamp, attempts remaining> tuple inside a blob
> of secure (encrypted and MACed) storage on any random Flash device,
> along with the counter value, and thus prevent rollbacks that way (some
> finer design points are needed to deal with power loss protection and
> ordering, but the theory holds).

Yes. And this is what mobile phone vendors typically did.

But the nature of different electrical attacks made them worried
about different schemes involving cutting power and disturbing
signals with different probes, so they wanted this counter
implemented in hardware and that is why RPMB exists at all
(IIUC).

It is fine to be of the opinion that this entire piece of hardware
is pointless because the same can be achieved using
well written software.

The position that the kernel community shall just ignore this
hardware is a possible outcome of this discussion, but we need
to have the discussion anyway, because now a RPMB framework
is being promoted. The people who want it will need to sell it to
us.

> > With RPMB this can be properly protected against because
> > the next attempt can not be made until after the RPMB
> > monotonic counter has been increased.
>
> But this is only enforced by software. If you do not have secure boot,
> you can just patch software to allow infinite tries without touching the
> RPMB. The RPMB doesn't check PINs for you, it doesn't even gate read
> access to data in any way. All it does is promise you cannot make the
> counter count down, or make the data stored within go back in time.

This is true, I guess the argument is something along the
line that if one link in the chain is weaker, why harden
any other link, the chain will break anyway?

(The rest of your message seems to underscore this
position.)

I am more of the position let's harden this link if we can
and then deal with the others when they come up, i.e.
my concern is this piece of the puzzle, even if it is not
the centerpiece (maybe the centerpiece is secure boot
what do I know).

Yours,
Linus Walleij
