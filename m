Return-Path: <keyrings+bounces-1819-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 284B393F6DD
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 15:41:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 460831C20B09
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 13:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48BC014A61A;
	Mon, 29 Jul 2024 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RkJt6gIi"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A0A146A71;
	Mon, 29 Jul 2024 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722260458; cv=none; b=p3KkEtQ5wT8DVu7paPN4brC1w5rUhOSGwBRtJY+BNYPf31m/NZbl9TYANeLH4DzPSOYiX5CFbvPk0j4tkNNAeLERZYhfjrQN/iq6CV+KvonYG6/wTWeBfqL2GvLywqayGFVuU1TU8PsS0l0uvRXyC3UIr24Tp16IUJgoZ9OxsBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722260458; c=relaxed/simple;
	bh=Xl5rOltRgB1ryzn8+3+bo+k0gl/4HhV1p+DZSo4Ob+c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dRPtwkt0dFgO91wWZusg8OaLtHjnbqLaWhbfeY9jh4A8u8KpI3ejArddw4T9JyeQYJl+kbVBAvRMhcmhVeaojp55ak7AQJdpFDqaFBIRdxdHtE2O95evNy/fFwO6IWOll2n0+8iSu76mmdhAjQwgEX1k8LwqG+EFvTc1IOByJbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RkJt6gIi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EDA0C4AF09;
	Mon, 29 Jul 2024 13:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722260457;
	bh=Xl5rOltRgB1ryzn8+3+bo+k0gl/4HhV1p+DZSo4Ob+c=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=RkJt6gIi6evbdMq6prc4NWnGhv/mr4Sg6vY1D7fzRUE05i1ZKahfyG/7LCGt6JQGv
	 gXEUAoHmHGopQe2H23m0wg7RTfhCFrcZr+OQRfr8gm+ECV0KmjhO2Nwl/Dj2n5gUqw
	 O/wDBqn0FY7ENEmutL1iE9rLUDPzWQfV784lh8JknYRU2waYvWLMbH5dcR/uH3IoNy
	 NmRWWcnRYMlZFvc43HBSDorWz9PgYTuydWYlq+EEjPPg2EhkWnt1DxHy5YO7UC7Nez
	 dyHJNafUl0KQdSySdIm6Nf2eRjyrBJ6MwHzfZYRH66SqzmfjoU0wykTj9/p3lYOKw4
	 t0SmTEpHdN/bQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Jul 2024 16:40:53 +0300
Message-Id: <D322DLT84UK0.15159NWVYCME2@kernel.org>
Cc: <linux-security-module@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] keys: Add tracepoints for the keyrings facility
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "David Howells" <dhowells@redhat.com>, <keyrings@vger.kernel.org>
X-Mailer: aerc 0.18.0
References: <2014451.1721690435@warthog.procyon.org.uk>
In-Reply-To: <2014451.1721690435@warthog.procyon.org.uk>

On Tue Jul 23, 2024 at 2:20 AM EEST, David Howells wrote:
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
> ---
>  Documentation/security/keys/core.rst |    1=20
>  crypto/asymmetric_keys/restrict.c    |    6=20
>  include/keys/key_user.h              |   35 +++
>  include/linux/key.h                  |   16 -
>  include/trace/events/key.h           |  401 ++++++++++++++++++++++++++++=
+++++++
>  security/keys/gc.c                   |    4=20
>  security/keys/internal.h             |   41 ---
>  security/keys/key.c                  |   66 +++++
>  security/keys/keyctl.c               |    2=20
>  security/keys/keyring.c              |   45 +++
>  security/keys/process_keys.c         |   15 -
>  11 files changed, 562 insertions(+), 70 deletions(-)
>
> diff --git a/Documentation/security/keys/core.rst b/Documentation/securit=
y/keys/core.rst
> index 326b8a973828..0b179540d885 100644
> --- a/Documentation/security/keys/core.rst
> +++ b/Documentation/security/keys/core.rst
> @@ -1217,7 +1217,6 @@ payload contents" for more information.
>   *  Extra references can be made to a key by calling one of the followin=
g
>      functions::
> =20
> -	struct key *__key_get(struct key *key);
>  	struct key *key_get(struct key *key);
> =20
>      Keys so references will need to be disposed of by calling key_put() =
when
> diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/r=
estrict.c
> index afcd4d101ac5..1ea7bfd4e5d7 100644
> --- a/crypto/asymmetric_keys/restrict.c
> +++ b/crypto/asymmetric_keys/restrict.c
> @@ -267,20 +267,20 @@ static int key_or_keyring_common(struct key *dest_k=
eyring,
>  			if (!sig->auth_ids[0] && !sig->auth_ids[1]) {
>  				if (asymmetric_key_id_same(signer_ids[2],
>  							   sig->auth_ids[2]))
> -					key =3D __key_get(trusted);
> +					key =3D key_get(trusted);
> =20
>  			} else if (!sig->auth_ids[0] || !sig->auth_ids[1]) {
>  				const struct asymmetric_key_id *auth_id;
> =20
>  				auth_id =3D sig->auth_ids[0] ?: sig->auth_ids[1];
>  				if (match_either_id(signer_ids, auth_id))
> -					key =3D __key_get(trusted);
> +					key =3D key_get(trusted);
> =20
>  			} else if (asymmetric_key_id_same(signer_ids[1],
>  							  sig->auth_ids[1]) &&
>  				   match_either_id(signer_ids,
>  						   sig->auth_ids[0])) {
> -				key =3D __key_get(trusted);
> +				key =3D key_get(trusted);
>  			}
>  		} else {
>  			return -EOPNOTSUPP;
> diff --git a/include/keys/key_user.h b/include/keys/key_user.h
> new file mode 100644
> index 000000000000..e9c383d8116e
> --- /dev/null
> +++ b/include/keys/key_user.h
> @@ -0,0 +1,35 @@
> +/* User quota tracking for keys.
> + *
> + * Copyright (C) 2024 Red Hat, Inc. All Rights Reserved.
> + * Written by David Howells (dhowells@redhat.com)
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public Licence
> + * as published by the Free Software Foundation; either version
> + * 2 of the Licence, or (at your option) any later version.
> + */
> +
> +#ifndef _KEYS_KEY_USER_H
> +#define _KEYS_KEY_USER_H
> +
> +/*
> + * Keep track of keys for a user.
> + *
> + * This needs to be separate to user_struct to avoid a refcount-loop
> + * (user_struct pins some keyrings which pin this struct).
> + *
> + * We also keep track of keys under request from userspace for this UID =
here.
> + */
> +struct key_user {
> +	struct rb_node		node;
> +	struct mutex		cons_lock;	/* construction initiation lock */
> +	spinlock_t		lock;
> +	refcount_t		usage;		/* for accessing qnkeys & qnbytes */
> +	atomic_t		nkeys;		/* number of keys */
> +	atomic_t		nikeys;		/* number of instantiated keys */
> +	kuid_t			uid;
> +	int			qnkeys;		/* number of keys allocated to this user */
> +	int			qnbytes;	/* number of bytes allocated to this user */
> +};
> +
> +#endif /* _KEYS_KEY_USER_H */
> diff --git a/include/linux/key.h b/include/linux/key.h
> index 943a432da3ae..4e5baf3e7286 100644
> --- a/include/linux/key.h
> +++ b/include/linux/key.h
> @@ -299,24 +299,20 @@ extern struct key *key_alloc(struct key_type *type,
> =20
>  extern void key_revoke(struct key *key);
>  extern void key_invalidate(struct key *key);
> +struct key *key_get(struct key *key);
> +struct key *key_try_get(struct key *key);
>  extern void key_put(struct key *key);
>  extern bool key_put_tag(struct key_tag *tag);
>  extern void key_remove_domain(struct key_tag *domain_tag);
> =20
> -static inline struct key *__key_get(struct key *key)
> -{
> -	refcount_inc(&key->usage);
> -	return key;
> -}
> -
> -static inline struct key *key_get(struct key *key)
> +static inline void key_ref_put(key_ref_t key_ref)
>  {
> -	return key ? __key_get(key) : key;
> +	key_put(key_ref_to_ptr(key_ref));
>  }
> =20
> -static inline void key_ref_put(key_ref_t key_ref)
> +static inline void key_ref_get(key_ref_t key_ref)
>  {
> -	key_put(key_ref_to_ptr(key_ref));
> +	key_get(key_ref_to_ptr(key_ref));
>  }
> =20
>  extern struct key *request_key_tag(struct key_type *type,
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
> index 2cffa6dc8255..87600683a7f5 100644
> --- a/security/keys/internal.h
> +++ b/security/keys/internal.h
> @@ -19,6 +19,8 @@
>  #include <linux/compat.h>
>  #include <linux/mm.h>
>  #include <linux/vmalloc.h>
> +#include <keys/key_user.h>
> +#include <trace/events/key.h>
> =20
>  struct iovec;
> =20
> @@ -43,25 +45,6 @@ extern struct key_type key_type_user;
>  extern struct key_type key_type_logon;
> =20
>  /***********************************************************************=
******/
> -/*
> - * Keep track of keys for a user.
> - *
> - * This needs to be separate to user_struct to avoid a refcount-loop
> - * (user_struct pins some keyrings which pin this struct).
> - *
> - * We also keep track of keys under request from userspace for this UID =
here.
> - */
> -struct key_user {
> -	struct rb_node		node;
> -	struct mutex		cons_lock;	/* construction initiation lock */
> -	spinlock_t		lock;
> -	refcount_t		usage;		/* for accessing qnkeys & qnbytes */
> -	atomic_t		nkeys;		/* number of keys */
> -	atomic_t		nikeys;		/* number of instantiated keys */
> -	kuid_t			uid;
> -	int			qnkeys;		/* number of keys allocated to this user */
> -	int			qnbytes;	/* number of bytes allocated to this user */
> -};
> =20
>  extern struct rb_root	key_user_tree;
>  extern spinlock_t	key_user_lock;
> @@ -211,26 +194,6 @@ extern struct key *request_key_auth_new(struct key *=
target,
> =20
>  extern struct key *key_get_instantiation_authkey(key_serial_t target_id)=
;
> =20
> -/*
> - * Determine whether a key is dead.
> - */
> -static inline bool key_is_dead(const struct key *key, time64_t limit)
> -{
> -	time64_t expiry =3D key->expiry;
> -
> -	if (expiry !=3D TIME64_MAX) {
> -		if (!(key->type->flags & KEY_TYPE_INSTANT_REAP))
> -			expiry +=3D key_gc_delay;
> -		if (expiry <=3D limit)
> -			return true;
> -	}
> -
> -	return
> -		key->flags & ((1 << KEY_FLAG_DEAD) |
> -			      (1 << KEY_FLAG_INVALIDATED)) ||
> -		key->domain_tag->removed;
> -}
> -

I'd split relocations and similar preparations to separate patches, if
by any means possible. Then it would be less stressing to review the
actual change.

BR, Jarkko

