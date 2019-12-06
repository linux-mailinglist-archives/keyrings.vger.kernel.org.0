Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 235CC115920
	for <lists+keyrings@lfdr.de>; Fri,  6 Dec 2019 23:15:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfLFWPG (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 6 Dec 2019 17:15:06 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42523 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726464AbfLFWPF (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 6 Dec 2019 17:15:05 -0500
Received: by mail-lj1-f195.google.com with SMTP id e28so9236624ljo.9
        for <keyrings@vger.kernel.org>; Fri, 06 Dec 2019 14:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r0XBsU0Zwa7k+dx/SYcO/cC8TsFqFe7ap7E70c7vInU=;
        b=bTZdKzPiqpVSRlIEKZEGDMlBYxFAfG1XtbiNaTYxkA8G285Eux5gFHDmaTnJC4iPE5
         o8N7+YD5Z1tWk70yIvruVU0BeSE3YsKa/iMNxQrsM+BsOw2M95U/kwIKkGhLzao/qQKm
         h/+JfuStPH6oZCReJIpg2utxtMnd/SwjidQvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r0XBsU0Zwa7k+dx/SYcO/cC8TsFqFe7ap7E70c7vInU=;
        b=HwAcQSq9s5ufYqBpc0seCYT+MgYv6P1DdUg7oTuu1YglN1UXaT/A/G5tbFsK21W7hP
         fpK5VhqN7zJFRqOiAuOQKjc/L8Wn5y/7kh/hy5bPraevVLhchwJP932p/hApB90+JraW
         FiO5dNMUM7Z2xbbBhxcXVDeAdR0gumhRM5j2ifVFSrK8Tc++zN1ZDH8hX2UOYsy5f+YE
         Qrec3q1Ed6bwPc6Rymda5kT90JcJjQ4pUS/eekAGK+dmPWh5IhF72ygM0ehspS6QpI+w
         94Isbgv4A6VGmijZb35FAqvBVqhag3rbn/imWsLxbzqdhV8FT96/j7h21TfhIE6LqCCt
         iI/A==
X-Gm-Message-State: APjAAAVPbmw4bZFDlQ+OGq9V7FsiM/qlw8Nf369kQZCYB9GNv4o0vjRg
        ezt4m038ahox+vNf8kqy4Fw0rj1+g3U=
X-Google-Smtp-Source: APXvYqxt44BInDzilUzJ78NbMQb+6KvZfOjzUi5vpXlDnw5K69sYQliQLb+8076pM3j9YGZs83z7sQ==
X-Received: by 2002:a2e:580c:: with SMTP id m12mr9815230ljb.150.1575670502839;
        Fri, 06 Dec 2019 14:15:02 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id w6sm7196641lfq.95.2019.12.06.14.15.01
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2019 14:15:01 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id m30so6382672lfp.8
        for <keyrings@vger.kernel.org>; Fri, 06 Dec 2019 14:15:01 -0800 (PST)
X-Received: by 2002:ac2:555c:: with SMTP id l28mr9167196lfk.52.1575670500889;
 Fri, 06 Dec 2019 14:15:00 -0800 (PST)
MIME-Version: 1.0
References: <157186182463.3995.13922458878706311997.stgit@warthog.procyon.org.uk>
 <157186186167.3995.7568100174393739543.stgit@warthog.procyon.org.uk> <20191206214725.GA2108@latitude>
In-Reply-To: <20191206214725.GA2108@latitude>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 6 Dec 2019 14:14:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wga0MPEH5hsesi4Cy+fgaaKENMYpbg2kK8UA0qE3iupgw@mail.gmail.com>
Message-ID: <CAHk-=wga0MPEH5hsesi4Cy+fgaaKENMYpbg2kK8UA0qE3iupgw@mail.gmail.com>
Subject: Re: [RFC PATCH 04/10] pipe: Use head and tail pointers for the ring,
 not cursor and length [ver #2]
To:     Johannes Hirte <johannes.hirte@datenkhaos.de>
Cc:     David Howells <dhowells@redhat.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
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

On Fri, Dec 6, 2019 at 1:47 PM Johannes Hirte
<johannes.hirte@datenkhaos.de> wrote:
>
> This change breaks firefox on my system. I've noticed that some pages
> doesn't load correctly anymore (e.g. facebook, spiegel.de). The pages
> start loading and than stop. Looks like firefox is waiting for some
> dynamic loading content. I've bisected to this commit, but can't revert
> because of conflicts.

Can you check the current git tree, and see if we've fixed it for you.
There are several fixes there, one being the (currently) topmost
commit 76f6777c9cc0 ("pipe: Fix iteration end check in
fuse_dev_splice_write()").

I _just_ pushed out that one, so check that you get it - it sometimes
takes a couple of minutes for the public-facing git servers to mirror
out. I doubt that's the one that would fix firefox, but still..

               Linus
