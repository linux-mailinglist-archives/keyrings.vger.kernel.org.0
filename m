Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A88FA1F8457
	for <lists+keyrings@lfdr.de>; Sat, 13 Jun 2020 18:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgFMQrw (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 13 Jun 2020 12:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726092AbgFMQrw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 13 Jun 2020 12:47:52 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1C7AC03E96F
        for <keyrings@vger.kernel.org>; Sat, 13 Jun 2020 09:47:51 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id i8so665398lfo.4
        for <keyrings@vger.kernel.org>; Sat, 13 Jun 2020 09:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ncEwZ2YTb3mVdV4EuBbju4CI9gD1hCf0cAsyxu6rkFs=;
        b=WxQOOQExCmoR+tWyWgfXfgTncQypYk9W5MJCAxdFj3dqLPSTkGWlfMMwGUljAXEl5R
         DcdA9O4BYJiyYRfD230dt30F3t+DJyMR6NcHFmsBmpFKMj8GebV/5NgxzNY4KxeMK4CZ
         y2p86lQyIBCmazacaBh+U1MDbQQBNmr34MoVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ncEwZ2YTb3mVdV4EuBbju4CI9gD1hCf0cAsyxu6rkFs=;
        b=g7C/8RqFfnrngmXgmt5M8hAFnLRMSvQPfkLg7Z6NZZessvimU9yLRKO1XWyyXCAGiW
         If8ZXYT787wuGMnHPN8r5NED/wFOw5kmRkM3QHb1V8oR8uTntbfvFDe2U4jD9kE2W9Nu
         ockFSJN/b3Qfct3MWH6WpBkBWw39bj8S6bxNcdmOfpi6qA1VT9w5ePxnhyZGTwMD//hV
         9i9UcdOyXW4f2XvKkk5Lm5dmKjmtKBzuv7Uutt8GdS8IfFxBAef++xum/kjphkUYOpxH
         4uNVNkKOIMlHZeOPd2/1tuVkKHxvecjFAjNS2PqmL1CVwlFkpYIn3iaiqcWYzNhkJIjT
         kMbQ==
X-Gm-Message-State: AOAM533xFqgwRYGJMqAvID16Orzm+J1B8RYpYq/pbnt+oTSno2i0yGr+
        vOL1y/zod/ULOakNRKgr+yqlo4D02i8=
X-Google-Smtp-Source: ABdhPJw2Zcx0HVkdjOdErBa4a2/wOa7W0S2Yuoka4DkpxNPbU7uVrc9CDh5zErGFi+t0xpDu4wYbEQ==
X-Received: by 2002:a19:434e:: with SMTP id m14mr9709932lfj.40.1592066868353;
        Sat, 13 Jun 2020 09:47:48 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 4sm2716019ljq.34.2020.06.13.09.47.46
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jun 2020 09:47:47 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id x18so14460675lji.1
        for <keyrings@vger.kernel.org>; Sat, 13 Jun 2020 09:47:46 -0700 (PDT)
X-Received: by 2002:a2e:b5d9:: with SMTP id g25mr10011919ljn.285.1592066866523;
 Sat, 13 Jun 2020 09:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <1503686.1591113304@warthog.procyon.org.uk> <20200610111256.s47agmgy5gvj3zwz@ws.net.home>
 <CAHk-=whypJLi6T01HOZ5+UPe_rs+hft8wn6iOmQpZgbZzbAumA@mail.gmail.com> <3984625.1592053492@warthog.procyon.org.uk>
In-Reply-To: <3984625.1592053492@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 13 Jun 2020 09:47:30 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh=9bYycJM5ginkkwymb3x-geMtiT5i2FvRS0zbKYR9LQ@mail.gmail.com>
Message-ID: <CAHk-=wh=9bYycJM5ginkkwymb3x-geMtiT5i2FvRS0zbKYR9LQ@mail.gmail.com>
Subject: Re: [GIT PULL] General notification queue and key notifications
To:     David Howells <dhowells@redhat.com>
Cc:     Karel Zak <kzak@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>,
        dray@redhat.com, Miklos Szeredi <mszeredi@redhat.com>,
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

On Sat, Jun 13, 2020 at 6:05 AM David Howells <dhowells@redhat.com> wrote:
>
> Would you be willing at this point to consider pulling the mount notifications
> and fsinfo() which helps support that?  I could whip up pull reqs for those
> two pieces - or do you want to see more concrete patches that use it?

I'd want to see more concrete use cases, but I'd also like to see that
this keyring thing gets used and doesn't find any show-stoppers when
it does.

If we have multiple uses, and one of them notices some problem that
requires any ABI changes, but the other one has already started using
it, we'll have more problems.

          Linus
