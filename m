Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E498AAAFB5
	for <lists+keyrings@lfdr.de>; Fri,  6 Sep 2019 02:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389935AbfIFAO0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 5 Sep 2019 20:14:26 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44912 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389391AbfIFAO0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 5 Sep 2019 20:14:26 -0400
Received: by mail-lj1-f194.google.com with SMTP id u14so4268545ljj.11
        for <keyrings@vger.kernel.org>; Thu, 05 Sep 2019 17:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0NMHQZwfVd4ulDW3P9IBDkOOXGi1t10wFsvSD1QyNDE=;
        b=PrQ/gz4Yvh3kDyFvFLcH3TLv78hTzoNA/ToV1HPN5PDzcNoSoVUwUoP72QpHgogaxX
         CLkzLD1zXZqq6zgzwke2sO6s4DA395H5eQOgvJCtQoWHNcdLmv5+5Qv3OTtes1ZdYxgr
         dP7NEV3rjX1ke9HkH3D1w0hGa1cOD5ShRa+2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0NMHQZwfVd4ulDW3P9IBDkOOXGi1t10wFsvSD1QyNDE=;
        b=YEtSVuCu0EkHMNpAJbwIIFK+iBssTS/agzXrAi0wZhu2cxymSTHfA0oyYLO2D+tSYa
         GaJxH/e9rtWUcCFhWnclWgHUEuB5cH1uG9hmK50xK+PzfKoR29bo55qCcNtD7z7UBiEl
         F/y5kq6paHbsPYbw4C58mswsj8GIWTthTpkVtl20n61UQU7V2f98HSZ/OudLVuKqHIe1
         DOWZBp0TsxwJDjOuocBC8TMb+m75iF5EMNv4Xf6OcU9fTp55vIite49vKcSwaDpqNM0G
         f99EiVtX2Td5fCmGWny8yHZHPTwmHRd/J7l4uzBMzBieta9lpoxK/VRFqZ20TNtLa7Yy
         IXAw==
X-Gm-Message-State: APjAAAXunZ08OlP5Sxrg1rVa1hIMdYxcyuP11dtt8F0K6fLSmTNL5xYs
        iWMnzBY8ekikqasw2z1cgnPl1B3tAKw=
X-Google-Smtp-Source: APXvYqwNnQVkqV5gIDmEHmbS+VemtmF5sLy80uu1yqOEW1haq/rJE4FSk3A2ZNdSWSJgB6pw6RpaRQ==
X-Received: by 2002:a2e:4704:: with SMTP id u4mr3801738lja.203.1567728862386;
        Thu, 05 Sep 2019 17:14:22 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id h3sm632375ljj.42.2019.09.05.17.14.21
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2019 17:14:22 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id y23so4289995lje.9
        for <keyrings@vger.kernel.org>; Thu, 05 Sep 2019 17:14:21 -0700 (PDT)
X-Received: by 2002:a2e:3c14:: with SMTP id j20mr3770452lja.84.1567728461450;
 Thu, 05 Sep 2019 17:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <156763534546.18676.3530557439501101639.stgit@warthog.procyon.org.uk>
 <CAHk-=wh5ZNE9pBwrnr5MX3iqkUP4nspz17rtozrSxs5-OGygNw@mail.gmail.com>
 <17703.1567702907@warthog.procyon.org.uk> <CAHk-=wjQ5Fpv0D7rxX0W=obx9xoOAxJ_Cr+pGCYOAi2S9FiCNg@mail.gmail.com>
 <CAKCoTu7ms_Mr-q08d9XB3uascpzwBa5LF9JTT2aq8uUsoFE8aQ@mail.gmail.com>
 <CAHk-=wjcsxQ8QB_v=cwBQw4pkJg7pp-bBsdWyPivFO_OeF-y+g@mail.gmail.com>
 <5396.1567719164@warthog.procyon.org.uk> <CAHk-=wgbCXea1a9OTWgMMvcsCGGiNiPp+ty-edZrBWn63NCYdw@mail.gmail.com>
 <14883.1567725508@warthog.procyon.org.uk>
In-Reply-To: <14883.1567725508@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 5 Sep 2019 17:07:25 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjt2Eb+yEDOcQwCa0SrZ4cWu967OtQG8Vz21c=n5ZP1Nw@mail.gmail.com>
Message-ID: <CAHk-=wjt2Eb+yEDOcQwCa0SrZ4cWu967OtQG8Vz21c=n5ZP1Nw@mail.gmail.com>
Subject: Re: Why add the general notification queue and its sources
To:     David Howells <dhowells@redhat.com>
Cc:     Ray Strode <rstrode@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Steven Whitehouse <swhiteho@redhat.com>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        Christian Brauner <christian@brauner.io>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "Ray, Debarshi" <debarshi.ray@gmail.com>,
        Robbie Harwood <rharwood@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Sep 5, 2019 at 4:18 PM David Howells <dhowells@redhat.com> wrote:
>
> Can you write into a pipe from softirq context and/or with spinlocks held
> and/or with the RCU read lock held?  That is a requirement.  Another is that
> messages get inserted whole or not at all (or if they are truncated, the size
> field gets updated).

Right now we use a mutex for the buffer locking, so no, pipe buffers
are not irq-safe or atomic. That's due to the whole "we may block on
data from user space" when doing a write.

HOWEVER.

Pipes actually have buffers on two different levels: there's the
actual data buffers themselves (each described by a "struct
pipe_buffer"), and there's the circular queue of them (the
"pipe->buf[]" array, with pipe->curbuf/nrbufs) that points to
individual data buffers.

And we could easily separate out that data buffer management. Right
now it's not really all that separated: people just do things like

        int newbuf = (pipe->curbuf + bufs) & (pipe->buffers-1);
        struct pipe_buffer *buf = pipe->bufs + newbuf;
...
        pipe->nrbufs++;

to add a buffer into that circular array of buffers, but _that_ part
could be made separate.  It's just all protected by the pipe mutex
right now, so it has never been an issue.

And yes, atomicity of writes has actually been an integral part of
pipes since forever. It's actually the only unambiguous atomicity that
POSIX guarantees. It only holds for writes to pipes() of less than
PIPE_BUF blocks, but that's 4096 on Linux.

> Since one end would certainly be attached to an fd, it looks on the face of it
> that writing into the pipe would require taking pipe->mutex.

That's how the normal synchronization is done, yes. And changing that
in general would be pretty painful. For example, two concurrent
user-space writers might take page faults and just generally be
painful, and the pipe locking needs to serialize that.

So the mutex couldn't go away from pipes in general - it would remain
for read/write/splice mutual exclusion (and it's not just the data it
protects, it's the reader/writer logic for EPIPE etc).

But the low-level pipe->bufs[] handling is another issue entirely.
Even when a user space writer copies things from user space, it does
so into a pre-allocated buffer that is then attached to the list of
buffers somewhat separately (there's a magical special case where you
can re-use a buffer that is marked as "I can be reused" and append
into an already allocated buffer).

And adding new buffers *could* be done with it's own separate locking.
If you have a blocking writer (ie a user space data source), that
would still take the pipe mutex, and it would delay the user space
readers (because the readers also need the mutex), but it should not
be all that hard to just make the whole "curbuf/nrbufs" handling use
its own locking (maybe even some lockless atomics and cmpxchg).

So a kernel writer could "insert" a "struct pipe_buffer" atomically,
and wake up the reader atomically. No need for the other complexity
that is protected by the mutex.

The buggest problem is perhaps that the number of pipe buffers per
pipe is fairly limited by default. PIPE_DEF_BUFFERS is 16, and if we'd
insert using the ->bufs[] array, that would be the limit of "number of
messages". But each message could be any size (we've historically
limited pipe buffers to one page each, but that limit isn't all that
hard. You could put more data in there).

The number of pipe buffers _is_ dynamic, so the above PIPE_DEF_BUFFERS
isn't a hard limit, but it would be the default.

Would it be entirely trivial to do all the above? No. But it's
*literally* just finding the places that work with pipe->curbuf/nrbufs
and making them use atomic updates. You'd find all the places by just
renaming them (and making them atomic or whatever) and the compiler
will tell you "this area needs fixing".

We've actually used pipes for messages before: autofs uses a magic
packetized pipe buffer thing. It didn't need any extra atomicity,
though, so it stil all worked with the regular pipe->mutex thing.

And there is a big advantage from using pipes. They really would work
with almost anything. You could even mix-and-match "data generated by
kernel" and "data done by 'write()' or 'splice()' by a user process".

NOTE! I'm not at all saying that pipes are perfect. You'll find people
who swear by sockets instead. They have their own advantages (and
disadvantages). Most people who do packet-based stuff tend to prefer
sockets, because those have standard packet-based models (Linux pipes
have that packet mode too, but it's certainly not standard, and I'm
not even sure we ever exposed it to user space - it could be that it's
only used by the autofs daemon).

I have a soft spot for pipes, just because I think they are simpler
than sockets. But that soft spot might be misplaced.

                   Linus
