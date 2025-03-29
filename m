Return-Path: <keyrings+bounces-2544-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EB9A75773
	for <lists+keyrings@lfdr.de>; Sat, 29 Mar 2025 19:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91F9D3AAA55
	for <lists+keyrings@lfdr.de>; Sat, 29 Mar 2025 18:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8E51A2645;
	Sat, 29 Mar 2025 18:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KL0yZGt9"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B182AE8E;
	Sat, 29 Mar 2025 18:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743273175; cv=none; b=GSorhdgrVn6rVXgInFRVG/+Sxgfexa8tMaIe1SV9+2W4JEISxZQwM6guf33lOiUIIyU3vKx6yQ1p7cRDXlHRKAy6MKC0vAx8NuI3JRAV1kf0R0qVkEn9Y2hkO3tiXcUV9bLrsiFm1AKO3xVjYHqxrbS/kqxB2Qy08+Js0FOF4DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743273175; c=relaxed/simple;
	bh=88SrUHIh4lPXPPCyQrgHZe3BRPvZFsiCiw25NSW1FPg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=HmFunLUlCw2fFj2e9SF/7AqMIw5tz1Dm9yMu0ctHdGT4FmdGA6plrQwpcOZipHsGbqhlbkIpXJJ14WhyduLZrHvs05DqRW5V1kyXfHZrpDgLf0iU6iY/CwfEmlhf2TN3rJ6q9tT9+MXY8pUxUsYJr6M8118bOlZzqQnBovTmgUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KL0yZGt9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD62C4CEE2;
	Sat, 29 Mar 2025 18:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743273175;
	bh=88SrUHIh4lPXPPCyQrgHZe3BRPvZFsiCiw25NSW1FPg=;
	h=From:To:Subject:Date:From;
	b=KL0yZGt91+FbNnOOkmQfrmB+zy1dU4u0xDU/HVpcM/vcVFwir5l5ZaL9iwFJQs1o6
	 nS0vnU/E+p3MjqLg9OiN9XgC8nzVJuhR8obg58ymT/QQBbkoMMaAr3Q1xEvaJy6Rxq
	 UZmOCZ9nqsHh/ySwFHNbFWXdaNMD/WutsXx223Li/qaBDQ4wFWiV8KLF3fPf5wTkXf
	 19rbBtpKcidIXXbQPqFSuQG3RoL12uBOZr9JJ+fVR9p6l4G06HdfGW9f0OunaUPHFK
	 IScgMUbvIg63vw0XBCYV0PWEJmyZy/YKNQKtwXU3Fu8BweRTwLgv8RsNSyevIRsMph
	 XYBlitrxDgBkw==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: keyrings@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [RFC PATCH] keys: Add a list for unreferenced keys
Date: Sat, 29 Mar 2025 20:32:43 +0200
Message-Id: <20250329183243.719222-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an isolated list for unreferenced keys, in order to make the reaping
process more straight-forward and failure-safe.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 include/linux/key.h      |  1 -
 security/keys/gc.c       | 21 ++++-----------------
 security/keys/internal.h |  1 +
 security/keys/key.c      |  7 +++++--
 4 files changed, 10 insertions(+), 20 deletions(-)

diff --git a/include/linux/key.h b/include/linux/key.h
index ba05de8579ec..074dca3222b9 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -236,7 +236,6 @@ struct key {
 #define KEY_FLAG_ROOT_CAN_INVAL	7	/* set if key can be invalidated by root without permission */
 #define KEY_FLAG_KEEP		8	/* set if key should not be removed */
 #define KEY_FLAG_UID_KEYRING	9	/* set if key is a user or user session keyring */
-#define KEY_FLAG_FINAL_PUT	10	/* set if final put has happened on key */
 
 	/* the key type and key description string
 	 * - the desc is used to match a key against search criteria
diff --git a/security/keys/gc.c b/security/keys/gc.c
index f27223ea4578..7222692cfd60 100644
--- a/security/keys/gc.c
+++ b/security/keys/gc.c
@@ -218,11 +218,6 @@ static void key_garbage_collector(struct work_struct *work)
 		key = rb_entry(cursor, struct key, serial_node);
 		cursor = rb_next(cursor);
 
-		if (test_bit(KEY_FLAG_FINAL_PUT, &key->flags)) {
-			smp_mb(); /* Clobber key->user after FINAL_PUT seen. */
-			goto found_unreferenced_key;
-		}
-
 		if (unlikely(gc_state & KEY_GC_REAPING_DEAD_1)) {
 			if (key->type == key_gc_dead_keytype) {
 				gc_state |= KEY_GC_FOUND_DEAD_KEY;
@@ -286,6 +281,10 @@ static void key_garbage_collector(struct work_struct *work)
 		key_schedule_gc(new_timer);
 	}
 
+	spin_lock(&key_serial_lock);
+	list_splice_init(&key_graveyard, &graveyard);
+	spin_unlock(&key_serial_lock);
+
 	if (unlikely(gc_state & KEY_GC_REAPING_DEAD_2) ||
 	    !list_empty(&graveyard)) {
 		/* Make sure that all pending keyring payload destructions are
@@ -328,18 +327,6 @@ static void key_garbage_collector(struct work_struct *work)
 	kleave(" [end %x]", gc_state);
 	return;
 
-	/* We found an unreferenced key - once we've removed it from the tree,
-	 * we can safely drop the lock.
-	 */
-found_unreferenced_key:
-	kdebug("unrefd key %d", key->serial);
-	rb_erase(&key->serial_node, &key_serial_tree);
-	spin_unlock(&key_serial_lock);
-
-	list_add_tail(&key->graveyard_link, &graveyard);
-	gc_state |= KEY_GC_REAP_AGAIN;
-	goto maybe_resched;
-
 	/* We found a restricted keyring and need to update the restriction if
 	 * it is associated with the dead key type.
 	 */
diff --git a/security/keys/internal.h b/security/keys/internal.h
index 2cffa6dc8255..c1b6f0b5817c 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -66,6 +66,7 @@ struct key_user {
 extern struct rb_root	key_user_tree;
 extern spinlock_t	key_user_lock;
 extern struct key_user	root_key_user;
+extern struct list_head key_graveyard;
 
 extern struct key_user *key_user_lookup(kuid_t uid);
 extern void key_user_put(struct key_user *user);
diff --git a/security/keys/key.c b/security/keys/key.c
index 7198cd2ac3a3..b34b4cba6ce7 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -22,6 +22,7 @@ DEFINE_SPINLOCK(key_serial_lock);
 
 struct rb_root	key_user_tree; /* tree of quota records indexed by UID */
 DEFINE_SPINLOCK(key_user_lock);
+LIST_HEAD(key_graveyard);
 
 unsigned int key_quota_root_maxkeys = 1000000;	/* root's key count quota */
 unsigned int key_quota_root_maxbytes = 25000000; /* root's key space quota */
@@ -658,8 +659,10 @@ void key_put(struct key *key)
 				key->user->qnbytes -= key->quotalen;
 				spin_unlock_irqrestore(&key->user->lock, flags);
 			}
-			smp_mb(); /* key->user before FINAL_PUT set. */
-			set_bit(KEY_FLAG_FINAL_PUT, &key->flags);
+			spin_lock(&key_serial_lock);
+			rb_erase(&key->serial_node, &key_serial_tree);
+			list_add_tail(&key->graveyard_link, &key_graveyard);
+			spin_unlock(&key_serial_lock);
 			schedule_work(&key_gc_work);
 		}
 	}
-- 
2.39.5


