Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3E43D70F8
	for <lists+keyrings@lfdr.de>; Tue, 15 Oct 2019 10:28:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbfJOI2c (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 15 Oct 2019 04:28:32 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39310 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728814AbfJOI2c (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 15 Oct 2019 04:28:32 -0400
Received: by mail-lf1-f65.google.com with SMTP id 195so827390lfj.6
        for <keyrings@vger.kernel.org>; Tue, 15 Oct 2019 01:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L5wMHSfNnEWBqo2RTVbGHKllY39az7+dGH8dtqMkppI=;
        b=NkYkqAb+sir0jCJHjpK21qyDvxnUjnpgpM/sZEWrygLnQ79QxMoifD0vgduaXQaLYa
         kMP6ysN+mXa+9HITfreJWaV7iGkJMRZFjt2sSf0QFI6mfjHdVTBH9sJ7pxmYkySHHUkf
         Hl2cUppOpzfk9G1nFjgQLfq7wP82YwGBsdqZaKnt3BBXK9JUnsGN278PKEogSUCaOMOa
         NFmQgXEbKJ0RN3dB1mQ2NZUSohu2N27MvUrpfz5mVDpWGU0paWN0RrhMTecUNpccGHeM
         hpPjQBNWicPCiy74T3iwUyMUoZuzYZAlDUaCxa8QstkXN+ghiwiEoxKOS2Gds+mAr/j+
         9DlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L5wMHSfNnEWBqo2RTVbGHKllY39az7+dGH8dtqMkppI=;
        b=DFT7nP+cZZT0xkt8amMGfP7b5bePYlNeqeozfYCk0WnovqH49EL4hxYWuigBC/qVTm
         7p8RIgQhaz02ZBihTM21SFzejvDAH0oNx0xcZNMMgEe3HSry/WrQYxrg/IvjbgW50vmI
         rWs6A84To9LiYdR/aS5EOKlg/gmrt2YHCaUgov1y5/Pjm3OIh4yiNkCr7MD8EyhuFo0/
         WKlNQ9OSgJjyLgFYXa0tw75KYOzeR99H/aJrHLnK/L2aZjlk73OK+OPJiEJcL+8GAskl
         82JfbaLMoSdW1Y8r7l0SJf9iubcscv3CxZSPZb5SbuZIlFGOFEJN3rUV5tpUf5w7Y6ov
         aoXQ==
X-Gm-Message-State: APjAAAWI76s/6wvZ/ImON4bi86IoixeaffdRFFZeTBQ/90VqLJsIoBhn
        hGSKzgsXT+ucLQfboCuOC7cXqePglWcJD9++mCPFuXqB
X-Google-Smtp-Source: APXvYqz2LuA9cNk9QshA3e79M6RGO0JbFQp98BajeQ9pbcsS0bk+xJtocdTAqoYR+M0LPsWNfA5ZwnLKFyDgYJCJfhI=
X-Received: by 2002:ac2:43a8:: with SMTP id t8mr20218147lfl.134.1571128110112;
 Tue, 15 Oct 2019 01:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <1570425935-7435-1-git-send-email-sumit.garg@linaro.org>
 <20191011123757.GD3129@linux.intel.com> <20191014193350.GG15552@linux.intel.com>
In-Reply-To: <20191014193350.GG15552@linux.intel.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Tue, 15 Oct 2019 13:58:18 +0530
Message-ID: <CAFA6WYOsP+1WDyuPBcOa9h07tqyCrtNLfXz-joNYj=Kdo+poYg@mail.gmail.com>
Subject: Re: [Patch v7 0/4] Create and consolidate trusted keys subsystem
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     dhowells@redhat.com, peterhuewe@gmx.de, keyrings@vger.kernel.org,
        linux-integrity@vger.kernel.org,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        linux-security-module@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
        jgg@ziepe.ca, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        jejb@linux.ibm.com, Mimi Zohar <zohar@linux.ibm.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Jerry Snitselaar <jsnitsel@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 15 Oct 2019 at 01:04, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Fri, Oct 11, 2019 at 03:37:57PM +0300, Jarkko Sakkinen wrote:
> > On Mon, Oct 07, 2019 at 10:55:31AM +0530, Sumit Garg wrote:
> > > This patch-set does restructuring of trusted keys code to create and
> > > consolidate trusted keys subsystem.
> > >
> > > Also, patch #2 replaces tpm1_buf code used in security/keys/trusted.c and
> > > crypto/asymmertic_keys/asym_tpm.c files to use the common tpm_buf code.
> > >
> > > Changes in v7:
> > > 1. Rebased to top of tpmdd/master
> > > 2. Patch #4: update tpm2 trusted keys code to use tpm_send() instead of
> > >    tpm_transmit_cmd() which is an internal function.
> > >
> > > Changes in v6:
> > > 1. Switch TPM asymmetric code also to use common tpm_buf code. These
> > >    changes required patches #1 and #2 update, so I have dropped review
> > >    tags from those patches.
> > > 2. Incorporated miscellaneous comments from Jarkko.
> > >
> > > Changes in v5:
> > > 1. Drop 5/5 patch as its more relavant along with TEE patch-set.
> > > 2. Add Reviewed-by tag for patch #2.
> > > 3. Fix build failure when "CONFIG_HEADER_TEST" and
> > >    "CONFIG_KERNEL_HEADER_TEST" config options are enabled.
> > > 4. Misc changes to rename files.
> > >
> > > Changes in v4:
> > > 1. Separate patch for export of tpm_buf code to include/linux/tpm.h
> > > 2. Change TPM1.x trusted keys code to use common tpm_buf
> > > 3. Keep module name as trusted.ko only
> > >
> > > Changes in v3:
> > >
> > > Move TPM2 trusted keys code to trusted keys subsystem.
> > >
> > > Changes in v2:
> > >
> > > Split trusted keys abstraction patch for ease of review.
> > >
> > > Sumit Garg (4):
> > >   tpm: Move tpm_buf code to include/linux/
> > >   KEYS: Use common tpm_buf for trusted and asymmetric keys
> > >   KEYS: trusted: Create trusted keys subsystem
> > >   KEYS: trusted: Move TPM2 trusted keys code
> > >
> > >  crypto/asymmetric_keys/asym_tpm.c                  | 101 +++----
> > >  drivers/char/tpm/tpm-interface.c                   |  56 ----
> > >  drivers/char/tpm/tpm.h                             | 226 ---------------
> > >  drivers/char/tpm/tpm2-cmd.c                        | 307 --------------------
> > >  include/Kbuild                                     |   1 -
> > >  include/keys/{trusted.h => trusted_tpm.h}          |  49 +---
> > >  include/linux/tpm.h                                | 251 ++++++++++++++--
> > >  security/keys/Makefile                             |   2 +-
> > >  security/keys/trusted-keys/Makefile                |   8 +
> > >  .../{trusted.c => trusted-keys/trusted_tpm1.c}     |  96 +++----
> > >  security/keys/trusted-keys/trusted_tpm2.c          | 314 +++++++++++++++++++++
> > >  11 files changed, 652 insertions(+), 759 deletions(-)
> > >  rename include/keys/{trusted.h => trusted_tpm.h} (77%)
> > >  create mode 100644 security/keys/trusted-keys/Makefile
> > >  rename security/keys/{trusted.c => trusted-keys/trusted_tpm1.c} (94%)
> > >  create mode 100644 security/keys/trusted-keys/trusted_tpm2.c
> > >
> > > --
> > > 2.7.4
> > >
> >
> > I fixed a merge conflict caused by James' commit. Already pushed.
> > Compiling test kernel ATM i.e. tested-by's will follow later.
>
> Update to my latest master for v8 (otherwise there won't be a clean
> merge).
>

Okay, I will send v8 to rebase to your latest master.

-Sumit

> /Jarkko
