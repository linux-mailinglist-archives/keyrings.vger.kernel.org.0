Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 22DDB300F7
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2019 19:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfE3RZp (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 30 May 2019 13:25:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51058 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726546AbfE3RZn (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 30 May 2019 13:25:43 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 441B59FFC0;
        Thu, 30 May 2019 17:25:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-173.rdu2.redhat.com [10.10.120.173])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 41FF75DD9E;
        Thu, 30 May 2019 17:25:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 04/10] keys: Change keyring_serialise_link_sem to a mutex
 [ver #2]
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org
Cc:     dhowells@redhat.com, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, ebiggers@kernel.org
Date:   Thu, 30 May 2019 18:25:41 +0100
Message-ID: <155923714140.949.13143637354252349694.stgit@warthog.procyon.org.uk>
In-Reply-To: <155923711088.949.14909672457214372214.stgit@warthog.procyon.org.uk>
References: <155923711088.949.14909672457214372214.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Thu, 30 May 2019 17:25:43 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Change keyring_serialise_link_sem to a mutex as it's only ever
write-locked.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 security/keys/keyring.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index 5b218b270598..ca6694ba1773 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -100,7 +100,7 @@ EXPORT_SYMBOL(key_type_keyring);
  * Semaphore to serialise link/link calls to prevent two link calls in parallel
  * introducing a cycle.
  */
-static DECLARE_RWSEM(keyring_serialise_link_sem);
+static DEFINE_MUTEX(keyring_serialise_link_lock);
 
 /*
  * Publish the name of a keyring so that it can be found by name (if it has
@@ -1206,7 +1206,7 @@ int __key_link_begin(struct key *keyring,
 		     const struct keyring_index_key *index_key,
 		     struct assoc_array_edit **_edit)
 	__acquires(&keyring->sem)
-	__acquires(&keyring_serialise_link_sem)
+	__acquires(&keyring_serialise_link_lock)
 {
 	struct assoc_array_edit *edit;
 	int ret;
@@ -1228,7 +1228,7 @@ int __key_link_begin(struct key *keyring,
 	/* serialise link/link calls to prevent parallel calls causing a cycle
 	 * when linking two keyring in opposite orders */
 	if (index_key->type == &key_type_keyring)
-		down_write(&keyring_serialise_link_sem);
+		mutex_lock(&keyring_serialise_link_lock);
 
 	/* Create an edit script that will insert/replace the key in the
 	 * keyring tree.
@@ -1260,7 +1260,7 @@ int __key_link_begin(struct key *keyring,
 	assoc_array_cancel_edit(edit);
 error_sem:
 	if (index_key->type == &key_type_keyring)
-		up_write(&keyring_serialise_link_sem);
+		mutex_unlock(&keyring_serialise_link_lock);
 error_krsem:
 	up_write(&keyring->sem);
 	kleave(" = %d", ret);
@@ -1307,13 +1307,13 @@ void __key_link_end(struct key *keyring,
 		    const struct keyring_index_key *index_key,
 		    struct assoc_array_edit *edit)
 	__releases(&keyring->sem)
-	__releases(&keyring_serialise_link_sem)
+	__releases(&keyring_serialise_link_lock)
 {
 	BUG_ON(index_key->type == NULL);
 	kenter("%d,%s,", keyring->serial, index_key->type->name);
 
 	if (index_key->type == &key_type_keyring)
-		up_write(&keyring_serialise_link_sem);
+		mutex_unlock(&keyring_serialise_link_lock);
 
 	if (edit) {
 		if (!edit->dead_leaf) {

