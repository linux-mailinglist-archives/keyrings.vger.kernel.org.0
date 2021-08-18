Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CD033F0DE9
	for <lists+keyrings@lfdr.de>; Thu, 19 Aug 2021 00:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234286AbhHRWLB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Aug 2021 18:11:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:47320 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234121AbhHRWLA (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 18 Aug 2021 18:11:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8A75161104;
        Wed, 18 Aug 2021 22:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629324625;
        bh=sDBzNw75J5/eNBK4sO+1Vj5AeZa+B85FYHSELHvSFEM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IK1M/XGJVpyZM5kqE4KeFWxMdfgiKj29X5qURIIv7L3TinJNhB15kvxeWQK3IaGFJ
         tkOKq1fZy7FAZDfoHmttdJefBjCjgEeAPnm3kpSb7BrGWcG5+Q5aQwObfDcZOdGIhK
         GWy/TOAdxPcQSV0dcU2BPwGMPhKJ13qh3xfaI1odeknxEee0HE7exRPkVEig7MErBR
         9b5+20Xi+ooOZ0VHHO/rYl5bdO912tx0z48zmUpFd8qQOrQ796BmTG87n9xpyKq4uZ
         FiTFbWo4f8/3TD9R7r2YrVzWRFMgPS/kEgVTgXeTM0peWAxBX4OESHJqZbJfYfh4Qy
         bXEuvQ1l3x3xw==
Received: by mail-oo1-f48.google.com with SMTP id z3-20020a4a98430000b029025f4693434bso1190453ooi.3;
        Wed, 18 Aug 2021 15:10:25 -0700 (PDT)
X-Gm-Message-State: AOAM533fL/HYZLjUtcIlvCWTgT3D2xu/HCP9W4MGrFTLpFUfIE/io/KZ
        CM3LA62Bba1kYIdnsisf0JtRnbzOnE2KCY3q8ts=
X-Google-Smtp-Source: ABdhPJzzUZjV4MsjdJJZIiDT6rz0w/bAI3aIZSbaTkLuLKA7taliPXb+EOhFIKnbc5VrFACMi2oN9yq66f+Cb4gCQ+0=
X-Received: by 2002:a4a:dfac:: with SMTP id k12mr8612844ook.41.1629324624922;
 Wed, 18 Aug 2021 15:10:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210818144617.110061-1-ardb@kernel.org> <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
 <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com> <24606605-71ae-f918-b71a-480be7d68e43@gmail.com>
In-Reply-To: <24606605-71ae-f918-b71a-480be7d68e43@gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Thu, 19 Aug 2021 00:10:13 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEO8PwLfT8uAYgeFF7T3TznWz4E=R1JArvCdKXk8qiAMQ@mail.gmail.com>
Message-ID: <CAMj1kXEO8PwLfT8uAYgeFF7T3TznWz4E=R1JArvCdKXk8qiAMQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
To:     Denis Kenzior <denkenz@gmail.com>
Cc:     Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers <ebiggers@kernel.org>,
        ronnie sahlberg <ronniesahlberg@gmail.com>,
        linux-cifs <linux-cifs@vger.kernel.org>,
        Steve French <sfrench@samba.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, 18 Aug 2021 at 18:23, Denis Kenzior <denkenz@gmail.com> wrote:
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

Fair enough.

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
>

Does that code rely on MD4 as well?
