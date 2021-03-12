Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E21CB338C1E
	for <lists+keyrings@lfdr.de>; Fri, 12 Mar 2021 13:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhCLL7i (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 12 Mar 2021 06:59:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbhCLL7e (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 12 Mar 2021 06:59:34 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A81C061764
        for <keyrings@vger.kernel.org>; Fri, 12 Mar 2021 03:59:34 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id a1so6401061ljp.2
        for <keyrings@vger.kernel.org>; Fri, 12 Mar 2021 03:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bpfFLNlEFTtLYALUbQ+wZtMSFLoEa38YGl9oGhtt8UU=;
        b=OJ8hOSmZeHOaMypXlHqIgOHHwqUyA+0g8YG/4U7b/fYQ6g4HCAlV6X9TPzumop9vA8
         tkoN5lRrgX8emUbeDsV/4j46mRDMg0ufRupWxDxCo9QSAX5H9bpF1UQ4rigGhUw4T0Dd
         eZZzQ1x3g4sQCQJ3aa/h5qP/MQ6LGzMLkPyc5ywa4TX0D98YEKXuBYt40Vu2eSjc7ToW
         BxTDuwTn0DnAk6dGmloeRM9x0nOe/ygTpeKvWOEDjth6rqt7y14En7Co6lAX3RMGh3gi
         AjrVOE2kpaeBH7gfC2159MMgA1SUp3/irNNIJc6sH8fLV+eHgY2GESnaY4Fh7B0xl4Ad
         LNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bpfFLNlEFTtLYALUbQ+wZtMSFLoEa38YGl9oGhtt8UU=;
        b=jEjHq1cdApoRekLwiv1ssvCefLwCbdSk+k8rJwp7h6tQcUnQ//zle1JtOoRiRlwJgp
         WyzKhVnkzCjzDrlpju+Z4cL+V++G031NzYJM8/KuiWTSsuh7Fb7ehQG0AMVbNm/BLKbX
         vAxKvsryyNV99VJce5id9pUiyIOVEZiF+Em9r4+hf+Qw0wNnrEP2n+S1zcFUcRJmD8aT
         jgih9MFAoHSnnxNkE6UkR0qbdjPpxdU2luNNYYkvQkJOGitPNaI9uVK2eKuQ9U3iE7j2
         YeGJLPurF21QHjxTJQJa3fpQNmxjrci/d/XHE3V3F0YyoqCO1BHAsZYfXXPHxVpn/0Q6
         dBOg==
X-Gm-Message-State: AOAM5305B2G72KJ33ak08QeTeT3k1ga8iGAKs3M8t6o6eIEFAtIkUdML
        N4ZHsPLa8XczvrPNmFntVS6IlNX2besH0Qg4VtqQeg==
X-Google-Smtp-Source: ABdhPJxBpkMW0oIMw6HcC9zHDH/L+Q4z9D32/WawBaLNPoKN8etVYWlF9S7muspZtb9FeRIPoarJptbwT8HAOnqGR3s=
X-Received: by 2002:a2e:557:: with SMTP id 84mr2219735ljf.480.1615550372646;
 Fri, 12 Mar 2021 03:59:32 -0800 (PST)
MIME-Version: 1.0
References: <20210303135500.24673-1-alex.bennee@linaro.org>
 <20210303135500.24673-2-alex.bennee@linaro.org> <CAK8P3a0W5X8Mvq0tDrz7d67SfQA=PqthpnGDhn8w1Xhwa030-A@mail.gmail.com>
 <20210305075131.GA15940@goby> <CAK8P3a0qtByN4Fnutr1yetdVZkPJn87yK+w+_DAUXOMif-13aA@mail.gmail.com>
 <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com>
 <6c542548-cc16-af68-c755-df52bd13b209@marcan.st> <CAFA6WYOYmTgguVDwpyjnt3gLssqW48qzAkRD_nyPYg0nNhxT2A@mail.gmail.com>
 <beca6bc8-8970-bd01-8de0-6ded1fb69be2@marcan.st> <CAFA6WYMSJxK2CjmoLJ6mdNNEfOQOMVXZPbbFRfah7KLeZNfguw@mail.gmail.com>
 <CACRpkdZb5UMyq5qSJE==3ZnH-7fh92q_t4AnE8mPm0oFEJxqpQ@mail.gmail.com>
 <e5d3f4b5-748e-0700-b897-393187b2bb1a@marcan.st> <CACRpkdYxMGN3N-jFt1Uw4AkBR-x=dRj6HEvDp6g+2ku7+qCLwg@mail.gmail.com>
 <02d035ca-697d-1634-a434-a43b9c01f4a9@marcan.st>
In-Reply-To: <02d035ca-697d-1634-a434-a43b9c01f4a9@marcan.st>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Fri, 12 Mar 2021 17:29:20 +0530
Message-ID: <CAFA6WYNzEofaQpEQFRG+XaWQqkEWugOW-1qEf=9J2-tje59QsA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB) subsystem
To:     Hector Martin <marcan@marcan.st>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@linaro.org>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
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

On Fri, 12 Mar 2021 at 01:59, Hector Martin <marcan@marcan.st> wrote:
>
> On 11/03/2021 23.31, Linus Walleij wrote:
> > I understand your argument, is your position such that the nature
> > of the hardware is such that community should leave this hardware
> > alone and not try to make use of RPMB  for say ordinary (self-installed)
> > Linux distributions?
>
> It's not really that the community should leave this hardware alone, so
> much that I think there is a very small subset of users who will be able
> to benefit from it, and that subset will be happy with a usable
> kernel/userspace interface and some userspace tooling for this purpose,
> including provisioning and such.
>
> Consider the prerequisites for using RPMB usefully here:
>
> * You need (user-controlled) secureboot

Agree with this prerequisite since secure boot is essential to build
initial trust in any system whether that system employs TEE, TPM,
secure elements etc.

> * You need secret key storage - so either some kind of CPU-fused key, or
> one protected by a TPM paired with the secureboot (key sealed to PCR
> values and such)
> * But if you have a TPM, that can handle secure counters for you already
> AIUI, so you don't need RPMB

Does TPM provide replay protected memory to store information such as:
- PIN retry timestamps?
- Hash of encrypted nvme? IMO, having replay protection for user data
on encrypted nvme is a valid use-case.

> * So this means you must be running a non-TPM secureboot system
>

AFAIK, there exist such systems which provide you with a hardware
crypto accelerator (like CAAM on i.Mx SoCs) that can protect your keys
(in this case RPMB key) and hence can leverage RPMB for replay
protection.

> And so we're back to embedded platforms like Android phones and other
> SoC stuff... user-controlled secureboot is already somewhat rare here,
> and even rarer are the cases where the user controls the whole chain
> including the TEE if any (otherwise it'll be using RPMB already); this
> pretty much excludes all production Android phones except for a few
> designed as completely open systems; we're left with those and a subset
> of dev boards (e.g. the Jetson TX1 I did fuse experiments on). In the
> end, those systems will probably end up with fairly bespoke set-ups for
> any given device or SoC family, for using RPMB.
>
> But then again, if you have a full secureboot system where you control
> the TEE level, wouldn't you want to put the RPMB shenanigans there and
> get some semblance of secure TPM/keystore/attempt throttling
> functionality that is robust against Linux exploits and has a smaller
> attack surface? Systems without EL3 are rare (Apple M1 :-)) so it makes
> more sense to do this on those that do have it. If you're paranoid
> enough to be getting into building your own secure system with
> anti-rollback for retry counters, you should be heading in that directly
> anyway.
>
> And now Linux's RPMB code is useless because you're running the stack in
> the secure monitor instead :-)
>

As Linus mentioned in other reply, there are limitations in order to
put eMMC/RPMB drivers in TEE / secure monitor such as:
- One of the design principle for a TEE is to keep its footprint as
minimal as possible like in OP-TEE we generally try to rely on Linux
for filesystem services, RPMB access etc. And currently we rely on a
user-space daemon (tee-supplicant) for RPMB access which IMO isn't as
secure as compared to direct RPMB access via kernel.
- Most embedded systems possess a single storage device (like eMMC)
for which the kernel needs to play an arbiter role.

It looks like other TEE implementations such as Trusty on Android [1]
and QSEE [2] have a similar interface for RPMB access.

So it's definitely useful for various TEE implementations to have
direct RPMB access via kernel. And while we are at it, I think it
should be useful (given replay protection benefits) to provide an
additional kernel interface to RPMB leveraging Trusted and Encrypted
Keys subsystem.

[1] https://android.googlesource.com/trusty/app/storage/
[2] https://www.qualcomm.com/media/documents/files/guard-your-data-with-the-qualcomm-snapdragon-mobile-platform.pdf

-Sumit

> --
> Hector Martin (marcan@marcan.st)
> Public Key: https://mrcn.st/pub
