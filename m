Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 922C7337EA1
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 21:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbhCKUCp (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Mar 2021 15:02:45 -0500
Received: from [212.63.208.185] ([212.63.208.185]:43780 "EHLO
        mail.marcansoft.com" rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S229796AbhCKUCh (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Mar 2021 15:02:37 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 7A616424D9;
        Thu, 11 Mar 2021 20:02:24 +0000 (UTC)
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     David Howells <dhowells@redhat.com>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
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
 <32bdceb1-e70d-7481-96e3-a064a7108eb9@marcan.st>
 <CACRpkdZ_-rqGBUOxUcBPeqVkLzX=Q9pjO9M+zY20-S9tNXAE0Q@mail.gmail.com>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB)
 subsystem
Message-ID: <d7f8a732-7a44-f609-52dc-3ba824a3d192@marcan.st>
Date:   Fri, 12 Mar 2021 05:02:22 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZ_-rqGBUOxUcBPeqVkLzX=Q9pjO9M+zY20-S9tNXAE0Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 11/03/2021 23.06, Linus Walleij wrote:
> Yes. And this is what mobile phone vendors typically did.
> 
> But the nature of different electrical attacks made them worried
> about different schemes involving cutting power and disturbing
> signals with different probes, so they wanted this counter
> implemented in hardware and that is why RPMB exists at all
> (IIUC).

No, prior to RPMB there was no such secure counter at all. The problem 
is that non-volatile erasable storage (i.e. EEPROM/Flash) is 
incompatible with modern SoC manufacturing processes, so there is no way 
to embed a secure counter into the main SoC. And once your counter needs 
to be external, there needs to be a secure communications protocol to 
access it. This is what RPMB implements.

For preventing software downgrades, especially of bootloader code, this 
can be implemented with one-time fuses embedded in the SoC, but there is 
a limited supply of those. So this doesn't work for things like PIN 
attempt counters. For that you need a secure external counter.

> It is fine to be of the opinion that this entire piece of hardware
> is pointless because the same can be achieved using
> well written software.

You've misunderstood me. RPMB isn't pointless; what I am saying is that 
if you strip away everything but the counter functionality, you can 
still build equivalent security guarantees. You still need the counter. 
There is no way to get that counter without RPMB or something like it 
(another option is e.g. to use a smartcard IC as a secure element; AIUI 
modern Apple devices do this). Software alone doesn't work. This is why 
I wrote that article about how the FBI cracks iPhones; that works 
because they weren't using a secure rollback-protected storage/counter 
chip of any kind.

> The position that the kernel community shall just ignore this
> hardware is a possible outcome of this discussion, but we need
> to have the discussion anyway, because now a RPMB framework
> is being promoted. The people who want it will need to sell it to
> us.

Again, you're kind of misunderstanding me here. I'm not saying the 
feature is useless. What I'm saying is that, to understand *how* it is 
useful, it helps if you forget about the read/write commands and treat 
it as a simple counter.

Once you do that, you'll realize that e.g. putting keys in RPMB doesn't 
really make sense as a kernel primitive. The usefulness of RPMB is 
purely in the integration of that counter (which is equivalent to 
rollback-protected storage) with a policy system. Everything else is 
icing on the cake; it doesn't create new use cases.

Consider this:

* You have RPMB, but you will use it as a counter only.
* To use RPMB, you need to have a secure shared key.
* You use the RPMB key (or a hash, or whatever) to encrypt a GPG key in 
your filesystem
* You have a Git repo. This is your secure rollback-protected storage.
* We assume the filesystem can be potentially read, written, and 
intercepted.

To read from your rollback-protected storage, you:

* Read the RPMB counter securely
* Fetch the Git tag named "v%d" with the counter value
* Ensure the Git tag is correctly signed with your secure GPG key
* Ensure the commit description of the signed commit is also "v%d"

To write to your rollback protected storage, you:

* Commit your changes to the repository (as a child of the current known 
good commit, which you know is secure via the prevous read process) with 
the commit message "v%d" with the counter value + 1
* Tag it "v%d" with the current counter value + 1, signing the tag with 
your GPG private key
* Ensure all changes are flushed to disk
* Perform an increment operation on the RPMB counter

You have now built a secure, rollback-protected Git repository, with 
similar security properties to RPMB storage, without using RPMB storage; 
just a counter.

Just like RPMB storage, the repo is readable without a key.
Just like RPMB storage, you need to have a secured master key stored 
somewhere; if the attacker gets your key it is game over.
Just like RPMB storage, the repo can only be updated (in a way that 
would be accepted) with the key available
Just like RPMB storage, the repo cannot be rolled back to a prior 
version (because it would not match the counter value)

Thus, we can conclude that the storage features of RPMB do not provide 
additional security properties that cannot be derived from a simple counter.

* Disclaimer: please don't actually deploy this; I'm trying to make a 
point here, it's 5AM and I'm not claiming this is a perfectly secure 
design and I haven't missed anything. Please don't design 
rollback-protected Git repositories without expert review. I am assuming 
filesystem mutations only happen between operations and handwaving away 
active attacks, which I doubt Git is designed to be robust against. A 
scheme like this can be implemented securely with care, but not naively.

>>> With RPMB this can be properly protected against because
>>> the next attempt can not be made until after the RPMB
>>> monotonic counter has been increased.
>>
>> But this is only enforced by software. If you do not have secure boot,
>> you can just patch software to allow infinite tries without touching the
>> RPMB. The RPMB doesn't check PINs for you, it doesn't even gate read
>> access to data in any way. All it does is promise you cannot make the
>> counter count down, or make the data stored within go back in time.
> 
> This is true, I guess the argument is something along the
> line that if one link in the chain is weaker, why harden
> any other link, the chain will break anyway?

This is how security works, yes :-)

I'm not saying hardening a link in the chain is pointless in every case, 
but in this case it's like heat treating one link in the chain, then 
joining it to the next one with a ziptie. Only once you at least have 
the entire chain of steel does it make sense to start thinking about 
heat treatment.

> I am more of the position let's harden this link if we can
> and then deal with the others when they come up, i.e.
> my concern is this piece of the puzzle, even if it is not
> the centerpiece (maybe the centerpiece is secure boot
> what do I know).

Well, that's what I'm saying, you do need secureboot for this to make 
sense :-)

RPMB isn't useless and some systems should implement it; but there's no 
real way for the kernel to transparently use it to improve security in 
general (for anyone) without the user being aware. Since any security 
benefit from RPMB must come from integration with user policy, it 
doesn't make sense to "well, just do something else with RPMB because 
it's better than nothing"; just doing "something" doesn't make systems 
more secure. There needs to be a specific, practical use case that we'd 
be trying to solve with RPMB here.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
