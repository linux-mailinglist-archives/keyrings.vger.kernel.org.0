Return-Path: <keyrings+bounces-2193-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BA282994CFC
	for <lists+keyrings@lfdr.de>; Tue,  8 Oct 2024 15:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BDF3B29ED0
	for <lists+keyrings@lfdr.de>; Tue,  8 Oct 2024 12:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DBBC1DF26A;
	Tue,  8 Oct 2024 12:55:02 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F7E1D31A0;
	Tue,  8 Oct 2024 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392102; cv=none; b=K/jW7e/HM01hAX4nZc7tCXWKx0TNBrET0+h/2MvQ+oNeUQKLBwalknTsEG1e83RHOsUwmnfdcLqrR+hgwdBdpihGXPMQ0OcNf5m7G19K4uSG74tgX+iGsTMe4jtT6/GIHn5hLBsty91/Z2kkQ6ANae2eXw7fpmJrFme4bMPaZDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392102; c=relaxed/simple;
	bh=mbL2L04DT/7upGeDcFNTeOwgtjMd7+dRAsBUcQanlCM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UkBBh5due2x9B+baHYwjIgoR+Pd9YL9QoQdabDu/31VPeZDxupbmwg+q9UVLmKeOoyauWRDARyxTM7PQN8QnlBLhAzbRzGjExqNf6AjFXb1ut4q/6S0J9KEdXJhHbgAsAmmi79ulFGg9Z8RwZo0tfQV8AYkgp7OEc3g1q0V7o60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4XNGF90XTXz4f3jsT;
	Tue,  8 Oct 2024 20:54:37 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id D88A01A058E;
	Tue,  8 Oct 2024 20:54:53 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
	by APP3 (Coremail) with SMTP id _Ch0CgCH24eUKwVn3q2iDQ--.54651S2;
	Tue, 08 Oct 2024 20:54:52 +0800 (CST)
From: Chen Ridong <chenridong@huaweicloud.com>
To: dhowells@redhat.com,
	jarkko@kernel.org,
	paul@paul-moore.com,
	jmorris@namei.org,
	serge@hallyn.com
Cc: keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenridong@huawei.com
Subject: [PATCH v2] security/keys: fix slab-out-of-bounds in key_task_permission
Date: Tue,  8 Oct 2024 12:46:39 +0000
Message-Id: <20241008124639.70000-1-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgCH24eUKwVn3q2iDQ--.54651S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXw4rZFyDCr4xGw1UWF4kZwb_yoWrGFWxpr
	Z0gF4jyr40yF9aqr18Aa1UWw1rXFs0k3W7Gr4fW3y5Z3Z8Zr1kXF92kFyFgryfCr4IyFyY
	yF43XwsavFn0v3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI
	7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
	Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY
	6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6x
	AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
	1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07UQ6p9UUUUU=
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/

From: Chen Ridong <chenridong@huawei.com>

KASAN reports an out of bounds read:
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

This issue was also reported by syzbot [1].

It can be reproduced by following these steps(more details [2]):
1. Obtain more than 32 inputs that have similar hashes, which ends with the
   pattern '0xxxxxxxe6'.
2. Reboot and add the keys obtained in step 1.

The reproducer demonstrates how this issue happened:
1. In the search_nested_keyrings function, when it iterates through the
   slots in a node(below tag ascend_to_node), if the slot pointer is meta
   and node->back_pointer != NULL(it means a root), it will proceed to
   descend_to_node. However, there is an exception. If node is the root,
   and one of the slots points to a shortcut, it will be treated as a
   keyring.
2. Whether the ptr is keyring decided by keyring_ptr_is_keyring function.
   However, KEYRING_PTR_SUBTYPE is 0x2UL, the same as
   ASSOC_ARRAY_PTR_SUBTYPE_MASK.
3. When 32 keys with the similar hashes are added to the tree, the ROOT
   has keys with hashes that are not similar (e.g. slot 0) and it splits
   NODE A without using a shortcut. When NODE A is filled with keys that
   all hashes are xxe6, the keys are similar, NODE A will split with a
   shortcut. Finally, it forms the tree as shown below, where slot 6 points
   to a shortcut.

                      NODE A
              +------>+---+
      ROOT    |       | 0 | xxe6
      +---+   |       +---+
 xxxx | 0 | shortcut  :   : xxe6
      +---+   |       +---+
 xxe6 :   :   |       |   | xxe6
      +---+   |       +---+
      | 6 |---+       :   : xxe6
      +---+           +---+
 xxe6 :   :           | f | xxe6
      +---+           +---+
 xxe6 | f |
      +---+

4. As mentioned above, If a slot(slot 6) of the root points to a shortcut,
   it may be mistakenly transferred to a key*, leading to a read
   out-of-bounds read.

To fix this issue, one should jump to descend_to_node if the ptr is a
shortcut, regardless of whether the node is root or not.

[1] https://lore.kernel.org/all/000000000000cbb7860611f61147@google.com/T/
[2] https://lore.kernel.org/linux-kernel/1cfa878e-8c7b-4570-8606-21daf5e13ce7@huaweicloud.com/

Fixes: b2a4df200d57 ("KEYS: Expand the capacity of a keyring")
Reported-by: syzbot+5b415c07907a2990d1a3@syzkaller.appspotmail.com
Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 security/keys/keyring.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index 4448758f643a..f331725d5a37 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -772,8 +772,11 @@ static bool search_nested_keyrings(struct key *keyring,
 	for (; slot < ASSOC_ARRAY_FAN_OUT; slot++) {
 		ptr = READ_ONCE(node->slots[slot]);
 
-		if (assoc_array_ptr_is_meta(ptr) && node->back_pointer)
-			goto descend_to_node;
+		if (assoc_array_ptr_is_meta(ptr)) {
+			if (node->back_pointer ||
+			    assoc_array_ptr_is_shortcut(ptr))
+				goto descend_to_node;
+		}
 
 		if (!keyring_ptr_is_keyring(ptr))
 			continue;
-- 
2.34.1


