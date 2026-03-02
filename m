Return-Path: <keyrings+bounces-4096-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDB4FFxxpWlXAgYAu9opvQ
	(envelope-from <keyrings+bounces-4096-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 02 Mar 2026 12:15:40 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D791B1D74C6
	for <lists+keyrings@lfdr.de>; Mon, 02 Mar 2026 12:15:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB8FC3040762
	for <lists+keyrings@lfdr.de>; Mon,  2 Mar 2026 11:14:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6559361654;
	Mon,  2 Mar 2026 11:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Xa5dDV0d"
X-Original-To: keyrings@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7120F3603DD
	for <keyrings@vger.kernel.org>; Mon,  2 Mar 2026 11:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772450051; cv=none; b=VCPvycrCNwobRlTzTdLiMCuS6PLADlYgLY7GD3/hHlWMuAiOOlhyAyMbLEYlFul3H/H1ZPe8riLdX2JEx5J/ipcSGWgumXfvFQU4gh4PEzkQ1/uKoBxIawIsTWA1A7oCBSjGtWI2Uc549argXXpCuEqgb5O7pl+0T9rhaPbQFH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772450051; c=relaxed/simple;
	bh=+WEC8vLIaaBu4jRcRDa/Q2GRe9zxcjW5PMMWhfsd128=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aEihGz7MHqcq46j63p8ZvrTU0JKWB3tGGQb22xXseaaRY0a5zJOrOcK1qHoAFbOtm6zDjWudPR0DJrD8DlKs/24JuTzE2f2Vz9LVaOGufPXli1KCvWIT8TfmptaYiNQB7BRsSBP+E0IW78TYVgRuTqJC0sIuevef+absPe6RAwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Xa5dDV0d; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772450048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4L7492MiqYQDrnPN0WkcKH0FrZ/kIDJ3QODz609KDV0=;
	b=Xa5dDV0dQzOqnNoXHEM1OttefGZe+yp/hvpWslhbtT+ODZY3SkKHL3WuQxt10RegiBMyk2
	ZgliWBUuECtAtu1S9g67oZjRajvovkTGC1P41jUIZeZjnvh7xvp/GkIMKBkPlMkHZs1nvJ
	103T16+DxMGNcC7j9KhWvP9P86mYOOs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: linux-hardening@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] keys: Use kmalloc_flex() to improve user_preparse()
Date: Mon,  2 Mar 2026 12:13:11 +0100
Message-ID: <20260302111309.937726-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4096-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[keyrings];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,linux.dev:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D791B1D74C6
X-Rspamd-Action: no action

Use kmalloc_flex() when allocating a new 'struct user_key_payload' in
user_preparse() to replace the open-coded size arithmetic and to keep
the size type-safe.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 security/keys/user_defined.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/user_defined.c b/security/keys/user_defined.c
index 686d56e4cc85..6f88b507f927 100644
--- a/security/keys/user_defined.c
+++ b/security/keys/user_defined.c
@@ -64,7 +64,7 @@ int user_preparse(struct key_preparsed_payload *prep)
 	if (datalen == 0 || datalen > 32767 || !prep->data)
 		return -EINVAL;
 
-	upayload = kmalloc(sizeof(*upayload) + datalen, GFP_KERNEL);
+	upayload = kmalloc_flex(*upayload, data, datalen);
 	if (!upayload)
 		return -ENOMEM;
 
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


