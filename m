Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96A7272DDE9
	for <lists+keyrings@lfdr.de>; Tue, 13 Jun 2023 11:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238412AbjFMJie (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 13 Jun 2023 05:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239111AbjFMJib (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 13 Jun 2023 05:38:31 -0400
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE99C195;
        Tue, 13 Jun 2023 02:38:28 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1q90TZ-002LQB-2l; Tue, 13 Jun 2023 17:38:10 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 13 Jun 2023 17:38:09 +0800
From:   "Herbert Xu" <herbert@gondor.apana.org.au>
Date:   Tue, 13 Jun 2023 17:38:09 +0800
Subject: [PATCH 1/5] crypto: akcipher - Add sync interface without SG lists
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
Message-Id: <E1q90TZ-002LQB-2l@formenos.hmeau.com>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_00,HELO_DYNAMIC_IPADDR2,
        PDS_RDNS_DYNAMIC_FP,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,TVD_RCVD_IP,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The only user of akcipher does not use SG lists.  Therefore forcing
users to use SG lists only results unnecessary overhead.  Add a new
interface that supports arbitrary kernel pointers.

For the time being the copy will be performed unconditionally.  But
this will go away once the underlying interface is updated.

Note also that only encryption and decryption is addressed by this
patch as sign/verify will go into a new interface (dsa).

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 crypto/akcipher.c         |   95 ++++++++++++++++++++++++++++++++++++++++++++++
 include/crypto/akcipher.h |   36 +++++++++++++++++
 2 files changed, 131 insertions(+)

diff --git a/crypto/akcipher.c b/crypto/akcipher.c
index 7960ceb528c3..2d10b58c4010 100644
--- a/crypto/akcipher.c
+++ b/crypto/akcipher.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/scatterlist.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/string.h>
@@ -17,6 +18,19 @@
 
 #include "internal.h"
 
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
@@ -186,5 +200,86 @@ int akcipher_register_instance(struct crypto_template *tmpl,
 }
 EXPORT_SYMBOL_GPL(akcipher_register_instance);
 
+static int crypto_akcipher_sync_prep(struct crypto_akcipher_sync_data *data)
+{
+	unsigned int reqsize = crypto_akcipher_reqsize(data->tfm);
+	unsigned int mlen = max(data->slen, data->dlen);
+	struct akcipher_request *req;
+	struct scatterlist *sg;
+	unsigned int len;
+	u8 *buf;
+
+	len = sizeof(*req) + reqsize + mlen;
+	if (len < mlen)
+		return -EOVERFLOW;
+
+	req = kzalloc(len, GFP_KERNEL);
+	if (!req)
+		return -ENOMEM;
+
+	data->req = req;
+
+	buf = (u8 *)(req + 1) + reqsize;
+	data->buf = buf;
+	memcpy(buf, data->src, data->slen);
+
+	sg = &data->sg;
+	sg_init_one(sg, buf, mlen);
+	akcipher_request_set_crypt(req, sg, sg, data->slen, data->dlen);
+
+	crypto_init_wait(&data->cwait);
+	akcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_SLEEP,
+				      crypto_req_done, &data->cwait);
+
+	return 0;
+}
+
+static int crypto_akcipher_sync_post(struct crypto_akcipher_sync_data *data,
+				     int err)
+{
+	err = crypto_wait_req(err, &data->cwait);
+	memcpy(data->dst, data->buf, data->dlen);
+	data->dlen = data->req->dst_len;
+	kfree_sensitive(data->req);
+	return err;
+}
+
+int crypto_akcipher_sync_encrypt(struct crypto_akcipher *tfm,
+				 const void *src, unsigned int slen,
+				 void *dst, unsigned int dlen)
+{
+	struct crypto_akcipher_sync_data data = {
+		.tfm = tfm,
+		.src = src,
+		.dst = dst,
+		.slen = slen,
+		.dlen = dlen,
+	};
+
+	return crypto_akcipher_sync_prep(&data) ?:
+	       crypto_akcipher_sync_post(&data,
+					 crypto_akcipher_encrypt(data.req));
+}
+EXPORT_SYMBOL_GPL(crypto_akcipher_sync_encrypt);
+
+int crypto_akcipher_sync_decrypt(struct crypto_akcipher *tfm,
+				 const void *src, unsigned int slen,
+				 void *dst, unsigned int dlen)
+{
+	struct crypto_akcipher_sync_data data = {
+		.tfm = tfm,
+		.src = src,
+		.dst = dst,
+		.slen = slen,
+		.dlen = dlen,
+	};
+
+	return crypto_akcipher_sync_prep(&data) ?:
+	       crypto_akcipher_sync_post(&data,
+					 crypto_akcipher_decrypt(data.req)) ?:
+	       data.dlen;
+}
+EXPORT_SYMBOL_GPL(crypto_akcipher_sync_decrypt);
+
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("Generic public key cipher type");
diff --git a/include/crypto/akcipher.h b/include/crypto/akcipher.h
index f35fd653e4e5..670508f1dca1 100644
--- a/include/crypto/akcipher.h
+++ b/include/crypto/akcipher.h
@@ -373,6 +373,42 @@ static inline int crypto_akcipher_decrypt(struct akcipher_request *req)
 	return crypto_akcipher_errstat(alg, alg->decrypt(req));
 }
 
+/**
+ * crypto_akcipher_sync_encrypt() - Invoke public key encrypt operation
+ *
+ * Function invokes the specific public key encrypt operation for a given
+ * public key algorithm
+ *
+ * @tfm:	AKCIPHER tfm handle allocated with crypto_alloc_akcipher()
+ * @src:	source buffer
+ * @slen:	source length
+ * @dst:	destinatino obuffer
+ * @dlen:	destination length
+ *
+ * Return: zero on success; error code in case of error
+ */
+int crypto_akcipher_sync_encrypt(struct crypto_akcipher *tfm,
+				 const void *src, unsigned int slen,
+				 void *dst, unsigned int dlen);
+
+/**
+ * crypto_akcipher_sync_decrypt() - Invoke public key decrypt operation
+ *
+ * Function invokes the specific public key decrypt operation for a given
+ * public key algorithm
+ *
+ * @tfm:	AKCIPHER tfm handle allocated with crypto_alloc_akcipher()
+ * @src:	source buffer
+ * @slen:	source length
+ * @dst:	destinatino obuffer
+ * @dlen:	destination length
+ *
+ * Return: Output length on success; error code in case of error
+ */
+int crypto_akcipher_sync_decrypt(struct crypto_akcipher *tfm,
+				 const void *src, unsigned int slen,
+				 void *dst, unsigned int dlen);
+
 /**
  * crypto_akcipher_sign() - Invoke public key sign operation
  *
