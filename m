Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBB39ABD26
	for <lists+keyrings@lfdr.de>; Fri,  6 Sep 2019 18:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727980AbfIFQAI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 6 Sep 2019 12:00:08 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42013 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727762AbfIFQAH (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 6 Sep 2019 12:00:07 -0400
Received: by mail-lj1-f194.google.com with SMTP id y23so6460462lje.9
        for <keyrings@vger.kernel.org>; Fri, 06 Sep 2019 09:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SLIGvVtM1MWun0WWtqWDQtU9G8VMp6qsOxjP6sOjf2I=;
        b=Ia8xZ4G7EXG0h3CEDdsSAnGPbD1nnF6pet2NWhAAqHOXPjQLBhaQh07F0TSGTC2pQA
         4aORuaabR+7VQbbIPbEwZhlj4N84fOFkTe7F+AH5iR91RRW0/A+v490l9anWhBNdAZMu
         chcmmRDkVHmVtn5FD+klXo/q67grBESatc/HU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SLIGvVtM1MWun0WWtqWDQtU9G8VMp6qsOxjP6sOjf2I=;
        b=BU6B8zsqD2aaQf/F93lVfr6LkuhQfLia9D8O8P84wSdNNwm4/TmFPW1vc+HYw0qYa7
         8YCEQMOdECOLdeY3Dlo1fcRiGgueYYCeT93HOVAKFfhVWPWqsV24KY2lpR30aZLcR2Rs
         /S9jXg5jAa0ajNCx6Z00IqHezQkVUhiA/0KoKdsYtCxs3fUeB7VT9APJNgk0PLVJdqUK
         Ur4sBFwgUFbSH6VLPOVF6gdu+r90LY/qQA1nSmBQ88pI4KcjMzN/Ore1f4twMgNd1l1c
         rdKDNdp3taPhQdE25ajKAIe2Elo28qhkUc1pchwOHSvh4gWajIrQ+RLatF5nYdYLhqtc
         UwVg==
X-Gm-Message-State: APjAAAX1+l3LukGZBlM7LaQQX2KFB48BrXudsD7f7TRoUqND46n2YpE4
        MXn19d7za/Knv6pqq4jx/Ib2tqKRX/k=
X-Google-Smtp-Source: APXvYqz2ynXDQnVa0yLiAhEATF8n2x6kT675rFAdPnOoMNwtZTMZjI2Xw/IT2mhY5GD3jijfTF54PQ==
X-Received: by 2002:a2e:9117:: with SMTP id m23mr6324327ljg.43.1567785605300;
        Fri, 06 Sep 2019 09:00:05 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id w17sm1194934lfl.43.2019.09.06.09.00.04
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2019 09:00:05 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id y23so6146551ljn.5
        for <keyrings@vger.kernel.org>; Fri, 06 Sep 2019 09:00:04 -0700 (PDT)
X-Received: by 2002:a2e:814d:: with SMTP id t13mr6334227ljg.72.1567785205260;
 Fri, 06 Sep 2019 08:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <156763534546.18676.3530557439501101639.stgit@warthog.procyon.org.uk>
 <CAHk-=wh5ZNE9pBwrnr5MX3iqkUP4nspz17rtozrSxs5-OGygNw@mail.gmail.com>
 <17703.1567702907@warthog.procyon.org.uk> <CAHk-=wjQ5Fpv0D7rxX0W=obx9xoOAxJ_Cr+pGCYOAi2S9FiCNg@mail.gmail.com>
 <CAKCoTu7ms_Mr-q08d9XB3uascpzwBa5LF9JTT2aq8uUsoFE8aQ@mail.gmail.com>
 <CAHk-=wjcsxQ8QB_v=cwBQw4pkJg7pp-bBsdWyPivFO_OeF-y+g@mail.gmail.com>
 <5396.1567719164@warthog.procyon.org.uk> <CAHk-=wgbCXea1a9OTWgMMvcsCGGiNiPp+ty-edZrBWn63NCYdw@mail.gmail.com>
 <14883.1567725508@warthog.procyon.org.uk> <CAHk-=wjt2Eb+yEDOcQwCa0SrZ4cWu967OtQG8Vz21c=n5ZP1Nw@mail.gmail.com>
 <27732.1567764557@warthog.procyon.org.uk> <CAHk-=wiR1fpahgKuxSOQY6OfgjWD+MKz8UF6qUQ6V_y2TC_V6w@mail.gmail.com>
In-Reply-To: <CAHk-=wiR1fpahgKuxSOQY6OfgjWD+MKz8UF6qUQ6V_y2TC_V6w@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 6 Sep 2019 08:53:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wioHmz69394xKRqFkhK8si86P_704KgcwjKxawLAYAiug@mail.gmail.com>
Message-ID: <CAHk-=wioHmz69394xKRqFkhK8si86P_704KgcwjKxawLAYAiug@mail.gmail.com>
Subject: Re: Why add the general notification queue and its sources
To:     David Howells <dhowells@redhat.com>
Cc:     Ray Strode <rstrode@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Steven Whitehouse <swhiteho@redhat.com>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        Christian Brauner <christian@brauner.io>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        "Ray, Debarshi" <debarshi.ray@gmail.com>,
        Robbie Harwood <rharwood@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Sep 6, 2019 at 8:35 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> This is why I like pipes. You can use them today. They are simple, and
> extensible, and you don't need to come up with a new subsystem and
> some untested ad-hoc thing that nobody has actually used.

The only _real_ complexity is to make sure that events are reliably parseable.

That's where you really want to use the Linux-only "packet pipe"
thing, becasue otherwise you have to have size markers or other things
to delineate events. But if you do that, then it really becomes
trivial.

And I checked, we made it available to user space, even if the
original reason for that code was kernel-only autofs use: you just
need to make the pipe be O_DIRECT.

This overly stupid program shows off the feature:

        #define _GNU_SOURCE
        #include <fcntl.h>
        #include <unistd.h>

        int main(int argc, char **argv)
        {
                int fd[2];
                char buf[10];

                pipe2(fd, O_DIRECT | O_NONBLOCK);
                write(fd[1], "hello", 5);
                write(fd[1], "hi", 2);
                read(fd[0], buf, sizeof(buf));
                read(fd[0], buf, sizeof(buf));
                return 0;
        }

and it you strace it (because I was too lazy to add error handling or
printing of results), you'll see

    write(4, "hello", 5)                    = 5
    write(4, "hi", 2)                       = 2
    read(3, "hello", 10)                    = 5
    read(3, "hi", 10)                       = 2

note how you got packets of data on the reader side, instead of
getting the traditional "just buffer it as a stream".

So now you can even have multiple readers of the same event pipe, and
packetization is obvious and trivial. Of course, I'm not sure why
you'd want to have multiple readers, and you'd lose _ordering_, but if
all events are independent, this _might_ be a useful thing in a
threaded environment. Maybe.

(Side note: a zero-sized write will not cause a zero-sized packet. It
will just be dropped).

               Linus
