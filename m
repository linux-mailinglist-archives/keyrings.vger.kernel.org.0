Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 320481F7E78
	for <lists+keyrings@lfdr.de>; Fri, 12 Jun 2020 23:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgFLVio (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 12 Jun 2020 17:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726268AbgFLVin (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 12 Jun 2020 17:38:43 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A36C03E96F
        for <keyrings@vger.kernel.org>; Fri, 12 Jun 2020 14:38:43 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id x1so11482997ejd.8
        for <keyrings@vger.kernel.org>; Fri, 12 Jun 2020 14:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pL7avKA2KDNOM9X/kgFl9MqbEPb7aiLKYA3rHavzFAQ=;
        b=DUXfZ05dc4FLn033pP/DvBQEoDqo9l9I/qr+GeWTXdccy9NPuiJFBm8tJ6Ag/uVtPs
         HfhkXSv/7Jz63j3e9CKigwf5GeXP332/vjJYhT7vhVEnuBNN/DA1L+yF7svDbU0axGyW
         OJ7DBcOv91xpWm6tDakYfFrQRMOPXMXKekM4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pL7avKA2KDNOM9X/kgFl9MqbEPb7aiLKYA3rHavzFAQ=;
        b=o0A8nQHuBtwcrxzhH6mciYBCrWtVaR9D9UoD4DbP7kLIKjmFXFdDbVjUnne6x2+3Lt
         6unD/3IiQahudroJvU/yzECPF3HKiHdNPCXu5mqWAJyknx2L5RLLpAguhG902C1qTQc+
         vcHD1QWHe3UyI/JucP9knlRiK3rVnw4Fje4hNF06BOdc/rjoj3XqIzzA7eAeV5jkbA+f
         hlX1/jcLXeDmvuWJ0a0ToTtgQjFA/MjvLT9eumhZMYaqBNv2l4FmJ1uxkq/e/hnG/1UR
         TG4keT4xg6nRh8wSTzTJjjKJLihdrzzVQOe8Gg0XMS7s4pYjwLlz8ZDXP2CGjGtBxCbB
         zV8w==
X-Gm-Message-State: AOAM533URFgb4tlKq/xWeWATFHMVQRvJaFLZbDoWwi+Gbh5jdZRz6ZXu
        3y17MLtP1+JjAYrz6IMGVPGVLMmnDyw=
X-Google-Smtp-Source: ABdhPJxG/fD6LhsX8EV+EEdUXeLXiHMyw1lnpGhRaKcvfizJRcF6gO2qRqiCHF9iOC+F+4Vr4tEyog==
X-Received: by 2002:a17:906:d791:: with SMTP id pj17mr14851409ejb.352.1591997920807;
        Fri, 12 Jun 2020 14:38:40 -0700 (PDT)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com. [209.85.221.42])
        by smtp.gmail.com with ESMTPSA id k23sm4163640ejo.120.2020.06.12.14.38.40
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2020 14:38:40 -0700 (PDT)
Received: by mail-wr1-f42.google.com with SMTP id c3so11360128wru.12
        for <keyrings@vger.kernel.org>; Fri, 12 Jun 2020 14:38:40 -0700 (PDT)
X-Received: by 2002:a2e:974e:: with SMTP id f14mr7467995ljj.102.1591997578744;
 Fri, 12 Jun 2020 14:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <1503686.1591113304@warthog.procyon.org.uk> <20200610111256.s47agmgy5gvj3zwz@ws.net.home>
In-Reply-To: <20200610111256.s47agmgy5gvj3zwz@ws.net.home>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 12 Jun 2020 14:32:42 -0700
X-Gmail-Original-Message-ID: <CAHk-=whypJLi6T01HOZ5+UPe_rs+hft8wn6iOmQpZgbZzbAumA@mail.gmail.com>
Message-ID: <CAHk-=whypJLi6T01HOZ5+UPe_rs+hft8wn6iOmQpZgbZzbAumA@mail.gmail.com>
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

[ Finally getting around to this since my normal pull queue is now empty ]

On Wed, Jun 10, 2020 at 4:13 AM Karel Zak <kzak@redhat.com> wrote:
>
> The notification stuff looks pretty promising, but I do not understand
> why we need to use pipe for this purpose

The original intent was never to use the "pipe()" system call itself,
only use pipes as the actual transport mechanism (because I do not for
a second believe in the crazy "use sockets" model that a lot of other
people seem to blindly believe in).

But using "pipe()" also allows for non-kernel notification queues (ie
where the events come from a user space process). Then you'd not use
O_NOTIFICATION_PIPE, but O_DIRECT (for a packetized pipe).

> Is it because we need to create a new file descriptor from nothing?
> Why O_NOTIFICATION_PIPE is better than introduce a new syscall
> notifyfd()?

We could eventually introduce a new system call.

But I most definitely did *NOT* want to see anything like that for any
first gen stuff.  Especially since it wasn't clear who was going to
use it, and whether early trials would literally be done with that
user-space emulation model of using a perfectly regular pipe (just
with packetization).

I'm not even convinced O_NOTIFICATION_PIPE is necessary, but at worst
it will be a useful marker. I think the only real reason for it was to
avoid any clashes with splice(), which has more complex use of the
pipe buffers.

I'm so far just reading this thread and the arguments for users, and I
haven't yet looked at all the actual details in the pull request - but
last time I had objections to things it wasn't the code, it was the
lack of any use.

             Linus
