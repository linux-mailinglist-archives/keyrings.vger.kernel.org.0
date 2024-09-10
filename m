Return-Path: <keyrings+bounces-1953-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 043D0973AA4
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 16:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 241E81C21390
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 14:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A441E1957F9;
	Tue, 10 Sep 2024 14:54:25 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE033189903;
	Tue, 10 Sep 2024 14:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725980065; cv=none; b=MfDdw6ePS/qKklERotLUdNaphQ4QprW3WDsO+wOPa4iynqgdNEgqKHnzB/4cxI2O4k6XAQe1gmipoNvhYuWZNetHmmULVhWIBSLEs72oDWFAwdug5SljhNgFa5n6YcewmYHi6883yg/LhTlRoeWBjI8YOBekNal81+N3PD/jNpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725980065; c=relaxed/simple;
	bh=E9SdjXjKIXBxufAYwAklvvq9YuDaJHJ45dA6EoF/fKE=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=JGfHfsI5FEIA+pvquKZX9wg0ut6hQlBsq9yd2XyYkuPUFwDYdUG6ECwIaRIMTtgm8s/cLpAm5t55QqdZTL1JyiUbjd5YzXlQgU/QkZzlHi+NazcxlRjqbw8R1T8AE4E5Izx7xrGu/d2dJW/WeOMH/0DWUEp9vkQxkdO2ybo7Xg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=176.9.242.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id BB17A10173F91;
	Tue, 10 Sep 2024 16:44:32 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 792F76039371;
	Tue, 10 Sep 2024 16:44:32 +0200 (CEST)
X-Mailbox-Line: From 688e92e7db6f2de1778691bb7cdafe3bb39e73c6 Mon Sep 17 00:00:00 2001
Message-ID: <688e92e7db6f2de1778691bb7cdafe3bb39e73c6.1725972334.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:12 +0200
Subject: [PATCH v2 02/19] crypto: sig - Introduce sig_alg backend
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

Commit 6cb8815f41a9 ("crypto: sig - Add interface for sign/verify")
began a transition of asymmetric sign/verify operations from
crypto_akcipher to a new crypto_sig frontend.

Internally, the crypto_sig frontend still uses akcipher_alg as backend,
however:

   "The link between sig and akcipher is meant to be temporary.  The
    plan is to create a new low-level API for sig and then migrate
    the signature code over to that from akcipher."
    https://lore.kernel.org/r/ZrG6w9wsb-iiLZIF@gondor.apana.org.au/

   "having a separate alg for sig is definitely where we want to
    be since there is very little that the two types actually share."
    https://lore.kernel.org/r/ZrHlpz4qnre0zWJO@gondor.apana.org.au/

Take the next step of that migration and augment the crypto_sig frontend
with a sig_alg backend to which all algorithms can be moved.

During the migration, there will briefly be signature algorithms that
are still based on crypto_akcipher, whilst others are already based on
crypto_sig.  Allow for that by building a fork into crypto_sig_*() API
calls (i.e. crypto_sig_maxsize() and friends) such that one of the two
backends is selected based on the transform's cra_type.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 Documentation/crypto/api-sig.rst      |  15 +++
 Documentation/crypto/api.rst          |   1 +
 Documentation/crypto/architecture.rst |   2 +
 crypto/sig.c                          | 143 +++++++++++++++++++++++++-
 crypto/testmgr.c                      | 115 +++++++++++++++++++++
 crypto/testmgr.h                      |  13 +++
 include/crypto/internal/sig.h         |  80 ++++++++++++++
 include/crypto/sig.h                  |  61 +++++++++++
 include/uapi/linux/cryptouser.h       |   5 +
 9 files changed, 433 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/crypto/api-sig.rst

diff --git a/Documentation/crypto/api-sig.rst b/Documentation/crypto/api-sig.rst
new file mode 100644
index 000000000000..e5e87e106884
--- /dev/null
+++ b/Documentation/crypto/api-sig.rst
@@ -0,0 +1,15 @@
+Asymmetric Signature Algorithm Definitions
+------------------------------------------
+
+.. kernel-doc:: include/crypto/sig.h
+   :functions: sig_alg
+
+Asymmetric Signature API
+------------------------
+
+.. kernel-doc:: include/crypto/sig.h
+   :doc: Generic Public Key Signature API
+
+.. kernel-doc:: include/crypto/sig.h
+   :functions: crypto_alloc_sig crypto_free_sig crypto_sig_set_pubkey crypto_sig_set_privkey crypto_sig_maxsize crypto_sig_sign crypto_sig_verify
+
diff --git a/Documentation/crypto/api.rst b/Documentation/crypto/api.rst
index ff31c30561d4..8b2a90521886 100644
--- a/Documentation/crypto/api.rst
+++ b/Documentation/crypto/api.rst
@@ -10,4 +10,5 @@ Programming Interface
    api-digest
    api-rng
    api-akcipher
+   api-sig
    api-kpp
diff --git a/Documentation/crypto/architecture.rst b/Documentation/crypto/architecture.rst
index 646c3380a7ed..15dcd62fd22f 100644
--- a/Documentation/crypto/architecture.rst
+++ b/Documentation/crypto/architecture.rst
@@ -214,6 +214,8 @@ the aforementioned cipher types:
 
 -  CRYPTO_ALG_TYPE_AKCIPHER Asymmetric cipher
 
+-  CRYPTO_ALG_TYPE_SIG Asymmetric signature
+
 -  CRYPTO_ALG_TYPE_PCOMPRESS Enhanced version of
    CRYPTO_ALG_TYPE_COMPRESS allowing for segmented compression /
    decompression instead of performing the operation on one segment
diff --git a/crypto/sig.c b/crypto/sig.c
index 7645bedf3a1f..4f36ceb7a90b 100644
--- a/crypto/sig.c
+++ b/crypto/sig.c
@@ -21,14 +21,38 @@
 
 static const struct crypto_type crypto_sig_type;
 
+static void crypto_sig_exit_tfm(struct crypto_tfm *tfm)
+{
+	struct crypto_sig *sig = __crypto_sig_tfm(tfm);
+	struct sig_alg *alg = crypto_sig_alg(sig);
+
+	alg->exit(sig);
+}
+
 static int crypto_sig_init_tfm(struct crypto_tfm *tfm)
 {
 	if (tfm->__crt_alg->cra_type != &crypto_sig_type)
 		return crypto_init_akcipher_ops_sig(tfm);
 
+	struct crypto_sig *sig = __crypto_sig_tfm(tfm);
+	struct sig_alg *alg = crypto_sig_alg(sig);
+
+	if (alg->exit)
+		sig->base.exit = crypto_sig_exit_tfm;
+
+	if (alg->init)
+		return alg->init(sig);
+
 	return 0;
 }
 
+static void crypto_sig_free_instance(struct crypto_instance *inst)
+{
+	struct sig_instance *sig = sig_instance(inst);
+
+	sig->free(sig);
+}
+
 static void __maybe_unused crypto_sig_show(struct seq_file *m,
 					   struct crypto_alg *alg)
 {
@@ -38,16 +62,17 @@ static void __maybe_unused crypto_sig_show(struct seq_file *m,
 static int __maybe_unused crypto_sig_report(struct sk_buff *skb,
 					    struct crypto_alg *alg)
 {
-	struct crypto_report_akcipher rsig = {};
+	struct crypto_report_sig rsig = {};
 
 	strscpy(rsig.type, "sig", sizeof(rsig.type));
 
-	return nla_put(skb, CRYPTOCFGA_REPORT_AKCIPHER, sizeof(rsig), &rsig);
+	return nla_put(skb, CRYPTOCFGA_REPORT_SIG, sizeof(rsig), &rsig);
 }
 
 static const struct crypto_type crypto_sig_type = {
 	.extsize = crypto_alg_extsize,
 	.init_tfm = crypto_sig_init_tfm,
+	.free = crypto_sig_free_instance,
 #ifdef CONFIG_PROC_FS
 	.show = crypto_sig_show,
 #endif
@@ -68,6 +93,14 @@ EXPORT_SYMBOL_GPL(crypto_alloc_sig);
 
 int crypto_sig_maxsize(struct crypto_sig *tfm)
 {
+	if (crypto_sig_tfm(tfm)->__crt_alg->cra_type != &crypto_sig_type)
+		goto akcipher;
+
+	struct sig_alg *alg = crypto_sig_alg(tfm);
+
+	return alg->max_size(tfm);
+
+akcipher:
 	struct crypto_akcipher **ctx = crypto_sig_ctx(tfm);
 
 	return crypto_akcipher_maxsize(*ctx);
@@ -78,6 +111,14 @@ int crypto_sig_sign(struct crypto_sig *tfm,
 		    const void *src, unsigned int slen,
 		    void *dst, unsigned int dlen)
 {
+	if (crypto_sig_tfm(tfm)->__crt_alg->cra_type != &crypto_sig_type)
+		goto akcipher;
+
+	struct sig_alg *alg = crypto_sig_alg(tfm);
+
+	return alg->sign(tfm, src, slen, dst, dlen);
+
+akcipher:
 	struct crypto_akcipher **ctx = crypto_sig_ctx(tfm);
 	struct crypto_akcipher_sync_data data = {
 		.tfm = *ctx,
@@ -97,6 +138,14 @@ int crypto_sig_verify(struct crypto_sig *tfm,
 		      const void *src, unsigned int slen,
 		      const void *digest, unsigned int dlen)
 {
+	if (crypto_sig_tfm(tfm)->__crt_alg->cra_type != &crypto_sig_type)
+		goto akcipher;
+
+	struct sig_alg *alg = crypto_sig_alg(tfm);
+
+	return alg->verify(tfm, src, slen, digest, dlen);
+
+akcipher:
 	struct crypto_akcipher **ctx = crypto_sig_ctx(tfm);
 	struct crypto_akcipher_sync_data data = {
 		.tfm = *ctx,
@@ -120,6 +169,14 @@ EXPORT_SYMBOL_GPL(crypto_sig_verify);
 int crypto_sig_set_pubkey(struct crypto_sig *tfm,
 			  const void *key, unsigned int keylen)
 {
+	if (crypto_sig_tfm(tfm)->__crt_alg->cra_type != &crypto_sig_type)
+		goto akcipher;
+
+	struct sig_alg *alg = crypto_sig_alg(tfm);
+
+	return alg->set_pub_key(tfm, key, keylen);
+
+akcipher:
 	struct crypto_akcipher **ctx = crypto_sig_ctx(tfm);
 
 	return crypto_akcipher_set_pub_key(*ctx, key, keylen);
@@ -129,11 +186,93 @@ EXPORT_SYMBOL_GPL(crypto_sig_set_pubkey);
 int crypto_sig_set_privkey(struct crypto_sig *tfm,
 			  const void *key, unsigned int keylen)
 {
+	if (crypto_sig_tfm(tfm)->__crt_alg->cra_type != &crypto_sig_type)
+		goto akcipher;
+
+	struct sig_alg *alg = crypto_sig_alg(tfm);
+
+	return alg->set_priv_key(tfm, key, keylen);
+
+akcipher:
 	struct crypto_akcipher **ctx = crypto_sig_ctx(tfm);
 
 	return crypto_akcipher_set_priv_key(*ctx, key, keylen);
 }
 EXPORT_SYMBOL_GPL(crypto_sig_set_privkey);
 
+static void sig_prepare_alg(struct sig_alg *alg)
+{
+	struct crypto_alg *base = &alg->base;
+
+	base->cra_type = &crypto_sig_type;
+	base->cra_flags &= ~CRYPTO_ALG_TYPE_MASK;
+	base->cra_flags |= CRYPTO_ALG_TYPE_SIG;
+}
+
+static int sig_default_sign(struct crypto_sig *tfm,
+			    const void *src, unsigned int slen,
+			    void *dst, unsigned int dlen)
+{
+	return -ENOSYS;
+}
+
+static int sig_default_verify(struct crypto_sig *tfm,
+			      const void *src, unsigned int slen,
+			      const void *dst, unsigned int dlen)
+{
+	return -ENOSYS;
+}
+
+static int sig_default_set_key(struct crypto_sig *tfm,
+			       const void *key, unsigned int keylen)
+{
+	return -ENOSYS;
+}
+
+int crypto_register_sig(struct sig_alg *alg)
+{
+	struct crypto_alg *base = &alg->base;
+
+	if (!alg->sign)
+		alg->sign = sig_default_sign;
+	if (!alg->verify)
+		alg->verify = sig_default_verify;
+	if (!alg->set_priv_key)
+		alg->set_priv_key = sig_default_set_key;
+	if (!alg->set_pub_key)
+		return -EINVAL;
+	if (!alg->max_size)
+		return -EINVAL;
+
+	sig_prepare_alg(alg);
+	return crypto_register_alg(base);
+}
+EXPORT_SYMBOL_GPL(crypto_register_sig);
+
+void crypto_unregister_sig(struct sig_alg *alg)
+{
+	crypto_unregister_alg(&alg->base);
+}
+EXPORT_SYMBOL_GPL(crypto_unregister_sig);
+
+int sig_register_instance(struct crypto_template *tmpl,
+			  struct sig_instance *inst)
+{
+	if (WARN_ON(!inst->free))
+		return -EINVAL;
+	sig_prepare_alg(&inst->alg);
+	return crypto_register_instance(tmpl, sig_crypto_instance(inst));
+}
+EXPORT_SYMBOL_GPL(sig_register_instance);
+
+int crypto_grab_sig(struct crypto_sig_spawn *spawn,
+		    struct crypto_instance *inst,
+		    const char *name, u32 type, u32 mask)
+{
+	spawn->base.frontend = &crypto_sig_type;
+	return crypto_grab_spawn(&spawn->base, inst, name, type, mask);
+}
+EXPORT_SYMBOL_GPL(crypto_grab_sig);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Public Key Signature Algorithms");
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index f02cb075bd68..bb21378aa510 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -33,6 +33,7 @@
 #include <crypto/akcipher.h>
 #include <crypto/kpp.h>
 #include <crypto/acompress.h>
+#include <crypto/sig.h>
 #include <crypto/internal/cipher.h>
 #include <crypto/internal/simd.h>
 
@@ -131,6 +132,11 @@ struct akcipher_test_suite {
 	unsigned int count;
 };
 
+struct sig_test_suite {
+	const struct sig_testvec *vecs;
+	unsigned int count;
+};
+
 struct kpp_test_suite {
 	const struct kpp_testvec *vecs;
 	unsigned int count;
@@ -151,6 +157,7 @@ struct alg_test_desc {
 		struct cprng_test_suite cprng;
 		struct drbg_test_suite drbg;
 		struct akcipher_test_suite akcipher;
+		struct sig_test_suite sig;
 		struct kpp_test_suite kpp;
 	} suite;
 };
@@ -4317,6 +4324,114 @@ static int alg_test_akcipher(const struct alg_test_desc *desc,
 	return err;
 }
 
+static int test_sig_one(struct crypto_sig *tfm, const struct sig_testvec *vecs)
+{
+	u8 *ptr, *key __free(kfree);
+	int err, sig_size;
+
+	key = kmalloc(vecs->key_len + 2 * sizeof(u32) + vecs->param_len,
+		      GFP_KERNEL);
+	if (!key)
+		return -ENOMEM;
+
+	/* ecrdsa expects additional parameters appended to the key */
+	memcpy(key, vecs->key, vecs->key_len);
+	ptr = key + vecs->key_len;
+	ptr = test_pack_u32(ptr, vecs->algo);
+	ptr = test_pack_u32(ptr, vecs->param_len);
+	memcpy(ptr, vecs->params, vecs->param_len);
+
+	if (vecs->public_key_vec)
+		err = crypto_sig_set_pubkey(tfm, key, vecs->key_len);
+	else
+		err = crypto_sig_set_privkey(tfm, key, vecs->key_len);
+	if (err)
+		return err;
+
+	/*
+	 * Run asymmetric signature verification first
+	 * (which does not require a private key)
+	 */
+	err = crypto_sig_verify(tfm, vecs->c, vecs->c_size,
+				vecs->m, vecs->m_size);
+	if (err) {
+		pr_err("alg: sig: verify test failed: err %d\n", err);
+		return err;
+	}
+
+	/*
+	 * Don't invoke sign test (which requires a private key)
+	 * for vectors with only a public key.
+	 */
+	if (vecs->public_key_vec)
+		return 0;
+
+	sig_size = crypto_sig_maxsize(tfm);
+	if (sig_size < vecs->c_size) {
+		pr_err("alg: sig: invalid maxsize %u\n", sig_size);
+		return -EINVAL;
+	}
+
+	u8 *sig __free(kfree) = kzalloc(sig_size, GFP_KERNEL);
+	if (!sig)
+		return -ENOMEM;
+
+	/* Run asymmetric signature generation */
+	err = crypto_sig_sign(tfm, vecs->m, vecs->m_size, sig, sig_size);
+	if (err) {
+		pr_err("alg: sig: sign test failed: err %d\n", err);
+		return err;
+	}
+
+	/* Verify that generated signature equals cooked signature */
+	if (memcmp(sig, vecs->c, vecs->c_size) ||
+	    memchr_inv(sig + vecs->c_size, 0, sig_size - vecs->c_size)) {
+		pr_err("alg: sig: sign test failed: invalid output\n");
+		hexdump(sig, sig_size);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int test_sig(struct crypto_sig *tfm, const char *alg,
+		    const struct sig_testvec *vecs, unsigned int tcount)
+{
+	const char *algo = crypto_tfm_alg_driver_name(crypto_sig_tfm(tfm));
+	int ret, i;
+
+	for (i = 0; i < tcount; i++) {
+		ret = test_sig_one(tfm, vecs++);
+		if (ret) {
+			pr_err("alg: sig: test %d failed for %s: err %d\n",
+			       i + 1, algo, ret);
+			return ret;
+		}
+	}
+	return 0;
+}
+
+__maybe_unused
+static int alg_test_sig(const struct alg_test_desc *desc, const char *driver,
+			u32 type, u32 mask)
+{
+	struct crypto_sig *tfm;
+	int err = 0;
+
+	tfm = crypto_alloc_sig(driver, type, mask);
+	if (IS_ERR(tfm)) {
+		pr_err("alg: sig: Failed to load tfm for %s: %ld\n",
+		       driver, PTR_ERR(tfm));
+		return PTR_ERR(tfm);
+	}
+	if (desc->suite.sig.vecs)
+		err = test_sig(tfm, desc->alg, desc->suite.sig.vecs,
+			       desc->suite.sig.count);
+
+	crypto_free_sig(tfm);
+	return err;
+}
+
 static int alg_test_null(const struct alg_test_desc *desc,
 			     const char *driver, u32 type, u32 mask)
 {
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index ed1640f3e352..39dd1d558883 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -162,6 +162,19 @@ struct akcipher_testvec {
 	enum OID algo;
 };
 
+struct sig_testvec {
+	const unsigned char *key;
+	const unsigned char *params;
+	const unsigned char *m;
+	const unsigned char *c;
+	unsigned int key_len;
+	unsigned int param_len;
+	unsigned int m_size;
+	unsigned int c_size;
+	bool public_key_vec;
+	enum OID algo;
+};
+
 struct kpp_testvec {
 	const unsigned char *secret;
 	const unsigned char *b_secret;
diff --git a/include/crypto/internal/sig.h b/include/crypto/internal/sig.h
index 97cb26ef8115..b16648c1a986 100644
--- a/include/crypto/internal/sig.h
+++ b/include/crypto/internal/sig.h
@@ -10,8 +10,88 @@
 #include <crypto/algapi.h>
 #include <crypto/sig.h>
 
+struct sig_instance {
+	void (*free)(struct sig_instance *inst);
+	union {
+		struct {
+			char head[offsetof(struct sig_alg, base)];
+			struct crypto_instance base;
+		};
+		struct sig_alg alg;
+	};
+};
+
+struct crypto_sig_spawn {
+	struct crypto_spawn base;
+};
+
 static inline void *crypto_sig_ctx(struct crypto_sig *tfm)
 {
 	return crypto_tfm_ctx(&tfm->base);
 }
+
+/**
+ * crypto_register_sig() -- Register public key signature algorithm
+ *
+ * Function registers an implementation of a public key signature algorithm
+ *
+ * @alg:	algorithm definition
+ *
+ * Return: zero on success; error code in case of error
+ */
+int crypto_register_sig(struct sig_alg *alg);
+
+/**
+ * crypto_unregister_sig() -- Unregister public key signature algorithm
+ *
+ * Function unregisters an implementation of a public key signature algorithm
+ *
+ * @alg:	algorithm definition
+ */
+void crypto_unregister_sig(struct sig_alg *alg);
+
+int sig_register_instance(struct crypto_template *tmpl,
+			  struct sig_instance *inst);
+
+static inline struct sig_instance *sig_instance(struct crypto_instance *inst)
+{
+	return container_of(&inst->alg, struct sig_instance, alg.base);
+}
+
+static inline struct sig_instance *sig_alg_instance(struct crypto_sig *tfm)
+{
+	return sig_instance(crypto_tfm_alg_instance(&tfm->base));
+}
+
+static inline struct crypto_instance *sig_crypto_instance(struct sig_instance
+									*inst)
+{
+	return container_of(&inst->alg.base, struct crypto_instance, alg);
+}
+
+static inline void *sig_instance_ctx(struct sig_instance *inst)
+{
+	return crypto_instance_ctx(sig_crypto_instance(inst));
+}
+
+int crypto_grab_sig(struct crypto_sig_spawn *spawn,
+		    struct crypto_instance *inst,
+		    const char *name, u32 type, u32 mask);
+
+static inline struct crypto_sig *crypto_spawn_sig(struct crypto_sig_spawn
+								   *spawn)
+{
+	return crypto_spawn_tfm2(&spawn->base);
+}
+
+static inline void crypto_drop_sig(struct crypto_sig_spawn *spawn)
+{
+	crypto_drop_spawn(&spawn->base);
+}
+
+static inline struct sig_alg *crypto_spawn_sig_alg(struct crypto_sig_spawn
+								    *spawn)
+{
+	return container_of(spawn->base.alg, struct sig_alg, base);
+}
 #endif
diff --git a/include/crypto/sig.h b/include/crypto/sig.h
index d25186bb2be3..f0f52a7c5ae7 100644
--- a/include/crypto/sig.h
+++ b/include/crypto/sig.h
@@ -19,6 +19,52 @@ struct crypto_sig {
 	struct crypto_tfm base;
 };
 
+/**
+ * struct sig_alg - generic public key signature algorithm
+ *
+ * @sign:	Function performs a sign operation as defined by public key
+ *		algorithm. Optional.
+ * @verify:	Function performs a complete verify operation as defined by
+ *		public key algorithm, returning verification status. Optional.
+ * @set_pub_key: Function invokes the algorithm specific set public key
+ *		function, which knows how to decode and interpret
+ *		the BER encoded public key and parameters. Mandatory.
+ * @set_priv_key: Function invokes the algorithm specific set private key
+ *		function, which knows how to decode and interpret
+ *		the BER encoded private key and parameters. Optional.
+ * @max_size:	Function returns key size. Mandatory.
+ * @init:	Initialize the cryptographic transformation object.
+ *		This function is used to initialize the cryptographic
+ *		transformation object. This function is called only once at
+ *		the instantiation time, right after the transformation context
+ *		was allocated. In case the cryptographic hardware has some
+ *		special requirements which need to be handled by software, this
+ *		function shall check for the precise requirement of the
+ *		transformation and put any software fallbacks in place.
+ * @exit:	Deinitialize the cryptographic transformation object. This is a
+ *		counterpart to @init, used to remove various changes set in
+ *		@init.
+ *
+ * @base:	Common crypto API algorithm data structure
+ */
+struct sig_alg {
+	int (*sign)(struct crypto_sig *tfm,
+		    const void *src, unsigned int slen,
+		    void *dst, unsigned int dlen);
+	int (*verify)(struct crypto_sig *tfm,
+		      const void *src, unsigned int slen,
+		      const void *digest, unsigned int dlen);
+	int (*set_pub_key)(struct crypto_sig *tfm,
+			   const void *key, unsigned int keylen);
+	int (*set_priv_key)(struct crypto_sig *tfm,
+			    const void *key, unsigned int keylen);
+	unsigned int (*max_size)(struct crypto_sig *tfm);
+	int (*init)(struct crypto_sig *tfm);
+	void (*exit)(struct crypto_sig *tfm);
+
+	struct crypto_alg base;
+};
+
 /**
  * DOC: Generic Public Key Signature API
  *
@@ -47,6 +93,21 @@ static inline struct crypto_tfm *crypto_sig_tfm(struct crypto_sig *tfm)
 	return &tfm->base;
 }
 
+static inline struct crypto_sig *__crypto_sig_tfm(struct crypto_tfm *tfm)
+{
+	return container_of(tfm, struct crypto_sig, base);
+}
+
+static inline struct sig_alg *__crypto_sig_alg(struct crypto_alg *alg)
+{
+	return container_of(alg, struct sig_alg, base);
+}
+
+static inline struct sig_alg *crypto_sig_alg(struct crypto_sig *tfm)
+{
+	return __crypto_sig_alg(crypto_sig_tfm(tfm)->__crt_alg);
+}
+
 /**
  * crypto_free_sig() - free signature tfm handle
  *
diff --git a/include/uapi/linux/cryptouser.h b/include/uapi/linux/cryptouser.h
index 20a6c0fc149e..db05e0419972 100644
--- a/include/uapi/linux/cryptouser.h
+++ b/include/uapi/linux/cryptouser.h
@@ -64,6 +64,7 @@ enum crypto_attr_type_t {
 	CRYPTOCFGA_STAT_AKCIPHER,	/* No longer supported, do not use. */
 	CRYPTOCFGA_STAT_KPP,		/* No longer supported, do not use. */
 	CRYPTOCFGA_STAT_ACOMP,		/* No longer supported, do not use. */
+	CRYPTOCFGA_REPORT_SIG,		/* struct crypto_report_sig */
 	__CRYPTOCFGA_MAX
 
 #define CRYPTOCFGA_MAX (__CRYPTOCFGA_MAX - 1)
@@ -207,6 +208,10 @@ struct crypto_report_acomp {
 	char type[CRYPTO_MAX_NAME];
 };
 
+struct crypto_report_sig {
+	char type[CRYPTO_MAX_NAME];
+};
+
 #define CRYPTO_REPORT_MAXSIZE (sizeof(struct crypto_user_alg) + \
 			       sizeof(struct crypto_report_blkcipher))
 
-- 
2.43.0


