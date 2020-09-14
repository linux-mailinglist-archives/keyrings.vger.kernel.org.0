Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43B82268858
	for <lists+keyrings@lfdr.de>; Mon, 14 Sep 2020 11:30:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgINJaX (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 14 Sep 2020 05:30:23 -0400
Received: from mail-io1-f78.google.com ([209.85.166.78]:54814 "EHLO
        mail-io1-f78.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgINJ3S (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 14 Sep 2020 05:29:18 -0400
Received: by mail-io1-f78.google.com with SMTP id q6so2342724iod.21
        for <keyrings@vger.kernel.org>; Mon, 14 Sep 2020 02:29:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=FxeDq5AQH5uHHpJ+wPvZ1zxw5WWwefv1515RpflhzxI=;
        b=hXKWflL73kQjNGhdvENAAA+YQGF8LLrBSNPEyfbearyFpIY+6CzkDcD8pI0V/IegiF
         LKmdbpWYYXJGKsDokNPSU18PaG3ktmF0Baz+YCZxf0ZtuMp17C9FTR8qlAMJwM83K4VI
         qPbK2PjUUihtN5NTDypV/cNP85Mdxy0vy+8wzjgdATfUm6dixNb1XYtFhu9JIvZBCrZR
         tlKP5Acm0EI5YxlBL3uctGLvWurL4h9nX+K0yN+CMVWJE8bHnZCBBwgM0vMpULvEKOXV
         c6TOnOkkzyF8tw7eMECNgLz0t60f53P+nefb+KjQ2eYwBXAAKlu0Vhe/WHxZ3jU+LY+H
         ktdw==
X-Gm-Message-State: AOAM532xuAJTiGRn+bK0ssBGoih0MNEhvkxDBm8L2WAzTmPWDjYWTGmi
        CNhvX8uU5czv8C+WNy1IWYTjCMocO7rdQ4Z7RgIPRyrlAupS
X-Google-Smtp-Source: ABdhPJyWyUMD8W6ehOB2EEv3I0k651Qbg5cZcJ/j5goK3SazR4aqiGrSybdd3RQxvz4mMpCrNrFVsbBCpbJ5GqBNgB1Pp3GpHuGf
MIME-Version: 1.0
X-Received: by 2002:a02:c8c6:: with SMTP id q6mr12342949jao.76.1600075756987;
 Mon, 14 Sep 2020 02:29:16 -0700 (PDT)
Date:   Mon, 14 Sep 2020 02:29:16 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000001be78b05af42abd8@google.com>
Subject: kernel BUG at lib/assoc_array.c:LINE! (2)
From:   syzbot <syzbot+5cb98ddf89ec01d73c6d@syzkaller.appspotmail.com>
To:     dhowells@redhat.com, jarkko.sakkinen@linux.intel.com,
        jmorris@namei.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, serge@hallyn.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    e8878ab8 Merge tag 'spi-fix-v5.9-rc4' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12892c11900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c61610091f4ca8c4
dashboard link: https://syzkaller.appspot.com/bug?extid=5cb98ddf89ec01d73c6d
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5cb98ddf89ec01d73c6d@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at lib/assoc_array.c:652!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 7123 Comm: kworker/1:3 Not tainted 5.9.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: afs afs_manage_cell
RIP: 0010:assoc_array_insert_into_terminal_node lib/assoc_array.c:652 [inline]
RIP: 0010:assoc_array_insert+0x1cbe/0x2a80 lib/assoc_array.c:1001
Code: 0f 84 cd fe ff ff e8 e1 62 15 fe e9 c3 fe ff ff e8 57 5c d5 fd 0f 0b e8 50 5c d5 fd 0f 0b e8 49 5c d5 fd 0f 0b e8 42 5c d5 fd <0f> 0b 48 8b 04 24 4c 89 74 24 70 48 b9 00 00 00 00 00 fc ff df 41
RSP: 0018:ffffc900054977a0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 000000000000000f RCX: ffffffff839eeb4c
RDX: ffff8880553a0540 RSI: ffffffff839ef13e RDI: ffff88804726f688
RBP: 0000000000000011 R08: 0000000000000dc0 R09: ffffffff8b177750
R10: 0000000000000010 R11: 000000000000016e R12: 0000000000000010
R13: ffff888053910000 R14: ffff888051e50101 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000768000 CR3: 000000009e098000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __key_link_begin+0xec/0x250 security/keys/keyring.c:1314
 construct_alloc_key security/keys/request_key.c:404 [inline]
 construct_key_and_link security/keys/request_key.c:499 [inline]
 request_key_and_link+0x894/0x1350 security/keys/request_key.c:637
 request_key_tag+0x4e/0xb0 security/keys/request_key.c:701
 dns_query+0x257/0x6c3 net/dns_resolver/dns_query.c:128
 afs_dns_query+0x122/0x390 fs/afs/addr_list.c:249
 afs_update_cell fs/afs/cell.c:403 [inline]
 afs_manage_cell+0x8c5/0x11c0 fs/afs/cell.c:708
 process_one_work+0x94c/0x1670 kernel/workqueue.c:2269
 worker_thread+0x64c/0x1120 kernel/workqueue.c:2415
 kthread+0x3b5/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
Modules linked in:
---[ end trace 234f5667657c5700 ]---
RIP: 0010:assoc_array_insert_into_terminal_node lib/assoc_array.c:652 [inline]
RIP: 0010:assoc_array_insert+0x1cbe/0x2a80 lib/assoc_array.c:1001
Code: 0f 84 cd fe ff ff e8 e1 62 15 fe e9 c3 fe ff ff e8 57 5c d5 fd 0f 0b e8 50 5c d5 fd 0f 0b e8 49 5c d5 fd 0f 0b e8 42 5c d5 fd <0f> 0b 48 8b 04 24 4c 89 74 24 70 48 b9 00 00 00 00 00 fc ff df 41
RSP: 0018:ffffc900054977a0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 000000000000000f RCX: ffffffff839eeb4c
RDX: ffff8880553a0540 RSI: ffffffff839ef13e RDI: ffff88804726f688
RBP: 0000000000000011 R08: 0000000000000dc0 R09: ffffffff8b177750
R10: 0000000000000010 R11: 000000000000016e R12: 0000000000000010
R13: ffff888053910000 R14: ffff888051e50101 R15: 0000000000000001
FS:  0000000000000000(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f340d222000 CR3: 00000000a6f13000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
