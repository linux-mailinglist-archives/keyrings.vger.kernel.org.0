Return-Path: <keyrings+bounces-230-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 832A4807329
	for <lists+keyrings@lfdr.de>; Wed,  6 Dec 2023 15:57:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B308E1C20A9F
	for <lists+keyrings@lfdr.de>; Wed,  6 Dec 2023 14:57:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F04E63EA71;
	Wed,  6 Dec 2023 14:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aKenJujc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="h+/H8r6W"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2a07:de40:b251:101:10:150:64:2])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4ED3B5;
	Wed,  6 Dec 2023 06:57:49 -0800 (PST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 95C2E1FD16;
	Wed,  6 Dec 2023 14:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1701874667; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W1iEqONk/zbDaDJmdYP4h1bjI7CKaBWSU7dA6BrXLIg=;
	b=aKenJujcJEApG75yiRDSuPOBECArFJf9/amlfRfD4veoUrSAx7mX9tyjh+Pfoupm4/Q2CW
	AK8eNokOXNKRT1Ve4KZFkVnWUvZ3NhCovynNnW8VDZuR38IBlIpwMWT63Sj0X0bdt0DR62
	3WOadVDrCxisHF5JdmDQPJ3gTMdo2bU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1701874667;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=W1iEqONk/zbDaDJmdYP4h1bjI7CKaBWSU7dA6BrXLIg=;
	b=h+/H8r6WaarZ8hA9GAXKZE4KL0Yf9Jw4qxX9HzieBFF2CDicFgo/PgpkQxaYPfNuiR+2KQ
	xE/C0m+ddCjMixDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3117136CD;
	Wed,  6 Dec 2023 14:57:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id vt8jLuqLcGVBQgAAD6G6ig
	(envelope-from <lhenriques@suse.de>); Wed, 06 Dec 2023 14:57:46 +0000
Received: from localhost (brahms.olymp [local])
	by brahms.olymp (OpenSMTPD) with ESMTPA id 653c8557;
	Wed, 6 Dec 2023 14:57:45 +0000 (UTC)
From: Luis Henriques <lhenriques@suse.de>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>
Cc: keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Henriques <lhenriques@suse.de>
Subject: [RFC PATCH] keys: flush work when accessing /proc/key-users
Date: Wed,  6 Dec 2023 14:57:44 +0000
Message-ID: <20231206145744.17277-1-lhenriques@suse.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Score: 1.70
X-Spamd-Result: default: False [1.70 / 50.00];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCPT_COUNT_FIVE(0.00)[6];
	 RCVD_COUNT_THREE(0.00)[4];
	 NEURAL_HAM_SHORT(-0.20)[-1.000];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 BAYES_HAM(-3.00)[100.00%];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com]

Make sure the garbage collector has been run before cycling through all
the user keys.

Signed-off-by: Luis Henriques <lhenriques@suse.de>
---
Hi!

This patch is mostly for getting some feedback on how to fix an fstest
failing for ext4/fscrypt (generic/581).  Basically, the test relies on the
data read from /proc/key-users to be up-to-date regarding the number of
keys a given user currently has.  However, this file can't be trusted
because it races against the keys GC.

Using flush_work() seems to work (I can't reproduce the failure), but it
may be overkill.  Or simply not acceptable.  Maybe, as Eric suggested
elsewhere [1], there could be a synchronous key_put/revoke/invalidate/...,
which would wait for the key GC to do its work, although that probably
would require some more code re-work.

[1] https://lore.kernel.org/all/20231128173734.GD1148@sol.localdomain/

 security/keys/gc.c       | 6 ++++++
 security/keys/internal.h | 1 +
 security/keys/proc.c     | 1 +
 3 files changed, 8 insertions(+)

diff --git a/security/keys/gc.c b/security/keys/gc.c
index 3c90807476eb..57b5a54490a0 100644
--- a/security/keys/gc.c
+++ b/security/keys/gc.c
@@ -44,6 +44,12 @@ struct key_type key_type_dead = {
 	.name = ".dead",
 };
 
+void key_flush_gc(void)
+{
+	kenter("");
+	flush_work(&key_gc_work);
+}
+
 /*
  * Schedule a garbage collection run.
  * - time precision isn't particularly important
diff --git a/security/keys/internal.h b/security/keys/internal.h
index 471cf36dedc0..fee1d0025d96 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -170,6 +170,7 @@ extern void keyring_restriction_gc(struct key *keyring,
 extern void key_schedule_gc(time64_t gc_at);
 extern void key_schedule_gc_links(void);
 extern void key_gc_keytype(struct key_type *ktype);
+extern void key_flush_gc(void);
 
 extern int key_task_permission(const key_ref_t key_ref,
 			       const struct cred *cred,
diff --git a/security/keys/proc.c b/security/keys/proc.c
index d0cde6685627..2837e00a240a 100644
--- a/security/keys/proc.c
+++ b/security/keys/proc.c
@@ -277,6 +277,7 @@ static void *proc_key_users_start(struct seq_file *p, loff_t *_pos)
 	struct rb_node *_p;
 	loff_t pos = *_pos;
 
+	key_flush_gc();
 	spin_lock(&key_user_lock);
 
 	_p = key_user_first(seq_user_ns(p), &key_user_tree);

