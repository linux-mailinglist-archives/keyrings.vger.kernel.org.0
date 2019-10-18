Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC313DCBAA
	for <lists+keyrings@lfdr.de>; Fri, 18 Oct 2019 18:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732414AbfJRQiN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 18 Oct 2019 12:38:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45428 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729010AbfJRQiN (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 18 Oct 2019 12:38:13 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 80F98307D98A;
        Fri, 18 Oct 2019 16:38:09 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-84.rdu2.redhat.com [10.10.121.84])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4F90660600;
        Fri, 18 Oct 2019 16:38:06 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
From:   David Howells <dhowells@redhat.com>
In-Reply-To: <CAHk-=wjFozfjV34_qy3_Z155uz_Z7qFVfE8h=_9ceGU-SVk9hA@mail.gmail.com>
References: <CAHk-=wjFozfjV34_qy3_Z155uz_Z7qFVfE8h=_9ceGU-SVk9hA@mail.gmail.com> <000000000000830fe50595115344@google.com> <00000000000071e2fc05951229ad@google.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     dhowells@redhat.com,
        syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com>,
        aou@eecs.berkeley.edu,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris James Morris <jmorris@namei.org>,
        keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        LSM List <linux-security-module@vger.kernel.org>,
        Palmer Dabbelt <palmer@sifive.com>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: WARNING: refcount bug in find_key_to_update
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <31179.1571416685.1@warthog.procyon.org.uk>
Date:   Fri, 18 Oct 2019 17:38:05 +0100
Message-ID: <31180.1571416685@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Fri, 18 Oct 2019 16:38:13 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Linus Torvalds <torvalds@linux-foundation.org> wrote:

> The backtrace looks simple enough, though:
> 
>   RIP: 0010:refcount_inc_checked+0x2b/0x30 lib/refcount.c:156
>    __key_get include/linux/key.h:281 [inline]
>    find_key_to_update+0x67/0x80 security/keys/keyring.c:1127
>    key_create_or_update+0x4e5/0xb20 security/keys/key.c:905
>    __do_sys_add_key security/keys/keyctl.c:132 [inline]
>    __se_sys_add_key security/keys/keyctl.c:72 [inline]
>    __x64_sys_add_key+0x219/0x3f0 security/keys/keyctl.c:72
>    do_syscall_64+0xd0/0x540 arch/x86/entry/common.c:296
>    entry_SYSCALL_64_after_hwframe+0x49/0xbe
> 
> which to me implies that there's some locking bug, and somebody
> released the key without holding a lock.
>
> That code looks a bit confused to me. Releasing a key without holding
> a lock looks permitted, but if that's the case then __key_get() is
> complete garbage. It would need to use 'refcount_inc_not_zero()' and
> failure would require failing the caller.

find_key_to_update() must be called with the keyring-to-be-searched locked, as
stated in the comment on that function.

If a key-to-be-updated can be found in that keyring, then the keyring must be
holding a ref on that key already, so it's refcount must be > 0, so it
shouldn't be necessary to use refcount_inc_not_zero().

There shouldn't be a race with key_link(), key_unlink(), key_move(),
keyring_clear() or keyring_gc() (garbage collection) as all of those take a
write-lock on the keyring.

> But I haven't followed the key locking rules, so who knows. That "put
> without lock" scenario would explain the crash, though.

That shouldn't explain it.  When key_put() reduces the refcount to 0, it just
schedules the garbage collector.  It doesn't touch the key again directly.

I would guess that something incorrectly put a ref when it shouldn't have.  Do
we know which type of key is involved?  Looking at the syzkaller reproducer,
it's adding an encrypted key and a user key to the process keyring -
presumably repeating the procedure within the same process, hence how it finds
something to update.

David
