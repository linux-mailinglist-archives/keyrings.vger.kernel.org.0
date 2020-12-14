Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F2ED2DA245
	for <lists+keyrings@lfdr.de>; Mon, 14 Dec 2020 22:08:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503650AbgLNVGp (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 14 Dec 2020 16:06:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2503621AbgLNVGn (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 14 Dec 2020 16:06:43 -0500
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F3A1C0613D6
        for <keyrings@vger.kernel.org>; Mon, 14 Dec 2020 13:06:03 -0800 (PST)
Received: by mail-il1-x141.google.com with SMTP id x15so17200437ilq.1
        for <keyrings@vger.kernel.org>; Mon, 14 Dec 2020 13:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GXujo8M1so58bu1bHJQMzIvaxoMCcR2JFvMI6/2SYtw=;
        b=Ea8790/9aGUTS3HYnA37Ah+oEr7UrpiyR0ngkh/QYf0ZRftPH562cxiHxag9HS8/i2
         giw4L8vm132D1ebFROpXaGlMMUVtdircMRE5oFvR8DcuYKDeR1xdxvUfDS8EZoIt621J
         lKbiko7pwfVFv3AMwuX/XFhqzS1c+K+QbyYqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GXujo8M1so58bu1bHJQMzIvaxoMCcR2JFvMI6/2SYtw=;
        b=UAujd5u4Q38nztXUcd06eSquRn513Qc8Ek5bBiaUsBzFdQHOGK2NwGYTk2T/bX3OKH
         WIEAnz7llMwJ88sZTjBi6qB+WcNjSeRh3RW6W9LTtGgsv3uwUdtAdduf6pH0QFYWlvfg
         2Zl61Fm8YrjQIkLhYyfN62VAkW35AufiiGB8WYPqf4RmwnAR6psThr9/63mLXNspxkjC
         9hBSvkbNz+5yHt2J/9W34vf9K02BycwCwrPO5kZUsBgF5emwjCn3IBfACT8MqWKOOsUo
         C4Blde71EGJt049ughMsPOyKQdS87GYZ1hk7JN7ACM4m+r8KXeAP7/cxVheXi5xUMflh
         3uew==
X-Gm-Message-State: AOAM530kubYjAtuUV+eurtBWIVp+gVV+4y6FXHqglHSEzzfiK8yaaWHD
        jdpVDEAfCFnFUL+A11ToyPcJ3noUzJdrVOmnXOuzrg==
X-Google-Smtp-Source: ABdhPJwoiN0Mha/65j9rHwzmflBt6XppkjGZGKXum/T1dG5G7vZg9uMrfm4crnB+SAOnguAMBC0VLe5qrVC6/YKh2kk=
X-Received: by 2002:a92:dc03:: with SMTP id t3mr37104802iln.215.1607979962323;
 Mon, 14 Dec 2020 13:06:02 -0800 (PST)
MIME-Version: 1.0
References: <2659836.1607940186@warthog.procyon.org.uk> <CAHk-=wido5stGfFtRzmW19bB1w2XQAuY8oxUtFN2ZWdk2Grq-w@mail.gmail.com>
In-Reply-To: <CAHk-=wido5stGfFtRzmW19bB1w2XQAuY8oxUtFN2ZWdk2Grq-w@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 14 Dec 2020 13:05:51 -0800
Message-ID: <CAADWXX83JC0oSVoDxOwsLE1DPm8r6JLWcAsP0UyCLO_X544pkQ@mail.gmail.com>
Subject: Re: [GIT PULL] keys: Collected minor fixes and cleanups
To:     David Howells <dhowells@redhat.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Jarkko Sakkinen <jarkko@kernel.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Ben Boeckel <mathstuf@gmail.com>,
        Denis Efremov <efremov@linux.com>,
        Gabriel Krisman Bertazi <krisman@collabora.com>,
        Jann Horn <jannh@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        Tom Rix <trix@redhat.com>, YueHaibing <yuehaibing@huawei.com>,
        keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Dec 14, 2020 at 12:49 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I suspect the fix is trivial (change the "," to "|"), but I will not
> be pulling this - or anything else that hasn't been in linux-next -
> from you this merge window.

It looks like Stephen Rothwell saw it in next yesterday, and fixed it
up there in his merge.

So somebody was aware of the problem. But unlike Stephen, I don't take
broken code and just silently fix it up in the merge.

I suspect Stephen might have thought it was a merge conflict fix,
rather than just a broken branch.

Stephen: that makes linux-next test coverage kind of pointless, if you
just fix bugs in the branches you merge. You should reject things more
aggressively, rather than make them "pass" in Linux-next.

              Linus
