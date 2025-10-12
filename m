Return-Path: <keyrings+bounces-3209-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95BC7BD0C13
	for <lists+keyrings@lfdr.de>; Sun, 12 Oct 2025 22:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D52111896B00
	for <lists+keyrings@lfdr.de>; Sun, 12 Oct 2025 20:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FF622CBD9;
	Sun, 12 Oct 2025 20:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ENJ3H1/D"
X-Original-To: keyrings@vger.kernel.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DAC21ADB7
	for <keyrings@vger.kernel.org>; Sun, 12 Oct 2025 20:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760301550; cv=none; b=MLZEvwSv7yTXsq0N+6CKyZMO7UUOwqknouGa49nCzOjBbqoK7QzUwHeKArceFWtm9QgTU4538xLKjd3s9tAmJPPkpC7Tm6jBwP+cQyLPKxzFsH5+XMMpvOiJXNhCAUHcCzNXFxgDdyMBkIzOM/1GiVzX1cavuEsvDwZPcgMWZ/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760301550; c=relaxed/simple;
	bh=lXpCMeLAuG7JE8yPh1RARhwCCjUzt/EJoeAJ9PZU5cI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HmgPD1LNCzEctq4KYWyTGrnk7/Vlbh53A5OK2qxD2V5ePj4CbftUS9MC4aLDTmJAUjp8HGGkmQt3JihTkCH2RRrH5HRByCxQFsEm3ri2EyZe6Mkv5TwrGUW3W8gdn2AEvIu86pTmDGb5VeIDKX7re9feL72M3n33jZMfaytfyI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ENJ3H1/D; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1760301544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Wa+ZvF07uqoBdmRF0RsswANJIIDhlDOXe9AbX7GaHgo=;
	b=ENJ3H1/DP9HbQdOto0jsi9bacB5f3LPrpTKm8Gcj48TdveEsWHQAZcDTV6DQe+ShTApZBA
	iub0wV6kYrta41n0drGCuNYIWGTp/y17e2wroCuaVx1V9TmtwhNC9OITZBTnjk6VMCTvmi
	9+/V2+nTv8UFDeLTdJl/Dzf+LpbxoFQ=
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
Subject: [PATCH v2 2/2] crypto: asymmetric_keys - simplify asymmetric_key_hex_to_key_id
Date: Sun, 12 Oct 2025 22:38:41 +0200
Message-ID: <20251012203841.60230-2-thorsten.blum@linux.dev>
In-Reply-To: <20251012203841.60230-1-thorsten.blum@linux.dev>
References: <20251012203841.60230-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use struct_size() to calculate the number of bytes to allocate for the
asymmetric key id. Add a local variable to store the hex data length
instead of recalculating it.

Return and forward the error code from __asymmetric_key_hex_to_key_id()
directly instead of manually returning -EINVAL.

No functional change.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Keep 'ret' and forward the errno from __asymmetric_key_hex_to_key_id()
  as suggested by Lukas
- Link to v1: https://lore.kernel.org/lkml/20251007185220.234611-3-thorsten.blum@linux.dev/
---
 crypto/asymmetric_keys/asymmetric_type.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index bd96f799757d..abd5cf419f83 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -229,6 +229,7 @@ struct asymmetric_key_id *asymmetric_key_hex_to_key_id(const char *id)
 {
 	struct asymmetric_key_id *match_id;
 	size_t asciihexlen;
+	size_t hexlen;
 	int ret;
 
 	if (!*id)
@@ -237,14 +238,14 @@ struct asymmetric_key_id *asymmetric_key_hex_to_key_id(const char *id)
 	if (asciihexlen & 1)
 		return ERR_PTR(-EINVAL);
 
-	match_id = kmalloc(sizeof(struct asymmetric_key_id) + asciihexlen / 2,
-			   GFP_KERNEL);
+	hexlen = asciihexlen / 2;
+	match_id = kmalloc(struct_size(match_id, data, hexlen), GFP_KERNEL);
 	if (!match_id)
 		return ERR_PTR(-ENOMEM);
-	ret = __asymmetric_key_hex_to_key_id(id, match_id, asciihexlen / 2);
+	ret = __asymmetric_key_hex_to_key_id(id, match_id, hexlen);
 	if (ret < 0) {
 		kfree(match_id);
-		return ERR_PTR(-EINVAL);
+		return ERR_PTR(ret);
 	}
 	return match_id;
 }
-- 
2.51.0


