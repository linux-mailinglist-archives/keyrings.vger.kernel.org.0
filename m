Return-Path: <keyrings+bounces-1824-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A33293F740
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 16:07:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B06CC2824BF
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 14:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C3561487C6;
	Mon, 29 Jul 2024 14:07:51 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B0C548F7;
	Mon, 29 Jul 2024 14:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722262071; cv=none; b=ewhJowjL/i+wFM7OYZrlyJF5U6aeEubquar1/ApXBto4eUnI3DSm5FapgKH1YzdD2YN7p3B7EjY8we3OakYOCmD2OZOi74GVd6wuEPgrprtpSL5ZM0SgHPR2BJo+FgwyXpSC49wtjkcC9OXUsvv2iaU6PEofguT0ByGgBTNHQpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722262071; c=relaxed/simple;
	bh=vhlD9T9EEZXOnnI2MeBxTFnyHRu03va+yYr4s81e6D0=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=XkofAYW4pFKTFgA4NAM41eF3IIrfzQrriWNUNkZS2wywo5pOPVzisJQpXKvbg91yFhzi+94U2Hc0BY1fI90X5ohhug6hof54WgI3ut0HJcYch+R2f6hO2hnmMsHA9Zkfyvl/Xa1KjMvaoOyGdYx9E9ma9clNGIW56J3l4xygTkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id E73F7101917BA;
	Mon, 29 Jul 2024 16:07:44 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id BF23C62FAD29;
	Mon, 29 Jul 2024 16:07:44 +0200 (CEST)
X-Mailbox-Line: From eb13c292f60a61b0af14f0c5afd23719b3cb0bd7 Mon Sep 17 00:00:00 2001
Message-ID: <eb13c292f60a61b0af14f0c5afd23719b3cb0bd7.1722260176.git.lukas@wunner.de>
In-Reply-To: <cover.1722260176.git.lukas@wunner.de>
References: <cover.1722260176.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 29 Jul 2024 15:48:00 +0200
Subject: [PATCH 2/5] crypto: akcipher - Drop usage of sglists for verify op
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>
Cc: David Howells <dhowells@redhat.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

Commit 6cb8815f41a9 ("crypto: sig - Add interface for sign/verify")
introduced an API which accepts kernel buffers instead of sglists for
signature generation and verification.

Commit 63ba4d67594a ("KEYS: asymmetric: Use new crypto interface without
scatterlists") converted the sole user in the tree to the new API.

Although the API externally accepts kernel buffers, internally it still
converts them to sglists, which results in overhead for asymmetric
algorithms because they need to copy the sglists back into kernel
buffers.

Take the next step and switch signature verification over to using
kernel buffers internally, thereby avoiding the sglists overhead.

Because all ->verify implementations are synchronous, forego invocation
of crypto_akcipher_sync_{prep,post}() and call crypto_akcipher_verify()
directly from crypto_sig_verify().

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 crypto/akcipher.c         | 11 +++-----
 crypto/ecdsa.c            | 27 +++++---------------
 crypto/ecrdsa.c           | 28 +++++++--------------
 crypto/rsa-pkcs1pad.c     | 27 ++++++++------------
 crypto/sig.c              | 24 +++++++++---------
 crypto/testmgr.c          | 12 ++++-----
 include/crypto/akcipher.h | 53 +++++++++++++++++++++------------------
 7 files changed, 76 insertions(+), 106 deletions(-)

diff --git a/crypto/akcipher.c b/crypto/akcipher.c
index e0ff5f4dda6d..c7c3dcd88b06 100644
--- a/crypto/akcipher.c
+++ b/crypto/akcipher.c
@@ -167,10 +167,7 @@ int crypto_akcipher_sync_prep(struct crypto_akcipher_sync_data *data)
 	unsigned int len;
 	u8 *buf;
 
-	if (data->dst)
-		mlen = max(data->slen, data->dlen);
-	else
-		mlen = data->slen + data->dlen;
+	mlen = max(data->slen, data->dlen);
 
 	len = sizeof(*req) + reqsize + mlen;
 	if (len < mlen)
@@ -189,8 +186,7 @@ int crypto_akcipher_sync_prep(struct crypto_akcipher_sync_data *data)
 
 	sg = &data->sg;
 	sg_init_one(sg, buf, mlen);
-	akcipher_request_set_crypt(req, sg, data->dst ? sg : NULL,
-				   data->slen, data->dlen);
+	akcipher_request_set_crypt(req, sg, sg, data->slen, data->dlen);
 
 	crypto_init_wait(&data->cwait);
 	akcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_SLEEP,
@@ -203,8 +199,7 @@ EXPORT_SYMBOL_GPL(crypto_akcipher_sync_prep);
 int crypto_akcipher_sync_post(struct crypto_akcipher_sync_data *data, int err)
 {
 	err = crypto_wait_req(err, &data->cwait);
-	if (data->dst)
-		memcpy(data->dst, data->buf, data->dlen);
+	memcpy(data->dst, data->buf, data->dlen);
 	data->dlen = data->req->dst_len;
 	kfree_sensitive(data->req);
 	return err;
diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
index d5a10959ec28..f63731fb7535 100644
--- a/crypto/ecdsa.c
+++ b/crypto/ecdsa.c
@@ -9,7 +9,6 @@
 #include <crypto/akcipher.h>
 #include <crypto/ecdh.h>
 #include <linux/asn1_decoder.h>
-#include <linux/scatterlist.h>
 
 #include "ecdsasignature.asn1.h"
 
@@ -135,37 +134,23 @@ static int ecdsa_verify(struct akcipher_request *req)
 		.curve = ctx->curve,
 	};
 	u64 hash[ECC_MAX_DIGITS];
-	unsigned char *buffer;
 	int ret;
 
 	if (unlikely(!ctx->pub_key_set))
 		return -EINVAL;
 
-	buffer = kmalloc(req->src_len + req->dst_len, GFP_KERNEL);
-	if (!buffer)
-		return -ENOMEM;
-
-	sg_pcopy_to_buffer(req->src,
-		sg_nents_for_len(req->src, req->src_len + req->dst_len),
-		buffer, req->src_len + req->dst_len, 0);
-
 	ret = asn1_ber_decoder(&ecdsasignature_decoder, &sig_ctx,
-			       buffer, req->src_len);
+			       req->sig, req->sig_len);
 	if (ret < 0)
-		goto error;
+		return ret;
 
-	if (bufsize > req->dst_len)
-		bufsize = req->dst_len;
+	if (bufsize > req->digest_len)
+		bufsize = req->digest_len;
 
-	ecc_digits_from_bytes(buffer + req->src_len, bufsize,
+	ecc_digits_from_bytes(req->digest, bufsize,
 			      hash, ctx->curve->g.ndigits);
 
-	ret = _ecdsa_verify(ctx, hash, sig_ctx.r, sig_ctx.s);
-
-error:
-	kfree(buffer);
-
-	return ret;
+	return _ecdsa_verify(ctx, hash, sig_ctx.r, sig_ctx.s);
 }
 
 static int ecdsa_ecc_ctx_init(struct ecc_ctx *ctx, unsigned int curve_id)
diff --git a/crypto/ecrdsa.c b/crypto/ecrdsa.c
index 3811f3805b5d..fd78254fef76 100644
--- a/crypto/ecrdsa.c
+++ b/crypto/ecrdsa.c
@@ -23,7 +23,6 @@
 #include <crypto/internal/ecc.h>
 #include <crypto/akcipher.h>
 #include <linux/oid_registry.h>
-#include <linux/scatterlist.h>
 #include "ecrdsa_params.asn1.h"
 #include "ecrdsa_pub_key.asn1.h"
 #include "ecrdsa_defs.h"
@@ -72,8 +71,6 @@ static int ecrdsa_verify(struct akcipher_request *req)
 {
 	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
 	struct ecrdsa_ctx *ctx = akcipher_tfm_ctx(tfm);
-	unsigned char sig[ECRDSA_MAX_SIG_SIZE];
-	unsigned char digest[STREEBOG512_DIGEST_SIZE];
 	unsigned int ndigits = req->dst_len / sizeof(u64);
 	u64 r[ECRDSA_MAX_DIGITS]; /* witness (r) */
 	u64 _r[ECRDSA_MAX_DIGITS]; /* -r */
@@ -91,25 +88,18 @@ static int ecrdsa_verify(struct akcipher_request *req)
 	 */
 	if (!ctx->curve ||
 	    !ctx->digest ||
-	    !req->src ||
+	    !req->sig ||
 	    !ctx->pub_key.x ||
-	    req->dst_len != ctx->digest_len ||
-	    req->dst_len != ctx->curve->g.ndigits * sizeof(u64) ||
+	    req->digest_len != ctx->digest_len ||
+	    req->digest_len != ctx->curve->g.ndigits * sizeof(u64) ||
 	    ctx->pub_key.ndigits != ctx->curve->g.ndigits ||
-	    req->dst_len * 2 != req->src_len ||
-	    WARN_ON(req->src_len > sizeof(sig)) ||
-	    WARN_ON(req->dst_len > sizeof(digest)))
+	    req->digest_len * 2 != req->sig_len ||
+	    WARN_ON(req->sig_len > ECRDSA_MAX_SIG_SIZE) ||
+	    WARN_ON(req->digest_len > STREEBOG512_DIGEST_SIZE))
 		return -EBADMSG;
 
-	sg_copy_to_buffer(req->src, sg_nents_for_len(req->src, req->src_len),
-			  sig, req->src_len);
-	sg_pcopy_to_buffer(req->src,
-			   sg_nents_for_len(req->src,
-					    req->src_len + req->dst_len),
-			   digest, req->dst_len, req->src_len);
-
-	vli_from_be64(s, sig, ndigits);
-	vli_from_be64(r, sig + ndigits * sizeof(u64), ndigits);
+	vli_from_be64(s, req->sig, ndigits);
+	vli_from_be64(r, req->sig + ndigits * sizeof(u64), ndigits);
 
 	/* Step 1: verify that 0 < r < q, 0 < s < q */
 	if (vli_is_zero(r, ndigits) ||
@@ -120,7 +110,7 @@ static int ecrdsa_verify(struct akcipher_request *req)
 
 	/* Step 2: calculate hash (h) of the message (passed as input) */
 	/* Step 3: calculate e = h \mod q */
-	vli_from_le64(e, digest, ndigits);
+	vli_from_le64(e, req->digest, ndigits);
 	if (vli_cmp(e, ctx->curve->n, ndigits) >= 0)
 		vli_sub(e, e, ctx->curve->n, ndigits);
 	if (vli_is_zero(e, ndigits))
diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
index cd501195f34a..fe53bead22cc 100644
--- a/crypto/rsa-pkcs1pad.c
+++ b/crypto/rsa-pkcs1pad.c
@@ -182,8 +182,8 @@ static unsigned int pkcs1pad_get_max_size(struct crypto_akcipher *tfm)
 	return ctx->key_size;
 }
 
-static void pkcs1pad_sg_set_buf(struct scatterlist *sg, void *buf, size_t len,
-		struct scatterlist *next)
+static void pkcs1pad_sg_set_buf(struct scatterlist *sg, const void *buf,
+				size_t len, struct scatterlist *next)
 {
 	int nsegs = next ? 2 : 1;
 
@@ -459,8 +459,7 @@ static int pkcs1pad_verify_complete(struct akcipher_request *req, int err)
 	struct akcipher_instance *inst = akcipher_alg_instance(tfm);
 	struct pkcs1pad_inst_ctx *ictx = akcipher_instance_ctx(inst);
 	const struct rsa_asn1_template *digest_info = ictx->digest_info;
-	const unsigned int sig_size = req->src_len;
-	const unsigned int digest_size = req->dst_len;
+	const unsigned int digest_size = req->digest_len;
 	unsigned int dst_len;
 	unsigned int pos;
 	u8 *out_buf;
@@ -512,14 +511,8 @@ static int pkcs1pad_verify_complete(struct akcipher_request *req, int err)
 		req->dst_len = dst_len - pos;
 		goto done;
 	}
-	/* Extract appended digest. */
-	sg_pcopy_to_buffer(req->src,
-			   sg_nents_for_len(req->src, sig_size + digest_size),
-			   req_ctx->out_buf + ctx->key_size,
-			   digest_size, sig_size);
 	/* Do the actual verification step. */
-	if (memcmp(req_ctx->out_buf + ctx->key_size, out_buf + pos,
-		   digest_size) != 0)
+	if (memcmp(req->digest, out_buf + pos, digest_size) != 0)
 		err = -EKEYREJECTED;
 done:
 	kfree_sensitive(req_ctx->out_buf);
@@ -553,27 +546,29 @@ static int pkcs1pad_verify(struct akcipher_request *req)
 	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
 	struct pkcs1pad_ctx *ctx = akcipher_tfm_ctx(tfm);
 	struct pkcs1pad_request *req_ctx = akcipher_request_ctx(req);
-	const unsigned int sig_size = req->src_len;
-	const unsigned int digest_size = req->dst_len;
+	const unsigned int sig_size = req->sig_len;
+	const unsigned int digest_size = req->digest_len;
 	int err;
 
-	if (WARN_ON(req->dst) || WARN_ON(!digest_size) ||
+	if (WARN_ON(!digest_size) ||
 	    !ctx->key_size || sig_size != ctx->key_size)
 		return -EINVAL;
 
-	req_ctx->out_buf = kmalloc(ctx->key_size + digest_size, GFP_KERNEL);
+	req_ctx->out_buf = kmalloc(ctx->key_size, GFP_KERNEL);
 	if (!req_ctx->out_buf)
 		return -ENOMEM;
 
 	pkcs1pad_sg_set_buf(req_ctx->out_sg, req_ctx->out_buf,
 			    ctx->key_size, NULL);
+	pkcs1pad_sg_set_buf(req_ctx->in_sg, req->sig,
+			    req->sig_len, NULL);
 
 	akcipher_request_set_tfm(&req_ctx->child_req, ctx->child);
 	akcipher_request_set_callback(&req_ctx->child_req, req->base.flags,
 			pkcs1pad_verify_complete_cb, req);
 
 	/* Reuse input buffer, output to a new buffer */
-	akcipher_request_set_crypt(&req_ctx->child_req, req->src,
+	akcipher_request_set_crypt(&req_ctx->child_req, req_ctx->in_sg,
 				   req_ctx->out_sg, sig_size, ctx->key_size);
 
 	err = crypto_akcipher_encrypt(&req_ctx->child_req);
diff --git a/crypto/sig.c b/crypto/sig.c
index 7645bedf3a1f..e88073196417 100644
--- a/crypto/sig.c
+++ b/crypto/sig.c
@@ -98,22 +98,22 @@ int crypto_sig_verify(struct crypto_sig *tfm,
 		      const void *digest, unsigned int dlen)
 {
 	struct crypto_akcipher **ctx = crypto_sig_ctx(tfm);
-	struct crypto_akcipher_sync_data data = {
-		.tfm = *ctx,
-		.src = src,
-		.slen = slen,
-		.dlen = dlen,
-	};
+	struct crypto_akcipher *child_tfm = *ctx;
+	struct akcipher_request *req;
 	int err;
 
-	err = crypto_akcipher_sync_prep(&data);
-	if (err)
-		return err;
+	req = kzalloc(sizeof(*req) + crypto_akcipher_reqsize(child_tfm),
+		      GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
+	akcipher_request_set_tfm(req, child_tfm);
+	akcipher_request_set_crypt(req, src, digest, slen, dlen);
 
-	memcpy(data.buf + slen, digest, dlen);
+	err = crypto_akcipher_verify(req);
 
-	return crypto_akcipher_sync_post(&data,
-					 crypto_akcipher_verify(data.req));
+	kfree_sensitive(req);
+	return err;
 }
 EXPORT_SYMBOL_GPL(crypto_sig_verify);
 
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index f02cb075bd68..483f87efd4b7 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4105,7 +4105,7 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 	struct crypto_wait wait;
 	unsigned int out_len_max, out_len = 0;
 	int err = -ENOMEM;
-	struct scatterlist src, dst, src_tab[3];
+	struct scatterlist src, dst, src_tab[2];
 	const char *m, *c;
 	unsigned int m_size, c_size;
 	const char *op;
@@ -4169,16 +4169,16 @@ static int test_akcipher_one(struct crypto_akcipher *tfm,
 		goto free_all;
 	memcpy(xbuf[0], m, m_size);
 
-	sg_init_table(src_tab, 3);
-	sg_set_buf(&src_tab[0], xbuf[0], 8);
-	sg_set_buf(&src_tab[1], xbuf[0] + 8, m_size - 8);
 	if (vecs->siggen_sigver_test) {
 		if (WARN_ON(c_size > PAGE_SIZE))
 			goto free_all;
 		memcpy(xbuf[1], c, c_size);
-		sg_set_buf(&src_tab[2], xbuf[1], c_size);
-		akcipher_request_set_crypt(req, src_tab, NULL, m_size, c_size);
+		akcipher_request_set_crypt(req, xbuf[0], xbuf[1],
+					   m_size, c_size);
 	} else {
+		sg_init_table(src_tab, 2);
+		sg_set_buf(&src_tab[0], xbuf[0], 8);
+		sg_set_buf(&src_tab[1], xbuf[0] + 8, m_size - 8);
 		sg_init_one(&dst, outbuf_enc, out_len_max);
 		akcipher_request_set_crypt(req, src_tab, &dst, m_size,
 					   out_len_max);
diff --git a/include/crypto/akcipher.h b/include/crypto/akcipher.h
index 18a10cad07aa..2c5bc35d297a 100644
--- a/include/crypto/akcipher.h
+++ b/include/crypto/akcipher.h
@@ -16,28 +16,39 @@
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
+ * @sig:	Signature
+ * @digest:	Digest
+ * @sig_len:	Size of @sig
+ * @digest_len:	Size of @digest
  * @__ctx:	Start of private context data
  */
 struct akcipher_request {
 	struct crypto_async_request base;
-	struct scatterlist *src;
-	struct scatterlist *dst;
-	unsigned int src_len;
-	unsigned int dst_len;
+	union {
+		struct {
+			/* sign, encrypt, decrypt operations */
+			struct scatterlist *src;
+			struct scatterlist *dst;
+			unsigned int src_len;
+			unsigned int dst_len;
+		};
+		struct {
+			/* verify operation */
+			const void *sig;
+			const void *digest;
+			unsigned int sig_len;
+			unsigned int digest_len;
+		};
+	};
 	void *__ctx[] CRYPTO_MINALIGN_ATTR;
 };
 
@@ -242,20 +253,18 @@ static inline void akcipher_request_set_callback(struct akcipher_request *req,
  * Sets parameters required by crypto operation
  *
  * @req:	public key request
- * @src:	ptr to input scatter list
- * @dst:	ptr to output scatter list or NULL for verify op
- * @src_len:	size of the src input scatter list to be processed
- * @dst_len:	size of the dst output scatter list or size of signature
- *		portion in @src for verify op
+ * @src:	ptr to input scatter list or signature for verify op
+ * @dst:	ptr to output scatter list or digest for verify op
+ * @src_len:	size of @src
+ * @dst_len:	size of @dst
  */
 static inline void akcipher_request_set_crypt(struct akcipher_request *req,
-					      struct scatterlist *src,
-					      struct scatterlist *dst,
+					      const void *src, const void *dst,
 					      unsigned int src_len,
 					      unsigned int dst_len)
 {
-	req->src = src;
-	req->dst = dst;
+	req->sig = src;
+	req->digest = dst;
 	req->src_len = src_len;
 	req->dst_len = dst_len;
 }
@@ -372,10 +381,6 @@ static inline int crypto_akcipher_sign(struct akcipher_request *req)
  *
  * @req:	asymmetric key request
  *
- * Note: req->dst should be NULL, req->src should point to SG of size
- * (req->src_size + req->dst_size), containing signature (of req->src_size
- * length) with appended digest (of req->dst_size length).
- *
  * Return: zero on verification success; error code in case of error.
  */
 static inline int crypto_akcipher_verify(struct akcipher_request *req)
-- 
2.43.0


