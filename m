Return-Path: <keyrings+bounces-1955-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A186973AC6
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17AC3282622
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC8C18FC9C;
	Tue, 10 Sep 2024 15:00:10 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F9413D297;
	Tue, 10 Sep 2024 15:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725980410; cv=none; b=OnPjHRZRO+++Oon/mz7nX6qV6TOZaSeAxQXfgrOsfGjafFLRJRst2mzmsmM+2AJ3kd1gaL4zaMq3MQN5/ztelEZNf862j9wWZfAkQEbbYR22QgJ7rGSovCvmgFZL/BYjJyuLH4LebvY275gOiQ3+YcWzQRZpqkUeAUeTmeK4UZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725980410; c=relaxed/simple;
	bh=r5D7hlyOBuyq7C56lfwSZeK8c+ioe1BJWpt6HE6Qwac=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=jY5lw/ytlUtDZv+/YhUqhUxvLHpIwdcMjzZJ7/u/pid45s04VPm5xTNPm5YwAJyC6WBqq6gcc82p8H00QSDZcQt6LToWLCeZLbdhEwR0vDG6jG5h0Y8yYqB6vGfprPej6+YsFNhiqLWNX/MPgcjHApMuRzHzAC9YXB2E1fnAtj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=176.9.242.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 8E95A101D66DA;
	Tue, 10 Sep 2024 17:00:05 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 268EF6039371;
	Tue, 10 Sep 2024 17:00:05 +0200 (CEST)
X-Mailbox-Line: From 45acc8db555f80408c8b975771da34c569da45da Mon Sep 17 00:00:00 2001
Message-ID: <45acc8db555f80408c8b975771da34c569da45da.1725972334.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:14 +0200
Subject: [PATCH v2 04/19] crypto: ecrdsa - Migrate to sig_alg backend
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

A sig_alg backend has just been introduced with the intent of moving all
asymmetric sign/verify algorithms to it one by one.

Migrate ecrdsa.c to the new backend.

One benefit of the new API is the use of kernel buffers instead of
sglists, which avoids the overhead of copying signature and digest
sglists back into kernel buffers.  ecrdsa.c is thus simplified quite
a bit.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 crypto/Kconfig   |  2 +-
 crypto/ecrdsa.c  | 56 +++++++++++++++++++++---------------------------
 crypto/testmgr.c |  4 ++--
 crypto/testmgr.h |  7 +-----
 4 files changed, 28 insertions(+), 41 deletions(-)

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 89b728c72f07..e8488b8c45e3 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -302,7 +302,7 @@ config CRYPTO_ECDSA
 config CRYPTO_ECRDSA
 	tristate "EC-RDSA (Elliptic Curve Russian Digital Signature Algorithm)"
 	select CRYPTO_ECC
-	select CRYPTO_AKCIPHER
+	select CRYPTO_SIG
 	select CRYPTO_STREEBOG
 	select OID_REGISTRY
 	select ASN1
diff --git a/crypto/ecrdsa.c b/crypto/ecrdsa.c
index 3811f3805b5d..7383dd11089b 100644
--- a/crypto/ecrdsa.c
+++ b/crypto/ecrdsa.c
@@ -18,12 +18,11 @@
 
 #include <linux/module.h>
 #include <linux/crypto.h>
+#include <crypto/sig.h>
 #include <crypto/streebog.h>
-#include <crypto/internal/akcipher.h>
 #include <crypto/internal/ecc.h>
-#include <crypto/akcipher.h>
+#include <crypto/internal/sig.h>
 #include <linux/oid_registry.h>
-#include <linux/scatterlist.h>
 #include "ecrdsa_params.asn1.h"
 #include "ecrdsa_pub_key.asn1.h"
 #include "ecrdsa_defs.h"
@@ -68,13 +67,12 @@ static const struct ecc_curve *get_curve_by_oid(enum OID oid)
 	}
 }
 
-static int ecrdsa_verify(struct akcipher_request *req)
+static int ecrdsa_verify(struct crypto_sig *tfm,
+			 const void *src, unsigned int slen,
+			 const void *digest, unsigned int dlen)
 {
-	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
-	struct ecrdsa_ctx *ctx = akcipher_tfm_ctx(tfm);
-	unsigned char sig[ECRDSA_MAX_SIG_SIZE];
-	unsigned char digest[STREEBOG512_DIGEST_SIZE];
-	unsigned int ndigits = req->dst_len / sizeof(u64);
+	struct ecrdsa_ctx *ctx = crypto_sig_ctx(tfm);
+	unsigned int ndigits = dlen / sizeof(u64);
 	u64 r[ECRDSA_MAX_DIGITS]; /* witness (r) */
 	u64 _r[ECRDSA_MAX_DIGITS]; /* -r */
 	u64 s[ECRDSA_MAX_DIGITS]; /* second part of sig (s) */
@@ -91,25 +89,19 @@ static int ecrdsa_verify(struct akcipher_request *req)
 	 */
 	if (!ctx->curve ||
 	    !ctx->digest ||
-	    !req->src ||
+	    !src ||
+	    !digest ||
 	    !ctx->pub_key.x ||
-	    req->dst_len != ctx->digest_len ||
-	    req->dst_len != ctx->curve->g.ndigits * sizeof(u64) ||
+	    dlen != ctx->digest_len ||
+	    dlen != ctx->curve->g.ndigits * sizeof(u64) ||
 	    ctx->pub_key.ndigits != ctx->curve->g.ndigits ||
-	    req->dst_len * 2 != req->src_len ||
-	    WARN_ON(req->src_len > sizeof(sig)) ||
-	    WARN_ON(req->dst_len > sizeof(digest)))
+	    dlen * 2 != slen ||
+	    WARN_ON(slen > ECRDSA_MAX_SIG_SIZE) ||
+	    WARN_ON(dlen > STREEBOG512_DIGEST_SIZE))
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
+	vli_from_be64(s, src, ndigits);
+	vli_from_be64(r, src + ndigits * sizeof(u64), ndigits);
 
 	/* Step 1: verify that 0 < r < q, 0 < s < q */
 	if (vli_is_zero(r, ndigits) ||
@@ -188,10 +180,10 @@ static u8 *ecrdsa_unpack_u32(u32 *dst, void *src)
 }
 
 /* Parse BER encoded subjectPublicKey. */
-static int ecrdsa_set_pub_key(struct crypto_akcipher *tfm, const void *key,
+static int ecrdsa_set_pub_key(struct crypto_sig *tfm, const void *key,
 			      unsigned int keylen)
 {
-	struct ecrdsa_ctx *ctx = akcipher_tfm_ctx(tfm);
+	struct ecrdsa_ctx *ctx = crypto_sig_ctx(tfm);
 	unsigned int ndigits;
 	u32 algo, paramlen;
 	u8 *params;
@@ -249,9 +241,9 @@ static int ecrdsa_set_pub_key(struct crypto_akcipher *tfm, const void *key,
 	return 0;
 }
 
-static unsigned int ecrdsa_max_size(struct crypto_akcipher *tfm)
+static unsigned int ecrdsa_max_size(struct crypto_sig *tfm)
 {
-	struct ecrdsa_ctx *ctx = akcipher_tfm_ctx(tfm);
+	struct ecrdsa_ctx *ctx = crypto_sig_ctx(tfm);
 
 	/*
 	 * Verify doesn't need any output, so it's just informational
@@ -260,11 +252,11 @@ static unsigned int ecrdsa_max_size(struct crypto_akcipher *tfm)
 	return ctx->pub_key.ndigits * sizeof(u64);
 }
 
-static void ecrdsa_exit_tfm(struct crypto_akcipher *tfm)
+static void ecrdsa_exit_tfm(struct crypto_sig *tfm)
 {
 }
 
-static struct akcipher_alg ecrdsa_alg = {
+static struct sig_alg ecrdsa_alg = {
 	.verify		= ecrdsa_verify,
 	.set_pub_key	= ecrdsa_set_pub_key,
 	.max_size	= ecrdsa_max_size,
@@ -280,12 +272,12 @@ static struct akcipher_alg ecrdsa_alg = {
 
 static int __init ecrdsa_mod_init(void)
 {
-	return crypto_register_akcipher(&ecrdsa_alg);
+	return crypto_register_sig(&ecrdsa_alg);
 }
 
 static void __exit ecrdsa_mod_fini(void)
 {
-	crypto_unregister_akcipher(&ecrdsa_alg);
+	crypto_unregister_sig(&ecrdsa_alg);
 }
 
 module_init(ecrdsa_mod_init);
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 81ac32c9dd3e..0542817a9456 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5247,9 +5247,9 @@ static const struct alg_test_desc alg_test_descs[] = {
 		}
 	}, {
 		.alg = "ecrdsa",
-		.test = alg_test_akcipher,
+		.test = alg_test_sig,
 		.suite = {
-			.akcipher = __VECS(ecrdsa_tv_template)
+			.sig = __VECS(ecrdsa_tv_template)
 		}
 	}, {
 		.alg = "essiv(authenc(hmac(sha256),cbc(aes)),sha256)",
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index a4987610fcb5..fd4823c26d93 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -1119,7 +1119,7 @@ static const struct sig_testvec ecdsa_nist_p521_tv_template[] = {
 /*
  * EC-RDSA test vectors are generated by gost-engine.
  */
-static const struct akcipher_testvec ecrdsa_tv_template[] = {
+static const struct sig_testvec ecrdsa_tv_template[] = {
 	{
 	.key =
 	"\x04\x40\xd5\xa7\x77\xf9\x26\x2f\x8c\xbd\xcc\xe3\x1f\x01\x94\x05"
@@ -1144,7 +1144,6 @@ static const struct akcipher_testvec ecrdsa_tv_template[] = {
 	"\x79\xd2\x76\x64\xa3\xbd\x66\x10\x79\x05\x5a\x06\x42\xec\xb9\xc9",
 	.m_size = 32,
 	.public_key_vec = true,
-	.siggen_sigver_test = true,
 	},
 	{
 	.key =
@@ -1170,7 +1169,6 @@ static const struct akcipher_testvec ecrdsa_tv_template[] = {
 	"\x11\x23\x4a\x70\x43\x52\x7a\x68\x11\x65\x45\x37\xbb\x25\xb7\x40",
 	.m_size = 32,
 	.public_key_vec = true,
-	.siggen_sigver_test = true,
 	},
 	{
 	.key =
@@ -1196,7 +1194,6 @@ static const struct akcipher_testvec ecrdsa_tv_template[] = {
 	"\x9f\x16\xc6\x1c\xb1\x3f\x84\x41\x69\xec\x34\xfd\xf1\xf9\xa3\x39",
 	.m_size = 32,
 	.public_key_vec = true,
-	.siggen_sigver_test = true,
 	},
 	{
 	.key =
@@ -1231,7 +1228,6 @@ static const struct akcipher_testvec ecrdsa_tv_template[] = {
 	"\xa8\xf6\x80\x01\xb9\x27\xac\xd8\x45\x96\x66\xa1\xee\x48\x08\x3f",
 	.m_size = 64,
 	.public_key_vec = true,
-	.siggen_sigver_test = true,
 	},
 	{
 	.key =
@@ -1266,7 +1262,6 @@ static const struct akcipher_testvec ecrdsa_tv_template[] = {
 	"\x6d\xf4\xd2\x45\xc2\x83\xa0\x42\x95\x05\x9d\x89\x8e\x0a\xca\xcc",
 	.m_size = 64,
 	.public_key_vec = true,
-	.siggen_sigver_test = true,
 	},
 };
 
-- 
2.43.0


