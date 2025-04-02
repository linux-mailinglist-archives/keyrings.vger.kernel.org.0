Return-Path: <keyrings+bounces-2561-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB53A78A61
	for <lists+keyrings@lfdr.de>; Wed,  2 Apr 2025 10:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2922C3B10C8
	for <lists+keyrings@lfdr.de>; Wed,  2 Apr 2025 08:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8615223370E;
	Wed,  2 Apr 2025 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKoCt9Up"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FD12AE77;
	Wed,  2 Apr 2025 08:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743583993; cv=none; b=Zd0vMqDiiwAHcGfqDqBRIfETMu7KzrgMuEH0wfqf4HQ6nBG9LT9WlJLbeR9hSxKbHgO+xJKae6C/otpL2ioLLfHFjvc4H32Quv5X3xqXKYvJuoGu1ET3xZqJjV8d2S7gy3eeFb9lCXuaFo0GwqP0ywSO9k5YOp3MLrNN8+KuxDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743583993; c=relaxed/simple;
	bh=enC2m4wCkWB+i5kUhd6IO/oEV/Hpy8LrQ8ZLtm0O20s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bIOx/FczUjrhFFenad1zd2ML0LeVRScIXu758+JgxT2W2vV1JgYtG4OtP/I8EMMe2wrw3bWldc7Wd12PUWDQvC+dUqFV2OBMc88SLW7M6ZQ1PiSHaFT3PD5mb6g9uw61Hz8fCJHErww8BN91+UwNSWX8yoknH0OhqyFNB8K8RyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oKoCt9Up; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54D5AC4CEDD;
	Wed,  2 Apr 2025 08:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743583992;
	bh=enC2m4wCkWB+i5kUhd6IO/oEV/Hpy8LrQ8ZLtm0O20s=;
	h=From:To:Cc:Subject:Date:From;
	b=oKoCt9UpxtgwqejJhJT11zZTpI5ruHca4teLQzytbVeU9cKTb81yabw0zrRZqGpkC
	 wllXxNK0VHF6XTi9NJgyOnFgYSDTS0By2tAlgOI3ZDIpWSzGvOt8mqGHlf5VXApdlt
	 onRp50Hck4Xrv/5zIa8KlFj9XzH2WUw6ndrfCVhuER7rXfYC46zfvl+yhH6RGZ+EBE
	 wkaK3/8uFGGQGOryAFBJLTJw2v9j1A2GG2G8BYh3F6ylUWekPGEpAEO8vxGEGK/hr2
	 tw9eyvB332TJzjapZQgSH0pbbWeAtUBE6SpUbaU2u73PF3MYpaUhomVD+XEUYBuM97
	 c57tCkEgCqoFw==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org,
	Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [RFC PATCH v3] KEYS: Add a list for unreferenced keys
Date: Wed,  2 Apr 2025 11:52:57 +0300
Message-Id: <20250402085257.728844-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>

Add an isolated list for unreferenced keys, thereby splitting key
deletion as separate phase, after the reaping cycle. This makes the
whole process more safe, as these two distinct tasks don't intervene
each other. As an effect, KEY_FLAG_FINAL_PUT is no longer needed.

Since `security/keys/proc.c` reserves key_serial_lock for variable
amount of time, `rb_erase()` cannot be done within `key_put()` by using
IRQ saving/restoring versions of the spin lock functions. For the same
reason, the key needs to co-exist both in the tree and in the list for
period of time.

Therefore, split the union in `struct key` into separate `serial_node`
and `graveyard_link` fields, and introduce a separate lock for the
graveyard, which is locked and unlocked using IRQ saving/restoring
versions of the locking routines.

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
---
v3:
- Using spin_lock() fails since key_put() is executed inside IRQs.
  Using spin_lock_irqsave() would neither work given the lock is
  acquired for /proc/keys. Therefore, separate the lock for
  graveyard and key_graveyard before reaping key_serial_tree.
v2:
- Rename key_gc_unused_keys as key_gc_graveyard, and re-document the
  function.
---
 include/linux/key.h      |  7 ++-----
 security/keys/gc.c       | 34 ++++++++++++++--------------------
 security/keys/internal.h |  2 ++
 security/keys/key.c      |  7 +++++--
 4 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/include/linux/key.h b/include/linux/key.h
index ba05de8579ec..c50659184bdf 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -195,10 +195,8 @@ enum key_state {
 struct key {
 	refcount_t		usage;		/* number of references */
 	key_serial_t		serial;		/* key serial number */
-	union {
-		struct list_head graveyard_link;
-		struct rb_node	serial_node;
-	};
+	struct list_head	graveyard_link; /* key->usage == 0 */
+	struct rb_node		serial_node;
 #ifdef CONFIG_KEY_NOTIFICATIONS
 	struct watch_list	*watchers;	/* Entities watching this key for changes */
 #endif
@@ -236,7 +234,6 @@ struct key {
 #define KEY_FLAG_ROOT_CAN_INVAL	7	/* set if key can be invalidated by root without permission */
 #define KEY_FLAG_KEEP		8	/* set if key should not be removed */
 #define KEY_FLAG_UID_KEYRING	9	/* set if key is a user or user session keyring */
-#define KEY_FLAG_FINAL_PUT	10	/* set if final put has happened on key */
 
 	/* the key type and key description string
 	 * - the desc is used to match a key against search criteria
diff --git a/security/keys/gc.c b/security/keys/gc.c
index f27223ea4578..7b1356c1095d 100644
--- a/security/keys/gc.c
+++ b/security/keys/gc.c
@@ -130,9 +130,9 @@ void key_gc_keytype(struct key_type *ktype)
 }
 
 /*
- * Garbage collect a list of unreferenced, detached keys
+ * Takes ownership of the given list, and deinitializes and destroys the keys.
  */
-static noinline void key_gc_unused_keys(struct list_head *keys)
+static noinline void key_gc_graveyard(struct list_head *keys)
 {
 	while (!list_empty(keys)) {
 		struct key *key =
@@ -206,6 +206,17 @@ static void key_garbage_collector(struct work_struct *work)
 
 	new_timer = TIME64_MAX;
 
+	spin_lock_irqsave(&key_graveyard_lock, flags);
+	list_splice_init(&key_graveyard, &graveyard);
+	spin_unlock_irqrestore(&key_graveyard_lock, flags);
+
+	list_for_each_entry(key, &graveyard, graveyard_link) {
+		spin_lock(&key_serial_lock);
+		kdebug("unrefd key %d", key->serial);
+		rb_erase(&key->serial_node, &key_serial_tree);
+		spin_unlock(&key_serial_lock);
+	}
+
 	/* As only this function is permitted to remove things from the key
 	 * serial tree, if cursor is non-NULL then it will always point to a
 	 * valid node in the tree - even if lock got dropped.
@@ -218,11 +229,6 @@ static void key_garbage_collector(struct work_struct *work)
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
@@ -299,7 +305,7 @@ static void key_garbage_collector(struct work_struct *work)
 
 	if (!list_empty(&graveyard)) {
 		kdebug("gc keys");
-		key_gc_unused_keys(&graveyard);
+		key_gc_graveyard(&graveyard);
 	}
 
 	if (unlikely(gc_state & (KEY_GC_REAPING_DEAD_1 |
@@ -328,18 +334,6 @@ static void key_garbage_collector(struct work_struct *work)
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
index 2cffa6dc8255..08f356d04d78 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -66,6 +66,8 @@ struct key_user {
 extern struct rb_root	key_user_tree;
 extern spinlock_t	key_user_lock;
 extern struct key_user	root_key_user;
+extern struct list_head	key_graveyard;
+extern spinlock_t	key_graveyard_lock;
 
 extern struct key_user *key_user_lookup(kuid_t uid);
 extern void key_user_put(struct key_user *user);
diff --git a/security/keys/key.c b/security/keys/key.c
index 7198cd2ac3a3..7511f2017b6b 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -22,6 +22,8 @@ DEFINE_SPINLOCK(key_serial_lock);
 
 struct rb_root	key_user_tree; /* tree of quota records indexed by UID */
 DEFINE_SPINLOCK(key_user_lock);
+LIST_HEAD(key_graveyard);
+DEFINE_SPINLOCK(key_graveyard_lock);
 
 unsigned int key_quota_root_maxkeys = 1000000;	/* root's key count quota */
 unsigned int key_quota_root_maxbytes = 25000000; /* root's key space quota */
@@ -658,8 +660,9 @@ void key_put(struct key *key)
 				key->user->qnbytes -= key->quotalen;
 				spin_unlock_irqrestore(&key->user->lock, flags);
 			}
-			smp_mb(); /* key->user before FINAL_PUT set. */
-			set_bit(KEY_FLAG_FINAL_PUT, &key->flags);
+			spin_lock_irqsave(&key_graveyard_lock, flags);
+			list_add_tail(&key->graveyard_link, &key_graveyard);
+			spin_unlock_irqrestore(&key_graveyard_lock, flags);
 			schedule_work(&key_gc_work);
 		}
 	}
-- 
2.39.5


