Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D98D33338CF
	for <lists+keyrings@lfdr.de>; Wed, 10 Mar 2021 10:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232426AbhCJJdy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Mar 2021 04:33:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232489AbhCJJdt (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Mar 2021 04:33:49 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B35CBC061763
        for <keyrings@vger.kernel.org>; Wed, 10 Mar 2021 01:33:48 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id p21so32282635lfu.11
        for <keyrings@vger.kernel.org>; Wed, 10 Mar 2021 01:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dDRhDJmwcUrEs6ffAtS8tb/gtAhqWCALd3fRPCTAJ70=;
        b=bEUB6pz/vURQUdnkngDfbZbhni4rEB0aSPdUbUHgY9kTycoRiNRdZd8NKsojY2Qf6V
         sWGYFVgJXD7iz++3qlg7CPyNnJhDrhLfTNx8abBb+PuEapPT8bna2NGgl5Yd/t0JIJg+
         j19O4RtXQx59KLmeEyhcWN0i0q5/G1oq7yueI6eG4GtlA3ZZhQ8/YSD/RbI7P9h1yffw
         NOgrjH9rO6UWfkaurrhy6r4UrCm+gIyzA5kA2gaTK8PuObuQsUFug5gIff4Z3an9Yn0m
         5pSav63YOGmRbU63n5I6U7/LKhbQ01Ps3yQyOy/YDWhrZI81Oms1sjf2WIpdSchApRWT
         Km0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dDRhDJmwcUrEs6ffAtS8tb/gtAhqWCALd3fRPCTAJ70=;
        b=TaawLAIs9BnYCAEFF9tdQ4LmkvHIkSU98ePiPCGHyACsGAqBZzhH4d3udNOO6/levy
         CwyPGwGHR7Ph0MwWOGif3/DwCOjFHfg1YV2qK9uaa3/Zk7YumquiUpFLn72pI8DbHOrc
         o9/J1Ui9Ktpyq88TRDxFtR8p6g1+Rqy4cAc6n6q5cHM+3mhpW+tpSveypfWWEr2urqpy
         62mSavytGSeNvmRJOroAlB3Pq6AF2ybgri7hym8N5bsardPTgLo0eRzUDYHsr5kjHCil
         rG/h3dzW/GtBwQ/YSx0nffo5f0DcfYQPhrT1CLgRZ25Vukmz43EuSxzkQKIwa12wbks+
         wNtQ==
X-Gm-Message-State: AOAM530Nenh8YCZ2LDORs6OUofC23QXTRMGJNATD6QUCMcauFWcleWgW
        Vgan120eGZct2T3ym2kd4MCvuLky/DYy3dbCmA9C2A==
X-Google-Smtp-Source: ABdhPJxKM2BZRaNYPJ+fEjUPaeQksl/pR4sY3mSXpwekxQcskbbSM2E3UzpJMwFDvfLbDXlYPy+XJcSeA8y8GteS4wM=
X-Received: by 2002:a19:4c08:: with SMTP id z8mr1459058lfa.157.1615368827066;
 Wed, 10 Mar 2021 01:33:47 -0800 (PST)
MIME-Version: 1.0
References: <20210303135500.24673-1-alex.bennee@linaro.org>
 <20210303135500.24673-2-alex.bennee@linaro.org> <CAK8P3a0W5X8Mvq0tDrz7d67SfQA=PqthpnGDhn8w1Xhwa030-A@mail.gmail.com>
 <20210305075131.GA15940@goby> <CAK8P3a0qtByN4Fnutr1yetdVZkPJn87yK+w+_DAUXOMif-13aA@mail.gmail.com>
 <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com> <178479.1615309961@warthog.procyon.org.uk>
In-Reply-To: <178479.1615309961@warthog.procyon.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 10 Mar 2021 10:33:35 +0100
Message-ID: <CACRpkdaDtG4Xf0nYnT66C5d8GOwOoqd3=bZ1E3_=osveWo_C5A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB) subsystem
To:     David Howells <dhowells@redhat.com>
Cc:     Arnd Bergmann <arnd@linaro.org>, keyrings@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>,
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
        Arnd Bergmann <arnd.bergmann@linaro.org>,
        Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Mar 9, 2021 at 6:12 PM David Howells <dhowells@redhat.com> wrote:
> Linus Walleij <linus.walleij@linaro.org> wrote:
>
> > As it seems neither Microsoft nor Apple is paying it much attention
> > (+/- new facts) it will be up to the community to define use cases
> > for RPMB. I don't know what would make most sense, but the
> > kernel keyring seems to make a bit of sense as it is a well maintained
> > keyring project.
>
> I'm afraid I don't know a whole lot about the RPMB.  I've just been and read
> https://lwn.net/Articles/682276/ about it.

Sorry, here is a primer on RPMB.

The proper source is the eMMC specification from JEDEC
which has semi-open access:
https://www.jedec.org/standards-documents/technology-focus-areas/flash-memory-ssds-ufs-emmc/e-mmc

The spec is not super helpful because it does not describe what the
intention or use case for RPMB is, just what commands it can be
given.

Western Digital describes the use cases in this whitepaper page 5 ff:
https://documents.westerndigital.com/content/dam/doc-library/en_us/assets/public/western-digital/collateral/white-paper/white-paper-emmc-security.pdf

Quote:
"Some well-known use cases include software version
authentication, fingerprint verification, secure key storage,
network vendor information, digital rights management (DRM)
and secure payments."

The replay protected memory block comes from mobile phone
vendors, and it is described as designed for a usecase known
as "anti-rollback": make it impossible to flash an older firmware.
This is achieved by monotonic counters: a hardware counter
that always increases so that if we have software version 13
flashed we can flash version 14 or 15 but not version 10 or 12.
Attackers of mobile phones used the possibility to revert to
old firmware with vulnerabilities as an attack vector.

Messages to the RPMB are protected by a symmetric key
which is 32 bytes long. The hash used in messaging is
HMAC SHA-256.

The symmetric key is written once to initialize the RPMB.
With the current mmc-utils "mmc" command it looks like this:

echo -n AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHH | mmc rpmb write-key /dev/mmcblk0rpmb -

The entity writing stuff to RPMB needs to keep track of this
secret. This is why a secure world such as TEE is often using
RPMB, as these usually have access to a protected secret
key, but any trusted environment can use the mechanism.
Compared to TPM, we are on the inside of the chip here,
so the agent dealing with this secret key will be vulnerable.

After this secret has been initialized, protected data blocks of 256
bytes can be written to RPMB while providing the key likt this:

(awk 'BEGIN {while (c++<256) printf "a"}' | echo -n
AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHH) | mmc rpmb write-block
/dev/mmcblk0rpmb 0x02 - -

0x02 is the *counter*, so if you after this try to send the message
with 0x01 it will fail, whereas 0x03 will work. That is how the
monotonic counter is specified in the write interactions.

This can be imagined as writing keys 1, 2, 3 ... while you cannot
overwrite an older key you can write the next one in sequence.
Typically this would be the version number of a firmware.
The 256 bytes of data sent along with the key number is
typically the hash of a firmware. But it can be any 256 bytes
of data, RPMB leaves this up to whoever implements it.

You can also read chunks of 256 bytes from the device:
echo -n AAAABBBBCCCCDDDDEEEEFFFFGGGGHHHH | mmc rpmb read-block
/dev/mmcblk0rpmb 0x02 1 /tmp/block -

(0x02 again is the key index, 1 is the number of blocks/keys
we want to read)

This protocol is challenge-response so a random session key
will be used along with the MAC for authentication.

It is possible to read a key without authentication. I don't know
what the use case of this would be:

mmc rpmb read-block /dev/mmcblk0rpmb 0x02 1 /tmp/block

RPMB is a multiple of 128KB of key storage. Most typically
it is that size, so 128KB/256 = 512 unique keys can be
written in most standard parts.

> What is it you envision the keyring API doing with regard to this?
> Being used to represent the key needed to access the RPMB or
> being used to represent an RPMB entry (does it have entries?)?

The idea is to have an API toward RPMB that keyring can
use to store replay protection or other monotonic sequence
information. Only one party can hold the authentication key
so I guess both.

The most intuitive use case is protecting against exhaustive
password/pin/fingerprint/other authentication token search.

On mobile phones it is used to establish that 3 attempts is really
3 attempts, then your device is locked, for example. Doesn't
have to be 3. Can be 500. But to put a cap on it.

Also a time stamp from a monotonic clock can be stored in
RPMB so that the increasing time between unlock attempts
is enforced and cannot be manipulated. This requires
secure, monotonic time (which can be achieved in various
ways).

Is this something keyring does today, or would be doing
in the future? (Sorry for my ignorance...)

The original use case of being unable to install older
software can also be done, but since Linux distributions
generally support installing older packages I don't think
this is going to be requested much, maybe Chromebooks
and Androids would appreciate to do that through this
mechanism though?

Yours,
Linus Walleij
