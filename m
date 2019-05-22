Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4651927292
	for <lists+keyrings@lfdr.de>; Thu, 23 May 2019 00:46:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727365AbfEVWqk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 22 May 2019 18:46:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55582 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727121AbfEVWqj (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 22 May 2019 18:46:39 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id CC039307CDFC;
        Wed, 22 May 2019 22:46:39 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-121-142.rdu2.redhat.com [10.10.121.142])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D8DAF600C0;
        Wed, 22 May 2019 22:46:38 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 5/6] afs: Provide an RCU-capable key lookup
From:   David Howells <dhowells@redhat.com>
To:     keyrings@vger.kernel.org
Cc:     dhowells@redhat.com, linux-afs@lists.infradead.org,
        linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 22 May 2019 23:46:38 +0100
Message-ID: <155856519817.11737.3095092075887198321.stgit@warthog.procyon.org.uk>
In-Reply-To: <155856516286.11737.11196637682919902718.stgit@warthog.procyon.org.uk>
References: <155856516286.11737.11196637682919902718.stgit@warthog.procyon.org.uk>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 22 May 2019 22:46:39 +0000 (UTC)
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Provide an RCU-capable key lookup function.  We don't want to call
afs_request_key() in RCU-mode pathwalk as request_key() might sleep, even if
we don't ask it to construct anything as it might find a key that is currently
undergoing construction.

Signed-off-by: David Howells <dhowells@redhat.com>
---

 fs/afs/internal.h |    1 +
 fs/afs/security.c |   27 +++++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/fs/afs/internal.h b/fs/afs/internal.h
index 2073c1a3ab4b..3090efcc823f 100644
--- a/fs/afs/internal.h
+++ b/fs/afs/internal.h
@@ -1237,6 +1237,7 @@ extern void afs_cache_permit(struct afs_vnode *, struct key *, unsigned int,
 			     struct afs_status_cb *);
 extern void afs_zap_permits(struct rcu_head *);
 extern struct key *afs_request_key(struct afs_cell *);
+extern struct key *afs_request_key_rcu(struct afs_cell *);
 extern int afs_check_permit(struct afs_vnode *, struct key *, afs_access_t *);
 extern int afs_permission(struct inode *, int);
 extern void __exit afs_clean_up_permit_cache(void);
diff --git a/fs/afs/security.c b/fs/afs/security.c
index 5d8ece98561e..a6582d6a3882 100644
--- a/fs/afs/security.c
+++ b/fs/afs/security.c
@@ -49,6 +49,33 @@ struct key *afs_request_key(struct afs_cell *cell)
 	}
 }
 
+/*
+ * Get a key when pathwalk is in rcuwalk mode.
+ */
+struct key *afs_request_key_rcu(struct afs_cell *cell)
+{
+	struct key *key;
+
+	_enter("{%x}", key_serial(cell->anonymous_key));
+
+	_debug("key %s", cell->anonymous_key->description);
+	key = request_key_rcu(&key_type_rxrpc, cell->anonymous_key->description);
+	if (IS_ERR(key)) {
+		if (PTR_ERR(key) != -ENOKEY) {
+			_leave(" = %ld", PTR_ERR(key));
+			return key;
+		}
+
+		/* act as anonymous user */
+		_leave(" = {%x} [anon]", key_serial(cell->anonymous_key));
+		return cell->anonymous_key;
+	} else {
+		/* act as authorised user */
+		_leave(" = {%x} [auth]", key_serial(key));
+		return key;
+	}
+}
+
 /*
  * Dispose of a list of permits.
  */

