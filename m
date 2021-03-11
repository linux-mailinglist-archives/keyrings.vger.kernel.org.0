Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD341336968
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 02:08:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229578AbhCKBII (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Mar 2021 20:08:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhCKBHj (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Mar 2021 20:07:39 -0500
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [IPv6:2607:fcd0:100:8a00::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D29DDC061574;
        Wed, 10 Mar 2021 17:07:38 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id D65C61280622;
        Wed, 10 Mar 2021 17:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1615424856;
        bh=rPT+VYV1+Cvgf3klr7B1cClAbrNcSs/uscoE5EBQ0nc=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=p12GzutZqy8xcUa2GnBy4AOa+gxAVmux6akGb/gVO8WcPowOFQyN5jmyE52Lyz7/r
         BnDxvXjx8FggJ+nr1mNWUTNHncvcWJIEcSSWGK5if6n5S5UvFcoGs9xCV/aH6Zx5oI
         cLwFa94vi+9FtHBA27LQV/mVFHIhmeEXGaeMba6U=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id gW20K4LJnFMI; Wed, 10 Mar 2021 17:07:36 -0800 (PST)
Received: from jarvis.int.hansenpartnership.com (unknown [IPv6:2601:600:8280:66d1::527])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id AA7E31280610;
        Wed, 10 Mar 2021 17:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=hansenpartnership.com; s=20151216; t=1615424856;
        bh=rPT+VYV1+Cvgf3klr7B1cClAbrNcSs/uscoE5EBQ0nc=;
        h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
        b=p12GzutZqy8xcUa2GnBy4AOa+gxAVmux6akGb/gVO8WcPowOFQyN5jmyE52Lyz7/r
         BnDxvXjx8FggJ+nr1mNWUTNHncvcWJIEcSSWGK5if6n5S5UvFcoGs9xCV/aH6Zx5oI
         cLwFa94vi+9FtHBA27LQV/mVFHIhmeEXGaeMba6U=
Message-ID: <d93321502a3df2f7afa42da417137d79f6e49961.camel@HansenPartnership.com>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB)
 subsystem
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>
Cc:     Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@linaro.org>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Joakim Bech <joakim.bech@linaro.org>,
        Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
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
Date:   Wed, 10 Mar 2021 17:07:34 -0800
In-Reply-To: <CACRpkdZb5UMyq5qSJE==3ZnH-7fh92q_t4AnE8mPm0oFEJxqpQ@mail.gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 2021-03-11 at 01:49 +0100, Linus Walleij wrote:
> The use case for TPM on laptops is similar: it can be used by a
> provider to lock down a machine, but it can also be used by the
> random user to store keys. Very few users beside James
> Bottomley are capable of doing that (I am not)

Yes, that's the problem with the TPM: pretty much no-one other than
someone prepared to become an expert in the subject can use it.  This
means that enabling RPMB is unlikely to be useful ... you have to
develop easy use cases for it as well.

>  but they exist.
> https://blog.hansenpartnership.com/using-your-tpm-as-a-secure-key-store/

It's the difficulty of actually *using* the thing as a keystore which
causes the problem.   The trick to expanding use it to make it simple.
Not to derail the thread, but this should hopefully become a whole lot
easier soon.  Gnupg-2.3 will release with easy to use TPM support for
all your gpg keys:

https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gnupg.git;a=log;h=6720f1343aef9342127380b155c19e12c92d65ac

It's not the end of the road by any means, but hopefully it will become
a beach head of sorts for more uses.

James


