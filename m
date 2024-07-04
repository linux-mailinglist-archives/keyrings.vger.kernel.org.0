Return-Path: <keyrings+bounces-1695-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C0C927815
	for <lists+keyrings@lfdr.de>; Thu,  4 Jul 2024 16:18:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4B761C21B22
	for <lists+keyrings@lfdr.de>; Thu,  4 Jul 2024 14:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8868B1AEFEB;
	Thu,  4 Jul 2024 14:18:20 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30661AEFE9
	for <keyrings@vger.kernel.org>; Thu,  4 Jul 2024 14:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720102700; cv=none; b=ftxp6asxuCyBV9y9l6gl024z1/Og48Rjwe6BM/LIOWJ8lO2z2RADNeHctn8BE81ltQU8eWk0hq4uQTUW6n+TvvP8OPYPoZsgad/bHJlaUY9ZByjjI344oe7qV3WlfPfhLiaXrpD0h0n5IZDsMcA1SFcNUkgosnUohzztS92gaqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720102700; c=relaxed/simple;
	bh=1smwYFCQdFQQ+pWuZhmovy2EI8RvSR9Ox32GS+V1Eqs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=QB8C7RMPmzQG/HkiiKwDFsQCXMZmyS1xPNfVCGTSz3RP353RPDa17VMZL9KnfodQ8Q3scCScadVeX4YzFTc8XizZc+jWMBv3lcLG2zCaemAyAc3IqTQE6Pp6y+Sfp+4h5RwRl35aLafRGAiWh5VSkFOJ2wa/LdjUYISc9ZZefRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7f631a28c84so90712339f.3
        for <keyrings@vger.kernel.org>; Thu, 04 Jul 2024 07:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720102698; x=1720707498;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OdkZATJ7OGmsuHw198PHVJ2z9yJtklx34ktzk5b34qM=;
        b=wi5Hmwb+PIp9pdb3pf6AZejwkMTBXCw8eBZTGvFpfV4Fb0ETMfQzDylMsu98jqpUbO
         u5ZTg4IyXTzfBVxPH5UXJua0MSa/TZpSkZMOUHTX2gwSWW1C9PP5cT9OlBmQ7quM+0n3
         3XWMoUs6naRRlj3+5Z20R5dvSLaquA2VPuSzicOioNr0ZdkweSTf2njUwBUsDl6Sjxt6
         pzCfg5v1Sa43uhfO1zh65crbvI3JWVDb/0KuRDWQgM522kVcvP9LLnE97lUCsbiqHRaf
         SpmNugpGx3pMGNdHko3mRkRtM1raga4R6e2dJwumptUcKWp4dImW91uE+0ncxX1O9MGQ
         rc6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUW4InDzOG6FsNqbk0R492Z46Nk9rcW6Sop0Qvrg7bprj4tCKQuiVjGDxSsr1HStmbjxoV5RkAEEjjekcS0fXsjHCAjm5jZVNI=
X-Gm-Message-State: AOJu0YzL8XHvRepkhunJUZNsCrbggxE2mgIbYgJ+1Bptj+I0BXmLQ63n
	I6WHYTwaE51r8e+hQhC7N2HdsFuv54mRDNf0UZ0ANcx+fNsh0LqA/pFKzM9wlNi+cv9wsaZhgkF
	kgGFEw8KhzXiYDCQY6TKnrIjjraLmdWkxcSw58T2EYp79/pF2JkHQNQ4=
X-Google-Smtp-Source: AGHT+IHt7B2//ng4CP9pxz/XHbuJQsdbZaMaQQF0GUJZb5OndszSfzXEAxtT8oIGTFDMeWPyXe7aFdP1l7ua6pzOFF3QX5ZxVkEc
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6638:24c7:b0:4b9:6c10:36c1 with SMTP id
 8926c6da1cb9f-4bf60de4273mr218703173.2.1720102698181; Thu, 04 Jul 2024
 07:18:18 -0700 (PDT)
Date: Thu, 04 Jul 2024 07:18:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004d74cd061c6c9e68@google.com>
Subject: [syzbot] [lsm?] [keyrings?] KCSAN: data-race in __se_sys_keyctl /
 key_task_permission (3)
From: syzbot <syzbot+8c446f45cf5815e9110a@syzkaller.appspotmail.com>
To: dhowells@redhat.com, jarkko@kernel.org, jmorris@namei.org, 
	keyrings@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-security-module@vger.kernel.org, paul@paul-moore.com, serge@hallyn.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    8a9c6c40432e Merge tag 'io_uring-6.10-20240703' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=113817ae980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5b9537cd00be479e
dashboard link: https://syzkaller.appspot.com/bug?extid=8c446f45cf5815e9110a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f01153f3ec8e/disk-8a9c6c40.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/04b88663a824/vmlinux-8a9c6c40.xz
kernel image: https://storage.googleapis.com/syzbot-assets/63c518cc63c5/bzImage-8a9c6c40.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8c446f45cf5815e9110a@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in __se_sys_keyctl / key_task_permission

write to 0xffff88812277dd70 of 4 bytes by task 19442 on cpu 0:
 keyctl_setperm_key security/keys/keyctl.c:1098 [inline]
 __do_sys_keyctl security/keys/keyctl.c:1926 [inline]
 __se_sys_keyctl+0xab5/0xbb0 security/keys/keyctl.c:1874
 __x64_sys_keyctl+0x67/0x80 security/keys/keyctl.c:1874
 x64_sys_call+0x2bf5/0x2d70 arch/x86/include/generated/asm/syscalls_64.h:251
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xc9/0x1c0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff88812277dd70 of 4 bytes by task 19441 on cpu 1:
 key_task_permission+0x14a/0x2c0 security/keys/permission.c:55
 lookup_user_key+0x9ea/0xdf0 security/keys/process_keys.c:803
 keyctl_setperm_key security/keys/keyctl.c:1083 [inline]
 __do_sys_keyctl security/keys/keyctl.c:1926 [inline]
 __se_sys_keyctl+0x829/0xbb0 security/keys/keyctl.c:1874
 __x64_sys_keyctl+0x67/0x80 security/keys/keyctl.c:1874
 x64_sys_call+0x2bf5/0x2d70 arch/x86/include/generated/asm/syscalls_64.h:251
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xc9/0x1c0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

value changed: 0x3d010000 -> 0x00000000

Reported by Kernel Concurrency Sanitizer on:
CPU: 1 PID: 19441 Comm: syz.1.4799 Tainted: G        W          6.10.0-rc6-syzkaller-00067-g8a9c6c40432e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/07/2024
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup

