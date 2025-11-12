Return-Path: <keyrings+bounces-3338-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4644EC53BE3
	for <lists+keyrings@lfdr.de>; Wed, 12 Nov 2025 18:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7420B423238
	for <lists+keyrings@lfdr.de>; Wed, 12 Nov 2025 17:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D43F345739;
	Wed, 12 Nov 2025 17:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QUUHmyd/"
X-Original-To: keyrings@vger.kernel.org
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E35A345729
	for <keyrings@vger.kernel.org>; Wed, 12 Nov 2025 17:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762968419; cv=none; b=d34K39S+lhMfNlTo4zJi2LDzNYMM5hUNp4tL6RKAWEWVIFC8BgGmHtFHKVyk/ClR8SAQ90L3rRXFawye/JVtocz4XJe24OAgQ5ryMgIpVaBsvPsR0kgGDzhDDu0d9UiGK6UhSryPRAvbKNN7xeCGcBOcITDB5kxkua1Wh0NpIoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762968419; c=relaxed/simple;
	bh=Vww80A/tmPmtlGgln5DXCkTxy836HcNmtk+7zPO6H60=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ccu2ymf+TlY0n0yLQxbyHsvJh/7VYjit58EV16yfke5GQfrhwzQgF4O0+jUv2UCVyt0d1RIjhg8J2WuOxFdYT4hNzHCIApDnb2j7WJjTUpKfotJeqMb8Hi6MPcox1wPPkc3qUgzfbX1H2O/tRZdBUeZ2CgvoXuKtAwHmOHdJ12Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QUUHmyd/; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762968415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Vw+aWUqyEnl9n5yqdS3oYeHCoeQauABP394dxgMfzUY=;
	b=QUUHmyd/5tAWR0FQBPuySPzvW6XNgvqHZl9b3SVLUqO8EHK/+PXRDMguZxRrWREUTg0Jhh
	YvGDEGdGs7tbrNCClAIvmFwjYs25UafE4BpKmtlh/7fcz6EvIiC4GqWDWl1FiSdg37DcY7
	zfXhsuXVgCfBNppzt4++EjI+TjU0MhU=
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
Subject: [PATCH] keys: Replace memcpy with strscpy in proc_keys_show
Date: Wed, 12 Nov 2025 18:26:21 +0100
Message-ID: <20251112172620.4254-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use strscpy() to copy strings into the fixed-size buffer 'xbuf' instead
of hardcoding the number of bytes to copy. This improves maintainability
and ensures the buffer is always NUL-terminated.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 security/keys/proc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/security/keys/proc.c b/security/keys/proc.c
index 4f4e2c1824f1..1d380766f45d 100644
--- a/security/keys/proc.c
+++ b/security/keys/proc.c
@@ -10,6 +10,7 @@
 #include <linux/fs.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
+#include <linux/string.h>
 #include <asm/errno.h>
 #include "internal.h"
 
@@ -199,9 +200,9 @@ static int proc_keys_show(struct seq_file *m, void *v)
 	/* come up with a suitable timeout value */
 	expiry = READ_ONCE(key->expiry);
 	if (expiry == TIME64_MAX) {
-		memcpy(xbuf, "perm", 5);
+		strscpy(xbuf, "perm");
 	} else if (now >= expiry) {
-		memcpy(xbuf, "expd", 5);
+		strscpy(xbuf, "expd");
 	} else {
 		timo = expiry - now;
 
-- 
2.51.0


