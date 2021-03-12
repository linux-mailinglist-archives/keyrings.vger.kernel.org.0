Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D234B33887F
	for <lists+keyrings@lfdr.de>; Fri, 12 Mar 2021 10:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232834AbhCLJW7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 12 Mar 2021 04:22:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232828AbhCLJWh (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 12 Mar 2021 04:22:37 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78283C061763
        for <keyrings@vger.kernel.org>; Fri, 12 Mar 2021 01:22:37 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id p21so44556031lfu.11
        for <keyrings@vger.kernel.org>; Fri, 12 Mar 2021 01:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oc5bTi7/1MBiAyWrb/BCqxKaS2n3HhEl1VJrsEcMc6k=;
        b=KDFdseRP1eAOQEMh2Ks3MiJXJtEoNybe7gdJzx1f/I/PLG7U3A/Moiz1/CxbjuJp72
         fpQqvBBkdC/hcLc3wA5TCEOTBLQ2aFBVwqDB97xSBmttxHg/ydqlbdZzR84D1tQsdnS/
         76mH37N6q/1iS6dVN96PQqaGQEN2ckQV9xhaYowqgSr3ZxIvxDJz8j8WiV8HgEyWOqUH
         RVq1S9eXjzn4oixocusNCm6/y08R7v8wf3TE8TRbjFbF6Ph0n578RuEXpmi1m1rvxszD
         4WYDpUzpSr4gMYS0qyXesNgBNsnLP3EK6sYBecZmnUrFJwYRLvnAdQKzJfJDs2R7APZw
         aFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oc5bTi7/1MBiAyWrb/BCqxKaS2n3HhEl1VJrsEcMc6k=;
        b=SZM/qLjEWIS2NIFVaMPTe3wjxtWNhe6oTL54hIDgfN7bSxWU9IvoOsFDG+p2wSGGnU
         6Q4HD40JmZ4OUacMXkAcS40T4RzhML7lXAyNEZKRaNqlysWPaSSvyhbY4tO8DwkoOoiy
         9vY1LZjqcV8SLc6T5lVsAgpwWDFHwfxJamTvsL60xbwDGI04sllIp19XX1VlOSZBTL/R
         Hd2JascIQBsefbblQ9omNg4cQBI+ATwT8+rxZlSKPyz7MQRwb/VBL291CHkJEUr0PLgB
         sMK/ziBKJly5MJtrrbfnahjdb9vd7J+NIpoBBGAhfsG+M7PqR+ToAm+tTqp16z2fusvl
         kLCw==
X-Gm-Message-State: AOAM532QAxwS1CC+DQuQvK2mZVVZ21rsy37uWjrFefvSAXYwe3mRGfko
        9L0Oef1/tZ0IJ6lkTcixvQbZ6pBZFvi5fgy6kUJYRg==
X-Google-Smtp-Source: ABdhPJwi966hWS07LJwz9bEWS3611t5gBvrGW9dceY/bml/CRf47iE8bUw+ljH42WS1Quj2YyGgFvZuR2EaxJaPOnZE=
X-Received: by 2002:a05:6512:243:: with SMTP id b3mr4968951lfo.529.1615540955761;
 Fri, 12 Mar 2021 01:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20210303135500.24673-1-alex.bennee@linaro.org>
 <20210303135500.24673-2-alex.bennee@linaro.org> <CAK8P3a0W5X8Mvq0tDrz7d67SfQA=PqthpnGDhn8w1Xhwa030-A@mail.gmail.com>
 <20210305075131.GA15940@goby> <CAK8P3a0qtByN4Fnutr1yetdVZkPJn87yK+w+_DAUXOMif-13aA@mail.gmail.com>
 <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com>
 <6c542548-cc16-af68-c755-df52bd13b209@marcan.st> <CAFA6WYOYmTgguVDwpyjnt3gLssqW48qzAkRD_nyPYg0nNhxT2A@mail.gmail.com>
 <beca6bc8-8970-bd01-8de0-6ded1fb69be2@marcan.st> <CACRpkdbQks5pRFNHkNLVvLHCBhh0XCv7pHYq25EVAbU60PcwsA@mail.gmail.com>
 <0a26713a-8988-1713-4358-bc62364b9e25@marcan.st> <CACRpkda9f-BNmu-CaNsghnDoOcSXvvvji=tag2Xos+tg_nNZ0w@mail.gmail.com>
 <32bdceb1-e70d-7481-96e3-a064a7108eb9@marcan.st> <CACRpkdZ_-rqGBUOxUcBPeqVkLzX=Q9pjO9M+zY20-S9tNXAE0Q@mail.gmail.com>
 <d7f8a732-7a44-f609-52dc-3ba824a3d192@marcan.st>
In-Reply-To: <d7f8a732-7a44-f609-52dc-3ba824a3d192@marcan.st>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 12 Mar 2021 10:22:24 +0100
Message-ID: <CACRpkdZmXMgAWkPDoi=_tDHuC4W2_PMa892XLLHJz27ChDLD2Q@mail.gmail.com>
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

Hi Hector,

thanks for the long and detailed answer! I learn new things
all the time. (Maybe one day I add something too, who knows.)

I hope I'm not taking too much of your time, we're having fun :)

On Thu, Mar 11, 2021 at 9:02 PM Hector Martin <marcan@marcan.st> wrote:
> On 11/03/2021 23.06, Linus Walleij wrote:
> > Yes. And this is what mobile phone vendors typically did.
> >
> > But the nature of different electrical attacks made them worried
> > about different schemes involving cutting power and disturbing
> > signals with different probes, so they wanted this counter
> > implemented in hardware and that is why RPMB exists at all
> > (IIUC).
>
> No, prior to RPMB there was no such secure counter at all. The problem
> is that non-volatile erasable storage (i.e. EEPROM/Flash) is
> incompatible with modern SoC manufacturing processes, so there is no way
> to embed a secure counter into the main SoC. And once your counter needs
> to be external, there needs to be a secure communications protocol to
> access it. This is what RPMB implements.
>
> For preventing software downgrades, especially of bootloader code, this
> can be implemented with one-time fuses embedded in the SoC, but there is
> a limited supply of those. So this doesn't work for things like PIN
> attempt counters. For that you need a secure external counter.

Actually what we did (I was there, kind of) was to go to the flash vendors
(IIRC first Intel) and require what is today called "fuses" in the flash
memory.

Originally this was for things like unique serial numbers set in
production. But they could easily add some more of it for other
use cases.

This became what is known as OTP (one time programmable flash).
The OTP was all set to 1:s when the flash was new, then what we
did for anti-rollback was to designate some bits for software versions.

To make sure the OTP readout wasn't tampered with, some additional
hashes of the OTP was stored in the flash and MAC signed. This was
recalculated when we changed a bit from 1->0 in the OTP to indicate
a new firmware version.

Clever, isn't it? :)

I think the scheme in RPMB was based in part on the needs
solved by that crude mechanism.

(Linux MTD did actually even gain some support for OTP recently,
it is used only from userspace AFIAK.)

> RPMB isn't pointless; what I am saying is that
> if you strip away everything but the counter functionality, you can
> still build equivalent security guarantees. You still need the counter.
> There is no way to get that counter without RPMB or something like it
> (another option is e.g. to use a smartcard IC as a secure element; AIUI
> modern Apple devices do this). Software alone doesn't work. This is why
> I wrote that article about how the FBI cracks iPhones; that works
> because they weren't using a secure rollback-protected storage/counter
> chip of any kind.

Yeah. Hm, actually if they had flash memory they should have
used the OTP... But I suppose they were all on eMMC.

> it helps if you forget about the read/write commands and treat
> it as a simple counter.

Yep you're right.

> Once you do that, you'll realize that e.g. putting keys in RPMB doesn't
> really make sense as a kernel primitive. The usefulness of RPMB is
> purely in the integration of that counter (which is equivalent to
> rollback-protected storage) with a policy system. Everything else is
> icing on the cake; it doesn't create new use cases.

OK I understand. So what you're saying is we can't develop
anything without also developing a full policy system.

> Consider this:
(...)
> You have now built a secure, rollback-protected Git repository, with
> similar security properties to RPMB storage, without using RPMB storage;
> just a counter.

This example of using the RPMB to protect rollback of a git
was really nice! I think I understood as much before but
maybe I don't explain that well enough :/

> Thus, we can conclude that the storage features of RPMB do not provide
> additional security properties that cannot be derived from a simple counter.

I agree.

> * Disclaimer: please don't actually deploy this; I'm trying to make a
> point here, it's 5AM and I'm not claiming this is a perfectly secure
> design and I haven't missed anything. Please don't design
> rollback-protected Git repositories without expert review. I am assuming
> filesystem mutations only happen between operations and handwaving away
> active attacks, which I doubt Git is designed to be robust against. A
> scheme like this can be implemented securely with care, but not naively.

It's an example all kernel developers can relate to, so the
educational value is high!

> Well, that's what I'm saying, you do need secureboot for this to make
> sense :-)
>
> RPMB isn't useless and some systems should implement it; but there's no
> real way for the kernel to transparently use it to improve security in
> general (for anyone) without the user being aware. Since any security
> benefit from RPMB must come from integration with user policy, it
> doesn't make sense to "well, just do something else with RPMB because
> it's better than nothing"; just doing "something" doesn't make systems
> more secure. There needs to be a specific, practical use case that we'd
> be trying to solve with RPMB here.

As of now there are no other real world examples than TEE
for this user policy. TPM and secure enclave exist, but they both
have their own counters and does not need this.

Can one realistically imagine another secure environment
needing a RPMB counter? If not, then TEE (tee-supplicant is
the name of the software daemon in userspace for OP-TEE,
then some vendors have their own version of TEE)
will ever be the only user, and then we only need to design
for that.

Yours,
Linus Walleij
