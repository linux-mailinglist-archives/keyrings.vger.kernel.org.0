Return-Path: <keyrings+bounces-1963-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88368973B8F
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACECE1C21631
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0A0196D9A;
	Tue, 10 Sep 2024 15:21:07 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D23187FFF;
	Tue, 10 Sep 2024 15:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981667; cv=none; b=o2Cbvp5Q2Q78TBT/IGVdKoz6K3U/KJMuZDNyI56HejvUu7aU2yMupiLCFppnbuliTDtRv74EYW5dRXEkYJzezKP6x2Z5ZlARHGOBzriEANIdH6gffQBwlQkxyazmi/RORlie9YJNRNFR2smGCU2r3NjLKvCXSBBGfVmd+MmJo78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981667; c=relaxed/simple;
	bh=CU6xFjfeGmHsUEy287NjkrJ61qu50XvQ9kYHVOEoJ5M=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=Gd/GVRNypzNIgvBWRp0bEAwMm4HhT0rlolwoims1v1PbEjUG9CGVI7jB9zJAXUSnIJ/bN1W1l7cfCM9esbcAgBgVj4aBnCBLgiQpadctu/6MdMkStpm8+VciZBLjJi6Mt2e6ceMhowfTH+bmZC4UIdRAzqYCZA7a2bjvT8B9aFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id EF6B31019178B;
	Tue, 10 Sep 2024 17:21:02 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id BEAAB60A8B01;
	Tue, 10 Sep 2024 17:21:02 +0200 (CEST)
X-Mailbox-Line: From ce2dd863f140f65d4595cc27dc761bbbf698e1a3 Mon Sep 17 00:00:00 2001
Message-ID: <ce2dd863f140f65d4595cc27dc761bbbf698e1a3.1725972335.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:21 +0200
Subject: [PATCH v2 11/19] crypto: akcipher - Drop sign/verify operations
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

A sig_alg backend has just been introduced and all asymmetric
sign/verify algorithms have been migrated to it.

The sign/verify operations can thus be dropped from akcipher_alg.
It is now purely for asymmetric encrypt/decrypt.

Move struct crypto_akcipher_sync_data from internal.h to akcipher.c and
unexport crypto_akcipher_sync_{prep,post}():  They're no longer used by
sig.c but only locally in akcipher.c.

In crypto_akcipher_sync_{prep,post}(), drop various NULL pointer checks
for data->dst as they were only necessary for the verify operation.

In the crypto_sig_*() API calls, remove the forks that were necessary
while algorithms were converted from crypto_akcipher to crypto_sig
one by one.

In struct akcipher_testvec, remove the "params", "param_len" and "algo"
elements as they were only needed for the ecrdsa verify operation.
Remove corresponding dead code from test_akcipher_one() as well.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 Documentation/crypto/api-akcipher.rst |   2 +-
 crypto/akcipher.c                     |  64 ++++----------
 crypto/internal.h                     |  19 ----
 crypto/sig.c                          |  70 ---------------
 crypto/testmgr.c                      | 119 ++++++++------------------
 crypto/testmgr.h                      |   4 -
 include/crypto/akcipher.h             |  69 ++-------------
 include/crypto/internal/akcipher.h    |   4 +-
 8 files changed, 66 insertions(+), 285 deletions(-)

diff --git a/Documentation/crypto/api-akcipher.rst b/Documentation/crypto/api-akcipher.rst
index 40aa8746e2a1..6f47cc70eca0 100644
--- a/Documentation/crypto/api-akcipher.rst
+++ b/Documentation/crypto/api-akcipher.rst
@@ -11,7 +11,7 @@ Asymmetric Cipher API
    :doc: Generic Public Key API
 
 .. kernel-doc:: include/crypto/akcipher.h
-   :functions: crypto_alloc_akcipher crypto_free_akcipher crypto_akcipher_set_pub_key crypto_akcipher_set_priv_key crypto_akcipher_maxsize crypto_akcipher_encrypt crypto_akcipher_decrypt crypto_akcipher_sign crypto_akcipher_verify
+   :functions: crypto_alloc_akcipher crypto_free_akcipher crypto_akcipher_set_pub_key crypto_akcipher_set_priv_key crypto_akcipher_maxsize crypto_akcipher_encrypt crypto_akcipher_decrypt
 
 Asymmetric Cipher Request Handle
 --------------------------------
diff --git a/crypto/akcipher.c b/crypto/akcipher.c
index e0ff5f4dda6d..72c82d9aa077 100644
--- a/crypto/akcipher.c
+++ b/crypto/akcipher.c
@@ -20,6 +20,19 @@
 
 #define CRYPTO_ALG_TYPE_AHASH_MASK	0x0000000e
 
+struct crypto_akcipher_sync_data {
+	struct crypto_akcipher *tfm;
+	const void *src;
+	void *dst;
+	unsigned int slen;
+	unsigned int dlen;
+
+	struct akcipher_request *req;
+	struct crypto_wait cwait;
+	struct scatterlist sg;
+	u8 *buf;
+};
+
 static int __maybe_unused crypto_akcipher_report(
 	struct sk_buff *skb, struct crypto_alg *alg)
 {
@@ -126,10 +139,6 @@ int crypto_register_akcipher(struct akcipher_alg *alg)
 {
 	struct crypto_alg *base = &alg->base;
 
-	if (!alg->sign)
-		alg->sign = akcipher_default_op;
-	if (!alg->verify)
-		alg->verify = akcipher_default_op;
 	if (!alg->encrypt)
 		alg->encrypt = akcipher_default_op;
 	if (!alg->decrypt)
@@ -158,7 +167,7 @@ int akcipher_register_instance(struct crypto_template *tmpl,
 }
 EXPORT_SYMBOL_GPL(akcipher_register_instance);
 
-int crypto_akcipher_sync_prep(struct crypto_akcipher_sync_data *data)
+static int crypto_akcipher_sync_prep(struct crypto_akcipher_sync_data *data)
 {
 	unsigned int reqsize = crypto_akcipher_reqsize(data->tfm);
 	struct akcipher_request *req;
@@ -167,10 +176,7 @@ int crypto_akcipher_sync_prep(struct crypto_akcipher_sync_data *data)
 	unsigned int len;
 	u8 *buf;
 
-	if (data->dst)
-		mlen = max(data->slen, data->dlen);
-	else
-		mlen = data->slen + data->dlen;
+	mlen = max(data->slen, data->dlen);
 
 	len = sizeof(*req) + reqsize + mlen;
 	if (len < mlen)
@@ -189,8 +195,7 @@ int crypto_akcipher_sync_prep(struct crypto_akcipher_sync_data *data)
 
 	sg = &data->sg;
 	sg_init_one(sg, buf, mlen);
-	akcipher_request_set_crypt(req, sg, data->dst ? sg : NULL,
-				   data->slen, data->dlen);
+	akcipher_request_set_crypt(req, sg, sg, data->slen, data->dlen);
 
 	crypto_init_wait(&data->cwait);
 	akcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_SLEEP,
@@ -198,18 +203,16 @@ int crypto_akcipher_sync_prep(struct crypto_akcipher_sync_data *data)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(crypto_akcipher_sync_prep);
 
-int crypto_akcipher_sync_post(struct crypto_akcipher_sync_data *data, int err)
+static int crypto_akcipher_sync_post(struct crypto_akcipher_sync_data *data,
+				     int err)
 {
 	err = crypto_wait_req(err, &data->cwait);
-	if (data->dst)
-		memcpy(data->dst, data->buf, data->dlen);
+	memcpy(data->dst, data->buf, data->dlen);
 	data->dlen = data->req->dst_len;
 	kfree_sensitive(data->req);
 	return err;
 }
-EXPORT_SYMBOL_GPL(crypto_akcipher_sync_post);
 
 int crypto_akcipher_sync_encrypt(struct crypto_akcipher *tfm,
 				 const void *src, unsigned int slen,
@@ -248,34 +251,5 @@ int crypto_akcipher_sync_decrypt(struct crypto_akcipher *tfm,
 }
 EXPORT_SYMBOL_GPL(crypto_akcipher_sync_decrypt);
 
-static void crypto_exit_akcipher_ops_sig(struct crypto_tfm *tfm)
-{
-	struct crypto_akcipher **ctx = crypto_tfm_ctx(tfm);
-
-	crypto_free_akcipher(*ctx);
-}
-
-int crypto_init_akcipher_ops_sig(struct crypto_tfm *tfm)
-{
-	struct crypto_akcipher **ctx = crypto_tfm_ctx(tfm);
-	struct crypto_alg *calg = tfm->__crt_alg;
-	struct crypto_akcipher *akcipher;
-
-	if (!crypto_mod_get(calg))
-		return -EAGAIN;
-
-	akcipher = crypto_create_tfm(calg, &crypto_akcipher_type);
-	if (IS_ERR(akcipher)) {
-		crypto_mod_put(calg);
-		return PTR_ERR(akcipher);
-	}
-
-	*ctx = akcipher;
-	tfm->exit = crypto_exit_akcipher_ops_sig;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(crypto_init_akcipher_ops_sig);
-
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Generic public key cipher type");
diff --git a/crypto/internal.h b/crypto/internal.h
index aee31319be2e..0008621aaa98 100644
--- a/crypto/internal.h
+++ b/crypto/internal.h
@@ -22,8 +22,6 @@
 #include <linux/sched.h>
 #include <linux/types.h>
 
-struct akcipher_request;
-struct crypto_akcipher;
 struct crypto_instance;
 struct crypto_template;
 
@@ -35,19 +33,6 @@ struct crypto_larval {
 	bool test_started;
 };
 
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
-
 enum {
 	CRYPTOA_UNSPEC,
 	CRYPTOA_ALG,
@@ -130,10 +115,6 @@ void *crypto_create_tfm_node(struct crypto_alg *alg,
 void *crypto_clone_tfm(const struct crypto_type *frontend,
 		       struct crypto_tfm *otfm);
 
-int crypto_akcipher_sync_prep(struct crypto_akcipher_sync_data *data);
-int crypto_akcipher_sync_post(struct crypto_akcipher_sync_data *data, int err);
-int crypto_init_akcipher_ops_sig(struct crypto_tfm *tfm);
-
 static inline void *crypto_create_tfm(struct crypto_alg *alg,
 			const struct crypto_type *frontend)
 {
diff --git a/crypto/sig.c b/crypto/sig.c
index 4f36ceb7a90b..1e6b0d677472 100644
--- a/crypto/sig.c
+++ b/crypto/sig.c
@@ -5,12 +5,10 @@
  * Copyright (c) 2023 Herbert Xu <herbert@gondor.apana.org.au>
  */
 
-#include <crypto/akcipher.h>
 #include <crypto/internal/sig.h>
 #include <linux/cryptouser.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/scatterlist.h>
 #include <linux/seq_file.h>
 #include <linux/string.h>
 #include <net/netlink.h>
@@ -19,8 +17,6 @@
 
 #define CRYPTO_ALG_TYPE_SIG_MASK	0x0000000e
 
-static const struct crypto_type crypto_sig_type;
-
 static void crypto_sig_exit_tfm(struct crypto_tfm *tfm)
 {
 	struct crypto_sig *sig = __crypto_sig_tfm(tfm);
@@ -31,9 +27,6 @@ static void crypto_sig_exit_tfm(struct crypto_tfm *tfm)
 
 static int crypto_sig_init_tfm(struct crypto_tfm *tfm)
 {
-	if (tfm->__crt_alg->cra_type != &crypto_sig_type)
-		return crypto_init_akcipher_ops_sig(tfm);
-
 	struct crypto_sig *sig = __crypto_sig_tfm(tfm);
 	struct sig_alg *alg = crypto_sig_alg(sig);
 
@@ -93,17 +86,9 @@ EXPORT_SYMBOL_GPL(crypto_alloc_sig);
 
 int crypto_sig_maxsize(struct crypto_sig *tfm)
 {
-	if (crypto_sig_tfm(tfm)->__crt_alg->cra_type != &crypto_sig_type)
-		goto akcipher;
-
 	struct sig_alg *alg = crypto_sig_alg(tfm);
 
 	return alg->max_size(tfm);
-
-akcipher:
-	struct crypto_akcipher **ctx = crypto_sig_ctx(tfm);
-
-	return crypto_akcipher_maxsize(*ctx);
 }
 EXPORT_SYMBOL_GPL(crypto_sig_maxsize);
 
@@ -111,26 +96,9 @@ int crypto_sig_sign(struct crypto_sig *tfm,
 		    const void *src, unsigned int slen,
 		    void *dst, unsigned int dlen)
 {
-	if (crypto_sig_tfm(tfm)->__crt_alg->cra_type != &crypto_sig_type)
-		goto akcipher;
-
 	struct sig_alg *alg = crypto_sig_alg(tfm);
 
 	return alg->sign(tfm, src, slen, dst, dlen);
-
-akcipher:
-	struct crypto_akcipher **ctx = crypto_sig_ctx(tfm);
-	struct crypto_akcipher_sync_data data = {
-		.tfm = *ctx,
-		.src = src,
-		.dst = dst,
-		.slen = slen,
-		.dlen = dlen,
-	};
-
-	return crypto_akcipher_sync_prep(&data) ?:
-	       crypto_akcipher_sync_post(&data,
-					 crypto_akcipher_sign(data.req));
 }
 EXPORT_SYMBOL_GPL(crypto_sig_sign);
 
@@ -138,65 +106,27 @@ int crypto_sig_verify(struct crypto_sig *tfm,
 		      const void *src, unsigned int slen,
 		      const void *digest, unsigned int dlen)
 {
-	if (crypto_sig_tfm(tfm)->__crt_alg->cra_type != &crypto_sig_type)
-		goto akcipher;
-
 	struct sig_alg *alg = crypto_sig_alg(tfm);
 
 	return alg->verify(tfm, src, slen, digest, dlen);
-
-akcipher:
-	struct crypto_akcipher **ctx = crypto_sig_ctx(tfm);
-	struct crypto_akcipher_sync_data data = {
-		.tfm = *ctx,
-		.src = src,
-		.slen = slen,
-		.dlen = dlen,
-	};
-	int err;
-
-	err = crypto_akcipher_sync_prep(&data);
-	if (err)
-		return err;
-
-	memcpy(data.buf + slen, digest, dlen);
-
-	return crypto_akcipher_sync_post(&data,
-					 crypto_akcipher_verify(data.req));
 }
 EXPORT_SYMBOL_GPL(crypto_sig_verify);
 
 int crypto_sig_set_pubkey(struct crypto_sig *tfm,
 			  const void *key, unsigned int keylen)
 {
-	if (crypto_sig_tfm(tfm)->__crt_alg->cra_type != &crypto_sig_type)
-		goto akcipher;
-
 	struct sig_alg *alg = crypto_sig_alg(tfm);
 
 	return alg->set_pub_key(tfm, key, keylen);
-
-akcipher:
-	struct crypto_akcipher **ctx = crypto_sig_ctx(tfm);
-
-	return crypto_akcipher_set_pub_key(*ctx, key, keylen);
 }
 EXPORT_SYMBOL_GPL(crypto_sig_set_pubkey);
 
 int crypto_sig_set_privkey(struct crypto_sig *tfm,
 			  const void *key, unsigned int keylen)
 {
-	if (crypto_sig_tfm(tfm)->__crt_alg->cra_type != &crypto_sig_type)
-		goto akcipher;
-
 	struct sig_alg *alg = crypto_sig_alg(tfm);
 
 	return alg->set_priv_key(tfm, key, keylen);
-
-akcipher:
-	struct crypto_akcipher **ctx = crypto_sig_ctx(tfm);
-
-	return crypto_akcipher_set_priv_key(*ctx, key, keylen);
 }
 EXPORT_SYMBOL_GPL(crypto_sig_set_privkey);
 
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 91dc29e79dd6..fdebdafdf027 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4112,11 +4112,9 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 	struct crypto_wait wait;
 	unsigned int out_len_max, out_len = 0;
 	int err = -ENOMEM;
-	struct scatterlist src, dst, src_tab[3];
-	const char *m, *c;
-	unsigned int m_size, c_size;
-	const char *op;
-	u8 *key, *ptr;
+	struct scatterlist src, dst, src_tab[2];
+	const char *c;
+	unsigned int c_size;
 
 	if (testmgr_alloc_buf(xbuf))
 		return err;
@@ -4127,92 +4125,53 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 
 	crypto_init_wait(&wait);
 
-	key = kmalloc(vecs->key_len + sizeof(u32) * 2 + vecs->param_len,
-		      GFP_KERNEL);
-	if (!key)
-		goto free_req;
-	memcpy(key, vecs->key, vecs->key_len);
-	ptr = key + vecs->key_len;
-	ptr = test_pack_u32(ptr, vecs->algo);
-	ptr = test_pack_u32(ptr, vecs->param_len);
-	memcpy(ptr, vecs->params, vecs->param_len);
-
 	if (vecs->public_key_vec)
-		err = crypto_akcipher_set_pub_key(tfm, key, vecs->key_len);
+		err = crypto_akcipher_set_pub_key(tfm, vecs->key,
+						  vecs->key_len);
 	else
-		err = crypto_akcipher_set_priv_key(tfm, key, vecs->key_len);
+		err = crypto_akcipher_set_priv_key(tfm, vecs->key,
+						   vecs->key_len);
 	if (err)
-		goto free_key;
+		goto free_req;
 
-	/*
-	 * First run test which do not require a private key, such as
-	 * encrypt or verify.
-	 */
+	/* First run encrypt test which does not require a private key */
 	err = -ENOMEM;
 	out_len_max = crypto_akcipher_maxsize(tfm);
 	outbuf_enc = kzalloc(out_len_max, GFP_KERNEL);
 	if (!outbuf_enc)
-		goto free_key;
-
-	if (!vecs->siggen_sigver_test) {
-		m = vecs->m;
-		m_size = vecs->m_size;
-		c = vecs->c;
-		c_size = vecs->c_size;
-		op = "encrypt";
-	} else {
-		/* Swap args so we could keep plaintext (digest)
-		 * in vecs->m, and cooked signature in vecs->c.
-		 */
-		m = vecs->c; /* signature */
-		m_size = vecs->c_size;
-		c = vecs->m; /* digest */
-		c_size = vecs->m_size;
-		op = "verify";
-	}
+		goto free_req;
+
+	c = vecs->c;
+	c_size = vecs->c_size;
 
 	err = -E2BIG;
-	if (WARN_ON(m_size > PAGE_SIZE))
+	if (WARN_ON(vecs->m_size > PAGE_SIZE))
 		goto free_all;
-	memcpy(xbuf[0], m, m_size);
+	memcpy(xbuf[0], vecs->m, vecs->m_size);
 
-	sg_init_table(src_tab, 3);
+	sg_init_table(src_tab, 2);
 	sg_set_buf(&src_tab[0], xbuf[0], 8);
-	sg_set_buf(&src_tab[1], xbuf[0] + 8, m_size - 8);
-	if (vecs->siggen_sigver_test) {
-		if (WARN_ON(c_size > PAGE_SIZE))
-			goto free_all;
-		memcpy(xbuf[1], c, c_size);
-		sg_set_buf(&src_tab[2], xbuf[1], c_size);
-		akcipher_request_set_crypt(req, src_tab, NULL, m_size, c_size);
-	} else {
-		sg_init_one(&dst, outbuf_enc, out_len_max);
-		akcipher_request_set_crypt(req, src_tab, &dst, m_size,
-					   out_len_max);
-	}
+	sg_set_buf(&src_tab[1], xbuf[0] + 8, vecs->m_size - 8);
+	sg_init_one(&dst, outbuf_enc, out_len_max);
+	akcipher_request_set_crypt(req, src_tab, &dst, vecs->m_size,
+				   out_len_max);
 	akcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG,
 				      crypto_req_done, &wait);
 
-	err = crypto_wait_req(vecs->siggen_sigver_test ?
-			      /* Run asymmetric signature verification */
-			      crypto_akcipher_verify(req) :
-			      /* Run asymmetric encrypt */
-			      crypto_akcipher_encrypt(req), &wait);
+	err = crypto_wait_req(crypto_akcipher_encrypt(req), &wait);
 	if (err) {
-		pr_err("alg: akcipher: %s test failed. err %d\n", op, err);
+		pr_err("alg: akcipher: encrypt test failed. err %d\n", err);
 		goto free_all;
 	}
-	if (!vecs->siggen_sigver_test && c) {
+	if (c) {
 		if (req->dst_len != c_size) {
-			pr_err("alg: akcipher: %s test failed. Invalid output len\n",
-			       op);
+			pr_err("alg: akcipher: encrypt test failed. Invalid output len\n");
 			err = -EINVAL;
 			goto free_all;
 		}
 		/* verify that encrypted message is equal to expected */
 		if (memcmp(c, outbuf_enc, c_size) != 0) {
-			pr_err("alg: akcipher: %s test failed. Invalid output\n",
-			       op);
+			pr_err("alg: akcipher: encrypt test failed. Invalid output\n");
 			hexdump(outbuf_enc, c_size);
 			err = -EINVAL;
 			goto free_all;
@@ -4220,7 +4179,7 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 	}
 
 	/*
-	 * Don't invoke (decrypt or sign) test which require a private key
+	 * Don't invoke decrypt test which requires a private key
 	 * for vectors with only a public key.
 	 */
 	if (vecs->public_key_vec) {
@@ -4233,13 +4192,12 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 		goto free_all;
 	}
 
-	if (!vecs->siggen_sigver_test && !c) {
+	if (!c) {
 		c = outbuf_enc;
 		c_size = req->dst_len;
 	}
 
 	err = -E2BIG;
-	op = vecs->siggen_sigver_test ? "sign" : "decrypt";
 	if (WARN_ON(c_size > PAGE_SIZE))
 		goto free_all;
 	memcpy(xbuf[0], c, c_size);
@@ -4249,34 +4207,29 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 	crypto_init_wait(&wait);
 	akcipher_request_set_crypt(req, &src, &dst, c_size, out_len_max);
 
-	err = crypto_wait_req(vecs->siggen_sigver_test ?
-			      /* Run asymmetric signature generation */
-			      crypto_akcipher_sign(req) :
-			      /* Run asymmetric decrypt */
-			      crypto_akcipher_decrypt(req), &wait);
+	err = crypto_wait_req(crypto_akcipher_decrypt(req), &wait);
 	if (err) {
-		pr_err("alg: akcipher: %s test failed. err %d\n", op, err);
+		pr_err("alg: akcipher: decrypt test failed. err %d\n", err);
 		goto free_all;
 	}
 	out_len = req->dst_len;
-	if (out_len < m_size) {
-		pr_err("alg: akcipher: %s test failed. Invalid output len %u\n",
-		       op, out_len);
+	if (out_len < vecs->m_size) {
+		pr_err("alg: akcipher: decrypt test failed. Invalid output len %u\n",
+		       out_len);
 		err = -EINVAL;
 		goto free_all;
 	}
 	/* verify that decrypted message is equal to the original msg */
-	if (memchr_inv(outbuf_dec, 0, out_len - m_size) ||
-	    memcmp(m, outbuf_dec + out_len - m_size, m_size)) {
-		pr_err("alg: akcipher: %s test failed. Invalid output\n", op);
+	if (memchr_inv(outbuf_dec, 0, out_len - vecs->m_size) ||
+	    memcmp(vecs->m, outbuf_dec + out_len - vecs->m_size,
+		   vecs->m_size)) {
+		pr_err("alg: akcipher: decrypt test failed. Invalid output\n");
 		hexdump(outbuf_dec, out_len);
 		err = -EINVAL;
 	}
 free_all:
 	kfree(outbuf_dec);
 	kfree(outbuf_enc);
-free_key:
-	kfree(key);
 free_req:
 	akcipher_request_free(req);
 free_xbuf:
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index d29d03fec852..e10b6d7f2cd9 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -150,16 +150,12 @@ struct drbg_testvec {
 
 struct akcipher_testvec {
 	const unsigned char *key;
-	const unsigned char *params;
 	const unsigned char *m;
 	const unsigned char *c;
 	unsigned int key_len;
-	unsigned int param_len;
 	unsigned int m_size;
 	unsigned int c_size;
 	bool public_key_vec;
-	bool siggen_sigver_test;
-	enum OID algo;
 };
 
 struct sig_testvec {
diff --git a/include/crypto/akcipher.h b/include/crypto/akcipher.h
index 18a10cad07aa..cdf7da74bf2f 100644
--- a/include/crypto/akcipher.h
+++ b/include/crypto/akcipher.h
@@ -12,24 +12,19 @@
 #include <linux/crypto.h>
 
 /**
- * struct akcipher_request - public key request
+ * struct akcipher_request - public key cipher request
  *
  * @base:	Common attributes for async crypto requests
  * @src:	Source data
- *		For verify op this is signature + digest, in that case
- *		total size of @src is @src_len + @dst_len.
- * @dst:	Destination data (Should be NULL for verify op)
+ * @dst:	Destination data
  * @src_len:	Size of the input buffer
- *		For verify op it's size of signature part of @src, this part
- *		is supposed to be operated by cipher.
- * @dst_len:	Size of @dst buffer (for all ops except verify).
+ * @dst_len:	Size of @dst buffer
  *		It needs to be at least	as big as the expected result
  *		depending on the operation.
  *		After operation it will be updated with the actual size of the
  *		result.
  *		In case of error where the dst sgl size was insufficient,
  *		it will be updated to the size required for the operation.
- *		For verify op this is size of digest part in @src.
  * @__ctx:	Start of private context data
  */
 struct akcipher_request {
@@ -55,15 +50,8 @@ struct crypto_akcipher {
 };
 
 /**
- * struct akcipher_alg - generic public key algorithm
+ * struct akcipher_alg - generic public key cipher algorithm
  *
- * @sign:	Function performs a sign operation as defined by public key
- *		algorithm. In case of error, where the dst_len was insufficient,
- *		the req->dst_len will be updated to the size required for the
- *		operation
- * @verify:	Function performs a complete verify operation as defined by
- *		public key algorithm, returning verification status. Requires
- *		digest value as input parameter.
  * @encrypt:	Function performs an encrypt operation as defined by public key
  *		algorithm. In case of error, where the dst_len was insufficient,
  *		the req->dst_len will be updated to the size required for the
@@ -94,8 +82,6 @@ struct crypto_akcipher {
  * @base:	Common crypto API algorithm data structure
  */
 struct akcipher_alg {
-	int (*sign)(struct akcipher_request *req);
-	int (*verify)(struct akcipher_request *req);
 	int (*encrypt)(struct akcipher_request *req);
 	int (*decrypt)(struct akcipher_request *req);
 	int (*set_pub_key)(struct crypto_akcipher *tfm, const void *key,
@@ -110,9 +96,9 @@ struct akcipher_alg {
 };
 
 /**
- * DOC: Generic Public Key API
+ * DOC: Generic Public Key Cipher API
  *
- * The Public Key API is used with the algorithms of type
+ * The Public Key Cipher API is used with the algorithms of type
  * CRYPTO_ALG_TYPE_AKCIPHER (listed as type "akcipher" in /proc/crypto)
  */
 
@@ -243,10 +229,9 @@ static inline void akcipher_request_set_callback(struct akcipher_request *req,
  *
  * @req:	public key request
  * @src:	ptr to input scatter list
- * @dst:	ptr to output scatter list or NULL for verify op
+ * @dst:	ptr to output scatter list
  * @src_len:	size of the src input scatter list to be processed
- * @dst_len:	size of the dst output scatter list or size of signature
- *		portion in @src for verify op
+ * @dst_len:	size of the dst output scatter list
  */
 static inline void akcipher_request_set_crypt(struct akcipher_request *req,
 					      struct scatterlist *src,
@@ -347,44 +332,6 @@ int crypto_akcipher_sync_decrypt(struct crypto_akcipher *tfm,
 				 const void *src, unsigned int slen,
 				 void *dst, unsigned int dlen);
 
-/**
- * crypto_akcipher_sign() - Invoke public key sign operation
- *
- * Function invokes the specific public key sign operation for a given
- * public key algorithm
- *
- * @req:	asymmetric key request
- *
- * Return: zero on success; error code in case of error
- */
-static inline int crypto_akcipher_sign(struct akcipher_request *req)
-{
-	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
-
-	return crypto_akcipher_alg(tfm)->sign(req);
-}
-
-/**
- * crypto_akcipher_verify() - Invoke public key signature verification
- *
- * Function invokes the specific public key signature verification operation
- * for a given public key algorithm.
- *
- * @req:	asymmetric key request
- *
- * Note: req->dst should be NULL, req->src should point to SG of size
- * (req->src_size + req->dst_size), containing signature (of req->src_size
- * length) with appended digest (of req->dst_size length).
- *
- * Return: zero on verification success; error code in case of error.
- */
-static inline int crypto_akcipher_verify(struct akcipher_request *req)
-{
-	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
-
-	return crypto_akcipher_alg(tfm)->verify(req);
-}
-
 /**
  * crypto_akcipher_set_pub_key() - Invoke set public key operation
  *
diff --git a/include/crypto/internal/akcipher.h b/include/crypto/internal/akcipher.h
index a0fba4b2eccf..14ee62bc52b6 100644
--- a/include/crypto/internal/akcipher.h
+++ b/include/crypto/internal/akcipher.h
@@ -124,7 +124,7 @@ static inline struct akcipher_alg *crypto_spawn_akcipher_alg(
 /**
  * crypto_register_akcipher() -- Register public key algorithm
  *
- * Function registers an implementation of a public key verify algorithm
+ * Function registers an implementation of a public key cipher algorithm
  *
  * @alg:	algorithm definition
  *
@@ -135,7 +135,7 @@ int crypto_register_akcipher(struct akcipher_alg *alg);
 /**
  * crypto_unregister_akcipher() -- Unregister public key algorithm
  *
- * Function unregisters an implementation of a public key verify algorithm
+ * Function unregisters an implementation of a public key cipher algorithm
  *
  * @alg:	algorithm definition
  */
-- 
2.43.0


