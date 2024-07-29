Return-Path: <keyrings+bounces-1818-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7971093F601
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 14:59:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22D9D1F22477
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 12:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DEB114A0AE;
	Mon, 29 Jul 2024 12:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="AhqHR+ii"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCABC148826
	for <keyrings@vger.kernel.org>; Mon, 29 Jul 2024 12:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722257955; cv=none; b=U3s6/CJ5VQUVTAzDpwH6yWRwrO+WREme1tAdpQYXGavYy304ZkF2B0sWr3FVzzBmYwZciXOlcs4Kw0KtY9UK+ceHJmIF9vDmJTElDkMbu1J6uH0/jO+hpblGiNcFiSJYHmhWmn6WqM/hlQrJwW1jCZ2BV0Yi1SpwZNMewfTM9Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722257955; c=relaxed/simple;
	bh=XKlc+8CoEMY68SA5HD1dhDI2QZ6bqbXTxL8bJTXP9hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FX7mRJg0zdY7fI2vbNHXzkv+KuRUXCQkA+PHK2m1GsoDTYUjLmfmwKvUbqCggM3PvaquW72vLkJcuxh9/daRw08d6Z+yWEJhaD5GFHb017DZ+6aFJHf/cX++V/4lhmC3764mYYjJ0pynTG2Uou1dYNIT4ks79zQ8pqn0Y75ycGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=AhqHR+ii; arc=none smtp.client-ip=185.125.25.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Received: from smtp-4-0001.mail.infomaniak.ch (smtp-4-0001.mail.infomaniak.ch [10.7.10.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4WXdj422JYzVL3;
	Mon, 29 Jul 2024 14:59:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1722257944;
	bh=8o4uEwOWvS/IvVBdL4/r7RNFUAox5TLdYs6gG1vGhNw=;
	h=From:To:Cc:Subject:Date:From;
	b=AhqHR+iibp0LjZzsZbjZq375eAvCBEWiV3MnaYwIGbug0amZd59JD84Ntcj6rtjQz
	 qSVEnep2nrA3Itccm29AHZr44fbnQnQmNT3yaX/sJYAn8T0/3+XodIcOCXff76icHI
	 zmY+6iczo5/F5ewctOx87Bz8GUrfW+gk8t2XAr3A=
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4WXdj33Z78zB8T;
	Mon, 29 Jul 2024 14:59:03 +0200 (CEST)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	James Morris <jmorris@namei.org>,
	Jann Horn <jannh@google.com>,
	Kees Cook <kees@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: [PATCH v1] keys: Restrict KEYCTL_SESSION_TO_PARENT according to ptrace_may_access()
Date: Mon, 29 Jul 2024 14:58:46 +0200
Message-ID: <20240729125846.1043211-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

A process can modify its parent's credentials with
KEYCTL_SESSION_TO_PARENT when their EUID and EGID are the same.  This
doesn't take into account all possible access controls.

Enforce the same access checks as for impersonating a process.

The current credentials checks are untouch because they check against
EUID and EGID, whereas ptrace_may_access() checks against UID and GID.

Cc: David Howells <dhowells@redhat.com>
Cc: Günther Noack <gnoack@google.com>
Cc: James Morris <jmorris@namei.org>
Cc: Jann Horn <jannh@google.com>
Cc: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Kees Cook <kees@kernel.org>
Cc: Paul Moore <paul@paul-moore.com>
Fixes: ee18d64c1f63 ("KEYS: Add a keyctl to install a process's session keyring on its parent [try #6]")
Signed-off-by: Mickaël Salaün <mic@digikod.net>
Link: https://lore.kernel.org/r/20240729125846.1043211-1-mic@digikod.net
---
 security/keys/keyctl.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/security/keys/keyctl.c b/security/keys/keyctl.c
index ab927a142f51..511bf79fa14c 100644
--- a/security/keys/keyctl.c
+++ b/security/keys/keyctl.c
@@ -21,6 +21,7 @@
 #include <linux/security.h>
 #include <linux/uio.h>
 #include <linux/uaccess.h>
+#include <linux/ptrace.h>
 #include <keys/request_key_auth-type.h>
 #include "internal.h"
 
@@ -1687,6 +1688,10 @@ long keyctl_session_to_parent(void)
 	    !gid_eq(pcred->sgid, mycred->egid))
 		goto unlock;
 
+	/* The child must be allowed to impersonate its parent process. */
+	if (!ptrace_may_access(parent, PTRACE_MODE_ATTACH_REALCREDS))
+		goto unlock;
+
 	/* the keyrings must have the same UID */
 	if ((pcred->session_keyring &&
 	     !uid_eq(pcred->session_keyring->uid, mycred->euid)) ||

base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
-- 
2.45.2


