Return-Path: <keyrings+bounces-2125-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B3F97E153
	for <lists+keyrings@lfdr.de>; Sun, 22 Sep 2024 13:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3C5CB20BF6
	for <lists+keyrings@lfdr.de>; Sun, 22 Sep 2024 11:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90AA175D2D;
	Sun, 22 Sep 2024 11:43:05 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA8113C3D3
	for <keyrings@vger.kernel.org>; Sun, 22 Sep 2024 11:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727005385; cv=none; b=E/cVC+kCe49Cxc0d/Hh7hP0QxnslRYhzt6edR3DR6ZjUQmjl8y0E0HRGeQqnZHr/TG9v1SL7Um8hHGnuswfQRfBt/0eiZESb0fRHNMouykGXx6lhFh1gmelblV2pMuAhvPv6EpWbO+37uLKj+m2HE6bo8EheFG0uX6rJ0yEQLKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727005385; c=relaxed/simple;
	bh=EPf0nnywD0niFpTQOXAPIemPZxBmfJ1AMrM99RvGy4c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=t3RmgZjMVAOVBr4oy/mzVUHGXgjspYTAjA9E8ubEbI1W8ceySf8VYQaNUdiadOrfwp5htbTQArE0qfobXVSfIiLklGs4fISIp2Stp2zvrWko/f4FAm1XO03EXa11HWlY4MFu0BxgzMC560JmBSQ7am1SQri3rmnQHdtBiyexEgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-82aa467836eso647347839f.2
        for <keyrings@vger.kernel.org>; Sun, 22 Sep 2024 04:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727005383; x=1727610183;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aLi2ud1YrNOTbnPgH971uSVNjS9RgWm0J+mPsuQ1+ec=;
        b=KRoGsi4wjioesHYwMF5iBRWzMx2C8l/vvgrevsB/Wsyeb/ygfKyPQ/g7J9Fj/d9kkh
         wX1i6/8Bk+OALMTvPUFN/wChvfwF6OV67MHM4WPiWKs5CfgFSI0SFVuaZ91MLqJ4K0UA
         dzgXeLfRpkUVoJZERkx2b5YeV9ZK5QUvrPFPKSdUxXmRrg1pt8m1A3tK3JbRi/USmS+y
         vYbxHAkglBvhEfY8E1BKIzPnrlgoCmRLJk3FEv5C/jxmnZLeKhw+VQ07KwVjPPS5MBb2
         xqtKv3OIA/v8ogZDYfUr0hpz/IY3Odo8BcmIeQoi/gS7glmS2DxEmJ6+CVpip6bjU4ia
         x2QA==
X-Forwarded-Encrypted: i=1; AJvYcCUSebUXzublx/8bYFH5aXkgVIFGk8PzSFY5Jtcs3/nYEWjtBbTt6AtihRku7z6r/3lHDzj/8FWnvg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA1egzjNugep5QaRp7YlUYGLjXvIVvud5x+ncw6mUtR1QluMbl
	qClC0d/hWDH3eXUj4Zi1fgNdmugXSSw5IJuW2ZxoJQLeBGb9joEcxORI5SzS3ZWYKDjwN6xcLDO
	bSMUhH0g0egpaLJE1BZkCrORDJtb+RshwbUPwuTzGpyFRQMLE+nGBfio=
X-Google-Smtp-Source: AGHT+IFM9ZEuGEIuZuX40SVqB5D8L7YbOd0D9A7KP1xYu9BCfF+DFyvYhUywTy5gw8yKDXxur34NDfiws80782ihXI+Y6OABNnb2
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1908:b0:3a0:911d:c277 with SMTP id
 e9e14a558f8ab-3a0c8c6a282mr78314455ab.5.1727005383062; Sun, 22 Sep 2024
 04:43:03 -0700 (PDT)
Date: Sun, 22 Sep 2024 04:43:03 -0700
In-Reply-To: <tencent_AC4A33669E2C1B724B1C1BCA2552BA67BB08@qq.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <66f002c7.050a0220.1b7b75.0002.GAE@google.com>
Subject: Re: [syzbot] [keyrings?] [lsm?] [ext4?] possible deadlock in
 keyring_clear (2)
From: syzbot <syzbot+1b2d1134e0b675176a15@syzkaller.appspotmail.com>
To: dhowells@redhat.com, eadavis@qq.com, jarkko@kernel.org, jmorris@namei.org, 
	keyrings@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	paul@paul-moore.com, serge@hallyn.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
possible deadlock in keyring_clear

======================================================
WARNING: possible circular locking dependency detected
6.11.0-syzkaller-08481-g88264981f208-dirty #0 Not tainted
------------------------------------------------------
kswapd0/79 is trying to acquire lock:
ffff888000b01258 (&type->lock_class){+.+.}-{3:3}, at: keyring_clear+0xb2/0x350 security/keys/keyring.c:1655

but task is already holding lock:
ffffffff8ea36740 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat mm/vmscan.c:6844 [inline]
ffffffff8ea36740 (fs_reclaim){+.+.}-{0:0}, at: kswapd+0xbf1/0x3700 mm/vmscan.c:7226

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (fs_reclaim){+.+.}-{0:0}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5822
       __fs_reclaim_acquire mm/page_alloc.c:3834 [inline]
       fs_reclaim_acquire+0x88/0x140 mm/page_alloc.c:3848
       might_alloc include/linux/sched/mm.h:327 [inline]
       slab_pre_alloc_hook mm/slub.c:4037 [inline]
       slab_alloc_node mm/slub.c:4115 [inline]
       __kmalloc_cache_noprof+0x3d/0x2c0 mm/slub.c:4291
       kmalloc_noprof include/linux/slab.h:878 [inline]
       kzalloc_noprof include/linux/slab.h:1014 [inline]
       assoc_array_insert_in_empty_tree lib/assoc_array.c:457 [inline]
       assoc_array_insert+0x52c/0x33e0 lib/assoc_array.c:991
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
       ext4_clear_inode+0x15b/0x1c0 fs/ext4/super.c:1525
       ext4_evict_inode+0xabc/0xf50 fs/ext4/inode.c:323
       evict+0x4e8/0x9b0 fs/inode.c:731
       __dentry_kill+0x20d/0x630 fs/dcache.c:615
       shrink_kill+0xa9/0x2c0 fs/dcache.c:1060
       shrink_dentry_list+0x2c0/0x5b0 fs/dcache.c:1087
       prune_dcache_sb+0x10f/0x180 fs/dcache.c:1168
       super_cache_scan+0x34f/0x4b0 fs/super.c:221
       do_shrink_slab+0x701/0x1160 mm/shrinker.c:435
       shrink_slab_memcg mm/shrinker.c:548 [inline]
       shrink_slab+0x878/0x14d0 mm/shrinker.c:626
       shrink_one+0x43b/0x850 mm/vmscan.c:4818
       shrink_many mm/vmscan.c:4879 [inline]
       lru_gen_shrink_node mm/vmscan.c:4957 [inline]
       shrink_node+0x3799/0x3de0 mm/vmscan.c:5937
       kswapd_shrink_node mm/vmscan.c:6765 [inline]
       balance_pgdat mm/vmscan.c:6957 [inline]
       kswapd+0x1ca3/0x3700 mm/vmscan.c:7226
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
 #0: ffffffff8ea36740 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat mm/vmscan.c:6844 [inline]
 #0: ffffffff8ea36740 (fs_reclaim){+.+.}-{0:0}, at: kswapd+0xbf1/0x3700 mm/vmscan.c:7226
 #1: ffff888035f440e0 (&type->s_umount_key#32){++++}-{3:3}, at: super_trylock_shared fs/super.c:562 [inline]
 #1: ffff888035f440e0 (&type->s_umount_key#32){++++}-{3:3}, at: super_cache_scan+0x94/0x4b0 fs/super.c:196

stack backtrace:
CPU: 0 UID: 0 PID: 79 Comm: kswapd0 Not tainted 6.11.0-syzkaller-08481-g88264981f208-dirty #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
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
 ext4_clear_inode+0x15b/0x1c0 fs/ext4/super.c:1525
 ext4_evict_inode+0xabc/0xf50 fs/ext4/inode.c:323
 evict+0x4e8/0x9b0 fs/inode.c:731
 __dentry_kill+0x20d/0x630 fs/dcache.c:615
 shrink_kill+0xa9/0x2c0 fs/dcache.c:1060
 shrink_dentry_list+0x2c0/0x5b0 fs/dcache.c:1087
 prune_dcache_sb+0x10f/0x180 fs/dcache.c:1168
 super_cache_scan+0x34f/0x4b0 fs/super.c:221
 do_shrink_slab+0x701/0x1160 mm/shrinker.c:435
 shrink_slab_memcg mm/shrinker.c:548 [inline]
 shrink_slab+0x878/0x14d0 mm/shrinker.c:626
 shrink_one+0x43b/0x850 mm/vmscan.c:4818
 shrink_many mm/vmscan.c:4879 [inline]
 lru_gen_shrink_node mm/vmscan.c:4957 [inline]
 shrink_node+0x3799/0x3de0 mm/vmscan.c:5937
 kswapd_shrink_node mm/vmscan.c:6765 [inline]
 balance_pgdat mm/vmscan.c:6957 [inline]
 kswapd+0x1ca3/0x3700 mm/vmscan.c:7226
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


Tested on:

commit:         88264981 Merge tag 'sched_ext-for-6.12' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14ee4e07980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e851828834875d6f
dashboard link: https://syzkaller.appspot.com/bug?extid=1b2d1134e0b675176a15
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
patch:          https://syzkaller.appspot.com/x/patch.diff?x=174eec27980000


