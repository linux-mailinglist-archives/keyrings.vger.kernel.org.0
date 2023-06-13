Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3158F72DDEA
	for <lists+keyrings@lfdr.de>; Tue, 13 Jun 2023 11:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239111AbjFMJif (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 13 Jun 2023 05:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238497AbjFMJid (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 13 Jun 2023 05:38:33 -0400
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E0AFEC;
        Tue, 13 Jun 2023 02:38:30 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1q90Tb-002LQK-6x; Tue, 13 Jun 2023 17:38:12 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 13 Jun 2023 17:38:11 +0800
From:   "Herbert Xu" <herbert@gondor.apana.org.au>
Date:   Tue, 13 Jun 2023 17:38:11 +0800
Subject: [PATCH 2/5] crypto: dsa - Add interface for sign/verify
References: <ZIg4b8kAeW7x/oM1@gondor.apana.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        David Howells <dhowells@redhat.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Message-Id: <E1q90Tb-002LQK-6x@formenos.hmeau.com>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_00,HELO_DYNAMIC_IPADDR2,
        PDS_RDNS_DYNAMIC_FP,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,TVD_RCVD_IP,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Split out the sign/verify functionality from the existing akcipher
interface.  Most algorithms in akcipher either support encryption
and decryption, or signing and verify.  Only one supports both.

As a signature algorithm may not support encryption at all, these
two should be spearated.

For now dsa is simply a wrapper around akcipher as all algorithms
remain unchanged.  This is a first step and allows users to start
allocating dsa instead of akcipher.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 crypto/Kconfig                |   10 ++
 crypto/Makefile               |    1 
 crypto/akcipher.c             |   53 +++++++++-----
 crypto/dsa.c                  |  159 ++++++++++++++++++++++++++++++++++++++++++
 crypto/internal.h             |   20 +++++
 include/crypto/dsa.h          |  140 ++++++++++++++++++++++++++++++++++++
 include/crypto/internal/dsa.h |   17 ++++
 include/linux/crypto.h        |    3 
 8 files changed, 385 insertions(+), 18 deletions(-)

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 8b8bb97d1d77..c3c7e1108c32 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -72,6 +72,15 @@ config CRYPTO_AEAD2
 	tristate
 	select CRYPTO_ALGAPI2
 
+config CRYPTO_DSA
+	tristate
+	select CRYPTO_DSA2
+	select CRYPTO_ALGAPI
+
+config CRYPTO_DSA2
+	tristate
+	select CRYPTO_ALGAPI2
+
 config CRYPTO_SKCIPHER
 	tristate
 	select CRYPTO_SKCIPHER2
@@ -143,6 +152,7 @@ config CRYPTO_MANAGER2
 	select CRYPTO_ACOMP2
 	select CRYPTO_AEAD2
 	select CRYPTO_AKCIPHER2
+	select CRYPTO_DSA2
 	select CRYPTO_HASH2
 	select CRYPTO_KPP2
 	select CRYPTO_RNG2
diff --git a/crypto/Makefile b/crypto/Makefile
index 155ab671a1b4..9bdb0af75f73 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -25,6 +25,7 @@ crypto_hash-y += shash.o
 obj-$(CONFIG_CRYPTO_HASH2) += crypto_hash.o
 
 obj-$(CONFIG_CRYPTO_AKCIPHER2) += akcipher.o
+obj-$(CONFIG_CRYPTO_DSA2) += dsa.o
 obj-$(CONFIG_CRYPTO_KPP2) += kpp.o
 
 dh_generic-y := dh.o
diff --git a/crypto/akcipher.c b/crypto/akcipher.c
index 2d10b58c4010..76ab150b5df4 100644
--- a/crypto/akcipher.c
+++ b/crypto/akcipher.c
@@ -18,18 +18,7 @@
 
 #include "internal.h"
 
-struct crypto_akcipher_sync_data {
-	struct crypto_akcipher *tfm;
-	const void *src;
-	void *dst;
-	unsigned int slen;
-	unsigned int dlen;
-
-	struct akcipher_request *req;
-	struct crypto_wait cwait;
-	struct scatterlist sg;
-	u8 *buf;
-};
+#define CRYPTO_ALG_TYPE_AHASH_MASK	0x0000000e
 
 static int __maybe_unused crypto_akcipher_report(
 	struct sk_buff *skb, struct crypto_alg *alg)
@@ -119,7 +108,7 @@ static const struct crypto_type crypto_akcipher_type = {
 	.report_stat = crypto_akcipher_report_stat,
 #endif
 	.maskclear = ~CRYPTO_ALG_TYPE_MASK,
-	.maskset = CRYPTO_ALG_TYPE_MASK,
+	.maskset = CRYPTO_ALG_TYPE_AHASH_MASK,
 	.type = CRYPTO_ALG_TYPE_AKCIPHER,
 	.tfmsize = offsetof(struct crypto_akcipher, base),
 };
@@ -200,7 +189,7 @@ int akcipher_register_instance(struct crypto_template *tmpl,
 }
 EXPORT_SYMBOL_GPL(akcipher_register_instance);
 
-static int crypto_akcipher_sync_prep(struct crypto_akcipher_sync_data *data)
+int crypto_akcipher_sync_prep(struct crypto_akcipher_sync_data *data)
 {
 	unsigned int reqsize = crypto_akcipher_reqsize(data->tfm);
 	unsigned int mlen = max(data->slen, data->dlen);
@@ -223,7 +212,7 @@ static int crypto_akcipher_sync_prep(struct crypto_akcipher_sync_data *data)
 	data->buf = buf;
 	memcpy(buf, data->src, data->slen);
 
-	sg = &data->sg;
+	sg = data->sg;
 	sg_init_one(sg, buf, mlen);
 	akcipher_request_set_crypt(req, sg, sg, data->slen, data->dlen);
 
@@ -233,9 +222,9 @@ static int crypto_akcipher_sync_prep(struct crypto_akcipher_sync_data *data)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(crypto_akcipher_sync_prep);
 
-static int crypto_akcipher_sync_post(struct crypto_akcipher_sync_data *data,
-				     int err)
+int crypto_akcipher_sync_post(struct crypto_akcipher_sync_data *data, int err)
 {
 	err = crypto_wait_req(err, &data->cwait);
 	memcpy(data->dst, data->buf, data->dlen);
@@ -243,6 +232,7 @@ static int crypto_akcipher_sync_post(struct crypto_akcipher_sync_data *data,
 	kfree_sensitive(data->req);
 	return err;
 }
+EXPORT_SYMBOL_GPL(crypto_akcipher_sync_post);
 
 int crypto_akcipher_sync_encrypt(struct crypto_akcipher *tfm,
 				 const void *src, unsigned int slen,
@@ -281,5 +271,34 @@ int crypto_akcipher_sync_decrypt(struct crypto_akcipher *tfm,
 }
 EXPORT_SYMBOL_GPL(crypto_akcipher_sync_decrypt);
 
+static void crypto_exit_akcipher_ops_dsa(struct crypto_tfm *tfm)
+{
+	struct crypto_akcipher **ctx = crypto_tfm_ctx(tfm);
+
+	crypto_free_akcipher(*ctx);
+}
+
+int crypto_init_akcipher_ops_dsa(struct crypto_tfm *tfm)
+{
+	struct crypto_akcipher **ctx = crypto_tfm_ctx(tfm);
+	struct crypto_alg *calg = tfm->__crt_alg;
+	struct crypto_akcipher *akcipher;
+
+	if (!crypto_mod_get(calg))
+		return -EAGAIN;
+
+	akcipher = crypto_create_tfm(calg, &crypto_akcipher_type);
+	if (IS_ERR(akcipher)) {
+		crypto_mod_put(calg);
+		return PTR_ERR(akcipher);
+	}
+
+	*ctx = akcipher;
+	tfm->exit = crypto_exit_akcipher_ops_dsa;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(crypto_init_akcipher_ops_dsa);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Generic public key cipher type");
diff --git a/crypto/dsa.c b/crypto/dsa.c
new file mode 100644
index 000000000000..36ea2d0828b1
--- /dev/null
+++ b/crypto/dsa.c
@@ -0,0 +1,159 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Digital Signature Algorithm
+ *
+ * Copyright (c) 2023 Herbert Xu <herbert@gondor.apana.org.au>
+ */
+
+#include <crypto/akcipher.h>
+#include <crypto/internal/dsa.h>
+#include <linux/cryptouser.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/scatterlist.h>
+#include <linux/seq_file.h>
+#include <linux/string.h>
+#include <net/netlink.h>
+
+#include "internal.h"
+
+#define CRYPTO_ALG_TYPE_DSA_MASK	0x0000000e
+
+static const struct crypto_type crypto_dsa_type;
+
+static inline struct crypto_dsa *__crypto_dsa_tfm(struct crypto_tfm *tfm)
+{
+	return container_of(tfm, struct crypto_dsa, base);
+}
+
+static int crypto_dsa_init_tfm(struct crypto_tfm *tfm)
+{
+	if (tfm->__crt_alg->cra_type != &crypto_dsa_type)
+		return crypto_init_akcipher_ops_dsa(tfm);
+
+	return 0;
+}
+
+static void __maybe_unused crypto_dsa_show(struct seq_file *m,
+					   struct crypto_alg *alg)
+{
+	seq_puts(m, "type         : dsa\n");
+}
+
+static int __maybe_unused crypto_dsa_report(struct sk_buff *skb,
+					    struct crypto_alg *alg)
+{
+	struct crypto_report_akcipher rdsa = {};
+
+	strscpy(rdsa.type, "dsa", sizeof(rdsa.type));
+
+	return nla_put(skb, CRYPTOCFGA_REPORT_AKCIPHER, sizeof(rdsa), &rdsa);
+}
+
+static int __maybe_unused crypto_dsa_report_stat(struct sk_buff *skb,
+						 struct crypto_alg *alg)
+{
+	struct crypto_stat_akcipher rdsa = {};
+
+	strscpy(rdsa.type, "dsa", sizeof(rdsa.type));
+
+	return nla_put(skb, CRYPTOCFGA_STAT_AKCIPHER, sizeof(rdsa), &rdsa);
+}
+
+static const struct crypto_type crypto_dsa_type = {
+	.extsize = crypto_alg_extsize,
+	.init_tfm = crypto_dsa_init_tfm,
+#ifdef CONFIG_PROC_FS
+	.show = crypto_dsa_show,
+#endif
+#if IS_ENABLED(CONFIG_CRYPTO_USER)
+	.report = crypto_dsa_report,
+#endif
+#ifdef CONFIG_CRYPTO_STATS
+	.report_stat = crypto_dsa_report_stat,
+#endif
+	.maskclear = ~CRYPTO_ALG_TYPE_MASK,
+	.maskset = CRYPTO_ALG_TYPE_DSA_MASK,
+	.type = CRYPTO_ALG_TYPE_DSA,
+	.tfmsize = offsetof(struct crypto_dsa, base),
+};
+
+struct crypto_dsa *crypto_alloc_dsa(const char *alg_name, u32 type, u32 mask)
+{
+	return crypto_alloc_tfm(alg_name, &crypto_dsa_type, type, mask);
+}
+EXPORT_SYMBOL_GPL(crypto_alloc_dsa);
+
+int crypto_dsa_maxsize(struct crypto_dsa *tfm)
+{
+	struct crypto_akcipher **ctx = crypto_dsa_ctx(tfm);
+
+	return crypto_akcipher_maxsize(*ctx);
+}
+EXPORT_SYMBOL_GPL(crypto_dsa_maxsize);
+
+int crypto_dsa_sign(struct crypto_dsa *tfm,
+		    const void *src, unsigned int slen,
+		    void *dst, unsigned int dlen)
+{
+	struct crypto_akcipher **ctx = crypto_dsa_ctx(tfm);
+	struct crypto_akcipher_sync_data data = {
+		.tfm = *ctx,
+		.src = src,
+		.dst = dst,
+		.slen = slen,
+		.dlen = dlen,
+	};
+
+	return crypto_akcipher_sync_prep(&data) ?:
+	       crypto_akcipher_sync_post(&data,
+					 crypto_akcipher_sign(data.req));
+}
+EXPORT_SYMBOL_GPL(crypto_dsa_sign);
+
+int crypto_dsa_verify(struct crypto_dsa *tfm,
+		      const void *src, unsigned int slen,
+		      const void *digest, unsigned int dlen)
+{
+	struct crypto_akcipher **ctx = crypto_dsa_ctx(tfm);
+	struct crypto_akcipher_sync_data data = {
+		.tfm = *ctx,
+		.src = src,
+		.slen = slen,
+		.dlen = dlen,
+	};
+	int err;
+
+	err = crypto_akcipher_sync_prep(&data);
+	if (err)
+		return err;
+
+	sg_init_table(data.sg, 2);
+	sg_set_buf(&data.sg[0], src, slen);
+	sg_set_buf(&data.sg[1], digest, dlen);
+
+	return crypto_akcipher_sync_post(&data,
+					 crypto_akcipher_verify(data.req));
+}
+EXPORT_SYMBOL_GPL(crypto_dsa_verify);
+
+int crypto_dsa_set_pubkey(struct crypto_dsa *tfm,
+			  const void *key, unsigned int keylen)
+{
+	struct crypto_akcipher **ctx = crypto_dsa_ctx(tfm);
+
+	return crypto_akcipher_set_pub_key(*ctx, key, keylen);
+}
+EXPORT_SYMBOL_GPL(crypto_dsa_set_pubkey);
+
+int crypto_dsa_set_privkey(struct crypto_dsa *tfm,
+			  const void *key, unsigned int keylen)
+{
+	struct crypto_akcipher **ctx = crypto_dsa_ctx(tfm);
+
+	return crypto_akcipher_set_priv_key(*ctx, key, keylen);
+}
+EXPORT_SYMBOL_GPL(crypto_dsa_set_privkey);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Digital Signature Algorithms");
diff --git a/crypto/internal.h b/crypto/internal.h
index 8dd746b1130b..024c2c795f59 100644
--- a/crypto/internal.h
+++ b/crypto/internal.h
@@ -18,9 +18,12 @@
 #include <linux/numa.h>
 #include <linux/refcount.h>
 #include <linux/rwsem.h>
+#include <linux/scatterlist.h>
 #include <linux/sched.h>
 #include <linux/types.h>
 
+struct akcipher_request;
+struct crypto_akcipher;
 struct crypto_instance;
 struct crypto_template;
 
@@ -32,6 +35,19 @@ struct crypto_larval {
 	bool test_started;
 };
 
+struct crypto_akcipher_sync_data {
+	struct crypto_akcipher *tfm;
+	const void *src;
+	void *dst;
+	unsigned int slen;
+	unsigned int dlen;
+
+	struct akcipher_request *req;
+	struct crypto_wait cwait;
+	struct scatterlist sg[2];
+	u8 *buf;
+};
+
 enum {
 	CRYPTOA_UNSPEC,
 	CRYPTOA_ALG,
@@ -109,6 +125,10 @@ void *crypto_create_tfm_node(struct crypto_alg *alg,
 void *crypto_clone_tfm(const struct crypto_type *frontend,
 		       struct crypto_tfm *otfm);
 
+int crypto_akcipher_sync_prep(struct crypto_akcipher_sync_data *data);
+int crypto_akcipher_sync_post(struct crypto_akcipher_sync_data *data, int err);
+int crypto_init_akcipher_ops_dsa(struct crypto_tfm *tfm);
+
 static inline void *crypto_create_tfm(struct crypto_alg *alg,
 			const struct crypto_type *frontend)
 {
diff --git a/include/crypto/dsa.h b/include/crypto/dsa.h
new file mode 100644
index 000000000000..98ce39e9d054
--- /dev/null
+++ b/include/crypto/dsa.h
@@ -0,0 +1,140 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Digital Signature Algorithm
+ *
+ * Copyright (c) 2023 Herbert Xu <herbert@gondor.apana.org.au>
+ */
+#ifndef _CRYPTO_DSA_H
+#define _CRYPTO_DSA_H
+
+#include <linux/crypto.h>
+
+/**
+ * struct crypto_dsa - user-instantiated objects which encapsulate
+ * algorithms and core processing logic
+ *
+ * @base:	Common crypto API algorithm data structure
+ */
+struct crypto_dsa {
+	struct crypto_tfm base;
+};
+
+/**
+ * DOC: Generic Digital Signature API
+ *
+ * The Digital Signature API is used with the algorithms of type
+ * CRYPTO_ALG_TYPE_DSA (listed as type "dsa" in /proc/crypto)
+ */
+
+/**
+ * crypto_alloc_dsa() - allocate DSA tfm handle
+ * @alg_name: is the cra_name / name or cra_driver_name / driver name of the
+ *	      signing algorithm e.g. "ecdsa"
+ * @type: specifies the type of the algorithm
+ * @mask: specifies the mask for the algorithm
+ *
+ * Allocate a handle for digital signature algorithm. The returned struct
+ * crypto_dsa is the handle that is required for any subsequent
+ * API invocation for signature operations.
+ *
+ * Return: allocated handle in case of success; IS_ERR() is true in case
+ *	   of an error, PTR_ERR() returns the error code.
+ */
+struct crypto_dsa *crypto_alloc_dsa(const char *alg_name, u32 type, u32 mask);
+
+static inline struct crypto_tfm *crypto_dsa_tfm(struct crypto_dsa *tfm)
+{
+	return &tfm->base;
+}
+
+/**
+ * crypto_free_dsa() - free DSA tfm handle
+ *
+ * @tfm: DSA tfm handle allocated with crypto_alloc_dsa()
+ *
+ * If @tfm is a NULL or error pointer, this function does nothing.
+ */
+static inline void crypto_free_dsa(struct crypto_dsa *tfm)
+{
+	crypto_destroy_tfm(tfm, crypto_dsa_tfm(tfm));
+}
+
+/**
+ * crypto_dsa_maxsize() - Get len for output buffer
+ *
+ * Function returns the dest buffer size required for a given key.
+ * Function assumes that the key is already set in the transformation. If this
+ * function is called without a setkey or with a failed setkey, you will end up
+ * in a NULL dereference.
+ *
+ * @tfm:	DSA tfm handle allocated with crypto_alloc_dsa()
+ */
+int crypto_dsa_maxsize(struct crypto_dsa *tfm);
+
+/**
+ * crypto_dsa_sign() - Invoke signing operation
+ *
+ * Function invokes the specific signing operation for a given DSA
+ *
+ * @tfm:	DSA tfm handle allocated with crypto_alloc_dsa()
+ * @src:	source buffer
+ * @slen:	source length
+ * @dst:	destinatino obuffer
+ * @dlen:	destination length
+ *
+ * Return: zero on success; error code in case of error
+ */
+int crypto_dsa_sign(struct crypto_dsa *tfm,
+		    const void *src, unsigned int slen,
+		    void *dst, unsigned int dlen);
+
+/**
+ * crypto_dsa_verify() - Invoke signature verification
+ *
+ * Function invokes the specific signature verification operation
+ * for a given DSA.
+ *
+ * @tfm:	DSA tfm handle allocated with crypto_alloc_dsa()
+ * @src:	source buffer
+ * @slen:	source length
+ * @digest:	digest
+ * @dlen:	digest length
+ *
+ * Return: zero on verification success; error code in case of error.
+ */
+int crypto_dsa_verify(struct crypto_dsa *tfm,
+		      const void *src, unsigned int slen,
+		      const void *digest, unsigned int dlen);
+
+/**
+ * crypto_dsa_set_pubkey() - Invoke set public key operation
+ *
+ * Function invokes the algorithm specific set key function, which knows
+ * how to decode and interpret the encoded key and parameters
+ *
+ * @tfm:	tfm handle
+ * @key:	BER encoded public key, algo OID, paramlen, BER encoded
+ *		parameters
+ * @keylen:	length of the key (not including other data)
+ *
+ * Return: zero on success; error code in case of error
+ */
+int crypto_dsa_set_pubkey(struct crypto_dsa *tfm,
+			  const void *key, unsigned int keylen);
+
+/**
+ * crypto_dsa_set_privkey() - Invoke set private key operation
+ *
+ * Function invokes the algorithm specific set key function, which knows
+ * how to decode and interpret the encoded key and parameters
+ *
+ * @tfm:	tfm handle
+ * @key:	BER encoded private key, algo OID, paramlen, BER encoded
+ *		parameters
+ * @keylen:	length of the key (not including other data)
+ *
+ * Return: zero on success; error code in case of error
+ */
+int crypto_dsa_set_privkey(struct crypto_dsa *tfm,
+			   const void *key, unsigned int keylen);
+#endif
diff --git a/include/crypto/internal/dsa.h b/include/crypto/internal/dsa.h
new file mode 100644
index 000000000000..5586551693e4
--- /dev/null
+++ b/include/crypto/internal/dsa.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Digital Signature Algorithm
+ *
+ * Copyright (c) 2023 Herbert Xu <herbert@gondor.apana.org.au>
+ */
+#ifndef _CRYPTO_INTERNAL_DSA_H
+#define _CRYPTO_INTERNAL_DSA_H
+
+#include <crypto/algapi.h>
+#include <crypto/dsa.h>
+
+static inline void *crypto_dsa_ctx(struct crypto_dsa *tfm)
+{
+	return crypto_tfm_ctx(&tfm->base);
+}
+#endif
diff --git a/include/linux/crypto.h b/include/linux/crypto.h
index fa310ac1db59..fbf3139c11f0 100644
--- a/include/linux/crypto.h
+++ b/include/linux/crypto.h
@@ -25,11 +25,12 @@
 #define CRYPTO_ALG_TYPE_COMPRESS	0x00000002
 #define CRYPTO_ALG_TYPE_AEAD		0x00000003
 #define CRYPTO_ALG_TYPE_SKCIPHER	0x00000005
+#define CRYPTO_ALG_TYPE_AKCIPHER	0x00000006
+#define CRYPTO_ALG_TYPE_DSA		0x00000007
 #define CRYPTO_ALG_TYPE_KPP		0x00000008
 #define CRYPTO_ALG_TYPE_ACOMPRESS	0x0000000a
 #define CRYPTO_ALG_TYPE_SCOMPRESS	0x0000000b
 #define CRYPTO_ALG_TYPE_RNG		0x0000000c
-#define CRYPTO_ALG_TYPE_AKCIPHER	0x0000000d
 #define CRYPTO_ALG_TYPE_HASH		0x0000000e
 #define CRYPTO_ALG_TYPE_SHASH		0x0000000e
 #define CRYPTO_ALG_TYPE_AHASH		0x0000000f
