Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F056DE3E2D
	for <lists+keyrings@lfdr.de>; Thu, 24 Oct 2019 23:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbfJXVaP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 24 Oct 2019 17:30:15 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44591 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729258AbfJXVaP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 24 Oct 2019 17:30:15 -0400
Received: by mail-lj1-f195.google.com with SMTP id c4so225763lja.11
        for <keyrings@vger.kernel.org>; Thu, 24 Oct 2019 14:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h5FP/voiQdxeaQU3Va8HH5cRZmi1OHTMwBKcRrrOo6E=;
        b=G+CKE+0sNMbBuosjchwhgzz8NQwfbV/8kKBYcW1zgIA+wCHZXB0W4xnrddKNkrujly
         nBXQf8TMFFxtwDaqAlubm1WQBu/DIP2jq0ClHTeKxpnxD8j4n3vqHGpl41RLHFrD0jXc
         jfdzDY5G/0JxiPvAj8Pc7cihC14c7Kl2f6hiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h5FP/voiQdxeaQU3Va8HH5cRZmi1OHTMwBKcRrrOo6E=;
        b=HZOPVTdkbd4PWClMbquqjc2uMmm/DGloypOZqbp8ChfJ4gqmO5XrmaVuzmMjqDXCAI
         V6/pgZZ7jcfnP8+B/ilcAet1EL2sCvr8KThe6jd+yrsp8zYHng6zbvPxJPkOrWa87KWl
         vphHlxGJ8s8jxQoHjp5oicj40CflFUUuToc3yPf/djyXyjE55ISkvj5p85bNlFzgqkf5
         hewOWrW211S/U/ps6G1brALY+PCnTOav9hHAID0sAqUtye6jfP6HtgmaYgBUtgx1fRz+
         tDjxsPIV3DbSAaxj+i649+3INjFwQSJbjlCkewsbJ6vaoet8ISA6tzR7w1nRE7UekTYP
         H66g==
X-Gm-Message-State: APjAAAU6NIePkkRuI6BzUBgmA571kflYcQpqjC8rlUz31YOOlbrUqC2x
        P4cYkJF7unjLPRE+t/yZehh9eMWqVAy2rA==
X-Google-Smtp-Source: APXvYqzwh9hkxLo3avny7f+ApHUR3rCKj9BizymZj50NOpO7aN4ZSgoUYcRg/zJ/uMQN9lINSyk6fQ==
X-Received: by 2002:a2e:b0c9:: with SMTP id g9mr2943958ljl.95.1571952610364;
        Thu, 24 Oct 2019 14:30:10 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id e17sm10799830ljj.104.2019.10.24.14.30.08
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 14:30:08 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id f5so246871ljg.8
        for <keyrings@vger.kernel.org>; Thu, 24 Oct 2019 14:30:08 -0700 (PDT)
X-Received: by 2002:a05:651c:331:: with SMTP id b17mr3303284ljp.133.1571952607809;
 Thu, 24 Oct 2019 14:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <157186182463.3995.13922458878706311997.stgit@warthog.procyon.org.uk>
 <30394.1571936252@warthog.procyon.org.uk>
In-Reply-To: <30394.1571936252@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 24 Oct 2019 17:29:51 -0400
X-Gmail-Original-Message-ID: <CAHk-=wiMho2AhcTWC3-3zGK7639XL9UT=AheMXY0pxGHDACn6g@mail.gmail.com>
Message-ID: <CAHk-=wiMho2AhcTWC3-3zGK7639XL9UT=AheMXY0pxGHDACn6g@mail.gmail.com>
Subject: Re: [RFC PATCH 11/10] pipe: Add fsync() support [ver #2]
To:     David Howells <dhowells@redhat.com>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Nicolas Dichtel <nicolas.dichtel@6wind.com>, raven@themaw.net,
        Christian Brauner <christian@brauner.io>,
        keyrings@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-block <linux-block@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Oct 24, 2019 at 12:57 PM David Howells <dhowells@redhat.com> wrote:
>
> pipe: Add fsync() support
>
> The keyrings testsuite needs the ability to wait for all the outstanding
> notifications in the queue to have been processed so that it can then go
> through them to find out whether the notifications it expected have been
> emitted.

Can't you just do

    ioctl(fd, FIONREAD, &count);

in a loop instead? "No paperwork. Just sprinkle some msleep() crack on
him, and let's get out of here"

               Linus
