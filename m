Return-Path: <keyrings+bounces-1928-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D8D9616FA
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2024 20:27:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A82211F20F9E
	for <lists+keyrings@lfdr.de>; Tue, 27 Aug 2024 18:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613341D1F4C;
	Tue, 27 Aug 2024 18:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p4awsXs7"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C001CF291;
	Tue, 27 Aug 2024 18:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724783272; cv=none; b=d8ojYNvFLnxvN2VTvS0iyLD8EW9XPVluUN5C2VeQH5xza/w31fl/yvCXZjMGHVmM5+s6Ehr2k8aGB9v8ri3U/CPz1fghcqHmh0CGnTAnRQQIPBovid8/C/dKvwDNl0/aFAM0xOGNrLkRZlyNruRUBeIXXoTyKb0k+HEgo44Ku1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724783272; c=relaxed/simple;
	bh=JIyXvWl3pcurJs2y+9obuaVyg/aXjXG/jNwGZvplGcs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=oG38GdBwYeBqxwwH7GCf+yIMv1y1gcZGvjfUcwUKPffqthfKTwvUi9Sy098n60tqVZ0di7W5yjingf0Vy2DYcg0LrQRvcYLB19P4aie6d5dtT/ZhgnnZR1od8iJpxgpr/wWopJCEchwUmdTvyJLgrl+SLCUO4LlLEikLZ9NUmMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p4awsXs7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153FCC32786;
	Tue, 27 Aug 2024 18:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724783271;
	bh=JIyXvWl3pcurJs2y+9obuaVyg/aXjXG/jNwGZvplGcs=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=p4awsXs7FMpiC6h3D2uefkG4Lqu3uC5pGZGBTNuqQvZ+8P9YAxrlqdpIjg/wpWE9T
	 ilybrDN9ljWnHq9qsTisdIHHwe2zRbH4DOuIgzNLmvpq3hWoJAKv73c9E7PzqkG5i8
	 +O8K67FmSSVJQ8VyRHKeoNKHux50KH8SpJbjYzHRUYzXNZ0NccjWLgR4xvlP/F96ot
	 OS16joSwtmYyCCBvLTYnFceAJTa7EemXuJkjnTvmJ3oa1NgGJTCD2iXkcXEhgMJrRo
	 /t7Obp+uQrEvgm2DRNx6JLwydSplae/1AXlbZgjjt2ORbXtPqVdNfVbQMJvL6M4eRN
	 Qr2PtI+w9tPSg==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Aug 2024 21:27:47 +0300
Message-Id: <D3QWN2NSC5KU.357N7GN0UU6ZW@kernel.org>
Cc: <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/7] keys: Add tracepoints for the keyrings facility
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Howells" <dhowells@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240821123616.60401-1-dhowells@redhat.com>
 <20240821123616.60401-8-dhowells@redhat.com>
In-Reply-To: <20240821123616.60401-8-dhowells@redhat.com>

On Wed Aug 21, 2024 at 3:36 PM EEST, David Howells wrote:
> Add some tracepoints to aid in debuggin the keyrings facility and
> applications that use it.  A number of events and operations are traceabl=
e,
> including:
>
>   - Allocation
>   - Refcounting
>   - Instantiation and negative instantiation/rejection
>   - Update
>   - Detection of key being dead
>   - Key quota changes
>   - Key quota failure
>   - Link, unlink and move
>   - Keyring clearance
>   - Revocation and invalidation
>   - Garbage collection
>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Jarkko Sakkinen <jarkko@kernel.org>
> cc: keyrings@vger.kernel.org
> cc: linux-security-module@vger.kernel.org

I have immediate use for this when I take the time and refine [1] so
I guess that goes for existential reason :-)

> ---
>  include/trace/events/key.h | 401 +++++++++++++++++++++++++++++++++++++
>  security/keys/gc.c         |   4 +
>  security/keys/internal.h   |   1 +
>  security/keys/key.c        |  50 ++++-
>  security/keys/keyctl.c     |   2 +
>  security/keys/keyring.c    |  27 ++-
>  6 files changed, 472 insertions(+), 13 deletions(-)
>  create mode 100644 include/trace/events/key.h
>
> diff --git a/include/trace/events/key.h b/include/trace/events/key.h
> new file mode 100644
> index 000000000000..b3f8c39cc0e8
> --- /dev/null
> +++ b/include/trace/events/key.h
> @@ -0,0 +1,401 @@
> +/* Keyrings tracepoints
> + *
> + * Copyright (C) 2024 Red Hat, Inc. All Rights Reserved.
> + * Written by David Howells (dhowells@redhat.com)
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public Licence
> + * as published by the Free Software Foundation; either version
> + * 2 of the Licence, or (at your option) any later version.
> + */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM key
> +
> +#if !defined(_TRACE_KEY_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_KEY_H
> +
> +#include <linux/tracepoint.h>
> +
> +struct key;
> +
> +/*
> + * Declare tracing information enums and their string mappings for displ=
ay.
> + */
> +#define key_ref_traces \
> +	EM(key_trace_ref_alloc,			"ALLOC") \
> +	EM(key_trace_ref_free,			"FREE ") \
> +	EM(key_trace_ref_gc,			"GC   ") \
> +	EM(key_trace_ref_get,			"GET  ") \
> +	EM(key_trace_ref_put,			"PUT  ") \
> +	E_(key_trace_ref_try_get,		"GET  ")
> +
> +#define key_dead_traces \
> +	EM(key_trace_dead_type_removed,		"TYPR") \
> +	EM(key_trace_dead_domain_removed,	"DOMR") \
> +	EM(key_trace_dead_expired,		"EXPD") \
> +	E_(key_trace_dead_invalidated,		"INVL")
> +
> +/*
> + * Generate enums for tracing information.
> + */
> +#ifndef __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
> +#define __NETFS_DECLARE_TRACE_ENUMS_ONCE_ONLY
> +
> +#undef EM
> +#undef E_
> +#define EM(a, b) a,
> +#define E_(a, b) a
> +
> +enum key_dead_trace	{ key_dead_traces } __mode(byte);
> +enum key_ref_trace	{ key_ref_traces } __mode(byte);
> +
> +#endif /* end __RXRPC_DECLARE_TRACE_ENUMS_ONCE_ONLY */
> +
> +/*
> + * Export enum symbols via userspace.
> + */
> +#undef EM
> +#undef E_
> +#define EM(a, b) TRACE_DEFINE_ENUM(a);
> +#define E_(a, b) TRACE_DEFINE_ENUM(a);
> +
> +key_dead_traces;
> +key_ref_traces;
> +
> +/*
> + * Now redefine the EM() and E_() macros to map the enums to the strings=
 that
> + * will be printed in the output.
> + */
> +#undef EM
> +#undef E_
> +#define EM(a, b)	{ a, b },
> +#define E_(a, b)	{ a, b }
> +
> +TRACE_EVENT(key_alloc,
> +	    TP_PROTO(const struct key *key),
> +
> +	    TP_ARGS(key),
> +
> +	    TP_STRUCT__entry(
> +		    __field(key_serial_t,		key)
> +		    __field(uid_t,			uid)
> +		    __array(char,			type, 8)
> +		    __array(char,			desc, 24)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->key =3D key->serial;
> +		    __entry->uid =3D from_kuid(&init_user_ns, key->uid);
> +		    strncpy(__entry->type, key->type->name, sizeof(__entry->type) - 1)=
;
> +		    strncpy(__entry->desc, key->description ?: "", sizeof(__entry->des=
c) - 1);
> +		    __entry->type[sizeof(__entry->type) - 1] =3D 0;
> +		    __entry->desc[sizeof(__entry->desc) - 1] =3D 0;
> +			   ),
> +
> +	    TP_printk("key=3D%08x uid=3D%08x t=3D%s d=3D%s",
> +		      __entry->key,
> +		      __entry->uid,
> +		      __entry->type,
> +		      __entry->desc)
> +	    );
> +
> +TRACE_EVENT(key_ref,
> +	    TP_PROTO(key_serial_t key, unsigned int ref, enum key_ref_trace tra=
ce,
> +		     const void *where),
> +
> +	    TP_ARGS(key, ref, trace, where),
> +
> +	    TP_STRUCT__entry(
> +		    __field(key_serial_t,		key)
> +		    __field(enum key_ref_trace,		trace)
> +		    __field(unsigned int,		ref)
> +		    __field(const void *,		where)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->key =3D key;
> +		    __entry->trace =3D trace;
> +		    __entry->ref =3D ref;
> +		    __entry->where =3D where;
> +			   ),
> +
> +	    TP_printk("key=3D%08x %s r=3D%d pc=3D%pSR",
> +		      __entry->key,
> +		      __print_symbolic(__entry->trace, key_ref_traces),
> +		      __entry->ref,
> +		      __entry->where)
> +	    );
> +
> +TRACE_EVENT(key_instantiate,
> +	    TP_PROTO(const struct key *key, const struct key_preparsed_payload =
*prep),
> +
> +	    TP_ARGS(key, prep),
> +
> +	    TP_STRUCT__entry(
> +		    __field(key_serial_t,	key)
> +		    __field(unsigned int,	datalen)
> +		    __field(unsigned int,	quotalen)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->key =3D key->serial;
> +		    __entry->datalen =3D prep->datalen;
> +		    __entry->quotalen =3D prep->quotalen;
> +			   ),
> +
> +	    TP_printk("key=3D%08x dlen=3D%u qlen=3D%u",
> +		      __entry->key,
> +		      __entry->datalen,
> +		      __entry->quotalen)
> +	    );
> +
> +TRACE_EVENT(key_reject,
> +	    TP_PROTO(const struct key *key, int error),
> +
> +	    TP_ARGS(key, error),
> +
> +	    TP_STRUCT__entry(
> +		    __field(key_serial_t,	key)
> +		    __field(int,		error)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->key =3D key->serial;
> +		    __entry->error =3D error;
> +			   ),
> +
> +	    TP_printk("key=3D%08x err=3D%d",
> +		      __entry->key,
> +		      __entry->error)
> +	    );
> +
> +TRACE_EVENT(key_update,
> +	    TP_PROTO(const struct key *key, const struct key_preparsed_payload =
*prep),
> +
> +	    TP_ARGS(key, prep),
> +
> +	    TP_STRUCT__entry(
> +		    __field(key_serial_t,	key)
> +		    __field(unsigned int,	datalen)
> +		    __field(unsigned int,	quotalen)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->key =3D key->serial;
> +		    __entry->datalen =3D prep->datalen;
> +		    __entry->quotalen =3D prep->quotalen;
> +			   ),
> +
> +	    TP_printk("key=3D%08x dlen=3D%u qlen=3D%u",
> +		      __entry->key,
> +		      __entry->datalen,
> +		      __entry->quotalen)
> +	    );
> +
> +TRACE_EVENT(key_dead,
> +	    TP_PROTO(const struct key *key, enum key_dead_trace trace),
> +
> +	    TP_ARGS(key, trace),
> +
> +	    TP_STRUCT__entry(
> +		    __field(key_serial_t,		key)
> +		    __field(enum key_dead_trace,	trace)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->key =3D key->serial;
> +		    __entry->trace =3D trace;
> +			   ),
> +
> +	    TP_printk("key=3D%08x %s",
> +		      __entry->key,
> +		      __print_symbolic(__entry->trace, key_dead_traces))
> +	    );
> +
> +TRACE_EVENT(key_quota,
> +	    TP_PROTO(const struct key_user *user, int change_keys, int change_b=
ytes),
> +
> +	    TP_ARGS(user, change_keys, change_bytes),
> +
> +	    TP_STRUCT__entry(
> +		    __field(uid_t,		uid)
> +		    __field(unsigned int,	nkeys)
> +		    __field(unsigned int,	nikeys)
> +		    __field(unsigned int,	qnkeys)
> +		    __field(unsigned int,	qnbytes)
> +		    __field(int,		change_keys)
> +		    __field(int,		change_bytes)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->uid =3D from_kuid(&init_user_ns, user->uid);
> +		    __entry->nkeys =3D atomic_read(&user->nkeys);
> +		    __entry->nikeys =3D atomic_read(&user->nikeys);
> +		    __entry->qnkeys =3D user->qnkeys;
> +		    __entry->qnbytes =3D user->qnbytes;
> +		    __entry->change_keys =3D change_keys;
> +		    __entry->change_bytes =3D change_bytes;
> +			   ),
> +
> +	    TP_printk("uid=3D%d nkeys=3D%u/%u qkeys=3D%u qpay=3D%u ckeys=3D%d c=
pay=3D%d",
> +		      __entry->uid,
> +		      __entry->nikeys, __entry->nkeys,
> +		      __entry->qnkeys,
> +		      __entry->qnbytes,
> +		      __entry->change_keys, __entry->change_bytes)
> +	    );
> +
> +TRACE_EVENT(key_edquot,
> +	    TP_PROTO(const struct key_user *user, unsigned int maxkeys,
> +		     unsigned int maxbytes, unsigned int reqbytes),
> +
> +	    TP_ARGS(user, maxkeys, maxbytes, reqbytes),
> +
> +	    TP_STRUCT__entry(
> +		    __field(uid_t,		uid)
> +		    __field(unsigned int,	nkeys)
> +		    __field(unsigned int,	nikeys)
> +		    __field(unsigned int,	qnkeys)
> +		    __field(unsigned int,	qnbytes)
> +		    __field(unsigned int,	maxkeys)
> +		    __field(unsigned int,	maxbytes)
> +		    __field(unsigned int,	reqbytes)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->uid =3D from_kuid(&init_user_ns, user->uid);
> +		    __entry->nkeys =3D atomic_read(&user->nkeys);
> +		    __entry->nikeys =3D atomic_read(&user->nikeys);
> +		    __entry->qnkeys =3D user->qnkeys;
> +		    __entry->qnbytes =3D user->qnbytes;
> +		    __entry->maxkeys =3D maxkeys;
> +		    __entry->maxbytes =3D maxbytes;
> +		    __entry->reqbytes =3D reqbytes;
> +			   ),
> +
> +	    TP_printk("u=3D%d nkeys=3D%u/%u qkeys=3D%u/%u qpay=3D%u/%u cpay=3D%=
u",
> +		      __entry->uid,
> +		      __entry->nikeys, __entry->nkeys,
> +		      __entry->qnkeys, __entry->maxkeys,
> +		      __entry->qnbytes, __entry->maxbytes,
> +		      __entry->reqbytes)
> +	    );
> +
> +TRACE_EVENT(key_link,
> +	    TP_PROTO(const struct key *keyring, const struct key *key),
> +
> +	    TP_ARGS(keyring, key),
> +
> +	    TP_STRUCT__entry(
> +		    __field(key_serial_t,	keyring)
> +		    __field(key_serial_t,	key)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->keyring =3D keyring->serial;
> +		    __entry->key =3D key->serial;
> +			   ),
> +
> +	    TP_printk("key=3D%08x to=3D%08x",
> +		      __entry->key, __entry->keyring)
> +	    );
> +
> +TRACE_EVENT(key_unlink,
> +	    TP_PROTO(const struct key *keyring, const struct key *key),
> +
> +	    TP_ARGS(keyring, key),
> +
> +	    TP_STRUCT__entry(
> +		    __field(key_serial_t,	keyring)
> +		    __field(key_serial_t,	key)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->keyring =3D keyring->serial;
> +		    __entry->key =3D key->serial;
> +			   ),
> +
> +	    TP_printk("key=3D%08x from=3D%08x",
> +		      __entry->key, __entry->keyring)
> +	    );
> +
> +TRACE_EVENT(key_move,
> +	    TP_PROTO(const struct key *from, const struct key *to,
> +		     const struct key *key),
> +
> +	    TP_ARGS(from, to, key),
> +
> +	    TP_STRUCT__entry(
> +		    __field(key_serial_t,	from)
> +		    __field(key_serial_t,	to)
> +		    __field(key_serial_t,	key)
> +			     ),
> +
> +	    TP_fast_assign(
> +		    __entry->from =3D from->serial;
> +		    __entry->to =3D to->serial;
> +		    __entry->key =3D key->serial;
> +			   ),
> +
> +	    TP_printk("key=3D%08x from=3D%08x to=3D%08x",
> +		      __entry->key, __entry->from, __entry->to)
> +	    );
> +
> +TRACE_EVENT(key_clear,
> +	    TP_PROTO(const struct key *keyring),
> +	    TP_ARGS(keyring),
> +	    TP_STRUCT__entry(
> +		    __field(key_serial_t,	keyring)
> +			     ),
> +	    TP_fast_assign(
> +		    __entry->keyring =3D keyring->serial;
> +			   ),
> +	    TP_printk("key=3D%08x",
> +		      __entry->keyring)
> +	    );
> +
> +TRACE_EVENT(key_revoke,
> +	    TP_PROTO(const struct key *key),
> +	    TP_ARGS(key),
> +	    TP_STRUCT__entry(
> +		    __field(key_serial_t,	key)
> +			     ),
> +	    TP_fast_assign(
> +		    __entry->key =3D key->serial;
> +			   ),
> +	    TP_printk("key=3D%08x",
> +		      __entry->key)
> +	    );
> +
> +TRACE_EVENT(key_invalidate,
> +	    TP_PROTO(const struct key *key),
> +	    TP_ARGS(key),
> +	    TP_STRUCT__entry(
> +		    __field(key_serial_t,	key)
> +			     ),
> +	    TP_fast_assign(
> +		    __entry->key =3D key->serial;
> +			   ),
> +	    TP_printk("key=3D%08x",
> +		      __entry->key)
> +	    );
> +
> +TRACE_EVENT(key_gc,
> +	    TP_PROTO(const struct key *key),
> +	    TP_ARGS(key),
> +	    TP_STRUCT__entry(
> +		    __field(key_serial_t,	key)
> +			     ),
> +	    TP_fast_assign(
> +		    __entry->key =3D key->serial;
> +			   ),
> +	    TP_printk("key=3D%08x",
> +		      __entry->key)
> +	    );
> +
> +#undef EM
> +#undef E_
> +#endif /* _TRACE_KEY_H */
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>
> diff --git a/security/keys/gc.c b/security/keys/gc.c
> index 7d687b0962b1..47f857653854 100644
> --- a/security/keys/gc.c
> +++ b/security/keys/gc.c
> @@ -141,6 +141,7 @@ static noinline void key_gc_unused_keys(struct list_h=
ead *keys)
> =20
>  		list_del(&key->graveyard_link);
> =20
> +		trace_key_gc(key);
>  		kdebug("- %u", key->serial);
>  		key_check(key);
> =20
> @@ -163,6 +164,8 @@ static noinline void key_gc_unused_keys(struct list_h=
ead *keys)
>  		key_put_tag(key->domain_tag);
>  		kfree(key->description);
> =20
> +		trace_key_ref(key->serial, refcount_read(&key->usage),
> +			      key_trace_ref_free, 0);
>  		memzero_explicit(key, sizeof(*key));
>  		kmem_cache_free(key_jar, key);
>  	}
> @@ -331,6 +334,7 @@ static void key_garbage_collector(struct work_struct =
*work)
>  	 */
>  found_unreferenced_key:
>  	kdebug("unrefd key %d", key->serial);
> +	trace_key_ref(key->serial, refcount_read(&key->usage), key_trace_ref_gc=
, 0);
>  	rb_erase(&key->serial_node, &key_serial_tree);
>  	spin_unlock(&key_serial_lock);
> =20
> diff --git a/security/keys/internal.h b/security/keys/internal.h
> index 33c929a6bb97..87600683a7f5 100644
> --- a/security/keys/internal.h
> +++ b/security/keys/internal.h
> @@ -20,6 +20,7 @@
>  #include <linux/mm.h>
>  #include <linux/vmalloc.h>
>  #include <keys/key_user.h>
> +#include <trace/events/key.h>
> =20
>  struct iovec;
> =20
> diff --git a/security/keys/key.c b/security/keys/key.c
> index 59cffb6f9b94..abb8d60a0dc2 100644
> --- a/security/keys/key.c
> +++ b/security/keys/key.c
> @@ -14,6 +14,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/random.h>
>  #include <linux/err.h>
> +#define CREATE_TRACE_POINTS
>  #include "internal.h"
> =20
>  struct kmem_cache *key_jar;
> @@ -264,12 +265,15 @@ struct key *key_alloc(struct key_type *type, const =
char *desc,
>  		if (!(flags & KEY_ALLOC_QUOTA_OVERRUN)) {
>  			if (user->qnkeys + 1 > maxkeys ||
>  			    user->qnbytes + quotalen > maxbytes ||
> -			    user->qnbytes + quotalen < user->qnbytes)
> +			    user->qnbytes + quotalen < user->qnbytes) {
> +				trace_key_edquot(user, maxkeys, maxbytes, quotalen);
>  				goto no_quota;
> +			}
>  		}
> =20
>  		user->qnkeys++;
>  		user->qnbytes +=3D quotalen;
> +		trace_key_quota(user, +1, quotalen);
>  		spin_unlock_irqrestore(&user->lock, irqflags);
>  	}
> =20
> @@ -319,7 +323,10 @@ struct key *key_alloc(struct key_type *type, const c=
har *desc,
>  	/* publish the key by giving it a serial number */
>  	refcount_inc(&key->domain_tag->usage);
>  	atomic_inc(&user->nkeys);
> +	trace_key_quota(user, 0, 0);
>  	key_alloc_serial(key);
> +	trace_key_alloc(key);
> +	trace_key_ref(key->serial, 1, key_trace_ref_alloc, __builtin_return_add=
ress(0));
> =20
>  error:
>  	return key;
> @@ -331,6 +338,7 @@ struct key *key_alloc(struct key_type *type, const ch=
ar *desc,
>  		spin_lock_irqsave(&user->lock, irqflags);
>  		user->qnkeys--;
>  		user->qnbytes -=3D quotalen;
> +		trace_key_quota(user, -1, -quotalen);
>  		spin_unlock_irqrestore(&user->lock, irqflags);
>  	}
>  	key_user_put(user);
> @@ -344,6 +352,7 @@ struct key *key_alloc(struct key_type *type, const ch=
ar *desc,
>  		spin_lock_irqsave(&user->lock, irqflags);
>  		user->qnkeys--;
>  		user->qnbytes -=3D quotalen;
> +		trace_key_quota(user, -1, quotalen);
>  		spin_unlock_irqrestore(&user->lock, irqflags);
>  	}
>  	key_user_put(user);
> @@ -388,11 +397,13 @@ int key_payload_reserve(struct key *key, size_t dat=
alen)
>  		if (delta > 0 &&
>  		    (key->user->qnbytes + delta > maxbytes ||
>  		     key->user->qnbytes + delta < key->user->qnbytes)) {
> +			trace_key_edquot(key->user, 0, maxbytes, datalen);
>  			ret =3D -EDQUOT;
>  		}
>  		else {
>  			key->user->qnbytes +=3D delta;
>  			key->quotalen +=3D delta;
> +			trace_key_quota(key->user, 0, delta);
>  		}
>  		spin_unlock_irqrestore(&key->user->lock, flags);
>  	}
> @@ -447,6 +458,7 @@ static int __key_instantiate_and_link(struct key *key=
,
>  		if (ret =3D=3D 0) {
>  			/* mark the key as being instantiated */
>  			atomic_inc(&key->user->nikeys);
> +			trace_key_instantiate(key, prep);
>  			mark_key_instantiated(key, 0);
>  			notify_key(key, NOTIFY_KEY_INSTANTIATED, 0);
> =20
> @@ -604,6 +616,7 @@ int key_reject_and_link(struct key *key,
>  	if (key->state =3D=3D KEY_IS_UNINSTANTIATED) {
>  		/* mark the key as being negatively instantiated */
>  		atomic_inc(&key->user->nikeys);
> +		trace_key_reject(key, -error);
>  		mark_key_instantiated(key, -error);
>  		notify_key(key, NOTIFY_KEY_INSTANTIATED, -error);
>  		key_set_expiry(key, ktime_get_real_seconds() + timeout);
> @@ -641,10 +654,15 @@ EXPORT_SYMBOL(key_reject_and_link);
>   *
>   * Get a reference on a key, if not NULL, and return the parameter.
>   */
> -struct key *key_get(struct key *key)
> +noinline struct key *key_get(struct key *key)
>  {
> -	if (key)
> -		refcount_inc(&key->usage);
> +	if (key) {
> +		int r;
> +
> +		__refcount_inc(&key->usage, &r);
> +		trace_key_ref(key->serial, r + 1, key_trace_ref_get,
> +			      __builtin_return_address(0));
> +	}
>  	return key;
>  }
>  EXPORT_SYMBOL(key_get);
> @@ -656,10 +674,14 @@ EXPORT_SYMBOL(key_get);
>   * Get a reference on a key unless it has no references and return true =
if
>   * successful.  @key must not be NULL.
>   */
> -struct key *key_try_get(struct key *key)
> +noinline struct key *key_try_get(struct key *key)
>  {
> -	if (!refcount_inc_not_zero(&key->usage))
> +	int r;
> +
> +	if (!__refcount_inc_not_zero(&key->usage, &r))
>  		return NULL;
> +	trace_key_ref(key->serial, r + 1, key_trace_ref_try_get,
> +		      __builtin_return_address(0));
>  	return key;
>  }
> =20
> @@ -671,12 +693,19 @@ struct key *key_try_get(struct key *key)
>   * schedule the cleanup task to come and pull it out of the tree in proc=
ess
>   * context at some later time.
>   */
> -void key_put(struct key *key)
> +noinline void key_put(struct key *key)
>  {
>  	if (key) {
> +		key_serial_t serial =3D key->serial;
> +		bool zero;
> +		int r;
> +
>  		key_check(key);
> =20
> -		if (refcount_dec_and_test(&key->usage)) {
> +		zero =3D __refcount_dec_and_test(&key->usage, &r);
> +		trace_key_ref(serial, r - 1, key_trace_ref_put,
> +			      __builtin_return_address(0));
> +		if (zero) {
>  			unsigned long flags;
> =20
>  			/* deal with the user's key tracking and quota */
> @@ -684,6 +713,7 @@ void key_put(struct key *key)
>  				spin_lock_irqsave(&key->user->lock, flags);
>  				key->user->qnkeys--;
>  				key->user->qnbytes -=3D key->quotalen;
> +				trace_key_quota(key->user, -1, -key->quotalen);
>  				spin_unlock_irqrestore(&key->user->lock, flags);
>  			}
>  			schedule_work(&key_gc_work);
> @@ -807,6 +837,7 @@ static inline key_ref_t __key_update(key_ref_t key_re=
f,
>  	ret =3D key->type->update(key, prep);
>  	if (ret =3D=3D 0) {
>  		/* Updating a negative key positively instantiates it */
> +		trace_key_update(key, prep);
>  		mark_key_instantiated(key, 0);
>  		notify_key(key, NOTIFY_KEY_UPDATED, 0);
>  	}
> @@ -1131,6 +1162,7 @@ int key_update(key_ref_t key_ref, const void *paylo=
ad, size_t plen)
>  	ret =3D key->type->update(key, &prep);
>  	if (ret =3D=3D 0) {
>  		/* Updating a negative key positively instantiates it */
> +		trace_key_update(key, &prep);
>  		mark_key_instantiated(key, 0);
>  		notify_key(key, NOTIFY_KEY_UPDATED, 0);
>  	}
> @@ -1166,6 +1198,7 @@ void key_revoke(struct key *key)
>  	 */
>  	down_write_nested(&key->sem, 1);
>  	if (!test_and_set_bit(KEY_FLAG_REVOKED, &key->flags)) {
> +		trace_key_revoke(key);
>  		notify_key(key, NOTIFY_KEY_REVOKED, 0);
>  		if (key->type->revoke)
>  			key->type->revoke(key);
> @@ -1198,6 +1231,7 @@ void key_invalidate(struct key *key)
>  	if (!test_bit(KEY_FLAG_INVALIDATED, &key->flags)) {
>  		down_write_nested(&key->sem, 1);
>  		if (!test_and_set_bit(KEY_FLAG_INVALIDATED, &key->flags)) {
> +			trace_key_invalidate(key);
>  			notify_key(key, NOTIFY_KEY_INVALIDATED, 0);
>  			key_schedule_gc_links();
>  		}
> diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
> index ab927a142f51..f2ef898209e6 100644
> --- a/security/keys/keyctl.c
> +++ b/security/keys/keyctl.c
> @@ -1020,11 +1020,13 @@ long keyctl_chown_key(key_serial_t id, uid_t user=
, gid_t group)
> =20
>  			newowner->qnkeys++;
>  			newowner->qnbytes +=3D key->quotalen;
> +			trace_key_quota(newowner, +1, key->quotalen);
>  			spin_unlock_irqrestore(&newowner->lock, flags);
> =20
>  			spin_lock_irqsave(&key->user->lock, flags);
>  			key->user->qnkeys--;
>  			key->user->qnbytes -=3D key->quotalen;
> +			trace_key_quota(newowner, -1, -key->quotalen);
>  			spin_unlock_irqrestore(&key->user->lock, flags);
>  		}
> =20
> diff --git a/security/keys/keyring.c b/security/keys/keyring.c
> index a09a4c2b1bcb..d67a60142318 100644
> --- a/security/keys/keyring.c
> +++ b/security/keys/keyring.c
> @@ -1368,6 +1368,7 @@ void __key_link(struct key *keyring, struct key *ke=
y,
>  		struct assoc_array_edit **_edit)
>  {
>  	key_get(key);
> +	trace_key_link(keyring, key);
>  	assoc_array_insert_set_object(*_edit, keyring_key_to_ptr(key));
>  	assoc_array_apply_edit(*_edit);
>  	*_edit =3D NULL;
> @@ -1506,6 +1507,7 @@ static int __key_unlink_begin(struct key *keyring, =
struct key *key,
>  static void __key_unlink(struct key *keyring, struct key *key,
>  			 struct assoc_array_edit **_edit)
>  {
> +	trace_key_unlink(keyring, key);
>  	assoc_array_apply_edit(*_edit);
>  	notify_key(keyring, NOTIFY_KEY_UNLINKED, key_serial(key));
>  	*_edit =3D NULL;
> @@ -1625,6 +1627,7 @@ int key_move(struct key *key,
>  	if (ret < 0)
>  		goto error;
> =20
> +	trace_key_move(from_keyring, to_keyring, key);
>  	__key_unlink(from_keyring, key, &from_edit);
>  	__key_link(to_keyring, key, &to_edit);
>  error:
> @@ -1654,6 +1657,7 @@ int keyring_clear(struct key *keyring)
> =20
>  	down_write(&keyring->sem);
> =20
> +	trace_key_clear(keyring);
>  	edit =3D assoc_array_clear(&keyring->keys, &keyring_assoc_array_ops);
>  	if (IS_ERR(edit)) {
>  		ret =3D PTR_ERR(edit);
> @@ -1697,14 +1701,27 @@ static bool key_is_dead(const struct key *key, ti=
me64_t limit)
>  	if (expiry !=3D TIME64_MAX) {
>  		if (!(key->type->flags & KEY_TYPE_INSTANT_REAP))
>  			expiry +=3D key_gc_delay;
> -		if (expiry <=3D limit)
> +		if (expiry <=3D limit) {
> +			trace_key_dead(key, key_trace_dead_expired);
>  			return true;
> +		}
> +	}
> +
> +	if (test_bit(KEY_FLAG_DEAD, &key->flags)) {
> +		trace_key_dead(key, key_trace_dead_type_removed);
> +		return true;
> +	}
> +
> +	if (test_bit(KEY_FLAG_INVALIDATED, &key->flags)) {
> +		trace_key_dead(key, key_trace_dead_invalidated);
> +		return true;
>  	}
> =20
> -	return
> -		key->flags & ((1 << KEY_FLAG_DEAD) |
> -			      (1 << KEY_FLAG_INVALIDATED)) ||
> -		key->domain_tag->removed;
> +	if (key->domain_tag->removed) {
> +		trace_key_dead(key, key_trace_dead_domain_removed);
> +		return true;
> +	}
> +	return false;
>  }
> =20
>  static bool keyring_gc_select_iterator(void *object, void *iterator_data=
)

Splits matter because you can "set and forget" stuff now there is not
much to review in this main patch because the change is so dead
obvious and at sight:

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

I also gave quick test:

Tested-by: Jarkko Sakkinen <jarkko@kernel.org>

[1] TPM2 asymmetric keys:
    https://lore.kernel.org/linux-integrity/20240528210823.28798-1-jarkko@k=
ernel.org/

BR, Jarkko

