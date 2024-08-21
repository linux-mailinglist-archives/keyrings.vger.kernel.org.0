Return-Path: <keyrings+bounces-1920-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CE1959C01
	for <lists+keyrings@lfdr.de>; Wed, 21 Aug 2024 14:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5924CB23E43
	for <lists+keyrings@lfdr.de>; Wed, 21 Aug 2024 12:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE70E199FDF;
	Wed, 21 Aug 2024 12:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LRLj5qgH"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934E6199FD7
	for <keyrings@vger.kernel.org>; Wed, 21 Aug 2024 12:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724243812; cv=none; b=XBEIDZa2Mv8ZeQTTbtKEAC4pvj5tpjkTXsEa+LwuvlGF8Eca4UzTUNMt+Z0I3t1mrhTHcEZgwt8XHuKlmlfOTDFDRXqd6HGigednf79k/3Ii/qdHCFdeLxdYQwDQLiS0gZLnk6jPQB8lv/buWtSgz10z8N/pVJ3N/0s0ZfVnHHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724243812; c=relaxed/simple;
	bh=X5nsFJTEE8s4DdMQ/RXYKMuPcMF2/FYLF2Uhe2bQ7W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYq8boCob/pfWnQFedwFg8sjs/T2lqPIHQcxuXO4kzJ/E46Ag/4NspeTYtXMgoL2iVoYmGUsurzyjmF5utQ/YHsf3sV4QnEr98Kgu4q6N/FtEZ+8SZe+qNMp4GNTMZSfnBUaJrTMBDILB1299dpRnxNCpkBSDUgsXpTRep4yiJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LRLj5qgH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724243809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=80E3kMIdbPaX7pELb4jvn2qp6xAsau9eGcp/ZZnpqD0=;
	b=LRLj5qgHy9NQ4jsyiE+ypXLgSpKcG+JnqcaX2HdOf4AYxd/igLBQIyNlT+OcHqHNaDgKWs
	3nP4ImxkvQU+ylpS1aQtp+LKHiU19nhGl9tsFWDFe3IyDGa9KgWFAjEjlRCg/ZbNSZJyCn
	bjl4ZJ4qyIip2lXapYe8QLffNg/nmak=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-177-lER6gba3Poe28hKS5aL1_A-1; Wed,
 21 Aug 2024 08:36:46 -0400
X-MC-Unique: lER6gba3Poe28hKS5aL1_A-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3AA1F1955D56;
	Wed, 21 Aug 2024 12:36:45 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.30])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 487801955E8C;
	Wed, 21 Aug 2024 12:36:43 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] keys: Add tracepoints for the keyrings facility
Date: Wed, 21 Aug 2024 13:36:15 +0100
Message-ID: <20240821123616.60401-8-dhowells@redhat.com>
In-Reply-To: <20240821123616.60401-1-dhowells@redhat.com>
References: <20240821123616.60401-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Add some tracepoints to aid in debuggin the keyrings facility and
applications that use it.  A number of events and operations are traceable,
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
 include/trace/events/key.h | 401 +++++++++++++++++++++++++++++++++++++
 security/keys/gc.c         |   4 +
 security/keys/internal.h   |   1 +
 security/keys/key.c        |  50 ++++-
 security/keys/keyctl.c     |   2 +
 security/keys/keyring.c    |  27 ++-
 6 files changed, 472 insertions(+), 13 deletions(-)
 create mode 100644 include/trace/events/key.h

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
+ * Declare tracing information enums and their string mappings for display.
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
+ * Now redefine the EM() and E_() macros to map the enums to the strings that
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
+		    __entry->key = key->serial;
+		    __entry->uid = from_kuid(&init_user_ns, key->uid);
+		    strncpy(__entry->type, key->type->name, sizeof(__entry->type) - 1);
+		    strncpy(__entry->desc, key->description ?: "", sizeof(__entry->desc) - 1);
+		    __entry->type[sizeof(__entry->type) - 1] = 0;
+		    __entry->desc[sizeof(__entry->desc) - 1] = 0;
+			   ),
+
+	    TP_printk("key=%08x uid=%08x t=%s d=%s",
+		      __entry->key,
+		      __entry->uid,
+		      __entry->type,
+		      __entry->desc)
+	    );
+
+TRACE_EVENT(key_ref,
+	    TP_PROTO(key_serial_t key, unsigned int ref, enum key_ref_trace trace,
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
+		    __entry->key = key;
+		    __entry->trace = trace;
+		    __entry->ref = ref;
+		    __entry->where = where;
+			   ),
+
+	    TP_printk("key=%08x %s r=%d pc=%pSR",
+		      __entry->key,
+		      __print_symbolic(__entry->trace, key_ref_traces),
+		      __entry->ref,
+		      __entry->where)
+	    );
+
+TRACE_EVENT(key_instantiate,
+	    TP_PROTO(const struct key *key, const struct key_preparsed_payload *prep),
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
+		    __entry->key = key->serial;
+		    __entry->datalen = prep->datalen;
+		    __entry->quotalen = prep->quotalen;
+			   ),
+
+	    TP_printk("key=%08x dlen=%u qlen=%u",
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
+		    __entry->key = key->serial;
+		    __entry->error = error;
+			   ),
+
+	    TP_printk("key=%08x err=%d",
+		      __entry->key,
+		      __entry->error)
+	    );
+
+TRACE_EVENT(key_update,
+	    TP_PROTO(const struct key *key, const struct key_preparsed_payload *prep),
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
+		    __entry->key = key->serial;
+		    __entry->datalen = prep->datalen;
+		    __entry->quotalen = prep->quotalen;
+			   ),
+
+	    TP_printk("key=%08x dlen=%u qlen=%u",
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
+		    __entry->key = key->serial;
+		    __entry->trace = trace;
+			   ),
+
+	    TP_printk("key=%08x %s",
+		      __entry->key,
+		      __print_symbolic(__entry->trace, key_dead_traces))
+	    );
+
+TRACE_EVENT(key_quota,
+	    TP_PROTO(const struct key_user *user, int change_keys, int change_bytes),
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
+		    __entry->uid = from_kuid(&init_user_ns, user->uid);
+		    __entry->nkeys = atomic_read(&user->nkeys);
+		    __entry->nikeys = atomic_read(&user->nikeys);
+		    __entry->qnkeys = user->qnkeys;
+		    __entry->qnbytes = user->qnbytes;
+		    __entry->change_keys = change_keys;
+		    __entry->change_bytes = change_bytes;
+			   ),
+
+	    TP_printk("uid=%d nkeys=%u/%u qkeys=%u qpay=%u ckeys=%d cpay=%d",
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
+		    __entry->uid = from_kuid(&init_user_ns, user->uid);
+		    __entry->nkeys = atomic_read(&user->nkeys);
+		    __entry->nikeys = atomic_read(&user->nikeys);
+		    __entry->qnkeys = user->qnkeys;
+		    __entry->qnbytes = user->qnbytes;
+		    __entry->maxkeys = maxkeys;
+		    __entry->maxbytes = maxbytes;
+		    __entry->reqbytes = reqbytes;
+			   ),
+
+	    TP_printk("u=%d nkeys=%u/%u qkeys=%u/%u qpay=%u/%u cpay=%u",
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
+		    __entry->keyring = keyring->serial;
+		    __entry->key = key->serial;
+			   ),
+
+	    TP_printk("key=%08x to=%08x",
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
+		    __entry->keyring = keyring->serial;
+		    __entry->key = key->serial;
+			   ),
+
+	    TP_printk("key=%08x from=%08x",
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
+		    __entry->from = from->serial;
+		    __entry->to = to->serial;
+		    __entry->key = key->serial;
+			   ),
+
+	    TP_printk("key=%08x from=%08x to=%08x",
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
+		    __entry->keyring = keyring->serial;
+			   ),
+	    TP_printk("key=%08x",
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
+		    __entry->key = key->serial;
+			   ),
+	    TP_printk("key=%08x",
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
+		    __entry->key = key->serial;
+			   ),
+	    TP_printk("key=%08x",
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
+		    __entry->key = key->serial;
+			   ),
+	    TP_printk("key=%08x",
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
@@ -141,6 +141,7 @@ static noinline void key_gc_unused_keys(struct list_head *keys)
 
 		list_del(&key->graveyard_link);
 
+		trace_key_gc(key);
 		kdebug("- %u", key->serial);
 		key_check(key);
 
@@ -163,6 +164,8 @@ static noinline void key_gc_unused_keys(struct list_head *keys)
 		key_put_tag(key->domain_tag);
 		kfree(key->description);
 
+		trace_key_ref(key->serial, refcount_read(&key->usage),
+			      key_trace_ref_free, 0);
 		memzero_explicit(key, sizeof(*key));
 		kmem_cache_free(key_jar, key);
 	}
@@ -331,6 +334,7 @@ static void key_garbage_collector(struct work_struct *work)
 	 */
 found_unreferenced_key:
 	kdebug("unrefd key %d", key->serial);
+	trace_key_ref(key->serial, refcount_read(&key->usage), key_trace_ref_gc, 0);
 	rb_erase(&key->serial_node, &key_serial_tree);
 	spin_unlock(&key_serial_lock);
 
diff --git a/security/keys/internal.h b/security/keys/internal.h
index 33c929a6bb97..87600683a7f5 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -20,6 +20,7 @@
 #include <linux/mm.h>
 #include <linux/vmalloc.h>
 #include <keys/key_user.h>
+#include <trace/events/key.h>
 
 struct iovec;
 
diff --git a/security/keys/key.c b/security/keys/key.c
index 59cffb6f9b94..abb8d60a0dc2 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -14,6 +14,7 @@
 #include <linux/workqueue.h>
 #include <linux/random.h>
 #include <linux/err.h>
+#define CREATE_TRACE_POINTS
 #include "internal.h"
 
 struct kmem_cache *key_jar;
@@ -264,12 +265,15 @@ struct key *key_alloc(struct key_type *type, const char *desc,
 		if (!(flags & KEY_ALLOC_QUOTA_OVERRUN)) {
 			if (user->qnkeys + 1 > maxkeys ||
 			    user->qnbytes + quotalen > maxbytes ||
-			    user->qnbytes + quotalen < user->qnbytes)
+			    user->qnbytes + quotalen < user->qnbytes) {
+				trace_key_edquot(user, maxkeys, maxbytes, quotalen);
 				goto no_quota;
+			}
 		}
 
 		user->qnkeys++;
 		user->qnbytes += quotalen;
+		trace_key_quota(user, +1, quotalen);
 		spin_unlock_irqrestore(&user->lock, irqflags);
 	}
 
@@ -319,7 +323,10 @@ struct key *key_alloc(struct key_type *type, const char *desc,
 	/* publish the key by giving it a serial number */
 	refcount_inc(&key->domain_tag->usage);
 	atomic_inc(&user->nkeys);
+	trace_key_quota(user, 0, 0);
 	key_alloc_serial(key);
+	trace_key_alloc(key);
+	trace_key_ref(key->serial, 1, key_trace_ref_alloc, __builtin_return_address(0));
 
 error:
 	return key;
@@ -331,6 +338,7 @@ struct key *key_alloc(struct key_type *type, const char *desc,
 		spin_lock_irqsave(&user->lock, irqflags);
 		user->qnkeys--;
 		user->qnbytes -= quotalen;
+		trace_key_quota(user, -1, -quotalen);
 		spin_unlock_irqrestore(&user->lock, irqflags);
 	}
 	key_user_put(user);
@@ -344,6 +352,7 @@ struct key *key_alloc(struct key_type *type, const char *desc,
 		spin_lock_irqsave(&user->lock, irqflags);
 		user->qnkeys--;
 		user->qnbytes -= quotalen;
+		trace_key_quota(user, -1, quotalen);
 		spin_unlock_irqrestore(&user->lock, irqflags);
 	}
 	key_user_put(user);
@@ -388,11 +397,13 @@ int key_payload_reserve(struct key *key, size_t datalen)
 		if (delta > 0 &&
 		    (key->user->qnbytes + delta > maxbytes ||
 		     key->user->qnbytes + delta < key->user->qnbytes)) {
+			trace_key_edquot(key->user, 0, maxbytes, datalen);
 			ret = -EDQUOT;
 		}
 		else {
 			key->user->qnbytes += delta;
 			key->quotalen += delta;
+			trace_key_quota(key->user, 0, delta);
 		}
 		spin_unlock_irqrestore(&key->user->lock, flags);
 	}
@@ -447,6 +458,7 @@ static int __key_instantiate_and_link(struct key *key,
 		if (ret == 0) {
 			/* mark the key as being instantiated */
 			atomic_inc(&key->user->nikeys);
+			trace_key_instantiate(key, prep);
 			mark_key_instantiated(key, 0);
 			notify_key(key, NOTIFY_KEY_INSTANTIATED, 0);
 
@@ -604,6 +616,7 @@ int key_reject_and_link(struct key *key,
 	if (key->state == KEY_IS_UNINSTANTIATED) {
 		/* mark the key as being negatively instantiated */
 		atomic_inc(&key->user->nikeys);
+		trace_key_reject(key, -error);
 		mark_key_instantiated(key, -error);
 		notify_key(key, NOTIFY_KEY_INSTANTIATED, -error);
 		key_set_expiry(key, ktime_get_real_seconds() + timeout);
@@ -641,10 +654,15 @@ EXPORT_SYMBOL(key_reject_and_link);
  *
  * Get a reference on a key, if not NULL, and return the parameter.
  */
-struct key *key_get(struct key *key)
+noinline struct key *key_get(struct key *key)
 {
-	if (key)
-		refcount_inc(&key->usage);
+	if (key) {
+		int r;
+
+		__refcount_inc(&key->usage, &r);
+		trace_key_ref(key->serial, r + 1, key_trace_ref_get,
+			      __builtin_return_address(0));
+	}
 	return key;
 }
 EXPORT_SYMBOL(key_get);
@@ -656,10 +674,14 @@ EXPORT_SYMBOL(key_get);
  * Get a reference on a key unless it has no references and return true if
  * successful.  @key must not be NULL.
  */
-struct key *key_try_get(struct key *key)
+noinline struct key *key_try_get(struct key *key)
 {
-	if (!refcount_inc_not_zero(&key->usage))
+	int r;
+
+	if (!__refcount_inc_not_zero(&key->usage, &r))
 		return NULL;
+	trace_key_ref(key->serial, r + 1, key_trace_ref_try_get,
+		      __builtin_return_address(0));
 	return key;
 }
 
@@ -671,12 +693,19 @@ struct key *key_try_get(struct key *key)
  * schedule the cleanup task to come and pull it out of the tree in process
  * context at some later time.
  */
-void key_put(struct key *key)
+noinline void key_put(struct key *key)
 {
 	if (key) {
+		key_serial_t serial = key->serial;
+		bool zero;
+		int r;
+
 		key_check(key);
 
-		if (refcount_dec_and_test(&key->usage)) {
+		zero = __refcount_dec_and_test(&key->usage, &r);
+		trace_key_ref(serial, r - 1, key_trace_ref_put,
+			      __builtin_return_address(0));
+		if (zero) {
 			unsigned long flags;
 
 			/* deal with the user's key tracking and quota */
@@ -684,6 +713,7 @@ void key_put(struct key *key)
 				spin_lock_irqsave(&key->user->lock, flags);
 				key->user->qnkeys--;
 				key->user->qnbytes -= key->quotalen;
+				trace_key_quota(key->user, -1, -key->quotalen);
 				spin_unlock_irqrestore(&key->user->lock, flags);
 			}
 			schedule_work(&key_gc_work);
@@ -807,6 +837,7 @@ static inline key_ref_t __key_update(key_ref_t key_ref,
 	ret = key->type->update(key, prep);
 	if (ret == 0) {
 		/* Updating a negative key positively instantiates it */
+		trace_key_update(key, prep);
 		mark_key_instantiated(key, 0);
 		notify_key(key, NOTIFY_KEY_UPDATED, 0);
 	}
@@ -1131,6 +1162,7 @@ int key_update(key_ref_t key_ref, const void *payload, size_t plen)
 	ret = key->type->update(key, &prep);
 	if (ret == 0) {
 		/* Updating a negative key positively instantiates it */
+		trace_key_update(key, &prep);
 		mark_key_instantiated(key, 0);
 		notify_key(key, NOTIFY_KEY_UPDATED, 0);
 	}
@@ -1166,6 +1198,7 @@ void key_revoke(struct key *key)
 	 */
 	down_write_nested(&key->sem, 1);
 	if (!test_and_set_bit(KEY_FLAG_REVOKED, &key->flags)) {
+		trace_key_revoke(key);
 		notify_key(key, NOTIFY_KEY_REVOKED, 0);
 		if (key->type->revoke)
 			key->type->revoke(key);
@@ -1198,6 +1231,7 @@ void key_invalidate(struct key *key)
 	if (!test_bit(KEY_FLAG_INVALIDATED, &key->flags)) {
 		down_write_nested(&key->sem, 1);
 		if (!test_and_set_bit(KEY_FLAG_INVALIDATED, &key->flags)) {
+			trace_key_invalidate(key);
 			notify_key(key, NOTIFY_KEY_INVALIDATED, 0);
 			key_schedule_gc_links();
 		}
diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index ab927a142f51..f2ef898209e6 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -1020,11 +1020,13 @@ long keyctl_chown_key(key_serial_t id, uid_t user, gid_t group)
 
 			newowner->qnkeys++;
 			newowner->qnbytes += key->quotalen;
+			trace_key_quota(newowner, +1, key->quotalen);
 			spin_unlock_irqrestore(&newowner->lock, flags);
 
 			spin_lock_irqsave(&key->user->lock, flags);
 			key->user->qnkeys--;
 			key->user->qnbytes -= key->quotalen;
+			trace_key_quota(newowner, -1, -key->quotalen);
 			spin_unlock_irqrestore(&key->user->lock, flags);
 		}
 
diff --git a/security/keys/keyring.c b/security/keys/keyring.c
index a09a4c2b1bcb..d67a60142318 100644
--- a/security/keys/keyring.c
+++ b/security/keys/keyring.c
@@ -1368,6 +1368,7 @@ void __key_link(struct key *keyring, struct key *key,
 		struct assoc_array_edit **_edit)
 {
 	key_get(key);
+	trace_key_link(keyring, key);
 	assoc_array_insert_set_object(*_edit, keyring_key_to_ptr(key));
 	assoc_array_apply_edit(*_edit);
 	*_edit = NULL;
@@ -1506,6 +1507,7 @@ static int __key_unlink_begin(struct key *keyring, struct key *key,
 static void __key_unlink(struct key *keyring, struct key *key,
 			 struct assoc_array_edit **_edit)
 {
+	trace_key_unlink(keyring, key);
 	assoc_array_apply_edit(*_edit);
 	notify_key(keyring, NOTIFY_KEY_UNLINKED, key_serial(key));
 	*_edit = NULL;
@@ -1625,6 +1627,7 @@ int key_move(struct key *key,
 	if (ret < 0)
 		goto error;
 
+	trace_key_move(from_keyring, to_keyring, key);
 	__key_unlink(from_keyring, key, &from_edit);
 	__key_link(to_keyring, key, &to_edit);
 error:
@@ -1654,6 +1657,7 @@ int keyring_clear(struct key *keyring)
 
 	down_write(&keyring->sem);
 
+	trace_key_clear(keyring);
 	edit = assoc_array_clear(&keyring->keys, &keyring_assoc_array_ops);
 	if (IS_ERR(edit)) {
 		ret = PTR_ERR(edit);
@@ -1697,14 +1701,27 @@ static bool key_is_dead(const struct key *key, time64_t limit)
 	if (expiry != TIME64_MAX) {
 		if (!(key->type->flags & KEY_TYPE_INSTANT_REAP))
 			expiry += key_gc_delay;
-		if (expiry <= limit)
+		if (expiry <= limit) {
+			trace_key_dead(key, key_trace_dead_expired);
 			return true;
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
 	}
 
-	return
-		key->flags & ((1 << KEY_FLAG_DEAD) |
-			      (1 << KEY_FLAG_INVALIDATED)) ||
-		key->domain_tag->removed;
+	if (key->domain_tag->removed) {
+		trace_key_dead(key, key_trace_dead_domain_removed);
+		return true;
+	}
+	return false;
 }
 
 static bool keyring_gc_select_iterator(void *object, void *iterator_data)


