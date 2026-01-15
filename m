Return-Path: <keyrings+bounces-3776-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFCCD28DE7
	for <lists+keyrings@lfdr.de>; Thu, 15 Jan 2026 22:52:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A6F383012EB5
	for <lists+keyrings@lfdr.de>; Thu, 15 Jan 2026 21:52:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C7F830B507;
	Thu, 15 Jan 2026 21:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D1pxMngQ"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6245C329391
	for <keyrings@vger.kernel.org>; Thu, 15 Jan 2026 21:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768513919; cv=none; b=rnrLeckVvO7qc2x13a6SEBpWqIxh/TB3v2Xwsq7q2DxBToim0JjrNNgf5zsU+2JrPdLZ6JRLcLViIJiX4HgZFHyV3u2IyP0Ar4VQQBwyelI2Gdz/ruRqf+v6IJJ8lwbpKVRq0QXXj7Wxfiuc6NjvT02EvvG+BmSroeuSjq9xg5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768513919; c=relaxed/simple;
	bh=n1BDRy3Mvfe/G1vb8i8C8BKTdmhCmOstljaPklfb8zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ogBPq+spQZYXiAp2QuJF8IEzszugDFPo/KIaB1xfKZ3vcj1HbjtB6QaiMdcWlsrOis0J/O8EsLtMAUyHyhMCoAb7HGfa+jnYX9nydXUR+3TFh3/M6HOtiT2IWyJa9RPLjvvz6OqvyhzRPRs20OaMx7CIWIrc3mRLQkBDUZaK/lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D1pxMngQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768513908;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XXT2OGyjfHPFHeZtvk+/jjDN9ReDwfhhRYI9tCo0qxI=;
	b=D1pxMngQzjyQoTTLcwwB2igexcBZJH/Adek8AewlYCm7rhY1K/TAa8PF8kmcq6I2ikM/jw
	Ie9gRDOx+818KF0UjDGq26tlFddn0SNAB7xx43D0iRIrz5jWQ537EMguG455vuFtVin4H8
	53FHgOEtxbWEJTDVzn2g52rk5QNTs4o=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-299-eklJ4agcPWaJENo-pJytmA-1; Thu,
 15 Jan 2026 16:51:44 -0500
X-MC-Unique: eklJ4agcPWaJENo-pJytmA-1
X-Mimecast-MFC-AGG-ID: eklJ4agcPWaJENo-pJytmA_1768513902
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CFFC6180035D;
	Thu, 15 Jan 2026 21:51:41 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.4])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C39BB30002D6;
	Thu, 15 Jan 2026 21:51:37 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>
Cc: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v12 06/10] crypto: Add supplementary info param to asymmetric key signature verification
Date: Thu, 15 Jan 2026 21:50:48 +0000
Message-ID: <20260115215100.312611-7-dhowells@redhat.com>
In-Reply-To: <20260115215100.312611-1-dhowells@redhat.com>
References: <20260115215100.312611-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Add a supplementary information parameter to the asymmetric key signature
verification API, in particular crypto_sig_verify() and sig_alg::verify.
This takes the form of a printable string containing of key=val elements.

This is needed as some algorithms require additional metadata
(e.g. RSASSA-PSS) and this extra metadata is included in the X.509
certificates and PKCS#7 messages.  Furthermore, keyctl(KEYCTL_PKEY_VERIFY)
already allows for this to be passed to the kernel, as do the _SIGN,
_ENCRYPT and _DECRYPT keyctls.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Ignat Korchagin <ignat@cloudflare.com>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: "David S. Miller" <davem@davemloft.net>
cc: Lukas Wunner <lukas@wunner.de>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/asymmetric_keys/asymmetric_type.c | 1 +
 crypto/asymmetric_keys/public_key.c      | 2 +-
 crypto/asymmetric_keys/signature.c       | 1 +
 crypto/ecdsa-p1363.c                     | 5 +++--
 crypto/ecdsa-x962.c                      | 5 +++--
 crypto/ecdsa.c                           | 3 ++-
 crypto/ecrdsa.c                          | 3 ++-
 crypto/mldsa.c                           | 3 ++-
 crypto/rsassa-pkcs1.c                    | 3 ++-
 crypto/sig.c                             | 3 ++-
 crypto/testmgr.c                         | 2 +-
 crypto/testmgr.h                         | 1 +
 include/crypto/public_key.h              | 1 +
 include/crypto/sig.h                     | 9 ++++++---
 14 files changed, 28 insertions(+), 14 deletions(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index 348966ea2175..dad4f0edfa25 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -596,6 +596,7 @@ static int asymmetric_key_verify_signature(struct kernel_pkey_params *params,
 		.digest_size	= params->in_len,
 		.encoding	= params->encoding,
 		.hash_algo	= params->hash_algo,
+		.info		= params->info,
 		.digest		= (void *)in,
 		.s		= (void *)in2,
 	};
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index ed6b4b5ae4ef..61dc4f626620 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -433,7 +433,7 @@ int public_key_verify_signature(const struct public_key *pkey,
 		goto error_free_key;
 
 	ret = crypto_sig_verify(tfm, sig->s, sig->s_size,
-				sig->digest, sig->digest_size);
+				sig->digest, sig->digest_size, sig->info);
 
 error_free_key:
 	kfree_sensitive(key);
diff --git a/crypto/asymmetric_keys/signature.c b/crypto/asymmetric_keys/signature.c
index bea01cf27d0a..30ba50eb44af 100644
--- a/crypto/asymmetric_keys/signature.c
+++ b/crypto/asymmetric_keys/signature.c
@@ -30,6 +30,7 @@ void public_key_signature_free(struct public_key_signature *sig)
 		kfree(sig->s);
 		if (sig->digest_free)
 			kfree(sig->digest);
+		kfree(sig->info);
 		kfree(sig);
 	}
 }
diff --git a/crypto/ecdsa-p1363.c b/crypto/ecdsa-p1363.c
index e0c55c64711c..fa987dba1213 100644
--- a/crypto/ecdsa-p1363.c
+++ b/crypto/ecdsa-p1363.c
@@ -18,7 +18,8 @@ struct ecdsa_p1363_ctx {
 
 static int ecdsa_p1363_verify(struct crypto_sig *tfm,
 			      const void *src, unsigned int slen,
-			      const void *digest, unsigned int dlen)
+			      const void *digest, unsigned int dlen,
+			      const char *info)
 {
 	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
 	unsigned int keylen = DIV_ROUND_UP_POW2(crypto_sig_keysize(ctx->child),
@@ -32,7 +33,7 @@ static int ecdsa_p1363_verify(struct crypto_sig *tfm,
 	ecc_digits_from_bytes(src, keylen, sig.r, ndigits);
 	ecc_digits_from_bytes(src + keylen, keylen, sig.s, ndigits);
 
-	return crypto_sig_verify(ctx->child, &sig, sizeof(sig), digest, dlen);
+	return crypto_sig_verify(ctx->child, &sig, sizeof(sig), digest, dlen, info);
 }
 
 static unsigned int ecdsa_p1363_key_size(struct crypto_sig *tfm)
diff --git a/crypto/ecdsa-x962.c b/crypto/ecdsa-x962.c
index ee71594d10a0..5d7f1078989c 100644
--- a/crypto/ecdsa-x962.c
+++ b/crypto/ecdsa-x962.c
@@ -75,7 +75,8 @@ int ecdsa_get_signature_s(void *context, size_t hdrlen, unsigned char tag,
 
 static int ecdsa_x962_verify(struct crypto_sig *tfm,
 			     const void *src, unsigned int slen,
-			     const void *digest, unsigned int dlen)
+			     const void *digest, unsigned int dlen,
+			     const char *info)
 {
 	struct ecdsa_x962_ctx *ctx = crypto_sig_ctx(tfm);
 	struct ecdsa_x962_signature_ctx sig_ctx;
@@ -89,7 +90,7 @@ static int ecdsa_x962_verify(struct crypto_sig *tfm,
 		return err;
 
 	return crypto_sig_verify(ctx->child, &sig_ctx.sig, sizeof(sig_ctx.sig),
-				 digest, dlen);
+				 digest, dlen, info);
 }
 
 static unsigned int ecdsa_x962_key_size(struct crypto_sig *tfm)
diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
index ce8e4364842f..144fd6b9168b 100644
--- a/crypto/ecdsa.c
+++ b/crypto/ecdsa.c
@@ -65,7 +65,8 @@ static int _ecdsa_verify(struct ecc_ctx *ctx, const u64 *hash, const u64 *r, con
  */
 static int ecdsa_verify(struct crypto_sig *tfm,
 			const void *src, unsigned int slen,
-			const void *digest, unsigned int dlen)
+			const void *digest, unsigned int dlen,
+			const char *info)
 {
 	struct ecc_ctx *ctx = crypto_sig_ctx(tfm);
 	size_t bufsize = ctx->curve->g.ndigits * sizeof(u64);
diff --git a/crypto/ecrdsa.c b/crypto/ecrdsa.c
index 2c0602f0cd40..59f2d5bb3be4 100644
--- a/crypto/ecrdsa.c
+++ b/crypto/ecrdsa.c
@@ -69,7 +69,8 @@ static const struct ecc_curve *get_curve_by_oid(enum OID oid)
 
 static int ecrdsa_verify(struct crypto_sig *tfm,
 			 const void *src, unsigned int slen,
-			 const void *digest, unsigned int dlen)
+			 const void *digest, unsigned int dlen,
+			 const char *info)
 {
 	struct ecrdsa_ctx *ctx = crypto_sig_ctx(tfm);
 	unsigned int ndigits = dlen / sizeof(u64);
diff --git a/crypto/mldsa.c b/crypto/mldsa.c
index 2146c774b5ca..ba071d030ab0 100644
--- a/crypto/mldsa.c
+++ b/crypto/mldsa.c
@@ -25,7 +25,8 @@ static int crypto_mldsa_sign(struct crypto_sig *tfm,
 
 static int crypto_mldsa_verify(struct crypto_sig *tfm,
 			       const void *sig, unsigned int sig_len,
-			       const void *msg, unsigned int msg_len)
+			       const void *msg, unsigned int msg_len,
+			       const char *info)
 {
 	const struct crypto_mldsa_ctx *ctx = crypto_sig_ctx(tfm);
 
diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
index 94fa5e9600e7..6283050e609a 100644
--- a/crypto/rsassa-pkcs1.c
+++ b/crypto/rsassa-pkcs1.c
@@ -215,7 +215,8 @@ static int rsassa_pkcs1_sign(struct crypto_sig *tfm,
 
 static int rsassa_pkcs1_verify(struct crypto_sig *tfm,
 			       const void *src, unsigned int slen,
-			       const void *digest, unsigned int dlen)
+			       const void *digest, unsigned int dlen,
+			       const char *info)
 {
 	struct sig_instance *inst = sig_alg_instance(tfm);
 	struct rsassa_pkcs1_inst_ctx *ictx = sig_instance_ctx(inst);
diff --git a/crypto/sig.c b/crypto/sig.c
index beba745b6405..c56fea3a53ae 100644
--- a/crypto/sig.c
+++ b/crypto/sig.c
@@ -92,7 +92,8 @@ static int sig_default_sign(struct crypto_sig *tfm,
 
 static int sig_default_verify(struct crypto_sig *tfm,
 			      const void *src, unsigned int slen,
-			      const void *dst, unsigned int dlen)
+			      const void *dst, unsigned int dlen,
+			      const char *info)
 {
 	return -ENOSYS;
 }
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 5df204d9c9dd..51f76b15f134 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -3969,7 +3969,7 @@ static int test_sig_one(struct crypto_sig *tfm, const struct sig_testvec *vecs)
 	 * (which does not require a private key)
 	 */
 	err = crypto_sig_verify(tfm, vecs->c, vecs->c_size,
-				vecs->m, vecs->m_size);
+				vecs->m, vecs->m_size, vecs->verify_info);
 	if (err) {
 		pr_err("alg: sig: verify test failed: err %d\n", err);
 		return err;
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 1a3329e1c325..305adad2f2d0 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -146,6 +146,7 @@ struct akcipher_testvec {
 
 struct sig_testvec {
 	const unsigned char *key;
+	const unsigned char *verify_info;
 	const unsigned char *params;
 	const unsigned char *m;
 	const unsigned char *c;
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index 68899a49cd0d..b6f2f2218aae 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -48,6 +48,7 @@ struct public_key_signature {
 	u32 digest_size;	/* Number of bytes in digest */
 	bool digest_free;	/* T if digest needs freeing */
 	bool algo_does_hash;	/* Public key algo does its own hashing */
+	char *info;		/* Supplementary parameters */
 	const char *pkey_algo;
 	const char *hash_algo;
 	const char *encoding;
diff --git a/include/crypto/sig.h b/include/crypto/sig.h
index fa6dafafab3f..885fa6487780 100644
--- a/include/crypto/sig.h
+++ b/include/crypto/sig.h
@@ -56,7 +56,8 @@ struct sig_alg {
 		    void *dst, unsigned int dlen);
 	int (*verify)(struct crypto_sig *tfm,
 		      const void *src, unsigned int slen,
-		      const void *digest, unsigned int dlen);
+		      const void *digest, unsigned int dlen,
+		      const char *info);
 	int (*set_pub_key)(struct crypto_sig *tfm,
 			   const void *key, unsigned int keylen);
 	int (*set_priv_key)(struct crypto_sig *tfm,
@@ -209,16 +210,18 @@ static inline int crypto_sig_sign(struct crypto_sig *tfm,
  * @slen:	source length
  * @digest:	digest
  * @dlen:	digest length
+ * @info:	Additional parameters as a set of k=v
  *
  * Return: zero on verification success; error code in case of error.
  */
 static inline int crypto_sig_verify(struct crypto_sig *tfm,
 				    const void *src, unsigned int slen,
-				    const void *digest, unsigned int dlen)
+				    const void *digest, unsigned int dlen,
+				    const char *info)
 {
 	struct sig_alg *alg = crypto_sig_alg(tfm);
 
-	return alg->verify(tfm, src, slen, digest, dlen);
+	return alg->verify(tfm, src, slen, digest, dlen, info);
 }
 
 /**


