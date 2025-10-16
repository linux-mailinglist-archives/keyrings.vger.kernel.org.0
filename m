Return-Path: <keyrings+bounces-3224-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AE7BE36CA
	for <lists+keyrings@lfdr.de>; Thu, 16 Oct 2025 14:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E78619C7668
	for <lists+keyrings@lfdr.de>; Thu, 16 Oct 2025 12:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32C1B32D452;
	Thu, 16 Oct 2025 12:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LTYERUt6"
X-Original-To: keyrings@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3948530EF69;
	Thu, 16 Oct 2025 12:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760618216; cv=none; b=sXA7nRyvIDtajdbEuaZuY2mt3gHizyUDuPqgCrgQOGL4H623JheONld/QzBusFXPZuvBNlDd+0ubcpyoglj7Y7wEaPIUuxYf/wF1L0P4hN6SEfSjynn64jrsFDxYhjdk/5uCaLST0QQ14P5w04LHRDKI2MC5azukudw3SxSPVMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760618216; c=relaxed/simple;
	bh=7c9eMXHeGqJcw7KNa8kwwC0fT9mvAlHas4yGf0VKIJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hUNm2guud55AUvbV5NQvQ3lE90UFZltDvo+CiukxBMBRdzQwN5Jdx0GguVlXk3A+l3xEbOWBTaK5XA3JdLND88kUTyo0ji2SfezUE2UR1PmN19V613n+1LniK+RlhjCz3WJloPnxmCO4fbRiiKsv1vuv6HoCnvojp/fCaQupKvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LTYERUt6; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760618210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=06z0G05KtkWaNEEmKf+OciiLQUFcgpHCIAOW7CAuQrA=;
	b=LTYERUt6/QwXQ5jP3Qm+gcCsypgqiPhKqPKEr/79ZE4lKF2DVifh834mVmU+rAp0yOglaT
	MyTWwFqQ5VUDXC930Mz3U6QzyoASEthciuZbfzaCE5NdQkNEuPVmemHyjx0OxalAQLj398
	EORzfIolIQFImi7KiwNahaxy5uuMi5c=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] keys: Fix typos in 'struct key_type' function pointer comments
Date: Thu, 16 Oct 2025 14:36:19 +0200
Message-ID: <20251016123619.98728-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

s/it/if/ and s/revokation/revocation/

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 include/linux/key-type.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/key-type.h b/include/linux/key-type.h
index 5caf3ce82373..5eb2e64803db 100644
--- a/include/linux/key-type.h
+++ b/include/linux/key-type.h
@@ -107,11 +107,11 @@ struct key_type {
 	 */
 	int (*match_preparse)(struct key_match_data *match_data);
 
-	/* Free preparsed match data (optional).  This should be supplied it
+	/* Free preparsed match data (optional).  This should be supplied if
 	 * ->match_preparse() is supplied. */
 	void (*match_free)(struct key_match_data *match_data);
 
-	/* clear some of the data from a key on revokation (optional)
+	/* clear some of the data from a key on revocation (optional)
 	 * - the key's semaphore will be write-locked by the caller
 	 */
 	void (*revoke)(struct key *key);
-- 
2.51.0


