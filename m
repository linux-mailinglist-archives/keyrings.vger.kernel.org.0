Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C12B63F08BC
	for <lists+keyrings@lfdr.de>; Wed, 18 Aug 2021 18:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229531AbhHRQLd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Aug 2021 12:11:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:40298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229454AbhHRQLd (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 18 Aug 2021 12:11:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D5E86103A;
        Wed, 18 Aug 2021 16:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629303058;
        bh=6hd4iGGRYaw8mCPChpLy5dTqNktMmwKuY5LAOhFNPR0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=K8USbrDC2uta8S/2bfhGsNPrYSlkMBLgg385YsOnlH2jQ16Iwd3ZJTJsOs1eDfi1R
         sbI5PnIj4RUdL9RMBnrDjF8RT6hLMvf+Ztm/7+yW8uLHdp/tJtTYVkp7cs/sByJY6I
         MwCpLqYqUK8C16ZqyvpipV2PTIJfFwSAtxBvsfh6zH6K/EhYdhPevVJmOAPhO7ByZS
         5q5e2Y5uZ0t05dXq/UZ3R/2pEecyE7vmxaZdCdlLbDyNPZOqfdTl8q1KIiC9bNBxg0
         fbu7U7xgHZEZGYvOUllWHhrI4wRe5ZOgUrVcp5f9pP06DwvN5ADdLgwwIyJdS02m0p
         99JZc/3hClpjA==
Received: by mail-ot1-f51.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so4699440otk.9;
        Wed, 18 Aug 2021 09:10:58 -0700 (PDT)
X-Gm-Message-State: AOAM533v5bFYXMiYUfrP12gLnkYSjVZgjYGa1UIRv19F6WkG1HjYX2w0
        zAvkbGGnyG8bchBjSnTjOYsRYGgPKRhFWwK5FpE=
X-Google-Smtp-Source: ABdhPJxpYNAi+bMYoGyWE5Wt/YqANjrwzjUO2vZVVr2l4FvSoGnQLAhoBlAGh9BS1NpFSVzDXSe6EG83bFfx2cJ8sc0=
X-Received: by 2002:a05:6830:47:: with SMTP id d7mr7525291otp.108.1629303058007;
 Wed, 18 Aug 2021 09:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210818144617.110061-1-ardb@kernel.org> <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
In-Reply-To: <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 18 Aug 2021 18:10:46 +0200
X-Gmail-Original-Message-ID: <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com>
Message-ID: <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com>
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

On Wed, 18 Aug 2021 at 16:51, Denis Kenzior <denkenz@gmail.com> wrote:
>
> Hi Ard,
>
> On 8/18/21 9:46 AM, Ard Biesheuvel wrote:
> > As discussed on the list [0], MD4 is still being relied upon by the CIFS
> > driver, even though successful attacks on MD4 are as old as Linux
> > itself.
> >
> > So let's move the code into the CIFS driver, and remove it from the
> > crypto API so that it is no longer exposed to other subsystems or to
> > user space via AF_ALG.
> >
>
> Can we please stop removing algorithms from AF_ALG?

I don't think we can, to be honest. We need to have a deprecation path
for obsolete and insecure algorithms: the alternative is to keep
supporting a long tail of broken crypto indefinitely.

>  The previous ARC4 removal
> already caused some headaches [0].

This is the first time this has been reported on an upstream kernel list.

As you know, I went out of my way to ensure that this removal would
happen as smoothly as possible, which is why I contributed code to
both iwd and libell beforehand, and worked with distros to ensure that
the updated versions would land before the removal of ARC4 from the
kernel.

It is unfortunate that one of the distros failed to take that into
account for the backport of a newer kernel to an older distro release,
but I don't think it is fair to blame that on the process.

>  Please note that iwd does use MD4 for MSCHAP
> and MSCHAPv2 based 802.1X authentication.
>

Thanks for reporting that.

So what is your timeline for retaining MD4 support in iwd? You are
aware that it has been broken since 1991, right? Please, consider
having a deprecation path, so we can at least agree on *some* point in
time (in 6 months, in 6 years, etc) where we can start culling this
junk.
