Return-Path: <keyrings+bounces-2566-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93572A7A865
	for <lists+keyrings@lfdr.de>; Thu,  3 Apr 2025 19:08:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44796175640
	for <lists+keyrings@lfdr.de>; Thu,  3 Apr 2025 17:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF992512F5;
	Thu,  3 Apr 2025 17:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyxrSgtY"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D40323ED76;
	Thu,  3 Apr 2025 17:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743700104; cv=none; b=OdccDNUiUj7hiIioO3O38JqJFGVHwvyTkrQzdg81BXshGrQJPOEA0ST+cOj+Kz6Gpn+jqIryoPPNCFJpqRI9P6OEeiiYgaFvsIuAa7NgsEy0QzL5De3risUVmVrHhiYTFIFsl3pLfcneknSbTN2N0m/38cbF3pDDpIYoJOQEeeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743700104; c=relaxed/simple;
	bh=nz7iqbb5HrUoqU1v8w6ipGev+vVQcouJnUc/lBRzQYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPGoSUvTar3AUp/i0A9ZCwQ8Cgmk7R551adaA0yvl46wbn97BmNn00/SjKbuLFv/e2cjrRdZAZ8SyAzGIz6+YNzlBiMsNK/kUVFJQv9kOkxrPYd8K/RqceOrCw8IgHRTvMDyTb3+C5ShlcyhuCr1aFOogdVwxSQZXcXrDFqBFdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyxrSgtY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9DCC4CEE3;
	Thu,  3 Apr 2025 17:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743700103;
	bh=nz7iqbb5HrUoqU1v8w6ipGev+vVQcouJnUc/lBRzQYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyxrSgtYpGRxDURQfeSKYjonWC0piMXw+DCIEI9IJZ9MemkTMrct4PsqEhG+sw1Tr
	 WtPS9LFS00+QgjzKOr3TS2yvtZnxMLuKY7moXY/+/w834KtGrFwd7zCiADZIhrWo/i
	 RAnL/euw3s/WwRdn3q4hd9XN+p9NxIRZYOlAQLI8F4i6otaAa4Th8lDwoXAxWPZrxp
	 uhbmNpyMXTL3KQYtHCmQYxHBiiVAzBsBjSp+XDm2TqlMkdcBWBtK5OgjYeltnOh/Ic
	 ILcDmiY7mIZrj0l5ggdUqSzsc0+IqFzHHATRTRnkr0W+vwb1cLxfAQecKoAFxK703Q
	 Nty8acnMOiM4w==
Date: Thu, 3 Apr 2025 20:05:56 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org, Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [RFC PATCH v4] KEYS: Add a list for unreferenced keys
Message-ID: <Z-682XjIjxjAZ9j-@kernel.org>
References: <Z-55p44u6rJRrY5A@kernel.org>
 <20250403153809.213535-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403153809.213535-1-jarkko@kernel.org>

On Thu, Apr 03, 2025 at 06:38:09PM +0300, Jarkko Sakkinen wrote:
> From: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
> 
> Add an isolated list of unreferenced keys to be queued for deletion, and
> try to pin the keys in the garbage collector before processing anything.
> Skip unpinnable keys.
> 
> In effect this means that exactly from the point of time when the usage
> count is zeroed all of the GC collector processing will be skipped. Earlier
> this was done only when key_put() function had done its processing, meaning
> that keys with usage count in zero might get still processed.
> 
> Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@opinsys.com>
> ---
> v4:
> - Pin the key while processing key type teardown. Skip dead keys.
> - Revert key_gc_graveyard back key_gc_unused_keys.
> - Rewrote the commit message.
> - "unsigned long flags" declaration somehow did make to the previous
>   patch (sorry).
> v3:
> - Using spin_lock() fails since key_put() is executed inside IRQs.
>   Using spin_lock_irqsave() would neither work given the lock is
>   acquired for /proc/keys. Therefore, separate the lock for
>   graveyard and key_graveyard before reaping key_serial_tree.
> v2:
> - Rename key_gc_unused_keys as key_gc_graveyard, and re-document the
>   function.
> ---
>  include/linux/key.h      |  7 ++-----
>  security/keys/gc.c       | 36 ++++++++++++++++++++----------------
>  security/keys/internal.h |  2 ++
>  security/keys/key.c      |  7 +++++--
>  4 files changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/include/linux/key.h b/include/linux/key.h
> index ba05de8579ec..c50659184bdf 100644
> --- a/include/linux/key.h
> +++ b/include/linux/key.h
> @@ -195,10 +195,8 @@ enum key_state {
>  struct key {
>  	refcount_t		usage;		/* number of references */
>  	key_serial_t		serial;		/* key serial number */
> -	union {
> -		struct list_head graveyard_link;
> -		struct rb_node	serial_node;
> -	};
> +	struct list_head	graveyard_link; /* key->usage == 0 */
> +	struct rb_node		serial_node;
>  #ifdef CONFIG_KEY_NOTIFICATIONS
>  	struct watch_list	*watchers;	/* Entities watching this key for changes */
>  #endif
> @@ -236,7 +234,6 @@ struct key {
>  #define KEY_FLAG_ROOT_CAN_INVAL	7	/* set if key can be invalidated by root without permission */
>  #define KEY_FLAG_KEEP		8	/* set if key should not be removed */
>  #define KEY_FLAG_UID_KEYRING	9	/* set if key is a user or user session keyring */
> -#define KEY_FLAG_FINAL_PUT	10	/* set if final put has happened on key */
>  
>  	/* the key type and key description string
>  	 * - the desc is used to match a key against search criteria
> diff --git a/security/keys/gc.c b/security/keys/gc.c
> index f27223ea4578..9ccd8ee6fcdb 100644
> --- a/security/keys/gc.c
> +++ b/security/keys/gc.c
> @@ -189,6 +189,7 @@ static void key_garbage_collector(struct work_struct *work)
>  	struct rb_node *cursor;
>  	struct key *key;
>  	time64_t new_timer, limit, expiry;
> +	unsigned long flags;
>  
>  	kenter("[%lx,%x]", key_gc_flags, gc_state);
>  
> @@ -206,21 +207,35 @@ static void key_garbage_collector(struct work_struct *work)
>  
>  	new_timer = TIME64_MAX;
>  
> +	spin_lock_irqsave(&key_graveyard_lock, flags);
> +	list_splice_init(&key_graveyard, &graveyard);
> +	spin_unlock_irqrestore(&key_graveyard_lock, flags);
> +
> +	list_for_each_entry(key, &graveyard, graveyard_link) {
> +		spin_lock(&key_serial_lock);
> +		kdebug("unrefd key %d", key->serial);
> +		rb_erase(&key->serial_node, &key_serial_tree);
> +		spin_unlock(&key_serial_lock);
> +	}
> +
>  	/* As only this function is permitted to remove things from the key
>  	 * serial tree, if cursor is non-NULL then it will always point to a
>  	 * valid node in the tree - even if lock got dropped.
>  	 */
>  	spin_lock(&key_serial_lock);
> +	key = NULL;
>  	cursor = rb_first(&key_serial_tree);
>  
>  continue_scanning:
> +	key_put(key);
>  	while (cursor) {
>  		key = rb_entry(cursor, struct key, serial_node);
>  		cursor = rb_next(cursor);
> -
> -		if (test_bit(KEY_FLAG_FINAL_PUT, &key->flags)) {
> -			smp_mb(); /* Clobber key->user after FINAL_PUT seen. */
> -			goto found_unreferenced_key;
> +		/* key_get(), unless zero: */
> +		if (!refcount_inc_not_zero(&key->usage)) {
> +			key = NULL;
> +			gc_state |= KEY_GC_REAP_AGAIN;
> +			goto skip_dead_key;
>  		}
>  
>  		if (unlikely(gc_state & KEY_GC_REAPING_DEAD_1)) {
> @@ -274,6 +289,7 @@ static void key_garbage_collector(struct work_struct *work)
>  		spin_lock(&key_serial_lock);
>  		goto continue_scanning;
>  	}
> +	key_put(key);
>  
>  	/* We've completed the pass.  Set the timer if we need to and queue a
>  	 * new cycle if necessary.  We keep executing cycles until we find one
> @@ -328,18 +344,6 @@ static void key_garbage_collector(struct work_struct *work)
>  	kleave(" [end %x]", gc_state);
>  	return;
>  
> -	/* We found an unreferenced key - once we've removed it from the tree,
> -	 * we can safely drop the lock.
> -	 */
> -found_unreferenced_key:
> -	kdebug("unrefd key %d", key->serial);
> -	rb_erase(&key->serial_node, &key_serial_tree);
> -	spin_unlock(&key_serial_lock);
> -
> -	list_add_tail(&key->graveyard_link, &graveyard);
> -	gc_state |= KEY_GC_REAP_AGAIN;
> -	goto maybe_resched;
> -
>  	/* We found a restricted keyring and need to update the restriction if
>  	 * it is associated with the dead key type.
>  	 */
> diff --git a/security/keys/internal.h b/security/keys/internal.h
> index 2cffa6dc8255..08f356d04d78 100644
> --- a/security/keys/internal.h
> +++ b/security/keys/internal.h
> @@ -66,6 +66,8 @@ struct key_user {
>  extern struct rb_root	key_user_tree;
>  extern spinlock_t	key_user_lock;
>  extern struct key_user	root_key_user;
> +extern struct list_head	key_graveyard;
> +extern spinlock_t	key_graveyard_lock;
>  
>  extern struct key_user *key_user_lookup(kuid_t uid);
>  extern void key_user_put(struct key_user *user);
> diff --git a/security/keys/key.c b/security/keys/key.c
> index 7198cd2ac3a3..7511f2017b6b 100644
> --- a/security/keys/key.c
> +++ b/security/keys/key.c
> @@ -22,6 +22,8 @@ DEFINE_SPINLOCK(key_serial_lock);
>  
>  struct rb_root	key_user_tree; /* tree of quota records indexed by UID */
>  DEFINE_SPINLOCK(key_user_lock);
> +LIST_HEAD(key_graveyard);
> +DEFINE_SPINLOCK(key_graveyard_lock);
>  
>  unsigned int key_quota_root_maxkeys = 1000000;	/* root's key count quota */
>  unsigned int key_quota_root_maxbytes = 25000000; /* root's key space quota */
> @@ -658,8 +660,9 @@ void key_put(struct key *key)
>  				key->user->qnbytes -= key->quotalen;
>  				spin_unlock_irqrestore(&key->user->lock, flags);
>  			}
> -			smp_mb(); /* key->user before FINAL_PUT set. */
> -			set_bit(KEY_FLAG_FINAL_PUT, &key->flags);
> +			spin_lock_irqsave(&key_graveyard_lock, flags);
> +			list_add_tail(&key->graveyard_link, &key_graveyard);
> +			spin_unlock_irqrestore(&key_graveyard_lock, flags);
>  			schedule_work(&key_gc_work);
>  		}
>  	}
> -- 
> 2.39.5
> 
> 

David, I'd almost call this version a bug fix, and would consider adding
fixes tag too.

The reason being that this fully addresses racy access to struct key
between key_put() and the GC. The small change I did for v4 makes a
world of difference for this patch.

BR, Jarkko

