Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC6EB19FA4E
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 18:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729541AbgDFQjr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 12:39:47 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:42934 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729519AbgDFQjr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 12:39:47 -0400
Received: by mail-ed1-f67.google.com with SMTP id cw6so261907edb.9
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fMHiT/Wub3WobBASn8jTrpUwrDr3u4OoR64hK8bb9Ks=;
        b=AfWDLI+z1soflaJhqnVIBl+g08ryFIMdzJqIJa45tvPYBFyKn+PmZgyAKpbs5cJwZl
         9gtU1jadiJkYAbncJSZUPSb1X2kcckqoo15hGsCWmJf/qxcwWTHrb5wLDAA7sDdZ3t6B
         sFkeB7u4W8ywdCcWyLji2espSviyDN/+Gi3rc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fMHiT/Wub3WobBASn8jTrpUwrDr3u4OoR64hK8bb9Ks=;
        b=n3uRYW9NjiHxT018QGTreHQ3yCJzS+zY22/KXd8dcwdB48jVVtpjkgerPQ83VjNyTr
         n54FmaWp0p6FM6RPG290yHBCQgFxJWOkJUkFketmZEo1pYJGuf5b8clU5ySQgXtb7wFI
         7TZPcW6B3TjiFFFWtjuaEGG3ttpxEVQhdxOf9nkwn7fnF402fa/9A39j/ohy7X7BeOP0
         MpenfKxSViSqoVNxB6MLTWfkVtbq3kMpmWwtliFSiqmEWRsOKbEtj9+aRPg7ooVag1b7
         c/jxI21oNg+L3XG2t02TacyFX4+mrutwwNwi9tmXqmIUoqjoFsvkYvi0oY9AqylLHxgH
         1rZw==
X-Gm-Message-State: AGi0PuaoJcODntFS22XOyB4e7rI7C4aegavMzxgsJtp/We4TsW9fQ7gM
        Yui3IICj9o/JiL9KjYEDe4O1VgaNzzc=
X-Google-Smtp-Source: APiQypLubSYexjncTxjW9JVTHe+y6vyPwFQ3cNNoDGIYhy9Hlm+80XvjDlu85iWmBZovIp50ZPR2OA==
X-Received: by 2002:a17:906:52c2:: with SMTP id w2mr340338ejn.117.1586191185340;
        Mon, 06 Apr 2020 09:39:45 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id q1sm2990224ejf.42.2020.04.06.09.39.44
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2020 09:39:45 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id i7so312284edq.3
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 09:39:44 -0700 (PDT)
X-Received: by 2002:a19:7706:: with SMTP id s6mr10019987lfc.31.1586190864915;
 Mon, 06 Apr 2020 09:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAJfpegs3uDzFTE4PCjZ7aZsEh8b=iy_LqO1DBJoQzkP+i4aBmw@mail.gmail.com>
 <2590640.1585757211@warthog.procyon.org.uk> <CAJfpegsXqxizOGwa045jfT6YdUpMxpXET-yJ4T8qudyQbCGkHQ@mail.gmail.com>
 <36e45eae8ad78f7b8889d9d03b8846e78d735d28.camel@themaw.net>
 <CAJfpegsCDWehsTRQ9UJYuQnghnE=M8L0_bJBTTPA+Upu87t90w@mail.gmail.com>
 <27994c53034c8f769ea063a54169317c3ee62c04.camel@themaw.net>
 <20200403111144.GB34663@gardel-login> <CAJfpeguQAw+Mgc8QBNd+h3KV8=Y-SOGT7TB_N_54wa8MCoOSzg@mail.gmail.com>
 <20200403151223.GB34800@gardel-login> <20200403203024.GB27105@fieldses.org> <20200406091701.q7ctdek2grzryiu3@ws.net.home>
In-Reply-To: <20200406091701.q7ctdek2grzryiu3@ws.net.home>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 6 Apr 2020 09:34:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjW735UE+byK1xsM9UvpF2ubh7bCMaAOwz575U7hRCKyA@mail.gmail.com>
Message-ID: <CAHk-=wjW735UE+byK1xsM9UvpF2ubh7bCMaAOwz575U7hRCKyA@mail.gmail.com>
Subject: Re: Upcoming: Notifications, FS notifications and fsinfo()
To:     Karel Zak <kzak@redhat.com>
Cc:     "J. Bruce Fields" <bfields@fieldses.org>,
        Lennart Poettering <mzxreary@0pointer.de>,
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

On Mon, Apr 6, 2020 at 2:17 AM Karel Zak <kzak@redhat.com> wrote:
>
> On Fri, Apr 03, 2020 at 04:30:24PM -0400, J. Bruce Fields wrote:
> >
> > nfs-utils/support/misc/mountpoint.c:check_is_mountpoint() stats the file
> > and ".." and returns true if they have different st_dev or the same
> > st_ino.  Comparing mount ids sounds better.
>
> BTW, this traditional st_dev+st_ino way is not reliable for bind mounts.
> For mountpoint(1) we search the directory in /proc/self/mountinfo.

These days you should probably use openat2() with RESOLVE_NO_XDEV.

No need for any mountinfo or anything like that. Just look up the
pathname and say "don't cross mount-points", and you'll get an error
if it's a mount crossing lookup.

So this kind of thing is _not_ an argument for another kernel querying
interface.  We got a new (and better) model for a lot of this.

              Linus
