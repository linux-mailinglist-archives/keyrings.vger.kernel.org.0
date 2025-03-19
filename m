Return-Path: <keyrings+bounces-2486-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CE3A69438
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 16:59:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A64D13B5DCC
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 15:57:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176ED1DE2B8;
	Wed, 19 Mar 2025 15:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WEwFy8n0"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5622C8248C
	for <keyrings@vger.kernel.org>; Wed, 19 Mar 2025 15:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742399881; cv=none; b=K5Hv3vDideuuJE+jkq8m6eM3XhqNufnqKmDxqfdC2lp6yyVDWL9JQfeOQjCXgO8/yhZ8Kr/6zoRiIJcxbQoh0TtrFTuVI/Q++7lKFxeb9bnZxwBUL1a3TlJVuXzrJJWhhBYEjae7MZ/yT+ZAHxQ8ZkKuBb5WYoBYOpKxUoYJ6RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742399881; c=relaxed/simple;
	bh=cOsMuKQb/lrh4fcleFooX/435gcJm2O9x2FsdEwNYhw=;
	h=From:To:cc:Subject:MIME-Version:Content-Type:Date:Message-ID; b=tWRlvuiWuSlMNpYsuqZODaYi8yCneT9imEH+AylVPo6IigrcmtA695+icM7P9OsyvPSnFJWc5VFN2oO9siDZRdztdt7SortxxoJmsrrqxv/Jh8wZAGEMxndKV0Y6Ack2Y7aYAonx7vaZ01Ldp48hE4uV81SJDmSszwuYfFX/2Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WEwFy8n0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742399877;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Affn6rQXpyfnc4W7xuXIRA+WTecDnyyFD3YVzC9nu9M=;
	b=WEwFy8n0PjDFDBXWG7tZ2ACym7WTCFfJcdo+hzPmZfScbifyQJiJX1jxEi4R4q1yUwjMKT
	Xa8OENrsDIvMGMepSjajqslvRlbMDfehf/ndsiX9KtkYuNpGN3uXCV5/g0Os8FQhivSLEe
	cn6RYWebnypupDh31I4amRiKWMZ8LpY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-172-PX7psVPgMs6i5X2X72TBFg-1; Wed,
 19 Mar 2025 11:57:53 -0400
X-MC-Unique: PX7psVPgMs6i5X2X72TBFg-1
X-Mimecast-MFC-AGG-ID: PX7psVPgMs6i5X2X72TBFg_1742399871
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6926E19560BB;
	Wed, 19 Mar 2025 15:57:51 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.61])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8C68D1956094;
	Wed, 19 Mar 2025 15:57:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
cc: dhowells@redhat.com, Kees Cook <kees@kernel.org>,
    Oleg Nesterov <oleg@redhat.com>,
    Greg KH <gregkh@linuxfoundation.org>,
    Josh Drake <josh@delphoslabs.com>,
    Suraj Sonawane <surajsonawane0215@gmail.com>,
    keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
    security@kernel.org, stable@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: [PATCH v2] keys: Fix UAF in key_put()
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2874580.1742399866.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Mar 2025 15:57:46 +0000
Message-ID: <2874581.1742399866@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

    =

Once a key's reference count has been reduced to 0, the garbage collector
thread may destroy it at any time and so key_put() is not allowed to touch
the key after that point.  The most key_put() is normally allowed to do is
to touch key_gc_work as that's a static global variable.

However, in an effort to speed up the reclamation of quota, this is now
done in key_put() once the key's usage is reduced to 0 - but now the code
is looking at the key after the deadline, which is forbidden.

Fix this by using a flag to indicate that a key can be gc'd now rather tha=
n
looking at the key's refcount in the garbage collector.

Fixes: 9578e327b2b4 ("keys: update key quotas in key_put()")
Reported-by: syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com
Signed-off-by: David Howells <dhowells@redhat.com>
Tested-by: syzbot+6105ffc1ded71d194d6d@syzkaller.appspotmail.com
cc: Jarkko Sakkinen <jarkko@kernel.org>
cc: Oleg Nesterov <oleg@redhat.com>
cc: Kees Cook <kees@kernel.org>
cc: Hillf Danton <hdanton@sina.com>,
cc: keyrings@vger.kernel.org
Cc: stable@vger.kernel.org # v6.10+
---
 include/linux/key.h |    1 +
 security/keys/gc.c  |    4 +++-
 security/keys/key.c |    2 ++
 3 files changed, 6 insertions(+), 1 deletion(-)

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


