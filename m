Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDBAB151514
	for <lists+keyrings@lfdr.de>; Tue,  4 Feb 2020 05:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727249AbgBDEoM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 3 Feb 2020 23:44:12 -0500
Received: from mail-io1-f71.google.com ([209.85.166.71]:45299 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbgBDEoM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 3 Feb 2020 23:44:12 -0500
Received: by mail-io1-f71.google.com with SMTP id t12so10906338iog.12
        for <keyrings@vger.kernel.org>; Mon, 03 Feb 2020 20:44:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=Pa5dyIE3ktHUEAvd5sZRYZXtaD/GT5ma8/gG6BVrVsM=;
        b=pwEv689KNc3AvDGRSXebTJPWSaEkKvQAVA/kfBUAjhlQ3OQdHT5IEHdomCxGG1Wrd7
         RyzwctAF4ahraUkygwMqwbB0RfWSM9PeE6pjWcHa8f0b07SKRr9tDdS99R/ZBPNDLiPM
         CJKG4UrCfLpCrc8yFtcQc3iYL3TBL7+b4gd4SVCNbtXiKYw4vMW6Bm3vPL97+qP5s2Hm
         dlwqhib0xdDqnId+4s3BF+4m126tKvdmB8yQ/nRUF3Z2r486KBGJbgtAVtegGFxNw/o+
         8vWwmKH5G8bhWeQe8b2mrjGyUHS2JJ4ySu+FFMWVRTcjeMu0nCKaUDY0IcgtMIT3NaRi
         jnmQ==
X-Gm-Message-State: APjAAAW9MAJkvsxGsNSkuQp0LYA4u1Ls8MFexBEc+ArCgwNEcVCcsuUn
        hL+o0u2rXldV5GRXhKSemDwHj0onFjqZfZ6Zxb1ssoRsxqLn
X-Google-Smtp-Source: APXvYqzVBYOb1u7EqsHoUgEp/Hzneu0rQgfulppZtS6oSL/9HGODQUkMZ16YPUtRNtWI7mnLO0LghAMfWEQpRFVcaSM+iwWhmZYg
MIME-Version: 1.0
X-Received: by 2002:a02:6055:: with SMTP id d21mr23378049jaf.21.1580791451922;
 Mon, 03 Feb 2020 20:44:11 -0800 (PST)
Date:   Mon, 03 Feb 2020 20:44:11 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f4bf93059db8b081@google.com>
Subject: kernel BUG at lib/assoc_array.c:LINE!
From:   syzbot <syzbot+23e14950fa7550d86091@syzkaller.appspotmail.com>
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

syzbot found the following crash on:

HEAD commit:    46d6b7be Merge git://git.kernel.org/pub/scm/linux/kernel/g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11383a79e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6dda7ccc1e75a63f
dashboard link: https://syzkaller.appspot.com/bug?extid=23e14950fa7550d86091
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+23e14950fa7550d86091@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at lib/assoc_array.c:652!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 2778 Comm: kworker/0:37 Not tainted 5.5.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: afs afs_manage_cell
RIP: 0010:assoc_array_insert_into_terminal_node lib/assoc_array.c:652 [inline]
RIP: 0010:assoc_array_insert+0x2baa/0x2bd0 lib/assoc_array.c:1001
Code: 0f 0b e8 a9 64 d4 fd 0f 0b e8 a2 64 d4 fd 0f 0b e8 9b 64 d4 fd 0f 0b e8 94 64 d4 fd 0f 0b e8 8d 64 d4 fd 0f 0b e8 86 64 d4 fd <0f> 0b e8 7f 64 d4 fd 0f 0b e8 78 64 d4 fd 0f 0b e8 71 64 d4 fd 0f
RSP: 0018:ffffc900087ff810 EFLAGS: 00010293
RAX: ffffffff83a25a7a RBX: 1ffff11012d568af RCX: ffff88809f34a580
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900087ff920 R08: ffffffff83a249fd R09: ffffffff83538f4f
R10: ffff88809f34a580 R11: 0000000000000004 R12: ffff888096ab4588
R13: ffff888096ab4500 R14: ffff888096ab4578 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880aea00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000738000 CR3: 0000000054a3b000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __key_link_begin+0xfe/0x230 security/keys/keyring.c:1316
 construct_alloc_key security/keys/request_key.c:404 [inline]
 construct_key_and_link security/keys/request_key.c:499 [inline]
 request_key_and_link+0x9b6/0x1680 security/keys/request_key.c:637
 request_key_tag+0x53/0x190 security/keys/request_key.c:701
 dns_query+0x266/0x6c0 net/dns_resolver/dns_query.c:128
 afs_dns_query+0xdd/0x320 fs/afs/addr_list.c:249
 afs_update_cell fs/afs/cell.c:391 [inline]
 afs_manage_cell+0xda2/0x1500 fs/afs/cell.c:693
 process_one_work+0x7f5/0x10f0 kernel/workqueue.c:2264
 worker_thread+0xbbc/0x1630 kernel/workqueue.c:2410
 kthread+0x332/0x350 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
Modules linked in:
---[ end trace 9dabb2deade74362 ]---
RIP: 0010:assoc_array_insert_into_terminal_node lib/assoc_array.c:652 [inline]
RIP: 0010:assoc_array_insert+0x2baa/0x2bd0 lib/assoc_array.c:1001
Code: 0f 0b e8 a9 64 d4 fd 0f 0b e8 a2 64 d4 fd 0f 0b e8 9b 64 d4 fd 0f 0b e8 94 64 d4 fd 0f 0b e8 8d 64 d4 fd 0f 0b e8 86 64 d4 fd <0f> 0b e8 7f 64 d4 fd 0f 0b e8 78 64 d4 fd 0f 0b e8 71 64 d4 fd 0f
RSP: 0018:ffffc900087ff810 EFLAGS: 00010293
RAX: ffffffff83a25a7a RBX: 1ffff11012d568af RCX: ffff88809f34a580
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc900087ff920 R08: ffffffff83a249fd R09: ffffffff83538f4f
R10: ffff88809f34a580 R11: 0000000000000004 R12: ffff888096ab4588
R13: ffff888096ab4500 R14: ffff888096ab4578 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880aea00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00000000013e4978 CR3: 000000008adb2000 CR4: 00000000001406f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
