Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBCD64B990
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2019 15:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730814AbfFSNSz (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Jun 2019 09:18:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35696 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbfFSNSz (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 19 Jun 2019 09:18:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 082AB2F8BC5;
        Wed, 19 Jun 2019 13:18:55 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com [10.10.120.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EEAF5608A7;
        Wed, 19 Jun 2019 13:18:51 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 01/10] keys: sparse: Fix key_fs[ug]id_changed() [ver #3]
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org, ebiggers@kernel.org
Cc:     James Morris <jamorris@linux.microsoft.com>, dhowells@redhat.com,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 19 Jun 2019 14:18:51 +0100
Message-ID: <156095033115.9363.3778890760816757211.stgit@warthog.procyon.org.uk>
In-Reply-To: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
References: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 19 Jun 2019 13:18:55 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Sparse warnings are incurred by key_fs[ug]id_changed() due to unprotected
accesses of tsk->cred, which is marked __rcu.

Fix this by passing the new cred struct to these functions from
commit_creds() rather than the task pointer.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: James Morris <jamorris@linux.microsoft.com>
---

 include/linux/key.h          |    8 ++++----
 kernel/cred.c                |    4 ++--
 security/keys/process_keys.c |   22 ++++++++++------------
 3 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/include/linux/key.h b/include/linux/key.h
index 7099985e35a9..1f09aad1c98c 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -402,8 +402,8 @@ extern struct ctl_table key_sysctls[];
  * the userspace interface
  */
 extern int install_thread_keyring_to_cred(struct cred *cred);
-extern void key_fsuid_changed(struct task_struct *tsk);
-extern void key_fsgid_changed(struct task_struct *tsk);
+extern void key_fsuid_changed(struct cred *new_cred);
+extern void key_fsgid_changed(struct cred *new_cred);
 extern void key_init(void);
 
 #else /* CONFIG_KEYS */
@@ -418,8 +418,8 @@ extern void key_init(void);
 #define make_key_ref(k, p)		NULL
 #define key_ref_to_ptr(k)		NULL
 #define is_key_possessed(k)		0
-#define key_fsuid_changed(t)		do { } while(0)
-#define key_fsgid_changed(t)		do { } while(0)
+#define key_fsuid_changed(c)		do { } while(0)
+#define key_fsgid_changed(c)		do { } while(0)
 #define key_init()			do { } while(0)
 
 #endif /* CONFIG_KEYS */
diff --git a/kernel/cred.c b/kernel/cred.c
index 45d77284aed0..3bd40de9e192 100644
--- a/kernel/cred.c
+++ b/kernel/cred.c
@@ -455,9 +455,9 @@ int commit_creds(struct cred *new)
 
 	/* alter the thread keyring */
 	if (!uid_eq(new->fsuid, old->fsuid))
-		key_fsuid_changed(task);
+		key_fsuid_changed(new);
 	if (!gid_eq(new->fsgid, old->fsgid))
-		key_fsgid_changed(task);
+		key_fsgid_changed(new);
 
 	/* do it
 	 * RLIMIT_NPROC limits on user->processes have already been checked
diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index f05f7125a7d5..ba5d3172cafe 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -293,28 +293,26 @@ static int install_session_keyring(struct key *keyring)
 /*
  * Handle the fsuid changing.
  */
-void key_fsuid_changed(struct task_struct *tsk)
+void key_fsuid_changed(struct cred *new_cred)
 {
 	/* update the ownership of the thread keyring */
-	BUG_ON(!tsk->cred);
-	if (tsk->cred->thread_keyring) {
-		down_write(&tsk->cred->thread_keyring->sem);
-		tsk->cred->thread_keyring->uid = tsk->cred->fsuid;
-		up_write(&tsk->cred->thread_keyring->sem);
+	if (new_cred->thread_keyring) {
+		down_write(&new_cred->thread_keyring->sem);
+		new_cred->thread_keyring->uid = new_cred->fsuid;
+		up_write(&new_cred->thread_keyring->sem);
 	}
 }
 
 /*
  * Handle the fsgid changing.
  */
-void key_fsgid_changed(struct task_struct *tsk)
+void key_fsgid_changed(struct cred *new_cred)
 {
 	/* update the ownership of the thread keyring */
-	BUG_ON(!tsk->cred);
-	if (tsk->cred->thread_keyring) {
-		down_write(&tsk->cred->thread_keyring->sem);
-		tsk->cred->thread_keyring->gid = tsk->cred->fsgid;
-		up_write(&tsk->cred->thread_keyring->sem);
+	if (new_cred->thread_keyring) {
+		down_write(&new_cred->thread_keyring->sem);
+		new_cred->thread_keyring->gid = new_cred->fsgid;
+		up_write(&new_cred->thread_keyring->sem);
 	}
 }
 

