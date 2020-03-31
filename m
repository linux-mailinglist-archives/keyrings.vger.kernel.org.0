Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B59E198B90
	for <lists+keyrings@lfdr.de>; Tue, 31 Mar 2020 07:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbgCaFLZ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 31 Mar 2020 01:11:25 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33416 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725809AbgCaFLY (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 31 Mar 2020 01:11:24 -0400
Received: by mail-ed1-f68.google.com with SMTP id z65so23645084ede.0
        for <keyrings@vger.kernel.org>; Mon, 30 Mar 2020 22:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=181xT05kF3H0VD4f8J7xShi9xZwvoRHrcpvFBQLeEIA=;
        b=m3IgsGGZrBgakxVw5if3yzczNN+msQw/g4O9F81ImNkKRl6IR0dPN9pgwGDudyXoFD
         wIWE3Xb4wifN6VLA2/4V2jQdkh5DWnfWy9gEgEbaIM2wokowxXNZoF3v4dB085lzm0sT
         cxBvjCc7bpBAb5dgoCxTIjslzsJDa+Q/lTfFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=181xT05kF3H0VD4f8J7xShi9xZwvoRHrcpvFBQLeEIA=;
        b=Vdri1h91Vf8RJ3cS2cXZ3nIdqbHMNLT+ieJkauMZ2QLsRCy/iAYy1t5VuBm3fkWChw
         RHsG9315ANUaSu13TBYPyvrUFu+SroUowY2RoZlEIDcw8rjYuvx7HMHfk1FcR/lPJX2L
         /mHWL+8z1Z4W7URaLhEEED8/uEE4Yrg539vY5skL7g+fZ+wNmqxLMws2jev6+OZZk1C0
         eVH+6JZA63kOPaFHcb//OGtsA5ORHnJlrDCR44prZaND6ZB3PzOYZOUQU9GdsodPboiG
         /gcPqXMDj8fL6ZU+YIb92ga8wQ4D4wbH/rghcQs1dhT+D9dg6f52Gh78Lj+oOctI/RQA
         WBNA==
X-Gm-Message-State: ANhLgQ3N+FWL5Qhws15MeWQXpNiFjyPGI9+5Au4UFOUV87jetslz5Frs
        0vTlv7NJqbdN3MuNim+fQPRYR0Nzvg37uPpqn7ErvA==
X-Google-Smtp-Source: ADFU+vujD3XRyzE2A6P8XAJLarFPpIUeWPjGW5jTzW/mvrFUEb88BGcaM3HywgE+474EUtqBVDyCkVg3I0Aj9RVfp1g=
X-Received: by 2002:a17:906:9ca:: with SMTP id r10mr13543753eje.151.1585631482578;
 Mon, 30 Mar 2020 22:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <1445647.1585576702@warthog.procyon.org.uk> <20200330211700.g7evnuvvjenq3fzm@wittgenstein>
In-Reply-To: <20200330211700.g7evnuvvjenq3fzm@wittgenstein>
From:   Miklos Szeredi <miklos@szeredi.hu>
Date:   Tue, 31 Mar 2020 07:11:11 +0200
Message-ID: <CAJfpegtjmkJUSqORFv6jw-sYbqEMh9vJz64+dmzWhATYiBmzVQ@mail.gmail.com>
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

On Mon, Mar 30, 2020 at 11:17 PM Christian Brauner
<christian.brauner@ubuntu.com> wrote:

> Fwiw, putting down my kernel hat and speaking as someone who maintains
> two container runtimes and various other low-level bits and pieces in
> userspace who'd make heavy use of this stuff I would prefer the fd-based
> fsinfo() approach especially in the light of across namespace
> operations, querying all properties of a mount atomically all-at-once,

fsinfo(2) doesn't meet the atomically all-at-once requirement.  Sure,
it's possible to check the various change counters before and after a
batch of calls to check that the result is consistent.  Still, that's
not an atomic all-at-once query, if you'd really require that, than
fsinfo(2) as it currently stands would be inadequate.

> and safe delegation through fds. Another heavy user of this would be
> systemd (Cced Lennart who I've discussed this with) which would prefer
> the fd-based approach as well. I think pulling this into a filesystem
> and making userspace parse around in a filesystem tree to query mount
> information is the wrong approach and will get messy pretty quickly
> especially in the face of mount and user namespace interactions and
> various other pitfalls.

Have you actually looked at my proposed patch?   Do you have concrete
issues or just vague bad feelings?

Thanks,
Miklos
