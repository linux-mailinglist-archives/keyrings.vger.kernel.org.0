Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5B9333A08
	for <lists+keyrings@lfdr.de>; Wed, 10 Mar 2021 11:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbhCJK34 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Mar 2021 05:29:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231828AbhCJK3j (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Mar 2021 05:29:39 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D4EC061763
        for <keyrings@vger.kernel.org>; Wed, 10 Mar 2021 02:29:38 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id v9so32616683lfa.1
        for <keyrings@vger.kernel.org>; Wed, 10 Mar 2021 02:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hZu8kYWcUsjJZQZLgu1XKiWKVJDy+c+Bw7NCUyMv0Bc=;
        b=RJH9YJ4ctf1i7yh5gwJmVZ6iIZEtaOi4hcZsPJS+3fHl6JJRW9vQcHUJuIbxI7ELPW
         4WWZ7RYqXaZCBUAmpCBQibq4rGpusj9qpj7lq4rIsorl11VcXQWfGJ/1U8KC/nXVH0lC
         X5enEIdvBbbV7lC+KCEhzTEZxen86rsiL5tYoCOGGj56VETxgkV3iU/jxhh+EA3a9RPu
         3rzJnssS2eVBVNTlQRd/h34engsUMq7A63Zn5Va3+VeF/B5tGfVPWLfn5WR4G2Mtxn0I
         9Ry+cNgqM6c5mrkJFQS4CxtCLc91eV+wfOLKMTeAdLbtGmTT4WDXeKYQ2R9eZ1bsyD1g
         Y35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hZu8kYWcUsjJZQZLgu1XKiWKVJDy+c+Bw7NCUyMv0Bc=;
        b=ln/Jnohtsza0pGIKzWEuztqc2XaYmRx3PIqIM7YX4pQHtnoxjwqqPUQEK42nA4eEvp
         HVNswY9ymijBXpOwp8D1FjtTLy39ne/kjgrKZ9QH7YD6QT7bsxac9qLKtrn34gpneNCa
         ax3xfKOTQwLq9HR8MsnVj/USTkIYi5j+HNZixF7N6U+fD6eaYagZDCSU6gkZv8fe0gnw
         NwJYhJAPKzXrG8JWES3NVMy8z/TZ+aaH2LYnH2OrKd7e45ZUYVMGObL209L/E+zv+Q4+
         jfTC8Ig06AeFo7j3CeEpOLpyOfHGixw7So/V+jRfpIKzHeH9yE7EhGFUjPAbjEIfUjzm
         aYzw==
X-Gm-Message-State: AOAM532/F5AGpZWWjJqmR/Cc2Gf/DpnfeZvb0lSlw58XsnWbsg09yS/g
        ardCXjejn8NE//+DkMhXyuLuHNHQYP714k6cBnSTSQ==
X-Google-Smtp-Source: ABdhPJzV5rCJIjqxQ3LiucCut2xv+IIf2U8hV+WxjX4O6mNhhvyogQZlfhPtOtXXp1t/ll9omuk+MAkZGnu5Q6bJfH0=
X-Received: by 2002:ac2:46db:: with SMTP id p27mr1639785lfo.396.1615372177245;
 Wed, 10 Mar 2021 02:29:37 -0800 (PST)
MIME-Version: 1.0
References: <20210303135500.24673-1-alex.bennee@linaro.org>
 <20210303135500.24673-2-alex.bennee@linaro.org> <CAK8P3a0W5X8Mvq0tDrz7d67SfQA=PqthpnGDhn8w1Xhwa030-A@mail.gmail.com>
 <20210305075131.GA15940@goby> <CAK8P3a0qtByN4Fnutr1yetdVZkPJn87yK+w+_DAUXOMif-13aA@mail.gmail.com>
 <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com>
 <6c542548-cc16-af68-c755-df52bd13b209@marcan.st> <CAFA6WYOYmTgguVDwpyjnt3gLssqW48qzAkRD_nyPYg0nNhxT2A@mail.gmail.com>
 <beca6bc8-8970-bd01-8de0-6ded1fb69be2@marcan.st>
In-Reply-To: <beca6bc8-8970-bd01-8de0-6ded1fb69be2@marcan.st>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Wed, 10 Mar 2021 15:59:25 +0530
Message-ID: <CAFA6WYMSJxK2CjmoLJ6mdNNEfOQOMVXZPbbFRfah7KLeZNfguw@mail.gmail.com>
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

On Wed, 10 Mar 2021 at 14:17, Hector Martin <marcan@marcan.st> wrote:
>
> On 10/03/2021 14.14, Sumit Garg wrote:
> > On Wed, 10 Mar 2021 at 02:47, Hector Martin <marcan@marcan.st> wrote:
> >>
> >> On 09/03/2021 01.20, Linus Walleij wrote:
> >>> I suppose it would be a bit brutal if the kernel would just go in and
> >>> appropriate any empty RPMB it finds, but I suspect it is the right way
> >>> to make use of this facility given that so many of them are just sitting
> >>> there unused. Noone will run $CUSTOM_UTILITY any more than they
> >>> run the current RPMB tools in mmc-tools.
> >>
> >> AIUI the entire thing relies on a shared key that is programmed once
> >> into the RPMB device, which is a permanent operation. This key has to be
> >> secure, usually stored on CPU fuses or derived based on such a root of
> >> trust. To me it would seem ill-advised to attempt to automate this
> >> process and have the kernel do a permanent take-over of any RPMBs it
> >> finds (with what key, for one?) :)
> >>
> >
> > Wouldn't it be a good idea to use DT here to represent whether a
> > particular RPMB is used as a TEE backup or is available for normal
> > kernel usage?
> >
> > In case of normal kernel usage, I think the RPMB key can come from
> > trusted and encrypted keys subsystem.
>
> Remember that if the key is ever lost, the RPMB is now completely
> useless forever.
>
> This is why, as far as I know, most sane platforms will use hard fused
> values to derive this kind of thing, not any kind of key stored in
> erasable storage.

AFAIK, trusted and encrypted keys are generally loaded from initramfs
(as an encrypted blob) which happens during boot and if an attacker is
able to erase initramfs then it's already able to make the device
non-bootable (DoS attack which is hard to prevent against).

Although, I agree with you that fuses are the preferred way to store
RPMB key but not every platform may possess it and vendors may decide
to re-flash a bricked device via recovery image.

>
> Also, newly provisioned keys are sent in plain text, which means that
> any kind of "if the RPMB is blank, take it over" automation equates to
> handing over your key who an attacker who removes the RPMB and replaces
> it with a blank one, and then they can go access anything they want on
> the old RPMB device (assuming the key hasn't changed; and if it has
> changed that's conversely a recipe for data loss if something goes wrong).
>
> I really think trying to automate any kind of "default" usage of an RPMB
> is a terrible idea. It needs to be a conscious decision on a
> per-platform basis.
>

Agree and via DT method I only meant to assign already provisioned
RPMB device/s either to TEE or Linux kernel. And RPMB key provisioning
being a one time process should be carried out carefully during device
manufacturing only.

-Sumit

> --
> Hector Martin (marcan@marcan.st)
> Public Key: https://mrcn.st/pub
