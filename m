Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98AF54B993
	for <lists+keyrings@lfdr.de>; Wed, 19 Jun 2019 15:19:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730194AbfFSNTF (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 19 Jun 2019 09:19:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36432 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726518AbfFSNTF (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 19 Jun 2019 09:19:05 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 7589819CF7A;
        Wed, 19 Jun 2019 13:19:03 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com [10.10.120.57])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 37F665DA5B;
        Wed, 19 Jun 2019 13:19:01 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 02/10] keys: sparse: Fix incorrect RCU accesses [ver #3]
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org, ebiggers@kernel.org
Cc:     James Morris <jamorris@linux.microsoft.com>, dhowells@redhat.com,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 19 Jun 2019 14:19:00 +0100
Message-ID: <156095034027.9363.14636937467673662369.stgit@warthog.procyon.org.uk>
In-Reply-To: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
References: <156095032052.9363.8954337545422131435.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 19 Jun 2019 13:19:05 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Fix a pair of accesses that should be using RCU protection.

rcu_dereference_protected() is needed to access task_struct::real_parent.

current_cred() should be used to access current->cred.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: James Morris <jamorris@linux.microsoft.com>
---

 security/keys/keyctl.c           |    3 ++-
 security/keys/request_key_auth.c |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 3e4053a217c3..0f947bcbad46 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -1524,7 +1524,8 @@ long keyctl_session_to_parent(void)
 
 	ret = -EPERM;
 	oldwork = NULL;
-	parent = me->real_parent;
+	parent = rcu_dereference_protected(me->real_parent,
+					   lockdep_is_held(&tasklist_lock));
 
 	/* the parent mustn't be init and mustn't be a kernel thread */
 	if (parent->pid <= 1 || !parent->mm)
diff --git a/security/keys/request_key_auth.c b/security/keys/request_key_auth.c
index bda6201c6c45..572c7a60473a 100644
--- a/security/keys/request_key_auth.c
+++ b/security/keys/request_key_auth.c
@@ -152,7 +152,7 @@ struct key *request_key_auth_new(struct key *target, const char *op,
 				 struct key *dest_keyring)
 {
 	struct request_key_auth *rka, *irka;
-	const struct cred *cred = current->cred;
+	const struct cred *cred = current_cred();
 	struct key *authkey = NULL;
 	char desc[20];
 	int ret = -ENOMEM;

