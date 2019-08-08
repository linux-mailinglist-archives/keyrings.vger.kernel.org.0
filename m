Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCAEF86198
	for <lists+keyrings@lfdr.de>; Thu,  8 Aug 2019 14:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732354AbfHHM1L (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Aug 2019 08:27:11 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36423 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbfHHM1L (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Aug 2019 08:27:11 -0400
Received: by mail-lj1-f194.google.com with SMTP id i21so9458180ljj.3
        for <keyrings@vger.kernel.org>; Thu, 08 Aug 2019 05:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LJoQH6xbNoByXFD03CQzff1T1rg3XHHfexy4zm58VFs=;
        b=pK2Jy2aJCqvL6Zbsse9R6qW+16L7rOEkySHszCEBs5F0VKRotPrPyu44jyyDIClbQQ
         3DXllrjriP90L6RaVglWIEDATs2iioGY3o/+TzwopWNuXqtMPsTNpy1XfXKhSr8pH2AI
         PmKanKd9U5CeLi80hdvEiobNCfwIbFdEuMJ60bzrJ9LAfk/2OYiAurZUw0qcixF4M5SE
         YcUWAOtvqaMQSuC25S5dtrp2wI4qSjIkU4XQisSWyRh30It0AZ85X2drJbvJNBnGIRzL
         Z6OeCrSjtn5x6V4mqIwHu4iZR4MPFncMiR6jAKvSTmHx2mMzGxStUZG6zRF4OiFk7FmD
         /3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LJoQH6xbNoByXFD03CQzff1T1rg3XHHfexy4zm58VFs=;
        b=XN2h4Hay1YrKBlNFLZ1NYUT0lLFed49LRwhtgG14MtbHB54mUUWJCHR0UMwpPzrskT
         Uhler9grVi9apavXZp34bdpIGQBaWhZ/lP8+LCzUDF4vXbqfUmzL32BiRHrvJEvV3zyH
         o9VtPqagQVQ13LI5QM6aeFO9UPtxuDcAEFrJqMfBR2vjVtdNJtTbsyxIIangLXNw7s0Q
         MYMqUwFbejifm6epbQm4lmrUU75YTNPSxpLampxC29jS920iOd4+mCvoLggtp/Dvw+Sb
         W/xZ+ihdHghcBNTAb+vwge/lintR93BqFGXZ08HuvgQ5eRiAXpmVXlVFRK1SbZQxEzf0
         ft2g==
X-Gm-Message-State: APjAAAUncyilVceP4AMbvBJvqCnShsG9vUuiFir/D3+M2ysvGTTeyLUs
        36eeIhwUhg2/M+y0F8NqYdmWeaOVjcuLLjnfI3ZV/xr7LeI=
X-Google-Smtp-Source: APXvYqynn5VMST3cneWTKIKRfdQOUrgp2WS4DuM61xZXzMCVt2m7Y/3Qm9PGybsLU6uCQeZXVn92r6kYkU7iqFaN4is=
X-Received: by 2002:a2e:4b12:: with SMTP id y18mr7770792lja.238.1565267229165;
 Thu, 08 Aug 2019 05:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <1565098640-12536-1-git-send-email-sumit.garg@linaro.org>
 <1565098640-12536-2-git-send-email-sumit.garg@linaro.org> <20190807185921.lhdt3ek6tphj33bo@linux.intel.com>
In-Reply-To: <20190807185921.lhdt3ek6tphj33bo@linux.intel.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Thu, 8 Aug 2019 17:56:57 +0530
Message-ID: <CAFA6WYPsNuN=F9y+Q0r8-6MQAGGZeKUtRheQgKv3HmE1ViyviA@mail.gmail.com>
Subject: Re: [RFC/RFT v3 1/3] KEYS: trusted: create trusted keys subsystem
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        linux-security-module@vger.kernel.org, dhowells@redhat.com,
        Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
        peterhuewe@gmx.de, jgg@ziepe.ca, jejb@linux.ibm.com,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mimi Zohar <zohar@linux.ibm.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 8 Aug 2019 at 00:29, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Tue, Aug 06, 2019 at 07:07:18PM +0530, Sumit Garg wrote:
> > Move existing code to trusted keys subsystem. Also, rename files with
> > "tpm" as suffix which provides the underlying implementation.
> >
> > Suggested-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> The name for should be still trusted.ko even if new backends are added.
> Must be done in order not to break user space.

Agree. I think I need to update Makefile as follows:

obj-$(CONFIG_TRUSTED_KEYS) += trusted.o
trusted-y += trusted-tpm.o

-Sumit

>
> Situation is quite similar as when new backends were added to tpm_tis
> some time ago: MMIO backed implementation was kept as tpm_tis.ko, the
> core module was named as tpm_tis_core and SPI backed implementation was
> named as tpm_tis_spi.ko.
>
> /Jarkko
