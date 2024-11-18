Return-Path: <keyrings+bounces-2304-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 299769D1AA3
	for <lists+keyrings@lfdr.de>; Mon, 18 Nov 2024 22:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE1E32827A9
	for <lists+keyrings@lfdr.de>; Mon, 18 Nov 2024 21:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1C51E7C19;
	Mon, 18 Nov 2024 21:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/tE/VPL"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1818D1E7C18;
	Mon, 18 Nov 2024 21:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731965279; cv=none; b=qWmkb68otCbhLIafLQ5Z4iJvfEMys/aQicHTt8MVz2bTfqn6mgB/y6fOWKfhwdpBTZPHATTfRLnzJwMhVw2gy7Rc46lrD/MQZe+MN87pkchM+pcex2HK2+SOk2MSdAzozItKQ7vj0msV/mRihEz3HbvgNbH5eXiBFTAT6leeQ7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731965279; c=relaxed/simple;
	bh=jrBH3/VKy/7+WsM4HkxSFakFtRkAfSZcfLyTiT6FgeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=coBAZYJYQRH43d8lrdVdiA35gvJLR1PhpKUX9sZxpnsh5VgtVA1DczbulEkLyzJBUUKBfneRbGyrCEgTj2OBHXw8nEaFgx1u1naDamtxaw81UDI3DD7yvvzP0azRAJ1xpVgt/5eVNuk01yo/PgE/itaZRZ/MbVpDepL5/O0Rfmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/tE/VPL; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38231f84dccso188496f8f.1;
        Mon, 18 Nov 2024 13:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731965275; x=1732570075; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l6dCGZClEWHOSbX2oEt/vuoE7N6DOHRtxkxfbNlygFw=;
        b=e/tE/VPLg5spKFOqfBh9mEoQbL7DjIrU9lxUR7Ha7y8ZCBrHHu72FbXBMibbzlD4cv
         fWEbzDLetpx1HdYBtGitLvw+QHa4CTifFXZkfZSpkx2/lfA6YeChNfIsXCJ4Z3CKdOXq
         cmswyCod5FtANsS7uTrNTVd279UNfn+t24OVPB4dhqnZsO11FU/5djxeBGDTDWfr9jzn
         DiRankqU0cW8680Bwju8HQGN83QNZz39C33nVc/vmz1i0Vk2xjDTrOK9E8+HmNGX9mXV
         oWaKWFWVzKs7zoOZ+K76HydluqtAEe7rsQIGUnEnLRqviUeBgfQdD86pbnqyqgCazMcK
         bvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731965275; x=1732570075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6dCGZClEWHOSbX2oEt/vuoE7N6DOHRtxkxfbNlygFw=;
        b=m2BRZbn8qmiEFnJc7i1JYzwqLAsEq8rCHtNRZiyXn+EAhauHRUhpy9UNnZ0rACYsBD
         lkygBF/zY8OFI+/eNgiuKhG4HpWPwYPpEoTZ7Jn+D5AR1YELpWB6cF+8cPN1GmF6UaFu
         WxPyQW3Gkb7B7EjY9nbIlfqoHtDvTi9qw9/KQH0Hu8GwBUjeBwAaACzZsoxYRcCo8xOw
         xs9/YpGIj9jswFnbgNiYz6zvUfY7CPd/pjNbV/Prc7hg/RmOOIENWqqA/L9IVHJAGuEw
         j98dxt9njB+ecMPXE1itn6xuYZEZWUxZ9hRBDbtm9fBmaZqUhee4YMhjFRVYVwJXa6Ix
         RVCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAD/uG6Yl8arz3/y6E2by7WbgbnRNHzr6iad8gDP5pE1hrVHv9ko/CW3yqeIWSJXbwdBktkwPAJA==@vger.kernel.org, AJvYcCWR5bbeBfFsPdiNY81ov8Xi+p1FW6mDZsEOAASw3HfJK4Oc20zeEzTanTbjv6xb29M+Qq2cfP6oAZg4huAl@vger.kernel.org, AJvYcCX7r723grud1ZohboTw5RL6bXLY7Lxw4+35XQavRo37FG9mL7OQ8apRnszW+QX0qESESAISAwPXXVcikYMTR0EVTZRbtcT1@vger.kernel.org
X-Gm-Message-State: AOJu0YzjgipPPtFOOAVXjUtSWfBSexocElwxxxHgjAqY01C1xvUsed/u
	ky/6Rdb3ia1ewHEVYxz84fVA7pFmSwG5rL9Cf6YUS0if5dLwxpa7fl6UjD1EEE0fQqq7CmsG6Lz
	cm6McLG2WZuh7ocHh0T4dpcxNX4XqoA+QdaE=
X-Google-Smtp-Source: AGHT+IG7VNTKaBkS9GWokZv9vgDmtsuOqrisF6z78//A/767YEbqVYAV3A9NhsZAQlsUw68EnDPMr7L6dbuWMJlKM0o=
X-Received: by 2002:a05:6000:1f82:b0:382:3285:3ed with SMTP id
 ffacd0b85a97d-382328504b8mr9134162f8f.38.1731965275088; Mon, 18 Nov 2024
 13:27:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <673b6aec.050a0220.87769.004a.GAE@google.com>
In-Reply-To: <673b6aec.050a0220.87769.004a.GAE@google.com>
From: Suraj Sonawane <surajsonawane0215@gmail.com>
Date: Tue, 19 Nov 2024 02:57:18 +0530
Message-ID: <CAHiZj8j7dp5L_A_nvN4zv9q9qH865MDhhzgEgtZUBMq9H1gPMg@mail.gmail.com>
Subject: Re: [syzbot] [keyrings?] [lsm?] KASAN: slab-use-after-free Read in key_put
To: syzbot <syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com>
Cc: dhowells@redhat.com, jarkko@kernel.org, jmorris@namei.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul@paul-moore.com, serge@hallyn.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: multipart/mixed; boundary="000000000000fc88f3062736968c"

--000000000000fc88f3062736968c
Content-Type: multipart/alternative; boundary="000000000000fc88ef062736968a"

--000000000000fc88ef062736968a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz test

On Mon, Nov 18, 2024 at 9:57=E2=80=AFPM syzbot <
syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com> wrote:

> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    adc218676eef Linux 6.12
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=3D16c672e858000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D55f8591b98dd1=
32
> dashboard link:
> https://syzkaller.appspot.com/bug?extid=3D6105ffc1ded71d194d6d
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for
> Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D12dbbb5f980=
000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D11c672e858000=
0
>
> Downloadable assets:
> disk image:
> https://storage.googleapis.com/syzbot-assets/2362200b664b/disk-adc21867.r=
aw.xz
> vmlinux:
> https://storage.googleapis.com/syzbot-assets/866b8b236466/vmlinux-adc2186=
7.xz
> kernel image:
> https://storage.googleapis.com/syzbot-assets/607680582dad/bzImage-adc2186=
7.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the
> commit:
> Reported-by: syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com
>
> trusted_key: encrypted_key: insufficient parameters specified
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-use-after-free in key_put security/keys/key.c:657 [inlin=
e]
> BUG: KASAN: slab-use-after-free in key_put+0x288/0x2a0
> security/keys/key.c:646
> Read of size 8 at addr ffff888079173b00 by task syz-executor356/7162
>
> CPU: 0 UID: 0 PID: 7162 Comm: syz-executor356 Not tainted 6.12.0-syzkalle=
r
> #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS
> Google 10/30/2024
> Call Trace:
>  <TASK>
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:377 [inline]
>  print_report+0xc3/0x620 mm/kasan/report.c:488
>  kasan_report+0xd9/0x110 mm/kasan/report.c:601
>  key_put security/keys/key.c:657 [inline]
>  key_put+0x288/0x2a0 security/keys/key.c:646
>  __key_create_or_update+0x92b/0xe10 security/keys/key.c:940
>  key_create_or_update+0x42/0x60 security/keys/key.c:1018
>  __do_sys_add_key+0x29c/0x460 security/keys/keyctl.c:134
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f410659a399
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 18 00 00 90 48 89 f8 48 89 f=
7
> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff
> ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f4106552218 EFLAGS: 00000246 ORIG_RAX: 00000000000000f8
> RAX: ffffffffffffffda RBX: 00007f4106621328 RCX: 00007f410659a399
> RDX: 0000000020000100 RSI: 0000000020000180 RDI: 0000000020000140
> RBP: 00007f4106621320 R08: 00000000fffffffe R09: 0000000000000000
> R10: 00000000000000ca R11: 0000000000000246 R12: 00007f41065ee074
> R13: 0072736d2f232f75 R14: 7570632f7665642f R15: 6574707972636e65
>  </TASK>
>
> Allocated by task 7162:
>  kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
>  kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>  unpoison_slab_object mm/kasan/common.c:319 [inline]
>  __kasan_slab_alloc+0x89/0x90 mm/kasan/common.c:345
>  kasan_slab_alloc include/linux/kasan.h:247 [inline]
>  slab_post_alloc_hook mm/slub.c:4085 [inline]
>  slab_alloc_node mm/slub.c:4134 [inline]
>  kmem_cache_alloc_noprof+0x121/0x2f0 mm/slub.c:4141
>  key_alloc+0x3e3/0x13a0 security/keys/key.c:277
>  __key_create_or_update+0x71f/0xe10 security/keys/key.c:930
>  key_create_or_update+0x42/0x60 security/keys/key.c:1018
>  __do_sys_add_key+0x29c/0x460 security/keys/keyctl.c:134
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Freed by task 46:
>  kasan_save_stack+0x33/0x60 mm/kasan/common.c:47
>  kasan_save_track+0x14/0x30 mm/kasan/common.c:68
>  kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:579
>  poison_slab_object mm/kasan/common.c:247 [inline]
>  __kasan_slab_free+0x51/0x70 mm/kasan/common.c:264
>  kasan_slab_free include/linux/kasan.h:230 [inline]
>  slab_free_hook mm/slub.c:2342 [inline]
>  slab_free mm/slub.c:4579 [inline]
>  kmem_cache_free+0x152/0x4b0 mm/slub.c:4681
>  key_gc_unused_keys.constprop.0+0x134/0x480 security/keys/gc.c:167
>  key_garbage_collector+0x432/0x990 security/keys/gc.c:300
>  process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229
>  process_scheduled_works kernel/workqueue.c:3310 [inline]
>  worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391
>  kthread+0x2c1/0x3a0 kernel/kthread.c:389
>  ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>
> The buggy address belongs to the object at ffff888079173a40
>  which belongs to the cache key_jar of size 336
> The buggy address is located 192 bytes inside of
>  freed 336-byte region [ffff888079173a40, ffff888079173b90)
>
> The buggy address belongs to the physical page:
> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7917=
2
> head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0xfff00000000040(head|node=3D0|zone=3D1|lastcpupid=3D0x7ff)
> page_type: f5(slab)
> raw: 00fff00000000040 ffff88801c2ba140 dead000000000122 0000000000000000
> raw: 0000000000000000 0000000080120012 00000001f5000000 0000000000000000
> head: 00fff00000000040 ffff88801c2ba140 dead000000000122 0000000000000000
> head: 0000000000000000 0000000080120012 00000001f5000000 0000000000000000
> head: 00fff00000000001 ffffea0001e45c81 ffffffffffffffff 0000000000000000
> head: 0000000000000002 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> page_owner tracks the page as allocated
> page last allocated via order 1, migratetype Unmovable, gfp_mask
> 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOM=
EMALLOC),
> pid 7134, tgid 7131 (syz-executor356), ts 90591707414, free_ts 8497554927=
7
>  set_page_owner include/linux/page_owner.h:32 [inline]
>  post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1556
>  prep_new_page mm/page_alloc.c:1564 [inline]
>  get_page_from_freelist+0xfce/0x2f80 mm/page_alloc.c:3474
>  __alloc_pages_noprof+0x223/0x25a0 mm/page_alloc.c:4751
>  alloc_pages_mpol_noprof+0x2c9/0x610 mm/mempolicy.c:2265
>  alloc_slab_page mm/slub.c:2412 [inline]
>  allocate_slab mm/slub.c:2578 [inline]
>  new_slab+0x2c9/0x410 mm/slub.c:2631
>  ___slab_alloc+0xdac/0x1880 mm/slub.c:3818
>  __slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3908
>  __slab_alloc_node mm/slub.c:3961 [inline]
>  slab_alloc_node mm/slub.c:4122 [inline]
>  kmem_cache_alloc_noprof+0x2a7/0x2f0 mm/slub.c:4141
>  key_alloc+0x3e3/0x13a0 security/keys/key.c:277
>  keyring_alloc+0x44/0xc0 security/keys/keyring.c:526
>  install_process_keyring_to_cred security/keys/process_keys.c:275 [inline=
]
>  install_process_keyring security/keys/process_keys.c:300 [inline]
>  lookup_user_key+0xa34/0x12f0 security/keys/process_keys.c:653
>  __do_sys_add_key+0x25a/0x460 security/keys/keyctl.c:126
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> page last free pid 6961 tgid 6958 stack trace:
>  reset_page_owner include/linux/page_owner.h:25 [inline]
>  free_pages_prepare mm/page_alloc.c:1127 [inline]
>  free_unref_page+0x661/0x1080 mm/page_alloc.c:2657
>  qlink_free mm/kasan/quarantine.c:163 [inline]
>  qlist_free_all+0x4e/0x120 mm/kasan/quarantine.c:179
>  kasan_quarantine_reduce+0x192/0x1e0 mm/kasan/quarantine.c:286
>  __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:329
>  kasan_slab_alloc include/linux/kasan.h:247 [inline]
>  slab_post_alloc_hook mm/slub.c:4085 [inline]
>  slab_alloc_node mm/slub.c:4134 [inline]
>  __kmalloc_cache_node_noprof+0x173/0x350 mm/slub.c:4303
>  kmalloc_node_noprof include/linux/slab.h:901 [inline]
>  alloc_user_cpus_ptr kernel/sched/sched.h:2614 [inline]
>  sched_setaffinity+0x252/0x430 kernel/sched/syscalls.c:1282
>  __do_sys_sched_setaffinity kernel/sched/syscalls.c:1331 [inline]
>  __se_sys_sched_setaffinity kernel/sched/syscalls.c:1320 [inline]
>  __x64_sys_sched_setaffinity+0x101/0x170 kernel/sched/syscalls.c:1320
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Memory state around the buggy address:
>  ffff888079173a00: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
>  ffff888079173a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >ffff888079173b00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                    ^
>  ffff888079173b80: fb fb fc fc fc fc fc fc fc fc fc fc fc fc fc fc
>  ffff888079173c00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
> --
> You received this message because you are subscribed to the Google Groups
> "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit
> https://groups.google.com/d/msgid/syzkaller-bugs/673b6aec.050a0220.87769.=
004a.GAE%40google.com
> .
>

--000000000000fc88ef062736968a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">#syz test<br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Nov 18, 2024 at 9:57=E2=80=AFPM syzbo=
t &lt;<a href=3D"mailto:syzbot%2B6105ffc1ded71d194d6d@syzkaller.appspotmail=
.com">syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
syzbot found the following issue on:<br>
<br>
HEAD commit:=C2=A0 =C2=A0 adc218676eef Linux 6.12<br>
git tree:=C2=A0 =C2=A0 =C2=A0 =C2=A0upstream<br>
console+strace: <a href=3D"https://syzkaller.appspot.com/x/log.txt?x=3D16c6=
72e8580000" rel=3D"noreferrer" target=3D"_blank">https://syzkaller.appspot.=
com/x/log.txt?x=3D16c672e8580000</a><br>
kernel config:=C2=A0 <a href=3D"https://syzkaller.appspot.com/x/.config?x=
=3D55f8591b98dd132" rel=3D"noreferrer" target=3D"_blank">https://syzkaller.=
appspot.com/x/.config?x=3D55f8591b98dd132</a><br>
dashboard link: <a href=3D"https://syzkaller.appspot.com/bug?extid=3D6105ff=
c1ded71d194d6d" rel=3D"noreferrer" target=3D"_blank">https://syzkaller.apps=
pot.com/bug?extid=3D6105ffc1ded71d194d6d</a><br>
compiler:=C2=A0 =C2=A0 =C2=A0 =C2=A0gcc (Debian 12.2.0-14) 12.2.0, GNU ld (=
GNU Binutils for Debian) 2.40<br>
syz repro:=C2=A0 =C2=A0 =C2=A0 <a href=3D"https://syzkaller.appspot.com/x/r=
epro.syz?x=3D12dbbb5f980000" rel=3D"noreferrer" target=3D"_blank">https://s=
yzkaller.appspot.com/x/repro.syz?x=3D12dbbb5f980000</a><br>
C reproducer:=C2=A0 =C2=A0<a href=3D"https://syzkaller.appspot.com/x/repro.=
c?x=3D11c672e8580000" rel=3D"noreferrer" target=3D"_blank">https://syzkalle=
r.appspot.com/x/repro.c?x=3D11c672e8580000</a><br>
<br>
Downloadable assets:<br>
disk image: <a href=3D"https://storage.googleapis.com/syzbot-assets/2362200=
b664b/disk-adc21867.raw.xz" rel=3D"noreferrer" target=3D"_blank">https://st=
orage.googleapis.com/syzbot-assets/2362200b664b/disk-adc21867.raw.xz</a><br=
>
vmlinux: <a href=3D"https://storage.googleapis.com/syzbot-assets/866b8b2364=
66/vmlinux-adc21867.xz" rel=3D"noreferrer" target=3D"_blank">https://storag=
e.googleapis.com/syzbot-assets/866b8b236466/vmlinux-adc21867.xz</a><br>
kernel image: <a href=3D"https://storage.googleapis.com/syzbot-assets/60768=
0582dad/bzImage-adc21867.xz" rel=3D"noreferrer" target=3D"_blank">https://s=
torage.googleapis.com/syzbot-assets/607680582dad/bzImage-adc21867.xz</a><br=
>
<br>
IMPORTANT: if you fix the issue, please add the following tag to the commit=
:<br>
Reported-by: <a href=3D"mailto:syzbot%2B6105ffc1ded71d194d6d@syzkaller.apps=
potmail.com" target=3D"_blank">syzbot+6105ffc1ded71d194d6d@syzkaller.appspo=
tmail.com</a><br>
<br>
trusted_key: encrypted_key: insufficient parameters specified<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
BUG: KASAN: slab-use-after-free in key_put security/keys/key.c:657 [inline]=
<br>
BUG: KASAN: slab-use-after-free in key_put+0x288/0x2a0 security/keys/key.c:=
646<br>
Read of size 8 at addr ffff888079173b00 by task syz-executor356/7162<br>
<br>
CPU: 0 UID: 0 PID: 7162 Comm: syz-executor356 Not tainted 6.12.0-syzkaller =
#0<br>
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 10/30/2024<br>
Call Trace:<br>
=C2=A0&lt;TASK&gt;<br>
=C2=A0__dump_stack lib/dump_stack.c:94 [inline]<br>
=C2=A0dump_stack_lvl+0x116/0x1f0 lib/dump_stack.c:120<br>
=C2=A0print_address_description mm/kasan/report.c:377 [inline]<br>
=C2=A0print_report+0xc3/0x620 mm/kasan/report.c:488<br>
=C2=A0kasan_report+0xd9/0x110 mm/kasan/report.c:601<br>
=C2=A0key_put security/keys/key.c:657 [inline]<br>
=C2=A0key_put+0x288/0x2a0 security/keys/key.c:646<br>
=C2=A0__key_create_or_update+0x92b/0xe10 security/keys/key.c:940<br>
=C2=A0key_create_or_update+0x42/0x60 security/keys/key.c:1018<br>
=C2=A0__do_sys_add_key+0x29c/0x460 security/keys/keyctl.c:134<br>
=C2=A0do_syscall_x64 arch/x86/entry/common.c:52 [inline]<br>
=C2=A0do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83<br>
=C2=A0entry_SYSCALL_64_after_hwframe+0x77/0x7f<br>
RIP: 0033:0x7f410659a399<br>
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 51 18 00 00 90 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 &lt;48&gt; 3d 01 f=
0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48<br>
RSP: 002b:00007f4106552218 EFLAGS: 00000246 ORIG_RAX: 00000000000000f8<br>
RAX: ffffffffffffffda RBX: 00007f4106621328 RCX: 00007f410659a399<br>
RDX: 0000000020000100 RSI: 0000000020000180 RDI: 0000000020000140<br>
RBP: 00007f4106621320 R08: 00000000fffffffe R09: 0000000000000000<br>
R10: 00000000000000ca R11: 0000000000000246 R12: 00007f41065ee074<br>
R13: 0072736d2f232f75 R14: 7570632f7665642f R15: 6574707972636e65<br>
=C2=A0&lt;/TASK&gt;<br>
<br>
Allocated by task 7162:<br>
=C2=A0kasan_save_stack+0x33/0x60 mm/kasan/common.c:47<br>
=C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68<br>
=C2=A0unpoison_slab_object mm/kasan/common.c:319 [inline]<br>
=C2=A0__kasan_slab_alloc+0x89/0x90 mm/kasan/common.c:345<br>
=C2=A0kasan_slab_alloc include/linux/kasan.h:247 [inline]<br>
=C2=A0slab_post_alloc_hook mm/slub.c:4085 [inline]<br>
=C2=A0slab_alloc_node mm/slub.c:4134 [inline]<br>
=C2=A0kmem_cache_alloc_noprof+0x121/0x2f0 mm/slub.c:4141<br>
=C2=A0key_alloc+0x3e3/0x13a0 security/keys/key.c:277<br>
=C2=A0__key_create_or_update+0x71f/0xe10 security/keys/key.c:930<br>
=C2=A0key_create_or_update+0x42/0x60 security/keys/key.c:1018<br>
=C2=A0__do_sys_add_key+0x29c/0x460 security/keys/keyctl.c:134<br>
=C2=A0do_syscall_x64 arch/x86/entry/common.c:52 [inline]<br>
=C2=A0do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83<br>
=C2=A0entry_SYSCALL_64_after_hwframe+0x77/0x7f<br>
<br>
Freed by task 46:<br>
=C2=A0kasan_save_stack+0x33/0x60 mm/kasan/common.c:47<br>
=C2=A0kasan_save_track+0x14/0x30 mm/kasan/common.c:68<br>
=C2=A0kasan_save_free_info+0x3b/0x60 mm/kasan/generic.c:579<br>
=C2=A0poison_slab_object mm/kasan/common.c:247 [inline]<br>
=C2=A0__kasan_slab_free+0x51/0x70 mm/kasan/common.c:264<br>
=C2=A0kasan_slab_free include/linux/kasan.h:230 [inline]<br>
=C2=A0slab_free_hook mm/slub.c:2342 [inline]<br>
=C2=A0slab_free mm/slub.c:4579 [inline]<br>
=C2=A0kmem_cache_free+0x152/0x4b0 mm/slub.c:4681<br>
=C2=A0key_gc_unused_keys.constprop.0+0x134/0x480 security/keys/gc.c:167<br>
=C2=A0key_garbage_collector+0x432/0x990 security/keys/gc.c:300<br>
=C2=A0process_one_work+0x9c5/0x1ba0 kernel/workqueue.c:3229<br>
=C2=A0process_scheduled_works kernel/workqueue.c:3310 [inline]<br>
=C2=A0worker_thread+0x6c8/0xf00 kernel/workqueue.c:3391<br>
=C2=A0kthread+0x2c1/0x3a0 kernel/kthread.c:389<br>
=C2=A0ret_from_fork+0x45/0x80 arch/x86/kernel/process.c:147<br>
=C2=A0ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244<br>
<br>
The buggy address belongs to the object at ffff888079173a40<br>
=C2=A0which belongs to the cache key_jar of size 336<br>
The buggy address is located 192 bytes inside of<br>
=C2=A0freed 336-byte region [ffff888079173a40, ffff888079173b90)<br>
<br>
The buggy address belongs to the physical page:<br>
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x79172<=
br>
head: order:1 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0<br>
flags: 0xfff00000000040(head|node=3D0|zone=3D1|lastcpupid=3D0x7ff)<br>
page_type: f5(slab)<br>
raw: 00fff00000000040 ffff88801c2ba140 dead000000000122 0000000000000000<br=
>
raw: 0000000000000000 0000000080120012 00000001f5000000 0000000000000000<br=
>
head: 00fff00000000040 ffff88801c2ba140 dead000000000122 0000000000000000<b=
r>
head: 0000000000000000 0000000080120012 00000001f5000000 0000000000000000<b=
r>
head: 00fff00000000001 ffffea0001e45c81 ffffffffffffffff 0000000000000000<b=
r>
head: 0000000000000002 0000000000000000 00000000ffffffff 0000000000000000<b=
r>
page dumped because: kasan: bad access detected<br>
page_owner tracks the page as allocated<br>
page last allocated via order 1, migratetype Unmovable, gfp_mask 0xd20c0(__=
GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pi=
d 7134, tgid 7131 (syz-executor356), ts 90591707414, free_ts 84975549277<br=
>
=C2=A0set_page_owner include/linux/page_owner.h:32 [inline]<br>
=C2=A0post_alloc_hook+0x2d1/0x350 mm/page_alloc.c:1556<br>
=C2=A0prep_new_page mm/page_alloc.c:1564 [inline]<br>
=C2=A0get_page_from_freelist+0xfce/0x2f80 mm/page_alloc.c:3474<br>
=C2=A0__alloc_pages_noprof+0x223/0x25a0 mm/page_alloc.c:4751<br>
=C2=A0alloc_pages_mpol_noprof+0x2c9/0x610 mm/mempolicy.c:2265<br>
=C2=A0alloc_slab_page mm/slub.c:2412 [inline]<br>
=C2=A0allocate_slab mm/slub.c:2578 [inline]<br>
=C2=A0new_slab+0x2c9/0x410 mm/slub.c:2631<br>
=C2=A0___slab_alloc+0xdac/0x1880 mm/slub.c:3818<br>
=C2=A0__slab_alloc.constprop.0+0x56/0xb0 mm/slub.c:3908<br>
=C2=A0__slab_alloc_node mm/slub.c:3961 [inline]<br>
=C2=A0slab_alloc_node mm/slub.c:4122 [inline]<br>
=C2=A0kmem_cache_alloc_noprof+0x2a7/0x2f0 mm/slub.c:4141<br>
=C2=A0key_alloc+0x3e3/0x13a0 security/keys/key.c:277<br>
=C2=A0keyring_alloc+0x44/0xc0 security/keys/keyring.c:526<br>
=C2=A0install_process_keyring_to_cred security/keys/process_keys.c:275 [inl=
ine]<br>
=C2=A0install_process_keyring security/keys/process_keys.c:300 [inline]<br>
=C2=A0lookup_user_key+0xa34/0x12f0 security/keys/process_keys.c:653<br>
=C2=A0__do_sys_add_key+0x25a/0x460 security/keys/keyctl.c:126<br>
=C2=A0do_syscall_x64 arch/x86/entry/common.c:52 [inline]<br>
=C2=A0do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83<br>
=C2=A0entry_SYSCALL_64_after_hwframe+0x77/0x7f<br>
page last free pid 6961 tgid 6958 stack trace:<br>
=C2=A0reset_page_owner include/linux/page_owner.h:25 [inline]<br>
=C2=A0free_pages_prepare mm/page_alloc.c:1127 [inline]<br>
=C2=A0free_unref_page+0x661/0x1080 mm/page_alloc.c:2657<br>
=C2=A0qlink_free mm/kasan/quarantine.c:163 [inline]<br>
=C2=A0qlist_free_all+0x4e/0x120 mm/kasan/quarantine.c:179<br>
=C2=A0kasan_quarantine_reduce+0x192/0x1e0 mm/kasan/quarantine.c:286<br>
=C2=A0__kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:329<br>
=C2=A0kasan_slab_alloc include/linux/kasan.h:247 [inline]<br>
=C2=A0slab_post_alloc_hook mm/slub.c:4085 [inline]<br>
=C2=A0slab_alloc_node mm/slub.c:4134 [inline]<br>
=C2=A0__kmalloc_cache_node_noprof+0x173/0x350 mm/slub.c:4303<br>
=C2=A0kmalloc_node_noprof include/linux/slab.h:901 [inline]<br>
=C2=A0alloc_user_cpus_ptr kernel/sched/sched.h:2614 [inline]<br>
=C2=A0sched_setaffinity+0x252/0x430 kernel/sched/syscalls.c:1282<br>
=C2=A0__do_sys_sched_setaffinity kernel/sched/syscalls.c:1331 [inline]<br>
=C2=A0__se_sys_sched_setaffinity kernel/sched/syscalls.c:1320 [inline]<br>
=C2=A0__x64_sys_sched_setaffinity+0x101/0x170 kernel/sched/syscalls.c:1320<=
br>
=C2=A0do_syscall_x64 arch/x86/entry/common.c:52 [inline]<br>
=C2=A0do_syscall_64+0xcd/0x250 arch/x86/entry/common.c:83<br>
=C2=A0entry_SYSCALL_64_after_hwframe+0x77/0x7f<br>
<br>
Memory state around the buggy address:<br>
=C2=A0ffff888079173a00: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb<br>
=C2=A0ffff888079173a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb<br>
&gt;ffff888079173b00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
=C2=A0ffff888079173b80: fb fb fc fc fc fc fc fc fc fc fc fc fc fc fc fc<br>
=C2=A0ffff888079173c00: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
<br>
---<br>
This report is generated by a bot. It may contain errors.<br>
See <a href=3D"https://goo.gl/tpsmEJ" rel=3D"noreferrer" target=3D"_blank">=
https://goo.gl/tpsmEJ</a> for more information about syzbot.<br>
syzbot engineers can be reached at <a href=3D"mailto:syzkaller@googlegroups=
.com" target=3D"_blank">syzkaller@googlegroups.com</a>.<br>
<br>
syzbot will keep track of this issue. See:<br>
<a href=3D"https://goo.gl/tpsmEJ#status" rel=3D"noreferrer" target=3D"_blan=
k">https://goo.gl/tpsmEJ#status</a> for how to communicate with syzbot.<br>
<br>
If the report is already addressed, let syzbot know by replying with:<br>
#syz fix: exact-commit-title<br>
<br>
If you want syzbot to run the reproducer, reply with:<br>
#syz test: git://repo/address.git branch-or-commit-hash<br>
If you attach or paste a git patch, syzbot will apply it before testing.<br=
>
<br>
If you want to overwrite report&#39;s subsystems, reply with:<br>
#syz set subsystems: new-subsystem<br>
(See the list of subsystem names on the web dashboard)<br>
<br>
If the report is a duplicate of another one, reply with:<br>
#syz dup: exact-subject-of-another-report<br>
<br>
If you want to undo deduplication, reply with:<br>
#syz undup<br>
<br>
-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;syzkaller-bugs&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:syzkaller-bugs%2Bunsubscribe@googlegroups.com" ta=
rget=3D"_blank">syzkaller-bugs+unsubscribe@googlegroups.com</a>.<br>
To view this discussion visit <a href=3D"https://groups.google.com/d/msgid/=
syzkaller-bugs/673b6aec.050a0220.87769.004a.GAE%40google.com" rel=3D"norefe=
rrer" target=3D"_blank">https://groups.google.com/d/msgid/syzkaller-bugs/67=
3b6aec.050a0220.87769.004a.GAE%40google.com</a>.<br>
</blockquote></div>

--000000000000fc88ef062736968a--
--000000000000fc88f3062736968c
Content-Type: text/x-patch; charset="US-ASCII"; name="0001-fix-slab-after-free-read.patch"
Content-Disposition: attachment; 
	filename="0001-fix-slab-after-free-read.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m3njczvu0>
X-Attachment-Id: f_m3njczvu0

RnJvbSBmZmUzYTBhMDdlOTQ5ZjQ0NDA0ZjQzMDA1N2ZlODJkOGU3M2IyYjYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTdXJhaiBTb25hd2FuZSA8c3VyYWpzb25hd2FuZTAyMTVAZ21h
aWwuY29tPgpEYXRlOiBUdWUsIDE5IE5vdiAyMDI0IDAyOjQ3OjQ3ICswNTMwClN1YmplY3Q6IFtQ
QVRDSF0gZml4IHNsYWItYWZ0ZXItZnJlZSByZWFkCgpzeXogdGVzdAoKU2lnbmVkLW9mZi1ieTog
U3VyYWogU29uYXdhbmUgPHN1cmFqc29uYXdhbmUwMjE1QGdtYWlsLmNvbT4KLS0tCiBzZWN1cml0
eS9rZXlzL2djLmMgIHwgIDIgKysKIHNlY3VyaXR5L2tleXMva2V5LmMgfCAxNiArKysrKysrKysr
KysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvc2VjdXJpdHkva2V5cy9nYy5jIGIvc2VjdXJpdHkva2V5cy9nYy5jCmlu
ZGV4IDdkNjg3YjA5Ni4uOWIxOWE5NzJkIDEwMDY0NAotLS0gYS9zZWN1cml0eS9rZXlzL2djLmMK
KysrIGIvc2VjdXJpdHkva2V5cy9nYy5jCkBAIC0xNDMsNiArMTQzLDcgQEAgc3RhdGljIG5vaW5s
aW5lIHZvaWQga2V5X2djX3VudXNlZF9rZXlzKHN0cnVjdCBsaXN0X2hlYWQgKmtleXMpCiAKIAkJ
a2RlYnVnKCItICV1Iiwga2V5LT5zZXJpYWwpOwogCQlrZXlfY2hlY2soa2V5KTsKKwkJV1JJVEVf
T05DRShrZXktPnN0YXRlLCBLRVlfSVNfREVBRCk7CiAKICNpZmRlZiBDT05GSUdfS0VZX05PVElG
SUNBVElPTlMKIAkJcmVtb3ZlX3dhdGNoX2xpc3Qoa2V5LT53YXRjaGVycywga2V5LT5zZXJpYWwp
OwpAQCAtMTU5LDYgKzE2MCw3IEBAIHN0YXRpYyBub2lubGluZSB2b2lkIGtleV9nY191bnVzZWRf
a2V5cyhzdHJ1Y3QgbGlzdF9oZWFkICprZXlzKQogCQlpZiAoc3RhdGUgIT0gS0VZX0lTX1VOSU5T
VEFOVElBVEVEKQogCQkJYXRvbWljX2RlYygma2V5LT51c2VyLT5uaWtleXMpOwogCisJCXNtcF93
bWIoKTsKIAkJa2V5X3VzZXJfcHV0KGtleS0+dXNlcik7CiAJCWtleV9wdXRfdGFnKGtleS0+ZG9t
YWluX3RhZyk7CiAJCWtmcmVlKGtleS0+ZGVzY3JpcHRpb24pOwpkaWZmIC0tZ2l0IGEvc2VjdXJp
dHkva2V5cy9rZXkuYyBiL3NlY3VyaXR5L2tleXMva2V5LmMKaW5kZXggM2Q3ZDE4NTAxLi41MzU2
ZGE5ZDkgMTAwNjQ0Ci0tLSBhL3NlY3VyaXR5L2tleXMva2V5LmMKKysrIGIvc2VjdXJpdHkva2V5
cy9rZXkuYwpAQCAtMjc0LDE0ICsyNzQsMjIgQEAgc3RydWN0IGtleSAqa2V5X2FsbG9jKHN0cnVj
dCBrZXlfdHlwZSAqdHlwZSwgY29uc3QgY2hhciAqZGVzYywKIAl9CiAKIAkvKiBhbGxvY2F0ZSBh
bmQgaW5pdGlhbGlzZSB0aGUga2V5IGFuZCBpdHMgZGVzY3JpcHRpb24gKi8KLQlrZXkgPSBrbWVt
X2NhY2hlX3phbGxvYyhrZXlfamFyLCBHRlBfS0VSTkVMKTsKKwlrZXkgPSBrbWVtX2NhY2hlX3ph
bGxvYyhrZXlfamFyLCBHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7CiAJaWYgKCFrZXkpCiAJCWdv
dG8gbm9fbWVtb3J5XzI7CiAKIAlrZXktPmluZGV4X2tleS5kZXNjX2xlbiA9IGRlc2NsZW47CiAJ
a2V5LT5pbmRleF9rZXkuZGVzY3JpcHRpb24gPSBrbWVtZHVwKGRlc2MsIGRlc2NsZW4gKyAxLCBH
RlBfS0VSTkVMKTsKLQlpZiAoIWtleS0+aW5kZXhfa2V5LmRlc2NyaXB0aW9uKQotCQlnb3RvIG5v
X21lbW9yeV8zOworCisJaWYgKCFrZXktPmluZGV4X2tleS5kZXNjcmlwdGlvbikgeworCQlrbWVt
X2NhY2hlX2ZyZWUoa2V5X2phciwga2V5KTsKKwkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7CisJ
fSBlbHNlIHsKKwkJLyogRW5zdXJlIG1lbW9yeSBpcyBjb3JyZWN0bHkgYXNzb2NpYXRlZCAqLwor
CQlzbXBfd21iKCk7IC8qIE1lbW9yeSBiYXJyaWVyIHRvIGVuc3VyZSBrZXkgaXMgc2V0IGJlZm9y
ZSB1c2UgKi8KKwkJa2V5LT5zdGF0ZSA9IEtFWV9JU19VTklOU1RBTlRJQVRFRDsKKwl9CisKIAlr
ZXktPmluZGV4X2tleS50eXBlID0gdHlwZTsKIAlrZXlfc2V0X2luZGV4X2tleSgma2V5LT5pbmRl
eF9rZXkpOwogCkBAIC02NTEsNiArNjU5LDggQEAgdm9pZCBrZXlfcHV0KHN0cnVjdCBrZXkgKmtl
eSkKIAkJaWYgKHJlZmNvdW50X2RlY19hbmRfdGVzdCgma2V5LT51c2FnZSkpIHsKIAkJCXVuc2ln
bmVkIGxvbmcgZmxhZ3M7CiAKKwkJCVdSSVRFX09OQ0Uoa2V5LT5zdGF0ZSwgS0VZX0lTX0RFQUQp
OworCiAJCQkvKiBkZWFsIHdpdGggdGhlIHVzZXIncyBrZXkgdHJhY2tpbmcgYW5kIHF1b3RhICov
CiAJCQlpZiAodGVzdF9iaXQoS0VZX0ZMQUdfSU5fUVVPVEEsICZrZXktPmZsYWdzKSkgewogCQkJ
CXNwaW5fbG9ja19pcnFzYXZlKCZrZXktPnVzZXItPmxvY2ssIGZsYWdzKTsKLS0gCjIuMzQuMQoK
--000000000000fc88f3062736968c--

