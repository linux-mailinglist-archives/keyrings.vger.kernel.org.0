Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC18578C74
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2019 15:14:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728499AbfG2NN5 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 29 Jul 2019 09:13:57 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45980 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728023AbfG2NN5 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 29 Jul 2019 09:13:57 -0400
Received: by mail-lj1-f194.google.com with SMTP id m23so58479273lje.12
        for <keyrings@vger.kernel.org>; Mon, 29 Jul 2019 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CKQDL2I9Hvug1vr4XsFN5hEugWYt2/ZUAQmrZwDJrns=;
        b=rhaPG1aLchXR6WBP771DpOoicyGcNXJyl9fYnTySbX8UwpfkuS7m+zFFUvW5U+cdTd
         mg9G3iU8EPKRpA9zK3rk0IoSR9rZo9oYQOB1yl0+jx9HO780HdQuq0zohU9jLuYHmxLL
         W60xZVi4YzKA0/r5A3K3NL3w4jiU+stY9wm924irY6Q55eEo0RGTTgUm8z8QDMiALXy4
         9v7FPDVuywacS8Y9SK8psywCvWOzE6InOqicRKXPkLs4VYSHw3AbbW/fRJJWetJlzJJT
         8fq7K3r4Y0YdxSTpZdT0BKt1zSXMcpeC6M57I40tymiLnYOP3pt7KDZy4IL8N9pZ0ukP
         PPnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CKQDL2I9Hvug1vr4XsFN5hEugWYt2/ZUAQmrZwDJrns=;
        b=EZC03sRyOe05WbrJsiYF110HEIWM6irNtR3y2kKW809YZFK6TGAi7eNGCaMYOpHIKn
         wvzhOrghNzAJ7ma59FOoHHijh4EOGwgPADrWeZRQ6ZF4y9U1ifo5RhwzwrysxCXgfzLd
         esioxqMFgIaJ/eOO62SIuKOfWWcezz6cwIesJh7tBn7YisC6I99S+tNaedSmpb12eY3M
         OIC7r1+7UnVnUIBOaF0l7ffbR/DQfBd2ea+lqRhHNmZYogomuaYajvqR8gvFTz5eOAU7
         2mJWtz9HvebmPqDBjLZQhEHdUnrjRtog/U+RIjkJafPAhooTAczJRUrf5Oarr1/biFAx
         KA4g==
X-Gm-Message-State: APjAAAVwvz/WPSsXUsAOhqq97SY0GbPtqjTs7DYK5umjnGfZP3S53XUi
        qHcPER4VuXgp4cEuTPqU1vYoPxYBu9Wh9hx93eUobA==
X-Google-Smtp-Source: APXvYqz2jjMUco8euz7gowK7qLRiVo9UGuMteDf3ZTjbJn5vk1Z1jGwCr1q01S1xQ5A5Z4inG8v0or0IuJ+WdilBugo=
X-Received: by 2002:a2e:970a:: with SMTP id r10mr54631712lji.115.1564406034852;
 Mon, 29 Jul 2019 06:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <1560421833-27414-1-git-send-email-sumit.garg@linaro.org>
 <1560421833-27414-4-git-send-email-sumit.garg@linaro.org> <20190708153908.GA28253@jax>
 <CAFA6WYNzs=RErreWaa5BmF-P03Vf9nzQjvY_JpMckw87k9z12w@mail.gmail.com>
 <20190709070354.GA5791@jax> <CAFA6WYPHVXbsOjzGVT1WWziMRKmWns=3YkD6_j+C1OJxTUbDmw@mail.gmail.com>
 <CAHUa44GBt-8Z8ZniTraJYHgFVEUgMTjTJLEden3m2jhhY9qc-w@mail.gmail.com>
In-Reply-To: <CAHUa44GBt-8Z8ZniTraJYHgFVEUgMTjTJLEden3m2jhhY9qc-w@mail.gmail.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Mon, 29 Jul 2019 18:43:43 +0530
Message-ID: <CAFA6WYPNoFGiCft_QewGN55YFjNUjvfJxJ-p0VTG522JZtXGag@mail.gmail.com>
Subject: Re: [RFC 3/7] tee: add private login method for kernel clients
To:     Jens Wiklander <jens.wiklander@linaro.org>
Cc:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, dhowells@redhat.com,
        jejb@linux.ibm.com,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>, jmorris@namei.org,
        serge@hallyn.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, 29 Jul 2019 at 12:39, Jens Wiklander <jens.wiklander@linaro.org> wrote:
>
> Hi Sumit,
>
> On Tue, Jul 9, 2019 at 11:36 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > On Tue, 9 Jul 2019 at 12:33, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> > >
> > > On Tue, Jul 09, 2019 at 11:26:19AM +0530, Sumit Garg wrote:
> > > > Thanks Jens for your comments.
> > > >
> > > > On Mon, 8 Jul 2019 at 21:09, Jens Wiklander <jens.wiklander@linaro.org> wrote:
> > > > >
> > > > > Hi Sumit,
> > > > >
> > > > > On Thu, Jun 13, 2019 at 04:00:29PM +0530, Sumit Garg wrote:
> > > > > > There are use-cases where user-space shouldn't be allowed to communicate
> > > > > > directly with a TEE device which is dedicated to provide a specific
> > > > > > service for a kernel client. So add a private login method for kernel
> > > > > > clients and disallow user-space to open-session using this login method.
> > > > > >
> > > > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > > > ---
> > > > > >  drivers/tee/tee_core.c   | 6 ++++++
> > > > > >  include/uapi/linux/tee.h | 2 ++
> > > > > >  2 files changed, 8 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
> > > > > > index 0f16d9f..4581bd1 100644
> > > > > > --- a/drivers/tee/tee_core.c
> > > > > > +++ b/drivers/tee/tee_core.c
> > > > > > @@ -334,6 +334,12 @@ static int tee_ioctl_open_session(struct tee_context *ctx,
> > > > > >                       goto out;
> > > > > >       }
> > > > > >
> > > > > > +     if (arg.clnt_login == TEE_IOCTL_LOGIN_REE_KERNEL) {
> > > > > TEE_IOCTL_LOGIN_REE_KERNEL is defined as 0x80000000 which is in the
> > > > > range specified and implementation defined by the GP spec. I wonder if
> > > > > we shouldn't filter the entire implementation defined range instead of
> > > > > just this value.
> > > >
> > > > Agree. Will rather check for entire implementation defined range:
> > > > 0x80000000 - 0xFFFFFFFF.
> > > >
> >
> > I had a second thought on this. It would be more restrictive for
> > user-space TEE client library which may need to use implementation
> > defined login method. So either we could define specific ranges for
> > kernel and user-space or we can start with single login method
> > reserved for kernel.
>
> I think we should reserve a range for kernel internal use. Only
> reserving a single single login for kernel could force us to restrict
> the API once more later, better to take a chunk now and be done with
> it. Half of 0x80000000 - 0xFFFFFFFF is probably more than enough too
> to leave a range for user space too.
>

Ok then, will rather reserve this range for kernel.

> >
> > > > >
> > > > > > +             pr_err("login method not allowed for user-space client\n");
> > > > > pr_debug(), if it's needed at all.
> > > > >
> > > >
> > > > Ok will use pr_debug() instead.
> > > >
> > > > > > +             rc = -EPERM;
> > > > > > +             goto out;
> > > > > > +     }
> > > > > > +
> > > > > >       rc = ctx->teedev->desc->ops->open_session(ctx, &arg, params);
> > > > > >       if (rc)
> > > > > >               goto out;
> > > > > > diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
> > > > > > index 4b9eb06..f33c69c 100644
> > > > > > --- a/include/uapi/linux/tee.h
> > > > > > +++ b/include/uapi/linux/tee.h
> > > > > > @@ -172,6 +172,8 @@ struct tee_ioctl_buf_data {
> > > > > >  #define TEE_IOCTL_LOGIN_APPLICATION          4
> > > > > >  #define TEE_IOCTL_LOGIN_USER_APPLICATION     5
> > > > > >  #define TEE_IOCTL_LOGIN_GROUP_APPLICATION    6
> > > > > > +/* Private login method for REE kernel clients */
> > > > > It's worth noting that this is filtered by the TEE framework, compared
> > > > > to everything else which is treated opaquely.
> > > > >
> > > >
> > > > IIUC, you are referring to login filter in optee_os. Change to prevent
> > > > filter for this login method is part of this PR [1].
> > > >
> > > > [1] https://github.com/OP-TEE/optee_os/pull/3082
> > >
> > > No, I was referring to the changes in tee_ioctl_open_session() above.
> > > It's relevant for user space to know since it will be prevented from
> > > using that range of login identifiers.
> >
> > Ok, so you mean to extend the comment here for user-space to know that
> > this login method/range is filtered by the TEE framework. Will do
> > that.
> >
> > > This will restrict the user space
> > > API, but I think the risk of breakage is minimal as OP-TEE is the only
> > > in-tree driver registering in the TEE framework. I'm not aware of any
> > > out-of-tree drivers registering.
> >
> > I am not sure if I follow you here. How do you expect this change to
> > break out-of-tree TEE driver registration?
>
> It's a change in common code that put restrictions on the API.
>

Okay.

-Sumit

> Thanks,
> Jens
>
>
> >
> > -Sumit
> >
> > >
> > > Thanks,
> > > Jens
> > >
> > > >
> > > > -Sumit
> > > >
> > > > > > +#define TEE_IOCTL_LOGIN_REE_KERNEL           0x80000000
> > > > > >
> > > > > >  /**
> > > > > >   * struct tee_ioctl_param - parameter
> > > > > > --
> > > > > > 2.7.4
> > > > > >
> > > > >
> > > > > Thanks,
> > > > > Jens
