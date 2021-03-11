Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB609336931
	for <lists+keyrings@lfdr.de>; Thu, 11 Mar 2021 01:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbhCKAth (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 10 Mar 2021 19:49:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbhCKAtV (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 10 Mar 2021 19:49:21 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CFEEC061574
        for <keyrings@vger.kernel.org>; Wed, 10 Mar 2021 16:49:21 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id i26so190395ljn.1
        for <keyrings@vger.kernel.org>; Wed, 10 Mar 2021 16:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ox3YbRagycUxmw78NTFqQ+S7fDqtoh07jucOaJdw1fo=;
        b=gVxWSX3GBSMyahq/hWU0tB+mLUCX21zWMy0Y4QPm7WGghRLuDygp+2XrwCt5ARRPmg
         1AqC8Gpk+8lGbA40j/v9mxJflQkHNOSxeW/x9peiDgKOua4ck2K5RYD3xFcMJFrdoZ0T
         qUW/FbL4LCQZUgA1kFbRg0mw5D5FdqATt1uWuP6utIK0QOWgtKFtZzYaeYBobg7PU5WS
         gbvYN7IyE4g6X7GFOP2jpVAcMHq4Ox1fwbFMxv+5t14oCsCLn3Uj+bbi6PrIZPDLPtSL
         NDStu6t58b+POgN3O6H6E09HKKFDDKAbJ3lpyc2dvQbDGvMMWOOJCMzXJABEZUiTNetc
         OEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ox3YbRagycUxmw78NTFqQ+S7fDqtoh07jucOaJdw1fo=;
        b=CyMHBhpBv9AoLmgERfBI2oWFzE/tDsAggDoq+9oJWdJUtWi8sMVywsdIeqe66dvQOf
         xbXhjkmJT5Su7syyf6YtXGGjSgCWEL8HwXQQZ7TPbX5b0RgvmI8ak7NTWwu/6Rg6Nnr0
         tg/TUIMNHBfmng/n9xII65OaMTj59NTSoh9FfAluWPMble0UEGdq8yRgVkIs69BBV1ZX
         gkuIBCVlrTXlm2btS5kXWBlt6WAh/mkMIja5dRPBLs8HU7MqcyfKLNM7BV/BcsQZ4oz0
         QKDCSXYrdbvmCAfoTJhaU/CbP+eb2QLI6Ig3pFVOYuDDYIfR5c7lt7V3Yo+UhPYCo0vN
         ZNpQ==
X-Gm-Message-State: AOAM533x5UDunLuRA7IvyoQycnP+/aEvFdtgtojmdYbODG92lK/pH525
        Ik4YnAIlHAhubxUolzpX1EfLdmE2mAqo2CMhh8qgIg==
X-Google-Smtp-Source: ABdhPJwFAsS9vkZ1E5gfF/nKfMMO5sLPxRlFQfVjCzHucvlKcydFzHpPcKSv2E5s1/9bLar5hZ9uBpccepemCbzcmAA=
X-Received: by 2002:a2e:9004:: with SMTP id h4mr3366846ljg.326.1615423759569;
 Wed, 10 Mar 2021 16:49:19 -0800 (PST)
MIME-Version: 1.0
References: <20210303135500.24673-1-alex.bennee@linaro.org>
 <20210303135500.24673-2-alex.bennee@linaro.org> <CAK8P3a0W5X8Mvq0tDrz7d67SfQA=PqthpnGDhn8w1Xhwa030-A@mail.gmail.com>
 <20210305075131.GA15940@goby> <CAK8P3a0qtByN4Fnutr1yetdVZkPJn87yK+w+_DAUXOMif-13aA@mail.gmail.com>
 <CACRpkdb4RkQvDBgTMW_+7yYBsHNRyJZiT5bn04uQJgk7tKGDOA@mail.gmail.com>
 <6c542548-cc16-af68-c755-df52bd13b209@marcan.st> <CAFA6WYOYmTgguVDwpyjnt3gLssqW48qzAkRD_nyPYg0nNhxT2A@mail.gmail.com>
 <beca6bc8-8970-bd01-8de0-6ded1fb69be2@marcan.st> <CAFA6WYMSJxK2CjmoLJ6mdNNEfOQOMVXZPbbFRfah7KLeZNfguw@mail.gmail.com>
In-Reply-To: <CAFA6WYMSJxK2CjmoLJ6mdNNEfOQOMVXZPbbFRfah7KLeZNfguw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 11 Mar 2021 01:49:08 +0100
Message-ID: <CACRpkdZb5UMyq5qSJE==3ZnH-7fh92q_t4AnE8mPm0oFEJxqpQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] rpmb: add Replay Protected Memory Block (RPMB) subsystem
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@linaro.org>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        David Howells <dhowells@redhat.com>,
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
        Arnd Bergmann <arnd.bergmann@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, Mar 10, 2021 at 11:29 AM Sumit Garg <sumit.garg@linaro.org> wrote:

> And RPMB key provisioning
> being a one time process should be carried out carefully during device
> manufacturing only.

For a product use case such as a mobile or chromebook or
set-top box: yes. In this scenario something like TEE possesses
this symmetric key.

But for a random laptop with an NVME containing an RPMB it
may be something the user want to initialize and use to lock down
their machine.

The use case for TPM on laptops is similar: it can be used by a
provider to lock down a machine, but it can also be used by the
random user to store keys. Very few users beside James
Bottomley are capable of doing that (I am not) but they exist.
https://blog.hansenpartnership.com/using-your-tpm-as-a-secure-key-store/

I think we need to think not only of existing use cases but also
possible ones even if there is currently no software for other
use cases. (But maybe that is too ambitious.)

Yours,
Linus Walleij
