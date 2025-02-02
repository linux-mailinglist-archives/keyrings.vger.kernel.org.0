Return-Path: <keyrings+bounces-2380-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F470A24FC9
	for <lists+keyrings@lfdr.de>; Sun,  2 Feb 2025 20:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DFEC3A327C
	for <lists+keyrings@lfdr.de>; Sun,  2 Feb 2025 19:27:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F5DA1FE44D;
	Sun,  2 Feb 2025 19:28:01 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56111FE46B;
	Sun,  2 Feb 2025 19:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738524481; cv=none; b=dZYljRUq2G9Ed2axKM8l40FANBvGepUK6v6kwMGDDObrTVwaXKcOIgTjtJFJuw0KRimU6fVcaGDeSUp7vz3oYj1BMmOkRLSNVxZYsOJpSWkb/mriaXvy7/ael70AmolHYdw7CZn06kKUjUPPyS3emKaGLvlmD9b1Z3tWyiapdAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738524481; c=relaxed/simple;
	bh=DCmH/SrLqxbA1xeWtiXCl7hPAUvpNX0YqMX8pA3cP6Q=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=s0u1e5tHvhbg9ZsTCSyQnxoAMfTkNHYVJpXBy722NEWLOmJadGZlQyTkItQoO7gnCh+yUEe40pMQdXcJ1otvtnw7GFGdhhWv+O04FRGCxiiV5BF+cBlOF10k7MhsvMTohTfwfvGBEEz0/w+MWuvB4ozsj/vkiYyuDeyKOEFzRJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 9150810192097;
	Sun,  2 Feb 2025 20:21:12 +0100 (CET)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 5B3B561024FA;
	Sun,  2 Feb 2025 20:21:12 +0100 (CET)
X-Mailbox-Line: From 9143947a5a706d3c9b9857c47ddb5159181c16cf Mon Sep 17 00:00:00 2001
Message-ID: <9143947a5a706d3c9b9857c47ddb5159181c16cf.1738521533.git.lukas@wunner.de>
In-Reply-To: <cover.1738521533.git.lukas@wunner.de>
References: <cover.1738521533.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sun, 2 Feb 2025 20:00:52 +0100
Subject: [PATCH v2 2/4] crypto: ecdsa - Harden against integer overflows in
 DIV_ROUND_UP()
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>
Cc: David Howells <dhowells@redhat.com>, Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

Herbert notes that DIV_ROUND_UP() may overflow unnecessarily if an ecdsa
implementation's ->key_size() callback returns an unusually large value.
Herbert instead suggests (for a division by 8):

  X / 8 + !!(X & 7)

Based on this formula, introduce a generic DIV_ROUND_UP_POW2() macro and
use it in lieu of DIV_ROUND_UP() for ->key_size() return values.

Additionally, use the macro in ecc_digits_from_bytes(), whose "nbytes"
parameter is a ->key_size() return value in some instances, or a
user-specified ASN.1 length in the case of ecdsa_get_signature_rs().

Link: https://lore.kernel.org/r/Z3iElsILmoSu6FuC@gondor.apana.org.au/
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
Changes v1 -> v2:
* New patch introduced in v2

 crypto/ecc.c         |  2 +-
 crypto/ecdsa-p1363.c |  2 +-
 crypto/ecdsa-x962.c  |  4 ++--
 include/linux/math.h | 12 ++++++++++++
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/crypto/ecc.c b/crypto/ecc.c
index 50ad2d4ed672..6cf9a945fc6c 100644
--- a/crypto/ecc.c
+++ b/crypto/ecc.c
@@ -71,7 +71,7 @@ EXPORT_SYMBOL(ecc_get_curve);
 void ecc_digits_from_bytes(const u8 *in, unsigned int nbytes,
 			   u64 *out, unsigned int ndigits)
 {
-	int diff = ndigits - DIV_ROUND_UP(nbytes, sizeof(u64));
+	int diff = ndigits - DIV_ROUND_UP_POW2(nbytes, sizeof(u64));
 	unsigned int o = nbytes & 7;
 	__be64 msd = 0;
 
diff --git a/crypto/ecdsa-p1363.c b/crypto/ecdsa-p1363.c
index eaae7214d69b..4454f1f8f33f 100644
--- a/crypto/ecdsa-p1363.c
+++ b/crypto/ecdsa-p1363.c
@@ -22,7 +22,7 @@ static int ecdsa_p1363_verify(struct crypto_sig *tfm,
 {
 	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
 	unsigned int keylen = crypto_sig_keysize(ctx->child);
-	unsigned int ndigits = DIV_ROUND_UP(keylen, sizeof(u64));
+	unsigned int ndigits = DIV_ROUND_UP_POW2(keylen, sizeof(u64));
 	struct ecdsa_raw_sig sig;
 
 	if (slen != 2 * keylen)
diff --git a/crypto/ecdsa-x962.c b/crypto/ecdsa-x962.c
index 6a77c13e192b..90a04f4b9a2f 100644
--- a/crypto/ecdsa-x962.c
+++ b/crypto/ecdsa-x962.c
@@ -81,8 +81,8 @@ static int ecdsa_x962_verify(struct crypto_sig *tfm,
 	struct ecdsa_x962_signature_ctx sig_ctx;
 	int err;
 
-	sig_ctx.ndigits = DIV_ROUND_UP(crypto_sig_keysize(ctx->child),
-				       sizeof(u64));
+	sig_ctx.ndigits = DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx->child),
+					    sizeof(u64));
 
 	err = asn1_ber_decoder(&ecdsasignature_decoder, &sig_ctx, src, slen);
 	if (err < 0)
diff --git a/include/linux/math.h b/include/linux/math.h
index f5f18dc3616b..0198c92cbe3e 100644
--- a/include/linux/math.h
+++ b/include/linux/math.h
@@ -34,6 +34,18 @@
  */
 #define round_down(x, y) ((x) & ~__round_mask(x, y))
 
+/**
+ * DIV_ROUND_UP_POW2 - divide and round up
+ * @n: numerator
+ * @d: denominator (must be a power of 2)
+ *
+ * Divides @n by @d and rounds up to next multiple of @d (which must be a power
+ * of 2). Avoids integer overflows that may occur with __KERNEL_DIV_ROUND_UP().
+ * Performance is roughly equivalent to __KERNEL_DIV_ROUND_UP().
+ */
+#define DIV_ROUND_UP_POW2(n, d) \
+	((n) / (d) + !!((n) & ((d) - 1)))
+
 #define DIV_ROUND_UP __KERNEL_DIV_ROUND_UP
 
 #define DIV_ROUND_DOWN_ULL(ll, d) \
-- 
2.43.0


