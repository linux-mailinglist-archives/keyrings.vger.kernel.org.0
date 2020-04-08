Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2611B1A1A59
	for <lists+keyrings@lfdr.de>; Wed,  8 Apr 2020 05:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgDHDmz (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 7 Apr 2020 23:42:55 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:45543 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbgDHDmz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 7 Apr 2020 23:42:55 -0400
Received: by mail-ed1-f68.google.com with SMTP id m12so6723558edl.12
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 20:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NJf9EXNj3y/TKHffW9ag62Sko1WtINX0aC0YEmTe104=;
        b=S5OUs8S2WPRcFflOiuuZsTxZ8A1VyAyMWTd+UIkBzHeqvN6tEv6DNT/Bpoq4rp7OB+
         ggO9z6fRYGobw4WBVT1GwWBGUhc1933I2vOXImxppct2Mq6upT6lf6wE5i9FG0JmTvnn
         rr5kl3i0aGePIwNow27mp+LGMU0yoljl7cDiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NJf9EXNj3y/TKHffW9ag62Sko1WtINX0aC0YEmTe104=;
        b=ZihhEfzQ+yZ6OqKxrKKWNbmXJXhVDPzBC/htbekFQ2qkA3D9jXsK5Y1vHi4lmrFQ3k
         6BvfW7dcxLtsa+1qf+Es8HW/y2v83JDQtMW9gU48rQ7c0dGS2A3mb8Jnu+h4ZyEWhUkA
         stOwoSj+d4IgNO9r4URuFkaH6S4aOxesRrgF0eX8MD4TX4xosdkXP+4olBfhTu695atG
         dKu2aaFYuX6OdEFZMiGEWmHcYEq4A5jb5YmdhJ3TsNyefRTwds+9D5ixFt+IYz7S1s/5
         jCBIV0DtkUJMr60Ckb+2Zgk8PKCdd5B7VI8TJbmwcgmUY/HHtw9sG++S2vZPFY4AodiX
         3IIg==
X-Gm-Message-State: AGi0PuYoxMc8e58xv/AgXntMS2ELmUkujIvfTPOq+YeqGCMin63m1IJ4
        Kn69QhUuQ5EuzZ9O9nNRVMhR0ZMKuLo=
X-Google-Smtp-Source: APiQypIGXX6RdgZ+xuszHQ64SV/SPb3V6aVdWpOQJhJVq7QxhcnUCdfJehZlejXdx9O4qyMQBIMvyQ==
X-Received: by 2002:a17:906:1e48:: with SMTP id i8mr5010539ejj.232.1586317372366;
        Tue, 07 Apr 2020 20:42:52 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id ce18sm222806ejb.61.2020.04.07.20.42.51
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2020 20:42:52 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id y44so2584867wrd.13
        for <keyrings@vger.kernel.org>; Tue, 07 Apr 2020 20:42:51 -0700 (PDT)
X-Received: by 2002:ac2:4466:: with SMTP id y6mr3241858lfl.125.1586317003620;
 Tue, 07 Apr 2020 20:36:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAJfpegsXqxizOGwa045jfT6YdUpMxpXET-yJ4T8qudyQbCGkHQ@mail.gmail.com>
 <36e45eae8ad78f7b8889d9d03b8846e78d735d28.camel@themaw.net>
 <CAJfpegsCDWehsTRQ9UJYuQnghnE=M8L0_bJBTTPA+Upu87t90w@mail.gmail.com>
 <27994c53034c8f769ea063a54169317c3ee62c04.camel@themaw.net>
 <20200403111144.GB34663@gardel-login> <CAJfpeguQAw+Mgc8QBNd+h3KV8=Y-SOGT7TB_N_54wa8MCoOSzg@mail.gmail.com>
 <20200403151223.GB34800@gardel-login> <20200403203024.GB27105@fieldses.org>
 <20200406091701.q7ctdek2grzryiu3@ws.net.home> <CAHk-=wjW735UE+byK1xsM9UvpF2ubh7bCMaAOwz575U7hRCKyA@mail.gmail.com>
 <20200406184812.GA37843@gardel-login>
In-Reply-To: <20200406184812.GA37843@gardel-login>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Tue, 7 Apr 2020 20:36:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgNuJaJS9Vfe83Tfgq92PonhpfLy1-vvG63SC=3VYf3+g@mail.gmail.com>
Message-ID: <CAHk-=wgNuJaJS9Vfe83Tfgq92PonhpfLy1-vvG63SC=3VYf3+g@mail.gmail.com>
Subject: Re: Upcoming: Notifications, FS notifications and fsinfo()
To:     Lennart Poettering <mzxreary@0pointer.de>
Cc:     Karel Zak <kzak@redhat.com>,
        "J. Bruce Fields" <bfields@fieldses.org>,
        Miklos Szeredi <miklos@szeredi.hu>,
        Ian Kent <raven@themaw.net>,
        David Howells <dhowells@redhat.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Al Viro <viro@zeniv.linux.org.uk>, dray@redhat.com,
        Miklos Szeredi <mszeredi@redhat.com>,
        Steven Whitehouse <swhiteho@redhat.com>,
        Jeff Layton <jlayton@redhat.com>, andres@anarazel.de,
        keyrings@vger.kernel.org,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Aleksa Sarai <cyphar@cyphar.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Apr 6, 2020 at 11:48 AM Lennart Poettering <mzxreary@0pointer.de> wrote:
>
> On Mo, 06.04.20 09:34, Linus Torvalds (torvalds@linux-foundation.org) wrote:
>
> > On Mon, Apr 6, 2020 at 2:17 AM Karel Zak <kzak@redhat.com> wrote:
> > >
> > > On Fri, Apr 03, 2020 at 04:30:24PM -0400, J. Bruce Fields wrote:
> > > >
> > > > nfs-utils/support/misc/mountpoint.c:check_is_mountpoint() stats the file
> > > > and ".." and returns true if they have different st_dev or the same
> > > > st_ino.  Comparing mount ids sounds better.
> > >
> > > BTW, this traditional st_dev+st_ino way is not reliable for bind mounts.
> > > For mountpoint(1) we search the directory in /proc/self/mountinfo.
> >
> > These days you should probably use openat2() with RESOLVE_NO_XDEV.
>
> Note that opening a file is relatively "heavy" i.e. typically triggers
> autofs and stuff, and results in security checks (which can fail and
> such, and show up in audit).

For the use that Bruce outlined, openat2() with RESOLVE_NO_XDEV is
absolutely the right thing.

He already did the stat() of the file (and ".."), RESOLVE_NO_XDEV is
only an improvement. It's also a lot better than trying to parse
mountinfo.

Now, I don't disagree that a statx() flag to also indicate "that's a
top-level mount" might be a good idea, and may be the right answer for
other cases.

I'm just saying that considering what Bruce does now, RESOLVE_NO_XDEV
sounds like the nobrainer approach, and needs no new support outside
of what we already had for other reasons.

(And O_PATH _may_ or may not be part of what you want to do, it's an
independent separate issue, but automount behavior wrt a O_PATH lookup
is somewhat unclear - see Al's other emails on that subject)

             Linus
