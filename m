Return-Path: <keyrings+bounces-2303-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B8E9D155B
	for <lists+keyrings@lfdr.de>; Mon, 18 Nov 2024 17:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DBFFB2525B
	for <lists+keyrings@lfdr.de>; Mon, 18 Nov 2024 16:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9020C1BD9D2;
	Mon, 18 Nov 2024 16:27:27 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C064C1B6CFC
	for <keyrings@vger.kernel.org>; Mon, 18 Nov 2024 16:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731947247; cv=none; b=fvT8r5fIHIl/u4tLK73lQWLr3yodjo/MsSszIynUWja0uzRGKVgmlQKlP+4eOg0epfu2F8vwfzmgw9/kbGSS33+c+2oe5qxDXw46jaLzwCXGbWbitHEitjDk13MgEpmotYtQ8PTQvp7PagzwAYBfoN1rF7ghXqUVHMenEUrVEMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731947247; c=relaxed/simple;
	bh=Bj2t0z6lmFrkDW5fiWSqJnk+1pYR5JnDN0b4eF9Esso=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=L88u1IllwhnhrwBqHgwhFZof7WwBFuxDXY9/02hyxOItT/XLrj01UvFbmmQeeCVYqejy8H5WVAO5Myiebd3chA9jEJMMOXQiq4IohdJwWh9dkffeA46yxZrIYBBJvS/DGv/X1o5r1c88qgoedt+gtXGzQej5rHiGtHGJDy4MLgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3a715ac91f6so36141185ab.2
        for <keyrings@vger.kernel.org>; Mon, 18 Nov 2024 08:27:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731947245; x=1732552045;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=opLgGPpErA58ELBQFfDLjhmki6hEN/TThPq1Nvu+aSE=;
        b=ToRyonJ0SjZqPVR8+JaHfvZyeguhaunq/mqs6lE1HtmHwpDeR8dRQhD2x9Tzj1gPRo
         zuBnngNGsebiDDNrbgsj5pfU0NipekIbmuP+fHg5c19h4uTVhoVcZtiP+A8mO5n7EQez
         GcQPIQg8Ue9MqOzNFB4kcZ/9lVID8rsWcZX+sF/wELNKJ28DH7QXlBXyR49j3DhJYGZ6
         x2L3f4vUk8dZ1/+Kmb5is/Dn0im5oWwcp3Q9Y7hbMTMoA58OFMda4vgyb2nPfDPJOfCG
         YOwXUlkq7+by8DeM3x9AjTVFJkicnw29Qb0e9MuT41u8eMYkDEZFC4bu4hMWqP8cu7pr
         kH0A==
X-Forwarded-Encrypted: i=1; AJvYcCWuUXYOn1LR2rbb2CcjMEO3VVSaIxfABrDzLKztGLCjrA9uS2ZGIR488GMv0KE8JtA6zCIa3Jsm3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVWrVR3mXOC5xTQJThuLPikXn/UoPQ/sGe9eq9OCzt59sK3djd
	qqLBrfZkeJWdo9LXcGipCOa60GsztnCtuRZ6kFqcn4M+6ZfnIqZ9pMJHEJQ91omEdY+3VIt6xBn
	e0SPGOrYdTcp6nYgQoTsRtgyO3kgQHOmY6u51KpykHJ+aOb4rlQGlZMs=
X-Google-Smtp-Source: AGHT+IEnZUUF46G0mw4HMVmpeD8SQ5Cn14q95AEABSclESINCuh75j0D2A/zGpmlEM7ztBB3IUmf+R5UbNPhMYP9kUwrLMEpmgKG
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1a2e:b0:3a7:6f5a:e5c7 with SMTP id
 e9e14a558f8ab-3a76f5ae756mr17759695ab.4.1731947244875; Mon, 18 Nov 2024
 08:27:24 -0800 (PST)
Date: Mon, 18 Nov 2024 08:27:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <673b6aec.050a0220.87769.004a.GAE@google.com>
Subject: [syzbot] [keyrings?] [lsm?] KASAN: slab-use-after-free Read in key_put
From: syzbot <syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com>
To: dhowells@redhat.com, jarkko@kernel.org, jmorris@namei.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul@paul-moore.com, serge@hallyn.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    adc218676eef Linux 6.12
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=16c672e8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=55f8591b98dd132
dashboard link: https://syzkaller.appspot.com/bug?extid=6105ffc1ded71d194d6d
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12dbbb5f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11c672e8580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2362200b664b/disk-adc21867.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/866b8b236466/vmlinux-adc21867.xz
kernel image: https://storage.googleapis.com/syzbot-assets/607680582dad/bzImage-adc21867.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com

trusted_key: encrypted_key: insufficient parameters specified
==================================================================
BUG: KASAN: slab-use-after-free in key_put security/keys/key.c:657 [inline]
BUG: KASAN: slab-use-after-free in key_put+0x288/0x2a0 security/keys/key.c:646
Read of size 8 at addr ffff888079173b00 by task syz-executor356/7162

CPU: 0 UID: 0 PID: 7162 Comm: syz-executor356 Not tainted 6.12.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/30/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0xc3/0x620 mm/kasan/report.c:488
 kasan_report+0xd9/0x110 mm/kasan/report.c:601
 key_put security/keys/key.c:657 [inline]
 key_put+0x288/0x2a0 security/keys/key.c:646
 __key_create_or_update+0x92b/0xe10 security/keys/key.c:940
 key_create_or_update+0x42/0x60 security/keys/key.c:1018
 __do_sys_add_key+0x29c/0x460 security/keys/keyctl.c:134
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f410659a399
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 18 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f4106552218 EFLAGS: 00000246 ORIG_RAX: 00000000000000f8
RAX: ffffffffffffffda RBX: 00007f4106621328 RCX: 00007f410659a399
RDX: 0000000020000100 RSI: 0000000020000180 RDI: 0000000020000140
RBP: 00007f4106621320 R08: 00000000fffffffe R09: 0000000000000000
R10: 00000000000000ca R11: 0000000000000246 R12: 00007f41065ee074
R13: 0072736d2f232f75 R14: 7570632f7665642f R15: 6574707972636e65
 </TASK>

Allocated by task 7162:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 unpoison_slab_object mm/kasan/common.c:319 [inline]
 __kasan_slab_alloc+0x89/0x90 mm/kasan/common.c:345
 kasan_slab_alloc include/linux/kasan.h:247 [inline]
 slab_post_alloc_hook mm/slub.c:4085 [inline]
 slab_alloc_node mm/slub.c:4134 [inline]
 kmem_cache_alloc_noprof+0x121/0x2f0 mm/slub.c:4141
 key_alloc+0x3e3/0x13a0 security/keys/key.c:277
 __key_create_or_update+0x71f/0xe10 security/keys/key.c:930
 key_create_or_update+0x42/0x60 security/keys/key.c:1018
 __do_sys_add_key+0x29c/0x460 security/keys/keyctl.c:134
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 46:
 kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:579
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:230 [inline]
 slab_free_hook mm/slub.c:2342 [inline]
 slab_free mm/slub.c:4579 [inline]
 kmem_cache_free+0x152/0x4b0 mm/slub.c:4681
 key_gc_unused_keys.constprop.0+0x134/0x480 security/keys/gc.c:167
 key_garbage_collector+0x432/0x990 security/keys/gc.c:300
 process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
 process_scheduled_works kernel/workqueue.c:3310 [inline]
 worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
 kthread+0x2c1/0x3a0 kernel/kthread.c:389
 ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

The buggy address belongs to the object at ffff888079173a40
 which belongs to the cache key_jar of size 336
The buggy address is located 192 bytes inside of
 freed 336-byte region [ffff888079173a40, ffff888079173b90)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x79172
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0xfff00000000040(head|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000040 ffff88801c2ba140 dead000000000122 0000000000000000
raw: 0000000000000000 0000000080120012 00000001f5000000 0000000000000000
head: 00fff00000000040 ffff88801c2ba140 dead000000000122 0000000000000000
head: 0000000000000000 0000000080120012 00000001f5000000 0000000000000000
head: 00fff00000000001 ffffea0001e45c81 ffffffffffffffff 0000000000000000
head: 0000000000000002 0000000000000000 00000000ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 7134, tgid 7131 (syz-executor356), ts 90591707414, free_ts 84975549277
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1556
 prep_new_page mm/page_alloc.c:1564 [inline]
 get_page_from_freelist+0xfce/0x2f80 mm/page_alloc.c:3474
 __alloc_pages_noprof+0x223/0x25a0 mm/page_alloc.c:4751
 alloc_pages_mpol_noprof+0x2c9/0x610 mm/mempolicy.c:2265
 alloc_slab_page mm/slub.c:2412 [inline]
 allocate_slab mm/slub.c:2578 [inline]
 new_slab+0x2c9/0x410 mm/slub.c:2631
 ___slab_alloc+0xdac/0x1880 mm/slub.c:3818
 __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3908
 __slab_alloc_node mm/slub.c:3961 [inline]
 slab_alloc_node mm/slub.c:4122 [inline]
 kmem_cache_alloc_noprof+0x2a7/0x2f0 mm/slub.c:4141
 key_alloc+0x3e3/0x13a0 security/keys/key.c:277
 keyring_alloc+0x44/0xc0 security/keys/keyring.c:526
 install_process_keyring_to_cred security/keys/process_keys.c:275 [inline]
 install_process_keyring security/keys/process_keys.c:300 [inline]
 lookup_user_key+0xa34/0x12f0 security/keys/process_keys.c:653
 __do_sys_add_key+0x25a/0x460 security/keys/keyctl.c:126
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
page last free pid 6961 tgid 6958 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1127 [inline]
 free_unref_page+0x661/0x1080 mm/page_alloc.c:2657
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x4e/0x120 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x192/0x1e0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:329
 kasan_slab_alloc include/linux/kasan.h:247 [inline]
 slab_post_alloc_hook mm/slub.c:4085 [inline]
 slab_alloc_node mm/slub.c:4134 [inline]
 __kmalloc_cache_node_noprof+0x173/0x350 mm/slub.c:4303
 kmalloc_node_noprof include/linux/slab.h:901 [inline]
 alloc_user_cpus_ptr kernel/sched/sched.h:2614 [inline]
 sched_setaffinity+0x252/0x430 kernel/sched/syscalls.c:1282
 __do_sys_sched_setaffinity kernel/sched/syscalls.c:1331 [inline]
 __se_sys_sched_setaffinity kernel/sched/syscalls.c:1320 [inline]
 __x64_sys_sched_setaffinity+0x101/0x170 kernel/sched/syscalls.c:1320
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff888079173a00: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
 ffff888079173a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888079173b00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff888079173b80: fb fb fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888079173c00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

