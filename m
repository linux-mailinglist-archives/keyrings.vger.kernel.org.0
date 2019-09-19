Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FC61B8148
	for <lists+keyrings@lfdr.de>; Thu, 19 Sep 2019 21:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391258AbfISTRz (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 19 Sep 2019 15:17:55 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:35333 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726007AbfISTRz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 19 Sep 2019 15:17:55 -0400
Received: by mail-oi1-f195.google.com with SMTP id x3so3754114oig.2;
        Thu, 19 Sep 2019 12:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H6BJOmv9mwU0jDfpBuEldueQX7Oih/N8OAfb6huNx3M=;
        b=aO7nrh51770IxKBYE2kKd/oRTFlWCBvWaxKq0X4FEWR9r4s4femeZFbCAYvxW9H9MN
         ECu4LezVJTXa/Mt3t+TB9atTMM5xRdBInlm1xecy/VNN+HVg4A1manmZVYCF9YbDtXh/
         Y5+OUsEVm2tOR5lzemoW/yZwFeTk+lGoMwrkRLIqFwdvGWxCElbeYbr4qDuHOeVET0DI
         WyBTu9FULlrTwy8qxazZcVlRgd8CGg4pOhSqIMb/vxcanal7pCewQdrhoHybgRfA/kji
         P1xVeLJe/KUhb482MQvva18SBxuvsKtlaxQFdfCbD4zghepN+u8n7UjqVHnxx+qOwyVo
         yJwA==
X-Gm-Message-State: APjAAAXPUaPXxSNTtr/fcgQ+IeAf5uYndUAftbI1T1oW+4UyvIaJoYmD
        mtZLmCCSdVVO+FPDQkJ8bo8Kh6fS97PqnVZWyxmwoCn8
X-Google-Smtp-Source: APXvYqyJwbI7TK/lwGfs0PyO6kra4dA0eibuTqMtyGibUndyW1qzEZhl7cZabjKsqLzEL8SjfHavxchcnEWctH003+U=
X-Received: by 2002:aca:3908:: with SMTP id g8mr3696448oia.54.1568920674487;
 Thu, 19 Sep 2019 12:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <278d9706-162d-28a4-4640-31b697924473@physik.fu-berlin.de>
 <c5acb1c0-7a5b-ce42-8b2f-5fd30cbdab6e@physik.fu-berlin.de>
 <6304acd1-7b71-b1fb-f8d8-298cb3025e69@physik.fu-berlin.de>
 <6725b972-05d4-fed4-7094-16401e86b452@gmail.com> <578d8a91-aaee-087f-1742-65e64001b8fa@physik.fu-berlin.de>
 <CAMuHMdUU6ejc168-ksqXrkE+PjCXFJumaRaWjRtj12NjG_TFSg@mail.gmail.com>
 <CAMuHMdWfTrx8VuJoifEEBc1n+3MiiuwKNWcRnUw+TgWJCtOWag@mail.gmail.com>
 <fea74ca3-4b24-780f-af74-a786646b1668@physik.fu-berlin.de>
 <CAMuHMdVeedJZE6mrGdYqRgawUtfu_ww5p-Qg1rLXNmGWiY7Nxg@mail.gmail.com>
 <CAMuHMdVHZ9srJcK+PY=YoP55z1NSjBAtkSr2ROA8i84C75v0zQ@mail.gmail.com>
 <16476.1568822057@warthog.procyon.org.uk> <CAMuHMdU_2RWFc=xs3tM38Nt_44k3dp5MMuKAT2MacyuCbO+1Hw@mail.gmail.com>
 <13304.1568825025@warthog.procyon.org.uk>
In-Reply-To: <13304.1568825025@warthog.procyon.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 Sep 2019 21:17:43 +0200
Message-ID: <CAMuHMdX=CdsMVBh4sGt+KcZTgqGRCU9Tua37L2zLvpfATorXHw@mail.gmail.com>
Subject: Re: Can KEY_DH_OPERATIONS become tristate? (was: Re: Kernel 5.3.0
 stuck during boot on Amiga)
To:     David Howells <dhowells@redhat.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        linux-security-module@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi David,

On Wed, Sep 18, 2019 at 6:43 PM David Howells <dhowells@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > TL;DR: CONFIG_CRYPTO_DH=y is reported to cause boot delays of several
> > > > minutes on old and slow machines.
> > >
> > > Why is it doing that?  It doesn't do anything unless it is called, so
> > > something must be calling it.
> >
> > I don't know.  Enabling initcall_debug shows that dh_init() takes a very long
> > time.
>
> Ah...  The bit that handles keyctl_dh_compute() doesn't do anything unless
> asked, but the bit in the crypto layer that does dh does (ie. dh_init()).  I
> guess it's doing some sort of self-test, but I can't see how it effects that.
> I think you need to consult the author/maintainer of crypto/dh.c.

Apparently the Debian kernel config had not enabled
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS, so all crypto tests
were run at boot time :-(

> It might be possible to make CONFIG_KEY_DH_OPERATIONS not depend on
> CONFIG_CRYPTO_DH and have crypto_alloc_kpp() load the *crypto* part on
> demand.  Failing that, I can look into demand-loading keyctl operations.

Regardless, it may be a good idea to make KEY_DH_OPERATIONS tristate
one day, so enabling wireless as a module doesn't force CONFIG_CRYPTO_DH
builtin.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
