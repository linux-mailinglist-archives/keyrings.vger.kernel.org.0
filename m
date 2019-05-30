Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED89D300FD
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2019 19:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbfE3RZ6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 30 May 2019 13:25:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45612 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726902AbfE3RZ5 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 30 May 2019 13:25:57 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 71E786EB8E;
        Thu, 30 May 2019 17:25:57 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com [10.10.120.173])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 512247A000;
        Thu, 30 May 2019 17:25:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 06/10] keys: Hoist locking out of __key_link_begin() [ver #2]
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org
Cc:     dhowells@redhat.com, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, ebiggers@kernel.org
Date:   Thu, 30 May 2019 18:25:55 +0100
Message-ID: <155923715560.949.7666210207871593907.stgit@warthog.procyon.org.uk>
In-Reply-To: <155923711088.949.14909672457214372214.stgit@warthog.procyon.org.uk>
References: <155923711088.949.14909672457214372214.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Thu, 30 May 2019 17:25:57 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hoist the locking of out of __key_link_begin() and into its callers.  This
is necessary to allow the upcoming key_move() operation to correctly order
taking of the source keyring semaphore, the destination keyring semaphore
and the keyring serialisation lock.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 security/keys/internal.h    |    2 +
 security/keys/key.c         |   23 +++++++++++--
 security/keys/keyring.c     |   77 +++++++++++++++++++++++++------------------
 security/keys/request_key.c |    5 +++
 4 files changed, 71 insertions(+), 36 deletions(-)

diff --git a/security/keys/internal.h b/security/keys/internal.h
index 8f533c81aa8d..25cdd0cbdc06 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -93,6 +93,8 @@ extern wait_queue_head_t request_key_conswq;
 extern struct key_type *key_type_lookup(const char *type);
 extern void key_type_put(struct key_type *ktype);
 
+extern int __key_link_lock(struct key *keyring,
+			   const struct keyring_index_key *index_key);
 extern int __key_link_begin(struct key *keyring,
 			    const struct keyring_index_key *index_key,
 			    struct assoc_array_edit **_edit);
diff --git a/security/keys/key.c b/security/keys/key.c
index 696f1c092c50..591b88f9a51d 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -515,10 +515,14 @@ int key_instantiate_and_link(struct key *key,
 	}
 
 	if (keyring) {
-		ret = __key_link_begin(keyring, &key->index_key, &edit);
+		ret = __key_link_lock(keyring, &key->index_key);
 		if (ret < 0)
 			goto error;
 
+		ret = __key_link_begin(keyring, &key->index_key, &edit);
+		if (ret < 0)
+			goto error_link_end;
+
 		if (keyring->restrict_link && keyring->restrict_link->check) {
 			struct key_restriction *keyres = keyring->restrict_link;
 
@@ -570,7 +574,7 @@ int key_reject_and_link(struct key *key,
 			struct key *keyring,
 			struct key *authkey)
 {
-	struct assoc_array_edit *edit;
+	struct assoc_array_edit *edit = NULL;
 	int ret, awaken, link_ret = 0;
 
 	key_check(key);
@@ -583,7 +587,12 @@ int key_reject_and_link(struct key *key,
 		if (keyring->restrict_link)
 			return -EPERM;
 
-		link_ret = __key_link_begin(keyring, &key->index_key, &edit);
+		link_ret = __key_link_lock(keyring, &key->index_key);
+		if (link_ret == 0) {
+			link_ret = __key_link_begin(keyring, &key->index_key, &edit);
+			if (link_ret < 0)
+				__key_link_end(keyring, &key->index_key, edit);
+		}
 	}
 
 	mutex_lock(&key_construction_mutex);
@@ -860,12 +869,18 @@ key_ref_t key_create_or_update(key_ref_t keyring_ref,
 	}
 	index_key.desc_len = strlen(index_key.description);
 
-	ret = __key_link_begin(keyring, &index_key, &edit);
+	ret = __key_link_lock(keyring, &index_key);
 	if (ret < 0) {
 		key_ref = ERR_PTR(ret);
 		goto error_free_prep;
 	}
 
+	ret = __key_link_begin(keyring, &index_key, &edit);
+	if (ret < 0) {
+		key_ref = ERR_PTR(ret);
+		goto error_link_end;
+	}
+
 	if (restrict_link && restrict_link->check) {
 		ret = restrict_link->check(keyring, index_key.type,
 					   &prep.payload, restrict_link->key);
diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index 2f91b9a699ef..8838c300ea7b 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -1199,14 +1199,34 @@ static int keyring_detect_cycle(struct key *A, struct key *B)
 	return PTR_ERR(ctx.result) == -EAGAIN ? 0 : PTR_ERR(ctx.result);
 }
 
+/*
+ * Lock keyring for link.
+ */
+int __key_link_lock(struct key *keyring,
+		    const struct keyring_index_key *index_key)
+	__acquires(&keyring->sem)
+	__acquires(&keyring_serialise_link_lock)
+{
+	if (keyring->type != &key_type_keyring)
+		return -ENOTDIR;
+
+	down_write(&keyring->sem);
+
+	/* Serialise link/link calls to prevent parallel calls causing a cycle
+	 * when linking two keyring in opposite orders.
+	 */
+	if (index_key->type == &key_type_keyring)
+		mutex_lock(&keyring_serialise_link_lock);
+
+	return 0;
+}
+
 /*
  * Preallocate memory so that a key can be linked into to a keyring.
  */
 int __key_link_begin(struct key *keyring,
 		     const struct keyring_index_key *index_key,
 		     struct assoc_array_edit **_edit)
-	__acquires(&keyring->sem)
-	__acquires(&keyring_serialise_link_lock)
 {
 	struct assoc_array_edit *edit;
 	int ret;
@@ -1216,19 +1236,9 @@ int __key_link_begin(struct key *keyring,
 
 	BUG_ON(index_key->desc_len == 0);
 
-	if (keyring->type != &key_type_keyring)
-		return -ENOTDIR;
-
-	down_write(&keyring->sem);
-
 	ret = -EKEYREVOKED;
 	if (test_bit(KEY_FLAG_REVOKED, &keyring->flags))
-		goto error_krsem;
-
-	/* serialise link/link calls to prevent parallel calls causing a cycle
-	 * when linking two keyring in opposite orders */
-	if (index_key->type == &key_type_keyring)
-		mutex_lock(&keyring_serialise_link_lock);
+		goto error;
 
 	/* Create an edit script that will insert/replace the key in the
 	 * keyring tree.
@@ -1239,7 +1249,7 @@ int __key_link_begin(struct key *keyring,
 				  NULL);
 	if (IS_ERR(edit)) {
 		ret = PTR_ERR(edit);
-		goto error_sem;
+		goto error;
 	}
 
 	/* If we're not replacing a link in-place then we're going to need some
@@ -1258,11 +1268,7 @@ int __key_link_begin(struct key *keyring,
 
 error_cancel:
 	assoc_array_cancel_edit(edit);
-error_sem:
-	if (index_key->type == &key_type_keyring)
-		mutex_unlock(&keyring_serialise_link_lock);
-error_krsem:
-	up_write(&keyring->sem);
+error:
 	kleave(" = %d", ret);
 	return ret;
 }
@@ -1312,9 +1318,6 @@ void __key_link_end(struct key *keyring,
 	BUG_ON(index_key->type == NULL);
 	kenter("%d,%s,", keyring->serial, index_key->type->name);
 
-	if (index_key->type == &key_type_keyring)
-		mutex_unlock(&keyring_serialise_link_lock);
-
 	if (edit) {
 		if (!edit->dead_leaf) {
 			key_payload_reserve(keyring,
@@ -1323,6 +1326,9 @@ void __key_link_end(struct key *keyring,
 		assoc_array_cancel_edit(edit);
 	}
 	up_write(&keyring->sem);
+
+	if (index_key->type == &key_type_keyring)
+		mutex_unlock(&keyring_serialise_link_lock);
 }
 
 /*
@@ -1358,7 +1364,7 @@ static int __key_link_check_restriction(struct key *keyring, struct key *key)
  */
 int key_link(struct key *keyring, struct key *key)
 {
-	struct assoc_array_edit *edit;
+	struct assoc_array_edit *edit = NULL;
 	int ret;
 
 	kenter("{%d,%d}", keyring->serial, refcount_read(&keyring->usage));
@@ -1366,17 +1372,24 @@ int key_link(struct key *keyring, struct key *key)
 	key_check(keyring);
 	key_check(key);
 
+	ret = __key_link_lock(keyring, &key->index_key);
+	if (ret < 0)
+		goto error;
+
 	ret = __key_link_begin(keyring, &key->index_key, &edit);
-	if (ret == 0) {
-		kdebug("begun {%d,%d}", keyring->serial, refcount_read(&keyring->usage));
-		ret = __key_link_check_restriction(keyring, key);
-		if (ret == 0)
-			ret = __key_link_check_live_key(keyring, key);
-		if (ret == 0)
-			__key_link(key, &edit);
-		__key_link_end(keyring, &key->index_key, edit);
-	}
+	if (ret < 0)
+		goto error_end;
+
+	kdebug("begun {%d,%d}", keyring->serial, refcount_read(&keyring->usage));
+	ret = __key_link_check_restriction(keyring, key);
+	if (ret == 0)
+		ret = __key_link_check_live_key(keyring, key);
+	if (ret == 0)
+		__key_link(key, &edit);
 
+error_end:
+	__key_link_end(keyring, &key->index_key, edit);
+error:
 	kleave(" = %d {%d,%d}", ret, keyring->serial, refcount_read(&keyring->usage));
 	return ret;
 }
diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 1f234b019437..232505d591dd 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -372,6 +372,9 @@ static int construct_alloc_key(struct keyring_search_context *ctx,
 	set_bit(KEY_FLAG_USER_CONSTRUCT, &key->flags);
 
 	if (dest_keyring) {
+		ret = __key_link_lock(dest_keyring, &ctx->index_key);
+		if (ret < 0)
+			goto link_lock_failed;
 		ret = __key_link_begin(dest_keyring, &ctx->index_key, &edit);
 		if (ret < 0)
 			goto link_prealloc_failed;
@@ -423,6 +426,8 @@ static int construct_alloc_key(struct keyring_search_context *ctx,
 	return ret;
 
 link_prealloc_failed:
+	__key_link_end(dest_keyring, &ctx->index_key, edit);
+link_lock_failed:
 	mutex_unlock(&user->cons_lock);
 	key_put(key);
 	kleave(" = %d [prelink]", ret);

