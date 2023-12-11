Return-Path: <keyrings+bounces-241-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D7080CCB0
	for <lists+keyrings@lfdr.de>; Mon, 11 Dec 2023 15:03:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAFFC1C21219
	for <lists+keyrings@lfdr.de>; Mon, 11 Dec 2023 14:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DF85482E9;
	Mon, 11 Dec 2023 14:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c1wYYmiU"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 275933A82
	for <keyrings@vger.kernel.org>; Mon, 11 Dec 2023 06:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702303382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H/ItFeG9I3Z0oT+bsnz2Nm0t33eZdTXAx/q4fgwtKPo=;
	b=c1wYYmiUatvz4PBVVt0sNDqEaaNTCdSH3rnh68/g/xNQr2ZNq4pXONhIkGp5PkyIkcorpC
	ZU2HWZUtO/p0tFmt7ieUXWyto82+WLFeyxiOoz9DlWquGn+D5HcQFwecSJriD9noOKCVN3
	BCCsm8q9L9ttdgqfKlDc47hIdBuoAR0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-6_kAC2vdNKWK8F8OWA-jnA-1; Mon,
 11 Dec 2023 09:02:59 -0500
X-MC-Unique: 6_kAC2vdNKWK8F8OWA-jnA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F7E53C2AF66;
	Mon, 11 Dec 2023 14:02:49 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 47C5D51E3;
	Mon, 11 Dec 2023 14:02:48 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20231207024323.GA1994@sol.localdomain>
References: <20231207024323.GA1994@sol.localdomain> <20231206145744.17277-1-lhenriques@suse.de> <498294.1701878642@warthog.procyon.org.uk> <87bkb3z047.fsf@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, Luis Henriques <lhenriques@suse.de>,
    Jarkko Sakkinen <jarkko@kernel.org>, keyrings@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] keys: flush work when accessing /proc/key-users
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2744562.1702303367.1@warthog.procyon.org.uk>
Date: Mon, 11 Dec 2023 14:02:47 +0000
Message-ID: <2744563.1702303367@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Eric Biggers <ebiggers@kernel.org> wrote:

> If there was a function that fully and synchronously releases a key's quota,
> fs/crypto/ could call it before unlinking the key.  key_payload_reserve(key,
> 0) almost does the trick, but it would release the key's bytes, not the key
> itself.

Umm...  The point of the quota is that the key is occupying unswappable kernel
memory (partly true in the case of big_key) and we need to limit that.
Further, the key is not released until it is unlinked.

> However, that would only fix the flakiness of the key quota for fs/crypto/,
> not for other users of the keyrings service.  Maybe this suggests that
> key_put() should release the key's quota right away if the key's refcount
> drops to 0?

That I would be okay with as the key should be removed in short order.

Note that you'd have to change the spinlocks on key->user->lock to irq-locking
types.  Or maybe we can do without them, at least for key gc, and use atomic
counters.  key_invalidate() should probably drop the quota also.

I'm also working up a patch so that key types can be marked for immediate gc
if they expire, rather than there being a period (key_gc_delay) in which they
cause EKEYEXPIRED rather than ENOKEY to be returned for better indication to
userspace as to what's happened when a filesystem op fails to to key problems.

> Either way, note that where fs/crypto/ does key_put() on a whole keyring at
> once, it would first need to call keyring_clear() to clear it synchronously.

What if there's another link on the keyring?  Should it still be cleared?

Do we need faster disposal of keys?  Perhaps keeping a list of keys that need
destroying rather than scanning the entire key set for them.  We still need to
scan non-destroyed keyrings, though, to find the pointers to defunct keys
unless I have some sort of backpointer list.

David


