Return-Path: <keyrings+bounces-1915-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B2C959BF0
	for <lists+keyrings@lfdr.de>; Wed, 21 Aug 2024 14:36:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED4BDB23226
	for <lists+keyrings@lfdr.de>; Wed, 21 Aug 2024 12:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6D2818BC36;
	Wed, 21 Aug 2024 12:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y3Ztb8yD"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC54192D8B
	for <keyrings@vger.kernel.org>; Wed, 21 Aug 2024 12:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724243796; cv=none; b=cRNY0tkxahJrDvE7fCJHumyMxDer4NdQNuchctk6kKw4pUr3jr1dV0sAEzLYi88qinc+0SLdqWdK8hTrbgOHQb4Y8DYZ7oWJJe2xcsFew5HacU/heaogTmkIW14uXj6+g5BBVF2caWPoljfsWPWDjrt98VWL0Csk3/2H4yt9ilU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724243796; c=relaxed/simple;
	bh=biAla2+tDuO620PqR8PPrT6nQ4xm9Caqb/5pyAP/muw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfoO1dxrlOt732Twoy2Y4F5b5vd9Bq4x8M1MQAHyOVjDlVtq0e3KrEJN/GZDAikS2kV46iCBX+F2qEBG53afLtUORSSeQpqXwltavTNeIGCRrYcduPb4aEhDCetAyvkFfnfbumWVEaa8vyGVyO+eN1HsFrAiZbNTwx8p9e8RejI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y3Ztb8yD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724243794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GCuFnR5X9H0OLLLaiWpXef0YVQ7dHPn4OY0ESihFasw=;
	b=Y3Ztb8yDpA7YjGDnMIJt0XT8jpI11/Xz3Z3TJfIs9ZJyM9/UsgCIeoSeDCMgBRm9BkEdTx
	TQBme77TgiSmVrE0dZCb3SYWrCy7uV2KOmz/RkM6XMfy6wtHSEDg2YDbpgNi7g1oBR33F9
	ODdb1VlzVASM1PV3lzWkfX6gfFmAUTE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-MP2BVvUKPxi9CTMibNUXfg-1; Wed,
 21 Aug 2024 08:36:31 -0400
X-MC-Unique: MP2BVvUKPxi9CTMibNUXfg-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3E10E1954B1B;
	Wed, 21 Aug 2024 12:36:30 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.30])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9589419560A3;
	Wed, 21 Aug 2024 12:36:28 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] keys: Extract struct key_user to its own header for tracing purposes
Date: Wed, 21 Aug 2024 13:36:10 +0100
Message-ID: <20240821123616.60401-3-dhowells@redhat.com>
In-Reply-To: <20240821123616.60401-1-dhowells@redhat.com>
References: <20240821123616.60401-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Extract the key_user struct  to its own header file to make it easier to
access from tracepoints.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jarkko Sakkinen <jarkko@kernel.org>
cc: keyrings@vger.kernel.org
cc: linux-security-module@vger.kernel.org
---
 include/keys/key_user.h  | 35 +++++++++++++++++++++++++++++++++++
 security/keys/internal.h | 20 +-------------------
 2 files changed, 36 insertions(+), 19 deletions(-)
 create mode 100644 include/keys/key_user.h

diff --git a/include/keys/key_user.h b/include/keys/key_user.h
new file mode 100644
index 000000000000..e9c383d8116e
--- /dev/null
+++ b/include/keys/key_user.h
@@ -0,0 +1,35 @@
+/* User quota tracking for keys.
+ *
+ * Copyright (C) 2024 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public Licence
+ * as published by the Free Software Foundation; either version
+ * 2 of the Licence, or (at your option) any later version.
+ */
+
+#ifndef _KEYS_KEY_USER_H
+#define _KEYS_KEY_USER_H
+
+/*
+ * Keep track of keys for a user.
+ *
+ * This needs to be separate to user_struct to avoid a refcount-loop
+ * (user_struct pins some keyrings which pin this struct).
+ *
+ * We also keep track of keys under request from userspace for this UID here.
+ */
+struct key_user {
+	struct rb_node		node;
+	struct mutex		cons_lock;	/* construction initiation lock */
+	spinlock_t		lock;
+	refcount_t		usage;		/* for accessing qnkeys & qnbytes */
+	atomic_t		nkeys;		/* number of keys */
+	atomic_t		nikeys;		/* number of instantiated keys */
+	kuid_t			uid;
+	int			qnkeys;		/* number of keys allocated to this user */
+	int			qnbytes;	/* number of bytes allocated to this user */
+};
+
+#endif /* _KEYS_KEY_USER_H */
diff --git a/security/keys/internal.h b/security/keys/internal.h
index 8ba87127e446..33c929a6bb97 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -19,6 +19,7 @@
 #include <linux/compat.h>
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
+#include <keys/key_user.h>
 
 struct iovec;
 
@@ -43,25 +44,6 @@ extern struct key_type key_type_user;
 extern struct key_type key_type_logon;
 
 /*****************************************************************************/
-/*
- * Keep track of keys for a user.
- *
- * This needs to be separate to user_struct to avoid a refcount-loop
- * (user_struct pins some keyrings which pin this struct).
- *
- * We also keep track of keys under request from userspace for this UID here.
- */
-struct key_user {
-	struct rb_node		node;
-	struct mutex		cons_lock;	/* construction initiation lock */
-	spinlock_t		lock;
-	refcount_t		usage;		/* for accessing qnkeys & qnbytes */
-	atomic_t		nkeys;		/* number of keys */
-	atomic_t		nikeys;		/* number of instantiated keys */
-	kuid_t			uid;
-	int			qnkeys;		/* number of keys allocated to this user */
-	int			qnbytes;	/* number of bytes allocated to this user */
-};
 
 extern struct rb_root	key_user_tree;
 extern spinlock_t	key_user_lock;


