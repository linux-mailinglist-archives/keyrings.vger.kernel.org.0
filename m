Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB1519C7D6
	for <lists+keyrings@lfdr.de>; Thu,  2 Apr 2020 19:20:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389160AbgDBRUk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 2 Apr 2020 13:20:40 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:46701 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389145AbgDBRUj (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 2 Apr 2020 13:20:39 -0400
Received: by mail-ed1-f65.google.com with SMTP id cf14so5195211edb.13
        for <keyrings@vger.kernel.org>; Thu, 02 Apr 2020 10:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/8EoII7z9i5h4OnvIq0Rj015ZeVzlUXsiRDLRpXTqXw=;
        b=qazYXUmbDRgfAw8MLzT3O7+59Pt4zqcbTg4g0l/11y7Dr1rCScxhqWrtzb5yM/chh5
         xRLOjQHXW3454+bqFfrL1FiSjO9gPgydQ36xBjx2kVTf975fxHNN0Qpy7X52lFiDdAwG
         YO5SKfy/vuW+9URF5W7+XZqL7uBAwxH9JaXFA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/8EoII7z9i5h4OnvIq0Rj015ZeVzlUXsiRDLRpXTqXw=;
        b=t5v4+AneSxgxZDlVwY1tSykjJmvLGlvcJfQJ1CIW/7QUhBXyrJjHp7s723Ycc07bYZ
         jjcCbEP3OsAoucuntAiw1jsoEPGutprdMdp5WnXYAKO+weTOqOLoQW6dhXTm/aVE8PYc
         xPaGCAlIqKIUYE9o+M+rw/sc1xMeDqBhkZEFQdmi7PmvNS3YO8rBlU8z7VBiqCaKlYMq
         eY1FgmAqMbXQczHDVxcSBwsKDnom0TZ+/DtIs0gT2VzDfhL9imIz6ACnYkamr5uUnyp9
         FMaVkCbfRFsD79r3Vc41zC47VLShWPjQzG0NkaUHxzl0yl0QcXhKXmF4vjW1JWxlJ7RJ
         jvKA==
X-Gm-Message-State: AGi0PubJ0Pd2J4m0xN371uwmmYFfeFPU4iySasZPGGAeqT8ItLF5C4wk
        iV6VRdNnOscH4DNibMUfyO9MSFMHuCLNDT7XIUkVdg==
X-Google-Smtp-Source: APiQypIQHESW7HGsSbWi/b67+Z8CM+ogEI/TSMrREOv0dfgoAhH5cHrRKa2azcoZn3/BZnYkNIQR6b32zGY3N0UdqOc=
X-Received: by 2002:aa7:cfd4:: with SMTP id r20mr3924122edy.378.1585848038082;
 Thu, 02 Apr 2020 10:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200401144109.GA29945@gardel-login> <CAJfpegs3uDzFTE4PCjZ7aZsEh8b=iy_LqO1DBJoQzkP+i4aBmw@mail.gmail.com>
 <2590640.1585757211@warthog.procyon.org.uk> <CAJfpegsXqxizOGwa045jfT6YdUpMxpXET-yJ4T8qudyQbCGkHQ@mail.gmail.com>
 <36e45eae8ad78f7b8889d9d03b8846e78d735d28.camel@themaw.net>
 <CAJfpegsCDWehsTRQ9UJYuQnghnE=M8L0_bJBTTPA+Upu87t90w@mail.gmail.com>
 <20200402143623.GB31529@gardel-login> <CAJfpegtRi9epdxAeoVbm+7UxkZfzC6XmD4K_5dg=RKADxy_TVA@mail.gmail.com>
 <20200402152831.GA31612@gardel-login> <CAJfpegum_PsCfnar8+V2f_VO3k8CJN1LOFJV5OkHRDbQKR=EHg@mail.gmail.com>
 <20200402155020.GA31715@gardel-login>
In-Reply-To: <20200402155020.GA31715@gardel-login>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Thu, 2 Apr 2020 19:20:26 +0200
Message-ID: <CAJfpeguM__+S6DiD4MWFv5GCf_EUWvGFT0mzuUCCrfQwggqtDQ@mail.gmail.com>
Subject: Re: Upcoming: Notifications, FS notifications and fsinfo()
To:     Lennart Poettering <mzxreary@0pointer.de>
Cc:     Ian Kent <raven@themaw.net>, David Howells <dhowells@redhat.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>, dray@redhat.com,
        Karel Zak <kzak@redhat.com>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Steven Whitehouse <swhiteho@redhat.com>,
        Jeff Layton <jlayton@redhat.com>, andres@anarazel.de,
        keyrings@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, Aleksa Sarai <cyphar@cyphar.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Apr 2, 2020 at 5:50 PM Lennart Poettering <mzxreary@0pointer.de> wrote:
>
> On Do, 02.04.20 17:35, Miklos Szeredi (miklos@szeredi.hu) wrote:
>
> > > systemd cares about all mount points in PID1's mount namespace.
> > >
> > > The fact that mount tables can grow large is why we want something
> > > better than constantly reparsing the whole /proc/self/mountinfo. But
> > > filtering subsets of that is something we don't really care about.
> >
> > I can accept that, but you haven't given a reason why that's so.
> >
> > What does it do with the fact that an automount point was crossed, for
> > example?  How does that affect the operation of systemd?
>
> We don't care how a mount point came to be. If it's autofs or
> something else, we don't care. We don't access these mount points
> ourselves ever, we just watch their existance.
>
> I mean, it's not just about startup it's also about shutdown. At
> shutdown we need to unmount everything from the leaves towards the
> root so that all file systems are in a clean state.

Unfortunately that's not guaranteed by umounting all filesystems from
the init namespace.  A filesystem is shut down when all references to
it are gone.  Perhaps you instead want to lazy unmount root (yeah,
that may not actually be allowed, but anyway, lazy unmounting the top
level ones should do) and watch for super block shutdown events
instead.

Does that make any sense?

Thanks,
Miklos
