Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A5821057F
	for <lists+keyrings@lfdr.de>; Wed,  1 Jul 2020 09:53:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgGAHxT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 1 Jul 2020 03:53:19 -0400
Received: from mail-io1-f70.google.com ([209.85.166.70]:55850 "EHLO
        mail-io1-f70.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728504AbgGAHxR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 1 Jul 2020 03:53:17 -0400
Received: by mail-io1-f70.google.com with SMTP id k10so14458225ioh.22
        for <keyrings@vger.kernel.org>; Wed, 01 Jul 2020 00:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=pCgx09tytWT2OCCFM5CUCBjS62AEV0n/QT8HpV+90qg=;
        b=Sw28gS4L2V8V+EATegBuRUEygCY/e6/WH0TlDpfEMUSzDq95MBI/q+KaB0Yt0JuSBz
         NFwXrqf6T9UBvH4Yq3hX75A+F3c49ReATjpBuA8tjlFPJObzN2j8GyzSfTT6/K7PXpQe
         9sgohXEpwoNJqpLCJB0VJrbBVHzuzS+pzhsCOlpeedvlIjV+RcUtiyI+hM/Qx9DDNuJ3
         4q7GZigj3FEkhpZRHNEvY+oqisNa2IMu2ZjvBq30/ro9Y3RtpeIPmKvu0p3wA0K2f7aK
         wU4/77sOkmTAmEZwo9lezRCv7yMbRBhuIkEdcp2jsxVA/fsZKGIVMUbZz2vMa9RxmJDQ
         47Ew==
X-Gm-Message-State: AOAM530nCMeii/rZPTeWfwzqIzR75xVZrxvN9UdAnzO1HXoVXORfeGWt
        72SKyzygbyM6R5HuNaTs2a5i1toaAbJJzONp/pxnLNtGGPv6
X-Google-Smtp-Source: ABdhPJzXMiWcIS1KPV9Hr+lmXsCfEIGzH/drdmTr4JcuiVSyUgKTAwHs41Y+nxJv3hSASZkW3A38kjnqX5WFG4i5VgsG8Lgc4o0U
MIME-Version: 1.0
X-Received: by 2002:a92:8b90:: with SMTP id i138mr6947018ild.286.1593589995279;
 Wed, 01 Jul 2020 00:53:15 -0700 (PDT)
Date:   Wed, 01 Jul 2020 00:53:15 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000961dea05a95c9558@google.com>
Subject: INFO: task hung in request_key_tag
From:   syzbot <syzbot+46c77dc7e98c732de754@syzkaller.appspotmail.com>
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

HEAD commit:    c28e58ee Add linux-next specific files for 20200629
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=17925a9d100000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dcd26bbca17dd1db
dashboard link: https://syzkaller.appspot.com/bug?extid=46c77dc7e98c732de754
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this crash yet.

IMPORTANT: if you fix the bug, please add the following tag to the commit:
Reported-by: syzbot+46c77dc7e98c732de754@syzkaller.appspotmail.com

INFO: task syz-executor.3:23879 can't die for more than 143 seconds.
syz-executor.3  D27880 23879   7210 0x00004004
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
RIP: 0033:0x45cb29
Code: Bad RIP value.
RSP: 002b:00007f17e9e62c78 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00000000004f72e0 RCX: 000000000045cb29
RDX: 0000000020000040 RSI: 0000000020000600 RDI: 0000000020000240
RBP: 000000000078bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000772 R14: 00000000004ca761 R15: 00007f17e9e636d4
INFO: task syz-executor.3:23879 blocked for more than 143 seconds.
      Not tainted 5.8.0-rc3-next-20200629-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.3  D27880 23879   7210 0x00004004
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
RIP: 0033:0x45cb29
Code: Bad RIP value.
RSP: 002b:00007f17e9e62c78 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00000000004f72e0 RCX: 000000000045cb29
RDX: 0000000020000040 RSI: 0000000020000600 RDI: 0000000020000240
RBP: 000000000078bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000772 R14: 00000000004ca761 R15: 00007f17e9e636d4
INFO: task syz-executor.3:23899 can't die for more than 144 seconds.
syz-executor.3  D29304 23899   7210 0x00000006
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
RIP: 0033:0x45cb29
Code: Bad RIP value.
RSP: 002b:00007f17e9e20c78 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00000000004f72e0 RCX: 000000000045cb29
RDX: 0000000020000040 RSI: 0000000020000600 RDI: 0000000020000240
RBP: 000000000078c040 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000772 R14: 00000000004ca761 R15: 00007f17e9e216d4
INFO: task syz-executor.3:23899 blocked for more than 144 seconds.
      Not tainted 5.8.0-rc3-next-20200629-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.3  D29304 23899   7210 0x00000006
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
RIP: 0033:0x45cb29
Code: Bad RIP value.
RSP: 002b:00007f17e9e20c78 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00000000004f72e0 RCX: 000000000045cb29
RDX: 0000000020000040 RSI: 0000000020000600 RDI: 0000000020000240
RBP: 000000000078c040 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000772 R14: 00000000004ca761 R15: 00007f17e9e216d4
INFO: task syz-executor.1:23880 can't die for more than 144 seconds.
syz-executor.1  D27912 23880   6964 0x00000006
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
RIP: 0033:0x45cb29
Code: Bad RIP value.
RSP: 002b:00007fe6e7011c78 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00000000004f72e0 RCX: 000000000045cb29
RDX: 0000000020000040 RSI: 0000000020000600 RDI: 0000000020000080
RBP: 000000000078bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000772 R14: 00000000004ca761 R15: 00007fe6e70126d4
INFO: task syz-executor.1:23880 blocked for more than 145 seconds.
      Not tainted 5.8.0-rc3-next-20200629-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.1  D27912 23880   6964 0x00000006
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
RIP: 0033:0x45cb29
Code: Bad RIP value.
RSP: 002b:00007fe6e7011c78 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00000000004f72e0 RCX: 000000000045cb29
RDX: 0000000020000040 RSI: 0000000020000600 RDI: 0000000020000080
RBP: 000000000078bf00 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000772 R14: 00000000004ca761 R15: 00007fe6e70126d4
INFO: task syz-executor.1:23885 can't die for more than 145 seconds.
syz-executor.1  D27880 23885   6964 0x00004004
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
RIP: 0033:0x45cb29
Code: Bad RIP value.
RSP: 002b:00007fe6e6ff0c78 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00000000004f72e0 RCX: 000000000045cb29
RDX: 0000000020000040 RSI: 0000000020000600 RDI: 0000000020000080
RBP: 000000000078bfa0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000772 R14: 00000000004ca761 R15: 00007fe6e6ff16d4
INFO: task syz-executor.1:23885 blocked for more than 145 seconds.
      Not tainted 5.8.0-rc3-next-20200629-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
syz-executor.1  D27880 23885   6964 0x00004004
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
RIP: 0033:0x45cb29
Code: Bad RIP value.
RSP: 002b:00007fe6e6ff0c78 EFLAGS: 00000246 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00000000004f72e0 RCX: 000000000045cb29
RDX: 0000000020000040 RSI: 0000000020000600 RDI: 0000000020000080
RBP: 000000000078bfa0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
R13: 0000000000000772 R14: 00000000004ca761 R15: 00007fe6e6ff16d4

Showing all locks held in the system:
1 lock held by khungtaskd/1151:
 #0: ffffffff89bc3000 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x53/0x260 kernel/locking/lockdep.c:5779
1 lock held by in:imklog/6487:
 #0: ffff8880934365f0 (&f->f_pos_lock){+.+.}-{3:3}, at: __fdget_pos+0xe9/0x100 fs/file.c:928
2 locks held by agetty/6717:
 #0: ffff8880a00c5098 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:267
 #1: ffffc90000f942e8 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0x223/0x1a30 drivers/tty/n_tty.c:2156
2 locks held by agetty/6721:
 #0: ffff888093f4e098 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x22/0x80 drivers/tty/tty_ldisc.c:267
 #1: ffffc90000f642e8 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0x223/0x1a30 drivers/tty/n_tty.c:2156

=============================================

NMI backtrace for cpu 1
CPU: 1 PID: 1151 Comm: khungtaskd Not tainted 5.8.0-rc3-next-20200629-syzkaller #0
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
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 PID: 3865 Comm: systemd-journal Not tainted 5.8.0-rc3-next-20200629-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:memory_is_nonzero mm/kasan/generic.c:107 [inline]
RIP: 0010:memory_is_poisoned_n mm/kasan/generic.c:134 [inline]
RIP: 0010:memory_is_poisoned mm/kasan/generic.c:165 [inline]
RIP: 0010:check_memory_region_inline mm/kasan/generic.c:183 [inline]
RIP: 0010:check_memory_region+0x59/0x180 mm/kasan/generic.c:192
Code: 00 49 83 e9 01 48 89 fd 48 b8 00 00 00 00 00 fc ff df 4d 89 ca 48 c1 ed 03 49 c1 ea 03 48 01 c5 49 01 c2 48 89 e8 49 8d 5a 01 <48> 89 da 48 29 ea 48 83 fa 10 7e 63 41 89 eb 41 83 e3 07 75 74 4c
RSP: 0018:ffffc90001657970 EFLAGS: 00000086
RAX: fffffbfff18b3b44 RBX: fffffbfff18b3b45 RCX: ffffffff8159e633
RDX: 0000000000000000 RSI: 0000000000000008 RDI: ffffffff8c59da20
RBP: fffffbfff18b3b44 R08: 0000000000000000 R09: ffffffff8c59da27
R10: fffffbfff18b3b44 R11: 0000000000000000 R12: ffff888093ca2080
R13: 0000000000000000 R14: cf6300484b50d8b0 R15: 0000000000000000
FS:  00007fec0e4d08c0(0000) GS:ffff8880ae600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fec0bd2e000 CR3: 0000000093db6000 CR4: 00000000001526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 instrument_atomic_read include/linux/instrumented.h:56 [inline]
 test_bit include/asm-generic/bitops/instrumented-non-atomic.h:110 [inline]
 hlock_class kernel/locking/lockdep.c:179 [inline]
 lookup_chain_cache_add kernel/locking/lockdep.c:3127 [inline]
 validate_chain kernel/locking/lockdep.c:3183 [inline]
 __lock_acquire+0x16e3/0x56e0 kernel/locking/lockdep.c:4380
 lock_acquire+0x1f1/0xad0 kernel/locking/lockdep.c:4959
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:110 [inline]
 _raw_spin_lock_irqsave+0x8c/0xc0 kernel/locking/spinlock.c:159
 __debug_check_no_obj_freed lib/debugobjects.c:955 [inline]
 debug_check_no_obj_freed+0xc7/0x41c lib/debugobjects.c:998
 free_pages_prepare mm/page_alloc.c:1215 [inline]
 __free_pages_ok+0x20b/0xc90 mm/page_alloc.c:1467
 slab_destroy mm/slab.c:1625 [inline]
 slabs_destroy+0x89/0xc0 mm/slab.c:1641
 cache_flusharray mm/slab.c:3409 [inline]
 ___cache_free+0x516/0x750 mm/slab.c:3459
 qlink_free mm/kasan/quarantine.c:148 [inline]
 qlist_free_all+0x79/0x140 mm/kasan/quarantine.c:167
 quarantine_reduce+0x17e/0x200 mm/kasan/quarantine.c:260
 __kasan_kmalloc.constprop.0+0x9e/0xd0 mm/kasan/common.c:475
 slab_post_alloc_hook mm/slab.h:535 [inline]
 slab_alloc mm/slab.c:3316 [inline]
 kmem_cache_alloc+0x148/0x550 mm/slab.c:3486
 prepare_creds+0x39/0x6c0 kernel/cred.c:258
 access_override_creds fs/open.c:353 [inline]
 do_faccessat+0x3d7/0x820 fs/open.c:417
 do_syscall_64+0x60/0xe0 arch/x86/entry/common.c:359
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7fec0d78c9c7
Code: Bad RIP value.
RSP: 002b:00007ffd86b9dd78 EFLAGS: 00000246 ORIG_RAX: 0000000000000015
RAX: ffffffffffffffda RBX: 00007ffd86ba0c90 RCX: 00007fec0d78c9c7
RDX: 00007fec0e1fda00 RSI: 0000000000000000 RDI: 0000557c536289a3
RBP: 00007ffd86b9ddb0 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000069 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007ffd86ba0c90 R15: 00007ffd86b9e2a0


---
This bug is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this bug report. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
