Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6166B3330BF
	for <lists+keyrings@lfdr.de>; Tue,  9 Mar 2021 22:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbhCIVR0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Mar 2021 16:17:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhCIVRD (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 9 Mar 2021 16:17:03 -0500
X-Greylist: delayed 422 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 09 Mar 2021 13:17:02 PST
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3143C06174A;
        Tue,  9 Mar 2021 13:17:02 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 1C1D141982;
        Tue,  9 Mar 2021 21:09:35 +0000 (UTC)
To:     Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@linaro.org>, keyrings@vger.kernel.org,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Joakim Bech <joakim.bech@linaro.org>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Maxim Uvarov <maxim.uvarov@linaro.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        ruchika.gupta@linaro.org,
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
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB)
 subsystem
Message-ID: <6c542548-cc16-af68-c755-df52bd13b209@marcan.st>
Date:   Wed, 10 Mar 2021 06:09:34 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 09/03/2021 01.20, Linus Walleij wrote:
> I suppose it would be a bit brutal if the kernel would just go in and
> appropriate any empty RPMB it finds, but I suspect it is the right way
> to make use of this facility given that so many of them are just sitting
> there unused. Noone will run $CUSTOM_UTILITY any more than they
> run the current RPMB tools in mmc-tools.

AIUI the entire thing relies on a shared key that is programmed once 
into the RPMB device, which is a permanent operation. This key has to be 
secure, usually stored on CPU fuses or derived based on such a root of 
trust. To me it would seem ill-advised to attempt to automate this 
process and have the kernel do a permanent take-over of any RPMBs it 
finds (with what key, for one?) :)

For what it's worth, these days I think Apple uses a separate, dedicated 
secure element for replay protected storage, not RPMB. That seems like a 
sane approach, given that obviously Flash storage vendors cannot be 
trusted to write security-critical firmware. But if all you have is 
RPMB, using it is better than nothing.

The main purpose of the RPMB is, as the name implies, replay protection. 
You can do secure storage on any random flash with encryption, and even 
do full authentication with hash trees, but the problem is no matter how 
fancy your scheme is, attackers can always dump all memory and roll your 
device back to the past. This defeats stuff like PIN code attempt 
limits. So it isn't so much for storing crypto keys or such, but rather 
a way to prevent these attacks.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
