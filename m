Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C44E21397A
	for <lists+keyrings@lfdr.de>; Fri,  3 Jul 2020 13:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726396AbgGCLkZ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 3 Jul 2020 07:40:25 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:43725 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgGCLkZ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 3 Jul 2020 07:40:25 -0400
Received: by mail-io1-f70.google.com with SMTP id f13so16519771iok.10
        for <keyrings@vger.kernel.org>; Fri, 03 Jul 2020 04:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=C+xZpCu+1aqH0Q22E41rew5k7JF4gXiZv3aVoYwcaB0=;
        b=gXigF+264+SNSXqv5k0UrGPgeQWBHQD2gwO8daYK8WLQePyNTkLcIkIfNoG/rCSjVN
         cMKzgcmIbqfQ5BGQo3WrGr1Hu+xfygHqHSUEWRT1aRT2XTFS16o3QpgWbQSru1v55ra8
         oTgbQHWhJ2cHRha1j0w9/6XtRAy8GLzRXTHregmwpW22uQ8c38Bv5Bu0CaFbZYfhO64/
         aOtAifPkW70tsLCNXVOd5VCbxcw1E51+OTywhdnVLpcFM9FjAjW4Ml4mg4pyLOk1XCtj
         nClZjBT7cgie+Fp79xjItxKnU4fRSmYSE4qQXRASH1IlXRaZ2rMsDlPA6ihLtfldCtzA
         0usQ==
X-Gm-Message-State: AOAM531nWHMtW4d6k+3yQvqxJbFNz2IhvyuXEYl4yN+l/LCZXIcm/uYP
        iNMU/zQnZhKd1vNBm54ILZZahYUMoqwKkQv5xy/eBEx/DN3Q
X-Google-Smtp-Source: ABdhPJzan7DItbKw7hDeRJWpKWe6g+PyhxicS26IVff1Jc+DFsjUDurp+UsrXWLz9ZOKEfU0b02Cro5YZwrU47RQ0z2cMYGLs1mJ
MIME-Version: 1.0
X-Received: by 2002:a6b:c910:: with SMTP id z16mr11785836iof.120.1593776424237;
 Fri, 03 Jul 2020 04:40:24 -0700 (PDT)
Date:   Fri, 03 Jul 2020 04:40:24 -0700
In-Reply-To: <000000000000961dea05a95c9558@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009e40fa05a987fde8@google.com>
Subject: Re: INFO: task hung in request_key_tag
From:   syzbot <syzbot+46c77dc7e98c732de754@syzkaller.appspotmail.com>
To:     akpm@linux-foundation.org, dhowells@redhat.com,
        ebiederm@xmission.com, hch@infradead.org,
        herbert@gondor.apana.org.au, jarkko.sakkinen@linux.intel.com,
        jmorris@namei.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org, mcgrof@kernel.org,
        naresh.kamboju@linaro.org, penguin-kernel@i-love.sakura.ne.jp,
        serge@hallyn.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

syzbot has found a reproducer for the following crash on:

HEAD commit:    aab20039 Add linux-next specific files for 20200701
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=14000a5b100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=739f6fbf326049f4
dashboard link: https://syzkaller.appspot.com/bug?extid=46c77dc7e98c732de754
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=127e085b100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=107ffaa7100000

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+46c77dc7e98c732de754@syzkaller.appspotmail.com

INFO: task syz-executor067:6800 blocked for more than 143 seconds.
      Not tainted 5.8.0-rc3-next-20200701-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor067 D27632  6800   6794 0x00004000
Call Trace:
 context_switch kernel/sched/core.c:3445 [inline]
 __schedule+0x8b4/0x1e80 kernel/sched/core.c:4169
 schedule+0xd0/0x2a0 kernel/sched/core.c:4244
 bit_wait+0x12/0xa0 kernel/sched/wait_bit.c:199
 __wait_on_bit+0x60/0x190 kernel/sched/wait_bit.c:49
 out_of_line_wait_on_bit+0xd5/0x110 kernel/sched/wait_bit.c:64
 wait_on_bit include/linux/wait_bit.h:76 [inline]
 wait_for_key_construction+0x10b/0x140 security/keys/request_key.c:664
 request_key_tag+0x7a/0xb0 security/keys/request_key.c:705
 dns_query+0x257/0x6c3 net/dns_resolver/dns_query.c:128
 ceph_dns_resolve_name net/ceph/messenger.c:1887 [inline]
 ceph_parse_server_name net/ceph/messenger.c:1922 [inline]
 ceph_parse_ips+0x77f/0x8c0 net/ceph/messenger.c:1949
 ceph_parse_mon_ips+0x59/0xc0 net/ceph/ceph_common.c:411
 ceph_parse_source fs/ceph/super.c:271 [inline]
 ceph_parse_mount_param+0x1239/0x17e0 fs/ceph/super.c:322
 vfs_parse_fs_param fs/fs_context.c:117 [inline]
 vfs_parse_fs_param+0x203/0x550 fs/fs_context.c:98
 vfs_parse_fs_string+0xe6/0x150 fs/fs_context.c:161
 do_new_mount fs/namespace.c:2905 [inline]
 do_mount+0x1222/0x1df0 fs/namespace.c:3237
 __do_sys_mount fs/namespace.c:3447 [inline]
 __se_sys_mount fs/namespace.c:3424 [inline]
 __x64_sys_mount+0x18f/0x230 fs/namespace.c:3424
 do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:359
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x4401b9
Code: Bad RIP value.
RSP: 002b:00007fff4cd307c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 0030656c69662f2e RCX: 00000000004401b9
RDX: 0000000020000040 RSI: 0000000020000080 RDI: 00000000200002c0
RBP: 00000000006ca018 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000401a40
R13: 0000000000401ad0 R14: 0000000000000000 R15: 0000000000000000

Showing all locks held in the system:
1 lock held by khungtaskd/1146:
 #0: ffffffff89bc3000 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x260 kernel/locking/lockdep.c:5779
1 lock held by in:imklog/6692:
 #0: ffff88809a086af0 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0xe9/0x100 fs/file.c:928

=============================================

NMI backtrace for cpu 0
CPU: 0 PID: 1146 Comm: khungtaskd Not tainted 5.8.0-rc3-next-20200701-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x18f/0x20d lib/dump_stack.c:118
 nmi_cpu_backtrace.cold+0x70/0xb1 lib/nmi_backtrace.c:101
 nmi_trigger_cpumask_backtrace+0x1b3/0x223 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:147 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:253 [inline]
 watchdog+0xd89/0xf30 kernel/hung_task.c:339
 kthread+0x3b5/0x4a0 kernel/kthread.c:292
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:294
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 PID: 3852 Comm: systemd-journal Not tainted 5.8.0-rc3-next-20200701-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:pmd_none arch/x86/include/asm/pgtable.h:825 [inline]
RIP: 0010:pmd_none_or_trans_huge_or_clear_bad include/linux/pgtable.h:1198 [inline]
RIP: 0010:pmd_trans_unstable include/linux/pgtable.h:1223 [inline]
RIP: 0010:pmd_devmap_trans_unstable mm/memory.c:3496 [inline]
RIP: 0010:pmd_devmap_trans_unstable mm/memory.c:3494 [inline]
RIP: 0010:handle_pte_fault mm/memory.c:4198 [inline]
RIP: 0010:__handle_mm_fault mm/memory.c:4360 [inline]
RIP: 0010:handle_mm_fault+0x1da0/0x43f0 mm/memory.c:4397
Code: ff e9 9d f3 ff ff e8 0f 93 cf ff 48 89 ea 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 b9 20 00 00 4c 8b 65 00 <4c> 89 e3 31 ff 48 83 e3 9f 48 89 de e8 7f 8f cf ff 48 85 db 0f 84
RSP: 0000:ffffc900015d7d70 EFLAGS: 00000246
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff81a44fec
RDX: 1ffff11012ad8f4a RSI: ffffffff81a45861 RDI: 0000000000000007
RBP: ffff8880956c7a50 R08: 0000000000000000 R09: ffffffff8aaeb0e7
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000091cd0067
R13: 0000000000000000 R14: 0000000000000040 R15: 0000000000000001
FS:  00007fdaac0718c0(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fdaa9411000 CR3: 0000000094cdd000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 do_user_addr_fault+0x5a2/0xd00 arch/x86/mm/fault.c:1295
 handle_page_fault arch/x86/mm/fault.c:1365 [inline]
 exc_page_fault+0xab/0x170 arch/x86/mm/fault.c:1418
 asm_exc_page_fault+0x1e/0x30 arch/x86/include/asm/idtentry.h:565
RIP: 0033:0x7fdaab37b124
Code: Bad RIP value.
RSP: 002b:00007ffcfb2ef578 EFLAGS: 00010202
RAX: 00007fdaa9410fe0 RBX: 0000000000000090 RCX: 000000000021ffa0
RDX: 0000000000000090 RSI: 00007ffcfb2ef620 RDI: 00007fdaa9410fe0
RBP: 0000000000000000 R08: 0000000000220070 R09: 00007ffcfb2f26b0
R10: 000000000001b706 R11: 00007fdaa9410fa0 R12: 00005652b21dbe80
R13: 715c95999b8098ed R14: 00007ffcfb2ef810 R15: 00007ffcfb2ef620

