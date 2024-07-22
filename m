Return-Path: <keyrings+bounces-1815-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 818B29396DD
	for <lists+keyrings@lfdr.de>; Tue, 23 Jul 2024 01:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F28B1C21890
	for <lists+keyrings@lfdr.de>; Mon, 22 Jul 2024 23:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B9849645;
	Mon, 22 Jul 2024 23:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IGj0uGcE"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CD63CF74
	for <keyrings@vger.kernel.org>; Mon, 22 Jul 2024 23:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721690448; cv=none; b=XBOhgCkDBHChNGR/BRmEuV79BPJRGaxBCpPwr1cW/V47zcSugIzBYY5DDPqqTMMLnQW/xhwyJmCG8od7k/hPbZUlGAeHjcqe2NWFmUNl86EXWhJfvFQ+JnRGY6oi0hjT952/67LQc+26ZuMCYSqiP9ma4y/6fUz7CS+D92UnfXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721690448; c=relaxed/simple;
	bh=8hI9lMbi+UjmjXCWHkVzDLluc5krJzYPJfazR5yT51M=;
	h=From:To:cc:Subject:MIME-Version:Content-Type:Date:Message-ID; b=OBUBk86zcP/ke7/y7cVqInnroWZ/CAHITw2ZWl397hGyofs7BnQg7JD8hJSXvkfgrFwbv3AxRyT1OeSR+rI0GpWZsa7yfySvjpqn6Wx+qvpniEDYOsqsJIlUQrIbOv8EeGzFvY/QSOB82UtKzX42wgd444QAybQBwRLnbCdzafc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IGj0uGcE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721690444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=E/sVu4ReP0qZaeipwhOkCe2X7CHcHmPX/Of9Aa8Ry64=;
	b=IGj0uGcE9/otyiCxGPP6F4URXFLeVGQO7/On1+hk1qlTdSiRJ+IeqmtQZ3izQNsKb1pG6K
	4uhvoJdq1Urhlxdq+JQ9/0yRNZNHf/PDKkl1d5wcSrF+j7CHFf6SznhsORmFXx0T5my9V3
	g7llfVfGRpo4LjXhZikDGvmBHX+2+Zc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-346-LeBt59QaPGOIVV85WaAegQ-1; Mon,
 22 Jul 2024 19:20:39 -0400
X-MC-Unique: LeBt59QaPGOIVV85WaAegQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7110C1955F28;
	Mon, 22 Jul 2024 23:20:38 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.216])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B4CD51955D4A;
	Mon, 22 Jul 2024 23:20:36 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: keyrings@vger.kernel.org
cc: dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
    linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] keys: Add tracepoints for the keyrings facility
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2014450.1721690435.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jul 2024 00:20:35 +0100
Message-ID: <2014451.1721690435@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Add some tracepoints to aid in debuggin the keyrings facility and
applications that use it.  A number of events and operations are traceable=
,
including:

  - Allocation
  - Refcounting
  - Instantiation and negative instantiation/rejection
  - Update
  - Detection of key being dead
  - Key quota changes
  - Key quota failure
  - Link, unlink and move
  - Keyring clearance
  - Revocation and invalidation
  - Garbage collection

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jarkko Sakkinen <jarkko@kernel.org>
cc: keyrings@vger.kernel.org
cc: linux-security-module@vger.kernel.org
---
 Documentation/security/keys/core.rst |    1 =

 crypto/asymmetric_keys/restrict.c    |    6 =

 include/keys/key_user.h              |   35 +++
 include/linux/key.h                  |   16 -
 include/trace/events/key.h           |  401 +++++++++++++++++++++++++++++=
++++++
 security/keys/gc.c                   |    4 =

 security/keys/internal.h             |   41 ---
 security/keys/key.c                  |   66 +++++
 security/keys/keyctl.c               |    2 =

 security/keys/keyring.c              |   45 +++
 security/keys/process_keys.c         |   15 -
 11 files changed, 562 insertions(+), 70 deletions(-)

diff --git a/Documentation/security/keys/core.rst b/Documentation/security=
/keys/core.rst
index 326b8a973828..0b179540d885 100644
--- a/Documentation/security/keys/core.rst
+++ b/Documentation/security/keys/core.rst
@@ -1217,7 +1217,6 @@ payload contents" for more information.
  *  Extra references can be made to a key by calling one of the following
     functions::
 =

-	struct key *__key_get(struct key *key);
 	struct key *key_get(struct key *key);
 =

     Keys so references will need to be disposed of by calling key_put() w=
hen
diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/re=
strict.c
index afcd4d101ac5..1ea7bfd4e5d7 100644
--- a/crypto/asymmetric_keys/restrict.c
+++ b/crypto/asymmetric_keys/restrict.c
@@ -267,20 +267,20 @@ static int key_or_keyring_common(struct key *dest_ke=
yring,
 			if (!sig->auth_ids[0] && !sig->auth_ids[1]) {
 				if (asymmetric_key_id_same(signer_ids[2],
 							   sig->auth_ids[2]))
-					key =3D __key_get(trusted);
+					key =3D key_get(trusted);
 =

 			} else if (!sig->auth_ids[0] || !sig->auth_ids[1]) {
 				const struct asymmetric_key_id *auth_id;
 =

 				auth_id =3D sig->auth_ids[0] ?: sig->auth_ids[1];
 				if (match_either_id(signer_ids, auth_id))
-					key =3D __key_get(trusted);
+					key =3D key_get(trusted);
 =

 			} else if (asymmetric_key_id_same(signer_ids[1],
 							  sig->auth_ids[1]) &&
 				   match_either_id(signer_ids,
 						   sig->auth_ids[0])) {
-				key =3D __key_get(trusted);
+				key =3D key_get(trusted);
 			}
 		} else {
 			return -EOPNOTSUPP;
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
+ * We also keep track of keys under request from userspace for this UID h=
ere.
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
diff --git a/include/linux/key.h b/include/linux/key.h
index 943a432da3ae..4e5baf3e7286 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -299,24 +299,20 @@ extern struct key *key_alloc(struct key_type *type,
 =

 extern void key_revoke(struct key *key);
 extern void key_invalidate(struct key *key);
+struct key *key_get(struct key *key);
+struct key *key_try_get(struct key *key);
 extern void key_put(struct key *key);
 extern bool key_put_tag(struct key_tag *tag);
 extern void key_remove_domain(struct key_tag *domain_tag);
 =

-static inline struct key *__key_get(struct key *key)
-{
-	refcount_inc(&key->usage);
-	return key;
-}
-
-static inline struct key *key_get(struct key *key)
+static inline void key_ref_put(key_ref_t key_ref)
 {
-	return key ? __key_get(key) : key;
+	key_put(key_ref_to_ptr(key_ref));
 }
 =

-static inline void key_ref_put(key_ref_t key_ref)
+static inline void key_ref_get(key_ref_t key_ref)
 {
-	key_put(key_ref_to_ptr(key_ref));
+	key_get(key_ref_to_ptr(key_ref));
 }
 =

 extern struct key *request_key_tag(struct key_type *type,
diff --git a/include/trace/events/key.h b/include/trace/events/key.h
new file mode 100644
index 000000000000..b3f8c39cc0e8
--- /dev/null
+++ b/include/trace/events/key.h
@@ -0,0 +1,401 @@
+/* Keyrings tracepoints
+ *
+ * Copyright (C) 2024 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public Licence
+ * as published by the Free Software Foundation; either version
+ * 2 of the Licence, or (at your option) any later version.
+ */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM key
+
+#if !defined(_TRACE_KEY_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_KEY_H
+
+#include <linux/tracepoint.h>
+
+struct key;
+
+/*
+ * Declare tracing information enums and their string mappings for displa=
y.
+ */
+#define key_ref_traces \
+	EM(key_trace_ref_alloc,			"ALLOC") \
+	EM(key_trace_ref_free,			"FREE ") \
+	EM(key_trace_ref_gc,			"GC   ") \
+	EM(key_trace_ref_get,			"GET  ") \
+	EM(key_trace_ref_put,			"PUT  ") \
+	E_(key_trace_ref_try_get,		"GET  ")
+
+#define key_dead_traces \
+	EM(key_trace_dead_type_removed,		"TYPR") \
+	EM(key_trace_dead_domain_removed,	"DOMR") \
+	EM(key_trace_dead_expired,		"EXPD") \
+	E_(key_trace_dead_invalidated,		"INVL")
+
+/*
+ * Generate enums for tracing information.
+ */
+#ifndef __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
+#define __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
+
+#undef EM
+#undef E_
+#define EM(a, b) a,
+#define E_(a, b) a
+
+enum key_dead_trace	{ key_dead_traces } __mode(byte);
+enum key_ref_trace	{ key_ref_traces } __mode(byte);
+
+#endif /* end __RXRPC_DECLARE_TRACE_ENUMS_ONCE_ONLY */
+
+/*
+ * Export enum symbols via userspace.
+ */
+#undef EM
+#undef E_
+#define EM(a, b) TRACE_DEFINE_ENUM(a);
+#define E_(a, b) TRACE_DEFINE_ENUM(a);
+
+key_dead_traces;
+key_ref_traces;
+
+/*
+ * Now redefine the EM() and E_() macros to map the enums to the strings =
that
+ * will be printed in the output.
+ */
+#undef EM
+#undef E_
+#define EM(a, b)	{ a, b },
+#define E_(a, b)	{ a, b }
+
+TRACE_EVENT(key_alloc,
+	    TP_PROTO(const struct key *key),
+
+	    TP_ARGS(key),
+
+	    TP_STRUCT__entry(
+		    __field(key_serial_t,		key)
+		    __field(uid_t,			uid)
+		    __array(char,			type, 8)
+		    __array(char,			desc, 24)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->key =3D key->serial;
+		    __entry->uid =3D from_kuid(&init_user_ns, key->uid);
+		    strncpy(__entry->type, key->type->name, sizeof(__entry->type) - 1);
+		    strncpy(__entry->desc, key->description ?: "", sizeof(__entry->desc=
) - 1);
+		    __entry->type[sizeof(__entry->type) - 1] =3D 0;
+		    __entry->desc[sizeof(__entry->desc) - 1] =3D 0;
+			   ),
+
+	    TP_printk("key=3D%08x uid=3D%08x t=3D%s d=3D%s",
+		      __entry->key,
+		      __entry->uid,
+		      __entry->type,
+		      __entry->desc)
+	    );
+
+TRACE_EVENT(key_ref,
+	    TP_PROTO(key_serial_t key, unsigned int ref, enum key_ref_trace trac=
e,
+		     const void *where),
+
+	    TP_ARGS(key, ref, trace, where),
+
+	    TP_STRUCT__entry(
+		    __field(key_serial_t,		key)
+		    __field(enum key_ref_trace,		trace)
+		    __field(unsigned int,		ref)
+		    __field(const void *,		where)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->key =3D key;
+		    __entry->trace =3D trace;
+		    __entry->ref =3D ref;
+		    __entry->where =3D where;
+			   ),
+
+	    TP_printk("key=3D%08x %s r=3D%d pc=3D%pSR",
+		      __entry->key,
+		      __print_symbolic(__entry->trace, key_ref_traces),
+		      __entry->ref,
+		      __entry->where)
+	    );
+
+TRACE_EVENT(key_instantiate,
+	    TP_PROTO(const struct key *key, const struct key_preparsed_payload *=
prep),
+
+	    TP_ARGS(key, prep),
+
+	    TP_STRUCT__entry(
+		    __field(key_serial_t,	key)
+		    __field(unsigned int,	datalen)
+		    __field(unsigned int,	quotalen)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->key =3D key->serial;
+		    __entry->datalen =3D prep->datalen;
+		    __entry->quotalen =3D prep->quotalen;
+			   ),
+
+	    TP_printk("key=3D%08x dlen=3D%u qlen=3D%u",
+		      __entry->key,
+		      __entry->datalen,
+		      __entry->quotalen)
+	    );
+
+TRACE_EVENT(key_reject,
+	    TP_PROTO(const struct key *key, int error),
+
+	    TP_ARGS(key, error),
+
+	    TP_STRUCT__entry(
+		    __field(key_serial_t,	key)
+		    __field(int,		error)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->key =3D key->serial;
+		    __entry->error =3D error;
+			   ),
+
+	    TP_printk("key=3D%08x err=3D%d",
+		      __entry->key,
+		      __entry->error)
+	    );
+
+TRACE_EVENT(key_update,
+	    TP_PROTO(const struct key *key, const struct key_preparsed_payload *=
prep),
+
+	    TP_ARGS(key, prep),
+
+	    TP_STRUCT__entry(
+		    __field(key_serial_t,	key)
+		    __field(unsigned int,	datalen)
+		    __field(unsigned int,	quotalen)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->key =3D key->serial;
+		    __entry->datalen =3D prep->datalen;
+		    __entry->quotalen =3D prep->quotalen;
+			   ),
+
+	    TP_printk("key=3D%08x dlen=3D%u qlen=3D%u",
+		      __entry->key,
+		      __entry->datalen,
+		      __entry->quotalen)
+	    );
+
+TRACE_EVENT(key_dead,
+	    TP_PROTO(const struct key *key, enum key_dead_trace trace),
+
+	    TP_ARGS(key, trace),
+
+	    TP_STRUCT__entry(
+		    __field(key_serial_t,		key)
+		    __field(enum key_dead_trace,	trace)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->key =3D key->serial;
+		    __entry->trace =3D trace;
+			   ),
+
+	    TP_printk("key=3D%08x %s",
+		      __entry->key,
+		      __print_symbolic(__entry->trace, key_dead_traces))
+	    );
+
+TRACE_EVENT(key_quota,
+	    TP_PROTO(const struct key_user *user, int change_keys, int change_by=
tes),
+
+	    TP_ARGS(user, change_keys, change_bytes),
+
+	    TP_STRUCT__entry(
+		    __field(uid_t,		uid)
+		    __field(unsigned int,	nkeys)
+		    __field(unsigned int,	nikeys)
+		    __field(unsigned int,	qnkeys)
+		    __field(unsigned int,	qnbytes)
+		    __field(int,		change_keys)
+		    __field(int,		change_bytes)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->uid =3D from_kuid(&init_user_ns, user->uid);
+		    __entry->nkeys =3D atomic_read(&user->nkeys);
+		    __entry->nikeys =3D atomic_read(&user->nikeys);
+		    __entry->qnkeys =3D user->qnkeys;
+		    __entry->qnbytes =3D user->qnbytes;
+		    __entry->change_keys =3D change_keys;
+		    __entry->change_bytes =3D change_bytes;
+			   ),
+
+	    TP_printk("uid=3D%d nkeys=3D%u/%u qkeys=3D%u qpay=3D%u ckeys=3D%d cp=
ay=3D%d",
+		      __entry->uid,
+		      __entry->nikeys, __entry->nkeys,
+		      __entry->qnkeys,
+		      __entry->qnbytes,
+		      __entry->change_keys, __entry->change_bytes)
+	    );
+
+TRACE_EVENT(key_edquot,
+	    TP_PROTO(const struct key_user *user, unsigned int maxkeys,
+		     unsigned int maxbytes, unsigned int reqbytes),
+
+	    TP_ARGS(user, maxkeys, maxbytes, reqbytes),
+
+	    TP_STRUCT__entry(
+		    __field(uid_t,		uid)
+		    __field(unsigned int,	nkeys)
+		    __field(unsigned int,	nikeys)
+		    __field(unsigned int,	qnkeys)
+		    __field(unsigned int,	qnbytes)
+		    __field(unsigned int,	maxkeys)
+		    __field(unsigned int,	maxbytes)
+		    __field(unsigned int,	reqbytes)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->uid =3D from_kuid(&init_user_ns, user->uid);
+		    __entry->nkeys =3D atomic_read(&user->nkeys);
+		    __entry->nikeys =3D atomic_read(&user->nikeys);
+		    __entry->qnkeys =3D user->qnkeys;
+		    __entry->qnbytes =3D user->qnbytes;
+		    __entry->maxkeys =3D maxkeys;
+		    __entry->maxbytes =3D maxbytes;
+		    __entry->reqbytes =3D reqbytes;
+			   ),
+
+	    TP_printk("u=3D%d nkeys=3D%u/%u qkeys=3D%u/%u qpay=3D%u/%u cpay=3D%u=
",
+		      __entry->uid,
+		      __entry->nikeys, __entry->nkeys,
+		      __entry->qnkeys, __entry->maxkeys,
+		      __entry->qnbytes, __entry->maxbytes,
+		      __entry->reqbytes)
+	    );
+
+TRACE_EVENT(key_link,
+	    TP_PROTO(const struct key *keyring, const struct key *key),
+
+	    TP_ARGS(keyring, key),
+
+	    TP_STRUCT__entry(
+		    __field(key_serial_t,	keyring)
+		    __field(key_serial_t,	key)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->keyring =3D keyring->serial;
+		    __entry->key =3D key->serial;
+			   ),
+
+	    TP_printk("key=3D%08x to=3D%08x",
+		      __entry->key, __entry->keyring)
+	    );
+
+TRACE_EVENT(key_unlink,
+	    TP_PROTO(const struct key *keyring, const struct key *key),
+
+	    TP_ARGS(keyring, key),
+
+	    TP_STRUCT__entry(
+		    __field(key_serial_t,	keyring)
+		    __field(key_serial_t,	key)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->keyring =3D keyring->serial;
+		    __entry->key =3D key->serial;
+			   ),
+
+	    TP_printk("key=3D%08x from=3D%08x",
+		      __entry->key, __entry->keyring)
+	    );
+
+TRACE_EVENT(key_move,
+	    TP_PROTO(const struct key *from, const struct key *to,
+		     const struct key *key),
+
+	    TP_ARGS(from, to, key),
+
+	    TP_STRUCT__entry(
+		    __field(key_serial_t,	from)
+		    __field(key_serial_t,	to)
+		    __field(key_serial_t,	key)
+			     ),
+
+	    TP_fast_assign(
+		    __entry->from =3D from->serial;
+		    __entry->to =3D to->serial;
+		    __entry->key =3D key->serial;
+			   ),
+
+	    TP_printk("key=3D%08x from=3D%08x to=3D%08x",
+		      __entry->key, __entry->from, __entry->to)
+	    );
+
+TRACE_EVENT(key_clear,
+	    TP_PROTO(const struct key *keyring),
+	    TP_ARGS(keyring),
+	    TP_STRUCT__entry(
+		    __field(key_serial_t,	keyring)
+			     ),
+	    TP_fast_assign(
+		    __entry->keyring =3D keyring->serial;
+			   ),
+	    TP_printk("key=3D%08x",
+		      __entry->keyring)
+	    );
+
+TRACE_EVENT(key_revoke,
+	    TP_PROTO(const struct key *key),
+	    TP_ARGS(key),
+	    TP_STRUCT__entry(
+		    __field(key_serial_t,	key)
+			     ),
+	    TP_fast_assign(
+		    __entry->key =3D key->serial;
+			   ),
+	    TP_printk("key=3D%08x",
+		      __entry->key)
+	    );
+
+TRACE_EVENT(key_invalidate,
+	    TP_PROTO(const struct key *key),
+	    TP_ARGS(key),
+	    TP_STRUCT__entry(
+		    __field(key_serial_t,	key)
+			     ),
+	    TP_fast_assign(
+		    __entry->key =3D key->serial;
+			   ),
+	    TP_printk("key=3D%08x",
+		      __entry->key)
+	    );
+
+TRACE_EVENT(key_gc,
+	    TP_PROTO(const struct key *key),
+	    TP_ARGS(key),
+	    TP_STRUCT__entry(
+		    __field(key_serial_t,	key)
+			     ),
+	    TP_fast_assign(
+		    __entry->key =3D key->serial;
+			   ),
+	    TP_printk("key=3D%08x",
+		      __entry->key)
+	    );
+
+#undef EM
+#undef E_
+#endif /* _TRACE_KEY_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/security/keys/gc.c b/security/keys/gc.c
index 7d687b0962b1..47f857653854 100644
--- a/security/keys/gc.c
+++ b/security/keys/gc.c
@@ -141,6 +141,7 @@ static noinline void key_gc_unused_keys(struct list_he=
ad *keys)
 =

 		list_del(&key->graveyard_link);
 =

+		trace_key_gc(key);
 		kdebug("- %u", key->serial);
 		key_check(key);
 =

@@ -163,6 +164,8 @@ static noinline void key_gc_unused_keys(struct list_he=
ad *keys)
 		key_put_tag(key->domain_tag);
 		kfree(key->description);
 =

+		trace_key_ref(key->serial, refcount_read(&key->usage),
+			      key_trace_ref_free, 0);
 		memzero_explicit(key, sizeof(*key));
 		kmem_cache_free(key_jar, key);
 	}
@@ -331,6 +334,7 @@ static void key_garbage_collector(struct work_struct *=
work)
 	 */
 found_unreferenced_key:
 	kdebug("unrefd key %d", key->serial);
+	trace_key_ref(key->serial, refcount_read(&key->usage), key_trace_ref_gc,=
 0);
 	rb_erase(&key->serial_node, &key_serial_tree);
 	spin_unlock(&key_serial_lock);
 =

diff --git a/security/keys/internal.h b/security/keys/internal.h
index 2cffa6dc8255..87600683a7f5 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -19,6 +19,8 @@
 #include <linux/compat.h>
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
+#include <keys/key_user.h>
+#include <trace/events/key.h>
 =

 struct iovec;
 =

@@ -43,25 +45,6 @@ extern struct key_type key_type_user;
 extern struct key_type key_type_logon;
 =

 /************************************************************************=
*****/
-/*
- * Keep track of keys for a user.
- *
- * This needs to be separate to user_struct to avoid a refcount-loop
- * (user_struct pins some keyrings which pin this struct).
- *
- * We also keep track of keys under request from userspace for this UID h=
ere.
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
 =

 extern struct rb_root	key_user_tree;
 extern spinlock_t	key_user_lock;
@@ -211,26 +194,6 @@ extern struct key *request_key_auth_new(struct key *t=
arget,
 =

 extern struct key *key_get_instantiation_authkey(key_serial_t target_id);
 =

-/*
- * Determine whether a key is dead.
- */
-static inline bool key_is_dead(const struct key *key, time64_t limit)
-{
-	time64_t expiry =3D key->expiry;
-
-	if (expiry !=3D TIME64_MAX) {
-		if (!(key->type->flags & KEY_TYPE_INSTANT_REAP))
-			expiry +=3D key_gc_delay;
-		if (expiry <=3D limit)
-			return true;
-	}
-
-	return
-		key->flags & ((1 << KEY_FLAG_DEAD) |
-			      (1 << KEY_FLAG_INVALIDATED)) ||
-		key->domain_tag->removed;
-}
-
 /*
  * keyctl() functions
  */
diff --git a/security/keys/key.c b/security/keys/key.c
index 3d7d185019d3..28a4128ff103 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -14,6 +14,7 @@
 #include <linux/workqueue.h>
 #include <linux/random.h>
 #include <linux/err.h>
+#define CREATE_TRACE_POINTS
 #include "internal.h"
 =

 struct kmem_cache *key_jar;
@@ -264,12 +265,15 @@ struct key *key_alloc(struct key_type *type, const c=
har *desc,
 		if (!(flags & KEY_ALLOC_QUOTA_OVERRUN)) {
 			if (user->qnkeys + 1 > maxkeys ||
 			    user->qnbytes + quotalen > maxbytes ||
-			    user->qnbytes + quotalen < user->qnbytes)
+			    user->qnbytes + quotalen < user->qnbytes) {
+				trace_key_edquot(user, maxkeys, maxbytes, quotalen);
 				goto no_quota;
+			}
 		}
 =

 		user->qnkeys++;
 		user->qnbytes +=3D quotalen;
+		trace_key_quota(user, +1, quotalen);
 		spin_unlock_irqrestore(&user->lock, irqflags);
 	}
 =

@@ -319,7 +323,10 @@ struct key *key_alloc(struct key_type *type, const ch=
ar *desc,
 	/* publish the key by giving it a serial number */
 	refcount_inc(&key->domain_tag->usage);
 	atomic_inc(&user->nkeys);
+	trace_key_quota(user, 0, 0);
 	key_alloc_serial(key);
+	trace_key_alloc(key);
+	trace_key_ref(key->serial, 1, key_trace_ref_alloc, __builtin_return_addr=
ess(0));
 =

 error:
 	return key;
@@ -331,6 +338,7 @@ struct key *key_alloc(struct key_type *type, const cha=
r *desc,
 		spin_lock_irqsave(&user->lock, irqflags);
 		user->qnkeys--;
 		user->qnbytes -=3D quotalen;
+		trace_key_quota(user, -1, -quotalen);
 		spin_unlock_irqrestore(&user->lock, irqflags);
 	}
 	key_user_put(user);
@@ -344,6 +352,7 @@ struct key *key_alloc(struct key_type *type, const cha=
r *desc,
 		spin_lock_irqsave(&user->lock, irqflags);
 		user->qnkeys--;
 		user->qnbytes -=3D quotalen;
+		trace_key_quota(user, -1, quotalen);
 		spin_unlock_irqrestore(&user->lock, irqflags);
 	}
 	key_user_put(user);
@@ -388,11 +397,13 @@ int key_payload_reserve(struct key *key, size_t data=
len)
 		if (delta > 0 &&
 		    (key->user->qnbytes + delta > maxbytes ||
 		     key->user->qnbytes + delta < key->user->qnbytes)) {
+			trace_key_edquot(key->user, 0, maxbytes, datalen);
 			ret =3D -EDQUOT;
 		}
 		else {
 			key->user->qnbytes +=3D delta;
 			key->quotalen +=3D delta;
+			trace_key_quota(key->user, 0, delta);
 		}
 		spin_unlock_irqrestore(&key->user->lock, flags);
 	}
@@ -447,6 +458,7 @@ static int __key_instantiate_and_link(struct key *key,
 		if (ret =3D=3D 0) {
 			/* mark the key as being instantiated */
 			atomic_inc(&key->user->nikeys);
+			trace_key_instantiate(key, prep);
 			mark_key_instantiated(key, 0);
 			notify_key(key, NOTIFY_KEY_INSTANTIATED, 0);
 =

@@ -604,6 +616,7 @@ int key_reject_and_link(struct key *key,
 	if (key->state =3D=3D KEY_IS_UNINSTANTIATED) {
 		/* mark the key as being negatively instantiated */
 		atomic_inc(&key->user->nikeys);
+		trace_key_reject(key, -error);
 		mark_key_instantiated(key, -error);
 		notify_key(key, NOTIFY_KEY_INSTANTIATED, -error);
 		key_set_expiry(key, ktime_get_real_seconds() + timeout);
@@ -635,6 +648,39 @@ int key_reject_and_link(struct key *key,
 }
 EXPORT_SYMBOL(key_reject_and_link);
 =

+/**
+ * key_get - Get a reference on a key
+ * @key: The key to get a reference on.
+ *
+ * Get a reference on a key, if not NULL, and return the parameter.
+ */
+noinline struct key *key_get(struct key *key)
+{
+	if (key) {
+		int r;
+
+		__refcount_inc(&key->usage, &r);
+		trace_key_ref(key->serial, r + 1, key_trace_ref_get,
+			      __builtin_return_address(0));
+	}
+	return key;
+}
+EXPORT_SYMBOL(key_get);
+
+/*
+ * Get a ref on a key if its refcount is not non-zero.
+ */
+noinline struct key *key_try_get(struct key *key)
+{
+	int r;
+
+	if (!__refcount_inc_not_zero(&key->usage, &r))
+		return NULL;
+	trace_key_ref(key->serial, r + 1, key_trace_ref_try_get,
+		      __builtin_return_address(0));
+	return key;
+}
+
 /**
  * key_put - Discard a reference to a key.
  * @key: The key to discard a reference from.
@@ -643,12 +689,19 @@ EXPORT_SYMBOL(key_reject_and_link);
  * schedule the cleanup task to come and pull it out of the tree in proce=
ss
  * context at some later time.
  */
-void key_put(struct key *key)
+noinline void key_put(struct key *key)
 {
 	if (key) {
+		key_serial_t serial =3D key->serial;
+		bool zero;
+		int r;
+
 		key_check(key);
 =

-		if (refcount_dec_and_test(&key->usage)) {
+		zero =3D __refcount_dec_and_test(&key->usage, &r);
+		trace_key_ref(serial, r - 1, key_trace_ref_put,
+			      __builtin_return_address(0));
+		if (zero) {
 			unsigned long flags;
 =

 			/* deal with the user's key tracking and quota */
@@ -656,6 +709,7 @@ void key_put(struct key *key)
 				spin_lock_irqsave(&key->user->lock, flags);
 				key->user->qnkeys--;
 				key->user->qnbytes -=3D key->quotalen;
+				trace_key_quota(key->user, -1, -key->quotalen);
 				spin_unlock_irqrestore(&key->user->lock, flags);
 			}
 			schedule_work(&key_gc_work);
@@ -695,7 +749,7 @@ struct key *key_lookup(key_serial_t id)
 	/* A key is allowed to be looked up only if someone still owns a
 	 * reference to it - otherwise it's awaiting the gc.
 	 */
-	if (!refcount_inc_not_zero(&key->usage))
+	if (!key_try_get(key))
 		goto not_found;
 =

 error:
@@ -779,6 +833,7 @@ static inline key_ref_t __key_update(key_ref_t key_ref=
,
 	ret =3D key->type->update(key, prep);
 	if (ret =3D=3D 0) {
 		/* Updating a negative key positively instantiates it */
+		trace_key_update(key, prep);
 		mark_key_instantiated(key, 0);
 		notify_key(key, NOTIFY_KEY_UPDATED, 0);
 	}
@@ -1103,6 +1158,7 @@ int key_update(key_ref_t key_ref, const void *payloa=
d, size_t plen)
 	ret =3D key->type->update(key, &prep);
 	if (ret =3D=3D 0) {
 		/* Updating a negative key positively instantiates it */
+		trace_key_update(key, &prep);
 		mark_key_instantiated(key, 0);
 		notify_key(key, NOTIFY_KEY_UPDATED, 0);
 	}
@@ -1138,6 +1194,7 @@ void key_revoke(struct key *key)
 	 */
 	down_write_nested(&key->sem, 1);
 	if (!test_and_set_bit(KEY_FLAG_REVOKED, &key->flags)) {
+		trace_key_revoke(key);
 		notify_key(key, NOTIFY_KEY_REVOKED, 0);
 		if (key->type->revoke)
 			key->type->revoke(key);
@@ -1170,6 +1227,7 @@ void key_invalidate(struct key *key)
 	if (!test_bit(KEY_FLAG_INVALIDATED, &key->flags)) {
 		down_write_nested(&key->sem, 1);
 		if (!test_and_set_bit(KEY_FLAG_INVALIDATED, &key->flags)) {
+			trace_key_invalidate(key);
 			notify_key(key, NOTIFY_KEY_INVALIDATED, 0);
 			key_schedule_gc_links();
 		}
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index 4bc3e9398ee3..8fa4ced5c915 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -1020,11 +1020,13 @@ long keyctl_chown_key(key_serial_t id, uid_t user,=
 gid_t group)
 =

 			newowner->qnkeys++;
 			newowner->qnbytes +=3D key->quotalen;
+			trace_key_quota(newowner, +1, key->quotalen);
 			spin_unlock_irqrestore(&newowner->lock, flags);
 =

 			spin_lock_irqsave(&key->user->lock, flags);
 			key->user->qnkeys--;
 			key->user->qnbytes -=3D key->quotalen;
+			trace_key_quota(newowner, -1, -key->quotalen);
 			spin_unlock_irqrestore(&key->user->lock, flags);
 		}
 =

diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index 4448758f643a..d67a60142318 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -920,7 +920,7 @@ key_ref_t keyring_search_rcu(key_ref_t keyring_ref,
 =

 	ctx->now =3D ktime_get_real_seconds();
 	if (search_nested_keyrings(keyring, ctx))
-		__key_get(key_ref_to_ptr(ctx->result));
+		key_ref_get(ctx->result);
 	return ctx->result;
 }
 =

@@ -1122,7 +1122,7 @@ key_ref_t find_key_to_update(key_ref_t keyring_ref,
 		kleave(" =3D NULL [x]");
 		return NULL;
 	}
-	__key_get(key);
+	key_get(key);
 	kleave(" =3D {%d}", key->serial);
 	return make_key_ref(key, is_key_possessed(keyring_ref));
 }
@@ -1174,7 +1174,7 @@ struct key *find_keyring_by_name(const char *name, b=
ool uid_keyring)
 		/* we've got a match but we might end up racing with
 		 * key_cleanup() if the keyring is currently 'dead'
 		 * (ie. it has a zero usage count) */
-		if (!refcount_inc_not_zero(&keyring->usage))
+		if (!key_try_get(keyring))
 			continue;
 		keyring->last_used_at =3D ktime_get_real_seconds();
 		goto out;
@@ -1367,7 +1367,8 @@ int __key_link_check_live_key(struct key *keyring, s=
truct key *key)
 void __key_link(struct key *keyring, struct key *key,
 		struct assoc_array_edit **_edit)
 {
-	__key_get(key);
+	key_get(key);
+	trace_key_link(keyring, key);
 	assoc_array_insert_set_object(*_edit, keyring_key_to_ptr(key));
 	assoc_array_apply_edit(*_edit);
 	*_edit =3D NULL;
@@ -1506,6 +1507,7 @@ static int __key_unlink_begin(struct key *keyring, s=
truct key *key,
 static void __key_unlink(struct key *keyring, struct key *key,
 			 struct assoc_array_edit **_edit)
 {
+	trace_key_unlink(keyring, key);
 	assoc_array_apply_edit(*_edit);
 	notify_key(keyring, NOTIFY_KEY_UNLINKED, key_serial(key));
 	*_edit =3D NULL;
@@ -1625,6 +1627,7 @@ int key_move(struct key *key,
 	if (ret < 0)
 		goto error;
 =

+	trace_key_move(from_keyring, to_keyring, key);
 	__key_unlink(from_keyring, key, &from_edit);
 	__key_link(to_keyring, key, &to_edit);
 error:
@@ -1654,6 +1657,7 @@ int keyring_clear(struct key *keyring)
 =

 	down_write(&keyring->sem);
 =

+	trace_key_clear(keyring);
 	edit =3D assoc_array_clear(&keyring->keys, &keyring_assoc_array_ops);
 	if (IS_ERR(edit)) {
 		ret =3D PTR_ERR(edit);
@@ -1687,6 +1691,39 @@ static void keyring_revoke(struct key *keyring)
 	}
 }
 =

+/*
+ * Determine whether a key is dead.
+ */
+static bool key_is_dead(const struct key *key, time64_t limit)
+{
+	time64_t expiry =3D key->expiry;
+
+	if (expiry !=3D TIME64_MAX) {
+		if (!(key->type->flags & KEY_TYPE_INSTANT_REAP))
+			expiry +=3D key_gc_delay;
+		if (expiry <=3D limit) {
+			trace_key_dead(key, key_trace_dead_expired);
+			return true;
+		}
+	}
+
+	if (test_bit(KEY_FLAG_DEAD, &key->flags)) {
+		trace_key_dead(key, key_trace_dead_type_removed);
+		return true;
+	}
+
+	if (test_bit(KEY_FLAG_INVALIDATED, &key->flags)) {
+		trace_key_dead(key, key_trace_dead_invalidated);
+		return true;
+	}
+
+	if (key->domain_tag->removed) {
+		trace_key_dead(key, key_trace_dead_domain_removed);
+		return true;
+	}
+	return false;
+}
+
 static bool keyring_gc_select_iterator(void *object, void *iterator_data)
 {
 	struct key *key =3D keyring_ptr_to_key(object);
diff --git a/security/keys/process_keys.c b/security/keys/process_keys.c
index b5d5333ab330..01291b2d0888 100644
--- a/security/keys/process_keys.c
+++ b/security/keys/process_keys.c
@@ -333,7 +333,7 @@ int install_session_keyring_to_cred(struct cred *cred,=
 struct key *keyring)
 		if (IS_ERR(keyring))
 			return PTR_ERR(keyring);
 	} else {
-		__key_get(keyring);
+		key_get(keyring);
 	}
 =

 	/* install the keyring */
@@ -641,7 +641,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned lo=
ng lflags,
 		}
 =

 		key =3D ctx.cred->thread_keyring;
-		__key_get(key);
+		key_get(key);
 		key_ref =3D make_key_ref(key, 1);
 		break;
 =

@@ -658,8 +658,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned lo=
ng lflags,
 			goto reget_creds;
 		}
 =

-		key =3D ctx.cred->process_keyring;
-		__key_get(key);
+		key =3D key_get(ctx.cred->process_keyring);
 		key_ref =3D make_key_ref(key, 1);
 		break;
 =

@@ -688,8 +687,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned lo=
ng lflags,
 			goto reget_creds;
 		}
 =

-		key =3D ctx.cred->session_keyring;
-		__key_get(key);
+		key =3D key_get(ctx.cred->session_keyring);
 		key_ref =3D make_key_ref(key, 1);
 		break;
 =

@@ -717,7 +715,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned lo=
ng lflags,
 		if (!key)
 			goto error;
 =

-		__key_get(key);
+		key_get(key);
 		key_ref =3D make_key_ref(key, 1);
 		break;
 =

@@ -732,8 +730,7 @@ key_ref_t lookup_user_key(key_serial_t id, unsigned lo=
ng lflags,
 			key =3D NULL;
 		} else {
 			rka =3D ctx.cred->request_key_auth->payload.data[0];
-			key =3D rka->dest_keyring;
-			__key_get(key);
+			key =3D key_get(rka->dest_keyring);
 		}
 		up_read(&ctx.cred->request_key_auth->sem);
 		if (!key)


