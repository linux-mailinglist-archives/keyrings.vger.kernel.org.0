Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B29A19C5C7
	for <lists+keyrings@lfdr.de>; Thu,  2 Apr 2020 17:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389280AbgDBPYq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 2 Apr 2020 11:24:46 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33487 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388740AbgDBPYp (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 2 Apr 2020 11:24:45 -0400
Received: by mail-ed1-f65.google.com with SMTP id z65so4726457ede.0
        for <keyrings@vger.kernel.org>; Thu, 02 Apr 2020 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4F5ZdY7baHRX9p1mTWpG9zxWusymLcEOqLCXOssAIBU=;
        b=g5rhf8VkZbZjmtrRA9uLq+eA6cn4w30V1Ydtp66keVrraQ5KdoMysqFdqvimk1mNmg
         BBluexcPEK9BqCC/QnMInSRmAeekeaRQk3fsGNB15QPtBRvrJixiWXRDlXjAAx9dX4VF
         hYKeF2UPxxfG/Z8TROG7OTJWLZk7IvAaYBicE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4F5ZdY7baHRX9p1mTWpG9zxWusymLcEOqLCXOssAIBU=;
        b=ZIqG7bapafP0YtAsu62ZlfQCK//cCpvsVa3VXf8+2plhGqJljsAvbsQP+7y5zH4C4U
         WDIwGn6/g4D5li4RDT4tRODdOJIYavCH4zHV2sdF+FWJAzEPn5Ogv0tVA0RDv+V9wy1f
         yeN4B9oAxUYMEItKy8N7/L691GDcN1gB01v69rITMw443pLIlykHTN2vKxDoJ0BHVQq8
         qXRNrcSG5D3dHg5kTDnW3p/mTfmjEG6I7GSGXIjUR3eoWinTuAy/yusIt605OOK29GNs
         eFLB+1mXwZenElHo/rzTyBXCUReE0eTCaFD54emMXsVVM+ruwhqG+VUmHHExpHcUxza4
         SPpg==
X-Gm-Message-State: AGi0PuYFtqMas+4PDDw9Nvf7/iyeof5SVzMSfN12gm0aVk47xlwT0Qbf
        +83i8vQ3nrYBOeB+6bBgDh9CfYRtxuf/kgA2L4x0gw==
X-Google-Smtp-Source: APiQypKALy3IUYlnKiBfpTwp+9vi6ZR4LdZdo5HC7HfpoPYCDQL8peS420WXQe1UMt0CcEPpeyGkmutc90yHAqvyJdE=
X-Received: by 2002:a50:8326:: with SMTP id 35mr3485075edh.134.1585841083892;
 Thu, 02 Apr 2020 08:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAJfpeguu52VuLAzjFH4rJJ7WYLB5ag8y+r3VMb-0bqH8c-uJUg@mail.gmail.com>
 <20200330211700.g7evnuvvjenq3fzm@wittgenstein> <1445647.1585576702@warthog.procyon.org.uk>
 <2418286.1585691572@warthog.procyon.org.uk> <20200401090445.6t73dt7gz36bv4rh@ws.net.home>
 <2488530.1585749351@warthog.procyon.org.uk> <2488734.1585749502@warthog.procyon.org.uk>
 <CAJfpeguLJcAEgx2JWRNcKMkyFTWB0r4wS6F4fJHK3VHtY=EjXQ@mail.gmail.com>
 <2590276.1585756914@warthog.procyon.org.uk> <CAJfpeguxDiq3BW94AVFhgY75P+jy_+jk3pdyNZ5z-aJPXNvvGA@mail.gmail.com>
 <3070724.1585840971@warthog.procyon.org.uk>
In-Reply-To: <3070724.1585840971@warthog.procyon.org.uk>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Thu, 2 Apr 2020 17:24:32 +0200
Message-ID: <CAJfpegv4=wAi+mH32pHM9g8gk+JGESWa25n04BwfnkhVBf=3rA@mail.gmail.com>
Subject: Re: Upcoming: Notifications, FS notifications and fsinfo()
To:     David Howells <dhowells@redhat.com>
Cc:     Karel Zak <kzak@redhat.com>,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>, dray@redhat.com,
        Miklos Szeredi <mszeredi@redhat.com>,
        Steven Whitehouse <swhiteho@redhat.com>,
        Jeff Layton <jlayton@redhat.com>, Ian Kent <raven@themaw.net>,
        andres@anarazel.de, keyrings@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        Lennart Poettering <lennart@poettering.net>,
        Aleksa Sarai <cyphar@cyphar.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Apr 2, 2020 at 5:23 PM David Howells <dhowells@redhat.com> wrote:
>
> Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> > > > Not sure what you mean.  I think it shows precisely the information
> > > > Karel asked for.
> > >
> > > It's not atomic.
> >
> > Yes it is.
>
> No, it really isn't - though it could be made so.
>
> ext4_show_mount(), for example, doesn't lock against "mount -o remount", so
> the configuration can be changing whilst it's being rendered to text.

Does s_umount nest inside namespace_sem?  I really don't see the
relation of those locks.

Thanks,
Miklos
