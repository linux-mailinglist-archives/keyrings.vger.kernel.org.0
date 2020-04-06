Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72A9E19EF51
	for <lists+keyrings@lfdr.de>; Mon,  6 Apr 2020 04:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgDFChm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 5 Apr 2020 22:37:42 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58334 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726436AbgDFChm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 5 Apr 2020 22:37:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586140660;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=3j6/xWR+/y23CIGLVS1aOs+gMcx6PTwUHS8ah6Kg6mM=;
        b=esXRl24DGLDJHP+Kd7+Eckcha9gTYGjNk2yK2uARIY+juh4DxZfzjqTHeDBwg/SMZZELon
        Jf342b75USmY+gDdzrm+GGsgQMpmzj6mv+y+rSJaTlKZdffxM9xKWAGZjArFI7MednxPXa
        4BkKmx7fRj0vnAI1HaklE26JwZb/v78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-8G4g1HmhMgKfrjtv31jIVQ-1; Sun, 05 Apr 2020 22:37:38 -0400
X-MC-Unique: 8G4g1HmhMgKfrjtv31jIVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A8B519067E3;
        Mon,  6 Apr 2020 02:37:37 +0000 (UTC)
Received: from llong.com (ovpn-112-57.rdu2.redhat.com [10.10.112.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D7A91277A4;
        Mon,  6 Apr 2020 02:37:28 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>
Cc:     linux-mm@kvack.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Waiman Long <longman@redhat.com>
Subject: [PATCH] mm: Add kvfree_sensitive() for freeing sensitive data objects
Date:   Sun,  5 Apr 2020 22:37:00 -0400
Message-Id: <20200406023700.1367-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

For kvmalloc'ed data object that contains sensitive information like
cryptographic key, we need to make sure that the buffer is always
cleared before freeing it. Using memset() alone for buffer clearing may
not provide certainty as the compiler may compile it away. To be sure,
the special memzero_explicit() has to be used.

This patch introduces a new kvfree_sensitive() for freeing those
sensitive data objects allocated by kvmalloc(). The relevnat places
where kvfree_sensitive() can be used are modified to use it.

Fixes: 4f0882491a14 ("KEYS: Avoid false positive ENOMEM error on key read")
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Waiman Long <longman@redhat.com>
---
 include/linux/mm.h       | 17 +++++++++++++++++
 security/keys/internal.h | 11 -----------
 security/keys/keyctl.c   | 16 +++++-----------
 3 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7dd5c4ccbf85..c26f279f1956 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -758,6 +758,23 @@ static inline void *kvcalloc(size_t n, size_t size, gfp_t flags)
 
 extern void kvfree(const void *addr);
 
+/**
+ * kvfree_sensitive - free a data object containing sensitive information
+ * @addr - address of the data object to be freed
+ * @len  - length of the data object
+ *
+ * Use the special memzero_explicit() function to clear the content of a
+ * kvmalloc'ed object containing sensitive data to make sure that the
+ * compiler won't optimize out the data clearing.
+ */
+static inline void kvfree_sensitive(const void *addr, size_t len)
+{
+	if (addr) {
+		memzero_explicit((void *)addr, len);
+		kvfree(addr);
+	}
+}
+
 static inline int compound_mapcount(struct page *page)
 {
 	VM_BUG_ON_PAGE(!PageCompound(page), page);
diff --git a/security/keys/internal.h b/security/keys/internal.h
index 6d0ca48ae9a5..153d35c20d3d 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -350,15 +350,4 @@ static inline void key_check(const struct key *key)
 #define key_check(key) do {} while(0)
 
 #endif
-
-/*
- * Helper function to clear and free a kvmalloc'ed memory object.
- */
-static inline void __kvzfree(const void *addr, size_t len)
-{
-	if (addr) {
-		memset((void *)addr, 0, len);
-		kvfree(addr);
-	}
-}
 #endif /* _INTERNAL_H */
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 5e01192e222a..edde63a63007 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -142,10 +142,7 @@ SYSCALL_DEFINE5(add_key, const char __user *, _type,
 
 	key_ref_put(keyring_ref);
  error3:
-	if (payload) {
-		memzero_explicit(payload, plen);
-		kvfree(payload);
-	}
+	kvfree_sensitive(payload, plen);
  error2:
 	kfree(description);
  error:
@@ -360,7 +357,7 @@ long keyctl_update_key(key_serial_t id,
 
 	key_ref_put(key_ref);
 error2:
-	__kvzfree(payload, plen);
+	kvfree_sensitive(payload, plen);
 error:
 	return ret;
 }
@@ -914,7 +911,7 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
 		 */
 		if (ret > key_data_len) {
 			if (unlikely(key_data))
-				__kvzfree(key_data, key_data_len);
+				kvfree_sensitive(key_data, key_data_len);
 			key_data_len = ret;
 			continue;	/* Allocate buffer */
 		}
@@ -923,7 +920,7 @@ long keyctl_read_key(key_serial_t keyid, char __user *buffer, size_t buflen)
 			ret = -EFAULT;
 		break;
 	}
-	__kvzfree(key_data, key_data_len);
+	kvfree_sensitive(key_data, key_data_len);
 
 key_put_out:
 	key_put(key);
@@ -1225,10 +1222,7 @@ long keyctl_instantiate_key_common(key_serial_t id,
 		keyctl_change_reqkey_auth(NULL);
 
 error2:
-	if (payload) {
-		memzero_explicit(payload, plen);
-		kvfree(payload);
-	}
+	kvfree_sensitive(payload, plen);
 error:
 	return ret;
 }
-- 
2.18.1

