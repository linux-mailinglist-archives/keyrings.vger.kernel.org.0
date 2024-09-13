Return-Path: <keyrings+bounces-2041-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D90C97793F
	for <lists+keyrings@lfdr.de>; Fri, 13 Sep 2024 09:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 757B41C2162D
	for <lists+keyrings@lfdr.de>; Fri, 13 Sep 2024 07:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47641B533E;
	Fri, 13 Sep 2024 07:17:40 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05C777107;
	Fri, 13 Sep 2024 07:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726211860; cv=none; b=RT4mb8QNrt2efQ/bHMRFSf2RYQKy/Am2EVWDwZO+av1EJBOEDfKkDg8M8b1eq3qVq8HwyGKOWMlgzLav9nuW382I3lERVQgspo+mP+ehNn2PbQGC0quxO9V987N8l3hgqzlg9KMuFyCLwZ6N/mRoq7FbqiyxR4KtYZCwJmRFbeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726211860; c=relaxed/simple;
	bh=/aB7KyuDzWiiD7QCWbP9P8AiK+96dTijvv1tTPSwsxU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=thDljgbcocZWqxpvKCycMMjsJkXgaGhSl3H7yIpeBNAs5SZMcxl6G3Pu7hDMf0RyLLRzNIdpOSd4mSu0gNE5EskBk7D4JLl9APUTsAC0TAZdVnnLzbgbAhLpphkYYQiX8awX59FD4zur0e7ydW/jP/sibBU9pEWA0g2tgMH7AqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4X4lxd6Wngz69N3;
	Fri, 13 Sep 2024 15:17:25 +0800 (CST)
Received: from kwepemd100013.china.huawei.com (unknown [7.221.188.163])
	by mail.maildlp.com (Postfix) with ESMTPS id 2031518006C;
	Fri, 13 Sep 2024 15:17:34 +0800 (CST)
Received: from huawei.com (10.67.174.121) by kwepemd100013.china.huawei.com
 (7.221.188.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Fri, 13 Sep
 2024 15:17:33 +0800
From: Chen Ridong <chenridong@huawei.com>
To: <dhowells@redhat.com>, <jarkko@kernel.org>, <paul@paul-moore.com>,
	<jmorris@namei.org>, <serge@hallyn.com>
CC: <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <chenridong@huaweicloud.com>
Subject: [PATCH] security/keys: fix slab-out-of-bounds in key_task_permission
Date: Fri, 13 Sep 2024 07:09:28 +0000
Message-ID: <20240913070928.1670785-1-chenridong@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd100013.china.huawei.com (7.221.188.163)

We meet the same issue with the LINK, which reads memory out of bounds:
BUG: KASAN: slab-out-of-bounds in __kuid_val include/linux/uidgid.h:36
BUG: KASAN: slab-out-of-bounds in uid_eq include/linux/uidgid.h:63 [inline]
BUG: KASAN: slab-out-of-bounds in key_task_permission+0x394/0x410
security/keys/permission.c:54
Read of size 4 at addr ffff88813c3ab618 by task stress-ng/4362

CPU: 2 PID: 4362 Comm: stress-ng Not tainted 5.10.0-14930-gafbffd6c3ede #15
Call Trace:
 __dump_stack lib/dump_stack.c:82 [inline]
 dump_stack+0x107/0x167 lib/dump_stack.c:123
 print_address_description.constprop.0+0x19/0x170 mm/kasan/report.c:400
 __kasan_report.cold+0x6c/0x84 mm/kasan/report.c:560
 kasan_report+0x3a/0x50 mm/kasan/report.c:585
 __kuid_val include/linux/uidgid.h:36 [inline]
 uid_eq include/linux/uidgid.h:63 [inline]
 key_task_permission+0x394/0x410 security/keys/permission.c:54
 search_nested_keyrings+0x90e/0xe90 security/keys/keyring.c:793
 keyring_search_rcu+0x1b6/0x310 security/keys/keyring.c:922
 search_cred_keyrings_rcu+0x111/0x2e0 security/keys/process_keys.c:459
 search_process_keyrings_rcu+0x1d/0x310 security/keys/process_keys.c:544
 lookup_user_key+0x782/0x12e0 security/keys/process_keys.c:762
 keyctl_invalidate_key+0x20/0x190 security/keys/keyctl.c:434
 __do_sys_keyctl security/keys/keyctl.c:1978 [inline]
 __se_sys_keyctl+0x1de/0x5b0 security/keys/keyctl.c:1880
 do_syscall_64+0x30/0x40 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x67/0xd1

However, we can't reproduce this issue.
After our analysis, it can make this issue by following steps.
1.As syzkaller reported, the memory is allocated for struct
  assoc_array_shortcut in the assoc_array_insert_into_terminal_node
  functions.
2.In the search_nested_keyrings, when we go through the slots in a node,
  (bellow tag ascend_to_node), and the slot ptr is meta and
  node->back_pointer != NULL, we will proceed to  descend_to_node.
  However, there is an exception. If node is the root, and one of the
  slots points to a shortcut, it will be treated as a keyring.
3.Whether the ptr is keyring decided by keyring_ptr_is_keyring function.
  However, KEYRING_PTR_SUBTYPE is 0x2UL, the same as
  ASSOC_ARRAY_PTR_SUBTYPE_MASK,
4.As mentioned above, If a slot of the root is a shortcut, it may be
  mistakenly be transferred to a key*, leading to an read out-of-bounds
  read.

To fix this issue, one should jump to descend_to_node if the pointer is a
shortcut.

Link: https://syzkaller.appspot.com/bug?id=68a5e206c2a8e08d317eb83f05610c0484ad10b9
Fixes: b2a4df200d57 ("KEYS: Expand the capacity of a keyring")
Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 security/keys/keyring.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index 4448758f643a..7958486ac834 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -772,7 +772,9 @@ static bool search_nested_keyrings(struct key *keyring,
 	for (; slot < ASSOC_ARRAY_FAN_OUT; slot++) {
 		ptr = READ_ONCE(node->slots[slot]);
 
-		if (assoc_array_ptr_is_meta(ptr) && node->back_pointer)
+		if ((assoc_array_ptr_is_meta(ptr) && node->back_pointer) ||
+		    (assoc_array_ptr_is_meta(ptr) &&
+		     assoc_array_ptr_is_shortcut(ptr)))
 			goto descend_to_node;
 
 		if (!keyring_ptr_is_keyring(ptr))
-- 
2.34.1


