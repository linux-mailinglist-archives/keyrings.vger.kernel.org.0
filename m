Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47A26731554
	for <lists+keyrings@lfdr.de>; Thu, 15 Jun 2023 12:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238009AbjFOK3f (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 15 Jun 2023 06:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238765AbjFOK3R (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 15 Jun 2023 06:29:17 -0400
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E24E1273D;
        Thu, 15 Jun 2023 03:29:11 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1q9kDn-003Hqk-42; Thu, 15 Jun 2023 18:28:56 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 15 Jun 2023 18:28:55 +0800
From:   "Herbert Xu" <herbert@gondor.apana.org.au>
Date:   Thu, 15 Jun 2023 18:28:55 +0800
Subject: [PATCH 5/5] KEYS: asymmetric: Use new crypto interface without scatterlists
References: <ZIrnPcPj9Zbq51jK@gondor.apana.org.au>
To:     Linus Torvalds <torvalds@linux-foundation.org>,
        Roberto Sassu <roberto.sassu@huaweicloud.com>,
        David Howells <dhowells@redhat.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Stefan Berger <stefanb@linux.ibm.com>,
        Mimi Zohar <zohar@linux.ibm.com>, dmitry.kasatkin@gmail.com,
        Jarkko Sakkinen <jarkko@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>, keyrings@vger.kernel.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Message-Id: <E1q9kDn-003Hqk-42@formenos.hmeau.com>
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_00,HELO_DYNAMIC_IPADDR2,
        PDS_RDNS_DYNAMIC_FP,RDNS_DYNAMIC,SPF_HELO_NONE,SPF_PASS,TVD_RCVD_IP,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Use the new akcipher and sig interfaces which no longer have
scatterlists in them.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---

 crypto/asymmetric_keys/public_key.c |  234 +++++++++++++++++++++---------------
 1 file changed, 137 insertions(+), 97 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index c795a12a3599..e787598cb3f7 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -8,16 +8,17 @@
  */
 
 #define pr_fmt(fmt) "PKEY: "fmt
-#include <linux/module.h>
-#include <linux/export.h>
+#include <crypto/akcipher.h>
+#include <crypto/public_key.h>
+#include <crypto/sig.h>
+#include <keys/asymmetric-subtype.h>
+#include <linux/asn1.h>
+#include <linux/err.h>
 #include <linux/kernel.h>
-#include <linux/slab.h>
+#include <linux/module.h>
 #include <linux/seq_file.h>
-#include <linux/scatterlist.h>
-#include <linux/asn1.h>
-#include <keys/asymmetric-subtype.h>
-#include <crypto/public_key.h>
-#include <crypto/akcipher.h>
+#include <linux/slab.h>
+#include <linux/string.h>
 
 MODULE_DESCRIPTION("In-software asymmetric public-key subtype");
 MODULE_AUTHOR("Red Hat, Inc.");
@@ -65,10 +66,13 @@ static void public_key_destroy(void *payload0, void *payload3)
 static int
 software_key_determine_akcipher(const struct public_key *pkey,
 				const char *encoding, const char *hash_algo,
-				char alg_name[CRYPTO_MAX_ALG_NAME])
+				char alg_name[CRYPTO_MAX_ALG_NAME], bool *sig,
+				enum kernel_pkey_operation op)
 {
 	int n;
 
+	*sig = true;
+
 	if (!encoding)
 		return -EINVAL;
 
@@ -77,14 +81,18 @@ software_key_determine_akcipher(const struct public_key *pkey,
 		 * RSA signatures usually use EMSA-PKCS1-1_5 [RFC3447 sec 8.2].
 		 */
 		if (strcmp(encoding, "pkcs1") == 0) {
-			if (!hash_algo)
+			if (!hash_algo) {
+				*sig = false;
 				n = snprintf(alg_name, CRYPTO_MAX_ALG_NAME,
 					     "pkcs1pad(%s)",
 					     pkey->pkey_algo);
-			else
+			} else {
+				*sig = op == kernel_pkey_sign ||
+				       op == kernel_pkey_verify;
 				n = snprintf(alg_name, CRYPTO_MAX_ALG_NAME,
 					     "pkcs1pad(%s,%s)",
 					     pkey->pkey_algo, hash_algo);
+			}
 			return n >= CRYPTO_MAX_ALG_NAME ? -EINVAL : 0;
 		}
 		if (strcmp(encoding, "raw") != 0)
@@ -95,6 +103,7 @@ software_key_determine_akcipher(const struct public_key *pkey,
 		 */
 		if (hash_algo)
 			return -EINVAL;
+		*sig = false;
 	} else if (strncmp(pkey->pkey_algo, "ecdsa", 5) == 0) {
 		if (strcmp(encoding, "x962") != 0)
 			return -EINVAL;
@@ -152,37 +161,70 @@ static int software_key_query(const struct kernel_pkey_params *params,
 	struct crypto_akcipher *tfm;
 	struct public_key *pkey = params->key->payload.data[asym_crypto];
 	char alg_name[CRYPTO_MAX_ALG_NAME];
+	struct crypto_sig *sig;
 	u8 *key, *ptr;
 	int ret, len;
+	bool issig;
 
 	ret = software_key_determine_akcipher(pkey, params->encoding,
-					      params->hash_algo, alg_name);
+					      params->hash_algo, alg_name,
+					      &issig, kernel_pkey_sign);
 	if (ret < 0)
 		return ret;
 
-	tfm = crypto_alloc_akcipher(alg_name, 0, 0);
-	if (IS_ERR(tfm))
-		return PTR_ERR(tfm);
-
-	ret = -ENOMEM;
 	key = kmalloc(pkey->keylen + sizeof(u32) * 2 + pkey->paramlen,
 		      GFP_KERNEL);
 	if (!key)
-		goto error_free_tfm;
+		return -ENOMEM;
+
 	memcpy(key, pkey->key, pkey->keylen);
 	ptr = key + pkey->keylen;
 	ptr = pkey_pack_u32(ptr, pkey->algo);
 	ptr = pkey_pack_u32(ptr, pkey->paramlen);
 	memcpy(ptr, pkey->params, pkey->paramlen);
 
-	if (pkey->key_is_private)
-		ret = crypto_akcipher_set_priv_key(tfm, key, pkey->keylen);
-	else
-		ret = crypto_akcipher_set_pub_key(tfm, key, pkey->keylen);
-	if (ret < 0)
-		goto error_free_key;
+	if (issig) {
+		sig = crypto_alloc_sig(alg_name, 0, 0);
+		if (IS_ERR(sig))
+			goto error_free_key;
+
+		if (pkey->key_is_private)
+			ret = crypto_sig_set_privkey(sig, key, pkey->keylen);
+		else
+			ret = crypto_sig_set_pubkey(sig, key, pkey->keylen);
+		if (ret < 0)
+			goto error_free_tfm;
+
+		len = crypto_sig_maxsize(sig);
+
+		info->supported_ops = KEYCTL_SUPPORTS_VERIFY;
+		if (pkey->key_is_private)
+			info->supported_ops |= KEYCTL_SUPPORTS_SIGN;
+
+		if (strcmp(params->encoding, "pkcs1") == 0) {
+			info->supported_ops |= KEYCTL_SUPPORTS_ENCRYPT;
+			if (pkey->key_is_private)
+				info->supported_ops |= KEYCTL_SUPPORTS_DECRYPT;
+		}
+	} else {
+		tfm = crypto_alloc_akcipher(alg_name, 0, 0);
+		if (IS_ERR(tfm))
+			goto error_free_key;
+
+		if (pkey->key_is_private)
+			ret = crypto_akcipher_set_priv_key(tfm, key, pkey->keylen);
+		else
+			ret = crypto_akcipher_set_pub_key(tfm, key, pkey->keylen);
+		if (ret < 0)
+			goto error_free_tfm;
+
+		len = crypto_akcipher_maxsize(tfm);
+
+		info->supported_ops = KEYCTL_SUPPORTS_ENCRYPT;
+		if (pkey->key_is_private)
+			info->supported_ops |= KEYCTL_SUPPORTS_DECRYPT;
+	}
 
-	len = crypto_akcipher_maxsize(tfm);
 	info->key_size = len * 8;
 
 	if (strncmp(pkey->pkey_algo, "ecdsa", 5) == 0) {
@@ -208,17 +250,16 @@ static int software_key_query(const struct kernel_pkey_params *params,
 
 	info->max_enc_size = len;
 	info->max_dec_size = len;
-	info->supported_ops = (KEYCTL_SUPPORTS_ENCRYPT |
-			       KEYCTL_SUPPORTS_VERIFY);
-	if (pkey->key_is_private)
-		info->supported_ops |= (KEYCTL_SUPPORTS_DECRYPT |
-					KEYCTL_SUPPORTS_SIGN);
+
 	ret = 0;
 
+error_free_tfm:
+	if (issig)
+		crypto_free_sig(sig);
+	else
+		crypto_free_akcipher(tfm);
 error_free_key:
 	kfree(key);
-error_free_tfm:
-	crypto_free_akcipher(tfm);
 	pr_devel("<==%s() = %d\n", __func__, ret);
 	return ret;
 }
@@ -230,34 +271,26 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 			       const void *in, void *out)
 {
 	const struct public_key *pkey = params->key->payload.data[asym_crypto];
-	struct akcipher_request *req;
-	struct crypto_akcipher *tfm;
-	struct crypto_wait cwait;
-	struct scatterlist in_sg, out_sg;
 	char alg_name[CRYPTO_MAX_ALG_NAME];
+	struct crypto_akcipher *tfm;
+	struct crypto_sig *sig;
 	char *key, *ptr;
+	bool issig;
+	int ksz;
 	int ret;
 
 	pr_devel("==>%s()\n", __func__);
 
 	ret = software_key_determine_akcipher(pkey, params->encoding,
-					      params->hash_algo, alg_name);
+					      params->hash_algo, alg_name,
+					      &issig, params->op);
 	if (ret < 0)
 		return ret;
 
-	tfm = crypto_alloc_akcipher(alg_name, 0, 0);
-	if (IS_ERR(tfm))
-		return PTR_ERR(tfm);
-
-	ret = -ENOMEM;
-	req = akcipher_request_alloc(tfm, GFP_KERNEL);
-	if (!req)
-		goto error_free_tfm;
-
 	key = kmalloc(pkey->keylen + sizeof(u32) * 2 + pkey->paramlen,
 		      GFP_KERNEL);
 	if (!key)
-		goto error_free_req;
+		return -ENOMEM;
 
 	memcpy(key, pkey->key, pkey->keylen);
 	ptr = key + pkey->keylen;
@@ -265,47 +298,70 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 	ptr = pkey_pack_u32(ptr, pkey->paramlen);
 	memcpy(ptr, pkey->params, pkey->paramlen);
 
-	if (pkey->key_is_private)
-		ret = crypto_akcipher_set_priv_key(tfm, key, pkey->keylen);
-	else
-		ret = crypto_akcipher_set_pub_key(tfm, key, pkey->keylen);
-	if (ret)
-		goto error_free_key;
+	if (issig) {
+		sig = crypto_alloc_sig(alg_name, 0, 0);
+		if (IS_ERR(sig))
+			goto error_free_key;
+
+		if (pkey->key_is_private)
+			ret = crypto_sig_set_privkey(sig, key, pkey->keylen);
+		else
+			ret = crypto_sig_set_pubkey(sig, key, pkey->keylen);
+		if (ret)
+			goto error_free_tfm;
+
+		ksz = crypto_sig_maxsize(sig);
+	} else {
+		tfm = crypto_alloc_akcipher(alg_name, 0, 0);
+		if (IS_ERR(tfm))
+			goto error_free_key;
+
+		if (pkey->key_is_private)
+			ret = crypto_akcipher_set_priv_key(tfm, key, pkey->keylen);
+		else
+			ret = crypto_akcipher_set_pub_key(tfm, key, pkey->keylen);
+		if (ret)
+			goto error_free_tfm;
+
+		ksz = crypto_akcipher_maxsize(tfm);
+	}
 
-	sg_init_one(&in_sg, in, params->in_len);
-	sg_init_one(&out_sg, out, params->out_len);
-	akcipher_request_set_crypt(req, &in_sg, &out_sg, params->in_len,
-				   params->out_len);
-	crypto_init_wait(&cwait);
-	akcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG |
-				      CRYPTO_TFM_REQ_MAY_SLEEP,
-				      crypto_req_done, &cwait);
+	ret = -EINVAL;
 
 	/* Perform the encryption calculation. */
 	switch (params->op) {
 	case kernel_pkey_encrypt:
-		ret = crypto_akcipher_encrypt(req);
+		if (issig)
+			break;
+		ret = crypto_akcipher_sync_encrypt(tfm, in, params->in_len,
+						   out, params->out_len);
 		break;
 	case kernel_pkey_decrypt:
-		ret = crypto_akcipher_decrypt(req);
+		if (issig)
+			break;
+		ret = crypto_akcipher_sync_decrypt(tfm, in, params->in_len,
+						   out, params->out_len);
 		break;
 	case kernel_pkey_sign:
-		ret = crypto_akcipher_sign(req);
+		if (!issig)
+			break;
+		ret = crypto_sig_sign(sig, in, params->in_len,
+				      out, params->out_len);
 		break;
 	default:
 		BUG();
 	}
 
-	ret = crypto_wait_req(ret, &cwait);
 	if (ret == 0)
-		ret = req->dst_len;
+		ret = ksz;
 
+error_free_tfm:
+	if (issig)
+		crypto_free_sig(sig);
+	else
+		crypto_free_akcipher(tfm);
 error_free_key:
 	kfree(key);
-error_free_req:
-	akcipher_request_free(req);
-error_free_tfm:
-	crypto_free_akcipher(tfm);
 	pr_devel("<==%s() = %d\n", __func__, ret);
 	return ret;
 }
@@ -316,12 +372,10 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 int public_key_verify_signature(const struct public_key *pkey,
 				const struct public_key_signature *sig)
 {
-	struct crypto_wait cwait;
-	struct crypto_akcipher *tfm;
-	struct akcipher_request *req;
-	struct scatterlist src_sg[2];
 	char alg_name[CRYPTO_MAX_ALG_NAME];
+	struct crypto_sig *tfm;
 	char *key, *ptr;
+	bool issig;
 	int ret;
 
 	pr_devel("==>%s()\n", __func__);
@@ -346,23 +400,19 @@ int public_key_verify_signature(const struct public_key *pkey,
 	}
 
 	ret = software_key_determine_akcipher(pkey, sig->encoding,
-					      sig->hash_algo, alg_name);
+					      sig->hash_algo, alg_name,
+					      &issig, kernel_pkey_verify);
 	if (ret < 0)
 		return ret;
 
-	tfm = crypto_alloc_akcipher(alg_name, 0, 0);
+	tfm = crypto_alloc_sig(alg_name, 0, 0);
 	if (IS_ERR(tfm))
 		return PTR_ERR(tfm);
 
-	ret = -ENOMEM;
-	req = akcipher_request_alloc(tfm, GFP_KERNEL);
-	if (!req)
-		goto error_free_tfm;
-
 	key = kmalloc(pkey->keylen + sizeof(u32) * 2 + pkey->paramlen,
 		      GFP_KERNEL);
 	if (!key)
-		goto error_free_req;
+		goto error_free_tfm;
 
 	memcpy(key, pkey->key, pkey->keylen);
 	ptr = key + pkey->keylen;
@@ -371,29 +421,19 @@ int public_key_verify_signature(const struct public_key *pkey,
 	memcpy(ptr, pkey->params, pkey->paramlen);
 
 	if (pkey->key_is_private)
-		ret = crypto_akcipher_set_priv_key(tfm, key, pkey->keylen);
+		ret = crypto_sig_set_privkey(tfm, key, pkey->keylen);
 	else
-		ret = crypto_akcipher_set_pub_key(tfm, key, pkey->keylen);
+		ret = crypto_sig_set_pubkey(tfm, key, pkey->keylen);
 	if (ret)
 		goto error_free_key;
 
-	sg_init_table(src_sg, 2);
-	sg_set_buf(&src_sg[0], sig->s, sig->s_size);
-	sg_set_buf(&src_sg[1], sig->digest, sig->digest_size);
-	akcipher_request_set_crypt(req, src_sg, NULL, sig->s_size,
-				   sig->digest_size);
-	crypto_init_wait(&cwait);
-	akcipher_request_set_callback(req, CRYPTO_TFM_REQ_MAY_BACKLOG |
-				      CRYPTO_TFM_REQ_MAY_SLEEP,
-				      crypto_req_done, &cwait);
-	ret = crypto_wait_req(crypto_akcipher_verify(req), &cwait);
+	ret = crypto_sig_verify(tfm, sig->s, sig->s_size,
+				sig->digest, sig->digest_size);
 
 error_free_key:
 	kfree(key);
-error_free_req:
-	akcipher_request_free(req);
 error_free_tfm:
-	crypto_free_akcipher(tfm);
+	crypto_free_sig(tfm);
 	pr_devel("<==%s() = %d\n", __func__, ret);
 	if (WARN_ON_ONCE(ret > 0))
 		ret = -EINVAL;
