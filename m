Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A080644E01E
	for <lists+keyrings@lfdr.de>; Fri, 12 Nov 2021 03:07:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234214AbhKLCKk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 11 Nov 2021 21:10:40 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:27200 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229908AbhKLCKj (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 11 Nov 2021 21:10:39 -0500
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Hr24d4mTmz8vNQ;
        Fri, 12 Nov 2021 10:06:09 +0800 (CST)
Received: from dggpemm500024.china.huawei.com (7.185.36.203) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Fri, 12 Nov 2021 10:07:47 +0800
Received: from [127.0.0.1] (10.67.110.173) by dggpemm500024.china.huawei.com
 (7.185.36.203) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 12 Nov
 2021 10:07:47 +0800
Message-ID: <0ca23345-28a6-07f7-0424-9aaae283caba@huawei.com>
Date:   Fri, 12 Nov 2021 10:07:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
To:     <dhowells@redhat.com>, <jarkko@kernel.org>
CC:     <keyrings@vger.kernel.org>,
        <linux-security-module@vger.kernel.org>, <jmorris@namei.org>,
        <serge@hallyn.com>, <linux-kernel@vger.kernel.org>,
        <xuqiang36@huawei.com>, <wangweiyang2@huawei.com>,
        <xiujianfeng@huawei.com>, <yanjin.yan@huawei.com>,
        <rui.xiang@huawei.com>
From:   "Guozihua (Scott)" <guozihua@huawei.com>
Subject: kernel BUG at assoc_array.c:LINE! while adding key to keyring
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.110.173]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500024.china.huawei.com (7.185.36.203)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi all,

A BUG_ON error was reported during our FUZZ test recently which happens 
while trying to insert new key into keyring.

The call stack goes like this:

kernel BUG at assoc_array.c:644!
Internal error: Oops - BUG: 0 [#1] SMP
Process syz-executor.24 (pid: 27933, stack limit = 0x000000004a6537a3)
CPU: 3 PID: 27933 Comm: syz-executor.24 Not tainted 4.19.95 #2
Hardware name: linux,dummy-virt (DT)
pstate: 20400005 (nzCv daif +PAN -UAO)
pc : assoc_array_insert_into_terminal_node+0x924/0x10c8 
root/polaris/workspace/kernel/kernel/lib/assoc_array.c:644
lr : assoc_array_insert_into_terminal_node+0x924/0x10c8 
root/polaris/workspace/kernel/kernel/lib/assoc_array.c:644
sp : fffff02972e379b0
x29: fffff02972e379b0 x28: 0000000000000011
x27: fffff029659af600 x26: fffff0297812e000
x25: fffff0298c215540 x24: 0000000000000010
x23: fffff0298c215400 x22: 00000000ffffffff
x21: fffff0298c215541 x20: 0000000000000001
x19: 000000000000000f x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000
x15: 0000000000000000 x14: 0000000000000000
x13: 0000000000000000 x12: 0000000000000000
x11: 1ffffe052e5c6f1e x10: ffff1e052e5c6f1e
x9 : dfff200000000000 x8 : 0000000000000004
x7 : 0000000000000003 x6 : fffff02972e378f4
x5 : ffff1e052e5c6f1e x4 : 1ffffe0531842aa8
x3 : ffff200084a00000 x2 : ffff200033b46000
x1 : ffffffff83600000 x0 : 000000000000357d
Call trace:
  assoc_array_insert_into_terminal_node+0x924/0x10c8 
root/polaris/workspace/kernel/kernel/lib/assoc_array.c:644
  assoc_array_insert+0x1e8/0x300 
root/polaris/workspace/kernel/kernel/lib/assoc_array.c:1005
  __key_link_begin+0xc4/0x1e0 
root/polaris/workspace/kernel/kernel/security/keys/keyring.c:1227
  construct_alloc_key 
root/polaris/workspace/kernel/kernel/security/keys/request_key.c:375 
[inline]
  construct_key_and_link 
root/polaris/workspace/kernel/kernel/security/keys/request_key.c:466 
[inline]
  request_key_and_link+0x358/0x800 
root/polaris/workspace/kernel/kernel/security/keys/request_key.c:580
  __do_sys_request_key 
root/polaris/workspace/kernel/kernel/security/keys/keyctl.c:211 [inline]
  __se_sys_request_key 
root/polaris/workspace/kernel/kernel/security/keys/keyctl.c:156 [inline]
  __arm64_sys_request_key+0x174/0x2c0 
root/polaris/workspace/kernel/kernel/security/keys/keyctl.c:156
  __invoke_syscall 
root/polaris/workspace/kernel/kernel/arch/arm64/kernel/syscall.c:36 [inline]
  invoke_syscall 
root/polaris/workspace/kernel/kernel/arch/arm64/kernel/syscall.c:48 [inline]
  el0_svc_common+0xdc/0x3a0 
root/polaris/workspace/kernel/kernel/arch/arm64/kernel/syscall.c:121
  el0_svc_handler+0x50/0xb0 
root/polaris/workspace/kernel/kernel/arch/arm64/kernel/syscall.c:193
  el0_svc+0x14/0x244 
root/polaris/workspace/kernel/kernel/arch/arm64/kernel/entry.S:1028
Code: 97e908f1 f9002efb 17fffe0d 97e038d6 (d4210000)
Modules linked in:
---[ end trace 6a3a83359c05a38f ]---

I've dug a little bit into the issue. The issue happened during the 
split node process when it trys to find two leafs to be put into the new 
node. If it fails, it gives this BUG_ON error.

I was suspecting a race condition. However when I check the 
__key_link_begin and key_unlink function there seems to be suffice 
locking. And the assoc_array seems to be robust.

It seems that this happened once before 
(https://syzkaller.appspot.com/bug?id=ae9f975f9395c1519048e29bfeb4cd162982eb6d).

Any thoughts? Thanks!

Best Regards,
Zihua Guo

