Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7554B9A1
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2019 15:19:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731804AbfFSNT2 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Jun 2019 09:19:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36626 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbfFSNT2 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 19 Jun 2019 09:19:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id AE5A61796;
        Wed, 19 Jun 2019 13:19:27 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com [10.10.120.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 956615D71A;
        Wed, 19 Jun 2019 13:19:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 05/10] keys: Break bits out of key_unlink() [ver #3]
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org, ebiggers@kernel.org
Cc:     dhowells@redhat.com, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Wed, 19 Jun 2019 14:19:23 +0100
Message-ID: <156095036385.9363.921620306060848348.stgit@warthog.procyon.org.uk>
In-Reply-To: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
References: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 19 Jun 2019 13:19:27 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Break bits out of key_unlink() into helper functions so that they can be
used in implementing key_move().

Signed-off-by: David Howells <dhowells@redhat.com>
---

 security/keys/keyring.c |   88 ++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 67 insertions(+), 21 deletions(-)

diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index ca6694ba1773..6990c7761eaa 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -1382,6 +1382,65 @@ int key_link(struct key *keyring, struct key *key)
 }
 EXPORT_SYMBOL(key_link);
 
+/*
+ * Lock a keyring for unlink.
+ */
+static int __key_unlink_lock(struct key *keyring)
+	__acquires(&keyring->sem)
+{
+	if (keyring->type != &key_type_keyring)
+		return -ENOTDIR;
+
+	down_write(&keyring->sem);
+	return 0;
+}
+
+/*
+ * Begin the process of unlinking a key from a keyring.
+ */
+static int __key_unlink_begin(struct key *keyring, struct key *key,
+			      struct assoc_array_edit **_edit)
+{
+	struct assoc_array_edit *edit;
+
+	BUG_ON(*_edit != NULL);
+	
+	edit = assoc_array_delete(&keyring->keys, &keyring_assoc_array_ops,
+				  &key->index_key);
+	if (IS_ERR(edit))
+		return PTR_ERR(edit);
+
+	if (!edit)
+		return -ENOENT;
+
+	*_edit = edit;
+	return 0;
+}
+
+/*
+ * Apply an unlink change.
+ */
+static void __key_unlink(struct key *keyring, struct key *key,
+			 struct assoc_array_edit **_edit)
+{
+	assoc_array_apply_edit(*_edit);
+	*_edit = NULL;
+	key_payload_reserve(keyring, keyring->datalen - KEYQUOTA_LINK_BYTES);
+}
+
+/*
+ * Finish unlinking a key from to a keyring.
+ */
+static void __key_unlink_end(struct key *keyring,
+			     struct key *key,
+			     struct assoc_array_edit *edit)
+	__releases(&keyring->sem)
+{
+	if (edit)
+		assoc_array_cancel_edit(edit);
+	up_write(&keyring->sem);
+}
+
 /**
  * key_unlink - Unlink the first link to a key from a keyring.
  * @keyring: The keyring to remove the link from.
@@ -1401,33 +1460,20 @@ EXPORT_SYMBOL(key_link);
  */
 int key_unlink(struct key *keyring, struct key *key)
 {
-	struct assoc_array_edit *edit;
+	struct assoc_array_edit *edit = NULL;
 	int ret;
 
 	key_check(keyring);
 	key_check(key);
 
-	if (keyring->type != &key_type_keyring)
-		return -ENOTDIR;
-
-	down_write(&keyring->sem);
-
-	edit = assoc_array_delete(&keyring->keys, &keyring_assoc_array_ops,
-				  &key->index_key);
-	if (IS_ERR(edit)) {
-		ret = PTR_ERR(edit);
-		goto error;
-	}
-	ret = -ENOENT;
-	if (edit == NULL)
-		goto error;
-
-	assoc_array_apply_edit(edit);
-	key_payload_reserve(keyring, keyring->datalen - KEYQUOTA_LINK_BYTES);
-	ret = 0;
+	ret = __key_unlink_lock(keyring);
+	if (ret < 0)
+		return ret;
 
-error:
-	up_write(&keyring->sem);
+	ret = __key_unlink_begin(keyring, key, &edit);
+	if (ret == 0)
+		__key_unlink(keyring, key, &edit);
+	__key_unlink_end(keyring, key, edit);
 	return ret;
 }
 EXPORT_SYMBOL(key_unlink);

