Return-Path: <keyrings+bounces-4095-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eMPAHDO5omnX5AQAu9opvQ
	(envelope-from <keyrings+bounces-4095-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sat, 28 Feb 2026 10:45:23 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 147B51C1CAB
	for <lists+keyrings@lfdr.de>; Sat, 28 Feb 2026 10:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 62A4E303BF71
	for <lists+keyrings@lfdr.de>; Sat, 28 Feb 2026 09:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7954940F8E0;
	Sat, 28 Feb 2026 09:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JaMvbNE/"
X-Original-To: keyrings@vger.kernel.org
Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C701340B6EA
	for <keyrings@vger.kernel.org>; Sat, 28 Feb 2026 09:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772271911; cv=none; b=SqMtIOvLhclNWhRLvI1xU6WgO2y0XopcCQqaIj6kbx5y35FOmMhyHp1c2DzYNar1XsmmqaXi7Sy/m4mvh7FsMdIF4ZgfRMUAn2ZM4W6OwIdiBxNuA8PsYnmUOmV3j/sSk338I5MhUvYEdYV2//ptN/0KqdjUJxB7T6b+blAUq9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772271911; c=relaxed/simple;
	bh=BbBnzLzIVKCMk5bpR05I6NthxRYeyQFEVvHu5rxo4FI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nUFOwWNVdLyfLrJBim9W0t9g4AF2tpsbxsltRP623hCvsWYwmee2Ftn3yTMnxQaNjrId9v5svSF0d9fMFuu2trqETjjvYxBjXIs+wDFVUjbuCVjnWVdjIce3tL1h9TZaCod+HnqLGnn8BtTCjELs8TDFG3WwU+aAWTj0YKN1Vsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JaMvbNE/; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772271897;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+IWRKGe07FbN2ZKZYmIp9gPYUSJKqCBN8aB5e4C9Dx0=;
	b=JaMvbNE/jgJoH/5QX26jITNLTCf59yat0XVXf4pO3cUcHy4PE8/IWGzAUn8Tkt+k6CFt4L
	Gs/tCd/SXQvU2lglshunoUvoQNzftIEaB9x716y7IIfY0zv1PfexGgpKEorCYl6i6O511p
	gNpXJnugu55R6oYVGChQ0nOT/IY+j6U=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] keys: Remove return variable and length check to simplify user_read
Date: Sat, 28 Feb 2026 10:44:46 +0100
Message-ID: <20260228094447.869637-1-thorsten.blum@linux.dev>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-4095-lists,keyrings=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thorsten.blum@linux.dev,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[keyrings];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 147B51C1CAB
X-Rspamd-Action: no action

In user_read(), remove the unnecessary return variable 'ret' and return
->datalen directly. Drop the redundant 'buflen > 0' check and use min()
to determine the number of bytes to copy.  No functional changes.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 security/keys/user_defined.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/security/keys/user_defined.c b/security/keys/user_defined.c
index 6f88b507f927..b53e063272c2 100644
--- a/security/keys/user_defined.c
+++ b/security/keys/user_defined.c
@@ -171,20 +171,14 @@ EXPORT_SYMBOL_GPL(user_describe);
 long user_read(const struct key *key, char *buffer, size_t buflen)
 {
 	const struct user_key_payload *upayload;
-	long ret;
 
 	upayload = user_key_payload_locked(key);
-	ret = upayload->datalen;
 
 	/* we can return the data as is */
-	if (buffer && buflen > 0) {
-		if (buflen > upayload->datalen)
-			buflen = upayload->datalen;
+	if (buffer)
+		memcpy(buffer, upayload->data, min(buflen, upayload->datalen));
 
-		memcpy(buffer, upayload->data, buflen);
-	}
-
-	return ret;
+	return upayload->datalen;
 }
 
 EXPORT_SYMBOL_GPL(user_read);
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


