Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17A7D2D41FC
	for <lists+keyrings@lfdr.de>; Wed,  9 Dec 2020 13:20:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731582AbgLIMSS (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Dec 2020 07:18:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36972 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731600AbgLIMSS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 9 Dec 2020 07:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607516212;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TAQKCgPD/ZwY1Zaj77jTJxxQ5eaZvDsGoqUqUjIFO58=;
        b=I4l1jETR4WMeo+f6/Zyd2ligc/S4/HNihxrMwnN4ZmrgEDrlG4AFT1nhdktchUHSY2Ognc
        o9BOhFworoY2KPmXyb+Ksn3aH3/Qcm5C5UUxdpoNhcEZCxfPZjokocV6WqnmEHEryitv1l
        eSWqi6EGyq67PgsOm2yi8OtoahUeXOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-nyAFK3BJM1yXYYcXIgPNAQ-1; Wed, 09 Dec 2020 07:16:48 -0500
X-MC-Unique: nyAFK3BJM1yXYYcXIgPNAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB312100D688;
        Wed,  9 Dec 2020 12:16:37 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-116-67.rdu2.redhat.com [10.10.116.67])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 682425C23A;
        Wed,  9 Dec 2020 12:16:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
        Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
        Kingdom.
        Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 17/18] certs: Fix blacklist flag type confusion
From:   David Howells <dhowells@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Cc:     =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@linux.microsoft.com>,
        Petko Manolov <petkan@mip-labs.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        David Woodhouse <dwmw2@infradead.org>, dhowells@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org
Date:   Wed, 09 Dec 2020 12:16:35 +0000
Message-ID: <160751619550.1238376.2380930476046994051.stgit@warthog.procyon.org.uk>
In-Reply-To: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
References: <160751606428.1238376.14935502103503420781.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

KEY_FLAG_KEEP is not meant to be passed to keyring_alloc() or key_alloc(),
as these only take KEY_ALLOC_* flags.  KEY_FLAG_KEEP has the same value as
KEY_ALLOC_BYPASS_RESTRICTION, but fortunately only key_create_or_update()
uses it.  LSMs using the key_alloc hook don't check that flag.

KEY_FLAG_KEEP is then ignored but fortunately (again) the root user cannot
write to the blacklist keyring, so it is not possible to remove a key/hash
from it.

Fix this by adding a KEY_ALLOC_SET_KEEP flag that tells key_alloc() to set
KEY_FLAG_KEEP on the new key.  blacklist_init() can then, correctly, pass
this to keyring_alloc().

We can also use this in ima_mok_init() rather than setting the flag
manually.

Note that this doesn't fix an observable bug with the current
implementation but it is required to allow addition of new hashes to the
blacklist in the future without making it possible for them to be removed.

Fixes: 734114f8782f ("KEYS: Add a system blacklist keyring")
Reported-by: Mickaël Salaün <mic@linux.microsoft.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Mickaël Salaün <mic@linux.microsoft.com>
cc: Petko Manolov <petkan@mip-labs.com>
cc: Mimi Zohar <zohar@linux.vnet.ibm.com>
Cc: David Woodhouse <dwmw2@infradead.org>
---

 certs/blacklist.c                |    2 +-
 include/linux/key.h              |    1 +
 security/integrity/ima/ima_mok.c |    3 +--
 security/keys/key.c              |    2 ++
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/certs/blacklist.c b/certs/blacklist.c
index a888b934a1cd..029471947838 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -162,7 +162,7 @@ static int __init blacklist_init(void)
 			      KEY_USR_VIEW | KEY_USR_READ |
 			      KEY_USR_SEARCH,
 			      KEY_ALLOC_NOT_IN_QUOTA |
-			      KEY_FLAG_KEEP,
+			      KEY_ALLOC_SET_KEEP,
 			      NULL, NULL);
 	if (IS_ERR(blacklist_keyring))
 		panic("Can't allocate system blacklist keyring\n");
diff --git a/include/linux/key.h b/include/linux/key.h
index 1b0837c975b9..7febc4881363 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -289,6 +289,7 @@ extern struct key *key_alloc(struct key_type *type,
 #define KEY_ALLOC_BUILT_IN		0x0004	/* Key is built into kernel */
 #define KEY_ALLOC_BYPASS_RESTRICTION	0x0008	/* Override the check on restricted keyrings */
 #define KEY_ALLOC_UID_KEYRING		0x0010	/* allocating a user or user session keyring */
+#define KEY_ALLOC_SET_KEEP		0x0020	/* Set the KEEP flag on the key/keyring */
 
 extern void key_revoke(struct key *key);
 extern void key_invalidate(struct key *key);
diff --git a/security/integrity/ima/ima_mok.c b/security/integrity/ima/ima_mok.c
index 36cadadbfba4..ce8871d96f12 100644
--- a/security/integrity/ima/ima_mok.c
+++ b/security/integrity/ima/ima_mok.c
@@ -39,12 +39,11 @@ __init int ima_mok_init(void)
 				KEY_USR_VIEW | KEY_USR_READ |
 				KEY_USR_WRITE | KEY_USR_SEARCH,
 				KEY_ALLOC_NOT_IN_QUOTA,
+				KEY_ALLOC_SET_KEEP,
 				restriction, NULL);
 
 	if (IS_ERR(ima_blacklist_keyring))
 		panic("Can't allocate IMA blacklist keyring.");
-
-	set_bit(KEY_FLAG_KEEP, &ima_blacklist_keyring->flags);
 	return 0;
 }
 device_initcall(ima_mok_init);
diff --git a/security/keys/key.c b/security/keys/key.c
index e282c6179b21..151ff39b6803 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -303,6 +303,8 @@ struct key *key_alloc(struct key_type *type, const char *desc,
 		key->flags |= 1 << KEY_FLAG_BUILTIN;
 	if (flags & KEY_ALLOC_UID_KEYRING)
 		key->flags |= 1 << KEY_FLAG_UID_KEYRING;
+	if (flags & KEY_ALLOC_SET_KEEP)
+		key->flags |= 1 << KEY_FLAG_KEEP;
 
 #ifdef KEY_DEBUGGING
 	key->magic = KEY_DEBUG_MAGIC;


