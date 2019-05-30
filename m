Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 816BD3018E
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2019 20:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfE3SMw (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 30 May 2019 14:12:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:60058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725961AbfE3SMw (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 30 May 2019 14:12:52 -0400
Received: from gmail.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0209E25D83;
        Thu, 30 May 2019 18:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559239971;
        bh=9Ww7NltoWCg41xFzNFQ69I91y7QKfpdhx0v/2M6wxXo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=y3ozm1WdSv+jrAziwx4V/Fxqobr8rzP8zUSQNFCn3jHuuGfQqwyxO5M+/XJGry4Yp
         qHBjLXyRFlv+yp1lgrkxckPI4FjxdQJ56IsaZuiU9IfjGgusm9ff9fkngIUZDTo3Vn
         MFQ/38BweZX0pKZjP51uivtCJN7sLltr7/ovcjnc=
Date:   Thu, 30 May 2019 11:12:49 -0700
From:   Eric Biggers <ebiggers@kernel.org>
To:     David Howells <dhowells@redhat.com>
Cc:     keyrings@vger.kernel.org,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        James Morris <jamorris@linux.microsoft.com>,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] keys: Miscellany [ver #2]
Message-ID: <20190530181248.GC70051@gmail.com>
References: <155923711088.949.14909672457214372214.stgit@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155923711088.949.14909672457214372214.stgit@warthog.procyon.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Thu, May 30, 2019 at 06:25:11PM +0100, David Howells wrote:
> 
> Here are some miscellaneous keyrings fixes and improvements intended for
> the next merge window:
> 
>  (1) Fix a bunch of warnings from sparse, including missing RCU bits and
>      kdoc-function argument mismatches
> 
>  (2) Implement a keyctl to allow a key to be moved from one keyring to
>      another, with the option of prohibiting key replacement in the
>      destination keyring.
> 
>  (3) Grant Link permission to possessors of request_key_auth tokens so that
>      upcall servicing daemons can more easily arrange things such that only
>      the necessary auth key is passed to the actual service program, and
>      not all the auth keys a daemon might possesss.
> 
>  (4) Improvement in lookup_user_key().
> 
>  (5) Implement a keyctl to allow keyrings subsystem capabilities to be
>      queried.
> 
> The patches can be found on the following branch:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-misc
> 

syzkaller still manages to crash something in the keys subsystem really quickly
when I run it on that branch (commit 35036b7e765b6):

RAX: ffffffffffffffda RBX: 000000000071bf00 RCX: 0000000000458a09
RDX: 0000000020001800 RSI: 00000000200017c0 RDI: 0000000020001780
RBP: 00007f784d775ca0 R08: fffffffffffffffd R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000246 R12: 00007f784d7766d4
R13: 00000000004a63d9 R14: 00000000006e33f8 R15: 0000000000000003
BUG: unable to handle page fault for address: ffffeba31fffffd0
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0 
Oops: 0000 [#1] SMP KASAN
CPU: 5 PID: 10320 Comm: syz-executor.3 Not tainted 5.2.0-rc1-00010-g35036b7e765b6 #3
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.10.2-1 04/01/2014
RIP: 0010:__read_once_size include/linux/compiler.h:194 [inline]
RIP: 0010:compound_head include/linux/page-flags.h:172 [inline]
RIP: 0010:virt_to_head_page include/linux/mm.h:720 [inline]
RIP: 0010:virt_to_cache mm/slab.c:376 [inline]
RIP: 0010:kfree+0x7f/0x1d0 mm/slab.c:3751
Code: 7f 77 00 00 48 01 d0 48 89 df 48 c1 e8 0c 48 8d 14 c5 00 00 00 00 48 29 c2 48 89 d0 48 ba 00 00 00 00 00 ea ff ff 48 8d 04 c2 <48> 8b 50 08 48 8d 4a ff 83 e2 01 48 0f 45 c1 4c 8b 68 18 49 63 75
RSP: 0018:ffff88800a7f7bf0 EFLAGS: 00010016
RAX: ffffeba31fffffc8 RBX: 0000003ffffffffc RCX: 0000000000000000
RDX: ffffea0000000000 RSI: 0000000000000000 RDI: 0000003ffffffffc
RBP: ffff88800a7f7c10 R08: ffffffff83bf24c0 R09: ffffed100da2e448
R10: 0000000000000001 R11: ffffed100da2e447 R12: 0000000000000202
R13: ffffffff824c2d76 R14: dffffc0000000000 R15: ffff88800f1cf000
FS:  00007f784d776700(0000) GS:ffff88806d140000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffeba31fffffd0 CR3: 000000006932d004 CR4: 0000000000760ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 assoc_array_cancel_edit+0x56/0xa0 lib/assoc_array.c:1428
 __key_link_end+0x7e/0x170 security/keys/keyring.c:1360
 key_create_or_update+0x868/0xbb0 security/keys/key.c:943
 __do_sys_add_key security/keys/keyctl.c:134 [inline]
 __se_sys_add_key+0x134/0x380 security/keys/keyctl.c:74
 __x64_sys_add_key+0xbe/0x150 security/keys/keyctl.c:74
 do_syscall_64+0x9e/0x4e0 arch/x86/entry/common.c:301
 entry_SYSCALL_64_after_hwframe+0x49/0xbe
RIP: 0033:0x458a09
Code: dd b4 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 0f 83 ab b4 fb ff c3 66 2e 0f 1f 84 00 00 00 00
RSP: 002b:00007f784d775c88 EFLAGS: 00000246 ORIG_RAX: 00000000000000f8
RAX: ffffffffffffffda RBX: 000000000071bf00 RCX: 0000000000458a09
RDX: 0000000020001800 RSI: 00000000200017c0 RDI: 0000000020001780
RBP: 00007f784d775ca0 R08: fffffffffffffffd R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000246 R12: 00007f784d7766d4
R13: 00000000004a63d9 R14: 00000000006e33f8 R15: 0000000000000003
Modules linked in:
Dumping ftrace buffer:
   (ftrace buffer empty)
CR2: ffffeba31fffffd0
---[ end trace 01d64df35f47d1f5 ]---
RIP: 0010:__read_once_size include/linux/compiler.h:194 [inline]
RIP: 0010:compound_head include/linux/page-flags.h:172 [inline]
RIP: 0010:virt_to_head_page include/linux/mm.h:720 [inline]
RIP: 0010:virt_to_cache mm/slab.c:376 [inline]
RIP: 0010:kfree+0x7f/0x1d0 mm/slab.c:3751
Code: 7f 77 00 00 48 01 d0 48 89 df 48 c1 e8 0c 48 8d 14 c5 00 00 00 00 48 29 c2 48 89 d0 48 ba 00 00 00 00 00 ea ff ff 48 8d 04 c2 <48> 8b 50 08 48 8d 4a ff 83 e2 01 48 0f 45 c1 4c 8b 68 18 49 63 75
RSP: 0018:ffff88800a7f7bf0 EFLAGS: 00010016
RAX: ffffeba31fffffc8 RBX: 0000003ffffffffc RCX: 0000000000000000
RDX: ffffea0000000000 RSI: 0000000000000000 RDI: 0000003ffffffffc
RBP: ffff88800a7f7c10 R08: ffffffff83bf24c0 R09: ffffed100da2e448
R10: 0000000000000001 R11: ffffed100da2e447 R12: 0000000000000202
R13: ffffffff824c2d76 R14: dffffc0000000000 R15: ffff88800f1cf000
FS:  00007f784d776700(0000) GS:ffff88806d140000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffeba31fffffd0 CR3: 000000006932d004 CR4: 0000000000760ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
