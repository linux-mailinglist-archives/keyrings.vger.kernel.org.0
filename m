Return-Path: <keyrings+bounces-2607-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D49E5A7EDBF
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 21:48:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 090473ACCD6
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 19:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00459218AC7;
	Mon,  7 Apr 2025 19:44:00 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75647215767;
	Mon,  7 Apr 2025 19:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744055039; cv=none; b=EEnq5KFATd3sLjbC2IuirjJcWwn8zMIcCQGSMP0BPNkk1GO/v3+zBdxw8uAZjSsVkURs4qqtrnbb9QuD3SbZpTdKi8hBkPMRp1pPAuHYrdQrEHP/EkYm+YK3U21p6D2DCG4nPeV0rLzyJkB2HW/7YwVwOAjBGcBvYwWITH4dJC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744055039; c=relaxed/simple;
	bh=o3DnsCnj6WzW/Zs968B5ii/gpPqvTxYvIRSWGb3sTOI=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=X/LhxyzUq1hExqiYxBvEJxGhVpt2N9q6GMhxn/9UZlthA9ptFsLRtf98ZrEmjTC1vD9mk4sWxKp3bh5dyJSLw08N6JQ39l4b3qzAsVAfX3i5DfLIixaBJ4hjcaDp2fJ3GCsXds2tL4eznHCBoIyEydYKre4kAjDY5/nGPR5eHxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 49A092C4C0EC;
	Mon,  7 Apr 2025 21:43:33 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 555572D922; Mon,  7 Apr 2025 21:43:54 +0200 (CEST)
Message-Id: <6c5b85bf2dc8bb7852ff0ba961f1622dcc57f7ae.1744052920.git.lukas@wunner.de>
In-Reply-To: <cover.1744052920.git.lukas@wunner.de>
References: <cover.1744052920.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 7 Apr 2025 21:32:42 +0200
Subject: [PATCH RESEND v2 2/2] crypto: ecdsa - Fix NIST P521 key size reported
 by KEYCTL_PKEY_QUERY
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Cc: David Howells <dhowells@redhat.com>, Ignat Korchagin <ignat@cloudflare.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
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
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---
 crypto/asymmetric_keys/public_key.c | 8 ++++----
 crypto/ecdsa-p1363.c                | 6 ++++--
 crypto/ecdsa-x962.c                 | 5 +++--
 crypto/ecdsa.c                      | 2 +-
 crypto/ecrdsa.c                     | 2 +-
 crypto/rsassa-pkcs1.c               | 2 +-
 crypto/sig.c                        | 9 +++++++--
 include/crypto/sig.h                | 2 +-
 8 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index dd44a96..89dc887 100644
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
+			info->max_enc_size = len / BITS_PER_BYTE;
+			info->max_dec_size = len / BITS_PER_BYTE;
 
 			info->supported_ops |= KEYCTL_SUPPORTS_ENCRYPT;
 			if (pkey->key_is_private)
@@ -235,6 +236,7 @@ static int software_key_query(const struct kernel_pkey_params *params,
 			goto error_free_tfm;
 
 		len = crypto_akcipher_maxsize(tfm);
+		info->key_size = len * BITS_PER_BYTE;
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
index 4454f1f..e0c55c6 100644
--- a/crypto/ecdsa-p1363.c
+++ b/crypto/ecdsa-p1363.c
@@ -21,7 +21,8 @@ static int ecdsa_p1363_verify(struct crypto_sig *tfm,
 			      const void *digest, unsigned int dlen)
 {
 	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
-	unsigned int keylen = crypto_sig_keysize(ctx->child);
+	unsigned int keylen = DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx->child),
+						BITS_PER_BYTE);
 	unsigned int ndigits = DIV_ROUND_UP_POW2(keylen, sizeof(u64));
 	struct ecdsa_raw_sig sig;
 
@@ -45,7 +46,8 @@ static unsigned int ecdsa_p1363_max_size(struct crypto_sig *tfm)
 {
 	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
 
-	return 2 * crypto_sig_keysize(ctx->child);
+	return 2 * DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx->child),
+				     BITS_PER_BYTE);
 }
 
 static unsigned int ecdsa_p1363_digest_size(struct crypto_sig *tfm)
diff --git a/crypto/ecdsa-x962.c b/crypto/ecdsa-x962.c
index 90a04f4..ee71594 100644
--- a/crypto/ecdsa-x962.c
+++ b/crypto/ecdsa-x962.c
@@ -82,7 +82,7 @@ static int ecdsa_x962_verify(struct crypto_sig *tfm,
 	int err;
 
 	sig_ctx.ndigits = DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx->child),
-					    sizeof(u64));
+					    sizeof(u64) * BITS_PER_BYTE);
 
 	err = asn1_ber_decoder(&ecdsasignature_decoder, &sig_ctx, src, slen);
 	if (err < 0)
@@ -103,7 +103,8 @@ static unsigned int ecdsa_x962_max_size(struct crypto_sig *tfm)
 {
 	struct ecdsa_x962_ctx *ctx = crypto_sig_ctx(tfm);
 	struct sig_alg *alg = crypto_sig_alg(ctx->child);
-	int slen = crypto_sig_keysize(ctx->child);
+	int slen = DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx->child),
+				     BITS_PER_BYTE);
 
 	/*
 	 * Verify takes ECDSA-Sig-Value (described in RFC 5480) as input,
diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
index 117526d..a70b60a 100644
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
index b3dd8a3..2c0602f 100644
--- a/crypto/ecrdsa.c
+++ b/crypto/ecrdsa.c
@@ -249,7 +249,7 @@ static unsigned int ecrdsa_key_size(struct crypto_sig *tfm)
 	 * Verify doesn't need any output, so it's just informational
 	 * for keyctl to determine the key bit size.
 	 */
-	return ctx->pub_key.ndigits * sizeof(u64);
+	return ctx->pub_key.ndigits * sizeof(u64) * BITS_PER_BYTE;
 }
 
 static unsigned int ecrdsa_max_size(struct crypto_sig *tfm)
diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
index d01ac75..94fa5e9 100644
--- a/crypto/rsassa-pkcs1.c
+++ b/crypto/rsassa-pkcs1.c
@@ -301,7 +301,7 @@ static unsigned int rsassa_pkcs1_key_size(struct crypto_sig *tfm)
 {
 	struct rsassa_pkcs1_ctx *ctx = crypto_sig_ctx(tfm);
 
-	return ctx->key_size;
+	return ctx->key_size * BITS_PER_BYTE;
 }
 
 static int rsassa_pkcs1_set_pub_key(struct crypto_sig *tfm,
diff --git a/crypto/sig.c b/crypto/sig.c
index dfc7cae..53a3dd6 100644
--- a/crypto/sig.c
+++ b/crypto/sig.c
@@ -102,6 +102,11 @@ static int sig_default_set_key(struct crypto_sig *tfm,
 	return -ENOSYS;
 }
 
+static unsigned int sig_default_size(struct crypto_sig *tfm)
+{
+	return DIV_ROUND_UP_POW2(crypto_sig_keysize(tfm), BITS_PER_BYTE);
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
index 1102470..fa6dafaf 100644
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


