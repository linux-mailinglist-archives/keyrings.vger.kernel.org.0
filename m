Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA131336EBB
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 10:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231844AbhCKJW5 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Mar 2021 04:22:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231759AbhCKJWw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Mar 2021 04:22:52 -0500
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA5AC061574;
        Thu, 11 Mar 2021 01:22:51 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id CD16C41ECC;
        Thu, 11 Mar 2021 09:22:43 +0000 (UTC)
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Sumit Garg <sumit.garg@linaro.org>,
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
 <0a26713a-8988-1713-4358-bc62364b9e25@marcan.st>
 <CACRpkda9f-BNmu-CaNsghnDoOcSXvvvji=tag2Xos+tg_nNZ0w@mail.gmail.com>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB)
 subsystem
Message-ID: <32bdceb1-e70d-7481-96e3-a064a7108eb9@marcan.st>
Date:   Thu, 11 Mar 2021 18:22:41 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CACRpkda9f-BNmu-CaNsghnDoOcSXvvvji=tag2Xos+tg_nNZ0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 11/03/2021 09.36, Linus Walleij wrote:
>> It is not intended to store keys in a way that is somehow safer than
>> other mechanisms. After all, you need to securely store the RPMB key to
>> begin with; you might as well use that to encrypt a keystore on any
>> random block device.
> 
> The typical use-case mentioned in one reference is to restrict
> the number of password/pin attempts and  combine that with
> secure time to make sure that longer and longer intervals are
> required between password attempts.
> 
> This seems pretty neat to me.

Yes, but to implement that you don't need any secure storage *at all*. 
If all the RPMB did was authenticate an incrementing counter, you could 
just store the <last timestamp, attempts remaining> tuple inside a blob 
of secure (encrypted and MACed) storage on any random Flash device, 
along with the counter value, and thus prevent rollbacks that way (some 
finer design points are needed to deal with power loss protection and 
ordering, but the theory holds).

Basically what I'm saying is that for security *guarantee* purposes, 
AFAICT the storage part of RPMB makes no difference. It is useful in 
practical implementations for various reasons, but if you think you can 
use that secure storage to provide security properties which you 
couldn't do otherwise, you are probably being misled. If you're trying 
to understand what having RPMB gets you over not having it, it helps if 
you ignore all the storage stuff and just view it as a single secure, 
increment-only counter.

> 
>> But RPMB does not enforce any of this policy for you. RPMB only gives
>> you a primitive: the ability to have storage that cannot be externally
>> rolled back. So none of this works unless the entire system is set up to
>> securely boot all the way until the drive unlock happens, and there are
>> no other blatant code execution avenues.
> 
> This is true for firmware anti-rollback or say secure boot.
> 
> But RPMB can also be used for example for restricting the
> number of PIN attempts.
> 
> A typical attack vector on phones (I think candybar phones
> even) was a robot that was punching PIN codes to unlock
> the phone, combined with an electronic probe that would
> cut the WE (write enable) signal to the flash right after
> punching a code. The counter was stored in the flash.
> 
> (A bit silly example as this can be countered by reading back
> the counter from flash and checking etc, but you get the idea,
> various versions of this attack is possible,)
> 
> With RPMB this can be properly protected against because
> the next attempt can not be made until after the RPMB
> monotonic counter has been increased.

But this is only enforced by software. If you do not have secure boot, 
you can just patch software to allow infinite tries without touching the 
RPMB. The RPMB doesn't check PINs for you, it doesn't even gate read 
access to data in any way. All it does is promise you cannot make the 
counter count down, or make the data stored within go back in time.

> Of course the system can be compromised in other ways,
> (like, maybe it doesn't even have secure boot or even
> no encrypted drive) but this is one of the protection
> mechanisms that can plug one hole.

This is hot how security systems are designed though; you do not "plug 
holes", what you do is cover more attack scenarios, and you do that in 
the order from simplest to hardest.

If we are trying to crack the PIN on a device we have physical access 
to, the simplest and most effective attack is to just run your own 
software on the machine, extract whatever hash or material you need to 
validate PINs, and do it offline.

To protect against that, you first need to move the PIN checking into a 
trust domain where an attacker with physical access can't easily break 
in, which means secure boot.

*Then* the next simplest attack is a secure storage rollback attack, 
which is what I described in that blog post about iOS. And *now* it 
makes sense to start thinking about the RPMB.

But RPMB alone doesn't make any sense on a system without secure boot. 
It doesn't change anything; in both cases the simplest attack is to just 
run your own software.

> It is thus a countermeasure to keyboard emulators and other
> evil hardware trying to brute force their way past screen
> locks and passwords. Such devices exist, sadly.

If you're trying to protect against a "dumb" attack with a keyboard 
emulator that doesn't consider access to physical storage, then you 
don't need RPMB either; you can just put the PIN unlock counter in a 
random file.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
