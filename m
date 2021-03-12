Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2B2338C66
	for <lists+keyrings@lfdr.de>; Fri, 12 Mar 2021 13:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhCLMIT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 12 Mar 2021 07:08:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbhCLMIG (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 12 Mar 2021 07:08:06 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB56C061762
        for <keyrings@vger.kernel.org>; Fri, 12 Mar 2021 04:08:06 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id z2so1642945wrl.5
        for <keyrings@vger.kernel.org>; Fri, 12 Mar 2021 04:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bYlq3QuwCXBZy32rCYPOxMij/FKdzPl+ga1AXT6AMUw=;
        b=BCLpHAq5ldRKBvqrEtoKcuGqLL2GKiwjrR1A+mvEO/ekxNx/FUaU8ijHmzdhmUaUMc
         U6hIJc3dYCzUaB7CqpdXES3WakTBHjPlFyCsZC/Jv/mwT3Hxq9TtHqeAyUzrI4QSFbQU
         HjbLN8JsTbtdtzJeVi5Bz/rz3rJOnxf5kpYUY6ZeMym6WqGpCNByUim+7tnccsRbQy6h
         vnHRT7VSnQ6gBIycjjt60ZGmIhx0GOZH66e4mOIhXgLmcVeLbo+t48mH0NrxnpjWmSst
         RlIVmFO1W5t0vHV6wIXXyogQkwEIeTM0BKMWgOlSOKLOQOk1XIXppgSOdqqqcufq5vpb
         Iqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bYlq3QuwCXBZy32rCYPOxMij/FKdzPl+ga1AXT6AMUw=;
        b=YL4Pb3Tto2rCEgOpjSZBKzJ7XfTnLhE/2/7UJ8vVyoOAgZT7lK/BaYY7yekr18eqwp
         fPVs2614cP7C+7m/tSVR6492XyKQ+1yT0JzbVGqZrgM0gLtRt7HTYfXg22uOfD3k+3Lj
         dvVnHghyAojSe2HPVFBTTLR5ZT09RdHQZy2OwQffzrc37Ci08AA+CG4lxdKaWNJhkmTT
         AMl2HO/SS1v05VJaimMd3J9w6dbeYme8mL88+pjXvlbQq2OUNBA15sekXVEakaXNJqja
         zi7vcNJt3yaCzlyXtqclbwz8N6KdnO5jaEtm7FezBqQrJJnRLUwOI6HKNgr/Enc44/2O
         Dp7A==
X-Gm-Message-State: AOAM533g7RAMnR/rTvxhthy7eynjxBxq+0C08oe5L9D/UBZyzKlPq+WM
        IQl8nN+Yh5N/TLxE7cbc8f0IfQ==
X-Google-Smtp-Source: ABdhPJy9bWztyuiT+IyYCfmcTc6apygViQxe58Ssuj9DGSSxkLBEXiYFUHnmL6jsm9M/TOMs5ZHdww==
X-Received: by 2002:adf:f60b:: with SMTP id t11mr8471788wrp.269.1615550884731;
        Fri, 12 Mar 2021 04:08:04 -0800 (PST)
Received: from apalos.home (ppp-94-64-113-158.home.otenet.gr. [94.64.113.158])
        by smtp.gmail.com with ESMTPSA id g5sm7501708wrq.30.2021.03.12.04.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 04:08:04 -0800 (PST)
Date:   Fri, 12 Mar 2021 14:08:00 +0200
From:   Ilias Apalodimas <ilias.apalodimas@linaro.org>
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     Hector Martin <marcan@marcan.st>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@linaro.org>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Joakim Bech <joakim.bech@linaro.org>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Maxim Uvarov <maxim.uvarov@linaro.org>,
        Ruchika Gupta <ruchika.gupta@linaro.org>,
        "Winkler, Tomas" <tomas.winkler@intel.com>, yang.huang@intel.com,
        bing.zhu@intel.com, Matti.Moell@opensynergy.com,
        hmo@opensynergy.com, linux-mmc <linux-mmc@vger.kernel.org>,
        linux-scsi <linux-scsi@vger.kernel.org>,
        linux-nvme@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Arnd Bergmann <arnd.bergmann@linaro.org>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB)
 subsystem
Message-ID: <YEtZoAJATXZoK3a+@apalos.home>
References: <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com>
 <6c542548-cc16-af68-c755-df52bd13b209@marcan.st>
 <CAFA6WYOYmTgguVDwpyjnt3gLssqW48qzAkRD_nyPYg0nNhxT2A@mail.gmail.com>
 <beca6bc8-8970-bd01-8de0-6ded1fb69be2@marcan.st>
 <CAFA6WYMSJxK2CjmoLJ6mdNNEfOQOMVXZPbbFRfah7KLeZNfguw@mail.gmail.com>
 <CACRpkdZb5UMyq5qSJE==3ZnH-7fh92q_t4AnE8mPm0oFEJxqpQ@mail.gmail.com>
 <e5d3f4b5-748e-0700-b897-393187b2bb1a@marcan.st>
 <CACRpkdYxMGN3N-jFt1Uw4AkBR-x=dRj6HEvDp6g+2ku7+qCLwg@mail.gmail.com>
 <02d035ca-697d-1634-a434-a43b9c01f4a9@marcan.st>
 <CAFA6WYNzEofaQpEQFRG+XaWQqkEWugOW-1qEf=9J2-tje59QsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFA6WYNzEofaQpEQFRG+XaWQqkEWugOW-1qEf=9J2-tje59QsA@mail.gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Mar 12, 2021 at 05:29:20PM +0530, Sumit Garg wrote:
> On Fri, 12 Mar 2021 at 01:59, Hector Martin <marcan@marcan.st> wrote:
> >
> > On 11/03/2021 23.31, Linus Walleij wrote:
> > > I understand your argument, is your position such that the nature
> > > of the hardware is such that community should leave this hardware
> > > alone and not try to make use of RPMB  for say ordinary (self-installed)
> > > Linux distributions?
> >
> > It's not really that the community should leave this hardware alone, so
> > much that I think there is a very small subset of users who will be able
> > to benefit from it, and that subset will be happy with a usable
> > kernel/userspace interface and some userspace tooling for this purpose,
> > including provisioning and such.
> >
> > Consider the prerequisites for using RPMB usefully here:
> >
> > * You need (user-controlled) secureboot
> 
> Agree with this prerequisite since secure boot is essential to build
> initial trust in any system whether that system employs TEE, TPM,
> secure elements etc.
> 
> > * You need secret key storage - so either some kind of CPU-fused key, or
> > one protected by a TPM paired with the secureboot (key sealed to PCR
> > values and such)
> > * But if you have a TPM, that can handle secure counters for you already
> > AIUI, so you don't need RPMB
> 
> Does TPM provide replay protected memory to store information such as:
> - PIN retry timestamps?
> - Hash of encrypted nvme? IMO, having replay protection for user data
> on encrypted nvme is a valid use-case.
> 
> > * So this means you must be running a non-TPM secureboot system
> >
> 
> AFAIK, there exist such systems which provide you with a hardware
> crypto accelerator (like CAAM on i.Mx SoCs) that can protect your keys
> (in this case RPMB key) and hence can leverage RPMB for replay
> protection.
> 
> > And so we're back to embedded platforms like Android phones and other
> > SoC stuff... user-controlled secureboot is already somewhat rare here,
> > and even rarer are the cases where the user controls the whole chain
> > including the TEE if any (otherwise it'll be using RPMB already); this
> > pretty much excludes all production Android phones except for a few
> > designed as completely open systems; we're left with those and a subset
> > of dev boards (e.g. the Jetson TX1 I did fuse experiments on). In the
> > end, those systems will probably end up with fairly bespoke set-ups for
> > any given device or SoC family, for using RPMB.
> >
> > But then again, if you have a full secureboot system where you control
> > the TEE level, wouldn't you want to put the RPMB shenanigans there and
> > get some semblance of secure TPM/keystore/attempt throttling
> > functionality that is robust against Linux exploits and has a smaller
> > attack surface? Systems without EL3 are rare (Apple M1 :-)) so it makes
> > more sense to do this on those that do have it. If you're paranoid
> > enough to be getting into building your own secure system with
> > anti-rollback for retry counters, you should be heading in that directly
> > anyway.
> >
> > And now Linux's RPMB code is useless because you're running the stack in
> > the secure monitor instead :-)
> >
> 
> As Linus mentioned in other reply, there are limitations in order to
> put eMMC/RPMB drivers in TEE / secure monitor such as:
> - One of the design principle for a TEE is to keep its footprint as
> minimal as possible like in OP-TEE we generally try to rely on Linux
> for filesystem services, RPMB access etc. And currently we rely on a
> user-space daemon (tee-supplicant) for RPMB access which IMO isn't as
> secure as compared to direct RPMB access via kernel.
> - Most embedded systems possess a single storage device (like eMMC)
> for which the kernel needs to play an arbiter role.

Yep exactly. This is a no-go for small embedded platforms with a single eMMC.
The device *must* be in the non-secure world, so the bootloader can load the
kernel/rootfs from the eMMC.  If you restrain that in secure world access
only, that complicates things a lot ...

> 
> It looks like other TEE implementations such as Trusty on Android [1]
> and QSEE [2] have a similar interface for RPMB access.
> 
> So it's definitely useful for various TEE implementations to have
> direct RPMB access via kernel. And while we are at it, I think it
> should be useful (given replay protection benefits) to provide an
> additional kernel interface to RPMB leveraging Trusted and Encrypted
> Keys subsystem.

As for the EFI that was mentioned earlier, newer Arm devices and the
standardization behind those, is actually trying to use UEFI on most
of the platforms.  FWIW we already have code that manages the EFI variables in
the RPMB (which is kind of irrelevant to the current discussion, just giving
people a heads up).

Regards
/Ilias
> 
> [1] https://android.googlesource.com/trusty/app/storage/
> [2] https://www.qualcomm.com/media/documents/files/guard-your-data-with-the-qualcomm-snapdragon-mobile-platform.pdf
> 
> -Sumit
> 
> > --
> > Hector Martin (marcan@marcan.st)
> > Public Key: https://mrcn.st/pub
