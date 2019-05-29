Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA1F32DF6D
	for <lists+keyrings@lfdr.de>; Wed, 29 May 2019 16:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726917AbfE2OQi (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 29 May 2019 10:16:38 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:36738 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbfE2OQi (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 29 May 2019 10:16:38 -0400
Received: by mail-ot1-f68.google.com with SMTP id c3so2186454otr.3
        for <keyrings@vger.kernel.org>; Wed, 29 May 2019 07:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LPIxbFckpmqavIl60mnhGb6C8rcrkiaOP2OfEidBo5E=;
        b=PRVorFm2Okq9hP5kqFH4ZiGr/E/Zu5eJY3MGXXFHxfdpmEdO3GutJJMHvfi09HYlYk
         SnDTz9Jq0D6SvbjJsXUxw5SPAGf64dGBdkqzG7gBAtOGooyMlAvl8mmczoLi90evYR0A
         PoHHqSU1LxoqR2wdSfJkTL18f/IZSr+Mc0D+armTgiJNv2KbxIbIGzPnKannBmXr5ZoL
         onXscwCND5pzd7qsQ+4DRiaG4VALoZaDIZlGVD+Au9+DrLehAtdeFUdLTVj+n3sjvpTd
         19cYxGogHm6iK4AXItVQ8hkyokyg4Cjwng+d2g0cb8MTYxZRlHB62qmC+BHhUJPQbJyg
         MxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LPIxbFckpmqavIl60mnhGb6C8rcrkiaOP2OfEidBo5E=;
        b=q8b2OXy5YBie20dT829izcr0ZBIVFoN123PdbTa6tRJIXi4yUC6yCcFG+lbuPFOv9l
         0iDpmrcjvJ83F9yDACvLS+JyFsAq/P0NLUW1oWqy+X2jQ3CL9jW08uJau0OJEDTAlk8Z
         LLZkJoDQDprseVGgU2EFuQIANS8wZdHqD4jdFifMbmPOKLXP+h3m4fvJXtLdwH37oh72
         czwRyXkW7Gc2Fxy7sFjl1myPBal+WWnf5nDN5Oo9UHhzocwDpBNwIjuWd5AiM4jWlhOl
         M6mWkKSsBaMoz6eqNHeOFcMe/rs0xNN0YL/3v8sOpsfNqfFdNP3GmRwlokdqJIpF9hGU
         OFOA==
X-Gm-Message-State: APjAAAUZwYUA8rKj1K0ptNiGLkqASJqoCiyPEnZ48ndBf1YW2IIHDAt+
        s5buegel5FbdDBmjlv+1QhO5jB2DZP0cWjkw5zcY5Tm1Uvk=
X-Google-Smtp-Source: APXvYqwFTJrhrhEsjfOGtxnb29he2Fqyf9z7Tcu+GzobGgP0NfT3JF16fdsQq+/5jwCnLYlKlqDC3v5fUc8xIPyeFeo=
X-Received: by 2002:a9d:7f8b:: with SMTP id t11mr37188otp.110.1559139396903;
 Wed, 29 May 2019 07:16:36 -0700 (PDT)
MIME-Version: 1.0
References: <155905930702.7587.7100265859075976147.stgit@warthog.procyon.org.uk>
 <155905934373.7587.10824503964531598726.stgit@warthog.procyon.org.uk>
 <CAG48ez2o1egR13FDd3=CgdXP_MbBsZM4SX=+aqvR6eheWddhFg@mail.gmail.com> <24577.1559134719@warthog.procyon.org.uk>
In-Reply-To: <24577.1559134719@warthog.procyon.org.uk>
From:   Jann Horn <jannh@google.com>
Date:   Wed, 29 May 2019 16:16:10 +0200
Message-ID: <CAG48ez0Ugv=cfj-v6DaYma0HgyiBjpykSkCr7mCAcMx13LEncg@mail.gmail.com>
Subject: Re: [PATCH 4/7] vfs: Add superblock notifications
To:     David Howells <dhowells@redhat.com>
Cc:     Al Viro <viro@zeniv.linux.org.uk>, raven@themaw.net,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        linux-block@vger.kernel.org, keyrings@vger.kernel.org,
        linux-security-module <linux-security-module@vger.kernel.org>,
        kernel list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, May 29, 2019 at 2:58 PM David Howells <dhowells@redhat.com> wrote:
> Jann Horn <jannh@google.com> wrote:
> > It might make sense to require that the path points to the root inode
> > of the superblock? That way you wouldn't be able to do this on a bind
> > mount that exposes part of a shared filesystem to a container.
>
> Why prevent that?  It doesn't prevent the container denizen from watching a
> bind mount that exposes the root of a shared filesystem into a container.

Well, yes, but if you expose the root of the shared filesystem to the
container, the container is probably meant to have a higher level of
access than if only a bind mount is exposed? But I don't know.

> It probably makes sense to permit the LSM to rule on whether a watch may be
> emplaced, however.

We should have some sort of reasonable policy outside of LSM code
though - the kernel should still be secure even if no LSMs are built
into it.

> > > +                       }
> > > +               }
> > > +               up_write(&s->s_umount);
> > > +               if (ret < 0)
> > > +                       kfree(watch);
> > > +       } else if (s->s_watchers) {
> >
> > This should probably have something like a READ_ONCE() for clarity?
>
> Note that I think I'll rearrange this to:
>
>         } else {
>                 ret = -EBADSLT;
>                 if (s->s_watchers) {
>                         down_write(&s->s_umount);
>                         ret = remove_watch_from_object(s->s_watchers, wqueue,
>                                                        s->s_unique_id, false);
>                         up_write(&s->s_umount);
>                 }
>         }
>
> I'm not sure READ_ONCE() is necessary, since s_watchers can only be
> instantiated once and the watch list then persists until the superblock is
> deactivated.  Furthermore, by the time deactivate_locked_super() is called, we
> can't be calling sb_notify() on it as it's become inaccessible.
>
> So if we see s->s_watchers as non-NULL, we should not see anything different
> inside the lock.  In fact, I should be able to rewrite the above to:
>
>         } else {
>                 ret = -EBADSLT;
>                 wlist = s->s_watchers;
>                 if (wlist) {
>                         down_write(&s->s_umount);
>                         ret = remove_watch_from_object(wlist, wqueue,
>                                                        s->s_unique_id, false);
>                         up_write(&s->s_umount);
>                 }
>         }

I'm extremely twitchy when it comes to code like this because AFAIK
gcc at least used to sometimes turn code that read a value from memory
and then used it multiple times into something with multiple memory
reads, leading to critical security vulnerabilities; see e.g. slide 36
of <https://www.blackhat.com/docs/us-16/materials/us-16-Wilhelm-Xenpwn-Breaking-Paravirtualized-Devices.pdf>.
I am not aware of any spec that requires the compiler to only perform
one read from the memory location in code like this.
