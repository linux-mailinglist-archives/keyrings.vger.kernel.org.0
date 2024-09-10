Return-Path: <keyrings+bounces-1968-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C46C9973BF0
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F3ED1F28BD8
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF81F19C54A;
	Tue, 10 Sep 2024 15:29:11 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFC219ABC6;
	Tue, 10 Sep 2024 15:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982151; cv=none; b=midPitc37XaI/FUJWiWvSKT1SYoLxoTjRyOpp9cgsHfMtMFGgH+MQVCFaO/LZC59Z1XUVKxbnWBhwOXHkhqpcklLbCgBdXcTHyLhyaKd1pnOG9L7ucQeWdCxLZklu3AWpnIUbxIZNjj+YNV+J/2jQAe/OFW7VgGAirnHVVIHm4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982151; c=relaxed/simple;
	bh=ETUwFpUrp9iavlu60UWieDqaVKeYUQCY+QdzhS9rk40=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=kN+h77zWgOy9wqhVZH1hNke2ZfT0ddSyTScuDt2kg9k4ye/xpzPh4eK0IWbvKb2lWWaI2ASqTswS5KfM6nkgddeLQCwtw8fSq0Pp989CO2SIsSanyjMM7DU2r7xLsF5zTz4U1TAYgVzCSdNBIi3zkknFzpKNGFziKOXdLQVscqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id F0C1010191791;
	Tue, 10 Sep 2024 17:29:07 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id CF81760A8B01;
	Tue, 10 Sep 2024 17:29:07 +0200 (CEST)
X-Mailbox-Line: From 85b9d0003d8d55c21e7411802950826d01011668 Mon Sep 17 00:00:00 2001
Message-ID: <85b9d0003d8d55c21e7411802950826d01011668.1725972335.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:26 +0200
Subject: [PATCH v2 16/19] crypto: sig - Rename crypto_sig_maxsize() to
 crypto_sig_keysize()
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

crypto_sig_maxsize() is a bit of a misnomer as it doesn't return the
maximum signature size, but rather the key size.

Rename it as well as all implementations of the ->max_size callback.
A subsequent commit introduces a crypto_sig_maxsize() function which
returns the actual maximum signature size.

While at it, change the return type of crypto_sig_keysize() from int to
unsigned int for consistency with crypto_akcipher_maxsize().  None of
the callers checks for a negative return value and an error condition
can always be indicated by returning zero.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 Documentation/crypto/api-sig.rst    |  2 +-
 crypto/asymmetric_keys/public_key.c |  4 ++--
 crypto/ecdsa-x962.c                 |  8 ++++----
 crypto/ecdsa.c                      | 10 +++++-----
 crypto/ecrdsa.c                     |  4 ++--
 crypto/rsassa-pkcs1.c               |  4 ++--
 crypto/sig.c                        |  2 +-
 crypto/testmgr.c                    |  2 +-
 include/crypto/sig.h                | 14 +++++++-------
 9 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/Documentation/crypto/api-sig.rst b/Documentation/crypto/api-sig.rst
index e5e87e106884..10dabc87df02 100644
--- a/Documentation/crypto/api-sig.rst
+++ b/Documentation/crypto/api-sig.rst
@@ -11,5 +11,5 @@ Asymmetric Signature API
    :doc: Generic Public Key Signature API
 
 .. kernel-doc:: include/crypto/sig.h
-   :functions: crypto_alloc_sig crypto_free_sig crypto_sig_set_pubkey crypto_sig_set_privkey crypto_sig_maxsize crypto_sig_sign crypto_sig_verify
+   :functions: crypto_alloc_sig crypto_free_sig crypto_sig_set_pubkey crypto_sig_set_privkey crypto_sig_keysize crypto_sig_sign crypto_sig_verify
 
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index cc6d48cafa2b..8bf5aa329c26 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -201,7 +201,7 @@ static int software_key_query(const struct kernel_pkey_params *params,
 		if (ret < 0)
 			goto error_free_tfm;
 
-		len = crypto_sig_maxsize(sig);
+		len = crypto_sig_keysize(sig);
 
 		info->supported_ops = KEYCTL_SUPPORTS_VERIFY;
 		if (pkey->key_is_private)
@@ -332,7 +332,7 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 		if (ret)
 			goto error_free_tfm;
 
-		ksz = crypto_sig_maxsize(sig);
+		ksz = crypto_sig_keysize(sig);
 	} else {
 		tfm = crypto_alloc_akcipher(alg_name, 0, 0);
 		if (IS_ERR(tfm)) {
diff --git a/crypto/ecdsa-x962.c b/crypto/ecdsa-x962.c
index 022e654c075d..8a15232dfa77 100644
--- a/crypto/ecdsa-x962.c
+++ b/crypto/ecdsa-x962.c
@@ -81,7 +81,7 @@ static int ecdsa_x962_verify(struct crypto_sig *tfm,
 	struct ecdsa_x962_signature_ctx sig_ctx;
 	int err;
 
-	sig_ctx.ndigits = DIV_ROUND_UP(crypto_sig_maxsize(ctx->child),
+	sig_ctx.ndigits = DIV_ROUND_UP(crypto_sig_keysize(ctx->child),
 				       sizeof(u64));
 
 	err = asn1_ber_decoder(&ecdsasignature_decoder, &sig_ctx, src, slen);
@@ -92,11 +92,11 @@ static int ecdsa_x962_verify(struct crypto_sig *tfm,
 				 digest, dlen);
 }
 
-static unsigned int ecdsa_x962_max_size(struct crypto_sig *tfm)
+static unsigned int ecdsa_x962_key_size(struct crypto_sig *tfm)
 {
 	struct ecdsa_x962_ctx *ctx = crypto_sig_ctx(tfm);
 
-	return crypto_sig_maxsize(ctx->child);
+	return crypto_sig_keysize(ctx->child);
 }
 
 static int ecdsa_x962_set_pub_key(struct crypto_sig *tfm,
@@ -179,7 +179,7 @@ static int ecdsa_x962_create(struct crypto_template *tmpl, struct rtattr **tb)
 	inst->alg.exit = ecdsa_x962_exit_tfm;
 
 	inst->alg.verify = ecdsa_x962_verify;
-	inst->alg.max_size = ecdsa_x962_max_size;
+	inst->alg.key_size = ecdsa_x962_key_size;
 	inst->alg.set_pub_key = ecdsa_x962_set_pub_key;
 
 	inst->free = ecdsa_x962_free;
diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
index 1f7c29468a86..6cb0a6ce9de1 100644
--- a/crypto/ecdsa.c
+++ b/crypto/ecdsa.c
@@ -162,7 +162,7 @@ static void ecdsa_exit_tfm(struct crypto_sig *tfm)
 	ecdsa_ecc_ctx_deinit(ctx);
 }
 
-static unsigned int ecdsa_max_size(struct crypto_sig *tfm)
+static unsigned int ecdsa_key_size(struct crypto_sig *tfm)
 {
 	struct ecc_ctx *ctx = crypto_sig_ctx(tfm);
 
@@ -179,7 +179,7 @@ static int ecdsa_nist_p521_init_tfm(struct crypto_sig *tfm)
 static struct sig_alg ecdsa_nist_p521 = {
 	.verify = ecdsa_verify,
 	.set_pub_key = ecdsa_set_pub_key,
-	.max_size = ecdsa_max_size,
+	.key_size = ecdsa_key_size,
 	.init = ecdsa_nist_p521_init_tfm,
 	.exit = ecdsa_exit_tfm,
 	.base = {
@@ -201,7 +201,7 @@ static int ecdsa_nist_p384_init_tfm(struct crypto_sig *tfm)
 static struct sig_alg ecdsa_nist_p384 = {
 	.verify = ecdsa_verify,
 	.set_pub_key = ecdsa_set_pub_key,
-	.max_size = ecdsa_max_size,
+	.key_size = ecdsa_key_size,
 	.init = ecdsa_nist_p384_init_tfm,
 	.exit = ecdsa_exit_tfm,
 	.base = {
@@ -223,7 +223,7 @@ static int ecdsa_nist_p256_init_tfm(struct crypto_sig *tfm)
 static struct sig_alg ecdsa_nist_p256 = {
 	.verify = ecdsa_verify,
 	.set_pub_key = ecdsa_set_pub_key,
-	.max_size = ecdsa_max_size,
+	.key_size = ecdsa_key_size,
 	.init = ecdsa_nist_p256_init_tfm,
 	.exit = ecdsa_exit_tfm,
 	.base = {
@@ -245,7 +245,7 @@ static int ecdsa_nist_p192_init_tfm(struct crypto_sig *tfm)
 static struct sig_alg ecdsa_nist_p192 = {
 	.verify = ecdsa_verify,
 	.set_pub_key = ecdsa_set_pub_key,
-	.max_size = ecdsa_max_size,
+	.key_size = ecdsa_key_size,
 	.init = ecdsa_nist_p192_init_tfm,
 	.exit = ecdsa_exit_tfm,
 	.base = {
diff --git a/crypto/ecrdsa.c b/crypto/ecrdsa.c
index 7383dd11089b..f981b31f4249 100644
--- a/crypto/ecrdsa.c
+++ b/crypto/ecrdsa.c
@@ -241,7 +241,7 @@ static int ecrdsa_set_pub_key(struct crypto_sig *tfm, const void *key,
 	return 0;
 }
 
-static unsigned int ecrdsa_max_size(struct crypto_sig *tfm)
+static unsigned int ecrdsa_key_size(struct crypto_sig *tfm)
 {
 	struct ecrdsa_ctx *ctx = crypto_sig_ctx(tfm);
 
@@ -259,7 +259,7 @@ static void ecrdsa_exit_tfm(struct crypto_sig *tfm)
 static struct sig_alg ecrdsa_alg = {
 	.verify		= ecrdsa_verify,
 	.set_pub_key	= ecrdsa_set_pub_key,
-	.max_size	= ecrdsa_max_size,
+	.key_size	= ecrdsa_key_size,
 	.exit		= ecrdsa_exit_tfm,
 	.base = {
 		.cra_name	 = "ecrdsa",
diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
index b291ec0944a2..9c28f1c62826 100644
--- a/crypto/rsassa-pkcs1.c
+++ b/crypto/rsassa-pkcs1.c
@@ -302,7 +302,7 @@ static int rsassa_pkcs1_verify(struct crypto_sig *tfm,
 	return 0;
 }
 
-static unsigned int rsassa_pkcs1_max_size(struct crypto_sig *tfm)
+static unsigned int rsassa_pkcs1_key_size(struct crypto_sig *tfm)
 {
 	struct rsassa_pkcs1_ctx *ctx = crypto_sig_ctx(tfm);
 
@@ -419,7 +419,7 @@ static int rsassa_pkcs1_create(struct crypto_template *tmpl, struct rtattr **tb)
 
 	inst->alg.sign = rsassa_pkcs1_sign;
 	inst->alg.verify = rsassa_pkcs1_verify;
-	inst->alg.max_size = rsassa_pkcs1_max_size;
+	inst->alg.key_size = rsassa_pkcs1_key_size;
 	inst->alg.set_pub_key = rsassa_pkcs1_set_pub_key;
 	inst->alg.set_priv_key = rsassa_pkcs1_set_priv_key;
 
diff --git a/crypto/sig.c b/crypto/sig.c
index 84d0ea9fd73b..7a3521bee29a 100644
--- a/crypto/sig.c
+++ b/crypto/sig.c
@@ -125,7 +125,7 @@ int crypto_register_sig(struct sig_alg *alg)
 		alg->set_priv_key = sig_default_set_key;
 	if (!alg->set_pub_key)
 		return -EINVAL;
-	if (!alg->max_size)
+	if (!alg->key_size)
 		return -EINVAL;
 
 	sig_prepare_alg(alg);
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 19c1d01a064f..287ed2daadf4 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4319,7 +4319,7 @@ static int test_sig_one(struct crypto_sig *tfm, const struct sig_testvec *vecs)
 	if (vecs->public_key_vec)
 		return 0;
 
-	sig_size = crypto_sig_maxsize(tfm);
+	sig_size = crypto_sig_keysize(tfm);
 	if (sig_size < vecs->c_size) {
 		pr_err("alg: sig: invalid maxsize %u\n", sig_size);
 		return -EINVAL;
diff --git a/include/crypto/sig.h b/include/crypto/sig.h
index bbc902642bf5..a3ef17c5f72f 100644
--- a/include/crypto/sig.h
+++ b/include/crypto/sig.h
@@ -32,7 +32,7 @@ struct crypto_sig {
  * @set_priv_key: Function invokes the algorithm specific set private key
  *		function, which knows how to decode and interpret
  *		the BER encoded private key and parameters. Optional.
- * @max_size:	Function returns key size. Mandatory.
+ * @key_size:	Function returns key size. Mandatory.
  * @init:	Initialize the cryptographic transformation object.
  *		This function is used to initialize the cryptographic
  *		transformation object. This function is called only once at
@@ -58,7 +58,7 @@ struct sig_alg {
 			   const void *key, unsigned int keylen);
 	int (*set_priv_key)(struct crypto_sig *tfm,
 			    const void *key, unsigned int keylen);
-	unsigned int (*max_size)(struct crypto_sig *tfm);
+	unsigned int (*key_size)(struct crypto_sig *tfm);
 	int (*init)(struct crypto_sig *tfm);
 	void (*exit)(struct crypto_sig *tfm);
 
@@ -121,20 +121,20 @@ static inline void crypto_free_sig(struct crypto_sig *tfm)
 }
 
 /**
- * crypto_sig_maxsize() - Get len for output buffer
+ * crypto_sig_keysize() - Get key size
  *
- * Function returns the dest buffer size required for a given key.
+ * Function returns the key size in bytes.
  * Function assumes that the key is already set in the transformation. If this
- * function is called without a setkey or with a failed setkey, you will end up
+ * function is called without a setkey or with a failed setkey, you may end up
  * in a NULL dereference.
  *
  * @tfm:	signature tfm handle allocated with crypto_alloc_sig()
  */
-static inline int crypto_sig_maxsize(struct crypto_sig *tfm)
+static inline unsigned int crypto_sig_keysize(struct crypto_sig *tfm)
 {
 	struct sig_alg *alg = crypto_sig_alg(tfm);
 
-	return alg->max_size(tfm);
+	return alg->key_size(tfm);
 }
 
 /**
-- 
2.43.0


