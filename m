Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56458163483
	for <lists+keyrings@lfdr.de>; Tue, 18 Feb 2020 22:13:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbgBRVND (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 18 Feb 2020 16:13:03 -0500
Received: from mga01.intel.com ([192.55.52.88]:12302 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbgBRVND (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 18 Feb 2020 16:13:03 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Feb 2020 13:13:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,457,1574150400"; 
   d="scan'208";a="348765756"
Received: from unknown (HELO localhost) ([10.252.27.59])
  by fmsmga001.fm.intel.com with ESMTP; 18 Feb 2020 13:13:00 -0800
Date:   Tue, 18 Feb 2020 23:12:59 +0200
From:   Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
To:     dhowells@redhat.com
Cc:     jmorris@namei.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org, serge@hallyn.com
Subject: Re: kernel BUG at lib/assoc_array.c:LINE!
Message-ID: <20200218211259.GA19673@linux.intel.com>
References: <000000000000f4bf93059db8b081@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000000000000f4bf93059db8b081@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Mon, Feb 03, 2020 at 08:44:11PM -0800, syzbot wrote:
> Hello, > 
> syzbot found the following crash on:
> 
> HEAD commit:    46d6b7be Merge git://git.kernel.org/pub/scm/linux/kernel/g..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=11383a79e00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=6dda7ccc1e75a63f
> dashboard link: https://syzkaller.appspot.com/bug?extid=23e14950fa7550d86091
> compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
> 
> Unfortunately, I don't have any reproducer for this crash yet.
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+23e14950fa7550d86091@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> kernel BUG at lib/assoc_array.c:652!
> invalid opcode: 0000 [#1] PREEMPT SMP KASAN
> CPU: 0 PID: 2778 Comm: kworker/0:37 Not tainted 5.5.0-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> Workqueue: afs afs_manage_cell
> RIP: 0010:assoc_array_insert_into_terminal_node lib/assoc_array.c:652 [inline]
> RIP: 0010:assoc_array_insert+0x2baa/0x2bd0 lib/assoc_array.c:1001
> Code: 0f 0b e8 a9 64 d4 fd 0f 0b e8 a2 64 d4 fd 0f 0b e8 9b 64 d4 fd 0f 0b e8 94 64 d4 fd 0f 0b e8 8d 64 d4 fd 0f 0b e8 86 64 d4 fd <0f> 0b e8 7f 64 d4 fd 0f 0b e8 78 64 d4 fd 0f 0b e8 71 64 d4 fd 0f
> RSP: 0018:ffffc900087ff810 EFLAGS: 00010293
> RAX: ffffffff83a25a7a RBX: 1ffff11012d568af RCX: ffff88809f34a580
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffc900087ff920 R08: ffffffff83a249fd R09: ffffffff83538f4f
> R10: ffff88809f34a580 R11: 0000000000000004 R12: ffff888096ab4588
> R13: ffff888096ab4500 R14: ffff888096ab4578 R15: dffffc0000000000
> FS:  0000000000000000(0000) GS:ffff8880aea00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000738000 CR3: 0000000054a3b000 CR4: 00000000001406f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  __key_link_begin+0xfe/0x230 security/keys/keyring.c:1316
>  construct_alloc_key security/keys/request_key.c:404 [inline]
>  construct_key_and_link security/keys/request_key.c:499 [inline]
>  request_key_and_link+0x9b6/0x1680 security/keys/request_key.c:637
>  request_key_tag+0x53/0x190 security/keys/request_key.c:701
>  dns_query+0x266/0x6c0 net/dns_resolver/dns_query.c:128
>  afs_dns_query+0xdd/0x320 fs/afs/addr_list.c:249
>  afs_update_cell fs/afs/cell.c:391 [inline]
>  afs_manage_cell+0xda2/0x1500 fs/afs/cell.c:693
>  process_one_work+0x7f5/0x10f0 kernel/workqueue.c:2264
>  worker_thread+0xbbc/0x1630 kernel/workqueue.c:2410
>  kthread+0x332/0x350 kernel/kthread.c:255
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> Modules linked in:
> ---[ end trace 9dabb2deade74362 ]---
> RIP: 0010:assoc_array_insert_into_terminal_node lib/assoc_array.c:652 [inline]
> RIP: 0010:assoc_array_insert+0x2baa/0x2bd0 lib/assoc_array.c:1001
> Code: 0f 0b e8 a9 64 d4 fd 0f 0b e8 a2 64 d4 fd 0f 0b e8 9b 64 d4 fd 0f 0b e8 94 64 d4 fd 0f 0b e8 8d 64 d4 fd 0f 0b e8 86 64 d4 fd <0f> 0b e8 7f 64 d4 fd 0f 0b e8 78 64 d4 fd 0f 0b e8 71 64 d4 fd 0f
> RSP: 0018:ffffc900087ff810 EFLAGS: 00010293
> RAX: ffffffff83a25a7a RBX: 1ffff11012d568af RCX: ffff88809f34a580
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: ffffc900087ff920 R08: ffffffff83a249fd R09: ffffffff83538f4f
> R10: ffff88809f34a580 R11: 0000000000000004 R12: ffff888096ab4588
> R13: ffff888096ab4500 R14: ffff888096ab4578 R15: dffffc0000000000
> FS:  0000000000000000(0000) GS:ffff8880aea00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00000000013e4978 CR3: 000000008adb2000 CR4: 00000000001406f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
> 
> ---
> This bug is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this bug report. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

The arguments for request_key_and_link() are fairly constrained:

type == &key_type_dns_resolver
description == "afsdb:<cell name>"
domain_tag == net->key_domain
callout_info == "srv=1"
callout_len == 5
aux == NULL
dest_keyring == NULL
flags == KEY_ALLOC_IN_QUOTA

(manually resolved)

The only obvious moving part I see is the key type implementatio i.e.
net/dns_resolver/dns_key.c.

/Jarkko
