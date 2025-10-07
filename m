Return-Path: <keyrings+bounces-3186-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC32CBC2715
	for <lists+keyrings@lfdr.de>; Tue, 07 Oct 2025 20:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14B8E3C799F
	for <lists+keyrings@lfdr.de>; Tue,  7 Oct 2025 18:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F122205E25;
	Tue,  7 Oct 2025 18:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="vBsOcaFY"
X-Original-To: keyrings@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B492E974E
	for <keyrings@vger.kernel.org>; Tue,  7 Oct 2025 18:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863187; cv=none; b=ZTYCAaVdLdbG2Urr0JH9hgE2aOyGVnhs7xQ5U8QfpRSEFUvqf1rHrUmF69JRA6YXhJeqkvwljCaPPuis1vPwML4kHB8kUAecag7yIBneXE1j5EwY+GD50Q8IfnA90kbql0CZtMkfGtMBXJRKdkXBRDmdwti7hrNK2B3ir13b680=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863187; c=relaxed/simple;
	bh=VjcQ9snlCIrom8Rz6k8Hv4oZY1ZBB5olqHrymGHJYPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z0wbx2ejBZaINB7mwR9/Vb35KzXwp7KhEYUj4uSBlaHLFxPECap8nntvB6gj2T7nf3PNWgPrNLc00yqEi63U6Jhqd0uWdECWV3GFOudP+5sJlUeHGj+TDOWevBZiiVeeB6pLLaXUPZXQnr/3zI/FznuOwTlNW5OMICqktxIq+PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=vBsOcaFY; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759863171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2chu4xPxUVESUFHAIrUBzbJKLu+9elYYBXUMSUiR5hA=;
	b=vBsOcaFY57uKxwfOW/zAKIX/TzlK/Tu0OhFSBdFyQqn+WiwhdRvMBWHlUO57DYtXRu5m97
	3fhk3qre+jfPIm1Tw6xAPNmt/kDjauCaHCwK+ieLlyImcw0Vkj11OClT6fHSpJ2w398IdS
	DdxQXFl4O9gruGfnEp33F2EpohQfNwA=
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
Subject: [PATCH 1/2] crypto: asymmetric_keys - prevent overflow in asymmetric_key_generate_id
Date: Tue,  7 Oct 2025 20:52:20 +0200
Message-ID: <20251007185220.234611-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use size_add() to prevent a potential integer overflow when adding the
binary blob lengths in asymmetric_key_generate_id(), which could cause a
buffer overflow when copying the data using memcpy().

Use struct_size() to calculate the number of bytes to allocate for the
new asymmetric key id.

No functional changes.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 crypto/asymmetric_keys/asymmetric_type.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index ba2d9d1ea235..aea925c88973 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -11,6 +11,7 @@
 #include <crypto/public_key.h>
 #include <linux/seq_file.h>
 #include <linux/module.h>
+#include <linux/overflow.h>
 #include <linux/slab.h>
 #include <linux/ctype.h>
 #include <keys/system_keyring.h>
@@ -141,12 +142,13 @@ struct asymmetric_key_id *asymmetric_key_generate_id(const void *val_1,
 						     size_t len_2)
 {
 	struct asymmetric_key_id *kid;
+	size_t len;
 
-	kid = kmalloc(sizeof(struct asymmetric_key_id) + len_1 + len_2,
-		      GFP_KERNEL);
+	len = size_add(len_1, len_2);
+	kid = kmalloc(struct_size(kid, data, len), GFP_KERNEL);
 	if (!kid)
 		return ERR_PTR(-ENOMEM);
-	kid->len = len_1 + len_2;
+	kid->len = len;
 	memcpy(kid->data, val_1, len_1);
 	memcpy(kid->data + len_1, val_2, len_2);
 	return kid;
-- 
2.51.0


