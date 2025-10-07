Return-Path: <keyrings+bounces-3185-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D94A9BC270C
	for <lists+keyrings@lfdr.de>; Tue, 07 Oct 2025 20:53:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 497A3189B337
	for <lists+keyrings@lfdr.de>; Tue,  7 Oct 2025 18:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A88A92E9EAA;
	Tue,  7 Oct 2025 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="c/qh2+xB"
X-Original-To: keyrings@vger.kernel.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799DB2E8DF7
	for <keyrings@vger.kernel.org>; Tue,  7 Oct 2025 18:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863178; cv=none; b=OYsSiJTOsxpzfJm2geaa1t2OkeOPGm4urtbqOT0c5WUE1cfvExYNVMmbJOQcerw8OXSRRE5MyiiuvwoM4DWEcthYEg22yo2YRUHRYY3aYw7Wpod+k+OPWhfMIPr0dqgwtygUojrD2F5iAr/agDRPYirccIAZwKdrlL3v3IeS39U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863178; c=relaxed/simple;
	bh=4m44Ymet5W/5/uIvPoZ02pG/bxDo49W6g7xko/lB0ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRCHyhJ7ltms81YEfXHasZ2Vyb47T01Zl+yr3Bp0pmUFIR8WjrhOjXPxsDTaJqoWTJC2Mtb9GAQpzvL5kMs/DNPswQqgTeqBDk1i5rwa/7Ogw4URjqA5m7fk16Ky8/HVhiWogIlYz2LEaqoWXnEsLaQFS52NELBOS5kZL2n05U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=c/qh2+xB; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759863174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZtvehMqki1j4i5SsYl1BCYkhBIs55uGz0PHlwImo8Q8=;
	b=c/qh2+xBTtl8IoDIk0w0aI+8c2xsh2E0v+wvBTDpOp4D64cYgx30VjaN7TN6veXH+qNYno
	BlPURXDUGeeaZ1FR/Xr0KveaqhGgBQi4iYtl0NbstkD5Vu2cltee6YeE1TlvAZWq2VA7yF
	6YH68CK+VEwsl9j8ZHwRxUwqPFoTbbc=
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
Subject: [PATCH 2/2] crypto: asymmetric_keys - simplify asymmetric_key_hex_to_key_id
Date: Tue,  7 Oct 2025 20:52:21 +0200
Message-ID: <20251007185220.234611-3-thorsten.blum@linux.dev>
In-Reply-To: <20251007185220.234611-2-thorsten.blum@linux.dev>
References: <20251007185220.234611-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use struct_size() to calculate the number of bytes to allocate for the
asymmetric key id.  Add a local variable to store the hex data length
instead of recalculating it.

The variable 'ret', whose name implies a return variable, is only used
to temporarily store the result of __asymmetric_key_hex_to_key_id(). Use
the result directly and remove the local variable.

No functional changes.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 crypto/asymmetric_keys/asymmetric_type.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index aea925c88973..b73b8b983bfa 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -228,7 +228,7 @@ struct asymmetric_key_id *asymmetric_key_hex_to_key_id(const char *id)
 {
 	struct asymmetric_key_id *match_id;
 	size_t asciihexlen;
-	int ret;
+	size_t hexlen;
 
 	if (!*id)
 		return ERR_PTR(-EINVAL);
@@ -236,12 +236,11 @@ struct asymmetric_key_id *asymmetric_key_hex_to_key_id(const char *id)
 	if (asciihexlen & 1)
 		return ERR_PTR(-EINVAL);
 
-	match_id = kmalloc(sizeof(struct asymmetric_key_id) + asciihexlen / 2,
-			   GFP_KERNEL);
+	hexlen = asciihexlen / 2;
+	match_id = kmalloc(struct_size(match_id, data, hexlen), GFP_KERNEL);
 	if (!match_id)
 		return ERR_PTR(-ENOMEM);
-	ret = __asymmetric_key_hex_to_key_id(id, match_id, asciihexlen / 2);
-	if (ret < 0) {
+	if (__asymmetric_key_hex_to_key_id(id, match_id, hexlen) < 0) {
 		kfree(match_id);
 		return ERR_PTR(-EINVAL);
 	}
-- 
2.51.0


