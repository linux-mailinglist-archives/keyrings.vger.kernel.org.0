Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10711B67E6
	for <lists+keyrings@lfdr.de>; Wed, 18 Sep 2019 18:19:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729523AbfIRQTC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 18 Sep 2019 12:19:02 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36075 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726558AbfIRQTC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 18 Sep 2019 12:19:02 -0400
Received: by mail-ot1-f68.google.com with SMTP id 67so386522oto.3;
        Wed, 18 Sep 2019 09:19:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ciT4MhcXAvfq4i7XiTa1B8OfzLIYbv4sUsNQGTpETZM=;
        b=C2DM2GqI0n/TkqiDHNdCqvgNF3cUwEmD4dtdXDAjCGbmlL6kDC58IJxgWr78XQtvN8
         eZqHTVYIxw5zsBlaPEcO4F4V33ak0/XnxeWAY/+F47ZhdnHLSSwsDWDYbfkzjR7E+Q9V
         BnfTvvap+S6ieZl7SNzmveK1vT/WoA3yBTnyRAz3ya9G/rqLd1cS1TD2HaZtgHuopfL5
         4XuTUmWWFGE7KdNTxGpjvFdUPM5J8XheB3Npn55rleJdQt4zOpq4lFigOHMEu/HzZbJn
         e8tUmlZI4adwwnrY+G2hPCGUi6QB19XQadYcZk2/y6xv6ez448Qrg67KLT3phnWQMXyz
         mbag==
X-Gm-Message-State: APjAAAU/7BGBk/cX7P7Vuqpc4GiM5wP10cungYBAKDFThCWfFBcGoNXz
        Q4By8TlTukExxE+kpl5BMtG+l0U4c1fbaqn1SV6Fkg==
X-Google-Smtp-Source: APXvYqzWS5uh8zh7cquVyfq2RdGs36uE0xlRca7Ru+rbwDmoYYtXdC0n9VjTuPht7m3D8zBtdAIM5p944HIUvSYHY1M=
X-Received: by 2002:a05:6830:1196:: with SMTP id u22mr3634441otq.39.1568823539833;
 Wed, 18 Sep 2019 09:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <278d9706-162d-28a4-4640-31b697924473@physik.fu-berlin.de>
 <c5acb1c0-7a5b-ce42-8b2f-5fd30cbdab6e@physik.fu-berlin.de>
 <6304acd1-7b71-b1fb-f8d8-298cb3025e69@physik.fu-berlin.de>
 <6725b972-05d4-fed4-7094-16401e86b452@gmail.com> <578d8a91-aaee-087f-1742-65e64001b8fa@physik.fu-berlin.de>
 <CAMuHMdUU6ejc168-ksqXrkE+PjCXFJumaRaWjRtj12NjG_TFSg@mail.gmail.com>
 <CAMuHMdWfTrx8VuJoifEEBc1n+3MiiuwKNWcRnUw+TgWJCtOWag@mail.gmail.com>
 <fea74ca3-4b24-780f-af74-a786646b1668@physik.fu-berlin.de>
 <CAMuHMdVeedJZE6mrGdYqRgawUtfu_ww5p-Qg1rLXNmGWiY7Nxg@mail.gmail.com>
 <CAMuHMdVHZ9srJcK+PY=YoP55z1NSjBAtkSr2ROA8i84C75v0zQ@mail.gmail.com> <16476.1568822057@warthog.procyon.org.uk>
In-Reply-To: <16476.1568822057@warthog.procyon.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 18 Sep 2019 18:18:47 +0200
Message-ID: <CAMuHMdU_2RWFc=xs3tM38Nt_44k3dp5MMuKAT2MacyuCbO+1Hw@mail.gmail.com>
Subject: Re: Can KEY_DH_OPERATIONS become tristate? (was: Re: Kernel 5.3.0
 stuck during boot on Amiga)
To:     David Howells <dhowells@redhat.com>
Cc:     John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Michael Schmitz <schmitzmic@gmail.com>,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi David,

On Wed, Sep 18, 2019 at 5:54 PM David Howells <dhowells@redhat.com> wrote:
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > CC crypto keys people
> >
> > TL;DR: CONFIG_CRYPTO_DH=y is reported to cause boot delays of several
> > minutes on old and slow machines.
>
> Why is it doing that?  It doesn't do anything unless it is called, so
> something must be calling it.

I don't know.  Enabling initcall_debug shows that dh_init() takes a very long
time.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
