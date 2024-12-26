Return-Path: <keyrings+bounces-2324-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA1D9FCD23
	for <lists+keyrings@lfdr.de>; Thu, 26 Dec 2024 19:39:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59E79163C4B
	for <lists+keyrings@lfdr.de>; Thu, 26 Dec 2024 18:38:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 262621B4144;
	Thu, 26 Dec 2024 18:36:22 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4B61BC064;
	Thu, 26 Dec 2024 18:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735238182; cv=none; b=COWzU/e4A7oKUFcqyavRWG03Cg+H0DGwYa4gZYfGy5OQiQMCBWvBmkV0aff323vhruWccsDJ1W0/Aj3jIcB4H3GjvAvvkEolH61SoHWCbSsYocP5z8Y7vBDKxZaL+0o+c+OI3nvj3IoJs+Rm3H1V0w45B5mKqCIQqhvNSOy4MmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735238182; c=relaxed/simple;
	bh=pOARiGUpIKMGZrN0tHblLzaGX/T7nucgwPS1R03KGtQ=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=Da+qq+w7XypyHPzp6mbT89zw70hNANzeJgIEv1dPBXvaGHEQzti0qmvWkZhhc/8eRGPx+ybyBbB8nwuUQbr+zQ9ULPPyT41VbFDUAQ2X1/IfhsiL+svWYcdL+uPyCY4UJV6wtPtsSJc5yLCQTIYJ4mIqLnt02yXy1sqkTsXm/pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 0C412101933C4;
	Thu, 26 Dec 2024 19:36:17 +0100 (CET)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id D10F76188CD9;
	Thu, 26 Dec 2024 19:36:16 +0100 (CET)
X-Mailbox-Line: From a0e1aa407de754e03a7012049e45e25d7af10e08 Mon Sep 17 00:00:00 2001
Message-ID: <a0e1aa407de754e03a7012049e45e25d7af10e08.1735236227.git.lukas@wunner.de>
In-Reply-To: <cover.1735236227.git.lukas@wunner.de>
References: <cover.1735236227.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Thu, 26 Dec 2024 19:08:03 +0100
Subject: [PATCH 3/3] crypto: ecdsa - Fix NIST P521 key size reported by
 KEYCTL_PKEY_QUERY
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>
Cc: David Howells <dhowells@redhat.com>, Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

When user space issues a KEYCTL_PKEY_QUERY system call for a NIST P521
key, the key_size is incorrectly reported as 528 bits instead of 521.

That's because the key size obtained through crypto_sig_keysize() is in
bytes and software_key_query() multiplies by 8 to yield the size in bits.
The underlying assumption is that the key size is always a multiple of 8.
With the recent addition of NIST P521, that's no longer the case.

Fix by returning the key_size in bits from crypto_sig_keysize() and
adjusting the calculations in software_key_query().

The ->key_size() callbacks of sig_alg algorithms now return the size in
bits, whereas the ->digest_size() and ->max_size() callbacks return the
size in bytes.  This matches with the units in struct keyctl_pkey_query.

Fixes: a7d45ba77d3d ("crypto: ecdsa - Register NIST P521 and extend test suite")
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 crypto/asymmetric_keys/public_key.c | 8 ++++----
 crypto/ecdsa-p1363.c                | 4 ++--
 crypto/ecdsa-x962.c                 | 4 ++--
 crypto/ecdsa.c                      | 2 +-
 crypto/ecrdsa.c                     | 2 +-
 crypto/rsassa-pkcs1.c               | 2 +-
 crypto/sig.c                        | 9 +++++++--
 include/crypto/sig.h                | 2 +-
 8 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index dd44a966947f..6cafb2b8aa22 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -205,6 +205,7 @@ static int software_key_query(const struct kernel_pkey_params *params,
 			goto error_free_tfm;
 
 		len = crypto_sig_keysize(sig);
+		info->key_size = len;
 		info->max_sig_size = crypto_sig_maxsize(sig);
 		info->max_data_size = crypto_sig_digestsize(sig);
 
@@ -213,8 +214,8 @@ static int software_key_query(const struct kernel_pkey_params *params,
 			info->supported_ops |= KEYCTL_SUPPORTS_SIGN;
 
 		if (strcmp(params->encoding, "pkcs1") == 0) {
-			info->max_enc_size = len;
-			info->max_dec_size = len;
+			info->max_enc_size = len / 8;
+			info->max_dec_size = len / 8;
 
 			info->supported_ops |= KEYCTL_SUPPORTS_ENCRYPT;
 			if (pkey->key_is_private)
@@ -235,6 +236,7 @@ static int software_key_query(const struct kernel_pkey_params *params,
 			goto error_free_tfm;
 
 		len = crypto_akcipher_maxsize(tfm);
+		info->key_size = len * 8;
 		info->max_sig_size = len;
 		info->max_data_size = len;
 		info->max_enc_size = len;
@@ -245,8 +247,6 @@ static int software_key_query(const struct kernel_pkey_params *params,
 			info->supported_ops |= KEYCTL_SUPPORTS_DECRYPT;
 	}
 
-	info->key_size = len * 8;
-
 	ret = 0;
 
 error_free_tfm:
diff --git a/crypto/ecdsa-p1363.c b/crypto/ecdsa-p1363.c
index eaae7214d69b..c4f458df18ed 100644
--- a/crypto/ecdsa-p1363.c
+++ b/crypto/ecdsa-p1363.c
@@ -21,7 +21,7 @@ static int ecdsa_p1363_verify(struct crypto_sig *tfm,
 			      const void *digest, unsigned int dlen)
 {
 	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
-	unsigned int keylen = crypto_sig_keysize(ctx->child);
+	unsigned int keylen = DIV_ROUND_UP(crypto_sig_keysize(ctx->child), 8);
 	unsigned int ndigits = DIV_ROUND_UP(keylen, sizeof(u64));
 	struct ecdsa_raw_sig sig;
 
@@ -45,7 +45,7 @@ static unsigned int ecdsa_p1363_max_size(struct crypto_sig *tfm)
 {
 	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
 
-	return 2 * crypto_sig_keysize(ctx->child);
+	return 2 * DIV_ROUND_UP(crypto_sig_keysize(ctx->child), 8);
 }
 
 static unsigned int ecdsa_p1363_digest_size(struct crypto_sig *tfm)
diff --git a/crypto/ecdsa-x962.c b/crypto/ecdsa-x962.c
index 6a77c13e192b..0327e1441374 100644
--- a/crypto/ecdsa-x962.c
+++ b/crypto/ecdsa-x962.c
@@ -82,7 +82,7 @@ static int ecdsa_x962_verify(struct crypto_sig *tfm,
 	int err;
 
 	sig_ctx.ndigits = DIV_ROUND_UP(crypto_sig_keysize(ctx->child),
-				       sizeof(u64));
+				       sizeof(u64) * 8);
 
 	err = asn1_ber_decoder(&ecdsasignature_decoder, &sig_ctx, src, slen);
 	if (err < 0)
@@ -103,7 +103,7 @@ static unsigned int ecdsa_x962_max_size(struct crypto_sig *tfm)
 {
 	struct ecdsa_x962_ctx *ctx = crypto_sig_ctx(tfm);
 	struct sig_alg *alg = crypto_sig_alg(ctx->child);
-	int slen = crypto_sig_keysize(ctx->child);
+	int slen = DIV_ROUND_UP(crypto_sig_keysize(ctx->child), 8);
 
 	/*
 	 * Verify takes ECDSA-Sig-Value (described in RFC 5480) as input,
diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
index 117526d15dde..a70b60a90a3c 100644
--- a/crypto/ecdsa.c
+++ b/crypto/ecdsa.c
@@ -167,7 +167,7 @@ static unsigned int ecdsa_key_size(struct crypto_sig *tfm)
 {
 	struct ecc_ctx *ctx = crypto_sig_ctx(tfm);
 
-	return DIV_ROUND_UP(ctx->curve->nbits, 8);
+	return ctx->curve->nbits;
 }
 
 static unsigned int ecdsa_digest_size(struct crypto_sig *tfm)
diff --git a/crypto/ecrdsa.c b/crypto/ecrdsa.c
index b3dd8a3ddeb7..53c9fd9f807f 100644
--- a/crypto/ecrdsa.c
+++ b/crypto/ecrdsa.c
@@ -249,7 +249,7 @@ static unsigned int ecrdsa_key_size(struct crypto_sig *tfm)
 	 * Verify doesn't need any output, so it's just informational
 	 * for keyctl to determine the key bit size.
 	 */
-	return ctx->pub_key.ndigits * sizeof(u64);
+	return ctx->pub_key.ndigits * sizeof(u64) * 8;
 }
 
 static unsigned int ecrdsa_max_size(struct crypto_sig *tfm)
diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
index d01ac75635e0..299b2512cc95 100644
--- a/crypto/rsassa-pkcs1.c
+++ b/crypto/rsassa-pkcs1.c
@@ -301,7 +301,7 @@ static unsigned int rsassa_pkcs1_key_size(struct crypto_sig *tfm)
 {
 	struct rsassa_pkcs1_ctx *ctx = crypto_sig_ctx(tfm);
 
-	return ctx->key_size;
+	return ctx->key_size * 8;
 }
 
 static int rsassa_pkcs1_set_pub_key(struct crypto_sig *tfm,
diff --git a/crypto/sig.c b/crypto/sig.c
index dfc7cae90802..7399e67c6f12 100644
--- a/crypto/sig.c
+++ b/crypto/sig.c
@@ -102,6 +102,11 @@ static int sig_default_set_key(struct crypto_sig *tfm,
 	return -ENOSYS;
 }
 
+static unsigned int sig_default_size(struct crypto_sig *tfm)
+{
+	return DIV_ROUND_UP(crypto_sig_keysize(tfm), 8);
+}
+
 static int sig_prepare_alg(struct sig_alg *alg)
 {
 	struct crypto_alg *base = &alg->base;
@@ -117,9 +122,9 @@ static int sig_prepare_alg(struct sig_alg *alg)
 	if (!alg->key_size)
 		return -EINVAL;
 	if (!alg->max_size)
-		alg->max_size = alg->key_size;
+		alg->max_size = sig_default_size;
 	if (!alg->digest_size)
-		alg->digest_size = alg->key_size;
+		alg->digest_size = sig_default_size;
 
 	base->cra_type = &crypto_sig_type;
 	base->cra_flags &= ~CRYPTO_ALG_TYPE_MASK;
diff --git a/include/crypto/sig.h b/include/crypto/sig.h
index 11024708c069..fa6dafafab3f 100644
--- a/include/crypto/sig.h
+++ b/include/crypto/sig.h
@@ -128,7 +128,7 @@ static inline void crypto_free_sig(struct crypto_sig *tfm)
 /**
  * crypto_sig_keysize() - Get key size
  *
- * Function returns the key size in bytes.
+ * Function returns the key size in bits.
  * Function assumes that the key is already set in the transformation. If this
  * function is called without a setkey or with a failed setkey, you may end up
  * in a NULL dereference.
-- 
2.43.0


