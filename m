Return-Path: <keyrings+bounces-1959-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5419C973B30
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F28D61F2216B
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8693196D9D;
	Tue, 10 Sep 2024 15:13:33 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634F31953BD;
	Tue, 10 Sep 2024 15:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981213; cv=none; b=cviKcr7CvsWDf3FGhAgoSQFdK/AJo0PiYjN5O/lxN+KqNc2T4W5B73QrjN86l0anvqGWo16FCPsDwE2S/XoN7mjlTvlM+E5KNdlSb191Z2yJqt1/ysFfetyzsIDxWzeWL4kT3aPh/qquMbNkdO0sY1M9wV/pU9lZI9zOzhlDvqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981213; c=relaxed/simple;
	bh=us8zClu/bbeI7dXA9bmUS8oAIZPOzS53FPld03el1pU=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=XT8SKyJJq1QyhmSxPAeYIrSNxJ4xa5rVv25eaT6MZzjvNmoFdqPvYmZUrvPmlfuZTdqsFTwtotHFvGMg5LaLBPTtHVIZL5c7bmQsEGv4BeeZznZug5CPiN2fYxg+pGgb5OgbBF7BHDD84xWCrOMYYOjtmk/Y59SFsEMwvQOZ5zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id E383710191781;
	Tue, 10 Sep 2024 17:13:28 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id B341260A8B01;
	Tue, 10 Sep 2024 17:13:28 +0200 (CEST)
X-Mailbox-Line: From dcb40882817bb4c9396ca2dc209360ed7d4b9af9 Mon Sep 17 00:00:00 2001
Message-ID: <dcb40882817bb4c9396ca2dc209360ed7d4b9af9.1725972335.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:17 +0200
Subject: [PATCH v2 07/19] crypto: rsassa-pkcs1 - Harden digest length
 verification
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

The RSASSA-PKCS1-v1_5 sign operation currently only checks that the
digest length is less than "key_size - hash_prefix->size - 11".
The verify operation merely checks that it's more than zero.

Actually the precise digest length is known because the hash algorithm
is specified upon instance creation and the digest length is encoded
into the final byte of the hash algorithm's Full Hash Prefix.

So check for the exact digest length rather than solely relying on
imprecise maximum/minimum checks.

Keep the maximum length check for the sign operation as a safety net,
but drop the now unnecessary minimum check for the verify operation.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 crypto/rsassa-pkcs1.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
index 779c080fc013..8f42a5712806 100644
--- a/crypto/rsassa-pkcs1.c
+++ b/crypto/rsassa-pkcs1.c
@@ -11,6 +11,7 @@
 #include <linux/scatterlist.h>
 #include <crypto/akcipher.h>
 #include <crypto/algapi.h>
+#include <crypto/hash.h>
 #include <crypto/sig.h>
 #include <crypto/internal/akcipher.h>
 #include <crypto/internal/rsa.h>
@@ -118,6 +119,20 @@ static const struct hash_prefix *rsassa_pkcs1_find_hash_prefix(const char *name)
 	return NULL;
 }
 
+static unsigned int rsassa_pkcs1_hash_len(const struct hash_prefix *p)
+{
+	/*
+	 * The final byte of the Full Hash Prefix encodes the hash length.
+	 *
+	 * This needs to be revisited should hash algorithms with more than
+	 * 1016 bits (127 bytes * 8) ever be added.  The length would then
+	 * be encoded into more than one byte by ASN.1.
+	 */
+	static_assert(HASH_MAX_DIGESTSIZE <= 127);
+
+	return p->data[p->size - 1];
+}
+
 struct rsassa_pkcs1_ctx {
 	struct crypto_akcipher *child;
 	unsigned int key_size;
@@ -152,6 +167,9 @@ static int rsassa_pkcs1_sign(struct crypto_sig *tfm,
 	if (dlen < ctx->key_size)
 		return -EOVERFLOW;
 
+	if (slen != rsassa_pkcs1_hash_len(hash_prefix))
+		return -EINVAL;
+
 	if (slen + hash_prefix->size > ctx->key_size - 11)
 		return -EOVERFLOW;
 
@@ -217,7 +235,7 @@ static int rsassa_pkcs1_verify(struct crypto_sig *tfm,
 	/* RFC 8017 sec 8.2.2 step 1 - length checking */
 	if (!ctx->key_size ||
 	    slen != ctx->key_size ||
-	    !dlen)
+	    dlen != rsassa_pkcs1_hash_len(hash_prefix))
 		return -EINVAL;
 
 	/* RFC 8017 sec 8.2.2 step 2 - RSA verification */
-- 
2.43.0


