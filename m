Return-Path: <keyrings+bounces-2590-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E15AA7D7B5
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 10:24:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 714741890C85
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 08:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59CCC226D0C;
	Mon,  7 Apr 2025 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IjhwgFB5"
X-Original-To: keyrings@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6F8212B14
	for <keyrings@vger.kernel.org>; Mon,  7 Apr 2025 08:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014225; cv=none; b=QFbk0YpS3P9TDMKeSiRp75ItrXgUxiChj6iEMM7KFjlnQl0EujMvkgDmKBW1mAYkPLzS42D8WtwbSt2r32SzNuiAQkMiGlPpzOQAwYbwQ8O+xOxPe/cC3t1ZsXwI90D+3CGuY7DYwMmox1kkqtKJkfXIjSnqtthNJ+gu6WWGccg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014225; c=relaxed/simple;
	bh=gTK8e1XfS4BWfkRxxIpCzpIg4kO5jqWt0RsRG9KsV5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=axPN0d+ljPBdDg9LTSSVJdhveYXf16qehmtrywZpmzjqNmHPX3b7aq3g240s3g0TLAaeLq1xfK/la0pHT/Af1PbA3kGiSDKOqQHtWJnClAv+Q2fxgvSfCbUm7RyVLBTd9wUkqSbvhTQHL78EnryoU5aVpZxEerx3UcaHOZug2Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IjhwgFB5; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744014211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kIYcMfCxcDbgrdjbytVwAHyym3Acp6ysa9rwtkKANwA=;
	b=IjhwgFB54PY+PS45BCUrL1D/IV8HnDNgSHUvvT88n1vyka8blQldCo+BcDah5+t0Xs8HeX
	lcI5R5GowUtHc2UmdtsWqziYMHd6TZTxddLpM/6zG4m0z9YQ4ObrgMC/gZIUmISodzoH6R
	Fh3dhkI3lDQ5viRFNB4KZaJI0WGFs9c=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: David Howells <dhowells@redhat.com>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] crypto: x509 - Replace kmalloc() + NUL-termination with kzalloc()
Date: Mon,  7 Apr 2025 10:22:47 +0200
Message-ID: <20250407082247.741684-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use kzalloc() to zero out the one-element array instead of using
kmalloc() followed by a manual NUL-termination.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index ee2fdab42334..2ffe4ae90bea 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -372,10 +372,9 @@ static int x509_fabricate_name(struct x509_parse_context *ctx, size_t hdrlen,
 
 	/* Empty name string if no material */
 	if (!ctx->cn_size && !ctx->o_size && !ctx->email_size) {
-		buffer = kmalloc(1, GFP_KERNEL);
+		buffer = kzalloc(1, GFP_KERNEL);
 		if (!buffer)
 			return -ENOMEM;
-		buffer[0] = 0;
 		goto done;
 	}
 
-- 
2.49.0


