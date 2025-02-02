Return-Path: <keyrings+bounces-2379-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F4CA24FC6
	for <lists+keyrings@lfdr.de>; Sun,  2 Feb 2025 20:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50CC8162E0C
	for <lists+keyrings@lfdr.de>; Sun,  2 Feb 2025 19:20:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AA41FCFE3;
	Sun,  2 Feb 2025 19:20:27 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C33D635;
	Sun,  2 Feb 2025 19:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738524027; cv=none; b=dfvsB5Hg1oWr8dW6BLGjNA0N/2GjgLG3uDe0E+8bLYPbrJcBWt+SaECfiF9RUq2vuzArQtwIY4WS1D/XU51ZMKWCPhnBYdwERw+/peREIlxLReDsKnNe/5A2Qy7tpstWNJFyBkNEV/Jyz1ppZ0oeYNdow+xsJ9k2es/opWaScs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738524027; c=relaxed/simple;
	bh=PM21b7+NVUTZOn6L311HP5iegdIvi1w5mbaGkgXdSls=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=mf040/9IaczQVDI4dAZJfeudiicvsxblNOFHcjzw2++yixc2V5toeJFrn6ad1gRvHehVXi+fjJLbieqaVwFs8NnbfmuMk04lnW/2cXynpEKlP/oS+/p5HN+iic36TtVAnFBg4cqn6vJSB+lZWaDy+Gc3IAmVcmV5mpPRVL03puE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=176.9.242.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 7E8D1101E6A35;
	Sun,  2 Feb 2025 20:11:02 +0100 (CET)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 267E161024FA;
	Sun,  2 Feb 2025 20:11:02 +0100 (CET)
X-Mailbox-Line: From 981e7c8b3f061f3effd253b8cfc6632e52e3e8fe Mon Sep 17 00:00:00 2001
Message-ID: <981e7c8b3f061f3effd253b8cfc6632e52e3e8fe.1738521533.git.lukas@wunner.de>
In-Reply-To: <cover.1738521533.git.lukas@wunner.de>
References: <cover.1738521533.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sun, 2 Feb 2025 20:00:51 +0100
Subject: [PATCH v2 1/4] crypto: sig - Prepare for algorithms with variable
 signature size
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>
Cc: David Howells <dhowells@redhat.com>, Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

The callers of crypto_sig_sign() assume that the signature size is
always equivalent to the key size.

This happens to be true for RSA, which is currently the only algorithm
implementing the ->sign() callback.  But it is false e.g. for X9.62
encoded ECDSA signatures because they have variable length.

Prepare for addition of a ->sign() callback to such algorithms by
letting the callback return the signature size (or a negative integer
on error).  When testing the ->sign() callback in test_sig_one(),
use crypto_sig_maxsize() instead of crypto_sig_keysize() to verify that
the test vector's signature does not exceed an algorithm's maximum
signature size.

There has been a relatively recent effort to upstream ECDSA signature
generation support which may benefit from this change:

https://lore.kernel.org/linux-crypto/20220908200036.2034-1-ignat@cloudflare.com/

However the main motivation for this commit is to reduce the number of
crypto_sig_keysize() callers:  This function is about to be changed to
return the size in bits instead of bytes and that will require amending
most callers to divide the return value by 8.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Cc: Ignat Korchagin <ignat@cloudflare.com>
---
 crypto/asymmetric_keys/public_key.c | 9 ++-------
 crypto/rsassa-pkcs1.c               | 2 +-
 crypto/testmgr.c                    | 7 ++++---
 include/crypto/sig.h                | 5 +++--
 4 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index bbd07a9022e6..bf165d321440 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -267,7 +267,6 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 	struct crypto_sig *sig;
 	char *key, *ptr;
 	bool issig;
-	int ksz;
 	int ret;
 
 	pr_devel("==>%s()\n", __func__);
@@ -302,8 +301,6 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 			ret = crypto_sig_set_pubkey(sig, key, pkey->keylen);
 		if (ret)
 			goto error_free_tfm;
-
-		ksz = crypto_sig_keysize(sig);
 	} else {
 		tfm = crypto_alloc_akcipher(alg_name, 0, 0);
 		if (IS_ERR(tfm)) {
@@ -317,8 +314,6 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 			ret = crypto_akcipher_set_pub_key(tfm, key, pkey->keylen);
 		if (ret)
 			goto error_free_tfm;
-
-		ksz = crypto_akcipher_maxsize(tfm);
 	}
 
 	ret = -EINVAL;
@@ -347,8 +342,8 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 		BUG();
 	}
 
-	if (ret == 0)
-		ret = ksz;
+	if (!issig && ret == 0)
+		ret = crypto_akcipher_maxsize(tfm);
 
 error_free_tfm:
 	if (issig)
diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
index f68ffd338f48..d01ac75635e0 100644
--- a/crypto/rsassa-pkcs1.c
+++ b/crypto/rsassa-pkcs1.c
@@ -210,7 +210,7 @@ static int rsassa_pkcs1_sign(struct crypto_sig *tfm,
 		memset(dst, 0, pad_len);
 	}
 
-	return 0;
+	return ctx->key_size;
 }
 
 static int rsassa_pkcs1_verify(struct crypto_sig *tfm,
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index e61490ba4095..b69877db3f33 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4328,7 +4328,7 @@ static int test_sig_one(struct crypto_sig *tfm, const struct sig_testvec *vecs)
 	if (vecs->public_key_vec)
 		return 0;
 
-	sig_size = crypto_sig_keysize(tfm);
+	sig_size = crypto_sig_maxsize(tfm);
 	if (sig_size < vecs->c_size) {
 		pr_err("alg: sig: invalid maxsize %u\n", sig_size);
 		return -EINVAL;
@@ -4340,13 +4340,14 @@ static int test_sig_one(struct crypto_sig *tfm, const struct sig_testvec *vecs)
 
 	/* Run asymmetric signature generation */
 	err = crypto_sig_sign(tfm, vecs->m, vecs->m_size, sig, sig_size);
-	if (err) {
+	if (err < 0) {
 		pr_err("alg: sig: sign test failed: err %d\n", err);
 		return err;
 	}
 
 	/* Verify that generated signature equals cooked signature */
-	if (memcmp(sig, vecs->c, vecs->c_size) ||
+	if (err != vecs->c_size ||
+	    memcmp(sig, vecs->c, vecs->c_size) ||
 	    memchr_inv(sig + vecs->c_size, 0, sig_size - vecs->c_size)) {
 		pr_err("alg: sig: sign test failed: invalid output\n");
 		hexdump(sig, sig_size);
diff --git a/include/crypto/sig.h b/include/crypto/sig.h
index cff41ad93824..11024708c069 100644
--- a/include/crypto/sig.h
+++ b/include/crypto/sig.h
@@ -23,7 +23,8 @@ struct crypto_sig {
  * struct sig_alg - generic public key signature algorithm
  *
  * @sign:	Function performs a sign operation as defined by public key
- *		algorithm. Optional.
+ *		algorithm. On success, the signature size is returned.
+ *		Optional.
  * @verify:	Function performs a complete verify operation as defined by
  *		public key algorithm, returning verification status. Optional.
  * @set_pub_key: Function invokes the algorithm specific set public key
@@ -186,7 +187,7 @@ static inline unsigned int crypto_sig_maxsize(struct crypto_sig *tfm)
  * @dst:	destination obuffer
  * @dlen:	destination length
  *
- * Return: zero on success; error code in case of error
+ * Return: signature size on success; error code in case of error
  */
 static inline int crypto_sig_sign(struct crypto_sig *tfm,
 				  const void *src, unsigned int slen,
-- 
2.43.0


