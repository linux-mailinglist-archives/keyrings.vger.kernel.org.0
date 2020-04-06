Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2421E19F268
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 11:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726769AbgDFJWq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 05:22:46 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:38596 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbgDFJWq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 05:22:46 -0400
Received: by mail-ed1-f66.google.com with SMTP id e5so18359696edq.5
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 02:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ICZidZS836uKk3f5MYlrKnxf/d24delcy3nSKE9ogi4=;
        b=W3pq5Mo7uZpLVGOq5GAIDI/ai7fUH4IIThQ1nwRczafHnhltyPbRBYi4qNanWLvp69
         +904YhfbA4VWq0KvmJHQkjtbf5BXIa7CMoQ1Fr67ulXZcagefy/tt06DHI28sQAl1Z4o
         hoDv8pLs5dD5DoPrxG3VeoDU6ANvHB8Mx51a0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ICZidZS836uKk3f5MYlrKnxf/d24delcy3nSKE9ogi4=;
        b=C68L6EjkMiyuFu4Nih0O+XAGLTOQW2STthiTJUPnsDpT0708HarsPCyrGIgsQZx7tG
         z6bhvgMDgwIYc8UCsn7Rp4EGIrr7REa2nMryGpHFXB5UKHK4ha8qoNWcKMBx2FDt3lUT
         YuNiQJ/0a72Nww1U8rFwtuOmYlAXSeDTbnk2h3roLq95ciZqyXrJR9Jd0s021W4nNEXF
         gXHKpJyi2mZjJW3ZhiKKGVyDpMuRWrXutgRQSwQLlyxaxgmudHccWmcmYh4bYWOMXEdz
         +2hyP2s3BVzQURJPsHy+vo097gmg2Q3rbu3KmYr+p/HbPyDMLn6xh8cJ6XFD1X7m3N3z
         Z1ww==
X-Gm-Message-State: AGi0PuaZxm8bjpMD75pv3zP2NT//AG8nlac+66+CJKnkQzaltBoMATd0
        fWD5hd5ePWU4vd1SwZt4P2LX7a/2FYBe3wwpbGOwbg==
X-Google-Smtp-Source: APiQypKhY01mdGI1/JQgHY2uIzhyGBPdhVdoEMLb6wrymVsJFgMONWTk9QGbDBPrwg//+L4NEZ3xqyN3Wn1J9Hi6NTs=
X-Received: by 2002:a17:906:b351:: with SMTP id cd17mr20431593ejb.351.1586164962711;
 Mon, 06 Apr 2020 02:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <36e45eae8ad78f7b8889d9d03b8846e78d735d28.camel@themaw.net>
 <CAJfpegsCDWehsTRQ9UJYuQnghnE=M8L0_bJBTTPA+Upu87t90w@mail.gmail.com>
 <20200402143623.GB31529@gardel-login> <CAJfpegtRi9epdxAeoVbm+7UxkZfzC6XmD4K_5dg=RKADxy_TVA@mail.gmail.com>
 <20200402152831.GA31612@gardel-login> <CAJfpegum_PsCfnar8+V2f_VO3k8CJN1LOFJV5OkHRDbQKR=EHg@mail.gmail.com>
 <20200402155020.GA31715@gardel-login> <CAJfpeguM__+S6DiD4MWFv5GCf_EUWvGFT0mzuUCCrfQwggqtDQ@mail.gmail.com>
 <20200403110842.GA34663@gardel-login> <CAJfpegtYKhXB-HNddUeEMKupR5L=RRuydULrvm39eTung0=yRg@mail.gmail.com>
 <20200403150143.GA34800@gardel-login>
In-Reply-To: <20200403150143.GA34800@gardel-login>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Mon, 6 Apr 2020 11:22:31 +0200
Message-ID: <CAJfpegudLD8F-25k-k=9G96JKB+5Y=xFT=ZMwiBkNTwkjMDumA@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Apr 3, 2020 at 5:01 PM Lennart Poettering <mzxreary@0pointer.de> wr=
ote:
>
> On Fr, 03.04.20 13:48, Miklos Szeredi (miklos@szeredi.hu) wrote:
>
> > > > Does that make any sense?
> > >
> > > When all mounts in the init mount namespace are unmounted and all
> > > remaining processes killed we switch root back to the initrd, so that
> > > even the root fs can be unmounted, and then we disassemble any backin=
g
> > > complex storage if there is, i.e. lvm, luks, raid, =E2=80=A6
> >
> > I think it could be done the other way round, much simpler:
> >
> >  - switch back to initrd
> >  - umount root, keeping the tree intact (UMOUNT_DETACHED)
> >  - kill all remaining processes, wait for all to exit
>
> Nah. What I wrote above is drastically simplified. It's IRL more
> complex. Specific services need to be killed between certain mounts
> are unmounted, since they are a backend for another mount. NFS, or
> FUSE or stuff like that usually has some processes backing them
> around, and we need to stop the mounts they provide before these
> services, and then the mounts these services reside on after that, and
> so on. It's a complex dependency tree of stuff that needs to be done
> in order, so that we can deal with arbitrarily nested mounts, storage
> subsystems, and backing services.

That still doesn't explain why you need to keep track of all mounts in
the system.

If you are aware of the dependency, then you need to keep track of
that particular mount. If not, then why?

What I'm starting to see is that there's a fundamental conflict
between how systemd people want to deal with new mounts and how some
other people want to use mounts (i.e. tens of thousands of mounts in
an automount map).

I'm really curious how much the mount notification ring + per mount
query (any implementation) can help that use case.

> Anyway, this all works fine in systemd, the dependency logic is
> there. We want a more efficient way to watch mounts, that's
> all. Subscribing and constantly reparsing /proc/self/mountinfo is
> awful, that's all.

I'm not sure that is all.   To handle storms of tens of thousands of
mounts, my guess is that the fundamental way of dealing with these
changes will need to be updated in systemd.

Thanks,
Miklos
