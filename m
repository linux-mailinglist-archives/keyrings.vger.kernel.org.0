Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987303D9D16
	for <lists+keyrings@lfdr.de>; Thu, 29 Jul 2021 07:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233790AbhG2Fb1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Jul 2021 01:31:27 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:51011 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbhG2Fb0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Jul 2021 01:31:26 -0400
Received: by mail-io1-f71.google.com with SMTP id s4-20020a5e98040000b029052c7ba9d3c3so2723421ioj.17
        for <keyrings@vger.kernel.org>; Wed, 28 Jul 2021 22:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=e4hqHnPtqsXF7Nnjw+AMuPPo4nbxLrKlXGDo7Dm2nAg=;
        b=BItv5R1AyYXl/5OqAxRNmWFN0iB7Mqx7PtpNn/Tfdt2GfxMXP6bUxwFRxmZDA5/BSE
         /tq48VVOJQQ68x3hrV9QQeAZAPO3FBYZQNlVgJlmC/Koq9IozaxpIaUQX/DRpheO5wcm
         GFqt2jVESiXSac4EBoG5/xPVxp9bqqKfN6mZzslR0YrTegFzNf/pSTBU2tWH/4LAJnGE
         VeT2eXfZ2oT2pfiY8GMyVNB0tNDXj5M6YQM8INCLLS4TKNE7YxlRVZbwZZuZulONXqPe
         cK6+n0LFdvOhw84+b0kbYQsjJ4RypscK9L7BCoCg6drqouXqMhyiiI21M/L3qjohecPR
         QgYA==
X-Gm-Message-State: AOAM530FuAhx4Y3pR+MSrmAkoXfUOD5LBFzlp67fdKf/dHYjsnNfGSkG
        llyyzM1GuT+GMjgIXZmBxw4oZHQ0l93F60lvnqx62fQHhfb4
X-Google-Smtp-Source: ABdhPJwEuQqElPH3Rfv4oo156SiLaBFFaTJEdx8sOWr8wEUyBHrlOQVusYTGroaR6xrHJZil2pUbqvLyQFAXcZWkiBDHmLO072hK
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:198f:: with SMTP id g15mr2579946ilf.120.1627536683986;
 Wed, 28 Jul 2021 22:31:23 -0700 (PDT)
Date:   Wed, 28 Jul 2021 22:31:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000e874a205c83c6922@google.com>
Subject: [syzbot] kernel BUG in assoc_array_insert (2)
From:   syzbot <syzbot+219c8d031f42380c907a@syzkaller.appspotmail.com>
To:     dhowells@redhat.com, jarkko@kernel.org, jmorris@namei.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, serge@hallyn.com,
        syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hello,

syzbot found the following issue on:

HEAD commit:    7d549995d4e0 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17577e1a300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1dee114394f7d2c2
dashboard link: https://syzkaller.appspot.com/bug?extid=219c8d031f42380c907a
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.1

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+219c8d031f42380c907a@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at lib/assoc_array.c:640!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 9793 Comm: kworker/1:8 Not tainted 5.14.0-rc3-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Workqueue: afs afs_manage_cell_work
RIP: 0010:assoc_array_insert_into_terminal_node lib/assoc_array.c:640 [inline]
RIP: 0010:assoc_array_insert+0x1e3e/0x2e70 lib/assoc_array.c:1001
Code: 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 84 c4 fe ff ff e8 3c ac e0 fd e9 ba fe ff ff e8 02 f2 9a fd <0f> 0b e8 fb f1 9a fd 0f 0b e8 f4 f1 9a fd 0f 0b e8 ed f1 9a fd 0f
RSP: 0018:ffffc90009c177b0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 00000000000000ff RCX: 0000000000000000
RDX: ffff888087970100 RSI: ffffffff83d9cece RDI: 0000000000000003
RBP: 0000000000000011 R08: 0000000000000010 R09: 000000000000000f
R10: ffffffff83d9c0d9 R11: 000000000000000c R12: 00000000000000ff
R13: dffffc0000000000 R14: 0000000000000010 R15: 000000000000000c
FS:  0000000000000000(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1de4db0000 CR3: 0000000020468000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 __key_link_begin+0xec/0x250 security/keys/keyring.c:1314
 construct_alloc_key security/keys/request_key.c:404 [inline]
 construct_key_and_link security/keys/request_key.c:499 [inline]
 request_key_and_link+0x798/0x1260 security/keys/request_key.c:637
 request_key_tag+0x4e/0xb0 security/keys/request_key.c:701
 dns_query+0x257/0x6d0 net/dns_resolver/dns_query.c:128
 afs_dns_query+0x122/0x390 fs/afs/addr_list.c:249
 afs_update_cell fs/afs/cell.c:402 [inline]
 afs_manage_cell fs/afs/cell.c:784 [inline]
 afs_manage_cell_work+0xa05/0x11f0 fs/afs/cell.c:840
 process_one_work+0x98d/0x1630 kernel/workqueue.c:2276
 worker_thread+0x658/0x11f0 kernel/workqueue.c:2422
 kthread+0x3e5/0x4d0 kernel/kthread.c:319
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:295
Modules linked in:
---[ end trace 02156db422e890c4 ]---
RIP: 0010:assoc_array_insert_into_terminal_node lib/assoc_array.c:640 [inline]
RIP: 0010:assoc_array_insert+0x1e3e/0x2e70 lib/assoc_array.c:1001
Code: 48 b8 00 00 00 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 84 c4 fe ff ff e8 3c ac e0 fd e9 ba fe ff ff e8 02 f2 9a fd <0f> 0b e8 fb f1 9a fd 0f 0b e8 f4 f1 9a fd 0f 0b e8 ed f1 9a fd 0f
RSP: 0018:ffffc90009c177b0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 00000000000000ff RCX: 0000000000000000
RDX: ffff888087970100 RSI: ffffffff83d9cece RDI: 0000000000000003
RBP: 0000000000000011 R08: 0000000000000010 R09: 000000000000000f
R10: ffffffff83d9c0d9 R11: 000000000000000c R12: 00000000000000ff
R13: dffffc0000000000 R14: 0000000000000010 R15: 000000000000000c
FS:  0000000000000000(0000) GS:ffff8880b9d00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000308a888 CR3: 000000007ed4e000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
