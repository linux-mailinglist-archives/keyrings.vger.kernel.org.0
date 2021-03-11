Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14B933375CC
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 15:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233927AbhCKOc0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Mar 2021 09:32:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234026AbhCKOcF (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Mar 2021 09:32:05 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE160C061762
        for <keyrings@vger.kernel.org>; Thu, 11 Mar 2021 06:32:04 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id u4so2414127ljo.6
        for <keyrings@vger.kernel.org>; Thu, 11 Mar 2021 06:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mQt7kaRJYFt8oDFazh71/TC2oX7Le0bhMX+W6T/8ZRc=;
        b=aYRrJGJwGkT4xJi5pCXrM8jcy21L7f+STwO3QoU+Vs9TZ2VLdJ1/7lsqOmCUkWKP8K
         35oY0MxUR4SX0mvPIMlpX5OchjTozH1hcgE/WriFMGh22WgRronkhDO6cIfffngc2OtP
         RdwmnbBtUd/xJkdVrErzAxRNQTZ62OzOvoDjZ9W1kTp/UPxAlurKv6z0yOGnktw+QFkV
         nAhOOa8TaFQqD6nQHoow5M4xAeVs3r71JihjTCnJfiSwTZirHmxrNHuvMi4bxf9JmlvL
         hRvrUk663EXap2bpeI2VNyIvCa7wsGvuEIuqjJ2EzNptAWYgpCP3VQWRNWdN95U/uY2V
         KP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mQt7kaRJYFt8oDFazh71/TC2oX7Le0bhMX+W6T/8ZRc=;
        b=Jaip7Kiz6vE06n4rJrd2Pj68ryqMwWUCnnAWkKPZkGewIQrmwKMuEKig/N5u+oHJzm
         gQ/6xeNjSmhmTqov+C1Wvh5YyiHt7a/gwY5VTBPFB8iFZsVdwAly5PUfEXO6PD19un6Q
         /CPooCFc+d4ooPEYFQPFu9IpItkpgB6AP9ua/N6tKW0f0kvzUVefzD7Zq3RLRgydWhhy
         NjirgMe8q/AaRyQQmDwnL75L7T1ZIJmsf9XCWMqxu1iu195sDV+CxN67vMUBP9dYJoG2
         woRAG2tKcxdgUtPpQ6w2dbPuODv7tH6vlDS3fcD/IHFnBbJTmn7B/iQ+GqEBI9mCV5a4
         5lfw==
X-Gm-Message-State: AOAM533PblY8OkHzg6F/Tx4V/gfbu5ai3bcPpCmPpUn7Fhtw68AWajTx
        DcLVJS6NHQEzMe4vopIlqwY77VFyEDi0Na5hw0Nppg==
X-Google-Smtp-Source: ABdhPJwOaYW0aAMgjExPctBh7fOkiJiIQPtqdlOhG4M59lrd1T93Vvq/0iFtbErxLofCa7GawNBwc9InSlR5tA6E0uI=
X-Received: by 2002:a2e:7001:: with SMTP id l1mr4999215ljc.200.1615473123090;
 Thu, 11 Mar 2021 06:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20210303135500.24673-1-alex.bennee@linaro.org>
 <20210303135500.24673-2-alex.bennee@linaro.org> <CAK8P3a0W5X8Mvq0tDrz7d67SfQA=PqthpnGDhn8w1Xhwa030-A@mail.gmail.com>
 <20210305075131.GA15940@goby> <CAK8P3a0qtByN4Fnutr1yetdVZkPJn87yK+w+_DAUXOMif-13aA@mail.gmail.com>
 <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com>
 <6c542548-cc16-af68-c755-df52bd13b209@marcan.st> <CAFA6WYOYmTgguVDwpyjnt3gLssqW48qzAkRD_nyPYg0nNhxT2A@mail.gmail.com>
 <beca6bc8-8970-bd01-8de0-6ded1fb69be2@marcan.st> <CAFA6WYMSJxK2CjmoLJ6mdNNEfOQOMVXZPbbFRfah7KLeZNfguw@mail.gmail.com>
 <CACRpkdZb5UMyq5qSJE==3ZnH-7fh92q_t4AnE8mPm0oFEJxqpQ@mail.gmail.com> <e5d3f4b5-748e-0700-b897-393187b2bb1a@marcan.st>
In-Reply-To: <e5d3f4b5-748e-0700-b897-393187b2bb1a@marcan.st>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 15:31:49 +0100
Message-ID: <CACRpkdYxMGN3N-jFt1Uw4AkBR-x=dRj6HEvDp6g+2ku7+qCLwg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB) subsystem
To:     Hector Martin <marcan@marcan.st>
Cc:     Sumit Garg <sumit.garg@linaro.org>,
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

Hi Marcan,

thanks for the detailed description of your experience with the TPM and
secure enclave! This is the kind of thinking and experience we really
need here because it paints the bigger picture.

I am very happy for involving you in this discussion because of your
wide perspective on these features.

On Thu, Mar 11, 2021 at 10:45 AM Hector Martin <marcan@marcan.st> wrote:

> All of these things make putting keys into TPMs, YubiKeys, the SEP, etc
> a useful thing for anyone, regardless of whether their machine is locked
> down or not.
>
> This is not the case for RPMB. RPMB *relies* on the software running on
> the other side being trusted. RPMB, alone, provides zero new security
> guarantees, without trusted software communicating with it.

I kind of agree.

My position is more like this: different storage media like eMMC,
nvme etc are starting to provide RPMB, so we should provide an
interface to it, harden it and test it, such that trusted systems can
eventually use them, once they get there.

eMMC and NVME already have divergent RPMB userspace
interfaces. The code is already there. An in-kernel interface
and joining the interfaces is under discussion. ($SUBJECT)

Currently engineers are probably concerned with being able to
make use of RPMB in their machines for present day TEE use
cases, but as community we need to think of a future scenario
where we may want to use it, because the abstractions are being
added now, it seems. (Otherwise, in the future, someone is
going to say: "why didn't you think about that from the beginning?")

It's a fine line. Sometimes it becomes just immature up-front
design. Luckily we have people like you telling us off ;)

> With the MAC key provisioning for RPMB being a one-time process, it is
> inherently a very risky operation that a user must commit to with great
> care, as they only get one chance, ever.

Yes.

Current use cases involve that key mostly being set in manufacturing
by vendors and accessible to a TEE-like secure world. It fits
them. Their expectation is that the secure world is managed
by them and tightly connected to the root of trust in the machine.

Then we have these random devices which just happen to
have some RPMB on them, sitting around for no reason.
The software such as a Linux distribution has not figured
out a use case.

As a developer, dark silicon is disturbing to me so I try to think
about a use case.

My idea is more like a one-time use seal: the first user of the
machine can use this RPMB store to get some hardware backing
for rollback, pin attempts etc, but once that user is done
with the machine you have no RPMB anymore (unless the
user gives the key to the next user).

If they just reformat the harddrive and lose the key, the ability
to use this hardware is forever gone.

Then software will cope with the situation. Such things
happen.

It is uncomfortable for those of us coming from the world of
generic computing to think about hardware resources as
one-time-use-only but in other strands of life such as medical
needles this is not unheard of, it happens.

> RPMB was designed for the sole purpose of plugging the secure storage
> replay exploit for Android phones running TrustZone secure monitors. It
> doesn't really do anything else; it's just a single low-level primitive
> and you need to already have an equivalent design that is only missing
> that piece to get anything from it. And its provisioning model assumes a
> typical OEM device production pipeline and integration with CPU fusing;
> it isn't friendly to Linux hackers messing around with securing LUKS
> unlock attempt counters.

I understand your argument, is your position such that the nature
of the hardware is such that community should leave this hardware
alone and not try to make use of RPMB  for say ordinary (self-installed)
Linux distributions?

Yours,
Linus Walleij
