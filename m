Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7058E198E9E
	for <lists+keyrings@lfdr.de>; Tue, 31 Mar 2020 10:35:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726299AbgCaIfJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 31 Mar 2020 04:35:09 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43405 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729624AbgCaIfJ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 31 Mar 2020 04:35:09 -0400
Received: by mail-ed1-f65.google.com with SMTP id bd14so24041099edb.10
        for <keyrings@vger.kernel.org>; Tue, 31 Mar 2020 01:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2rLFubCEpgldKurlG4URIBkpTK5CEAUrKTvEkFewMCc=;
        b=Pl6wunnFAOyFrLjRF4MLa/729tmRbfvLqvNbOMvx8XQPOctWtryQtH04K/E5S2+qBC
         ePAeM6bPzByKY90dlYOUaqZEo+JcCIjCXbWPFBl4qB4tZM4goBwE/hSdS3js5G4lNwXl
         urTXdaybd2HhJ+bGwiYNbcuzzErWv5XyrqZ9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2rLFubCEpgldKurlG4URIBkpTK5CEAUrKTvEkFewMCc=;
        b=hCgo1F0qT28qUaXDioNHHpApzUXBduk9ns8rKdW855UL+uI3SUrXWJenN6oS3dW5s4
         tkfiMLQ6bXV64E0nSx/IlXTltN5r7ATeMZLMDs/vxtuDh6aNMQFRL7VuU+hr2jqziR9d
         BtHEXTMIeWvilzLgPsUSirJ7kY5RbwRt8zRawHRcyO/VhpQju0JveXnZlyX6aZIchEru
         i5y6sv53oTe3JlDLZ6lxRrBNq/OtiL7YnC20MrrKbXnT6ypLZwqd0vEfOrrvSiefqcIN
         qaJEXDDAgNTl4wByUGiIFvqouo8SP8Ddi2lc4IZKgpVy9kYrj2bkHuk6UUyPGf0q4nTr
         SdLg==
X-Gm-Message-State: ANhLgQ0eGvci2lcIoOFrftLbOb49gSO7NRBbB4w6DVNHD9i/iarP+n5B
        IcqdvbhESw+NRE6WTqxfFqeAWfONxXk8tkRKMTg2PA==
X-Google-Smtp-Source: ADFU+vtv+tXPNHXP7ARcHQpTkYalP7cBmBf5/XjaaCBBR2f6V6HnH9gs6cBg/IlbBfMiOag3DlBSeZGOqpzpLteyY6k=
X-Received: by 2002:a17:906:6545:: with SMTP id u5mr5686172ejn.27.1585643707995;
 Tue, 31 Mar 2020 01:35:07 -0700 (PDT)
MIME-Version: 1.0
References: <1445647.1585576702@warthog.procyon.org.uk> <20200330211700.g7evnuvvjenq3fzm@wittgenstein>
 <CAJfpegtjmkJUSqORFv6jw-sYbqEMh9vJz64+dmzWhATYiBmzVQ@mail.gmail.com> <20200331081507.f6an4x32cxwpxdpd@wittgenstein>
In-Reply-To: <20200331081507.f6an4x32cxwpxdpd@wittgenstein>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Tue, 31 Mar 2020 10:34:56 +0200
Message-ID: <CAJfpegsR7Vx1F0DNzoR0=SdNyuT02SWwO5wQRJtiKq_SOv71kw@mail.gmail.com>
Subject: Re: Upcoming: Notifications, FS notifications and fsinfo()
To:     Christian Brauner <christian.brauner@ubuntu.com>
Cc:     David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Al Viro <viro@zeniv.linux.org.uk>, dray@redhat.com,
        Karel Zak <kzak@redhat.com>,
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

On Tue, Mar 31, 2020 at 10:15 AM Christian Brauner
<christian.brauner@ubuntu.com> wrote:
>
> On Tue, Mar 31, 2020 at 07:11:11AM +0200, Miklos Szeredi wrote:
> > On Mon, Mar 30, 2020 at 11:17 PM Christian Brauner
> > <christian.brauner@ubuntu.com> wrote:
> >
> > > Fwiw, putting down my kernel hat and speaking as someone who maintains
> > > two container runtimes and various other low-level bits and pieces in
> > > userspace who'd make heavy use of this stuff I would prefer the fd-based
> > > fsinfo() approach especially in the light of across namespace
> > > operations, querying all properties of a mount atomically all-at-once,
> >
> > fsinfo(2) doesn't meet the atomically all-at-once requirement.  Sure,
> > it's possible to check the various change counters before and after a
> > batch of calls to check that the result is consistent.  Still, that's
> > not an atomic all-at-once query, if you'd really require that, than
> > fsinfo(2) as it currently stands would be inadequate.
>
> It at all that's only true for batch requests.

For example, there's no way to atomically query mount flags, parent,
and list of children with a single fsinfo() call, you actually need
three calls and they can reflect different states of the same mount.
Not saying this is a problem, just that there's no list of
requirements on what is needed and why.

> > > and safe delegation through fds. Another heavy user of this would be
> > > systemd (Cced Lennart who I've discussed this with) which would prefer
> > > the fd-based approach as well. I think pulling this into a filesystem
> > > and making userspace parse around in a filesystem tree to query mount
> > > information is the wrong approach and will get messy pretty quickly
> > > especially in the face of mount and user namespace interactions and
> > > various other pitfalls.
> >
> > Have you actually looked at my proposed patch?   Do you have concrete
>
> Yes. So have others, Al actively disliked and nacked it and no-one got
> excited about it.

Al, as far as I remember, nacked several things the patch was doing.
I fixed those.

> > issues or just vague bad feelings?
>
> We have had that discussion on-list where I made my "vague bad feelings"
> clear where you responded with the same dismissive style so I don't see
> the point in repeating this experience.
>
> Again, I want to make it clear that here I'm stating my preference as a
> user of this api and as such I don't want to have to parse through a
> filesystem to get complex information about filesystems. We've had
> fruitful discussions [1] around how fsinfo() ties in with supervised
> mounts and the rest of the mount api and its clear and simple especially
> in the face of namespaces and implements a nice delegation model. So +1
> from me.

And you keep ignoring the fact that my patch implements that exact
same delegation model.  That's why I'm asking if you have looked at it
or not.

The "I don't want to have to parse through a filesystem to get complex
information about filesystems" is not a set of requirements that an
API can be designed from.

Thanks,
Miklos
