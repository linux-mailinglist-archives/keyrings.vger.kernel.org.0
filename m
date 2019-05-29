Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B07002E932
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2019 01:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfE2XZK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 29 May 2019 19:25:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:44498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726635AbfE2XZE (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 29 May 2019 19:25:04 -0400
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 87B0624344;
        Wed, 29 May 2019 23:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559172303;
        bh=6Wrg1PLfo/XeAKhQDRCgkyPmVbLyF5cm9P6UJzKZ3fA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z5E8o+JEox0yVJSsC13ZezPRTNOayVjO6TcDo7juFv4p58oCL2fzzSyEd5zHBAvcK
         Ku9GrzXIOkuHZcSUhrtJeEUM3dDCkEYdHMFXrT69R/HRwHrpxPdPNogFJh31vFls17
         NtYD8XkICphtv2NUHotpHREkAG/P3/9i13ROz3AI=
Date:   Wed, 29 May 2019 16:25:01 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] keys: Add a keyctl to move a key between keyrings
Message-ID: <20190529232500.GA131466@gmail.com>
References: <155856408314.10428.17035328117829912815.stgit@warthog.procyon.org.uk>
 <155856412507.10428.15987388402707639951.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155856412507.10428.15987388402707639951.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Wed, May 22, 2019 at 11:28:45PM +0100, David Howells wrote:
> Add a keyctl to atomically move a link to a key from one keyring to
> another.  The key must exist in "from" keyring and a flag can be given to
> cause the operation to fail if there's a matching key already in the "to"
> keyring.
> 
> This can be done with:
> 
> 	keyctl(KEYCTL_MOVE,
> 	       key_serial_t key,
> 	       key_serial_t from_keyring,
> 	       key_serial_t to_keyring,
> 	       unsigned int flags);
> 
> The key being moved must grant Link permission and both keyrings must grant
> Write permission.
> 
> flags should be 0 or KEYCTL_MOVE_EXCL, with the latter preventing
> displacement of a matching key from the "to" keyring.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>

This shows up after a few seconds of syzkaller fuzzing with a description of
KEYCTL_MOVE added:

WARNING: possible circular locking dependency detected
5.2.0-rc1 #5 Not tainted
------------------------------------------------------
syz-executor.28/27700 is trying to acquire lock:
00000000049888d8 (keyring_serialise_link_sem){+.+.}, at: __key_link_begin+0x1c2/0x2d0 security/keys/keyring.c:1231

but task is already holding lock:
00000000b171310c (&type->lock_class/1){+.+.}, at: __key_link_begin+0xa4/0x2d0 security/keys/keyring.c:1222

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (&type->lock_class/1){+.+.}:
       lock_acquire+0x106/0x330 kernel/locking/lockdep.c:4302
       down_write_nested+0x3c/0xa0 kernel/locking/rwsem.c:177
       __key_unlink_begin+0x6c/0x110 security/keys/keyring.c:1398
       key_move+0x3ad/0x470 security/keys/keyring.c:1538
       keyctl_keyring_move+0xb6/0x120 security/keys/keyctl.c:610
       __do_sys_keyctl security/keys/keyctl.c:1823 [inline]
       __se_sys_keyctl+0x8e/0x2c0 security/keys/keyctl.c:1685
       __x64_sys_keyctl+0xbe/0x150 security/keys/keyctl.c:1685
       do_syscall_64+0x9e/0x4b0 arch/x86/entry/common.c:301
       entry_SYSCALL_64_after_hwframe+0x49/0xbe

-> #0 (keyring_serialise_link_sem){+.+.}:
       check_prevs_add kernel/locking/lockdep.c:2417 [inline]
       validate_chain kernel/locking/lockdep.c:2799 [inline]
       __lock_acquire+0x38a4/0x3c30 kernel/locking/lockdep.c:3792
       lock_acquire+0x106/0x330 kernel/locking/lockdep.c:4302
       down_write+0x38/0xa0 kernel/locking/rwsem.c:66
       __key_link_begin+0x1c2/0x2d0 security/keys/keyring.c:1231
       key_move+0xf0/0x470 security/keys/keyring.c:1529
       keyctl_keyring_move+0xb6/0x120 security/keys/keyctl.c:610
       __do_sys_keyctl security/keys/keyctl.c:1823 [inline]
       __se_sys_keyctl+0x8e/0x2c0 security/keys/keyctl.c:1685
       __x64_sys_keyctl+0xbe/0x150 security/keys/keyctl.c:1685
       do_syscall_64+0x9e/0x4b0 arch/x86/entry/common.c:301
       entry_SYSCALL_64_after_hwframe+0x49/0xbe

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&type->lock_class/1);
                               lock(keyring_serialise_link_sem);
                               lock(&type->lock_class/1);
  lock(keyring_serialise_link_sem);

 *** DEADLOCK ***

2 locks held by syz-executor.28/27700:
 #0: 000000002a03f208 (&type->lock_class){++++}, at: __key_unlink_begin+0x6c/0x110 security/keys/keyring.c:1398
 #1: 00000000b171310c (&type->lock_class/1){+.+.}, at: __key_link_begin+0xa4/0x2d0 security/keys/keyring.c:1222

stack backtrace:
CPU: 8 PID: 27700 Comm: syz-executor.28 Not tainted 5.2.0-rc1 #5
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xb1/0x118 lib/dump_stack.c:113
 print_circular_bug+0x4a4/0x4b5 kernel/locking/lockdep.c:1564
 check_prev_add+0xd1f/0x1af7 kernel/locking/lockdep.c:2309
 check_prevs_add kernel/locking/lockdep.c:2417 [inline]
 validate_chain kernel/locking/lockdep.c:2799 [inline]
 __lock_acquire+0x38a4/0x3c30 kernel/locking/lockdep.c:3792
 lock_acquire+0x106/0x330 kernel/locking/lockdep.c:4302
 down_write+0x38/0xa0 kernel/locking/rwsem.c:66
 __key_link_begin+0x1c2/0x2d0 security/keys/keyring.c:1231
 key_move+0xf0/0x470 security/keys/keyring.c:1529
 keyctl_keyring_move+0xb6/0x120 security/keys/keyctl.c:610
 __do_sys_keyctl security/keys/keyctl.c:1823 [inline]
 __se_sys_keyctl+0x8e/0x2c0 security/keys/keyctl.c:1685
 __x64_sys_keyctl+0xbe/0x150 security/keys/keyctl.c:1685
 do_syscall_64+0x9e/0x4b0 arch/x86/entry/common.c:301
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x458a09
Code: dd b4 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 ab b4 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f9d53755c88 EFLAGS: 00000246 ORIG_RAX: 00000000000000fa
RAX: ffffffffffffffda RBX: 000000000071bf00 RCX: 0000000000458a09
RDX: 000000001f62d16e RSI: 000000002490e642 RDI: 000000000000001e
RBP: 00007f9d53755ca0 R08: 0000000000000000 R09: 0000000000000000
R10: 000000001afbc80a R11: 0000000000000246 R12: 00007f9d537566d4
R13: 00000000004ac12c R14: 00000000006ebd68 R15: 0000000000000003
FAULT_INJECTION: forcing a failure.
name failslab, interval 1, probability 0, space 0, times 0
CPU: 8 PID: 27700 Comm: syz-executor.28 Not tainted 5.2.0-rc1 #5
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0xb1/0x118 lib/dump_stack.c:113
 fail_dump lib/fault-inject.c:51 [inline]
 should_fail+0x61e/0x720 lib/fault-inject.c:143
 __should_failslab+0xec/0x120 mm/failslab.c:32
 should_failslab+0x9/0x14 mm/slab_common.c:1610
 slab_pre_alloc_hook mm/slab.h:420 [inline]
 slab_alloc mm/slab.c:3312 [inline]
 kmem_cache_alloc_trace+0x146/0x2a0 mm/slab.c:3553
 kmalloc include/linux/slab.h:547 [inline]
 kzalloc include/linux/slab.h:742 [inline]
 assoc_array_insert+0xcc/0x440 lib/assoc_array.c:985
 __key_link_begin+0x120/0x2d0 security/keys/keyring.c:1236
 key_move+0xf0/0x470 security/keys/keyring.c:1529
 keyctl_keyring_move+0xb6/0x120 security/keys/keyctl.c:610
 __do_sys_keyctl security/keys/keyctl.c:1823 [inline]
 __se_sys_keyctl+0x8e/0x2c0 security/keys/keyctl.c:1685
 __x64_sys_keyctl+0xbe/0x150 security/keys/keyctl.c:1685
 do_syscall_64+0x9e/0x4b0 arch/x86/entry/common.c:301
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x458a09
Code: dd b4 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 ab b4 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f9d53755c88 EFLAGS: 00000246 ORIG_RAX: 00000000000000fa
RAX: ffffffffffffffda RBX: 000000000071bf00 RCX: 0000000000458a09
RDX: 000000001f62d16e RSI: 000000002490e642 RDI: 000000000000001e
RBP: 00007f9d53755ca0 R08: 0000000000000000 R09: 0000000000000000
R10: 000000001afbc80a R11: 0000000000000246 R12: 00007f9d537566d4
R13: 00000000004ac12c R14: 00000000006ebd68 R15: 0000000000000003
