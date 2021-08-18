Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56AC33F0D2A
	for <lists+keyrings@lfdr.de>; Wed, 18 Aug 2021 23:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233770AbhHRVMM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Aug 2021 17:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233378AbhHRVML (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Aug 2021 17:12:11 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A88C061764;
        Wed, 18 Aug 2021 14:11:36 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id dj8so5288299edb.2;
        Wed, 18 Aug 2021 14:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A2W9lInKV6uRnSkobCnKSB99ghVmraOhSdSTIq8Xdbk=;
        b=F4WF04tbLyf9NeCGnoPZhtLrEWV0wzI7qd/u+HDgpu01tyFj0rL5F0/SlfJ7PfRq/A
         G7JufzPCpgT8HYzuOu2rUCEsMtaMczx05qCnjQJUPknPM3eL6nsvTg5+kO3K1rnr4KQh
         xq+D67NDym577xacABbJ3l6jl4aTvUKd7IsvJ/Mqb7IVOYIO/hjcQ5Bs0d/eubXj7CGb
         NUdvbHHbznWNDlprJlEtx8DSb77lr4/uId7Fv3asjwcSI7ubtOn4NYHR9861W1EeBUkV
         f5jp0d2u8Eh/ypdp5nhVq9xkgIgmvgBeThtAr6Y38k3sXOKZUA4eln5sbcHcvvoZ2Gb5
         Fy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A2W9lInKV6uRnSkobCnKSB99ghVmraOhSdSTIq8Xdbk=;
        b=jgQZOk1PvHCENZ7oZ19OWjI2i65UA8xVF1Oc0SsqnNqN6LBPw2SFE82gdjNjOFkZN7
         dq98Rh2Xo2fzGpScQUN47z1bQYcHerpivByPuvPZrlI49ZEfo/1et+M7o+1qVc5TOmx7
         bi6QOmimLBIgDv/WuO0SU0OLaEX/vAl0r485KG9uRIfvBvVGphMnU4uRrJ/wIUUMCz8J
         xGqwkOF7X0e5UVDcLnSQxYNUMbWQgaqw1vLeOtKjL6pse8gUWsldC9SbXWsMjsdrg/LE
         JZrCGThPtuyxsPxUmWD41mWi8oWyG3/Z72bMKv6D/VrEbr4ax2a/06+9XDGxLQGxI5Bm
         TmDw==
X-Gm-Message-State: AOAM532VYm3Sc4szyS2+KxfNV7aSE+KsmCLnXoxewcxJkLu8HejHaIsZ
        e+ZhrGbZFEFXvpPYABPrurgtXRtYNoelbevImwE=
X-Google-Smtp-Source: ABdhPJwvvpg4070gISICllYt26s53jc5now9WHXtAfKFP/VrQ9mOLIDrGbKyAEARjoVX0DgdzM1lc+rIG6okYOO4Dfw=
X-Received: by 2002:a50:ef14:: with SMTP id m20mr12291104eds.209.1629321095024;
 Wed, 18 Aug 2021 14:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210818144617.110061-1-ardb@kernel.org> <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
 <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com> <24606605-71ae-f918-b71a-480be7d68e43@gmail.com>
In-Reply-To: <24606605-71ae-f918-b71a-480be7d68e43@gmail.com>
From:   ronnie sahlberg <ronniesahlberg@gmail.com>
Date:   Thu, 19 Aug 2021 07:11:23 +1000
Message-ID: <CAN05THSFpf+1BQ+yL9rjd=6_JWCxBMO8AyDMnhdVW9uVwBAMcg@mail.gmail.com>
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
To:     Denis Kenzior <denkenz@gmail.com>
Cc:     Ard Biesheuvel <ardb@kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers <ebiggers@kernel.org>,
        linux-cifs <linux-cifs@vger.kernel.org>,
        Steve French <sfrench@samba.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Aug 19, 2021 at 2:23 AM Denis Kenzior <denkenz@gmail.com> wrote:
>
> Hi Ard,
>
> >>   The previous ARC4 removal
> >> already caused some headaches [0].
> >
> > This is the first time this has been reported on an upstream kernel list.
> >
> > As you know, I went out of my way to ensure that this removal would
> > happen as smoothly as possible, which is why I contributed code to
> > both iwd and libell beforehand, and worked with distros to ensure that
> > the updated versions would land before the removal of ARC4 from the
> > kernel.
> >
> > It is unfortunate that one of the distros failed to take that into
> > account for the backport of a newer kernel to an older distro release,
> > but I don't think it is fair to blame that on the process.
>
> Please don't misunderstand, I don't blame you at all.  I was in favor of ARC4
> removal since the kernel AF_ALG implementation was broken and the ell
> implementation had to work around that.  And you went the extra mile to make
> sure the migration was smooth.  The reported bug is still a fairly minor
> inconvenience in the grand scheme of things.
>
> But, I'm not in favor of doing the same for MD4...
>
> >
> >>   Please note that iwd does use MD4 for MSCHAP
> >> and MSCHAPv2 based 802.1X authentication.
> >>
> >
> > Thanks for reporting that.
> >
> > So what is your timeline for retaining MD4 support in iwd? You are
> > aware that it has been broken since 1991, right? Please, consider
> > having a deprecation path, so we can at least agree on *some* point in
> > time (in 6 months, in 6 years, etc) where we can start culling this
> > junk.
> >
>
> That is not something that iwd has any control over though?  We have to support
> it for as long as there are  organizations using TTLS + MD5 or PEAPv0.  There
> are still surprisingly many today.

The same situation exist for cifs. The cifs client depends on md4 in
order to authenticate to Windows/Azure/Samba/... cifs servers.
And like you we have no control of the servers.

Our solution will likely be to fork the md4 code and put a private
copy in our module.
Maybe you need to do the same.

--
ronnie

>
> Regards,
> -Denis
