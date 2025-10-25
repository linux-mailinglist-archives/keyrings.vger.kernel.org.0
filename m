Return-Path: <keyrings+bounces-3275-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD33C08EAD
	for <lists+keyrings@lfdr.de>; Sat, 25 Oct 2025 11:56:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1D4A3AF008
	for <lists+keyrings@lfdr.de>; Sat, 25 Oct 2025 09:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DACD2E7F3E;
	Sat, 25 Oct 2025 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="KUxXU7Tp"
X-Original-To: keyrings@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2911DE3DF
	for <keyrings@vger.kernel.org>; Sat, 25 Oct 2025 09:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761386158; cv=none; b=rSdW1V+iuCSS7YFc0VqyrD+W0aHHq2bFoiQw4JBf3Ofc9mmW6Whg9FSvpt8/OU8ynS5DWBMR1kUQt9GcUmokJtLDN+KOMe1flOZuykhPl+XTnh7lnew0t2zoBwPgC1diw8ttOCqiBAxx5FeW1WqmFpepbTG/K0VNpk4FxozesKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761386158; c=relaxed/simple;
	bh=LsIeYJ0IaSk91icRdNWcw+3GlqKmlaLIkttzeyXajMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LZDO0das6OlOapFcyBuRLATnjDGVd6Q7ACmZz8CXAC9WtUDXz4PtqptflYtFtZLVCejLZ548SVtBTcR+TEQmYhzawg7nqawrSzYjUq0SpLqvlMqRQc5CQVpSH8DRuy0VUbHC00vAuYvE0+cU5vbB3OAaNZ7r11nVDjjclQ2Q+yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=KUxXU7Tp; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761386144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WoJJKjJi2LQjMP2jbXzS14o3BnF8YeuXsVCA+1r7Fa8=;
	b=KUxXU7Tpnc1YQ9PlBN0GgilTOQ/8mFEXioIMkzSo6F+vH8zD1NvERj7/anoq7DkRDAysM4
	baowLPU14Hc+GFnCpYuSSZROw7fH/gcIm4csl9IyObSL+vfIh13dRJaaXdY/4boNgxjhpI
	ehbAW06i5B3YkTX8npqG3N/84keHN9o=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] keys: Fix typos in 'struct key_type' function pointer comments
Date: Sat, 25 Oct 2025 11:55:19 +0200
Message-ID: <20251025095519.84361-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

s/it/if/ and s/revokation/revocation/ and adjust the formatting to be
consistent with the other comments.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Adjust the trailing '*/' as suggested by Jarkko
- Link to v1: https://lore.kernel.org/lkml/20251016123619.98728-2-thorsten.blum@linux.dev/
---
 include/linux/key-type.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/key-type.h b/include/linux/key-type.h
index 5caf3ce82373..5dfda728ff69 100644
--- a/include/linux/key-type.h
+++ b/include/linux/key-type.h
@@ -107,11 +107,12 @@ struct key_type {
 	 */
 	int (*match_preparse)(struct key_match_data *match_data);
 
-	/* Free preparsed match data (optional).  This should be supplied it
-	 * ->match_preparse() is supplied. */
+	/* Free preparsed match data (optional).  This should be supplied if
+	 * ->match_preparse() is supplied.
+	 */
 	void (*match_free)(struct key_match_data *match_data);
 
-	/* clear some of the data from a key on revokation (optional)
+	/* clear some of the data from a key on revocation (optional)
 	 * - the key's semaphore will be write-locked by the caller
 	 */
 	void (*revoke)(struct key *key);
-- 
2.51.0


