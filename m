Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AFE81145FB
	for <lists+keyrings@lfdr.de>; Thu,  5 Dec 2019 18:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729396AbfLERdZ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 5 Dec 2019 12:33:25 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:42650 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730145AbfLERdZ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 5 Dec 2019 12:33:25 -0500
Received: by mail-lf1-f66.google.com with SMTP id y19so3098453lfl.9
        for <keyrings@vger.kernel.org>; Thu, 05 Dec 2019 09:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=/eKd/FDqrplPYUuvbR0AiU2l8M+m4LPxDGweCaRKq6w=;
        b=M56np70zVr1VfiJPsuEXyT4OG9+Mgq+nZRonIdlMO0qNjSITB1EVwHnE+jM9THnBNz
         3vX00ZNLigUAoH1Qop/bcwkoEis8chlXpTrSREoavAISt/m/5l5mLyPd23rMwP17l/QA
         7M9TY3swoS1z9u0iCZT3it6ySOEzIm2iiZPAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=/eKd/FDqrplPYUuvbR0AiU2l8M+m4LPxDGweCaRKq6w=;
        b=Z5jmdcw4t+jdavgk+HBkWrJYUfTzEQm0mCEXhp1QrjgtscFGqkNiGzsj1a5g2Bvj1l
         FG4iXWqy0/e3DZzNjMfVyxREz3qeY2cjkuwCN3M42Xel0xWfFoNcAaACb3mvvUAUWAyb
         CB3yll7MkLMsj+vK55Bg5hTxOH8G9uXlCj6hbj2+RM9yfWf0CUFXsrwTP7dFLiFTZBsg
         IHocvK1v8AGCpBHnem0uYK9COZ/ku2V0+MhyHmjPoI7eZbA463uKYUUv9awlDeHXztpk
         mTjA6t06PtLvqVUfiLbOzeU02MrbEbfonvZONQdLwaVIw6uY1gg7LSRiWTdgyQiPY4ml
         xvlw==
X-Gm-Message-State: APjAAAVkG5nabuOcZiKY1YhGlU3TAnDNNXKjRZxZ5FvckCGGBUiVpPbw
        xXGEF4dST31kdOrv6y0n1Des7JGSpvA=
X-Google-Smtp-Source: APXvYqwlTYbAAHD416wvnXaTdrqbM6TySIcd4q1UTVIiK74LwnvYGqMxNkB2qyV2VjeEK8Zs2MiLDg==
X-Received: by 2002:ac2:5605:: with SMTP id v5mr2143536lfd.136.1575567202966;
        Thu, 05 Dec 2019 09:33:22 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id y23sm5344058ljk.6.2019.12.05.09.33.20
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2019 09:33:21 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id b15so3125330lfc.4
        for <keyrings@vger.kernel.org>; Thu, 05 Dec 2019 09:33:20 -0800 (PST)
X-Received: by 2002:ac2:430e:: with SMTP id l14mr2520386lfh.79.1575567200366;
 Thu, 05 Dec 2019 09:33:20 -0800 (PST)
MIME-Version: 1.0
References: <20191205125826.GK2734@twin.jikos.cz> <31452.1574721589@warthog.procyon.org.uk>
 <1593.1575554217@warthog.procyon.org.uk> <20191205172127.GW2734@suse.cz>
In-Reply-To: <20191205172127.GW2734@suse.cz>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 5 Dec 2019 09:33:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=whw+R5GVQdpV6J_5afQ=76vtBPzBPRj6-zG1tnhT32Pag@mail.gmail.com>
Message-ID: <CAHk-=whw+R5GVQdpV6J_5afQ=76vtBPzBPRj6-zG1tnhT32Pag@mail.gmail.com>
Subject: Re: [GIT PULL] pipe: Notification queue preparation
To:     David Sterba <dsterba@suse.cz>,
        David Howells <dhowells@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Zijlstra <peterz@infradead.org>, raven@themaw.net,
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

On Thu, Dec 5, 2019 at 9:22 AM David Sterba <dsterba@suse.cz> wrote:
>
> I rerun the test again (with a different address where it's stuck), there's
> nothing better I can get from the debug info, it always points to pipe_wait,
> disassembly points to.

Hah. I see another bug.

"pipe_wait()" depends on the fact that all events that wake it up
happen with the pipe lock held.

But we do some of the "do_wakeup()" handling outside the pipe lock now
on the reader side

        __pipe_unlock(pipe);

        /* Signal writers asynchronously that there is more room. */
        if (do_wakeup) {
                wake_up_interruptible_poll(&pipe->wait, EPOLLOUT | EPOLLWRNORM);
                kill_fasync(&pipe->fasync_writers, SIGIO, POLL_OUT);
        }

However, that isn't new to this series _either_, so I don't think
that's it. It does wake up things inside the lock _too_ if it ended up
emptying a whole buffer.

So it could be triggered by timing and behavior changes, but I doubt
this pipe_wait() thing is it either. The fact that it bisects to the
thing that changes things to use head/tail pointers makes me think
there's some other incorrect update or comparison somewhere.

That said, "pipe_wait()" is an abomination. It should use a proper
wait condition and use wait_event(), but the code predates all of
that. I suspect pipe_wait() goes back to the dark ages with the BKL
and no actual races between kernel code.

               Linus
