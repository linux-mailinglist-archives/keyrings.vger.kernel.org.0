Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 043DD19B104
	for <lists+keyrings@lfdr.de>; Wed,  1 Apr 2020 18:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388279AbgDAQbN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 1 Apr 2020 12:31:13 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:34920 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388272AbgDAQbM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 1 Apr 2020 12:31:12 -0400
Received: by mail-ed1-f66.google.com with SMTP id a20so673037edj.2
        for <keyrings@vger.kernel.org>; Wed, 01 Apr 2020 09:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z5x/eD97YYe+UtsUcQWgKp4y9byY3ksGQkwZWyGAQus=;
        b=lgNDPXVyyGlYNRnOPf26yaHitf7+pqDoEBpBKrgXIVk39xhYHvjpaLoeMlCbYOOH35
         gqP+GsjwCSbvRLr0P1EYmVavLSzF91XZxVs0nTVil4/5vneArq4Br9GvtOwNnp+K84fp
         eeYPrrVySgZo3U4828x7nVKYv0l3frhycdpMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z5x/eD97YYe+UtsUcQWgKp4y9byY3ksGQkwZWyGAQus=;
        b=UMmIxu5L1Yp6PjS6oeOMbyIy1QgaNBX2cAxJaqkfIrOlByk+kV5EM5AkU/AoFT13gw
         zVZBCYeTXPtChwZIaRCP6xWIdRtjd4vGqHqWZHCYEPht4SWoxWjnO+FfXQjP5XC1Dwwj
         JxldxzpAoSIRxV6aUokKHvoKGl52+FrKAGll73dK0sZ2c7BD9kUEFkAoNec98wiVMfYS
         ZC7cijr+XQimN0sxCYMwejAbAo80fvtlMojUqNNHCtVRDyrxj+Uh9xNfBm34CKnLNCWk
         NgmqB6/2GRWCuef2zchtSH52ZGnYkGWJTz0zBKrusn5Wolrk70CsrDPa5TJgh9JegFKA
         4XQg==
X-Gm-Message-State: ANhLgQ08Wp0q72QcsAJKE7fycQ0dv7r/k6tpaQhuz9Q022SDQmf+0EHf
        YH6dfglVVEDV4WvtzO5VJaJe2BTGdTpoqZkK4y2PBg==
X-Google-Smtp-Source: ADFU+vuXSy+WOIY1LRGVIsjX6cs7PxeglKy6P6ZhdJuuMLQsyJawyKskAGhJxAk2Obp0S8U3eefwNGGiUrNlnslw5RY=
X-Received: by 2002:a50:c341:: with SMTP id q1mr22249117edb.247.1585758670968;
 Wed, 01 Apr 2020 09:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAJfpeguu52VuLAzjFH4rJJ7WYLB5ag8y+r3VMb-0bqH8c-uJUg@mail.gmail.com>
 <20200330211700.g7evnuvvjenq3fzm@wittgenstein> <1445647.1585576702@warthog.procyon.org.uk>
 <2418286.1585691572@warthog.procyon.org.uk> <20200401090445.6t73dt7gz36bv4rh@ws.net.home>
 <2488530.1585749351@warthog.procyon.org.uk> <2488734.1585749502@warthog.procyon.org.uk>
 <CAJfpeguLJcAEgx2JWRNcKMkyFTWB0r4wS6F4fJHK3VHtY=EjXQ@mail.gmail.com> <2590276.1585756914@warthog.procyon.org.uk>
In-Reply-To: <2590276.1585756914@warthog.procyon.org.uk>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Wed, 1 Apr 2020 18:30:59 +0200
Message-ID: <CAJfpeguxDiq3BW94AVFhgY75P+jy_+jk3pdyNZ5z-aJPXNvvGA@mail.gmail.com>
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

On Wed, Apr 1, 2020 at 6:02 PM David Howells <dhowells@redhat.com> wrote:
>
> Miklos Szeredi <miklos@szeredi.hu> wrote:
>
> > > > But doesn't actually do what Karel asked for.  show_mountinfo() itself does
> > > > not give you what Karel asked for.
> >
> > Not sure what you mean.  I think it shows precisely the information
> > Karel asked for.
>
> It's not atomic.

Yes it is.

Thanks,
Miklos
