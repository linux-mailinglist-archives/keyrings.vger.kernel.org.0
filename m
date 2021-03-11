Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75029337F5A
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 22:09:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230425AbhCKVI1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Mar 2021 16:08:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbhCKVIK (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Mar 2021 16:08:10 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9355C061762
        for <keyrings@vger.kernel.org>; Thu, 11 Mar 2021 13:08:09 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id e7so4913435edu.10
        for <keyrings@vger.kernel.org>; Thu, 11 Mar 2021 13:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=references:user-agent:from:to:cc:subject:date:in-reply-to
         :message-id:mime-version:content-transfer-encoding;
        bh=WprC7wQ8pjk4v3rRNQRsNnfM+sFohsfztPY3hS+tZkY=;
        b=dqHaE7uAtCtfTturKUgGaMRMcA5A6xT5Sf8lWsZrZvnIOXfijL+712llEvyyGGggiF
         wBWpjvliIAbOJwKVKtia5E8gK+FEXGp883lN5XdlpTcUthISPjGAzEDaQzMjNHqIAyOS
         gQxFTfquWRQsSAYvti2QLI1048+HoB/47fTF6sUFrKPoXb2cwjYenOd15JYOR4ifTgKP
         Y/aP63Q2Vv9xef4NdGHljiTVumdtsFEIsGT/+DcDiRDvrywW83Y9ZV/VMTxOfTmODQul
         6JA203LPm32+ADaE3s3VxsP3fZrJNfIzDdNhjPisiCu+P05s6e6Z3rOo4A6pucodFt3d
         MOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
         :in-reply-to:message-id:mime-version:content-transfer-encoding;
        bh=WprC7wQ8pjk4v3rRNQRsNnfM+sFohsfztPY3hS+tZkY=;
        b=WrMp6yRTq6SJSKFnlKxC2kqeG7odmChlWs3Q3ukwVnP55yIqqzs80stVLQXGwyENqx
         9K8Y0rb0jRsdsM/L93M1MuCtdz4bW5f44AHwWkFpyz8GjwdCu3uHMizhBePCBV4Y34oM
         RuZoH1S+MOxLyoJ3O/4UV6BKlgY1qmeVK6Ic9tVq6punmvNgH3jdOAdxoQE+a5klI91y
         NXIInGDhhHEhHDC6X4ifT39LNYmBVpsNEjlV/0h1BhTfzgfcniGWR9sUakgr+vfza9DB
         ZBHslA3Q/GUwd1qIgH7j064mV7kvYfHfcx6axgu4fwWV729uD/DTfscLNfqvy/dbGEec
         Z2cQ==
X-Gm-Message-State: AOAM532OplADbDT1klaErEbyv/lSKKSqdgtIsqc8UoYXs6rBsxpKPQUu
        YN0axpZ7cv7QnFW/EZ9m01dlAA==
X-Google-Smtp-Source: ABdhPJwAmSWpyfZATg+lLALZWFEJgeSck6q627M8RqFqEoi+++wgypQpRJHtQ7KuVGQHjPuTtFTqTQ==
X-Received: by 2002:a05:6402:3075:: with SMTP id bs21mr10586641edb.274.1615496888399;
        Thu, 11 Mar 2021 13:08:08 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id r17sm1875032ejz.109.2021.03.11.13.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 13:08:07 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
        by zen.linaroharston (Postfix) with ESMTP id 85CC91FF7E;
        Thu, 11 Mar 2021 21:08:06 +0000 (GMT)
References: <20210303135500.24673-1-alex.bennee@linaro.org>
 <20210303135500.24673-2-alex.bennee@linaro.org>
 <CAK8P3a0W5X8Mvq0tDrz7d67SfQA=PqthpnGDhn8w1Xhwa030-A@mail.gmail.com>
 <20210305075131.GA15940@goby>
 <CAK8P3a0qtByN4Fnutr1yetdVZkPJn87yK+w+_DAUXOMif-13aA@mail.gmail.com>
 <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com>
 <6c542548-cc16-af68-c755-df52bd13b209@marcan.st>
 <CAFA6WYOYmTgguVDwpyjnt3gLssqW48qzAkRD_nyPYg0nNhxT2A@mail.gmail.com>
 <beca6bc8-8970-bd01-8de0-6ded1fb69be2@marcan.st>
 <CAFA6WYMSJxK2CjmoLJ6mdNNEfOQOMVXZPbbFRfah7KLeZNfguw@mail.gmail.com>
 <CACRpkdZb5UMyq5qSJE==3ZnH-7fh92q_t4AnE8mPm0oFEJxqpQ@mail.gmail.com>
 <e5d3f4b5-748e-0700-b897-393187b2bb1a@marcan.st>
 <CACRpkdYxMGN3N-jFt1Uw4AkBR-x=dRj6HEvDp6g+2ku7+qCLwg@mail.gmail.com>
 <02d035ca-697d-1634-a434-a43b9c01f4a9@marcan.st>
User-agent: mu4e 1.5.8; emacs 28.0.50
From:   Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To:     Hector Martin <marcan@marcan.st>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB)
 subsystem
Date:   Thu, 11 Mar 2021 20:57:50 +0000
In-reply-to: <02d035ca-697d-1634-a434-a43b9c01f4a9@marcan.st>
Message-ID: <87k0qd7615.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org


Hector Martin <marcan@marcan.st> writes:

> On 11/03/2021 23.31, Linus Walleij wrote:
>> I understand your argument, is your position such that the nature
>> of the hardware is such that community should leave this hardware
>> alone and not try to make use of RPMB  for say ordinary (self-installed)
>> Linux distributions?
>
> It's not really that the community should leave this hardware alone, so=20
> much that I think there is a very small subset of users who will be able=
=20
> to benefit from it, and that subset will be happy with a usable=20
> kernel/userspace interface and some userspace tooling for this purpose,=20
> including provisioning and such.
>
> Consider the prerequisites for using RPMB usefully here:
>
> * You need (user-controlled) secureboot
> * You need secret key storage - so either some kind of CPU-fused key, or=
=20
> one protected by a TPM paired with the secureboot (key sealed to PCR=20
> values and such)
> * But if you have a TPM, that can handle secure counters for you already=
=20
> AIUI, so you don't need RPMB
> * So this means you must be running a non-TPM secureboot system
>
> And so we're back to embedded platforms like Android phones and other=20
> SoC stuff... user-controlled secureboot is already somewhat rare here,=20
> and even rarer are the cases where the user controls the whole chain=20
> including the TEE if any (otherwise it'll be using RPMB already); this=20
> pretty much excludes all production Android phones except for a few=20
> designed as completely open systems; we're left with those and a subset=20
> of dev boards (e.g. the Jetson TX1 I did fuse experiments on). In the=20
> end, those systems will probably end up with fairly bespoke set-ups for=20
> any given device or SoC family, for using RPMB.
>
> But then again, if you have a full secureboot system where you control=20
> the TEE level, wouldn't you want to put the RPMB shenanigans there and=20
> get some semblance of secure TPM/keystore/attempt throttling=20
> functionality that is robust against Linux exploits and has a smaller=20
> attack surface? Systems without EL3 are rare (Apple M1 :-)) so it makes=20
> more sense to do this on those that do have it. If you're paranoid=20
> enough to be getting into building your own secure system with=20
> anti-rollback for retry counters, you should be heading in that directly=
=20
> anyway.
>
> And now Linux's RPMB code is useless because you're running the stack in=
=20
> the secure monitor instead :-)

Well quiet - the principle use-case of virtio-rpmb is to provide a RPMB
like device emulation for things like OPTEE when running under QEMU's
full-system emulation. However when it came to testing it out I went for
Thomas' patches because that was the only virtio FE implementation
available.

When I finished the implementation and Ilias started on the uBoot
front-end for virtio-rpmb. uBoot being firmware could very well be
running in the secure world so would have a valid use case accessing an
RPMB device. We ran into API dissonance because uboot's driver model is
roughly modelled on the kernel so expects to be talking to eMMC devices
which lead to requirements to fake something up to keep the driver
stacks happy.

I guess what we are saying is that real secure monitors should come up
with their own common API for interfacing with RPMB devices without
looking to the Linux kernel for inspiration?

--=20
Alex Benn=C3=A9e
