Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0455B3428
	for <lists+keyrings@lfdr.de>; Mon, 16 Sep 2019 06:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbfIPEj7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 16 Sep 2019 00:39:59 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41967 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725446AbfIPEj7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 16 Sep 2019 00:39:59 -0400
Received: by mail-lj1-f194.google.com with SMTP id f5so382272ljg.8
        for <keyrings@vger.kernel.org>; Sun, 15 Sep 2019 21:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DlspV5URgvRkvXxNuJ156sbYo8cEx/JcT2NW3f+g8Cc=;
        b=mQHbMgmDPSQo5jWR6FmzdZPro6bVfB3SpjjKxve6qbbF3jZTgThJKB33kvsSmsTnIf
         SkDWiJWsCqF/NFlQ7CXSlGW3O/37K78hVAcHKlMFrgVpraUw++396y/9pbEf2c8B82cC
         TtnxKow7s+UeISoCQlJyPnWRAr0+uMY/jk8uD2cky0ezy8RyHG9reqelus3qkmkmXjfQ
         6xMqFgeBnf4oN+7nSXrd1WDl3g8OfXK2NgwoBxEmWbNdg3N0trbdJJvwGfG9vm13uzL6
         kCTbUhaw4udJfAvN+EJwM8P3C2nWjyDJsYvfLtMCKu9hQ5FgwuG5Po28u5L9Msm145+G
         GY7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DlspV5URgvRkvXxNuJ156sbYo8cEx/JcT2NW3f+g8Cc=;
        b=Fd/7TqDWJdoUExqT9RE+EoSkkt+L24g0PC8BqWvtLbC7riqeeBS8ePw7dFULAMBnBA
         cUi+CHajGa9N2n+3lmDc/7KukKvKnoOViJq9lzUccyqZ0+SUzCATsJ0dFLuGJoiVjdAp
         2sEXFDoKcbR26Rjn0qy5gatUWKEeB22OKdWd8i7d51Qcit/4i2SKoqOMYG0qvbKkPesu
         FUGRAedcevJiwA4MaZhAn2fbDWujLuuNbyABLznLWolmQp6lsihrSAHia5frL16X7ehR
         1ehoLB8nF+OQbfYU+CKsCyBJ7+0G9BTUj4KV+l5pi9gLg4fu62sC9rXg1l4fcFKv/J1k
         qmZA==
X-Gm-Message-State: APjAAAVPBA+Q+x3CivUGDZYJ3mDwXxyc0UvENQlpJEJASOXLY0JOzoca
        JXoldviqdXvMUpzOfKccrY6ZGwpGug7o3fB5ttJGug==
X-Google-Smtp-Source: APXvYqwXAhA1+KV2YeA0HMI/AFvAmR6dcXicZUXuc6v3FG609JnY/H64rM/p0aX+SdvhdtnVqFB6IeHudBlSgubI54w=
X-Received: by 2002:a2e:504f:: with SMTP id v15mr36798015ljd.67.1568608797345;
 Sun, 15 Sep 2019 21:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <1568200910-31368-1-git-send-email-sumit.garg@linaro.org> <20190913133057.GD7412@linux.intel.com>
In-Reply-To: <20190913133057.GD7412@linux.intel.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Mon, 16 Sep 2019 10:09:45 +0530
Message-ID: <CAFA6WYP3cYM6=sw7pAe_RmiTbxdOLHptPqmk8D=915TLF14Ecw@mail.gmail.com>
Subject: Re: [PATCH] KEYS: asym_tpm: Use common tpm_buf for asymmetric keys
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     dhowells@redhat.com, keyrings@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
        "open list:HARDWARE RANDOM NUMBER GENERATOR CORE" 
        <linux-crypto@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, 13 Sep 2019 at 19:01, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Wed, Sep 11, 2019 at 04:51:50PM +0530, Sumit Garg wrote:
> > Switch to utilize common heap based tpm_buf code for TPM based
> > asymmetric keys rather than using stack based tpm_buf code.
> >
> > Reported-by: kbuild test robot <lkp@intel.com>
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> Can you roll instead a new version of the whole patch set?

Okay, will send next version of whole patch-set along with this change.

-Sumit

>
> /Jarkko
