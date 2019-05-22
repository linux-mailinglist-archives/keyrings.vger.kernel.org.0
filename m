Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1E182724D
	for <lists+keyrings@lfdr.de>; Thu, 23 May 2019 00:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729491AbfEVW2k (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 22 May 2019 18:28:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47890 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726781AbfEVW2k (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 22 May 2019 18:28:40 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id CFBA430001D9;
        Wed, 22 May 2019 22:28:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-142.rdu2.redhat.com [10.10.121.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CF64C60BF1;
        Wed, 22 May 2019 22:28:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 5/7] keys: Make __key_link_begin() handle lockdep nesting
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org
Cc:     dhowells@redhat.com, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 22 May 2019 23:28:38 +0100
Message-ID: <155856411812.10428.4394700002321005951.stgit@warthog.procyon.org.uk>
In-Reply-To: <155856408314.10428.17035328117829912815.stgit@warthog.procyon.org.uk>
References: <155856408314.10428.17035328117829912815.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Wed, 22 May 2019 22:28:39 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Make __key_link_begin() handle lockdep nesting for the implementation of
key_move() where we have to lock two keyrings.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 security/keys/internal.h    |    2 +-
 security/keys/key.c         |    6 +++---
 security/keys/keyring.c     |    6 +++---
 security/keys/request_key.c |    2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/security/keys/internal.h b/security/keys/internal.h
index 8f533c81aa8d..93513667ff9a 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -93,7 +93,7 @@ extern wait_queue_head_t request_key_conswq;
 extern struct key_type *key_type_lookup(const char *type);
 extern void key_type_put(struct key_type *ktype);
 
-extern int __key_link_begin(struct key *keyring,
+extern int __key_link_begin(struct key *keyring, unsigned int lock_nesting,
 			    const struct keyring_index_key *index_key,
 			    struct assoc_array_edit **_edit);
 extern int __key_link_check_live_key(struct key *keyring, struct key *key);
diff --git a/security/keys/key.c b/security/keys/key.c
index 696f1c092c50..e0750bc85b68 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -515,7 +515,7 @@ int key_instantiate_and_link(struct key *key,
 	}
 
 	if (keyring) {
-		ret = __key_link_begin(keyring, &key->index_key, &edit);
+		ret = __key_link_begin(keyring, 0, &key->index_key, &edit);
 		if (ret < 0)
 			goto error;
 
@@ -583,7 +583,7 @@ int key_reject_and_link(struct key *key,
 		if (keyring->restrict_link)
 			return -EPERM;
 
-		link_ret = __key_link_begin(keyring, &key->index_key, &edit);
+		link_ret = __key_link_begin(keyring, 0, &key->index_key, &edit);
 	}
 
 	mutex_lock(&key_construction_mutex);
@@ -860,7 +860,7 @@ key_ref_t key_create_or_update(key_ref_t keyring_ref,
 	}
 	index_key.desc_len = strlen(index_key.description);
 
-	ret = __key_link_begin(keyring, &index_key, &edit);
+	ret = __key_link_begin(keyring, 0, &index_key, &edit);
 	if (ret < 0) {
 		key_ref = ERR_PTR(ret);
 		goto error_free_prep;
diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index 2cfeeeaa1ffa..cd669f758632 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -1202,7 +1202,7 @@ static int keyring_detect_cycle(struct key *A, struct key *B)
 /*
  * Preallocate memory so that a key can be linked into to a keyring.
  */
-int __key_link_begin(struct key *keyring,
+int __key_link_begin(struct key *keyring, unsigned int lock_nesting,
 		     const struct keyring_index_key *index_key,
 		     struct assoc_array_edit **_edit)
 	__acquires(&keyring->sem)
@@ -1219,7 +1219,7 @@ int __key_link_begin(struct key *keyring,
 	if (keyring->type != &key_type_keyring)
 		return -ENOTDIR;
 
-	down_write(&keyring->sem);
+	down_write_nested(&keyring->sem, lock_nesting);
 
 	ret = -EKEYREVOKED;
 	if (test_bit(KEY_FLAG_REVOKED, &keyring->flags))
@@ -1366,7 +1366,7 @@ int key_link(struct key *keyring, struct key *key)
 	key_check(keyring);
 	key_check(key);
 
-	ret = __key_link_begin(keyring, &key->index_key, &edit);
+	ret = __key_link_begin(keyring, 0, &key->index_key, &edit);
 	if (ret == 0) {
 		kdebug("begun {%d,%d}", keyring->serial, refcount_read(&keyring->usage));
 		ret = __key_link_check_restriction(keyring, key);
diff --git a/security/keys/request_key.c b/security/keys/request_key.c
index 1f234b019437..e3653c6f85c6 100644
--- a/security/keys/request_key.c
+++ b/security/keys/request_key.c
@@ -372,7 +372,7 @@ static int construct_alloc_key(struct keyring_search_context *ctx,
 	set_bit(KEY_FLAG_USER_CONSTRUCT, &key->flags);
 
 	if (dest_keyring) {
-		ret = __key_link_begin(dest_keyring, &ctx->index_key, &edit);
+		ret = __key_link_begin(dest_keyring, 0, &ctx->index_key, &edit);
 		if (ret < 0)
 			goto link_prealloc_failed;
 	}

