Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 498FADB1B1
	for <lists+keyrings@lfdr.de>; Thu, 17 Oct 2019 18:00:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437880AbfJQQAb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 17 Oct 2019 12:00:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:45618 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436715AbfJQQAb (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 17 Oct 2019 12:00:31 -0400
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net [24.5.143.220])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D29D521835;
        Thu, 17 Oct 2019 16:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571328030;
        bh=MJNtM0gGXpObzCT2JelP1fq2yMAZ27mOcUIIpChX9qY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bPI16PNPk8Rfcbn3KXIe6pk14cZKallPkfJI/6Wj+wbb1o1Dj5QouFruB4yslOdVd
         JNLwbbPX4hkwgQYi0KCZNgI7jR+Tymds3yHFyHwKm1/a8Ux2CndwxhuEcDyL5Mj4K9
         bRarDWPQIkzz7EIfrgXF76q9tVdEb4YT17uVSbgc=
Date:   Thu, 17 Oct 2019 09:00:28 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com>,
        aou@eecs.berkeley.edu, David Howells <dhowells@redhat.com>,
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
Message-ID: <20191017160028.GA726@sol.localdomain>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
        syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com>,
        aou@eecs.berkeley.edu, David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris James Morris <jmorris@namei.org>,
        keyrings@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        LSM List <linux-security-module@vger.kernel.org>,
        Palmer Dabbelt <palmer@sifive.com>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
References: <000000000000830fe50595115344@google.com>
 <00000000000071e2fc05951229ad@google.com>
 <CAHk-=wjFozfjV34_qy3_Z155uz_Z7qFVfE8h=_9ceGU-SVk9hA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjFozfjV34_qy3_Z155uz_Z7qFVfE8h=_9ceGU-SVk9hA@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, Oct 17, 2019 at 08:53:06AM -0700, Linus Torvalds wrote:
> On Wed, Oct 16, 2019 at 7:42 PM syzbot
> <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com> wrote:
> >
> > syzbot has bisected this bug to 0570bc8b7c9b ("Merge tag
> >  'riscv/for-v5.3-rc1' ...")
> 
> Yeah, that looks unlikely. The only non-riscv changes are from
> documentation updates and moving a config variable around.
> 
> Looks like the crash is quite unlikely, and only happens in one out of
> ten runs for the ones it has happened to.
> 
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
> 
> But I haven't followed the key locking rules, so who knows. That "put
> without lock" scenario would explain the crash, though.
> 
> David?
> 

Yes this is a bogus bisection.

The key is supposed to have refcount >= 1 since it's in a keyring.
So some bug is causing it to have refcount 0.  Perhaps some place calling
key_put() too many times.

Unfortunately I can't get the reproducer to work locally.

Note that there are 2 other syzbot reports that look related.
No reproducers for them, though:

Title:              KASAN: use-after-free Read in key_put
Last occurred:      1 day ago
Reported:           28 days ago
Branches:           Mainline
Dashboard link:     https://syzkaller.appspot.com/bug?id=f13750b1124e01191250cf930086dcc40740fa30
Original thread:    https://lore.kernel.org/lkml/0000000000008c3e590592cf4b7f@google.com/T/#u

Title:              KASAN: use-after-free Read in keyring_compare_object
Last occurred:      49 days ago
Reported:           84 days ago
Branches:           Mainline
Dashboard link:     https://syzkaller.appspot.com/bug?id=529ab6a98286c2a97c445988a62760a58d4a1d4b
Original thread:    https://lore.kernel.org/lkml/000000000000038ef6058e6f3592@google.com/T/#u

- Eric
