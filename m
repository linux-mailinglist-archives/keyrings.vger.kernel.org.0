Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF1E528DBD7
	for <lists+keyrings@lfdr.de>; Wed, 14 Oct 2020 10:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729820AbgJNIol (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 14 Oct 2020 04:44:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729850AbgJNIoi (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 14 Oct 2020 04:44:38 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CB58C041E7B
        for <keyrings@vger.kernel.org>; Tue, 13 Oct 2020 22:06:35 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a5so1750123ljj.11
        for <keyrings@vger.kernel.org>; Tue, 13 Oct 2020 22:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a/Z5uBz1DpZTFhc75fGuuiaoswUlc0+pdF1qtatUqts=;
        b=GHPv+yjhdSZ8/ZHd+8mjDk2rnbggNqf3NuYe4n2TNyCw5yWmeDzOycaHI3O5h1rCfN
         d6RoxfZweefrAsnec1X2O1V6ZLesFRr4UYaW9w8p7XxlRfr32TL2GqapdrD0Cu7Q07rJ
         OTytH4XLz+fOiI2yis722+O9uWWgEBhf853GPb5RNhUvGly37yG4pN0YpOnpb23YpQXj
         nz2JsPh5AOxtaO8ywoBQeXitujBkmx1En+7y81TSB7mEmSCVARP7UjUsKuglCeST9E4u
         HuCy5T34GcWsK/31yTPx/hDWFWULhY9ZjoswHLREYk6i+MMFbyZk+qUDd3JvY2utG9MP
         ZZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a/Z5uBz1DpZTFhc75fGuuiaoswUlc0+pdF1qtatUqts=;
        b=SFG5b0ZwUQF+Aj+dB9QOlLIavjmqpUQ/CFyMt9WsCnZWY9C86LgMuCR0Omu7K95P1Q
         ApTUvdzrgnYAjw6VJmDG4B0QZVLSRNl+bwVg1sBvEjC0atH5qHuEQIO66feWveASCjN0
         w5BrqwqpbU5ZSvHo/GxkvRYFVJ8jZEXL5+AqOLq3KiT6Ubjvfm3gqRH4mUS72Sz712EM
         zm1Al347GRVChPzSVOacyukorOFWQ8x8lsD/q+Bf2ibDNdk4rv7sEx3xdlpzTdZHxOXT
         DGNQzhhcJRipjinfxRKldWLAKNX7XIPrkzMLjcB9cWlunwvJhNPDEfwPdYe3QTdG+5Qh
         YwjQ==
X-Gm-Message-State: AOAM531QZ1jg2fXa0CqmL/kWc7FIpiy5jFnMpiNh4bXt4OMOJ3NwM9I3
        UIMTTz46MJoxsDwdUYxf9T8p6bEe4IzJl4ikycOS9Q==
X-Google-Smtp-Source: ABdhPJxpzomwQ/mAxnTCtpWCIYf8XDKOOWEFXfHJY5lnuYu0+MMHD0Q9w0B4zJ84z5v+btni8Pb+tzMjimNbMVifir4=
X-Received: by 2002:a2e:808a:: with SMTP id i10mr978406ljg.427.1602651993883;
 Tue, 13 Oct 2020 22:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <1602065268-26017-1-git-send-email-sumit.garg@linaro.org>
 <1602065268-26017-5-git-send-email-sumit.garg@linaro.org> <20201013022157.GA47751@linux.intel.com>
 <CAFA6WYO6zNKtxhpNpTpqAjZnMPrEygs1k7Gwg3hwJV8Ynrr=qQ@mail.gmail.com> <20201013134048.GA147135@kernel.org>
In-Reply-To: <20201013134048.GA147135@kernel.org>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Wed, 14 Oct 2020 10:36:21 +0530
Message-ID: <CAFA6WYOqknmYcoxPQKOk2rW+gJZ_8fQXZBMcicT9f562C0o-GA@mail.gmail.com>
Subject: Re: [PATCH v7 4/4] MAINTAINERS: Add entry for TEE based Trusted Keys
To:     Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Mimi Zohar <zohar@linux.ibm.com>,
        James Bottomley <jejb@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Janne Karhunen <janne.karhunen@gmail.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Markus Wamser <Markus.Wamser@mixed-mode.de>,
        Luke Hinds <lhinds@redhat.com>,
        "open list:ASYMMETRIC KEYS" <keyrings@vger.kernel.org>,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        op-tee@lists.trustedfirmware.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, 13 Oct 2020 at 19:10, Jarkko Sakkinen <jarkko@kernel.org> wrote:
>
> On Tue, Oct 13, 2020 at 04:58:47PM +0530, Sumit Garg wrote:
> > On Tue, 13 Oct 2020 at 07:52, Jarkko Sakkinen
> > <jarkko.sakkinen@linux.intel.com> wrote:
> > >
> > > On Wed, Oct 07, 2020 at 03:37:48PM +0530, Sumit Garg wrote:
> > > > Add MAINTAINERS entry for TEE based Trusted Keys framework.
> > > >
> > > > Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> > > > Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > > > ---
> > > >  MAINTAINERS | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 48aff80..eb3d889 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -9663,6 +9663,14 @@ F:     include/keys/trusted-type.h
> > > >  F:   include/keys/trusted_tpm.h
> > > >  F:   security/keys/trusted-keys/
> > > >
> > > > +KEYS-TRUSTED-TEE
> > > > +M:   Sumit Garg <sumit.garg@linaro.org>
> > > > +L:   linux-integrity@vger.kernel.org
> > > > +L:   keyrings@vger.kernel.org
> > > > +S:   Supported
> > > > +F:   include/keys/trusted_tee.h
> > > > +F:   security/keys/trusted-keys/trusted_tee.c
> > > > +
> > > >  KEYS/KEYRINGS
> > > >  M:   David Howells <dhowells@redhat.com>
> > > >  M:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
> > > > --
> > > > 2.7.4
> > >
> > > I'm sorry but I think I have changed my mind on this. This has been
> > > spinning for a while and sometimes conclusions change over the time.
> > >
> > > I don't think that we really need a separate subsystem tag.
> >
> > I don't see it as a separate subsystem but rather a kind of underlying
> > trust source (TEE) driver plugged into existing trusted keys
> > subsystem. We could relate it to the RNG subsystem as well where there
> > is a subsystem maintainer and specific driver maintainers.
> >
> > IMO, having a dedicated entry like this brings clarity in maintenance
> > and in future we may have more trust sources like this added where
> > everyone may not have access to all the trust sources to test.
>
> More entries pointing to the exact same stuff does not necessarily mean
> clarity in my books.
>
> > > I'd be for a
> > > new M-entry or R-entry to the existing subsystem tag. It's essential to
> > > have ack from someone with ARM and TEE knowledge but this way too heavy
> > > for the purpose.
> >
> > If you still think otherwise then I am fine with a new M-entry for
> > existing trusted keys subsystem as well.
>
> Adding a M-entry does makes sense because trusted keys backends can be
> based on various technologies and standard. It's a different in that
> sense than lets say a TPM hardware driver.
>
> > > I also see it the most manageable if the trusted keys PR's come from a
> > > single source.
> >
> > I echo here with you to have a single source for trusted keys PR's
> > irrespective of whether we go with a separate trust source entry or
> > update existing subsystem entry.
> >
> > -Sumit
>
> And I echo that oviously if there is someone to say the final ack about
> TEE, I will require that as the minimum to ever pick any of those
> changes :-)
>
> I would resolve this with just the M-entry, and we can *later on*
> restructure, if there is a need for that. These things are not sealed
> to stone.

Okay, will add a M-entry for existing trusted keys subsystem.

-Sumit

>
> /Jarkko
