Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5429ED0CD
	for <lists+keyrings@lfdr.de>; Sat,  2 Nov 2019 23:09:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727003AbfKBWJ3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 2 Nov 2019 18:09:29 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:38344 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726762AbfKBWJ3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 2 Nov 2019 18:09:29 -0400
Received: by mail-lf1-f66.google.com with SMTP id q28so9617091lfa.5
        for <keyrings@vger.kernel.org>; Sat, 02 Nov 2019 15:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=w/G6EKdeKHyA10XyqtoNEQBxMdg61j9NrYNZ+OC/8O0=;
        b=fiTiutJMMhzHoUatnMj/i0xks6LRSmy0r7/BRz4Oo2NzE6YmtOVVD9WTTp3vp/4Ftl
         susZvLuDrEDv2Y0EisfAoYbNX8c8ba0GWiLrv658sEXczCmotmacJTxLnXp7ikF2o1OS
         tH5KGMhlSFlbvPUr5HFJ0KdvbB3vKmi6HfEto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=w/G6EKdeKHyA10XyqtoNEQBxMdg61j9NrYNZ+OC/8O0=;
        b=U/nle8Rh0U2dY/1+Lbt47286g1oQXyEgU1OMMWv4epiawUERoiC0it/4Oa6vKriY0V
         yyn1uX/umbzexZTEUPlaNDMWf3CaJMP39XjrBSpGe9MspjLAGXoA5PACT5pUq/B1paLF
         Pcb82oJMy4CSrfvIk/6Jhz5WffInV3q1xhsSPG/1xHRKXtv+vT1TV0K6PYeUR925horO
         yeYJxicJYgLCflfzuPvb9s/zvBMBZZzA/YzAS8lipYlTIKkeYdnPUKjd1AfDOeH7XvNi
         EbTjzttIqOVQMKuzN2xYt7u0daKoDh8Sqoj3/0qSR9Pu9tdWlT/08iq97kGr2E6CuqkG
         RJRg==
X-Gm-Message-State: APjAAAWOfx0w02raFmaCmh8Asrtl+KqIATl8nNDmd5/FfIgNHd87vls5
        yigAT1FbjR+iP9i4iN/pS+7eCwnLqW4=
X-Google-Smtp-Source: APXvYqzGbjX+6m+9v/4MXDZzs3TJGoB9E57KeDp9NkRBm1LNPpU+qjWl0O6IVe0qBBW+Gh8fzw8yNA==
X-Received: by 2002:a05:6512:40e:: with SMTP id u14mr11911585lfk.73.1572732566743;
        Sat, 02 Nov 2019 15:09:26 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id f1sm4081037ljk.77.2019.11.02.15.09.25
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2019 15:09:26 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id j5so9583285lfh.10
        for <keyrings@vger.kernel.org>; Sat, 02 Nov 2019 15:09:25 -0700 (PDT)
X-Received: by 2002:a19:6f0e:: with SMTP id k14mr11937953lfc.79.1572732565288;
 Sat, 02 Nov 2019 15:09:25 -0700 (PDT)
MIME-Version: 1.0
References: <25886.1572723272@warthog.procyon.org.uk> <CC3328CC-2F05-461E-AAC3-8DEBAB1BA162@amacapital.net>
 <CAHk-=wj1BLz6s9cG9Ptk4ULxrTy=MkF7ZH=HF67d7M5HL1fd_A@mail.gmail.com>
In-Reply-To: <CAHk-=wj1BLz6s9cG9Ptk4ULxrTy=MkF7ZH=HF67d7M5HL1fd_A@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 2 Nov 2019 15:09:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiNJYdEcomZKaD034S==-gEXg_V3JpW+DpKXFi5fJuruw@mail.gmail.com>
Message-ID: <CAHk-=wiNJYdEcomZKaD034S==-gEXg_V3JpW+DpKXFi5fJuruw@mail.gmail.com>
Subject: Re: [RFC PATCH 11/10] pipe: Add fsync() support [ver #2]
To:     Andy Lutomirski <luto@amacapital.net>
Cc:     David Howells <dhowells@redhat.com>,
        Konstantin Khlebnikov <khlebnikov@yandex-team.ru>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Sat, Nov 2, 2019 at 3:03 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sat, Nov 2, 2019 at 1:31 PM Andy Lutomirski <luto@amacapital.net> wrot=
e:
> >
> > Add in the fact that it=E2=80=99s not obvious that vmsplice *can* be us=
ed correctly, and I=E2=80=99m wondering if we should just remove it or make=
 it just do write() under the hood.
>
> Sure it can. Just don't modify the data you vmsplice. It's really that si=
mple.
>
> That said, if we don't have any actual users, then we should look at
> removing it (maybe turning it into "write()" as you say). Not because
> it's hard to use, but simply because it probably doesn't have that
> many uses.

Looking at debian code search, there are _some_ uses (including
openssl and fuse):

  https://codesearch.debian.net/search?q=3D%3D+vmsplice%28&literal=3D1

but I didn't check any more closely what they do.

             Linus
