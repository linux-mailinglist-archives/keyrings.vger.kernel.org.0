Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61F5F336F1F
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 10:46:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbhCKJp6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Mar 2021 04:45:58 -0500
Received: from [212.63.208.185] ([212.63.208.185]:49688 "EHLO
        mail.marcansoft.com" rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232152AbhCKJpp (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Mar 2021 04:45:45 -0500
X-Greylist: delayed 71604 seconds by postgrey-1.27 at vger.kernel.org; Thu, 11 Mar 2021 04:45:44 EST
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id D365C4246F;
        Thu, 11 Mar 2021 09:45:32 +0000 (UTC)
To:     Linus Walleij <linus.walleij@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>
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
 <beca6bc8-8970-bd01-8de0-6ded1fb69be2@marcan.st>
 <CAFA6WYMSJxK2CjmoLJ6mdNNEfOQOMVXZPbbFRfah7KLeZNfguw@mail.gmail.com>
 <CACRpkdZb5UMyq5qSJE==3ZnH-7fh92q_t4AnE8mPm0oFEJxqpQ@mail.gmail.com>
From:   Hector Martin <marcan@marcan.st>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB)
 subsystem
Message-ID: <e5d3f4b5-748e-0700-b897-393187b2bb1a@marcan.st>
Date:   Thu, 11 Mar 2021 18:45:30 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdZb5UMyq5qSJE==3ZnH-7fh92q_t4AnE8mPm0oFEJxqpQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On 11/03/2021 09.49, Linus Walleij wrote:
> The use case for TPM on laptops is similar: it can be used by a
> provider to lock down a machine, but it can also be used by the
> random user to store keys. Very few users beside James
> Bottomley are capable of doing that (I am not) but they exist.
> https://blog.hansenpartnership.com/using-your-tpm-as-a-secure-key-store/

I've used a TPM as an SSH key keystore in the past (these days I use 
YubiKeys, but same idea). TPMs are useful because they *do* implement 
policy and cryptographic operations. So you can, in fact, get security 
guarantees out of a TPM without secureboot.

For example, assuming the TPM is secure, it is impossible to clone an 
SSH key private key managed by a TPM. This means that any usage has to 
be on-device, which provides inherent rate-limiting. Then, the TPM can 
gate access to the key based on a passphrase, which again provides 
inherent rate-limits on cracking attempts. TPM 2.0 devices also provide 
explicit count limits and time-based throttling for unlocking attempts.

We have much the same story with the Secure Enclave Processor on Apple 
Silicon machines (which I'm working on porting Linux to) - it provides 
policy, and can even authenticate with fingerprints (there is a hardware 
secure channel between the reader and the SEP) as well as passphrases. 
For all intents and purposes it is an Apple-managed TPM (with its own 
secureboot). So it is similarly useful for us to support the SEP for key 
storage, and perhaps even integrate it with kernel subsystems at some 
point. It's useful for our regular users, even though they are unlikely 
to be running with full secureboot on the main CPU (though Apple's 
implementation does allow for a user-controlled secureboot subset, and 
it should be possible to provide hard guarantees there as well, but I 
digress).

All of these things make putting keys into TPMs, YubiKeys, the SEP, etc 
a useful thing for anyone, regardless of whether their machine is locked 
down or not.

This is not the case for RPMB. RPMB *relies* on the software running on 
the other side being trusted. RPMB, alone, provides zero new security 
guarantees, without trusted software communicating with it.

The key initialization story is also a lot thornier in RPMB. TPMs, the 
SEP, and YubiKeys are all designed so that they can be factory-reset 
(losing all key material in the process) by a user with physical access, 
which means that provisioning operations and experiments are risk-free, 
and the only danger is data loss, not making the hardware less useful. 
With the MAC key provisioning for RPMB being a one-time process, it is 
inherently a very risky operation that a user must commit to with great 
care, as they only get one chance, ever. Better have that key backed up 
somewhere (but not somewhere an attacker can get to... see the 
problem?). This is like fusing secureboot keys on SoCs (I remember being 
*very* nervous about hitting <enter> on the command to fuse a Tegra X1 
board with a secureboot key for some experiments... these kinds of 
irreversible things are no joke).

Basically, TPMs, SEP, YubiKeys, etc were designed to be generally useful 
and flexible devices for various crypto and authentication use cases. 
RPMB was designed for the sole purpose of plugging the secure storage 
replay exploit for Android phones running TrustZone secure monitors. It 
doesn't really do anything else; it's just a single low-level primitive 
and you need to already have an equivalent design that is only missing 
that piece to get anything from it. And its provisioning model assumes a 
typical OEM device production pipeline and integration with CPU fusing; 
it isn't friendly to Linux hackers messing around with securing LUKS 
unlock attempt counters.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
