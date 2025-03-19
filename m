Return-Path: <keyrings+bounces-2484-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CC9A693BA
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 16:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB99618821C3
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 15:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C4B1C5D79;
	Wed, 19 Mar 2025 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ec4lRJHh"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B2879C0
	for <keyrings@vger.kernel.org>; Wed, 19 Mar 2025 15:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742397633; cv=none; b=Typ/bbjIS4oKrE8a3iZnL9wCC6PsQB1lmp+6T9kd72EXeDFfQBPWmWm1jPzohFJfRPBkwMKBDQblAX/4zf2jIIdjz6RDVOlCxKp1FecNRrRwD4XSSgoHKm1ujpgvkobHSLedHZrkcKmNXoCe4RNxrVeXmNTDJ/+9JZuYpSCX2hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742397633; c=relaxed/simple;
	bh=wXObAS1nDxevnJS3/a2XPCZDjsHdeX1ex9JUbKsd24Q=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=KbrEib/fL1W6nEu0ZwEDhVsjAKR8rQVl6wE9jvOrzt/yvYTRY21Mpox+Em1tZWDlBKnaPpi7+UzAvevisQ2wGqskch+CiKIJpnujOmLRLinHxc/X4ELuN8IrwimnKzKLYQq0JIrRfwmZetE+2OkwyDqV9CeGDJIvULAqzwFK9hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ec4lRJHh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742397631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WwW1FGaoJiukAnJUjcSsO6NTQgzz4aZZ400UE7isFwI=;
	b=Ec4lRJHh9O5OofIAIcZ5Lr2ClPOXYi6mdbISg7PAxH5Me2Eu9HjZ/blPJLTScZzCttqW5Z
	iQPSpzKOYR9wEQXOgymlr9Oy0eKZLYjlEo1EtSVcBNO/OpgcLU5flQ/ofTJiE6kF4zzrxa
	1vxOJRBHlUabQagXTViAdrVGBmbcNoU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-CBXmNsuHM0CohR93CsncMA-1; Wed,
 19 Mar 2025 11:20:26 -0400
X-MC-Unique: CBXmNsuHM0CohR93CsncMA-1
X-Mimecast-MFC-AGG-ID: CBXmNsuHM0CohR93CsncMA_1742397625
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA02A1956065;
	Wed, 19 Mar 2025 15:20:24 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.61])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 35A3119560AD;
	Wed, 19 Mar 2025 15:20:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <673b6aec.050a0220.87769.004a.GAE@google.com>
References: <673b6aec.050a0220.87769.004a.GAE@google.com>
To: syzbot <syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com>
Cc: dhowells@redhat.com, jarkko@kernel.org, jmorris@namei.org,
    Oleg Nesterov <oleg@redhat.com>, keyrings@vger.kernel.org,
    linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
    paul@paul-moore.com, serge@hallyn.com,
    syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [keyrings?] [lsm?] KASAN: slab-use-after-free Read in key_put
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2831140.1742397619.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Mar 2025 15:20:19 +0000
Message-ID: <2831141.1742397619@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master

commit 91286ccf56bb5030c0c84b11684f06142f50e681
Author: David Howells <dhowells@redhat.com>
Date:   Tue Mar 18 09:54:54 2025 +0000

    keys: Fix UAF in key_put()
    =

    Once a key's reference count has been reduced to 0, the garbage collec=
tor
    thread may destroy it at any time and so key_put() is not allowed to t=
ouch
    the key after that point.  The most key_put() is normally allowed to d=
o is
    to touch key_gc_work as that's a static global variable.
    =

    However, in an effort to speed up the reclamation of quota, this is no=
w
    done in key_put() once the key's usage is reduced to 0 - but now the c=
ode
    is looking at the key after the deadline, which is forbidden.
    =

    Fix this by using a flag to indicate that a key can be gc'd now rather=
 than
    looking at the key's refcount in the garbage collector.
    =

    Fixes: 9578e327b2b4 ("keys: update key quotas in key_put()")
    Reported-by: syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com
    Signed-off-by: David Howells <dhowells@redhat.com>
    cc: Jarkko Sakkinen <jarkko@kernel.org>
    cc: Oleg Nesterov <oleg@redhat.com>
    cc: Kees Cook <kees@kernel.org>
    cc: Hillf Danton <hdanton@sina.com>,
    cc: keyrings@vger.kernel.org
    Cc: stable@vger.kernel.org # v6.10+

diff --git a/include/linux/key.h b/include/linux/key.h
index 074dca3222b9..ba05de8579ec 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -236,6 +236,7 @@ struct key {
 #define KEY_FLAG_ROOT_CAN_INVAL	7	/* set if key can be invalidated by roo=
t without permission */
 #define KEY_FLAG_KEEP		8	/* set if key should not be removed */
 #define KEY_FLAG_UID_KEYRING	9	/* set if key is a user or user session ke=
yring */
+#define KEY_FLAG_FINAL_PUT	10	/* set if final put has happened on key */
 =

 	/* the key type and key description string
 	 * - the desc is used to match a key against search criteria
diff --git a/security/keys/gc.c b/security/keys/gc.c
index 7d687b0962b1..f27223ea4578 100644
--- a/security/keys/gc.c
+++ b/security/keys/gc.c
@@ -218,8 +218,10 @@ static void key_garbage_collector(struct work_struct =
*work)
 		key =3D rb_entry(cursor, struct key, serial_node);
 		cursor =3D rb_next(cursor);
 =

-		if (refcount_read(&key->usage) =3D=3D 0)
+		if (test_bit(KEY_FLAG_FINAL_PUT, &key->flags)) {
+			smp_mb(); /* Clobber key->user after FINAL_PUT seen. */
 			goto found_unreferenced_key;
+		}
 =

 		if (unlikely(gc_state & KEY_GC_REAPING_DEAD_1)) {
 			if (key->type =3D=3D key_gc_dead_keytype) {
diff --git a/security/keys/key.c b/security/keys/key.c
index 3d7d185019d3..7198cd2ac3a3 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -658,6 +658,8 @@ void key_put(struct key *key)
 				key->user->qnbytes -=3D key->quotalen;
 				spin_unlock_irqrestore(&key->user->lock, flags);
 			}
+			smp_mb(); /* key->user before FINAL_PUT set. */
+			set_bit(KEY_FLAG_FINAL_PUT, &key->flags);
 			schedule_work(&key_gc_work);
 		}
 	}


