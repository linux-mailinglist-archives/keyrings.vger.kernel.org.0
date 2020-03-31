Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99308199942
	for <lists+keyrings@lfdr.de>; Tue, 31 Mar 2020 17:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730607AbgCaPKs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 31 Mar 2020 11:10:48 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:40906 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730541AbgCaPKs (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 31 Mar 2020 11:10:48 -0400
Received: by mail-ed1-f66.google.com with SMTP id w26so25538346edu.7
        for <keyrings@vger.kernel.org>; Tue, 31 Mar 2020 08:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x7MnP0ziMJ05b/KxlP+M8bkph/ifpBLqQViGWOB4DEo=;
        b=SSt1VrIVX/Tjp7n2tm5hZ28Rimha6AkiiRqswnMUOZrX6u8JAvs7EpidlIibrDgWn6
         8f3oR+MSicBlmRwxRGlRmocZLP58QcOxLLy/3P8XMGN78DlSS3Yc9BcLygTC477mg5aR
         2bw79UepxHWGRmpmqa2topzKhKBf6CZHFQB5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x7MnP0ziMJ05b/KxlP+M8bkph/ifpBLqQViGWOB4DEo=;
        b=kZXaXdpOKIm0Rp8OzDHnFdJF+pUWVFCNMuNAe816IZwobDK2yMTY27QWa+oAkQTlb3
         0TfjkQEP9C18o3L4qa+7xqVvv6NOudPhX+ZTG0z5MgJRz/B2ZnMZfyUp1hiI7I6rajYk
         z1e1mEqmnfKw809JfHlMBoaffm8wIGll/qfzNVClha3YRiPkU9frqMnf2MXMP3d/5O/o
         FDV5CTTWAwI+IAY+SZBGS3i6pFUXlS/CggRwSsGRs1XLasgLS6+kx479VYRdN8Rv7n/o
         z886KiuBbjmjvBPtPrYITdCfhxN3zweied3plo5OIQJPxC1itkfGivezQzGdqD5hGmbJ
         y9xQ==
X-Gm-Message-State: ANhLgQ2PF0aa8/PGK0CwZatITxTu5/WFO38Wh6U0/LD3O/G6EiCNUH/Q
        2vfcx1YMTXqQSTByuwAcFfWQstLl80uPrVCj+379GQ==
X-Google-Smtp-Source: ADFU+vv3Rldz1B2TlCvia6yybcz1TZKY48JT2JSMOypFogu2KyaS+8B9LeWuNNEUuazthmsFwiMPNgKhW+h/eb48onU=
X-Received: by 2002:a17:906:6545:: with SMTP id u5mr7087508ejn.27.1585667445614;
 Tue, 31 Mar 2020 08:10:45 -0700 (PDT)
MIME-Version: 1.0
References: <1445647.1585576702@warthog.procyon.org.uk> <20200330211700.g7evnuvvjenq3fzm@wittgenstein>
 <CAJfpegtjmkJUSqORFv6jw-sYbqEMh9vJz64+dmzWhATYiBmzVQ@mail.gmail.com>
 <20200331083430.kserp35qabnxvths@ws.net.home> <CAJfpegsNpabFwoLL8HffNbi_4DuGMn4eYpFc6n7223UFnEPAbA@mail.gmail.com>
 <20200331122554.GA27469@gardel-login>
In-Reply-To: <20200331122554.GA27469@gardel-login>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Tue, 31 Mar 2020 17:10:34 +0200
Message-ID: <CAJfpegvo=T0VuXsPnvo83H3RqwHLE-9Q=dTZKWxnBKMykfJcNA@mail.gmail.com>
Subject: Re: Upcoming: Notifications, FS notifications and fsinfo()
To:     Lennart Poettering <mzxreary@0pointer.de>
Cc:     Karel Zak <kzak@redhat.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>, dray@redhat.com,
        Miklos Szeredi <mszeredi@redhat.com>,
        Steven Whitehouse <swhiteho@redhat.com>,
        Jeff Layton <jlayton@redhat.com>, Ian Kent <raven@themaw.net>,
        andres@anarazel.de, keyrings@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Aleksa Sarai <cyphar@cyphar.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Mar 31, 2020 at 2:25 PM Lennart Poettering <mzxreary@0pointer.de> wrote:
>
> On Di, 31.03.20 10:56, Miklos Szeredi (miklos@szeredi.hu) wrote:
>
> > On Tue, Mar 31, 2020 at 10:34 AM Karel Zak <kzak@redhat.com> wrote:
> > >
> > > On Tue, Mar 31, 2020 at 07:11:11AM +0200, Miklos Szeredi wrote:
> > > > On Mon, Mar 30, 2020 at 11:17 PM Christian Brauner
> > > > <christian.brauner@ubuntu.com> wrote:
> > > >
> > > > > Fwiw, putting down my kernel hat and speaking as someone who maintains
> > > > > two container runtimes and various other low-level bits and pieces in
> > > > > userspace who'd make heavy use of this stuff I would prefer the fd-based
> > > > > fsinfo() approach especially in the light of across namespace
> > > > > operations, querying all properties of a mount atomically all-at-once,
> > > >
> > > > fsinfo(2) doesn't meet the atomically all-at-once requirement.
> > >
> > > I guess your /proc based idea have exactly the same problem...
> >
> > Yes, that's exactly what I wanted to demonstrate: there's no
> > fundamental difference between the two API's in this respect.
> >
> > > I see two possible ways:
> > >
> > > - after open("/mnt", O_PATH) create copy-on-write object in kernel to
> > >   represent mount node -- kernel will able to modify it, but userspace
> > >   will get unchanged data from the FD until to close()
> > >
> > > - improve fsinfo() to provide set (list) of the attributes by one call
> >
> > I think we are approaching this from the wrong end.   Let's just
> > ignore all of the proposed interfaces for now and only concentrate on
> > what this will be used for.
> >
> > Start with a set of use cases by all interested parties.  E.g.
> >
> >  - systemd wants to keep track attached mounts in a namespace, as well
> > as new detached mounts created by fsmount()
> >
> >  - systemd need to keep information (such as parent, children, mount
> > flags, fs options, etc) up to date on any change of topology or
> > attributes.
>
> - We also have code that recursively remounts r/o or unmounts some
>   directory tree (with filters),

Recursive remount-ro is clear.  What is not clear is whether you need
to do this for hidden mounts (not possible from userspace without a
way to disable mount following on path lookup).  Would it make sense
to add a kernel API for recursive setting of mount flags?

What exactly is this unmount with filters?  Can you give examples?

> - We also have code that needs to check if /dev/ is plain tmpfs or
>   devtmpfs. We cannot use statfs for that, since in both cases
>   TMPFS_MAGIC is reported, hence we currently parse
>   /proc/self/mountinfo for that to find the fstype string there, which
>   is different for both cases.

Okay.

Thanks,
Miklos
