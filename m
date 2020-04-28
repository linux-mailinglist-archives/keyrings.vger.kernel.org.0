Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 921A11BC4F5
	for <lists+keyrings@lfdr.de>; Tue, 28 Apr 2020 18:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728448AbgD1QTR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 28 Apr 2020 12:19:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728388AbgD1QTQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 28 Apr 2020 12:19:16 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09941C03C1AC;
        Tue, 28 Apr 2020 09:19:16 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id z25so33541971otq.13;
        Tue, 28 Apr 2020 09:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c1EsjSooPyqCnBO664DNonHfMUSKi8/7rikFXFsVYdo=;
        b=Zv3u9Zv8TiofchaTvuqN5JwJqvonwFHSTFFbjYh3QeCWjLqyuXW6BryCjmAx0Uxxk0
         0gP98On9XwU0NztiNgBQS/dz2UoGE3rYWrhcfH1wUhyKT6/nxhDB2BgJlJDLE3Rdtm6n
         AJC5dct6VBPTWAc1df/VNdn3j1TdT33vcIIRp/7ldhyqnkApW4iyV74xa+IUxSX2bUPM
         nyXDNVIp4atlEOcpcPS1vFhzUdHOYkCLBW4VyaoEdh5kD33ukSqxj81qr1JZGwsmeKMm
         whnoqvpzGCO/KpAHxCkkDsNVU64o7Gy1OXtNsYkZ+0Nzsyj8dXEhNZN+0M66ddIgBn2x
         OkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c1EsjSooPyqCnBO664DNonHfMUSKi8/7rikFXFsVYdo=;
        b=fUCfKZtWCQBDIoAYs3MEKFxWGfD/4IUUuYgexqIVO/i1m1Nc1Vl2YpVogwJD08msru
         ZKLUunLEnT1Hz4rOmnuR8anXA+J//IxDZgfwPiMtau5C573EKRmR8K/ygSHbkyrvPiUG
         U0uDIMDo1MkS/sjbqz8VvlUPLKoD8pNAj+XuG8n6U2rfttxrvPToNnTQU/RjU3M3ATNs
         tnnrp1Rn02xiuad9XZzRGs7G27APxj3djbuTkz+kjS7MA47YC4+95bt1KtBZ/FRZW5S2
         3We1ZNWC3F2muIvWkW5lQ7S7jzvkblbFqYxNVgCKHfXiP784JUUoeA/uB7CiFo0XgAAP
         JWoA==
X-Gm-Message-State: AGi0PuZkzvo8C375MSHQsye0f9khilY9I/xgtIHhab6f+XqMt9j4h/LP
        aHtBf1KdfG0Po0oSzWEgy+DglhONOhOMSOppDz0v1A==
X-Google-Smtp-Source: APiQypKEsLKypKBFMaeTK5Vu/aRzLy34dr52xJcb9/VoDVzJrtdC3yjEMYpVolT91E1KkbeGKxf3ZCu8aozNcyXMnrw=
X-Received: by 2002:a9d:6952:: with SMTP id p18mr21913401oto.89.1588090755407;
 Tue, 28 Apr 2020 09:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAHC9VhT95GJKNTMvTtmZL35UOoVwbGH-eDWZyELb5oZ5rQU+Tw@mail.gmail.com>
 <924658.1588078484@warthog.procyon.org.uk> <CAEjxPJ5+DtZfX36OLYiLbU=1tGZcPUWFUi1=mFfx=ntehtvd3Q@mail.gmail.com>
 <1072935.1588089479@warthog.procyon.org.uk>
In-Reply-To: <1072935.1588089479@warthog.procyon.org.uk>
From:   Stephen Smalley <stephen.smalley.work@gmail.com>
Date:   Tue, 28 Apr 2020 12:19:02 -0400
Message-ID: <CAEjxPJ6pFdDfm55pv9bT3CV5DTFF9VqzRmG_Xi5bKNxPaGuOLg@mail.gmail.com>
Subject: Re: [PATCH] selinux: Fix use of KEY_NEED_* instead of KEY__* perms [v2]
To:     David Howells <dhowells@redhat.com>
Cc:     Paul Moore <paul@paul-moore.com>, keyrings@vger.kernel.org,
        SElinux list <selinux@vger.kernel.org>,
        LSM List <linux-security-module@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Tue, Apr 28, 2020 at 11:58 AM David Howells <dhowells@redhat.com> wrote:
>
> Stephen Smalley <stephen.smalley.work@gmail.com> wrote:
>
> > 1) Are we guaranteed that the caller only ever passes a single
> > KEY_NEED_* perm at a time (i.e. hook is never called with a bitmask
> > of multiple permissions)?  Where is that guarantee enforced?
>
> Currently it's the case that only one perm is ever used at once.  I'm tempted
> to enforce this by switching the KEY_NEED_* to an enum rather than a bitmask.
>
> I'm not sure how I would actually define the meaning of two perms being OR'd
> together.  Either okay?  Both required?

Both required is the usual convention in functions like
inode_permission() or avc_has_perm().
But if you know that you'll never use combinations, we should just
prohibit it up front, e.g.
key_task_permission() or whatever can reject them before they reach
the hook call.  Then the
hook code doesn't have to revisit the issue.

>
> > 2) We had talked about adding a BUILD_BUG_ON() or other build-time
> > guard
>
> That doesn't help you trap unallowed perm combinations, though.

I think we want both.

>
> > to ensure that new KEY_NEED_* permissions
> > are not added without updating SELinux.  We already have similar
> > constructs for catching new capabilities (#if CAP_LAST_CAP > 63 #error
> > ...), socket address families (#if PF_MAX > 45 #error ...),  RTM_* and
> > XFRM_MSG* values.
>
> David
>
