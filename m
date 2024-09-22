Return-Path: <keyrings+bounces-2123-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 010CA97E0FF
	for <lists+keyrings@lfdr.de>; Sun, 22 Sep 2024 12:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FA84B20CE3
	for <lists+keyrings@lfdr.de>; Sun, 22 Sep 2024 10:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C56E617C211;
	Sun, 22 Sep 2024 10:53:25 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C331154BFE
	for <keyrings@vger.kernel.org>; Sun, 22 Sep 2024 10:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727002405; cv=none; b=gR9yb48Ykg/GsPyNgwOZ0Irrp0OBa1VL2UF3XJw6LR7ViZE19IyJ8JDWyG2hQLCDUBEe+sZjsDP2rJaeM62a8mMFGnkzNK9rTMrg6lfY27XCypjnk/biGDrNUQZCs3OC25Zf36pgVhItqdFtXpgQ1PrOaMLnsMiEQVQkzpWCb8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727002405; c=relaxed/simple;
	bh=eBnzNcr/M/8mOz3gMBdNgOkNqK5r7H+BBaOY34kxLx0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=g4URt4Euw8vi9Ohn+8KaE+Kaf96nrdu7A1g8Wv9dekPDR/jRUQOMroFy7xMuAuTWeaI0hlpkKLy+4h2srvfmEHQl6JB+E/B/vNQbUmXSRbvyx23vmJ6iVJc54jgVN4iMAgfr9jCZb5/5Ar4iKGBNPpzKr1K1E4v2meDqsXlJeh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a04bf03b1aso43113155ab.1
        for <keyrings@vger.kernel.org>; Sun, 22 Sep 2024 03:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727002403; x=1727607203;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+hqCGCxweegnNMsqwPHYu2suzLkMUGZHN1jjU5TdhD0=;
        b=vRoVr71G0xA3mcBjePK939iVrqFs1WBWPsptjJfiQtVFaoq4mY2g+fNoMhGoOd08YJ
         IDijnoaLpRd+Qzx52m7wY/b/4B8tN/Fs5w1f+4vF0ikpU+ibDiypG8/84an4WvS6gcH3
         mc9UKqpZRv++QIA19dInUrlN/eS3gdEA9pa8D9tN21cwmtiMQ+JIe887s/RpZecf8Gne
         wec4R992psBZs5JvG/ZqIrER/KfQhjKtj7Z778YIQ2kwldm1lMtnCqTxmvx9HerC/mzr
         CppUMiKryUbSNLV6/axymnC+/ZGiRqTxQm8QKlCFvKT/f5v3mQTMjInxZrlu0kxKayK8
         5fAw==
X-Forwarded-Encrypted: i=1; AJvYcCWjDyeF/BBjgw75UXNvXrqhXkuMt7c3W1sEBtFB7vVABPOI3g3YWCI6qtJ7s5GonxOF5nABFsaz3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNKfg8465mdqmlUeTmbk4o/skY4fdpEuWHDkcZw+sSC0XArFZM
	QUONHKzLorSKRsghuliMm15kYfm3GDRdaQ3L46ie9r5NoNCFqMGdT6iTn15+6VLlCuLoR8K6UZx
	wR0G2YqLQ2me7xCyMvDve68mCItbeQr678GsjpREIuG7dm96VDDOoD4s=
X-Google-Smtp-Source: AGHT+IEziXiZPMDJBMFbvh2sEM+Nj1yd+5ARUmxKxG13bFbZIAq5fS37mwKHJWivmAKkqNRgtX90oqcOz2RPoS+N28F0iy8lDNlj
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1908:b0:3a0:9c8e:965a with SMTP id
 e9e14a558f8ab-3a0c8b79d04mr80617685ab.0.1727002403328; Sun, 22 Sep 2024
 03:53:23 -0700 (PDT)
Date: Sun, 22 Sep 2024 03:53:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66eff723.050a0220.1b7b75.0000.GAE@google.com>
Subject: [syzbot] [keyrings?] [lsm?] [ext4?] possible deadlock in
 keyring_clear (2)
From: syzbot <syzbot+1b2d1134e0b675176a15@syzkaller.appspotmail.com>
To: dhowells@redhat.com, jarkko@kernel.org, jmorris@namei.org, 
	keyrings@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	paul@paul-moore.com, serge@hallyn.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2f27fce67173 Merge tag 'sound-6.12-rc1' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=118d7500580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1cb2f9a0593f5374
dashboard link: https://syzkaller.appspot.com/bug?extid=1b2d1134e0b675176a15
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1511c69f980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16107fc7980000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-2f27fce6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9f657bfdbb07/vmlinux-2f27fce6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b3ee0fec5f83/bzImage-2f27fce6.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/96f591b14f71/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1b2d1134e0b675176a15@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.11.0-syzkaller-04557-g2f27fce67173 #0 Not tainted
------------------------------------------------------
kswapd0/79 is trying to acquire lock:
ffff88803c9e2e98 (&type->lock_class){+.+.}-{3:3}, at: keyring_clear+0xb2/0x350 security/keys/keyring.c:1655

but task is already holding lock:
ffffffff8ea30460 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat mm/vmscan.c:6821 [inline]
ffffffff8ea30460 (fs_reclaim){+.+.}-{0:0}, at: kswapd+0xbf1/0x3720 mm/vmscan.c:7203

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (fs_reclaim){+.+.}-{0:0}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5822
       __fs_reclaim_acquire mm/page_alloc.c:3825 [inline]
       fs_reclaim_acquire+0x88/0x140 mm/page_alloc.c:3839
       might_alloc include/linux/sched/mm.h:334 [inline]
       slab_pre_alloc_hook mm/slub.c:3940 [inline]
       slab_alloc_node mm/slub.c:4018 [inline]
       __kmalloc_cache_noprof+0x3d/0x2c0 mm/slub.c:4185
       kmalloc_noprof include/linux/slab.h:690 [inline]
       kzalloc_noprof include/linux/slab.h:816 [inline]
       assoc_array_insert+0xfe/0x33e0 lib/assoc_array.c:980
       __key_link_begin+0xe5/0x1f0 security/keys/keyring.c:1314
       __key_create_or_update+0x570/0xc70 security/keys/key.c:874
       key_create_or_update+0x42/0x60 security/keys/key.c:1018
       x509_load_certificate_list+0x149/0x270 crypto/asymmetric_keys/x509_loader.c:31
       do_one_initcall+0x248/0x880 init/main.c:1269
       do_initcall_level+0x157/0x210 init/main.c:1331
       do_initcalls+0x3f/0x80 init/main.c:1347
       kernel_init_freeable+0x435/0x5d0 init/main.c:1580
       kernel_init+0x1d/0x2b0 init/main.c:1469
       ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

-> #0 (&type->lock_class){+.+.}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3158 [inline]
       check_prevs_add kernel/locking/lockdep.c:3277 [inline]
       validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3901
       __lock_acquire+0x1384/0x2050 kernel/locking/lockdep.c:5199
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5822
       down_write+0x99/0x220 kernel/locking/rwsem.c:1579
       keyring_clear+0xb2/0x350 security/keys/keyring.c:1655
       fscrypt_put_master_key+0xc8/0x190 fs/crypto/keyring.c:79
       put_crypt_info+0x275/0x320 fs/crypto/keysetup.c:548
       fscrypt_put_encryption_info+0x40/0x60 fs/crypto/keysetup.c:753
       ext4_clear_inode+0x15b/0x1c0 fs/ext4/super.c:1524
       ext4_evict_inode+0xabc/0xf50 fs/ext4/inode.c:318
       evict+0x4e8/0x9b0 fs/inode.c:731
       __dentry_kill+0x20d/0x630 fs/dcache.c:615
       shrink_kill+0xa9/0x2c0 fs/dcache.c:1060
       shrink_dentry_list+0x2c0/0x5b0 fs/dcache.c:1087
       prune_dcache_sb+0x10f/0x180 fs/dcache.c:1168
       super_cache_scan+0x34f/0x4b0 fs/super.c:221
       do_shrink_slab+0x701/0x1160 mm/shrinker.c:435
       shrink_slab+0x1093/0x14d0 mm/shrinker.c:662
       shrink_one+0x43b/0x850 mm/vmscan.c:4795
       shrink_many mm/vmscan.c:4856 [inline]
       lru_gen_shrink_node mm/vmscan.c:4934 [inline]
       shrink_node+0x3799/0x3de0 mm/vmscan.c:5914
       kswapd_shrink_node mm/vmscan.c:6742 [inline]
       balance_pgdat mm/vmscan.c:6934 [inline]
       kswapd+0x1cbc/0x3720 mm/vmscan.c:7203
       kthread+0x2f0/0x390 kernel/kthread.c:389
       ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(fs_reclaim);
                               lock(&type->lock_class);
                               lock(fs_reclaim);
  lock(&type->lock_class);

 *** DEADLOCK ***

2 locks held by kswapd0/79:
 #0: ffffffff8ea30460 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat mm/vmscan.c:6821 [inline]
 #0: ffffffff8ea30460 (fs_reclaim){+.+.}-{0:0}, at: kswapd+0xbf1/0x3720 mm/vmscan.c:7203
 #1: ffff88803ba840e0 (&type->s_umount_key#32){++++}-{3:3}, at: super_trylock_shared fs/super.c:562 [inline]
 #1: ffff88803ba840e0 (&type->s_umount_key#32){++++}-{3:3}, at: super_cache_scan+0x94/0x4b0 fs/super.c:196

stack backtrace:
CPU: 0 UID: 0 PID: 79 Comm: kswapd0 Not tainted 6.11.0-syzkaller-04557-g2f27fce67173 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:93 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:119
 print_circular_bug+0x13a/0x1b0 kernel/locking/lockdep.c:2074
 check_noncircular+0x36a/0x4a0 kernel/locking/lockdep.c:2203
 check_prev_add kernel/locking/lockdep.c:3158 [inline]
 check_prevs_add kernel/locking/lockdep.c:3277 [inline]
 validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3901
 __lock_acquire+0x1384/0x2050 kernel/locking/lockdep.c:5199
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5822
 down_write+0x99/0x220 kernel/locking/rwsem.c:1579
 keyring_clear+0xb2/0x350 security/keys/keyring.c:1655
 fscrypt_put_master_key+0xc8/0x190 fs/crypto/keyring.c:79
 put_crypt_info+0x275/0x320 fs/crypto/keysetup.c:548
 fscrypt_put_encryption_info+0x40/0x60 fs/crypto/keysetup.c:753
 ext4_clear_inode+0x15b/0x1c0 fs/ext4/super.c:1524
 ext4_evict_inode+0xabc/0xf50 fs/ext4/inode.c:318
 evict+0x4e8/0x9b0 fs/inode.c:731
 __dentry_kill+0x20d/0x630 fs/dcache.c:615
 shrink_kill+0xa9/0x2c0 fs/dcache.c:1060
 shrink_dentry_list+0x2c0/0x5b0 fs/dcache.c:1087
 prune_dcache_sb+0x10f/0x180 fs/dcache.c:1168
 super_cache_scan+0x34f/0x4b0 fs/super.c:221
 do_shrink_slab+0x701/0x1160 mm/shrinker.c:435
 shrink_slab+0x1093/0x14d0 mm/shrinker.c:662
 shrink_one+0x43b/0x850 mm/vmscan.c:4795
 shrink_many mm/vmscan.c:4856 [inline]
 lru_gen_shrink_node mm/vmscan.c:4934 [inline]
 shrink_node+0x3799/0x3de0 mm/vmscan.c:5914
 kswapd_shrink_node mm/vmscan.c:6742 [inline]
 balance_pgdat mm/vmscan.c:6934 [inline]
 kswapd+0x1cbc/0x3720 mm/vmscan.c:7203
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


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

