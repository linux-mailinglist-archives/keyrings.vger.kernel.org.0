Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D0F1EB790
	for <lists+keyrings@lfdr.de>; Tue,  2 Jun 2020 10:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbgFBIkx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 2 Jun 2020 04:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726589AbgFBIkw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 2 Jun 2020 04:40:52 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7309DC03E97D
        for <keyrings@vger.kernel.org>; Tue,  2 Jun 2020 01:40:50 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id 9so10085597ljc.8
        for <keyrings@vger.kernel.org>; Tue, 02 Jun 2020 01:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ba7tS1EJd6J4rrFJlCgFQCMg5mXZk8lm0TUhKeqkFLg=;
        b=DaRRRUXPe+h4lT7HKYjlwOZPLtpKjj5wrJfc7A/FfABHr7pqA6sBVcDxFpYhyNGX2f
         mhQciVg9mJcl5lbwYvIUHYTLOz+H/JseFNTfhgEH1PUTCmGJfi2vmR2tmRbnXSyFTDE4
         w4eCcHJwLE+Jelj9ifdDTlnu0lIKZx10kGWKP+LOH+aLlwER7WRXA5g20mnYOxnaNwWm
         3M56FsBpyAAfxXgbKJti+9pbhLY8t86m4/VdbDv6kUVoyahF+iMYkTHJDo4u8M+83rUy
         MafhdMblZid34Foa6n+p2WuWVyEuwMjkPZdBGHlFOS0Ezjf8cSGe7D1etislzBDLC4++
         g6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ba7tS1EJd6J4rrFJlCgFQCMg5mXZk8lm0TUhKeqkFLg=;
        b=MGwvDG+6Y57q/DjDXgSYIGf6vxlgJJ3r/KlNKH/ZAfrBkAAVvVqd2PiG2ssmqOWCQ9
         kTz8kWf6PIXD1DnhGx4f2PjHC18BeizzHKAGkOufCZHZM96Mvx8T5+3ttVQ1E9IKU2lb
         h5JOj67I8yFRUGWekhdF/N59/iTrsSEx5xrmNRb0wHcatIl4kJRsN485OOyfDaKxsZYn
         27POC6ND8bT/u0kq0maNAaslNG10/IVFMFAyUmEUb2g/CdFKvFGTfxJ6auIkxw3VF6yF
         CvdHl3SvG2MNYUDnm02UoQG3Nta+JNqBfmHjn6Aaca1WGFBfIYf8QRM5/VgBH6MBQBLD
         q2Wg==
X-Gm-Message-State: AOAM533voHG4iiZVyDu66qeHOarh0HasTnLMHZvMiC7MFncOgZl1rV/5
        KCe3j6mvvgyYIc32Cz/T7Oxq0wQ70nrU9wT/90AN7w==
X-Google-Smtp-Source: ABdhPJxsrkSYKmMolrGDzGBzVUCmpV4Czal5MWGq3rA63F0c5cGNbbd8XSdXd5KOBCD+j1AK6KQkyAzoPLSK90Osl+U=
X-Received: by 2002:a2e:81c5:: with SMTP id s5mr11803430ljg.372.1591087248899;
 Tue, 02 Jun 2020 01:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <1588758017-30426-1-git-send-email-sumit.garg@linaro.org>
 <1588758017-30426-2-git-send-email-sumit.garg@linaro.org> <20200601021132.GA796225@linux.intel.com>
 <CAFA6WYP55W2xKtjHWWwu6Pbqy2TGY=eymwAoXxQh-5mF8deR6A@mail.gmail.com> <20200602071407.GB16602@linux.intel.com>
In-Reply-To: <20200602071407.GB16602@linux.intel.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Tue, 2 Jun 2020 14:10:37 +0530
Message-ID: <CAFA6WYOVho3sAO=ABaeO3CGw-DfWuGOE9H_D48pCwAq0+VX9Qw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] KEYS: trusted: Add generic trusted keys framework
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     Mimi Zohar <zohar@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>, dhowells@redhat.com,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Janne Karhunen <janne.karhunen@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Markus Wamser <Markus.Wamser@mixed-mode.de>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        op-tee@lists.trustedfirmware.org,
        "tee-dev @ lists . linaro . org" <tee-dev@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 2 Jun 2020 at 12:44, Jarkko Sakkinen
<jarkko.sakkinen@linux.intel.com> wrote:
>
> On Mon, Jun 01, 2020 at 02:41:55PM +0530, Sumit Garg wrote:
> > > This, I think is wrong. You should have a compile time flag for TPM e.g.
> > > CONFIG_TRUSTED_TPM, not this dynamic mess.
> > >
> >
> > The whole idea to have it dynamic was to have a common trusted keys
> > module which could support both TPM and TEE implementation depending
> > on hardware. I guess it may be useful in scenarios where a particular
> > hardware supports a TPM chip while other doesn't but both need to run
> > a common kernel image.
>
> For now it should only scale to what is needed. No problems refining
> it later when there is something to enable.
>

Fair enough, will switch to compile time mode then.

-Sumit

> /Jarkko
