Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 639CD19E775
	for <lists+keyrings@lfdr.de>; Sat,  4 Apr 2020 22:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726370AbgDDUA2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 4 Apr 2020 16:00:28 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34282 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726297AbgDDUA2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sat, 4 Apr 2020 16:00:28 -0400
Received: by mail-lf1-f68.google.com with SMTP id f20so1263743lfm.1
        for <keyrings@vger.kernel.org>; Sat, 04 Apr 2020 13:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YsuPBZsb8WE7VCqvhICagjys5vaL8jznepcO6gVNhuY=;
        b=O/NJbZhEcELmxr8BjYMVRxOGDrpsvhy4davP58ldZKgobV0p7JxPIcKelXaB7aNZW9
         mPcbUFn5jfyaOh/i3A4S/VxDN7Nv056gxJ7+iidO74GTBvCOtL8MrU9wKnElTGHdb3um
         EpkDy6jh4uuboALpwZV+wASIDyIisdDKaAb18=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YsuPBZsb8WE7VCqvhICagjys5vaL8jznepcO6gVNhuY=;
        b=AGiH4y6IapTo6SLrKgILRqcprIP2EaIKiMJvWZRrBTvpbkcGz2JYEPeaDa7X8AMGbw
         uX3ud+2IEmhc8eHv7Y/GmncievlFF5AA43GBZIRPZWdIVOS9M46ziqkCa8zlLn8WHFTu
         mp1tiOgrZssdBYNNzLiKztyGZt94t+pSWpdGPmVXWjCNmeFXyeNI9lkUd2PTefntlRe2
         QeEfRv8sqA58yfga2H0xCNsjMLh8IBCmQPfXsSMubPOjAz7wuSMWiDIb6SGG/9A+9jTJ
         3Dl/tyDAnpJh5mXo4Dz5QyhXM+AWymrwnmG1oQ3BVE97ZVoiclOLBFE+CYQf7IiuzzrP
         QYEQ==
X-Gm-Message-State: AGi0PuZNETNWN1oxXRBzOOZl7VdST/oY+7BGEy9Irsjt3JFe8DQEJ3ex
        xFnPScMYZ12D/HZTRKJbmTwxMyZtmu0=
X-Google-Smtp-Source: APiQypIgbllN0zYeaODtp19u7Ks6+T+eo0CRcNwBwyhTBYQv++AlLeAC/o/QQqc+MmGW9m++huOSrw==
X-Received: by 2002:ac2:5de7:: with SMTP id z7mr8858255lfq.174.1586030426165;
        Sat, 04 Apr 2020 13:00:26 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id t6sm8532665lfb.55.2020.04.04.13.00.24
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Apr 2020 13:00:25 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id p14so10475637lji.11
        for <keyrings@vger.kernel.org>; Sat, 04 Apr 2020 13:00:24 -0700 (PDT)
X-Received: by 2002:a2e:7c1a:: with SMTP id x26mr7591094ljc.209.1586030424282;
 Sat, 04 Apr 2020 13:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <1437197.1585570598@warthog.procyon.org.uk>
In-Reply-To: <1437197.1585570598@warthog.procyon.org.uk>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sat, 4 Apr 2020 13:00:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgWnZCvTFDfiYAy=uMUf2F1Yy1r9ur5ARcmtqLjX8Tz4Q@mail.gmail.com>
Message-ID: <CAHk-=wgWnZCvTFDfiYAy=uMUf2F1Yy1r9ur5ARcmtqLjX8Tz4Q@mail.gmail.com>
Subject: Re: [GIT PULL] keys: Fix key->sem vs mmap_sem issue when reading key
To:     David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        Waiman Long <longman@redhat.com>, keyrings@vger.kernel.org,
        LSM List <linux-security-module@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Mar 30, 2020 at 5:16 AM David Howells <dhowells@redhat.com> wrote:
>
>  security/keys/internal.h                  |  12 ++++

This isn't so much about this pull (which I have taken), as about the
fact that this code re-inforces bad behavior we already in the slub
layer, and now extends it further to kvfree.

Doing this:


   __kvzfree(const void *addr, size_t len)
  ..
                memset((void *)addr, 0, len);
                kvfree(addr);

is wrong to begin with. It's wrong because if the compiler ever knows
that kvfree is a freeing function (with something like
__attribute__((free)) - I don't think gcc is smart enough today), the
compiler might throw the memset away.

Yeah, so far we've only seen that for automatic stack clearing, but
there are very much compilers that know that alloc/free are special
(both for warning about use-after-free issues, and for "improving"
code generation by blindly removing dead writes).

We have a function for clearing sensitive information: it's called
"memclear_explicit()", and it's about forced (explicit) clearing even
if the data might look dead afterwards.

The other problem with that function is the name: "__kvzfree()" is not
a useful name for this function. We use the "__" format for internal
low-level helpers, and it generally means that it does *less* than the
full function. This does more, not less, and "__" is not following any
sane naming model.

So the name should probably be something like "kvfree_sensitive()" or
similar. Or maybe it could go even further, and talk about _why_ it's
sensitive, and call it "kvfree_cleartext()" or something like that.

Because the clearing is really not what even matters. It might choose
other patterns to overwrite things with, but it might do other things
too, like putting special barriers for data leakage (or flags to tell
return-to-user-mode to do so).

And yes, kzfree() isn't a good name either, and had that same
memset(), but at least it doesn't do the dual-underscore mistake.

Including some kzfree()/crypto people explicitly - I hope we can get
away from this incorrect and actively wrong pattern of thinking that
"sensitive data should be memset(), and then we should add a random
'z' in the name somewhere to 'document' that".

               Linus
