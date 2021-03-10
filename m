Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8BF7333FA8
	for <lists+keyrings@lfdr.de>; Wed, 10 Mar 2021 14:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232873AbhCJNwa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Mar 2021 08:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232871AbhCJNwX (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Mar 2021 08:52:23 -0500
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32D07C061760;
        Wed, 10 Mar 2021 05:52:23 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id DE6D73FA1B;
        Wed, 10 Mar 2021 13:52:08 +0000 (UTC)
To:     Linus Walleij <linus.walleij@linaro.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Sumit Garg <sumit.garg@linaro.org>,
        Arnd Bergmann <arnd@linaro.org>,
        Joakim Bech <joakim.bech@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
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
References: <20210303135500.24673-1-alex.bennee@linaro.org>
 <20210303135500.24673-2-alex.bennee@linaro.org>
 <CAK8P3a0W5X8Mvq0tDrz7d67SfQA=PqthpnGDhn8w1Xhwa030-A@mail.gmail.com>
 <20210305075131.GA15940@goby>
 <CAK8P3a0qtByN4Fnutr1yetdVZkPJn87yK+w+_DAUXOMif-13aA@mail.gmail.com>
 <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com>
 <6c542548-cc16-af68-c755-df52bd13b209@marcan.st>
 <CAFA6WYOYmTgguVDwpyjnt3gLssqW48qzAkRD_nyPYg0nNhxT2A@mail.gmail.com>
 <beca6bc8-8970-bd01-8de0-6ded1fb69be2@marcan.st>
 <CACRpkdbQks5pRFNHkNLVvLHCBhh0XCv7pHYq25EVAbU60PcwsA@mail.gmail.com>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB)
 subsystem
Message-ID: <0a26713a-8988-1713-4358-bc62364b9e25@marcan.st>
Date:   Wed, 10 Mar 2021 22:52:06 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbQks5pRFNHkNLVvLHCBhh0XCv7pHYq25EVAbU60PcwsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 10/03/2021 18.48, Linus Walleij wrote:
> Disk is encrypted, and RPMB is there to block any exhaustive
> password or other authentication token search.

This relies on having a secure boot chain to start with (otherwise you 
can just bypass policy that way; the RPMB is merely storage to give you 
anti-rollback properties, it can't enforce anything itself). So you 
would have to have a laptop with a fully locked down secure boot, which 
can only boot some version of Linux signed by you until, say, LUKS 
decryption. And then the tooling around that needs to be integrated with 
RPMB, to use it as an attempt counter.

But now this ends up having to involve userspace anyway; the kernel key 
stuff doesn't support policy like this, does it? So having the kernel 
automagically use RPMB wouldn't get us there.

I may be wrong on the details here, but as far as I know RPMB is 
strictly equivalent to a simple secure increment-only counter in what it 
buys you. The stuff about writing data to it securely is all a red 
herring - you can implement secure storage elsewhere, and with secure 
storage + a single secure counter, you can implement anti-rollback.

It is not intended to store keys in a way that is somehow safer than 
other mechanisms. After all, you need to securely store the RPMB key to 
begin with; you might as well use that to encrypt a keystore on any 
random block device.

> Ideally: the only way to make use of the hardware again would
> be to solder off the eMMC, if eMMC is used for RPMB.
> If we have RPMB on an NVME or UFS drive, the idea is
> to lock that thing such that it becomes useless and need to
> be replaced with a new part in this scenario.
> 
> In practice: make it hard, because we know no such jail is
> perfect. Make it not worth the effort, make it cheaper for thieves
> to just buy a new harddrive to use a stolen laptop, locking
> the data that was in it away forever by making the drive
> useless for any practical attacks.

But RPMB does not enforce any of this policy for you. RPMB only gives 
you a primitive: the ability to have storage that cannot be externally 
rolled back. So none of this works unless the entire system is set up to 
securely boot all the way until the drive unlock happens, and there are 
no other blatant code execution avenues.

There isn't even any encryption involved in the protocol, so all the 
data stored in the RPMB is public and available to any attacker.

So unless the kernel grows a subsystem/feature to enforce complex key 
policies (with things like use counts, retry times, etc), I don't think 
there's a place to integrate RPMB kernel-side. You still need a trusted 
userspace tool to glue it all together.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
