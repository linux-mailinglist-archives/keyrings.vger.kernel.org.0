Return-Path: <keyrings+bounces-3693-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD04CD451A
	for <lists+keyrings@lfdr.de>; Sun, 21 Dec 2025 20:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1F76F3001530
	for <lists+keyrings@lfdr.de>; Sun, 21 Dec 2025 19:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F495296BBB;
	Sun, 21 Dec 2025 19:47:34 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60C47286897
	for <keyrings@vger.kernel.org>; Sun, 21 Dec 2025 19:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766346454; cv=none; b=CxvFTpqtSqWndkmaI2zIVqT9KEO0xTFJiaCNSI+rCof8ipcVPOpMehrFd7HXqTcPd/ADcQhePZ31c/SJA38f5VK/RjCuNNhTjYkBfiMWx0EEzomwYlArwYXi1B5Gt7D3eqej4ZRNdtYLqwgtYvcFsXOGVSlI0zB7nyER8SmUm5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766346454; c=relaxed/simple;
	bh=p9TXY+aupJM3wYEuKnJGB/batpJ2ds1+aUgq5sINZok=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Uz5FEo8VXNRYBD3A6h+y5r/PCz1pfy02Ofsn/or8BDvOVO8RJzrn0f+UT67QZLFuwCuxycLmpzuZsLlp9BP3VXa4nJhTvmFDHOBn8eFcp2kQhHIU1hSs+74KGuIjKxbfIvoOx/Q/zBCRYoJdmBZ40lH302E6tdHjmy+2oEImqik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-450b5afd932so2080649b6e.2
        for <keyrings@vger.kernel.org>; Sun, 21 Dec 2025 11:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766346451; x=1766951251;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0EEZYNl6yY3ZOJyDfRm4LJ/ctbxpQCblCysMln1vSrw=;
        b=uusP0gr1G/i1BzQde03sd1CxvuqMCjRiBbiSX1gcJMk2k6exeALkhpedV8yoW42oJD
         SKpgjMs38OTzgQAedeYHE/W24xkFAIYt4wIMav3toiek1MZQ2Hrb70rAlv/LPUEJ1N5K
         NN5QGeFtJqX55H/bn/eZ68VFCH7eZyjFVmxJXI/jpZyoHF0K17feh5txiG4NJutEtnz8
         XfizTHqe4reDRNmZMLHEubSiLix1djePOb0n9x8Qr3EC9s2tEPgLVbVbgPPNNwry478Z
         itT5E4Cy2U2lQt2Y8TNECZ7QMtTHRH+gSR9Dx9AtTYLm50x7cHzO+CzGFK6xtya+NyWD
         1Gfw==
X-Forwarded-Encrypted: i=1; AJvYcCX6rQzWnJympveFm7FxOHA3/59OuSp54LyQyMOidhjsscsKtrfPFMg720nHtcpiCRTNDsWE76/Tbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxskJIKlN1XYyBVAnIaTZnp/NfDvwyh+qXENbuFvIvw14cCrgcQ
	TZC55tvMwjRYITLYHqj2YP3loEPi06soXp5AMsACAW2nyPZkTDqNpEfdK+1vb54/2+/XCyrgwtl
	ey6N0gTa5xrluEKudO+9uh1vY0FzUjSv37oFilXnCZFKdZHc5HkSMQYBky48=
X-Google-Smtp-Source: AGHT+IE1MDt2hS1EheUWFqoSH6A47YA1VjcVY7D+MMJ8BF2xhtBbzkJOwp1bCOYsYsT2yC5R+otjLd8NWWXripVR9dR7DoSZojUI
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e252:0:b0:659:9a49:8e09 with SMTP id
 006d021491bc7-65d0ebd893cmr3297106eaf.75.1766346451372; Sun, 21 Dec 2025
 11:47:31 -0800 (PST)
Date: Sun, 21 Dec 2025 11:47:31 -0800
In-Reply-To: <68e54915.a00a0220.298cc0.0480.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69484ed3.a70a0220.25eec0.0077.GAE@google.com>
Subject: Re: [syzbot] [keyrings?] [lsm?] possible deadlock in keyring_clear (3)
From: syzbot <syzbot+f55b043dacf43776b50c@syzkaller.appspotmail.com>
To: dhowells@redhat.com, jarkko@kernel.org, jmorris@namei.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul@paul-moore.com, serge@hallyn.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    9094662f6707 Merge tag 'ata-6.19-rc2' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1022f77c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=513255d80ab78f2b
dashboard link: https://syzkaller.appspot.com/bug?extid=f55b043dacf43776b50c
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=168a8b1a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16c06b1a580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-9094662f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/baa55f8cf722/vmlinux-9094662f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/aaaa8a404a70/bzImage-9094662f.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/7a86e58a207c/mount_2.gz
  fsck result: OK (log: https://syzkaller.appspot.com/x/fsck.log?x=12c06b1a580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f55b043dacf43776b50c@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
kswapd1/79 is trying to acquire lock:
ffff8880433bfcd8 (&type->lock_class){+.+.}-{4:4}, at: keyring_clear+0xaf/0x240 security/keys/keyring.c:1658

but task is already holding lock:
ffffffff8e051820 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat mm/vmscan.c:6975 [inline]
ffffffff8e051820 (fs_reclaim){+.+.}-{0:0}, at: kswapd+0x92a/0x2820 mm/vmscan.c:7354

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (fs_reclaim){+.+.}-{0:0}:
       __fs_reclaim_acquire mm/page_alloc.c:4301 [inline]
       fs_reclaim_acquire+0x72/0x100 mm/page_alloc.c:4315
       might_alloc include/linux/sched/mm.h:317 [inline]
       slab_pre_alloc_hook mm/slub.c:4904 [inline]
       slab_alloc_node mm/slub.c:5239 [inline]
       __kmalloc_cache_noprof+0x40/0x700 mm/slub.c:5771
       kmalloc_noprof include/linux/slab.h:957 [inline]
       kzalloc_noprof include/linux/slab.h:1094 [inline]
       assoc_array_insert+0x92/0x2f90 lib/assoc_array.c:980
       __key_link_begin+0xd6/0x1f0 security/keys/keyring.c:1317
       __key_create_or_update+0x41a/0xa30 security/keys/key.c:877
       key_create_or_update+0x42/0x60 security/keys/key.c:1021
       x509_load_certificate_list+0x145/0x280 crypto/asymmetric_keys/x509_loader.c:31
       do_one_initcall+0x1f1/0x800 init/main.c:1378
       do_initcall_level+0x104/0x190 init/main.c:1440
       do_initcalls+0x59/0xa0 init/main.c:1456
       kernel_init_freeable+0x2a7/0x3d0 init/main.c:1688
       kernel_init+0x1d/0x1d0 init/main.c:1578
       ret_from_fork+0x510/0xa50 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

-> #0 (&type->lock_class){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x15a6/0x2cf0 kernel/locking/lockdep.c:5237
       lock_acquire+0x107/0x340 kernel/locking/lockdep.c:5868
       down_write+0x96/0x1f0 kernel/locking/rwsem.c:1590
       keyring_clear+0xaf/0x240 security/keys/keyring.c:1658
       fscrypt_put_master_key+0xca/0x190 fs/crypto/keyring.c:80
       put_crypt_info+0x26d/0x310 fs/crypto/keysetup.c:573
       fscrypt_put_encryption_info+0xf6/0x140 fs/crypto/keysetup.c:787
       ext4_clear_inode+0x170/0x2f0 fs/ext4/super.c:1529
       ext4_evict_inode+0x9f6/0xe60 fs/ext4/inode.c:320
       evict+0x5f4/0xae0 fs/inode.c:837
       __dentry_kill+0x209/0x660 fs/dcache.c:670
       shrink_kill+0xa9/0x2c0 fs/dcache.c:1137
       shrink_dentry_list+0x2e0/0x5e0 fs/dcache.c:1164
       prune_dcache_sb+0x10e/0x180 fs/dcache.c:1246
       super_cache_scan+0x369/0x4b0 fs/super.c:222
       do_shrink_slab+0x6df/0x10d0 mm/shrinker.c:437
       shrink_slab_memcg mm/shrinker.c:550 [inline]
       shrink_slab+0x7ef/0x10d0 mm/shrinker.c:628
       shrink_one+0x2d9/0x720 mm/vmscan.c:4921
       shrink_many mm/vmscan.c:4982 [inline]
       lru_gen_shrink_node mm/vmscan.c:5060 [inline]
       shrink_node+0x2f7d/0x35b0 mm/vmscan.c:6047
       kswapd_shrink_node mm/vmscan.c:6901 [inline]
       balance_pgdat mm/vmscan.c:7084 [inline]
       kswapd+0x145a/0x2820 mm/vmscan.c:7354
       kthread+0x711/0x8a0 kernel/kthread.c:463
       ret_from_fork+0x510/0xa50 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(fs_reclaim);
                               lock(&type->lock_class);
                               lock(fs_reclaim);
  lock(&type->lock_class);

 *** DEADLOCK ***

2 locks held by kswapd1/79:
 #0: ffffffff8e051820 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat mm/vmscan.c:6975 [inline]
 #0: ffffffff8e051820 (fs_reclaim){+.+.}-{0:0}, at: kswapd+0x92a/0x2820 mm/vmscan.c:7354
 #1: ffff88803fa5a0e0 (&type->s_umount_key#32){++++}-{4:4}, at: super_trylock_shared fs/super.c:563 [inline]
 #1: ffff88803fa5a0e0 (&type->s_umount_key#32){++++}-{4:4}, at: super_cache_scan+0x91/0x4b0 fs/super.c:197

stack backtrace:
CPU: 0 UID: 0 PID: 79 Comm: kswapd1 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e2/0x300 kernel/locking/lockdep.c:2043
 check_noncircular+0x12e/0x150 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain kernel/locking/lockdep.c:3908 [inline]
 __lock_acquire+0x15a6/0x2cf0 kernel/locking/lockdep.c:5237
 lock_acquire+0x107/0x340 kernel/locking/lockdep.c:5868
 down_write+0x96/0x1f0 kernel/locking/rwsem.c:1590
 keyring_clear+0xaf/0x240 security/keys/keyring.c:1658
 fscrypt_put_master_key+0xca/0x190 fs/crypto/keyring.c:80
 put_crypt_info+0x26d/0x310 fs/crypto/keysetup.c:573
 fscrypt_put_encryption_info+0xf6/0x140 fs/crypto/keysetup.c:787
 ext4_clear_inode+0x170/0x2f0 fs/ext4/super.c:1529
 ext4_evict_inode+0x9f6/0xe60 fs/ext4/inode.c:320
 evict+0x5f4/0xae0 fs/inode.c:837
 __dentry_kill+0x209/0x660 fs/dcache.c:670
 shrink_kill+0xa9/0x2c0 fs/dcache.c:1137
 shrink_dentry_list+0x2e0/0x5e0 fs/dcache.c:1164
 prune_dcache_sb+0x10e/0x180 fs/dcache.c:1246
 super_cache_scan+0x369/0x4b0 fs/super.c:222
 do_shrink_slab+0x6df/0x10d0 mm/shrinker.c:437
 shrink_slab_memcg mm/shrinker.c:550 [inline]
 shrink_slab+0x7ef/0x10d0 mm/shrinker.c:628
 shrink_one+0x2d9/0x720 mm/vmscan.c:4921
 shrink_many mm/vmscan.c:4982 [inline]
 lru_gen_shrink_node mm/vmscan.c:5060 [inline]
 shrink_node+0x2f7d/0x35b0 mm/vmscan.c:6047
 kswapd_shrink_node mm/vmscan.c:6901 [inline]
 balance_pgdat mm/vmscan.c:7084 [inline]
 kswapd+0x145a/0x2820 mm/vmscan.c:7354
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x510/0xa50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:246
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

