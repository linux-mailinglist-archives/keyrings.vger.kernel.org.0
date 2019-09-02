Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E663A4EC1
	for <lists+keyrings@lfdr.de>; Mon,  2 Sep 2019 07:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729373AbfIBFIC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 2 Sep 2019 01:08:02 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:44402 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729475AbfIBFIA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 2 Sep 2019 01:08:00 -0400
Received: by mail-lf1-f66.google.com with SMTP id y4so2533073lfe.11
        for <keyrings@vger.kernel.org>; Sun, 01 Sep 2019 22:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ilSbiagMb8MDrFFrHKZRONzqQD46TOKazPpK+Hghz8=;
        b=nqjzBoghOOWRnsGKo0hc5tLqpCIYHBSaF4pOmHVyGWUTqjo9cXI14oeqCp8TaoTCEs
         qbia7LVNwlOUQAfSwodrZczzxLMWOOlmgdhZieuLhivvmVe2eBGRTn03ZD/zPmO+C7zD
         RPWwC1khbX879P3loaqVR7m9AQr8gU8VoG+luBB5oF+Tce+qY0kr16AYA2g1W5dnKu0N
         CeVCRFrYDMoN3yNVTfrNZrC1tuHbcyCapPfpiX51+Pek3NW4vZ9klTQhHcQJ2cXRKDnM
         59qxUPCUIjIpioFGsdTwBzkSMpvtezvqgmtERhn7iNhF2ji9gcvtLeNuALDjQFggrOoI
         yidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ilSbiagMb8MDrFFrHKZRONzqQD46TOKazPpK+Hghz8=;
        b=NUqchHHtEYrSxS8dSDtKMSbGFTsyZUpsRD1HwUYEXP3dkgMoQTeZOt14e2QbeQwG87
         ndK4MuF6RxfMetm0dTaNEDuGxUGcS8QCRNf8EdRhO1WxALxanB+CAyh/W79/ZJm3fvMp
         YYFygYpHw5JdKmW+/hP82u/aM6QrNcDqZdyDWdkxT9SbAwgi2hh71tc/1CWrsdlxPI7p
         lYpOsiLCew1T0osSiP19Nzvz51vkRRnvKG/L+rAC2w9lgi96TnAp5qQanOF2RcmofOC2
         JvMPuniE5Y8p8LW2wR+8DejDo6CzoLUe6plADTkNoioseYKBfVTvcEm33Nc3cLEaE0le
         DJHQ==
X-Gm-Message-State: APjAAAXRA3hwLxkp7cVdzgICNIvwxVGtJCiO8u5j4u7VaoWcVx8nz60O
        meN6HQ4xaL1F6CpESxq1k4h/S/fQf8uFwa7jr6p0Dg==
X-Google-Smtp-Source: APXvYqwufd4iFBKjqhDBaeG3AQjxlixJOFLSd8jgmtbAK2KinPCD4CvLAfFVljPOmsHNKEreqPtLmRRn52Zt1FIE25g=
X-Received: by 2002:ac2:4847:: with SMTP id 7mr4310147lfy.186.1567400878062;
 Sun, 01 Sep 2019 22:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <1565682784-10234-1-git-send-email-sumit.garg@linaro.org>
 <1565682784-10234-6-git-send-email-sumit.garg@linaro.org> <CAFA6WYO7Z-Enmnqt8zA_+VV_p=mAc+AotTetv9hhf2xHm0mR9g@mail.gmail.com>
 <20190830172031.dm5icfyakko6eqak@linux.intel.com> <20190830172405.rafhm362tsuufbqb@linux.intel.com>
In-Reply-To: <20190830172405.rafhm362tsuufbqb@linux.intel.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Mon, 2 Sep 2019 10:37:47 +0530
Message-ID: <CAFA6WYNL+ibz94sthC2mzJ+ufV3fJU7g-4ZeRbc+LOfjpsYO2A@mail.gmail.com>
Subject: Re: [RFC/RFT v4 5/5] KEYS: trusted: Add generic trusted keys framework
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        linux-security-module@vger.kernel.org,
        Mimi Zohar <zohar@linux.ibm.com>, dhowells@redhat.com,
        Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
        peterhuewe@gmx.de, jgg@ziepe.ca, jejb@linux.ibm.com,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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

On Fri, 30 Aug 2019 at 22:54, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Fri, Aug 30, 2019 at 08:20:31PM +0300, Jarkko Sakkinen wrote:
> > On Fri, Aug 30, 2019 at 02:49:31PM +0530, Sumit Garg wrote:
> > > Any comments/feedback on this patch before I send next version of TEE
> > > patch-set with this patch included?
> >
> > Unfortunately don't have time before LPC to go deep with the follow up.
> >
> > I will look into this in detail after LPC.

No worries, I will wait for your feedback.

>
> I'll ping you once your first row of patches are in my tree so you
> can rebase these on top of that.
>

Thanks.

-Sumit

> /JArkko
