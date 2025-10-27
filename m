Return-Path: <keyrings+bounces-3284-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AB2C11B87
	for <lists+keyrings@lfdr.de>; Mon, 27 Oct 2025 23:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1F971A28594
	for <lists+keyrings@lfdr.de>; Mon, 27 Oct 2025 22:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F10ED2F12A0;
	Mon, 27 Oct 2025 22:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uMyl8VTG"
X-Original-To: keyrings@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97A72E54BC
	for <keyrings@vger.kernel.org>; Mon, 27 Oct 2025 22:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604419; cv=none; b=CTN2Fir1NmslkvFnyFthLDDw5XJlxMRY+hY1cW2zkya7TojbXhgorTT5QFVZf1HF1vNbIp2nFKpRJLau+42AZAbsze7YC9imN4z9DqHm5hoVUgA4SyIoPXe8FfBkF4PY/mzkqAeRQwfE2b5NF18kzhwwlf+iPQ3p40VD6DiIVCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604419; c=relaxed/simple;
	bh=oSl6XxwG23+IDZ+qeuPsSWZMvKhnBUnSCRxaDztoGdU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M7hGa68IhrNLkIed8xUYb/XxfEvG8FrAvIAPzf4CSCp807RMvZa33OM0bp8bh7kKUxbf4/s+oWt9jfbU5hKXVb5+ZaqZg4EJzQM/y/4V6/fVuie2zX7J5CmBPEnr0MvNhH6N+gZOotKyWJL3W3/kN33MilVS3zC2hhXUzoJLeEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uMyl8VTG; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761604413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Rz80D0a4L8SFtmWZzMuQItK6P07V66/wgh+8udb40jQ=;
	b=uMyl8VTGHvzeGx6FaDa2se7MruK3zMsDW8oCVqqCQ9gfF/BzOp7f172txgpR230ih3y6Rp
	w1Kz80336t5SyT0i729O84U6BOACA6DoeVBQl5WSDZB1uh+MeDYegYCaaxv0bNZ347dDlT
	/9GvWEtB+/o513j7ksvsJuRxYpqF0wY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] keys: Fix grammar and formatting in 'struct key_type' comments
Date: Mon, 27 Oct 2025 23:33:00 +0100
Message-ID: <20251027223259.190625-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

s/it/if/ and s/revokation/revocation/, capitalize "clear", and add a
period after the sentence. Fix the comment formatting.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v3:
- Capitalize "clear", add a period, and fix comment formatting (Jarkko)
- Link to v2: https://lore.kernel.org/lkml/20251025095519.84361-1-thorsten.blum@linux.dev/

Changes in v2:
- Adjust the trailing '*/' as suggested by Jarkko
- Link to v1: https://lore.kernel.org/lkml/20251016123619.98728-2-thorsten.blum@linux.dev/
---
 include/linux/key-type.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/include/linux/key-type.h b/include/linux/key-type.h
index 5caf3ce82373..bb97bd3e5af4 100644
--- a/include/linux/key-type.h
+++ b/include/linux/key-type.h
@@ -107,11 +107,14 @@ struct key_type {
 	 */
 	int (*match_preparse)(struct key_match_data *match_data);
 
-	/* Free preparsed match data (optional).  This should be supplied it
-	 * ->match_preparse() is supplied. */
+	/*
+	 * Free preparsed match data (optional).  This should be supplied if
+	 * ->match_preparse() is supplied.
+	 */
 	void (*match_free)(struct key_match_data *match_data);
 
-	/* clear some of the data from a key on revokation (optional)
+	/*
+	 * Clear some of the data from a key on revocation (optional).
 	 * - the key's semaphore will be write-locked by the caller
 	 */
 	void (*revoke)(struct key *key);
-- 
2.51.0


