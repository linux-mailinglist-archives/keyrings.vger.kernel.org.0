Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DABD3EC907
	for <lists+keyrings@lfdr.de>; Fri,  1 Nov 2019 20:25:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbfKATZQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 1 Nov 2019 15:25:16 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42030 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727835AbfKATZQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 1 Nov 2019 15:25:16 -0400
Received: by mail-lj1-f193.google.com with SMTP id n5so299077ljc.9
        for <keyrings@vger.kernel.org>; Fri, 01 Nov 2019 12:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YYxjqcv/PYLPJKobOoHtNXOrj3psbjFOHnMYal58y3I=;
        b=c+Gs+TI8cuAjd4kd2hWlKLPAsPgXseDnrsUcVlBiA4ySvAjVj2n7unbZVDl4mRhd8k
         QGeff69FovwuouMkPqWploEvqGg2xz0OwyPfdogz9QpK6BaN9Ka9RJgzEVo5nEiWZyg/
         /eJ1qfcbNdodLUDZDnlwBOGgeV6KiV/t48RJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YYxjqcv/PYLPJKobOoHtNXOrj3psbjFOHnMYal58y3I=;
        b=WL3wQMbQZBGlsadN6S2fU0B3ElmSjseHc0vnjE0Gt77tabHWH7lp3pryDToJ86R3QS
         e7yreHeOsKsiKkTT+9E8VauCA1hE3B1kBvYBhCdm5xwun02bWRwF/FehW8k68rLTh/C2
         fId25/s3bpc2kZOLhGOc1iAYyR8n13eDeepmMEyi4R5nnHrT6eZAe63WrwRfJTO5BVkA
         AcyXWdLcmoNfMjM3Y0i3hnnfTrDHWxWq5/cuMfDnqJCMmcH97zfr0Vm/oCv0ip3w1nbZ
         XxSKcx4HmwaTHhrs+EbJQfPmusWGuyTOIyjECU3k+Qb1qun7j4AKDS3iXvJEGf4C9LXZ
         RZxA==
X-Gm-Message-State: APjAAAWN0usoPO66DfBqTcEu8WFR4yh+hYWRJtSEs/zeEp9JJtfDgOna
        lCqf6J3rEeyd27S8xNAwucg6MKKZjB4=
X-Google-Smtp-Source: APXvYqxFmNIFUwfL5lc23/kAy6x15zCzJ5yVRTyToHrEY3WBxIQf9MxTqdiYuacOrS+Ymp/qjbJ7UA==
X-Received: by 2002:a2e:58d:: with SMTP id 135mr8938599ljf.57.1572636312911;
        Fri, 01 Nov 2019 12:25:12 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id o196sm3400226lff.59.2019.11.01.12.25.11
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2019 12:25:11 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id v2so11325319lji.4
        for <keyrings@vger.kernel.org>; Fri, 01 Nov 2019 12:25:11 -0700 (PDT)
X-Received: by 2002:a05:651c:154:: with SMTP id c20mr9282919ljd.1.1572636310860;
 Fri, 01 Nov 2019 12:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <157262963995.13142.5568934007158044624.stgit@warthog.procyon.org.uk>
In-Reply-To: <157262963995.13142.5568934007158044624.stgit@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 1 Nov 2019 12:24:54 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjqx4j2vqg-tAwthNP1gcAcj1x4B7sq6Npbi8QJTUMd-A@mail.gmail.com>
Message-ID: <CAHk-=wjqx4j2vqg-tAwthNP1gcAcj1x4B7sq6Npbi8QJTUMd-A@mail.gmail.com>
Subject: Re: [RFC PATCH 00/11] pipe: Notification queue preparation [ver #3]
To:     David Howells <dhowells@redhat.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
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
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Nov 1, 2019 at 10:34 AM David Howells <dhowells@redhat.com> wrote:
>  (1) It removes the nr_exclusive argument from __wake_up_sync_key() as this
>      is always 1.  This prepares for step 2.
>
>  (2) Adds wake_up_interruptible_sync_poll_locked() so that poll can be
>      woken up from a function that's holding the poll waitqueue spinlock.

Side note: we have a couple of cases where I don't think we should use
the "sync" version at all.

Both pipe_read() and pipe_write() have that

        if (do_wakeup) {
                wake_up_interruptible_sync_poll(&pipe->wait, ...

code at the end, outside the loop. But those two wake-ups aren't
actually synchronous.

A sync wake is supposedly something where the waker is just about to
go to sleep, telling the scheduler that "don't bother trying to pick
another cpu, this process is going to sleep and you can stay here".

I'm not sure how much this matters, but it does strike me that it's
wrong. We're not going to sleep at all in that case - this is not the
"I filled the whole buffer, so I'm going to sleep" case (or the "I've
read all the data, I'm waiting for more".

It's entirely possible that we always wake pipe wakeups to be sync
just because it's a common pattern (and a common benchmark), but this
series made me look at it again. Particularly since David has
benchmarks that don't seem to show a lot of fluctuation with his
changes - I wonder how much the sync logic buys us (or hurts us)?

               Linus
