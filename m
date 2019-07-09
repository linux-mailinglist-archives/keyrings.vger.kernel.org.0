Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47EE763194
	for <lists+keyrings@lfdr.de>; Tue,  9 Jul 2019 09:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfGIHEA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Jul 2019 03:04:00 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33350 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725961AbfGIHEA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 9 Jul 2019 03:04:00 -0400
Received: by mail-lf1-f65.google.com with SMTP id x3so6704143lfc.0
        for <keyrings@vger.kernel.org>; Tue, 09 Jul 2019 00:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8chQ+xCDfWyHiMLd66byg5KO/gfXH9gGO2RNNVTCalM=;
        b=FqERsOeKsbYL1hDU92erKcsqSB1n/vAR7oF6mwlHmjMymElPV/dSjJn/XSlHSfZEwl
         FiJa2Qy+MbE0ZcRhYzxULeOxF+5amdUoNaUDvzBiG1ygbeOoXtJt4r+y4dSA6n3rKTtX
         ahxZEns92uGy9H/iigIR/zg4sIsdA3LKqGbPUloh86uxiIRheCYx1r9BDkztOgbK6+j1
         drSe44wrIRt1WYt5yoAQLhVI2ZpPP58F+Mf5uIrl/Ie3prj3FyR9nsR4qHG+KzjLnak1
         Ts4jHuNI5+q0idxZC1kHvKIXskrUQe/brL4cELfjcUGeJU9GsDJ47tE9mooBwA32FKaG
         0b7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8chQ+xCDfWyHiMLd66byg5KO/gfXH9gGO2RNNVTCalM=;
        b=WZR+PNJAh8WN5OUmXWYzSPGZzuZ2Uq4oCAPN7p+lk+uEvMqVVRnnvjVnQqIUvBW5hA
         6o7dQ0ff5/k+LsZ/KgI6B+0nySNz9QRT4qutih6yB0IWvDSpVcarmvpdQRo5OxW1fKa8
         3m14l/3beQUr/KuHZ9SfV13iyray/rwappG1sxE5Svw9rra9J9U7aIbwjBPuwoyThDLa
         bn4Z54QL3cu4z1dOcsmEcF+E8Sy5rCioOk3S5mw8us1XK+30Iq5hhTwKCW7Bc1oPuUZR
         Uu3je1vjV62lMeSmaS3sXOYfBf/meIsPvaXFuluEOVD6cdJFYofDMDfleZYiQ8S58O4s
         GWcg==
X-Gm-Message-State: APjAAAXAwaS+ZlKMYCrZPeIV5/wyno3osU6ajjzmndqIRYO0eTyzX7Wq
        tfLFHdBzoPu7fHnt1L0hOJ7Y9Q==
X-Google-Smtp-Source: APXvYqzgNmzW9LCOXb+v0waZuOzOFRSv6192P+bRM1wg2dgVLC7ByJM1yDax+2RlKtrpd1p4VkFDMA==
X-Received: by 2002:ac2:5609:: with SMTP id v9mr10278057lfd.27.1562655838100;
        Tue, 09 Jul 2019 00:03:58 -0700 (PDT)
Received: from jax (h-84-105.A175.priv.bahnhof.se. [79.136.84.105])
        by smtp.gmail.com with ESMTPSA id t23sm4092662ljd.98.2019.07.09.00.03.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2019 00:03:57 -0700 (PDT)
Date:   Tue, 9 Jul 2019 09:03:55 +0200
From:   Jens Wiklander <jens.wiklander@linaro.org>
To:     Sumit Garg <sumit.garg@linaro.org>
Cc:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org, corbet@lwn.net,
        dhowells@redhat.com, jejb@linux.ibm.com,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>, jmorris@namei.org,
        serge@hallyn.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-doc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        tee-dev@lists.linaro.org
Subject: Re: [RFC 3/7] tee: add private login method for kernel clients
Message-ID: <20190709070354.GA5791@jax>
References: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
 <1560421833-27414-4-git-send-email-sumit.garg@linaro.org>
 <20190708153908.GA28253@jax>
 <CAFA6WYNzs=RErreWaa5BmF-P03Vf9nzQjvY_JpMckw87k9z12w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFA6WYNzs=RErreWaa5BmF-P03Vf9nzQjvY_JpMckw87k9z12w@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Jul 09, 2019 at 11:26:19AM +0530, Sumit Garg wrote:
> Thanks Jens for your comments.
> 
> On Mon, 8 Jul 2019 at 21:09, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> >
> > Hi Sumit,
> >
> > On Thu, Jun 13, 2019 at 04:00:29PM +0530, Sumit Garg wrote:
> > > There are use-cases where user-space shouldn't be allowed to communicate
> > > directly with a TEE device which is dedicated to provide a specific
> > > service for a kernel client. So add a private login method for kernel
> > > clients and disallow user-space to open-session using this login method.
> > >
> > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > ---
> > >  drivers/tee/tee_core.c   | 6 ++++++
> > >  include/uapi/linux/tee.h | 2 ++
> > >  2 files changed, 8 insertions(+)
> > >
> > > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > > index 0f16d9f..4581bd1 100644
> > > --- a/drivers/tee/tee_core.c
> > > +++ b/drivers/tee/tee_core.c
> > > @@ -334,6 +334,12 @@ static int tee_ioctl_open_session(struct tee_context *ctx,
> > >                       goto out;
> > >       }
> > >
> > > +     if (arg.clnt_login == TEE_IOCTL_LOGIN_REE_KERNEL) {
> > TEE_IOCTL_LOGIN_REE_KERNEL is defined as 0x80000000 which is in the
> > range specified and implementation defined by the GP spec. I wonder if
> > we shouldn't filter the entire implementation defined range instead of
> > just this value.
> 
> Agree. Will rather check for entire implementation defined range:
> 0x80000000 - 0xFFFFFFFF.
> 
> >
> > > +             pr_err("login method not allowed for user-space client\n");
> > pr_debug(), if it's needed at all.
> >
> 
> Ok will use pr_debug() instead.
> 
> > > +             rc = -EPERM;
> > > +             goto out;
> > > +     }
> > > +
> > >       rc = ctx->teedev->desc->ops->open_session(ctx, &arg, params);
> > >       if (rc)
> > >               goto out;
> > > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > > index 4b9eb06..f33c69c 100644
> > > --- a/include/uapi/linux/tee.h
> > > +++ b/include/uapi/linux/tee.h
> > > @@ -172,6 +172,8 @@ struct tee_ioctl_buf_data {
> > >  #define TEE_IOCTL_LOGIN_APPLICATION          4
> > >  #define TEE_IOCTL_LOGIN_USER_APPLICATION     5
> > >  #define TEE_IOCTL_LOGIN_GROUP_APPLICATION    6
> > > +/* Private login method for REE kernel clients */
> > It's worth noting that this is filtered by the TEE framework, compared
> > to everything else which is treated opaquely.
> >
> 
> IIUC, you are referring to login filter in optee_os. Change to prevent
> filter for this login method is part of this PR [1].
> 
> [1] https://github.com/OP-TEE/optee_os/pull/3082

No, I was referring to the changes in tee_ioctl_open_session() above.
It's relevant for user space to know since it will be prevented from
using that range of login identifiers. This will restrict the user space
API, but I think the risk of breakage is minimal as OP-TEE is the only
in-tree driver registering in the TEE framework. I'm not aware of any
out-of-tree drivers registering.

Thanks,
Jens

> 
> -Sumit
> 
> > > +#define TEE_IOCTL_LOGIN_REE_KERNEL           0x80000000
> > >
> > >  /**
> > >   * struct tee_ioctl_param - parameter
> > > --
> > > 2.7.4
> > >
> >
> > Thanks,
> > Jens
