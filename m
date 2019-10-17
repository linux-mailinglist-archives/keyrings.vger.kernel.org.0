Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD4BADA348
	for <lists+keyrings@lfdr.de>; Thu, 17 Oct 2019 03:42:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395065AbfJQBmN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 16 Oct 2019 21:42:13 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:53127 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394864AbfJQBmM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 16 Oct 2019 21:42:12 -0400
Received: by mail-io1-f71.google.com with SMTP id g8so881560iop.19
        for <keyrings@vger.kernel.org>; Wed, 16 Oct 2019 18:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=pdOKNCOT2iOd0L50ws0JTyqK1/1Fhbj5YOUIjEEtEeY=;
        b=LgU1YRjXYzKnk/2vySTT4XVhzTJ+rJDdwaiuy/MSF0geBQJakncd2IStliTmmIxXuD
         HswsyEeHmfEfxpULZIpDmVcL3qwJkyuo7QrE5d5n8xph16NYRPzt+cizk9glliSGZWQE
         izuN5j7OoyxZ/pRHA46KL/zVC0sW70RzaX9oXzNZsv/kwX8P3NbG1QNn4sYChXNmKHTH
         lkVD4ZrqJ12EA75oba5x7MeskACtaPXb9j9LVfTcYQvVl/SCJG0ovSYXKADPbOF6gdEB
         z1Uznrkxmz1XvT79WVb4W4NXLEt3mCqbI6Ovo1OzsYbdgH20YUSN0fXpWYEHEwE+rJQb
         ySvw==
X-Gm-Message-State: APjAAAVGY5PjluPC9r4vqMGRcs8Bd6qsB9vVzgLW2Ag0tdN+lzHCSl7t
        9L4dRpvxyP9P5NPSFp1NOIRUPTKBMOQMC0ZivIkAFVqtesBv
X-Google-Smtp-Source: APXvYqxRmR24P4tLC5wLsEg00RDdkwn7cpnlNWTm+TEe/kShLT//SftvZNePTw+Nh4AATG5JiMrDivqjLxZEhJOqaYYkYY/P7gSW
MIME-Version: 1.0
X-Received: by 2002:a05:6638:3f2:: with SMTP id s18mr958868jaq.91.1571276531630;
 Wed, 16 Oct 2019 18:42:11 -0700 (PDT)
Date:   Wed, 16 Oct 2019 18:42:11 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000830fe50595115344@google.com>
Subject: WARNING: refcount bug in find_key_to_update
From:   syzbot <syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com>
To:     dhowells@redhat.com, jarkko.sakkinen@linux.intel.com,
        jmorris@namei.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, serge@hallyn.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello,

syzbot found the following crash on:

HEAD commit:    bc88f85c kthread: make __kthread_queue_delayed_work static
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1730584b600000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e0ac4d9b35046343
dashboard link: https://syzkaller.appspot.com/bug?extid=6455648abc28dbdd1e7f
compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11c8adab600000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+6455648abc28dbdd1e7f@syzkaller.appspotmail.com

------------[ cut here ]------------
refcount_t: increment on 0; use-after-free.
WARNING: CPU: 1 PID: 9064 at lib/refcount.c:156 refcount_inc_checked  
lib/refcount.c:156 [inline]
WARNING: CPU: 1 PID: 9064 at lib/refcount.c:156  
refcount_inc_checked+0x61/0x70 lib/refcount.c:154
Kernel panic - not syncing: panic_on_warn set ...
CPU: 1 PID: 9064 Comm: syz-executor.5 Not tainted 5.4.0-rc3+ #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS  
Google 01/01/2011
Call Trace:
  __dump_stack lib/dump_stack.c:77 [inline]
  dump_stack+0x172/0x1f0 lib/dump_stack.c:113
  panic+0x2e3/0x75c kernel/panic.c:221
  __warn.cold+0x2f/0x35 kernel/panic.c:582
  report_bug+0x289/0x300 lib/bug.c:195
  fixup_bug arch/x86/kernel/traps.c:179 [inline]
  fixup_bug arch/x86/kernel/traps.c:174 [inline]
  do_error_trap+0x11b/0x200 arch/x86/kernel/traps.c:272
  do_invalid_op+0x37/0x50 arch/x86/kernel/traps.c:291
  invalid_op+0x23/0x30 arch/x86/entry/entry_64.S:1028
RIP: 0010:refcount_inc_checked lib/refcount.c:156 [inline]
RIP: 0010:refcount_inc_checked+0x61/0x70 lib/refcount.c:154
Code: 1d 58 46 7e 06 31 ff 89 de e8 0b cb 2e fe 84 db 75 dd e8 c2 c9 2e fe  
48 c7 c7 40 ad e6 87 c6 05 38 46 7e 06 01 e8 67 0c 00 fe <0f> 0b eb c1 90  
90 90 90 90 90 90 90 90 90 90 55 48 89 e5 41 57 41
RSP: 0018:ffff888081447c68 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffff815cb646 RDI: ffffed1010288f7f
RBP: ffff888081447c78 R08: ffff8880a231a080 R09: ffffed1015d26159
R10: ffffed1015d26158 R11: ffff8880ae930ac7 R12: ffff8880a4518940
R13: 0000000000000000 R14: ffff888081447e10 R15: ffff8880a4518c40
  __key_get include/linux/key.h:281 [inline]
  find_key_to_update+0x8b/0xc0 security/keys/keyring.c:1127
  key_create_or_update+0x588/0xbe0 security/keys/key.c:905
  __do_sys_add_key security/keys/keyctl.c:132 [inline]
  __se_sys_add_key security/keys/keyctl.c:72 [inline]
  __x64_sys_add_key+0x2bd/0x4f0 security/keys/keyctl.c:72
  do_syscall_64+0xfa/0x760 arch/x86/entry/common.c:290
  entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x459a59
Code: fd b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7  
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff  
ff 0f 83 cb b7 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f22e3171c78 EFLAGS: 00000246 ORIG_RAX: 00000000000000f8
RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 0000000000459a59
RDX: 0000000020000440 RSI: 0000000020000000 RDI: 0000000020000040
RBP: 000000000075bf20 R08: fffffffffffffffe R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000246 R12: 00007f22e31726d4
R13: 00000000004bfab8 R14: 00000000004d1ad8 R15: 00000000ffffffff
Kernel Offset: disabled
Rebooting in 86400 seconds..


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this bug, for details see:
https://goo.gl/tpsmEJ#testing-patches
