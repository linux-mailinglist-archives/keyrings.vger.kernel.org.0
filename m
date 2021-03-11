Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7643368FF
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 01:38:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231286AbhCKAhP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Mar 2021 19:37:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhCKAgx (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Mar 2021 19:36:53 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD36FC061760
        for <keyrings@vger.kernel.org>; Wed, 10 Mar 2021 16:36:52 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id d3so36716286lfg.10
        for <keyrings@vger.kernel.org>; Wed, 10 Mar 2021 16:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EEzbsSCDR9QboIA8OrN63K5HZEwShS0wIkxT1lrzd0Y=;
        b=riZjyH1NfHDCunME5Ebgwcbph2FiEIMHDSKKFitpNg0U8iOTWuJwtB6GzHL3vNfxn3
         bKC6k1jMXjsf5GoCwsYzyYIe9V8eRGIjZxbtrzAHA4cWo/kfcaVq0a2yxRHziD/UHYtL
         KrJVPIzP09ibIN4SoXEEPVGDtIxaHre5IZ2sYsYyR9ToplAng35DTKF6bOubx+i39R1f
         Dyh6YNTaIYGkqNxapf4Gtw75AiC382TPw8+LxMz+fxeVGy15sf7k73kyLEtXBsVNkWpt
         etsNBpGlXtrr7f+X+XS+9XGQN3Nqb1sTEg7ly23GPExeT193DJfFsQE4BqchIm93na3Z
         gRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EEzbsSCDR9QboIA8OrN63K5HZEwShS0wIkxT1lrzd0Y=;
        b=OUQDbAdWCJsDkojhCBNd/cWt2qw4IFjM2d0CnQIJEaI4z8PdjNiDCjhreN4pp7ENZb
         uTtOhO9gdhkssAdb+KPDeKGw+zZmQWz9BGPTKNyn7xaD/2s5tLjARdHAcfKHlwB6oLx2
         JmonxHqSaxKwgJoZiVH+6o6peDtb5lzZpJNyXAzZEBgTRuxCE2TUpiS/vz9lQfukTM2H
         aO9kDIk7cWxuHbgW+AP5sixVz/VzDij3C8AnvRb66WOPA7DQ8e9Ej/pwIEZOCKJHQq8Z
         /jz5E4KqavFtVAhBEu1GCB7FZFjhiyWwzXuj8oROR2nWxOoe3qTaVL5zERX0bK6DglG2
         Y6Fw==
X-Gm-Message-State: AOAM532I3YjmS9PMblWKGSWAiHV2USusOuVCX9/ll/Rfy4be6j0Lc7BW
        4zpG5ifTEKFIcwQqbTDbbAmJApxxE16H1JSUSLdvti/ceA8gRv8j
X-Google-Smtp-Source: ABdhPJxPA73QJEO2P06IeIm6xha2IwSe1nk/jxmy8+2H6YjUfx61sOITuBIwpepPUOCRRsAhsWRrIoW1PKscdwIJ+Vc=
X-Received: by 2002:a19:4c08:: with SMTP id z8mr638983lfa.157.1615423011194;
 Wed, 10 Mar 2021 16:36:51 -0800 (PST)
MIME-Version: 1.0
References: <20210303135500.24673-1-alex.bennee@linaro.org>
 <20210303135500.24673-2-alex.bennee@linaro.org> <CAK8P3a0W5X8Mvq0tDrz7d67SfQA=PqthpnGDhn8w1Xhwa030-A@mail.gmail.com>
 <20210305075131.GA15940@goby> <CAK8P3a0qtByN4Fnutr1yetdVZkPJn87yK+w+_DAUXOMif-13aA@mail.gmail.com>
 <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com>
 <6c542548-cc16-af68-c755-df52bd13b209@marcan.st> <CAFA6WYOYmTgguVDwpyjnt3gLssqW48qzAkRD_nyPYg0nNhxT2A@mail.gmail.com>
 <beca6bc8-8970-bd01-8de0-6ded1fb69be2@marcan.st> <CACRpkdbQks5pRFNHkNLVvLHCBhh0XCv7pHYq25EVAbU60PcwsA@mail.gmail.com>
 <0a26713a-8988-1713-4358-bc62364b9e25@marcan.st>
In-Reply-To: <0a26713a-8988-1713-4358-bc62364b9e25@marcan.st>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 01:36:39 +0100
Message-ID: <CACRpkda9f-BNmu-CaNsghnDoOcSXvvvji=tag2Xos+tg_nNZ0w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB) subsystem
To:     Hector Martin <marcan@marcan.st>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
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

On Wed, Mar 10, 2021 at 2:52 PM Hector Martin <marcan@marcan.st> wrote:

> This relies on having a secure boot chain to start with (otherwise you
> can just bypass policy that way; the RPMB is merely storage to give you
> anti-rollback properties, it can't enforce anything itself). So you
> would have to have a laptop with a fully locked down secure boot, which
> can only boot some version of Linux signed by you until, say, LUKS
> decryption. And then the tooling around that needs to be integrated with
> RPMB, to use it as an attempt counter.

Yes and no. For secure boot yes. For other use cases it can
still be useful.

The way I understand it, there are people (not me) with secure boot
ambitions but I wouldn't say that is the only use case, see below.

> But now this ends up having to involve userspace anyway; the kernel key
> stuff doesn't support policy like this, does it? So having the kernel
> automagically use RPMB wouldn't get us there.

Yes, you are right, I had the wrong idea. It needs to be something
the user (or the users agent such as an organization) decides to
make use of, and it is policy so it should be in userspace. We
may standardize the key format on the device though.

> I may be wrong on the details here, but as far as I know RPMB is
> strictly equivalent to a simple secure increment-only counter in what it
> buys you. The stuff about writing data to it securely is all a red
> herring - you can implement secure storage elsewhere, and with secure
> storage + a single secure counter, you can implement anti-rollback.
>
> It is not intended to store keys in a way that is somehow safer than
> other mechanisms. After all, you need to securely store the RPMB key to
> begin with; you might as well use that to encrypt a keystore on any
> random block device.

The typical use-case mentioned in one reference is to restrict
the number of password/pin attempts and  combine that with
secure time to make sure that longer and longer intervals are
required between password attempts.

This seems pretty neat to me.

> But RPMB does not enforce any of this policy for you. RPMB only gives
> you a primitive: the ability to have storage that cannot be externally
> rolled back. So none of this works unless the entire system is set up to
> securely boot all the way until the drive unlock happens, and there are
> no other blatant code execution avenues.

This is true for firmware anti-rollback or say secure boot.

But RPMB can also be used for example for restricting the
number of PIN attempts.

A typical attack vector on phones (I think candybar phones
even) was a robot that was punching PIN codes to unlock
the phone, combined with an electronic probe that would
cut the WE (write enable) signal to the flash right after
punching a code. The counter was stored in the flash.

(A bit silly example as this can be countered by reading back
the counter from flash and checking etc, but you get the idea,
various versions of this attack is possible,)

With RPMB this can be properly protected against because
the next attempt can not be made until after the RPMB
monotonic counter has been increased.

Of course the system can be compromised in other ways,
(like, maybe it doesn't even have secure boot or even
no encrypted drive) but this is one of the protection
mechanisms that can plug one hole.

It is thus a countermeasure to keyboard emulators and other
evil hardware trying to brute force their way past screen
locks and passwords. Such devices exist, sadly.

> There isn't even any encryption involved in the protocol, so all the
> data stored in the RPMB is public and available to any attacker.

You need to pass the symmetric key to increase a counter
and store a new "key" (data chunk, 256 bytes). But as you say
one can read it without the symmetric key.

AFAICT that is not a problem for any use case for RPMB.

> So unless the kernel grows a subsystem/feature to enforce complex key
> policies (with things like use counts, retry times, etc), I don't think
> there's a place to integrate RPMB kernel-side. You still need a trusted
> userspace tool to glue it all together.

Yes, I understand such ambitions may exist and pretty much why
I CC the keyring people. So the question is whether they think
that is something they would go and use for e.g. passphrase
retries.

Yours,
Linus Walleij
