Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F610338989
	for <lists+keyrings@lfdr.de>; Fri, 12 Mar 2021 11:01:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhCLKA4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 12 Mar 2021 05:00:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233016AbhCLKAi (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 12 Mar 2021 05:00:38 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486E3C061762
        for <keyrings@vger.kernel.org>; Fri, 12 Mar 2021 02:00:38 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 18so44760701lff.6
        for <keyrings@vger.kernel.org>; Fri, 12 Mar 2021 02:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=x7b0YhLiDRYT0yOrjk/x/Y6N+KIRlemcKfsY/iEVybQ=;
        b=F52JBUW2RVO02xz7XfNFfnrhSZLb7p6RwfOQXW0+QwKiTpTiaiE/kwYwO+y5kvwTTb
         xZxDlKTU0zC8iGi9s3eB3O1qh9vAuqnCzdm0FQbgsL4bLr3Ruqn3fhleGWalnmxC38rB
         FgK2CVQxAaWOiBRWXiXhaAdbIjpvXMgUpIWczpQhvC4dfF3O6uaqfZeXxiEEoU7pYdoh
         v0OxguUFdiCEoCC7zzxnbDnPPd+iR1h3DsnWmx5o1uALjWmEGFn0rxgH7VcoOP1somqS
         7HT5R8y07TA7h0PvmtdQ9IxgC4c4DqqDp/Sprqpgk7IqJYUO5UnI+msLE1D5pICduzc5
         BEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=x7b0YhLiDRYT0yOrjk/x/Y6N+KIRlemcKfsY/iEVybQ=;
        b=ipAfTdz2NYdCXrDNBJ1LfDOIl4oLZTiJmKfDHGgpTt9o8Ys3DCGBZf0jrSRM4cUY80
         Mi8Gc/93arT9Qrzpt37BiqhmboQKRMmoR7cY2vDWNuvnrg3NKt3hltusl3wBr1+rIPQZ
         DgsbWs6/xYaVGWG6DNM75QRAS/i3K5WSdWI25S8n0yYWvWW2ykjSTuvQ2QfMlCe0QJ9Q
         kL85WDngikfRiwfxrv1fJveAgT5zm/sWHVQ2KfeH2dWMBICPMsulQ2ie53jPqYzzOCDd
         EALcaVHgAa+GH4lmYUcwcLeqTPpX4RF9/iOb77lnka26ETwViOYj2oiOw18gHv4QTGFJ
         F/Nw==
X-Gm-Message-State: AOAM533Wi0L0Mw41phNQng7DwD4jEq+F0Z2C53fJ/W/Z4IMnWmoMUTVn
        czPHhS6ZNa2dFl9aJfRhqcqXO21Eoafo0vyor5W0NQ==
X-Google-Smtp-Source: ABdhPJzDpESWQoECqt1prXQcSIVot287iP/QjDAbfHp3ibm4TSWaAfKPuHPAW9M9l7h49Y9aMEgq9QJPlARRE4cVnxQ=
X-Received: by 2002:ac2:4d95:: with SMTP id g21mr5165763lfe.29.1615543236661;
 Fri, 12 Mar 2021 02:00:36 -0800 (PST)
MIME-Version: 1.0
References: <20210303135500.24673-1-alex.bennee@linaro.org>
 <20210303135500.24673-2-alex.bennee@linaro.org> <CAK8P3a0W5X8Mvq0tDrz7d67SfQA=PqthpnGDhn8w1Xhwa030-A@mail.gmail.com>
 <20210305075131.GA15940@goby> <CAK8P3a0qtByN4Fnutr1yetdVZkPJn87yK+w+_DAUXOMif-13aA@mail.gmail.com>
 <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com>
 <6c542548-cc16-af68-c755-df52bd13b209@marcan.st> <CAFA6WYOYmTgguVDwpyjnt3gLssqW48qzAkRD_nyPYg0nNhxT2A@mail.gmail.com>
 <beca6bc8-8970-bd01-8de0-6ded1fb69be2@marcan.st> <CAFA6WYMSJxK2CjmoLJ6mdNNEfOQOMVXZPbbFRfah7KLeZNfguw@mail.gmail.com>
 <CACRpkdZb5UMyq5qSJE==3ZnH-7fh92q_t4AnE8mPm0oFEJxqpQ@mail.gmail.com>
 <e5d3f4b5-748e-0700-b897-393187b2bb1a@marcan.st> <CACRpkdYxMGN3N-jFt1Uw4AkBR-x=dRj6HEvDp6g+2ku7+qCLwg@mail.gmail.com>
 <02d035ca-697d-1634-a434-a43b9c01f4a9@marcan.st> <87k0qd7615.fsf@linaro.org>
In-Reply-To: <87k0qd7615.fsf@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 12 Mar 2021 11:00:24 +0100
Message-ID: <CACRpkdYNdoK9T503en6dPfz5sSc0eDGLzhnUBqRUbZR3j43byA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB) subsystem
To:     =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc:     Hector Martin <marcan@marcan.st>,
        Sumit Garg <sumit.garg@linaro.org>,
        Arnd Bergmann <arnd@linaro.org>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Joakim Bech <joakim.bech@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Maxim Uvarov <maxim.uvarov@linaro.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Ruchika Gupta <ruchika.gupta@linaro.org>,
        "Winkler, Tomas" <tomas.winkler@intel.com>, yang.huang@intel.com,
        bing.zhu@intel.com, Matti.Moell@opensynergy.com,
        hmo@opensynergy.com, linux-mmc <linux-mmc@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Arnd Bergmann <arnd.bergmann@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Mar 11, 2021 at 10:08 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:

> I guess what we are saying is that real secure monitors should come up
> with their own common API for interfacing with RPMB devices without
> looking to the Linux kernel for inspiration?

The problem is that eMMC at least (I don't know about NVME etc)
has serialized commands, meaning you execute one command at
a time (some augmentation exist nowadays to speed up things).

When it comes to RPMB, the eMMC device must stop all other
activity (such as reading/writing any blocks to the eMMC) send a
special command to switch to the RPMB  partition, then execute
the RPMB command(s) then send a special command to switch
back to ordinary storage.

Someone has to be in control of the eMMC arbitration. Right now
Linux MMC/SD storage stack does this.

If the secure world want to use RPMB independently of the Linux
kernel there are two solutions:

- Mount a second eMMC just for the secure world - looks expensive
  so some other secure counter storage would likely be cheaper
  and it inevitably increases the BOM which is sensitive to
  manufacturers (this option is unrealistic)

- Let the secure world arbitrate all access to the eMMC - looks
  inefficient and also dangerous since the secure world now has to
  implement everything in drivers/mmc/core which is a few 100
  KB of really complex code that need to be maintained perpetually.
  (IMO this option is also unrealistic for performance and
  maintenance reasons, but who knows what secure world
  imperialists are out there).

This leaves Linux in control of the eMMC RPMB under all
circumstances as far as I can see.

Yours,
Linus Walleij
