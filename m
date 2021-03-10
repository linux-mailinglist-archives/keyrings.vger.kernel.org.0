Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A53B3337C7
	for <lists+keyrings@lfdr.de>; Wed, 10 Mar 2021 09:48:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbhCJIsN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Mar 2021 03:48:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232336AbhCJIry (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Mar 2021 03:47:54 -0500
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16C9EC06174A;
        Wed, 10 Mar 2021 00:47:54 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 138FD3FA1B;
        Wed, 10 Mar 2021 08:47:46 +0000 (UTC)
To:     Sumit Garg <sumit.garg@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Arnd Bergmann <arnd@linaro.org>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
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
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB)
 subsystem
Message-ID: <beca6bc8-8970-bd01-8de0-6ded1fb69be2@marcan.st>
Date:   Wed, 10 Mar 2021 17:47:45 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFA6WYOYmTgguVDwpyjnt3gLssqW48qzAkRD_nyPYg0nNhxT2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 10/03/2021 14.14, Sumit Garg wrote:
> On Wed, 10 Mar 2021 at 02:47, Hector Martin <marcan@marcan.st> wrote:
>>
>> On 09/03/2021 01.20, Linus Walleij wrote:
>>> I suppose it would be a bit brutal if the kernel would just go in and
>>> appropriate any empty RPMB it finds, but I suspect it is the right way
>>> to make use of this facility given that so many of them are just sitting
>>> there unused. Noone will run $CUSTOM_UTILITY any more than they
>>> run the current RPMB tools in mmc-tools.
>>
>> AIUI the entire thing relies on a shared key that is programmed once
>> into the RPMB device, which is a permanent operation. This key has to be
>> secure, usually stored on CPU fuses or derived based on such a root of
>> trust. To me it would seem ill-advised to attempt to automate this
>> process and have the kernel do a permanent take-over of any RPMBs it
>> finds (with what key, for one?) :)
>>
> 
> Wouldn't it be a good idea to use DT here to represent whether a
> particular RPMB is used as a TEE backup or is available for normal
> kernel usage?
> 
> In case of normal kernel usage, I think the RPMB key can come from
> trusted and encrypted keys subsystem.

Remember that if the key is ever lost, the RPMB is now completely 
useless forever.

This is why, as far as I know, most sane platforms will use hard fused 
values to derive this kind of thing, not any kind of key stored in 
erasable storage.

Also, newly provisioned keys are sent in plain text, which means that 
any kind of "if the RPMB is blank, take it over" automation equates to 
handing over your key who an attacker who removes the RPMB and replaces 
it with a blank one, and then they can go access anything they want on 
the old RPMB device (assuming the key hasn't changed; and if it has 
changed that's conversely a recipe for data loss if something goes wrong).

I really think trying to automate any kind of "default" usage of an RPMB 
is a terrible idea. It needs to be a conscious decision on a 
per-platform basis.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
