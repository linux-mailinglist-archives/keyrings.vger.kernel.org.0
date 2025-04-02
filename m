Return-Path: <keyrings+bounces-2562-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A34A7908F
	for <lists+keyrings@lfdr.de>; Wed,  2 Apr 2025 16:01:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FA823B5FB2
	for <lists+keyrings@lfdr.de>; Wed,  2 Apr 2025 13:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A19B23A9B7;
	Wed,  2 Apr 2025 13:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c8LZsC1t"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C36157493
	for <keyrings@vger.kernel.org>; Wed,  2 Apr 2025 13:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743602111; cv=none; b=GLmH4bY4SU3TU9kXTcYdRcbAfwS4zoCWaBdBliNgAMavk1qNNXieu27AnXuQXaaaa12NB+Zil19jGRLJc9Dz+PjQ80LJJlOITOMzjRPbN8KS+Du1UQxK8IXGzA7w5vt/Bvz2F3KPqyGMFs5Jdjf0pWY8zDPSjTXEIwvAXOEEkJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743602111; c=relaxed/simple;
	bh=m+4WUt+2eUA4Y0IY8E1gYRvWKxzjaiIk0V11Kg0m+eg=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=llwEH58fRsn7J2WzDR2Sjdca7yefaIlbt3vX20WgdlJKqWRNcgfELDUaM7JN+5bPZG3mzEmAKh1SArEse1UU0jRa97ZzlwlQ84/tRQDO77N9/16AyGLVBDGC7xcNFa50M+EbMkh0xJIQJHyDzLju+42i4RXHwmFjJTkc6E+QHqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c8LZsC1t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743602106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GCVRglk682zuGWx1it2xlUFAApb+6qhs9/A+9RgEAvI=;
	b=c8LZsC1tjgmtlRMN6+uK0I2nVzOAE9TUrcyye+PURM1DWKpf2Y1eXj/pPtvNHpfoHr+6Ta
	qhs+9LOXd6zNeG12NBfaQY0TEs5mtdnFsy+e09VCTOAtsKSWZPMlpquBw6KC/sBtdKpX+d
	ghQC+qrDLJf93NORRxeqfp88+ot4vDY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-593-Kd9SwUDXNu-ebyzkXu_1YA-1; Wed,
 02 Apr 2025 09:54:49 -0400
X-MC-Unique: Kd9SwUDXNu-ebyzkXu_1YA-1
X-Mimecast-MFC-AGG-ID: Kd9SwUDXNu-ebyzkXu_1YA_1743602088
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 07AAC180886D;
	Wed,  2 Apr 2025 13:54:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.40])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C707D19560AD;
	Wed,  2 Apr 2025 13:54:44 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250402085257.728844-1-jarkko@kernel.org>
References: <20250402085257.728844-1-jarkko@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: dhowells@redhat.com, keyrings@vger.kernel.org,
    Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>,
    Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
    "Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org,
    linux-security-module@vger.kernel.org
Subject: Re: [RFC PATCH v3] KEYS: Add a list for unreferenced keys
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <797520.1743602083.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Apr 2025 14:54:43 +0100
Message-ID: <797521.1743602083@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Jarkko Sakkinen <jarkko@kernel.org> wrote:

> Add an isolated list for unreferenced keys, thereby splitting key
> deletion as separate phase, after the reaping cycle. This makes the
> whole process more safe, as these two distinct tasks don't intervene
> each other. As an effect, KEY_FLAG_FINAL_PUT is no longer needed.
>
> Since `security/keys/proc.c` reserves key_serial_lock for variable
> amount of time, `rb_erase()` cannot be done within `key_put()` by using
> IRQ saving/restoring versions of the spin lock functions. For the same
> reason, the key needs to co-exist both in the tree and in the list for
> period of time.
>
> Therefore, split the union in `struct key` into separate `serial_node`
> and `graveyard_link` fields, and introduce a separate lock for the
> graveyard, which is locked and unlocked using IRQ saving/restoring
> versions of the locking routines.

Splitting the union seems reasonable.

However, you need to be very careful extracting keys from the serial tree
outside of the gc loop:

 (1) The serial tree walking loop assumes that it can keep a pointer to th=
e
     key it is currently examining without holding any locks.  I think thi=
s is
     probably not a problem for your patch as you're doing the removal in =
the
     same work item.

 (2) We have to deal with put keys belonging to a key type that's undergoi=
ng
     removal.  That might not be a problem as we can just get rid of them
     directly - but we have to deal with the RCU implications and may need=
 to
     call synchronize_rcu() again after calling key_gc_graveyard().

 (3) We still have to deal with a new key_put() happening immediately afte=
r
     you've done the rb_erase() calls.  I think it's probably worth still
     skipping the evaluation of the key state if the refcount is 0 (if we'=
re
     getting rid of the FINAL_PUT flag).  We might be holding up key
     insertion, after all.

This brings me on to another though:  Should key_serial_lock be a seqlock?
And should the gc use RCU + read_seqlock() and insertion write_seqlock()?

And further, should we have an 'active keys' list to search instead of
searching the RCU tree?  Your patch here might then move the put key from =
the
active list to the graveyard list - though it's better if it doesn't as th=
e
garbage collector can then walk the active list without the need for a loc=
k
except to remove a key.  Attached is an incomplete move in that direction.

David
---
keys: Have key_put() add dead key to a graveyard list [INCOMPLETE]

diff --git a/include/linux/key.h b/include/linux/key.h
index 074dca3222b9..2a095a32dc42 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -195,10 +195,9 @@ enum key_state {
 struct key {
 	refcount_t		usage;		/* number of references */
 	key_serial_t		serial;		/* key serial number */
-	union {
-		struct list_head graveyard_link;
-		struct rb_node	serial_node;
-	};
+	struct rb_node		serial_node;
+	struct list_head	active_link;	/* Next key in key_active_keys */
+	struct key		*next_dead;	/* Next key in key_graveyard */
 #ifdef CONFIG_KEY_NOTIFICATIONS
 	struct watch_list	*watchers;	/* Entities watching this key for changes *=
/
 #endif
diff --git a/security/keys/gc.c b/security/keys/gc.c
index 7d687b0962b1..2152d2f50ca7 100644
--- a/security/keys/gc.c
+++ b/security/keys/gc.c
@@ -20,6 +20,8 @@ unsigned key_gc_delay =3D 5 * 60;
  */
 static void key_garbage_collector(struct work_struct *work);
 DECLARE_WORK(key_gc_work, key_garbage_collector);
+extern struct key *key_graveyard;
+DEFINE_SPINLOCK(key_graveyard_lock);
 =

 /*
  * Reaper for links from keyrings to dead keys.
@@ -132,14 +134,40 @@ void key_gc_keytype(struct key_type *ktype)
 /*
  * Garbage collect a list of unreferenced, detached keys
  */
-static noinline void key_gc_unused_keys(struct list_head *keys)
+static noinline void key_gc_unused_keys(void)
 {
-	while (!list_empty(keys)) {
-		struct key *key =3D
-			list_entry(keys->next, struct key, graveyard_link);
+	struct key *graveyard, *key;
+
+	spin_lock_irq(&key_graveyard_lock);
+	graveyard =3D key_graveyard;
+	key_graveyard =3D NULL;
+	spin_unlock_irq(&key_graveyard_lock);
+
+	/* Make the keys inaccessible and remove them from the gc check list. */
+	spin_lock(&key_serial_lock);
+	for (key =3D graveyard; key; key =3D key->next_dead) {
+		rb_erase(&key->serial_node, &key_serial_tree);
+		list_del(&key->active_link);
+		if (need_resched()) {
+			spin_lock(&key_serial_lock);
+			cond_resched();
+			spin_unlock(&key_serial_lock);
+		}
+	}
+	spin_unlock(&key_serial_lock);
+
+	/* Make sure that all pending keyring payload destructions are
+	 * fulfilled and that people aren't now looking at dead or dying keys
+	 * that they don't have a reference upon or a link to.
+	 */
+	kdebug("gc sync");
+	synchronize_rcu();
+
+	while (graveyard) {
+		struct key *key =3D graveyard;
 		short state =3D key->state;
 =

-		list_del(&key->graveyard_link);
+		graveyard =3D key->next_dead;
 =

 		kdebug("- %u", key->serial);
 		key_check(key);
@@ -177,7 +205,6 @@ static noinline void key_gc_unused_keys(struct list_he=
ad *keys)
  */
 static void key_garbage_collector(struct work_struct *work)
 {
-	static LIST_HEAD(graveyard);
 	static u8 gc_state;		/* Internal persistent state */
 #define KEY_GC_REAP_AGAIN	0x01	/* - Need another cycle */
 #define KEY_GC_REAPING_LINKS	0x02	/* - We need to reap links */
@@ -186,8 +213,7 @@ static void key_garbage_collector(struct work_struct *=
work)
 #define KEY_GC_REAPING_DEAD_3	0x40	/* - We need to reap dead keys */
 #define KEY_GC_FOUND_DEAD_KEY	0x80	/* - We found at least one dead key */
 =

-	struct rb_node *cursor;
-	struct key *key;
+	struct list_head *cursor, *next;
 	time64_t new_timer, limit, expiry;
 =

 	kenter("[%lx,%x]", key_gc_flags, gc_state);
@@ -206,36 +232,71 @@ static void key_garbage_collector(struct work_struct=
 *work)
 =

 	new_timer =3D TIME64_MAX;
 =

-	/* As only this function is permitted to remove things from the key
-	 * serial tree, if cursor is non-NULL then it will always point to a
-	 * valid node in the tree - even if lock got dropped.
+	/* If we have a key type that's being removed, go through and make all
+	 * its keys unavailable.  At this point, only keyctl_read() and
+	 * /proc/keys should be looking at keys of this type.
 	 */
-	spin_lock(&key_serial_lock);
-	cursor =3D rb_first(&key_serial_tree);
+	if (gc_state & KEY_GC_REAPING_DEAD_1) {
+		for (cursor =3D smp_load_acquire(&key_active_list.next);
+		     /* key_active_list.next before key->active_link.next */
+		     cursor !=3D &key_active_list;
+		     cursor =3D next) {
+			struct key *key =3D list_entry(cursor, struct key, active_link);
+
+			next =3D cursor->next;
+			if (key->type !=3D key_gc_dead_keytype)
+				continue;
+
+			spin_lock(&key_serial_lock);
+			rb_erase(&key->serial_node, &key_serial_tree);
+			list_del_init(&key->active_link);
+			spin_unlock(&key_serial_lock);
+
+			kdebug("destroy key %d", key->serial);
+			down_write(&key->sem);
+			key->type =3D &key_type_dead;
+			if (key_gc_dead_keytype->destroy)
+				key_gc_dead_keytype->destroy(key);
+			memset(&key->payload, KEY_DESTROY, sizeof(key->payload));
+			up_write(&key->sem);
+		}
+	}
 =

-continue_scanning:
-	while (cursor) {
-		key =3D rb_entry(cursor, struct key, serial_node);
-		cursor =3D rb_next(cursor);
+	/* As only this function is permitted to remove things from the active
+	 * key list, if cursor is non-NULL then it will always point to a valid
+	 * node in the tree.  No locking is required to scan the tree.
+	 */
+	for (cursor =3D smp_load_acquire(&key_active_list.next); /* active.next =
before key->next */
+	     cursor !=3D &key_active_list;
+	     cursor =3D cursor->next) {
+		struct key *key =3D list_entry(cursor, struct key, active_link);
+		const struct key_type *type =3D key->type;
 =

+		cond_resched();
 		if (refcount_read(&key->usage) =3D=3D 0)
-			goto found_unreferenced_key;
+			continue; /* Presumably it's in the graveyard. */
 =

 		if (unlikely(gc_state & KEY_GC_REAPING_DEAD_1)) {
-			if (key->type =3D=3D key_gc_dead_keytype) {
+			if (type =3D=3D key_gc_dead_keytype) {
 				gc_state |=3D KEY_GC_FOUND_DEAD_KEY;
 				set_bit(KEY_FLAG_DEAD, &key->flags);
 				key->perm =3D 0;
-				goto skip_dead_key;
-			} else if (key->type =3D=3D &key_type_keyring &&
-				   key->restrict_link) {
-				goto found_restricted_keyring;
+				continue;
+			}
+			if (type =3D=3D &key_type_keyring &&
+			    key->restrict_link) {
+				/* We found a restricted keyring and need to
+				 * update the restriction if it is associated
+				 * with the dead key type.
+				 */
+				keyring_restriction_gc(key, key_gc_dead_keytype);
+				continue;
 			}
 		}
 =

 		expiry =3D key->expiry;
 		if (expiry !=3D TIME64_MAX) {
-			if (!(key->type->flags & KEY_TYPE_INSTANT_REAP))
+			if (!(type->flags & KEY_TYPE_INSTANT_REAP))
 				expiry +=3D key_gc_delay;
 			if (expiry > limit && expiry < new_timer) {
 				kdebug("will expire %x in %lld",
@@ -245,32 +306,35 @@ static void key_garbage_collector(struct work_struct=
 *work)
 		}
 =

 		if (unlikely(gc_state & KEY_GC_REAPING_DEAD_2))
-			if (key->type =3D=3D key_gc_dead_keytype)
+			if (type =3D=3D key_gc_dead_keytype)
 				gc_state |=3D KEY_GC_FOUND_DEAD_KEY;
 =

-		if ((gc_state & KEY_GC_REAPING_LINKS) ||
-		    unlikely(gc_state & KEY_GC_REAPING_DEAD_2)) {
-			if (key->type =3D=3D &key_type_keyring)
-				goto found_keyring;
+		/* If we have a keyring and we need to check the payload for
+		 * links to dead or expired keys.  We don't flag another reap
+		 * immediately as we have to wait for the old payload to be
+		 * destroyed by RCU before we can reap the keys to which it
+		 * refers.
+		 */
+		if (((gc_state & KEY_GC_REAPING_LINKS) ||
+		     unlikely(gc_state & KEY_GC_REAPING_DEAD_2)) &&
+		    type =3D=3D &key_type_keyring) {
+			keyring_gc(key, limit);
+			continue;
 		}
 =

-		if (unlikely(gc_state & KEY_GC_REAPING_DEAD_3))
-			if (key->type =3D=3D key_gc_dead_keytype)
-				goto destroy_dead_key;
-
-	skip_dead_key:
-		if (spin_is_contended(&key_serial_lock) || need_resched())
-			goto contended;
-	}
-
-contended:
-	spin_unlock(&key_serial_lock);
-
-maybe_resched:
-	if (cursor) {
-		cond_resched();
-		spin_lock(&key_serial_lock);
-		goto continue_scanning;
+		/* PASS 3: If we have a dead key that's still referenced, reset
+		 * its type and destroy its payload with its semaphore held.
+		 */
+		if (unlikely(gc_state & KEY_GC_REAPING_DEAD_3) &&
+		    key->type =3D=3D key_gc_dead_keytype) {
+			kdebug("destroy key %d", key->serial);
+			down_write(&key->sem);
+			key->type =3D &key_type_dead;
+			if (key_gc_dead_keytype->destroy)
+				key_gc_dead_keytype->destroy(key);
+			memset(&key->payload, KEY_DESTROY, sizeof(key->payload));
+			up_write(&key->sem);
+		}
 	}
 =

 	/* We've completed the pass.  Set the timer if we need to and queue a
@@ -284,20 +348,9 @@ static void key_garbage_collector(struct work_struct =
*work)
 		key_schedule_gc(new_timer);
 	}
 =

-	if (unlikely(gc_state & KEY_GC_REAPING_DEAD_2) ||
-	    !list_empty(&graveyard)) {
-		/* Make sure that all pending keyring payload destructions are
-		 * fulfilled and that people aren't now looking at dead or
-		 * dying keys that they don't have a reference upon or a link
-		 * to.
-		 */
-		kdebug("gc sync");
-		synchronize_rcu();
-	}
-
-	if (!list_empty(&graveyard)) {
+	if (key_graveyard) {
 		kdebug("gc keys");
-		key_gc_unused_keys(&graveyard);
+		key_gc_unused_keys();
 	}
 =

 	if (unlikely(gc_state & (KEY_GC_REAPING_DEAD_1 |
@@ -325,48 +378,4 @@ static void key_garbage_collector(struct work_struct =
*work)
 		schedule_work(&key_gc_work);
 	kleave(" [end %x]", gc_state);
 	return;
-
-	/* We found an unreferenced key - once we've removed it from the tree,
-	 * we can safely drop the lock.
-	 */
-found_unreferenced_key:
-	kdebug("unrefd key %d", key->serial);
-	rb_erase(&key->serial_node, &key_serial_tree);
-	spin_unlock(&key_serial_lock);
-
-	list_add_tail(&key->graveyard_link, &graveyard);
-	gc_state |=3D KEY_GC_REAP_AGAIN;
-	goto maybe_resched;
-
-	/* We found a restricted keyring and need to update the restriction if
-	 * it is associated with the dead key type.
-	 */
-found_restricted_keyring:
-	spin_unlock(&key_serial_lock);
-	keyring_restriction_gc(key, key_gc_dead_keytype);
-	goto maybe_resched;
-
-	/* We found a keyring and we need to check the payload for links to
-	 * dead or expired keys.  We don't flag another reap immediately as we
-	 * have to wait for the old payload to be destroyed by RCU before we
-	 * can reap the keys to which it refers.
-	 */
-found_keyring:
-	spin_unlock(&key_serial_lock);
-	keyring_gc(key, limit);
-	goto maybe_resched;
-
-	/* We found a dead key that is still referenced.  Reset its type and
-	 * destroy its payload with its semaphore held.
-	 */
-destroy_dead_key:
-	spin_unlock(&key_serial_lock);
-	kdebug("destroy key %d", key->serial);
-	down_write(&key->sem);
-	key->type =3D &key_type_dead;
-	if (key_gc_dead_keytype->destroy)
-		key_gc_dead_keytype->destroy(key);
-	memset(&key->payload, KEY_DESTROY, sizeof(key->payload));
-	up_write(&key->sem);
-	goto maybe_resched;
 }
diff --git a/security/keys/internal.h b/security/keys/internal.h
index 2cffa6dc8255..2e0179315a01 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -87,6 +87,9 @@ extern struct rb_root key_serial_tree;
 extern spinlock_t key_serial_lock;
 extern struct mutex key_construction_mutex;
 extern wait_queue_head_t request_key_conswq;
+extern struct list_head key_active_list;
+extern struct key *key_graveyard;
+extern spinlock_t key_graveyard_lock;
 =

 extern void key_set_index_key(struct keyring_index_key *index_key);
 extern struct key_type *key_type_lookup(const char *type);
diff --git a/security/keys/key.c b/security/keys/key.c
index 3d7d185019d3..8990b1956780 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -18,6 +18,7 @@
 =

 struct kmem_cache *key_jar;
 struct rb_root		key_serial_tree; /* tree of keys indexed by serial */
+LIST_HEAD(key_active_list); /* List of active keys, entries deleted by gc=
 only */
 DEFINE_SPINLOCK(key_serial_lock);
 =

 struct rb_root	key_user_tree; /* tree of quota records indexed by UID */
@@ -165,6 +166,15 @@ static inline void key_alloc_serial(struct key *key)
 	rb_link_node(&key->serial_node, parent, p);
 	rb_insert_color(&key->serial_node, &key_serial_tree);
 =

+	/* Add the key to the front of the live list so that the garbage
+	 * collector can see it (as list_add() with a barrier).
+	 */
+	key->active_link.prev =3D &key_active_list;
+	key->active_link.next =3D key_active_list.next;
+	key->active_link.next->prev =3D &key->active_link;
+	/* Write key->active_link.next before key_active_list.next. */
+	smp_store_release(key_active_list.next, key);
+
 	spin_unlock(&key_serial_lock);
 	return;
 =

@@ -651,14 +661,22 @@ void key_put(struct key *key)
 		if (refcount_dec_and_test(&key->usage)) {
 			unsigned long flags;
 =

-			/* deal with the user's key tracking and quota */
+			local_irq_save(flags);
+
 			if (test_bit(KEY_FLAG_IN_QUOTA, &key->flags)) {
-				spin_lock_irqsave(&key->user->lock, flags);
+				spin_lock(&key->user->lock);
 				key->user->qnkeys--;
 				key->user->qnbytes -=3D key->quotalen;
-				spin_unlock_irqrestore(&key->user->lock, flags);
+				spin_unlock(&key->user->lock);
 			}
+
+			spin_lock(&key_graveyard_lock);
+			key->next_dead =3D key_graveyard;
+			key_graveyard =3D key;
+			spin_unlock(&key_graveyard_lock);
+
 			schedule_work(&key_gc_work);
+			local_irq_restore(flags);
 		}
 	}
 }


