Return-Path: <keyrings+bounces-1829-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 507A393F7F4
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 16:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C57CD1F22865
	for <lists+keyrings@lfdr.de>; Mon, 29 Jul 2024 14:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B6F515B0FC;
	Mon, 29 Jul 2024 14:23:06 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EA115956E;
	Mon, 29 Jul 2024 14:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722262986; cv=none; b=Kf6f8ni3nOB6uhywjNgGv+Q09M/0kzcJwdJ8vQ1qUKZX0jFF58dqQLDWQJFfiOfyZkeWnG3Dibohj3IoMr/8QxzjbXPdTee4tjf1YeiRAYVCXbYU869WnjD07Q6ig5SYd195owK3oll1fKUVpdFAZ+qdgK6rPHKXQRApMFzaIkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722262986; c=relaxed/simple;
	bh=yFjhCDW/4/pskMBZWpISnW0wA2I1gRBBaDzVXgwfNUA=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=PsjIehC6UcU26IhCWl+tQnB2oSgw2whaOkcRbfb4xr1IJDty5kJIzdCDSE7/KphEpr/Z24YXFroVLs9+tha5jEdek4bZWGh7gyHSLHpq22Ut5FbJC5sn1XGS2krark20KvNaUJR/7s6jfrVPMwoyC4qyIbb23YHULmxh6BtmQLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=176.9.242.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 7C2BA1005D079;
	Mon, 29 Jul 2024 16:23:00 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 39F5D638C58F;
	Mon, 29 Jul 2024 16:23:00 +0200 (CEST)
X-Mailbox-Line: From 73f2190e7254181f9ab7e9a3ec64cae56def8435 Mon Sep 17 00:00:00 2001
Message-ID: <73f2190e7254181f9ab7e9a3ec64cae56def8435.1722260176.git.lukas@wunner.de>
In-Reply-To: <cover.1722260176.git.lukas@wunner.de>
References: <cover.1722260176.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 29 Jul 2024 15:51:00 +0200
Subject: [PATCH 5/5] crypto: ecdsa - Support P1363 signature decoding
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>
Cc: David Howells <dhowells@redhat.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

Alternatively to the X9.62 encoding of ecdsa signatures, which uses
ASN.1 and is already supported by the kernel, there's another common
encoding called P1363.  It stores r and s as the concatenation of two
big endian, unsigned integers.  The name originates from IEEE P1363.

Add a P1363 template in support of the forthcoming SPDM library
(Security Protocol and Data Model) for PCI device authentication.

P1363 is prescribed by SPDM 1.2.1 margin no 44:

   "For ECDSA signatures, excluding SM2, in SPDM, the signature shall be
    the concatenation of r and s.  The size of r shall be the size of
    the selected curve.  Likewise, the size of s shall be the size of
    the selected curve.  See BaseAsymAlgo in NEGOTIATE_ALGORITHMS for
    the size of r and s.  The byte order for r and s shall be in big
    endian order.  When placing ECDSA signatures into an SPDM signature
    field, r shall come first followed by s."

Link: https://www.dmtf.org/sites/default/files/standards/documents/DSP0274_1.2.1.pdf
Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 crypto/Makefile                     |   1 +
 crypto/asymmetric_keys/public_key.c |  40 ++++---
 crypto/ecdsa-p1363.c                | 155 ++++++++++++++++++++++++++++
 crypto/ecdsa.c                      |   8 ++
 crypto/testmgr.c                    |  18 ++++
 crypto/testmgr.h                    |  34 ++++++
 include/crypto/internal/ecc.h       |   1 +
 7 files changed, 241 insertions(+), 16 deletions(-)
 create mode 100644 crypto/ecdsa-p1363.c

diff --git a/crypto/Makefile b/crypto/Makefile
index eb6479493f6c..f7a7b1a6c93f 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -54,6 +54,7 @@ $(obj)/ecdsasignature.asn1.o: $(obj)/ecdsasignature.asn1.c $(obj)/ecdsasignature
 $(obj)/ecdsa-x962.o: $(obj)/ecdsasignature.asn1.h
 ecdsa_generic-y += ecdsa.o
 ecdsa_generic-y += ecdsa-x962.o
+ecdsa_generic-y += ecdsa-p1363.o
 ecdsa_generic-y += ecdsasignature.asn1.o
 obj-$(CONFIG_CRYPTO_ECDSA) += ecdsa_generic.o
 
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index 5391f1158bcd..6b004022f655 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -104,7 +104,8 @@ software_key_determine_akcipher(const struct public_key *pkey,
 			return -EINVAL;
 		*sig = false;
 	} else if (strncmp(pkey->pkey_algo, "ecdsa", 5) == 0) {
-		if (strcmp(encoding, "x962") != 0)
+		if (strcmp(encoding, "x962") != 0 &&
+		    strcmp(encoding, "p1363") != 0)
 			return -EINVAL;
 		/*
 		 * ECDSA signatures are taken over a raw hash, so they don't
@@ -230,7 +231,6 @@ static int software_key_query(const struct kernel_pkey_params *params,
 	info->key_size = len * 8;
 
 	if (strncmp(pkey->pkey_algo, "ecdsa", 5) == 0) {
-		int slen = len;
 		/*
 		 * ECDSA key sizes are much smaller than RSA, and thus could
 		 * operate on (hashed) inputs that are larger than key size.
@@ -242,21 +242,29 @@ static int software_key_query(const struct kernel_pkey_params *params,
 
 		/*
 		 * Verify takes ECDSA-Sig (described in RFC 5480) as input,
-		 * which is actually 2 'key_size'-bit integers encoded in
-		 * ASN.1.  Account for the ASN.1 encoding overhead here.
-		 *
-		 * NIST P192/256/384 may prepend a '0' to a coordinate to
-		 * indicate a positive integer. NIST P521 never needs it.
+		 * which is actually 2 'key_size'-bit integers.
 		 */
-		if (strcmp(pkey->pkey_algo, "ecdsa-nist-p521") != 0)
-			slen += 1;
-		/* Length of encoding the x & y coordinates */
-		slen = 2 * (slen + 2);
-		/*
-		 * If coordinate encoding takes at least 128 bytes then an
-		 * additional byte for length encoding is needed.
-		 */
-		info->max_sig_size = 1 + (slen >= 128) + 1 + slen;
+		if (strcmp(params->encoding, "x962") == 0) {
+			int slen = len;
+
+			/*
+			 * Account for the ASN.1 encoding overhead here.
+			 *
+			 * NIST P192/256/384 may prepend a '0' to a coordinate
+			 * to indicate a positive integer. NIST P521 does not.
+			 */
+			if (strcmp(pkey->pkey_algo, "ecdsa-nist-p521") != 0)
+				slen += 1;
+			/* Length of encoding the x & y coordinates */
+			slen = 2 * (slen + 2);
+			/*
+			 * If coordinate encoding takes at least 128 bytes then
+			 * an additional byte for length encoding is needed.
+			 */
+			info->max_sig_size = 1 + (slen >= 128) + 1 + slen;
+		} else if (strcmp(params->encoding, "p1363") == 0) {
+			info->max_sig_size = 2 * len;
+		}
 	} else {
 		info->max_data_size = len;
 		info->max_sig_size = len;
diff --git a/crypto/ecdsa-p1363.c b/crypto/ecdsa-p1363.c
new file mode 100644
index 000000000000..c0610d88aa9e
--- /dev/null
+++ b/crypto/ecdsa-p1363.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ECDSA P1363 signature encoding
+ *
+ * Copyright (c) 2024 Intel Corporation
+ */
+
+#include <linux/err.h>
+#include <linux/module.h>
+#include <crypto/akcipher.h>
+#include <crypto/algapi.h>
+#include <crypto/internal/akcipher.h>
+#include <crypto/internal/ecc.h>
+
+struct ecdsa_p1363_ctx {
+	struct crypto_akcipher *child;
+};
+
+struct ecdsa_p1363_request {
+	u64 r[ECC_MAX_DIGITS];
+	u64 s[ECC_MAX_DIGITS];
+	struct akcipher_request child_req;
+};
+
+static int ecdsa_p1363_verify(struct akcipher_request *req)
+{
+	struct ecdsa_p1363_request *req_ctx = akcipher_request_ctx(req);
+	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
+	struct ecdsa_p1363_ctx *ctx = akcipher_tfm_ctx(tfm);
+	unsigned int keylen = crypto_akcipher_maxsize(ctx->child);
+	unsigned int ndigits = DIV_ROUND_UP(keylen, sizeof(u64));
+
+	if (req->sig_len != keylen * 2)
+		return -EINVAL;
+
+	ecc_digits_from_bytes(req->sig, keylen, req_ctx->r, ndigits);
+	ecc_digits_from_bytes(req->sig + keylen, keylen, req_ctx->s, ndigits);
+
+	akcipher_request_set_tfm(&req_ctx->child_req, ctx->child);
+	akcipher_request_set_crypt(&req_ctx->child_req, req_ctx, req->digest,
+				   ECC_MAX_BYTES * 2, req->digest_len);
+
+	return crypto_akcipher_verify(&req_ctx->child_req);
+}
+
+static unsigned int ecdsa_p1363_max_size(struct crypto_akcipher *tfm)
+{
+	struct ecdsa_p1363_ctx *ctx = akcipher_tfm_ctx(tfm);
+
+	return crypto_akcipher_maxsize(ctx->child);
+}
+
+static int ecdsa_p1363_set_pub_key(struct crypto_akcipher *tfm, const void *key,
+				   unsigned int keylen)
+{
+	struct ecdsa_p1363_ctx *ctx = akcipher_tfm_ctx(tfm);
+
+	return crypto_akcipher_set_pub_key(ctx->child, key, keylen);
+}
+
+static int ecdsa_p1363_init_tfm(struct crypto_akcipher *tfm)
+{
+	struct akcipher_instance *inst = akcipher_alg_instance(tfm);
+	struct crypto_akcipher_spawn *spawn = akcipher_instance_ctx(inst);
+	struct ecdsa_p1363_ctx *ctx = akcipher_tfm_ctx(tfm);
+	struct crypto_akcipher *child_tfm;
+
+	child_tfm = crypto_spawn_akcipher(spawn);
+	if (IS_ERR(child_tfm))
+		return PTR_ERR(child_tfm);
+
+	ctx->child = child_tfm;
+
+	akcipher_set_reqsize(tfm, sizeof(struct ecdsa_p1363_request) +
+				  crypto_akcipher_reqsize(child_tfm));
+
+	return 0;
+}
+
+static void ecdsa_p1363_exit_tfm(struct crypto_akcipher *tfm)
+{
+	struct ecdsa_p1363_ctx *ctx = akcipher_tfm_ctx(tfm);
+
+	crypto_free_akcipher(ctx->child);
+}
+
+static void ecdsa_p1363_free(struct akcipher_instance *inst)
+{
+	struct crypto_akcipher_spawn *spawn = akcipher_instance_ctx(inst);
+
+	crypto_drop_akcipher(spawn);
+	kfree(inst);
+}
+
+static int ecdsa_p1363_create(struct crypto_template *tmpl, struct rtattr **tb)
+{
+	struct crypto_akcipher_spawn *spawn;
+	struct akcipher_instance *inst;
+	struct akcipher_alg *ecdsa_alg;
+	u32 mask;
+	int err;
+
+	err = crypto_check_attr_type(tb, CRYPTO_ALG_TYPE_AKCIPHER, &mask);
+	if (err)
+		return err;
+
+	inst = kzalloc(sizeof(*inst) + sizeof(*spawn), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+
+	spawn = akcipher_instance_ctx(inst);
+
+	err = crypto_grab_akcipher(spawn, akcipher_crypto_instance(inst),
+				   crypto_attr_alg_name(tb[1]), 0, mask);
+	if (err)
+		goto err_free_inst;
+
+	ecdsa_alg = crypto_spawn_akcipher_alg(spawn);
+
+	err = -EINVAL;
+	if (strncmp(ecdsa_alg->base.cra_name, "ecdsa", 5) != 0)
+		goto err_free_inst;
+
+	err = crypto_inst_setname(akcipher_crypto_instance(inst), tmpl->name,
+				  &ecdsa_alg->base);
+	if (err)
+		goto err_free_inst;
+
+	inst->alg.base.cra_priority = ecdsa_alg->base.cra_priority;
+	inst->alg.base.cra_ctxsize = sizeof(struct ecdsa_p1363_ctx);
+
+	inst->alg.init = ecdsa_p1363_init_tfm;
+	inst->alg.exit = ecdsa_p1363_exit_tfm;
+
+	inst->alg.verify = ecdsa_p1363_verify;
+	inst->alg.max_size = ecdsa_p1363_max_size;
+	inst->alg.set_pub_key = ecdsa_p1363_set_pub_key;
+
+	inst->free = ecdsa_p1363_free;
+
+	err = akcipher_register_instance(tmpl, inst);
+	if (err) {
+err_free_inst:
+		ecdsa_p1363_free(inst);
+	}
+	return err;
+}
+
+struct crypto_template ecdsa_p1363_tmpl = {
+	.name = "p1363",
+	.create = ecdsa_p1363_create,
+	.module = THIS_MODULE,
+};
+
+MODULE_ALIAS_CRYPTO("p1363");
diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
index 86fc64cb1aee..63cffd978ebd 100644
--- a/crypto/ecdsa.c
+++ b/crypto/ecdsa.c
@@ -291,8 +291,15 @@ static int __init ecdsa_init(void)
 	if (ret)
 		goto x962_tmpl_error;
 
+	ret = crypto_register_template(&ecdsa_p1363_tmpl);
+	if (ret)
+		goto p1363_tmpl_error;
+
 	return 0;
 
+p1363_tmpl_error:
+	crypto_unregister_template(&ecdsa_x962_tmpl);
+
 x962_tmpl_error:
 	crypto_unregister_akcipher(&ecdsa_nist_p521);
 
@@ -311,6 +318,7 @@ static int __init ecdsa_init(void)
 static void __exit ecdsa_exit(void)
 {
 	crypto_unregister_template(&ecdsa_x962_tmpl);
+	crypto_unregister_template(&ecdsa_p1363_tmpl);
 
 	if (ecdsa_nist_p192_registered)
 		crypto_unregister_akcipher(&ecdsa_nist_p192);
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 5d3af7c8e723..fab2b453b3e9 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5427,6 +5427,24 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(nhpoly1305_tv_template)
 		}
+	}, {
+		.alg = "p1363(ecdsa-nist-p192)",
+		.test = alg_test_null,
+	}, {
+		.alg = "p1363(ecdsa-nist-p256)",
+		.test = alg_test_akcipher,
+		.fips_allowed = 1,
+		.suite = {
+			.akcipher = __VECS(p1363_ecdsa_nist_p256_tv_template)
+		}
+	}, {
+		.alg = "p1363(ecdsa-nist-p384)",
+		.test = alg_test_null,
+		.fips_allowed = 1,
+	}, {
+		.alg = "p1363(ecdsa-nist-p521)",
+		.test = alg_test_null,
+		.fips_allowed = 1,
 	}, {
 		.alg = "pcbc(fcrypt)",
 		.test = alg_test_skcipher,
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index d052d18c8f5b..cdd33dc19396 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -2024,6 +2024,40 @@ static const struct akcipher_testvec x962_ecdsa_nist_p521_tv_template[] = {
 	},
 };
 
+/*
+ * ECDSA P1363 test vectors.
+ *
+ * Identical to ECDSA test vectors, except signature in "c" is P1363 encoded.
+ */
+static const struct akcipher_testvec p1363_ecdsa_nist_p256_tv_template[] = {
+	{
+	.key =
+	"\x04\xf1\xea\xc4\x53\xf3\xb9\x0e\x9f\x7e\xad\xe3\xea\xd7\x0e\x0f"
+	"\xd6\x98\x9a\xca\x92\x4d\x0a\x80\xdb\x2d\x45\xc7\xec\x4b\x97\x00"
+	"\x2f\xe9\x42\x6c\x29\xdc\x55\x0e\x0b\x53\x12\x9b\x2b\xad\x2c\xe9"
+	"\x80\xe6\xc5\x43\xc2\x1d\x5e\xbb\x65\x21\x50\xb6\x37\xb0\x03\x8e"
+	"\xb8",
+	.key_len = 65,
+	.params =
+	"\x30\x13\x06\x07\x2a\x86\x48\xce\x3d\x02\x01\x06\x08\x2a\x86\x48"
+	"\xce\x3d\x03\x01\x07",
+	.param_len = 21,
+	.m =
+	"\x8f\x43\x43\x46\x64\x8f\x6b\x96\xdf\x89\xdd\xa9\x01\xc5\x17\x6b"
+	"\x10\xa6\xd8\x39\x61\xdd\x3c\x1a\xc8\x8b\x59\xb2\xdc\x32\x7a\xa4",
+	.m_size = 32,
+	.algo = OID_id_ecdsa_with_sha256,
+	.c =
+	"\x08\x31\xfa\x74\x0d\x1d\x21\x5d\x09\xdc\x29\x63\xa8\x1a\xad\xfc"
+	"\xac\x44\xc3\xe8\x24\x11\x2d\xa4\x91\xdc\x02\x67\xdc\x0c\xd0\x82"
+	"\xbd\xff\xce\xee\x42\xc3\x97\xff\xf9\xa9\x81\xac\x4a\x50\xd0\x91"
+	"\x0a\x6e\x1b\xc4\xaf\xe1\x83\xc3\x4f\x2a\x65\x35\x23\xe3\x1d\xfa",
+	.c_size = 64,
+	.public_key_vec = true,
+	.siggen_sigver_test = true,
+	},
+};
+
 /*
  * EC-RDSA test vectors are generated by gost-engine.
  */
diff --git a/include/crypto/internal/ecc.h b/include/crypto/internal/ecc.h
index 568b7c5352b9..af0763d859ce 100644
--- a/include/crypto/internal/ecc.h
+++ b/include/crypto/internal/ecc.h
@@ -294,4 +294,5 @@ void ecc_point_mult_shamir(const struct ecc_point *result,
 			   const struct ecc_curve *curve);
 
 extern struct crypto_template ecdsa_x962_tmpl;
+extern struct crypto_template ecdsa_p1363_tmpl;
 #endif
-- 
2.43.0


