Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 554D14B9A6
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2019 15:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731875AbfFSNTp (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Jun 2019 09:19:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33060 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730340AbfFSNTo (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 19 Jun 2019 09:19:44 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 25C263097032;
        Wed, 19 Jun 2019 13:19:44 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com [10.10.120.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CA6715D9C6;
        Wed, 19 Jun 2019 13:19:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 07/10] keys: Add a keyctl to move a key between keyrings
 [ver #3]
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org, ebiggers@kernel.org
Cc:     dhowells@redhat.com, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 19 Jun 2019 14:19:41 +0100
Message-ID: <156095038101.9363.17063850083466117267.stgit@warthog.procyon.org.uk>
In-Reply-To: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
References: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Wed, 19 Jun 2019 13:19:44 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Add a keyctl to atomically move a link to a key from one keyring to
another.  The key must exist in "from" keyring and a flag can be given to
cause the operation to fail if there's a matching key already in the "to"
keyring.

This can be done with:

	keyctl(KEYCTL_MOVE,
	       key_serial_t key,
	       key_serial_t from_keyring,
	       key_serial_t to_keyring,
	       unsigned int flags);

The key being moved must grant Link permission and both keyrings must grant
Write permission.

flags should be 0 or KEYCTL_MOVE_EXCL, with the latter preventing
displacement of a matching key from the "to" keyring.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 Documentation/security/keys/core.rst |   21 +++++++
 include/linux/key.h                  |    5 ++
 include/uapi/linux/keyctl.h          |    3 +
 security/keys/compat.c               |    3 +
 security/keys/internal.h             |    3 +
 security/keys/keyctl.c               |   52 ++++++++++++++++
 security/keys/keyring.c              |  108 ++++++++++++++++++++++++++++++++++
 7 files changed, 195 insertions(+)

diff --git a/Documentation/security/keys/core.rst b/Documentation/security/keys/core.rst
index 9521c4207f01..823d29bf44f7 100644
--- a/Documentation/security/keys/core.rst
+++ b/Documentation/security/keys/core.rst
@@ -577,6 +577,27 @@ The keyctl syscall functions are:
      added.
 
 
+  *  Move a key from one keyring to another::
+
+	long keyctl(KEYCTL_MOVE,
+		    key_serial_t id,
+		    key_serial_t from_ring_id,
+		    key_serial_t to_ring_id,
+		    unsigned int flags);
+
+     Move the key specified by "id" from the keyring specified by
+     "from_ring_id" to the keyring specified by "to_ring_id".  If the two
+     keyrings are the same, nothing is done.
+
+     "flags" can have KEYCTL_MOVE_EXCL set in it to cause the operation to fail
+     with EEXIST if a matching key exists in the destination keyring, otherwise
+     such a key will be replaced.
+
+     A process must have link permission on the key for this function to be
+     successful and write permission on both keyrings.  Any errors that can
+     occur from KEYCTL_LINK also apply on the destination keyring here.
+
+
   *  Unlink a key or keyring from another keyring::
 
 	long keyctl(KEYCTL_UNLINK, key_serial_t keyring, key_serial_t key);
diff --git a/include/linux/key.h b/include/linux/key.h
index 1f09aad1c98c..612e1cf84049 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -310,6 +310,11 @@ extern int key_update(key_ref_t key,
 extern int key_link(struct key *keyring,
 		    struct key *key);
 
+extern int key_move(struct key *key,
+		    struct key *from_keyring,
+		    struct key *to_keyring,
+		    unsigned int flags);
+
 extern int key_unlink(struct key *keyring,
 		      struct key *key);
 
diff --git a/include/uapi/linux/keyctl.h b/include/uapi/linux/keyctl.h
index f45ee0f69c0c..fd9fb11b312b 100644
--- a/include/uapi/linux/keyctl.h
+++ b/include/uapi/linux/keyctl.h
@@ -67,6 +67,7 @@
 #define KEYCTL_PKEY_SIGN		27	/* Create a public key signature */
 #define KEYCTL_PKEY_VERIFY		28	/* Verify a public key signature */
 #define KEYCTL_RESTRICT_KEYRING		29	/* Restrict keys allowed to link to a keyring */
+#define KEYCTL_MOVE			30	/* Move keys between keyrings */
 
 /* keyctl structures */
 struct keyctl_dh_params {
@@ -112,4 +113,6 @@ struct keyctl_pkey_params {
 	__u32		__spare[7];
 };
 
+#define KEYCTL_MOVE_EXCL	0x00000001 /* Do not displace from the to-keyring */
+
 #endif /*  _LINUX_KEYCTL_H */
diff --git a/security/keys/compat.c b/security/keys/compat.c
index 9482df601dc3..b326bc4f84d7 100644
--- a/security/keys/compat.c
+++ b/security/keys/compat.c
@@ -159,6 +159,9 @@ COMPAT_SYSCALL_DEFINE5(keyctl, u32, option,
 		return keyctl_pkey_verify(compat_ptr(arg2), compat_ptr(arg3),
 					  compat_ptr(arg4), compat_ptr(arg5));
 
+	case KEYCTL_MOVE:
+		return keyctl_keyring_move(arg2, arg3, arg4, arg5);
+
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/security/keys/internal.h b/security/keys/internal.h
index 25cdd0cbdc06..b54a58c025ae 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -95,6 +95,8 @@ extern void key_type_put(struct key_type *ktype);
 
 extern int __key_link_lock(struct key *keyring,
 			   const struct keyring_index_key *index_key);
+extern int __key_move_lock(struct key *l_keyring, struct key *u_keyring,
+			   const struct keyring_index_key *index_key);
 extern int __key_link_begin(struct key *keyring,
 			    const struct keyring_index_key *index_key,
 			    struct assoc_array_edit **_edit);
@@ -217,6 +219,7 @@ extern long keyctl_update_key(key_serial_t, const void __user *, size_t);
 extern long keyctl_revoke_key(key_serial_t);
 extern long keyctl_keyring_clear(key_serial_t);
 extern long keyctl_keyring_link(key_serial_t, key_serial_t);
+extern long keyctl_keyring_move(key_serial_t, key_serial_t, key_serial_t, unsigned int);
 extern long keyctl_keyring_unlink(key_serial_t, key_serial_t);
 extern long keyctl_describe_key(key_serial_t, char __user *, size_t);
 extern long keyctl_keyring_search(key_serial_t, const char __user *,
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 0f947bcbad46..bbfe7d92d41c 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -572,6 +572,52 @@ long keyctl_keyring_unlink(key_serial_t id, key_serial_t ringid)
 	return ret;
 }
 
+/*
+ * Move a link to a key from one keyring to another, displacing any matching
+ * key from the destination keyring.
+ *
+ * The key must grant the caller Link permission and both keyrings must grant
+ * the caller Write permission.  There must also be a link in the from keyring
+ * to the key.  If both keyrings are the same, nothing is done.
+ *
+ * If successful, 0 will be returned.
+ */
+long keyctl_keyring_move(key_serial_t id, key_serial_t from_ringid,
+			 key_serial_t to_ringid, unsigned int flags)
+{
+	key_ref_t key_ref, from_ref, to_ref;
+	long ret;
+
+	if (flags & ~KEYCTL_MOVE_EXCL)
+		return -EINVAL;
+
+	key_ref = lookup_user_key(id, KEY_LOOKUP_CREATE, KEY_NEED_LINK);
+	if (IS_ERR(key_ref))
+		return PTR_ERR(key_ref);
+
+	from_ref = lookup_user_key(from_ringid, 0, KEY_NEED_WRITE);
+	if (IS_ERR(from_ref)) {
+		ret = PTR_ERR(from_ref);
+		goto error2;
+	}
+
+	to_ref = lookup_user_key(to_ringid, KEY_LOOKUP_CREATE, KEY_NEED_WRITE);
+	if (IS_ERR(to_ref)) {
+		ret = PTR_ERR(to_ref);
+		goto error3;
+	}
+
+	ret = key_move(key_ref_to_ptr(key_ref), key_ref_to_ptr(from_ref),
+		       key_ref_to_ptr(to_ref), flags);
+
+	key_ref_put(to_ref);
+error3:
+	key_ref_put(from_ref);
+error2:
+	key_ref_put(key_ref);
+	return ret;
+}
+
 /*
  * Return a description of a key to userspace.
  *
@@ -1772,6 +1818,12 @@ SYSCALL_DEFINE5(keyctl, int, option, unsigned long, arg2, unsigned long, arg3,
 			(const void __user *)arg4,
 			(const void __user *)arg5);
 
+	case KEYCTL_MOVE:
+		return keyctl_keyring_move((key_serial_t)arg2,
+					   (key_serial_t)arg3,
+					   (key_serial_t)arg4,
+					   (unsigned int)arg5);
+
 	default:
 		return -EOPNOTSUPP;
 	}
diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index 12acad3db6cf..67066bb58b83 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -1221,6 +1221,40 @@ int __key_link_lock(struct key *keyring,
 	return 0;
 }
 
+/*
+ * Lock keyrings for move (link/unlink combination).
+ */
+int __key_move_lock(struct key *l_keyring, struct key *u_keyring,
+		    const struct keyring_index_key *index_key)
+	__acquires(&l_keyring->sem)
+	__acquires(&u_keyring->sem)
+	__acquires(&keyring_serialise_link_lock)
+{
+	if (l_keyring->type != &key_type_keyring ||
+	    u_keyring->type != &key_type_keyring)
+		return -ENOTDIR;
+
+	/* We have to be very careful here to take the keyring locks in the
+	 * right order, lest we open ourselves to deadlocking against another
+	 * move operation.
+	 */
+	if (l_keyring < u_keyring) {
+		down_write(&l_keyring->sem);
+		down_write_nested(&u_keyring->sem, 1);
+	} else {
+		down_write(&u_keyring->sem);
+		down_write_nested(&l_keyring->sem, 1);
+	}
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
@@ -1494,6 +1528,80 @@ int key_unlink(struct key *keyring, struct key *key)
 }
 EXPORT_SYMBOL(key_unlink);
 
+/**
+ * key_move - Move a key from one keyring to another
+ * @key: The key to move
+ * @from_keyring: The keyring to remove the link from.
+ * @to_keyring: The keyring to make the link in.
+ * @flags: Qualifying flags, such as KEYCTL_MOVE_EXCL.
+ *
+ * Make a link in @to_keyring to a key, such that the keyring holds a reference
+ * on that key and the key can potentially be found by searching that keyring
+ * whilst simultaneously removing a link to the key from @from_keyring.
+ *
+ * This function will write-lock both keyring's semaphores and will consume
+ * some of the user's key data quota to hold the link on @to_keyring.
+ *
+ * Returns 0 if successful, -ENOTDIR if either keyring isn't a keyring,
+ * -EKEYREVOKED if either keyring has been revoked, -ENFILE if the second
+ * keyring is full, -EDQUOT if there is insufficient key data quota remaining
+ * to add another link or -ENOMEM if there's insufficient memory.  If
+ * KEYCTL_MOVE_EXCL is set, then -EEXIST will be returned if there's already a
+ * matching key in @to_keyring.
+ *
+ * It is assumed that the caller has checked that it is permitted for a link to
+ * be made (the keyring should have Write permission and the key Link
+ * permission).
+ */
+int key_move(struct key *key,
+	     struct key *from_keyring,
+	     struct key *to_keyring,
+	     unsigned int flags)
+{
+	struct assoc_array_edit *from_edit = NULL, *to_edit = NULL;
+	int ret;
+
+	kenter("%d,%d,%d", key->serial, from_keyring->serial, to_keyring->serial);
+
+	if (from_keyring == to_keyring)
+		return 0;
+
+	key_check(key);
+	key_check(from_keyring);
+	key_check(to_keyring);
+
+	ret = __key_move_lock(from_keyring, to_keyring, &key->index_key);
+	if (ret < 0)
+		goto out;
+	ret = __key_unlink_begin(from_keyring, key, &from_edit);
+	if (ret < 0)
+		goto error;
+	ret = __key_link_begin(to_keyring, &key->index_key, &to_edit);
+	if (ret < 0)
+		goto error;
+
+	ret = -EEXIST;
+	if (to_edit->dead_leaf && (flags & KEYCTL_MOVE_EXCL))
+		goto error;
+
+	ret = __key_link_check_restriction(to_keyring, key);
+	if (ret < 0)
+		goto error;
+	ret = __key_link_check_live_key(to_keyring, key);
+	if (ret < 0)
+		goto error;
+
+	__key_unlink(from_keyring, key, &from_edit);
+	__key_link(key, &to_edit);
+error:
+	__key_link_end(to_keyring, &key->index_key, to_edit);
+	__key_unlink_end(from_keyring, key, from_edit);
+out:
+	kleave(" = %d", ret);
+	return ret;
+}
+EXPORT_SYMBOL(key_move);
+
 /**
  * keyring_clear - Clear a keyring
  * @keyring: The keyring to clear.

