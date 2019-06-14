Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D08D0453D4
	for <lists+keyrings@lfdr.de>; Fri, 14 Jun 2019 07:13:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725859AbfFNFNi (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 14 Jun 2019 01:13:38 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42190 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725801AbfFNFNh (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 14 Jun 2019 01:13:37 -0400
Received: by mail-lj1-f193.google.com with SMTP id t28so989249lje.9
        for <keyrings@vger.kernel.org>; Thu, 13 Jun 2019 22:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pEcwvzDbZgh36sf0IDCKh8szy53wV/GjfhuFB+x9+B0=;
        b=s2taeimw3XvFPIL11YwD/5Yw5TcIPVUvT8+tgj8+2Zyh6SVTrHyyk/EJ/JCRhF//fw
         A+2S86fznNpPTwxq6Z0Bo5GwbrLr1ETUBE+fCUiWfHDy1ry0/FU40X1JPxwHJSHuXyNs
         cBnVNupPUiBNNCRN3y+IPUsKOnnTSZktQaPAjCRCitcR6kesm+/CYpQuV2lCmEz7xVus
         44bJ1huXCH/7TA4XaXN41ZX5NREeKaKbP5Kc0dvkrvA+KzT3qyTQbm4k5yQVfqsl5URy
         v4i22cjKfuvWrpRAt8la5w1JBjqVB2nGrhkF+DHEv6AlOQgyvmJ3+axF4XxaBBvqGaIR
         4wHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pEcwvzDbZgh36sf0IDCKh8szy53wV/GjfhuFB+x9+B0=;
        b=IiqxK7vSp7YXZLojArAoMIl5ymS39IPBzuQKK6MyAz05Vxpl4vBFTkn5U5Iyqvp6cT
         aGpcDs+YYV7RJa4xYBwDInZI0TU82sWUVNZQpTTWpHcN3UWtSPgmsBX3zHP+WyIWuyXV
         aq351EZv6pecFsZ2lWV3FShWwZML3xrglIFp0xjFh2C3FzEhmFPiE1V6Y8ruzQbiQThk
         TCGhY5wDBD8TxZti7wIHoY7Y4M5BIkD4kncKQTXswcM99KnReE1F7iiwpwgjBEBg7IEW
         j6YC8rAr1k1Rt57sPrCgnf/+1FI3XaC7E8wpfzTnXUr/dJ5PLa+Uknem8DQTUBgRPqDD
         iGFg==
X-Gm-Message-State: APjAAAU722fwrLhLxxEcrjGjImfQZXe7PXgcHio2Jhef+x6TCwAObkIc
        U8+Yti/JpAXs4kC+AFMuUCzJCKRV3U2YwgjOj4+vwA==
X-Google-Smtp-Source: APXvYqyMLEhKd1WWY+BA07+pXv1UfARrC4yw3pAYgqbxqGyINCZlSFS8u3RnkH7fTLodB4y6NuAlY19vyYH/44JgWfg=
X-Received: by 2002:a2e:85d4:: with SMTP id h20mr14940805ljj.142.1560489215802;
 Thu, 13 Jun 2019 22:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
 <1560421833-27414-3-git-send-email-sumit.garg@linaro.org> <20190613152003.GE18488@linux.intel.com>
In-Reply-To: <20190613152003.GE18488@linux.intel.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Fri, 14 Jun 2019 10:43:24 +0530
Message-ID: <CAFA6WYOqMaLDBZSY5GYUc=p2GqtpujLfHo4OjqX83q-0aGD1bw@mail.gmail.com>
Subject: Re: [RFC 2/7] tee: enable support to register kernel memory
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Jens Wiklander <jens.wiklander@linaro.org>, corbet@lwn.net,
        dhowells@redhat.com, jejb@linux.ibm.com, zohar@linux.ibm.com,
        jmorris@namei.org, serge@hallyn.com,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tee-dev@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, 13 Jun 2019 at 20:50, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Thu, Jun 13, 2019 at 04:00:28PM +0530, Sumit Garg wrote:
> > Enable support to register kernel memory reference with TEE. This change
> > will allow TEE bus drivers to register memory references.
> >
> > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
>
> Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>

Thanks.

-Sumit

> /Jarkko
