Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 009D01F7EA9
	for <lists+keyrings@lfdr.de>; Sat, 13 Jun 2020 00:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgFLWBd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 12 Jun 2020 18:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLWBa (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 12 Jun 2020 18:01:30 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 789C8C03E96F
        for <keyrings@vger.kernel.org>; Fri, 12 Jun 2020 15:01:29 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id d7so6272661lfi.12
        for <keyrings@vger.kernel.org>; Fri, 12 Jun 2020 15:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JWYJp5nNaxwsgKcZ1Z6bBPv+CeaisGshv5pM/NlGa8g=;
        b=iGB7pNOJkr6LRcHMfXc8Hc5bgDWNnC9dhToyz0MVwqn+5ZDrq4FXB5hkdU+1LIx/wY
         29BCG06xc7ngZQKzimY3IdOfI1AOPkYaI0qAzWHwrDzGuh5uZPT59r9N9W8aG0jjBok4
         wPUVKZCV++VNxKinJaOsg6Y3DzKn42vwmy34o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JWYJp5nNaxwsgKcZ1Z6bBPv+CeaisGshv5pM/NlGa8g=;
        b=t3C5yg1n/qceI80SYfsB92aMc7T3fL16B9VTBrleN9bCod/mJmLjZ1LYig1aHPsTh5
         2wTSNBVcl3JRYSvi8eNsqC0YmXBJoaNCp7P+cZqRBzta8FhCkfY+kPxMz1sAVx9qnXhy
         yEPKRBPIsUnb/ReUlrZVTswHS3TrbSUc8HSNYeQ91sIwof8SUHKvg6Q7RanCza6lOgFT
         SQ3ZaD8NqHGrRN2otHdZiBRU3dYHbFVCw8JSa1lbe6l0vKu+bAy1YFf8SHvd1pk+jUQ0
         2EUIgpC2J7IHXl7McWupdfNxoSlg3P5C9rEBJIoY6LQEKKAPAXZF1CI2fWZ5WHqsRI+D
         g+tw==
X-Gm-Message-State: AOAM533948Q3+smDpQOuxSoXCg6g/imz3e8GWQ2SxNJKwqkGOKFaHFU9
        ZD/IoSk+iwWLe3eD8IbQ+IWPatftAsA=
X-Google-Smtp-Source: ABdhPJxZtNb24fWvUfOEkbbx3c8/BiBf9x96GWERaVBLY6jG/c1EZGESaE8oCJGeOLozJklNw8e2wg==
X-Received: by 2002:ac2:48b7:: with SMTP id u23mr8008711lfg.86.1591999287998;
        Fri, 12 Jun 2020 15:01:27 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id g12sm2053049ljl.33.2020.06.12.15.01.27
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 15:01:27 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id z206so6297118lfc.6
        for <keyrings@vger.kernel.org>; Fri, 12 Jun 2020 15:01:27 -0700 (PDT)
X-Received: by 2002:a19:6a0e:: with SMTP id u14mr7689820lfu.192.1591999286926;
 Fri, 12 Jun 2020 15:01:26 -0700 (PDT)
MIME-Version: 1.0
References: <1503686.1591113304@warthog.procyon.org.uk> <20200610111256.s47agmgy5gvj3zwz@ws.net.home>
In-Reply-To: <20200610111256.s47agmgy5gvj3zwz@ws.net.home>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 12 Jun 2020 15:01:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjUP6WmngGq70GFKrtDp5Z9mkqORtBD2uStp2p_H-nzqA@mail.gmail.com>
Message-ID: <CAHk-=wjUP6WmngGq70GFKrtDp5Z9mkqORtBD2uStp2p_H-nzqA@mail.gmail.com>
Subject: Re: [GIT PULL] General notification queue and key notifications
To:     Karel Zak <kzak@redhat.com>
Cc:     David Howells <dhowells@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>, dray@redhat.com,
        Miklos Szeredi <mszeredi@redhat.com>,
        Steven Whitehouse <swhiteho@redhat.com>,
        Jeff Layton <jlayton@redhat.com>, Ian Kent <raven@themaw.net>,
        andres@anarazel.de,
        Christian Brauner <christian.brauner@ubuntu.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        keyrings@vger.kernel.org,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

[ Actually going through the code now ]

On Wed, Jun 10, 2020 at 4:13 AM Karel Zak <kzak@redhat.com> wrote:
>
> All the next operations are done with "fd". It's nowhere used as a
> pipe, and nothing uses pipefd[1].

As an aside, that isn't necessarily true.

In some of the examples, pipefd[1] is used for configuration (sizing
and adding filters), although I think right now that's not really
enforced, and other examples seem to have pipefd[0] do that too.

DavidH: should that perhaps be a hard rule, so that you can pass a
pipefd[0] to readers, while knowing that they can't then change the
kinds of notifications they see.

In the "pipe: Add general notification queue support" commit message,
the code example uses pipefd[0] for IOC_WATCH_QUEUE_SET_SIZE, but then
in the commit message for "watch_queue: Add a key/keyring notification
facility" it uses pipefd[1].

And that latter example does make sense: using the write-side
pipefd[1] for configuration, while the read-side pipefd[0] is the side
that sees the results. That is also how it would work if you have a
user-mode pipe with the notification source controlling the writing
side - the reading side can obviously not add filters or change the
semantics of the watches.

So that allows a trusted side to add and create filters, while some
untrusted entity can then see the results.

This isn't going to hold up me merging the code, but it would be good
to clarify and make that something that gets enforced if we decide
it's worth it.

It does seem conceptually like a good idea, and potentially actually
useful to clearly separate the domain of "you can add watches and
filters" from "you can see the notifications".

               Linus
