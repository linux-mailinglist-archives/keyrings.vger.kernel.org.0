Return-Path: <keyrings+bounces-1969-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF05973BF9
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:31:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3ACF21F28C7B
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66A431990C3;
	Tue, 10 Sep 2024 15:30:57 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9A34204D;
	Tue, 10 Sep 2024 15:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982257; cv=none; b=b1yfTWyAVve+BamO0S2GnVrGkqS1S3mNLX1bf29TEGfK3Z2iLI7yBOSwCfB4f6xuPsdgbsIPdt9sWYSER6Wm75B4mKJQWpnjpKJ+IC6l38lPgmN8XB35x0WpIQftXsldoZkVK+m9a3sYnzEJrTDHm+Szq8lW4N7hA3nTQ0T2L0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982257; c=relaxed/simple;
	bh=hMYv8IyCUbn2rY5QBbhZhf4d57fd13gRVTKZ086DxGY=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=IVaa+JuGISJtvAxtgbYHvy8FxEnM3io9h1JrL1wIlaxee2TDU//rHQX9sJgFwvTkkcmTT/5xgaeUfRLeKGnPBYH+fiUHELc1yUUktnnjTPsJz8WDPsKfo5xDTyEWGkliKcfpcVIwJ8KQP/SucdL15qa57P5blTQyMnbUnKSZHBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=176.9.242.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id ED826101E1D65;
	Tue, 10 Sep 2024 17:30:52 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 9EB2260A8B01;
	Tue, 10 Sep 2024 17:30:52 +0200 (CEST)
X-Mailbox-Line: From 25a96bf92529477d4ecc0918cf7fbe1f0b4b1cb9 Mon Sep 17 00:00:00 2001
Message-ID: <25a96bf92529477d4ecc0918cf7fbe1f0b4b1cb9.1725972335.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:27 +0200
Subject: [PATCH v2 17/19] crypto: ecdsa - Move X9.62 signature size calculation
 into template
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

software_key_query() returns the maximum signature and digest size for a
given key to user space.  When it only supported RSA keys, calculating
those sizes was trivial as they were always equivalent to the key size.

However when ECDSA was added, the function grew somewhat complicated
calculations which take the ASN.1 encoding and curve into account.
This doesn't scale well and adjusting the calculations is easily
forgotten when adding support for new encodings or curves.  In fact,
when NIST P521 support was recently added, the function was initially
not amended:

https://lore.kernel.org/all/b749d5ee-c3b8-4cbd-b252-7773e4536e07@linux.ibm.com/

Introduce a ->max_size() callback to struct sig_alg and take advantage
of it to move the signature size calculations to ecdsa-x962.c.

Introduce a ->digest_size() callback to struct sig_alg and move the
maximum ECDSA digest size to ecdsa.c.  It is common across ecdsa-x962.c
and the upcoming ecdsa-p1363.c and thus inherited by both of them.

For all other algorithms, continue using the key size as maximum
signature and digest size.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 Documentation/crypto/api-sig.rst    |  2 +-
 crypto/asymmetric_keys/public_key.c | 38 +++--------------------------
 crypto/ecdsa-x962.c                 | 36 +++++++++++++++++++++++++++
 crypto/ecdsa.c                      | 16 ++++++++++++
 crypto/sig.c                        |  4 +++
 include/crypto/sig.h                | 38 +++++++++++++++++++++++++++++
 6 files changed, 99 insertions(+), 35 deletions(-)

diff --git a/Documentation/crypto/api-sig.rst b/Documentation/crypto/api-sig.rst
index 10dabc87df02..aaec18e26d54 100644
--- a/Documentation/crypto/api-sig.rst
+++ b/Documentation/crypto/api-sig.rst
@@ -11,5 +11,5 @@ Asymmetric Signature API
    :doc: Generic Public Key Signature API
 
 .. kernel-doc:: include/crypto/sig.h
-   :functions: crypto_alloc_sig crypto_free_sig crypto_sig_set_pubkey crypto_sig_set_privkey crypto_sig_keysize crypto_sig_sign crypto_sig_verify
+   :functions: crypto_alloc_sig crypto_free_sig crypto_sig_set_pubkey crypto_sig_set_privkey crypto_sig_keysize crypto_sig_maxsize crypto_sig_digestsize crypto_sig_sign crypto_sig_verify
 
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index 8bf5aa329c26..ec2c0e009b49 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -202,6 +202,8 @@ static int software_key_query(const struct kernel_pkey_params *params,
 			goto error_free_tfm;
 
 		len = crypto_sig_keysize(sig);
+		info->max_sig_size = crypto_sig_maxsize(sig);
+		info->max_data_size = crypto_sig_digestsize(sig);
 
 		info->supported_ops = KEYCTL_SUPPORTS_VERIFY;
 		if (pkey->key_is_private)
@@ -227,6 +229,8 @@ static int software_key_query(const struct kernel_pkey_params *params,
 			goto error_free_tfm;
 
 		len = crypto_akcipher_maxsize(tfm);
+		info->max_sig_size = len;
+		info->max_data_size = len;
 
 		info->supported_ops = KEYCTL_SUPPORTS_ENCRYPT;
 		if (pkey->key_is_private)
@@ -234,40 +238,6 @@ static int software_key_query(const struct kernel_pkey_params *params,
 	}
 
 	info->key_size = len * 8;
-
-	if (strncmp(pkey->pkey_algo, "ecdsa", 5) == 0) {
-		int slen = len;
-		/*
-		 * ECDSA key sizes are much smaller than RSA, and thus could
-		 * operate on (hashed) inputs that are larger than key size.
-		 * For example SHA384-hashed input used with secp256r1
-		 * based keys.  Set max_data_size to be at least as large as
-		 * the largest supported hash size (SHA512)
-		 */
-		info->max_data_size = 64;
-
-		/*
-		 * Verify takes ECDSA-Sig (described in RFC 5480) as input,
-		 * which is actually 2 'key_size'-bit integers encoded in
-		 * ASN.1.  Account for the ASN.1 encoding overhead here.
-		 *
-		 * NIST P192/256/384 may prepend a '0' to a coordinate to
-		 * indicate a positive integer. NIST P521 never needs it.
-		 */
-		if (strcmp(pkey->pkey_algo, "ecdsa-nist-p521") != 0)
-			slen += 1;
-		/* Length of encoding the x & y coordinates */
-		slen = 2 * (slen + 2);
-		/*
-		 * If coordinate encoding takes at least 128 bytes then an
-		 * additional byte for length encoding is needed.
-		 */
-		info->max_sig_size = 1 + (slen >= 128) + 1 + slen;
-	} else {
-		info->max_data_size = len;
-		info->max_sig_size = len;
-	}
-
 	info->max_enc_size = len;
 	info->max_dec_size = len;
 
diff --git a/crypto/ecdsa-x962.c b/crypto/ecdsa-x962.c
index 8a15232dfa77..6a77c13e192b 100644
--- a/crypto/ecdsa-x962.c
+++ b/crypto/ecdsa-x962.c
@@ -99,6 +99,40 @@ static unsigned int ecdsa_x962_key_size(struct crypto_sig *tfm)
 	return crypto_sig_keysize(ctx->child);
 }
 
+static unsigned int ecdsa_x962_max_size(struct crypto_sig *tfm)
+{
+	struct ecdsa_x962_ctx *ctx = crypto_sig_ctx(tfm);
+	struct sig_alg *alg = crypto_sig_alg(ctx->child);
+	int slen = crypto_sig_keysize(ctx->child);
+
+	/*
+	 * Verify takes ECDSA-Sig-Value (described in RFC 5480) as input,
+	 * which is actually 2 'key_size'-bit integers encoded in ASN.1.
+	 * Account for the ASN.1 encoding overhead here.
+	 *
+	 * NIST P192/256/384 may prepend a '0' to a coordinate to indicate
+	 * a positive integer. NIST P521 never needs it.
+	 */
+	if (strcmp(alg->base.cra_name, "ecdsa-nist-p521") != 0)
+		slen += 1;
+
+	/* Length of encoding the x & y coordinates */
+	slen = 2 * (slen + 2);
+
+	/*
+	 * If coordinate encoding takes at least 128 bytes then an
+	 * additional byte for length encoding is needed.
+	 */
+	return 1 + (slen >= 128) + 1 + slen;
+}
+
+static unsigned int ecdsa_x962_digest_size(struct crypto_sig *tfm)
+{
+	struct ecdsa_x962_ctx *ctx = crypto_sig_ctx(tfm);
+
+	return crypto_sig_digestsize(ctx->child);
+}
+
 static int ecdsa_x962_set_pub_key(struct crypto_sig *tfm,
 				  const void *key, unsigned int keylen)
 {
@@ -180,6 +214,8 @@ static int ecdsa_x962_create(struct crypto_template *tmpl, struct rtattr **tb)
 
 	inst->alg.verify = ecdsa_x962_verify;
 	inst->alg.key_size = ecdsa_x962_key_size;
+	inst->alg.max_size = ecdsa_x962_max_size;
+	inst->alg.digest_size = ecdsa_x962_digest_size;
 	inst->alg.set_pub_key = ecdsa_x962_set_pub_key;
 
 	inst->free = ecdsa_x962_free;
diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
index 6cb0a6ce9de1..cf8e0c5d1dd8 100644
--- a/crypto/ecdsa.c
+++ b/crypto/ecdsa.c
@@ -7,6 +7,7 @@
 #include <crypto/internal/ecc.h>
 #include <crypto/internal/sig.h>
 #include <crypto/ecdh.h>
+#include <crypto/sha2.h>
 #include <crypto/sig.h>
 
 struct ecc_ctx {
@@ -169,6 +170,17 @@ static unsigned int ecdsa_key_size(struct crypto_sig *tfm)
 	return DIV_ROUND_UP(ctx->curve->nbits, 8);
 }
 
+static unsigned int ecdsa_digest_size(struct crypto_sig *tfm)
+{
+	/*
+	 * ECDSA key sizes are much smaller than RSA, and thus could
+	 * operate on (hashed) inputs that are larger than the key size.
+	 * E.g. SHA384-hashed input used with secp256r1 based keys.
+	 * Return the largest supported hash size (SHA512).
+	 */
+	return SHA512_DIGEST_SIZE;
+}
+
 static int ecdsa_nist_p521_init_tfm(struct crypto_sig *tfm)
 {
 	struct ecc_ctx *ctx = crypto_sig_ctx(tfm);
@@ -180,6 +192,7 @@ static struct sig_alg ecdsa_nist_p521 = {
 	.verify = ecdsa_verify,
 	.set_pub_key = ecdsa_set_pub_key,
 	.key_size = ecdsa_key_size,
+	.digest_size = ecdsa_digest_size,
 	.init = ecdsa_nist_p521_init_tfm,
 	.exit = ecdsa_exit_tfm,
 	.base = {
@@ -202,6 +215,7 @@ static struct sig_alg ecdsa_nist_p384 = {
 	.verify = ecdsa_verify,
 	.set_pub_key = ecdsa_set_pub_key,
 	.key_size = ecdsa_key_size,
+	.digest_size = ecdsa_digest_size,
 	.init = ecdsa_nist_p384_init_tfm,
 	.exit = ecdsa_exit_tfm,
 	.base = {
@@ -224,6 +238,7 @@ static struct sig_alg ecdsa_nist_p256 = {
 	.verify = ecdsa_verify,
 	.set_pub_key = ecdsa_set_pub_key,
 	.key_size = ecdsa_key_size,
+	.digest_size = ecdsa_digest_size,
 	.init = ecdsa_nist_p256_init_tfm,
 	.exit = ecdsa_exit_tfm,
 	.base = {
@@ -246,6 +261,7 @@ static struct sig_alg ecdsa_nist_p192 = {
 	.verify = ecdsa_verify,
 	.set_pub_key = ecdsa_set_pub_key,
 	.key_size = ecdsa_key_size,
+	.digest_size = ecdsa_digest_size,
 	.init = ecdsa_nist_p192_init_tfm,
 	.exit = ecdsa_exit_tfm,
 	.base = {
diff --git a/crypto/sig.c b/crypto/sig.c
index 7a3521bee29a..be5ac0e59384 100644
--- a/crypto/sig.c
+++ b/crypto/sig.c
@@ -127,6 +127,10 @@ int crypto_register_sig(struct sig_alg *alg)
 		return -EINVAL;
 	if (!alg->key_size)
 		return -EINVAL;
+	if (!alg->max_size)
+		alg->max_size = alg->key_size;
+	if (!alg->digest_size)
+		alg->digest_size = alg->key_size;
 
 	sig_prepare_alg(alg);
 	return crypto_register_alg(base);
diff --git a/include/crypto/sig.h b/include/crypto/sig.h
index a3ef17c5f72f..cff41ad93824 100644
--- a/include/crypto/sig.h
+++ b/include/crypto/sig.h
@@ -33,6 +33,8 @@ struct crypto_sig {
  *		function, which knows how to decode and interpret
  *		the BER encoded private key and parameters. Optional.
  * @key_size:	Function returns key size. Mandatory.
+ * @digest_size: Function returns maximum digest size. Optional.
+ * @max_size:	Function returns maximum signature size. Optional.
  * @init:	Initialize the cryptographic transformation object.
  *		This function is used to initialize the cryptographic
  *		transformation object. This function is called only once at
@@ -59,6 +61,8 @@ struct sig_alg {
 	int (*set_priv_key)(struct crypto_sig *tfm,
 			    const void *key, unsigned int keylen);
 	unsigned int (*key_size)(struct crypto_sig *tfm);
+	unsigned int (*digest_size)(struct crypto_sig *tfm);
+	unsigned int (*max_size)(struct crypto_sig *tfm);
 	int (*init)(struct crypto_sig *tfm);
 	void (*exit)(struct crypto_sig *tfm);
 
@@ -137,6 +141,40 @@ static inline unsigned int crypto_sig_keysize(struct crypto_sig *tfm)
 	return alg->key_size(tfm);
 }
 
+/**
+ * crypto_sig_digestsize() - Get maximum digest size
+ *
+ * Function returns the maximum digest size in bytes.
+ * Function assumes that the key is already set in the transformation. If this
+ * function is called without a setkey or with a failed setkey, you may end up
+ * in a NULL dereference.
+ *
+ * @tfm:	signature tfm handle allocated with crypto_alloc_sig()
+ */
+static inline unsigned int crypto_sig_digestsize(struct crypto_sig *tfm)
+{
+	struct sig_alg *alg = crypto_sig_alg(tfm);
+
+	return alg->digest_size(tfm);
+}
+
+/**
+ * crypto_sig_maxsize() - Get maximum signature size
+ *
+ * Function returns the maximum signature size in bytes.
+ * Function assumes that the key is already set in the transformation. If this
+ * function is called without a setkey or with a failed setkey, you may end up
+ * in a NULL dereference.
+ *
+ * @tfm:	signature tfm handle allocated with crypto_alloc_sig()
+ */
+static inline unsigned int crypto_sig_maxsize(struct crypto_sig *tfm)
+{
+	struct sig_alg *alg = crypto_sig_alg(tfm);
+
+	return alg->max_size(tfm);
+}
+
 /**
  * crypto_sig_sign() - Invoke signing operation
  *
-- 
2.43.0


