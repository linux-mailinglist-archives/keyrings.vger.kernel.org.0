Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA28487843
	for <lists+keyrings@lfdr.de>; Fri,  7 Jan 2022 14:32:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347605AbiAGNcu (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 7 Jan 2022 08:32:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347595AbiAGNcs (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 7 Jan 2022 08:32:48 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E524C06173F
        for <keyrings@vger.kernel.org>; Fri,  7 Jan 2022 05:32:48 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id h7so15609965lfu.4
        for <keyrings@vger.kernel.org>; Fri, 07 Jan 2022 05:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JgcMCFnFrjIsgT43dvK+WgNIyiihonsed1brH+P2D0k=;
        b=mEI7jqVRKmy03URhYvc0p0L+hMdoyra2ECiMxTX/3RiaDiocOY7DRfkPjtsujwlnRA
         laRjCnDCwK1qDTmyq6nNoCGz/yZaOaG5QOOZ7VrOR6faHbLme9aN91yjiYkTsxZGCqU3
         4k5JSMZSJR57XTEqf8OzeKujv82JetVewZdxM0ZWhDs0Uu3Mus1YR9ktbtd3z1W4igwg
         OLGe3tg7o1vPb7rlUBBVQrtDmp/IS0eKKJCE+f5kkuYxTO37DUxVe6dAPFCXOkzcRuw8
         yPotRtz0eEHRMTZiAJj0ytaS83kDIA9AIa6gNyk7qghA/JfTXAbHr2vpmRIwSr06EFqz
         SAVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JgcMCFnFrjIsgT43dvK+WgNIyiihonsed1brH+P2D0k=;
        b=myY+G5xKb5VYQZnIPuKqyVmRIjW23wUoj3cDsfIyvMPKg2ssYwCD+VYRtYRvgk+mxw
         G4b5MiTNnD0w1/3rct9kedphVGT5sS9yLCAOF19V+5skgX+8jK30BpEa+6ZfMTp8iwLA
         Ia9W3gCNgQ9e+Al7PUrYrASz6nFQMlfa80q0DfqA5Dxo/BGP0sNvoX+11nJN5+OUcWLc
         fyIkK9c9DwE3PHTTxMF3FmbA0WBtyr6VgVLAaS3CEmP9xMvC04nM4LvYNiVb/lVN/jxs
         8gcBNJlUlb+qakpBDJOH1jsPXkrjv3YugeKTTkN78iWsLM4sV8ilyhpTm5tqYezQ8Usp
         5E9g==
X-Gm-Message-State: AOAM530z5OKAVxU1VKrr7OQx1HMz9LByPkF9PfhkY/x0n7vINAmWS8Y5
        URL1foecGuaTrvmhl++A+W04w6Mak8KKKsHrFqx5Lg==
X-Google-Smtp-Source: ABdhPJxZHR0aginZgeaaYSzSUhy2Fw0PNKIoeJ95+NIIxDoKc7NxCixL2nW6SsH00NmHlbpTh1DCtZe284yoZsAR7KU=
X-Received: by 2002:a2e:bf01:: with SMTP id c1mr18783547ljr.511.1641562366348;
 Fri, 07 Jan 2022 05:32:46 -0800 (PST)
MIME-Version: 1.0
References: <20211229215330.4134835-1-yaelt@google.com> <CAFA6WYPuPHgcnzt6j+Q-EA2Dos6vBDukrjpheo5srLVXFrifEg@mail.gmail.com>
 <5a38824152eeee0fc9ba0a4fd2308bb6e0970059.camel@linux.ibm.com>
 <CAFA6WYOJt3=YMTt_QQSq6Z-MK42hwWspgSpasw2fuPtVFcP3uA@mail.gmail.com>
 <CAKoutNvW1c7MkTaFwyrD7MjUVXvTtcBOGFULMittJ5vzjMN0mg@mail.gmail.com>
 <CAFA6WYPQRagZF8-grn_LC8_SAaxBzh=cSgHhFAQQOYK+L2KuBQ@mail.gmail.com> <CAKoutNtuY0+L29d6xzn6BgEKBytFsBHZ_kgkCOJZuicb_uNPHg@mail.gmail.com>
In-Reply-To: <CAKoutNtuY0+L29d6xzn6BgEKBytFsBHZ_kgkCOJZuicb_uNPHg@mail.gmail.com>
From:   Sumit Garg <sumit.garg@linaro.org>
Date:   Fri, 7 Jan 2022 19:02:33 +0530
Message-ID: <CAFA6WYPxogLMk1EDqvM_mwgCmU1s_yDwYFPjq6wurnQGhG=-_w@mail.gmail.com>
Subject: Re: [PATCH v4] KEYS: encrypted: Instantiate key with user-provided
 decrypted data
To:     Yael Tiomkin <yaelt@google.com>
Cc:     Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org,
        jejb@linux.ibm.com, Jarkko Sakkinen <jarkko@kernel.org>,
        corbet@lwn.net, dhowells@redhat.com, jmorris@namei.org,
        serge@hallyn.com, keyrings@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module <linux-security-module@vger.kernel.org>,
        =?UTF-8?Q?Jan_L=C3=BCbbe?= <jlu@pengutronix.de>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, 7 Jan 2022 at 18:23, Yael Tiomkin <yaelt@google.com> wrote:
>
> Hi Sumit,
>
> On Fri, Jan 7, 2022 at 12:15 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> >
> > Hi Yael,
> >
> > On Thu, 6 Jan 2022 at 01:48, Yael Tiomkin <yaelt@google.com> wrote:
> > >
> > > Hi Sumit,
> > >
> > > On Mon, Jan 3, 2022 at 1:51 AM Sumit Garg <sumit.garg@linaro.org> wrote:
> > > >
> > > > Hi Mimi,
> > > >
> > > > Apologies for the delayed reply as I was on leave for a long new year weekend.
> > > >
> > > > On Thu, 30 Dec 2021 at 18:59, Mimi Zohar <zohar@linux.ibm.com> wrote:
> > > > >
> > > > > Hi Sumit,
> > > > >
> > > > > On Thu, 2021-12-30 at 15:37 +0530, Sumit Garg wrote:
> > > > > > + Jan, Ahmad
> > > > > >
> > > > > > On Thu, 30 Dec 2021 at 03:24, Yael Tiomkin <yaelt@google.com> wrote:
> > > > > > >
> > > > > > > The encrypted.c class supports instantiation of encrypted keys with
> > > > > > > either an already-encrypted key material, or by generating new key
> > > > > > > material based on random numbers. This patch defines a new datablob
> > > > > > > format: [<format>] <master-key name> <decrypted data length>
> > > > > > > <decrypted data> that allows to instantiate encrypted keys using
> > > > > > > user-provided decrypted data, and therefore allows to perform key
> > > > > > > encryption from userspace. The decrypted key material will be
> > > > > > > inaccessible from userspace.
> > > > > >
> > > > > > This type of user-space key import feature has already been discussed
> > > > > > at large in the context of trusted keys here [1]. So what makes it
> > > > > > special in case of encrypted keys such that it isn't a "UNSAFE_IMPORT"
> > > > > > or "DEBUGGING_IMPORT" or "DEVELOPMENT_IMPORT", ...?
> > > > > >
> > > > > > [1] https://lore.kernel.org/linux-integrity/74830d4f-5a76-8ba8-aad0-0d79f7c01af9@pengutronix.de/
> > > > > >
> > > > > > -Sumit
> > > > > >
> > > > > > >
> > > > > > > Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> > > > > > > Signed-off-by: Yael Tiomkin <yaelt@google.com>
> > > > >
> > > > > There is a difference between trusted and encrypted keys.
> > > >
> > > > Yeah I understand the implementation differences.
> > > >
> > > > >  So in
> > > > > addition to pointing to the rather long discussion thread, please
> > > > > summarize the conclusion and, assuming you agree, include why in once
> > > > > case it was acceptable and in the other it wasn't to provide userspace
> > > > > key data.
> > > >
> > > > My major concern with importing user-space key data in *plain* format
> > > > is that if import is *not* done in a safe (manufacturing or
> > > > production) environment then the plain key data is susceptible to
> > > > user-space compromises when the device is in the field.
> > >
> > > I agree this can happen. Key distribution in any scenario needs to be
> > > secure and this could also potentially be an issue if the key is first
> > > encrypted and then imported.
> >
> > Currently its not the case with encrypted keys. These are random keys
> > generated within the kernel and encrypted with master key within the
> > kernel and then exposed to user-space as encrypted blob only.
>
>
> There are two different ways to create encrypted keys. One is to have
> them generated within the kernel using random numbers, and the other
> is by importing them in their encrypted form from user-space.
> I was referring to the latter in my previous statement.
>

So, from a key distribution security point of view, encrypted key
user-space import is **not equal to** plain key user-space import.
That's why we need to have a separate compile time option as every
device may come with its own threat model and may choose to enable or
disable this user-space plain key import feature.

-Sumit

> >
> > > We can make sure the documentation
> > > highlights the safety requirement.
> > >
> >
> > IMO, you should enable this feature as a compile time option. The help
> > text for that config option should highlight the use-case along with a
> > safety warning.
> >
> > -Sumit
> >
> > > >
> > > > And it sounds like we are diverting from basic definition [1] of encrypted keys:
> > > >
> > > > "Trusted and Encrypted Keys are two new key types added to the
> > > > existing kernel key ring service. Both of these new types are variable
> > > > length symmetric keys, and in both cases all keys are created in the
> > > > kernel, and **user space sees, stores, and loads** only encrypted
> > > > blobs."
> > > >
> > > > Also, as Jarrko mentioned earlier the use-case is still not clear to
> > > > me as well. Isn't user logon keys an alternative option for
> > > > non-readable user-space keys?
> > >
> > > The goal in this change is to allow key encryption from userspace,
> > > using user-provided decrypted data. This cannot be achieved in logon
> > > keys, which as you mentioned, are simply non-readable user type keys.
> > >
> > >
> > > >
> > > > [1] https://www.kernel.org/doc/html/v4.13/security/keys/trusted-encrypted.html
> > > >
> > > > -Sumit
> > > >
> > > > >
> > > > > thanks,
> > > > >
> > > > > Mimi
> > > > >
> > >
> > > Yael
