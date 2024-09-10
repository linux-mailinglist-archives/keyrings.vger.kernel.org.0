Return-Path: <keyrings+bounces-1970-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DDC973C0E
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:33:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51B6128AAD4
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCB1199935;
	Tue, 10 Sep 2024 15:33:14 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E175F19D09E;
	Tue, 10 Sep 2024 15:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982394; cv=none; b=OIFpVPcqEhBpAt2cgOi/x39C/bukiEiIQVUo1Q2JYnnwVALg/PJG7X1/0Gj9i6i3RrI+Ln6grMKClxKZUChsVGx421KX5SeEMjlAH1YCfGPB/MsvXKqPdmrubiyabjTW5JW/vui7A9EhGRs/0QlYNEcCMma1LHtGKI26UFlDQ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982394; c=relaxed/simple;
	bh=+70tJNDhKmOjqevtH5xBEDGhBd3t27+gve5o+W4Pz9I=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=VezTiIEipaseKc+THvauH8JDVR+Xhb7V5I7bLnV0XTJO7fbzTFR4LNPt8FIUyPF9T9pE3yp5VGfD6Ch6PztJtwNtNnOEt3mx+2PjpyLCiJ+9aNDc4O/zkRHNbH4ZINyBnssP1psroIQwzo6eHXCkDlqR3guhlhCR9rendSx/C2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=176.9.242.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 7B50A102A5C94;
	Tue, 10 Sep 2024 17:33:09 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 2F97360A8B01;
	Tue, 10 Sep 2024 17:33:09 +0200 (CEST)
X-Mailbox-Line: From 73e9e6b6ba2631e2d9474bd53be165b2ae8810d4 Mon Sep 17 00:00:00 2001
Message-ID: <73e9e6b6ba2631e2d9474bd53be165b2ae8810d4.1725972335.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:28 +0200
Subject: [PATCH v2 18/19] crypto: ecdsa - Support P1363 signature decoding
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
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
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
Changes v1 -> v2:
  * Drop unnecessary "params", "param_len" and "algo" definitions from
    p1363_ecdsa_nist_p256_tv_template[].

 crypto/Makefile                     |   1 +
 crypto/asymmetric_keys/public_key.c |   3 +-
 crypto/ecdsa-p1363.c                | 159 ++++++++++++++++++++++++++++
 crypto/ecdsa.c                      |   8 ++
 crypto/testmgr.c                    |  18 ++++
 crypto/testmgr.h                    |  28 +++++
 include/crypto/internal/ecc.h       |   1 +
 7 files changed, 217 insertions(+), 1 deletion(-)
 create mode 100644 crypto/ecdsa-p1363.c

diff --git a/crypto/Makefile b/crypto/Makefile
index af43a1bd1cfa..81be78d39c2d 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -55,6 +55,7 @@ $(obj)/ecdsasignature.asn1.o: $(obj)/ecdsasignature.asn1.c $(obj)/ecdsasignature
 $(obj)/ecdsa-x962.o: $(obj)/ecdsasignature.asn1.h
 ecdsa_generic-y += ecdsa.o
 ecdsa_generic-y += ecdsa-x962.o
+ecdsa_generic-y += ecdsa-p1363.o
 ecdsa_generic-y += ecdsasignature.asn1.o
 obj-$(CONFIG_CRYPTO_ECDSA) += ecdsa_generic.o
 
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index ec2c0e009b49..c98c1588802b 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -110,7 +110,8 @@ software_key_determine_akcipher(const struct public_key *pkey,
 			return -EINVAL;
 		*sig = false;
 	} else if (strncmp(pkey->pkey_algo, "ecdsa", 5) == 0) {
-		if (strcmp(encoding, "x962") != 0)
+		if (strcmp(encoding, "x962") != 0 &&
+		    strcmp(encoding, "p1363") != 0)
 			return -EINVAL;
 		/*
 		 * ECDSA signatures are taken over a raw hash, so they don't
diff --git a/crypto/ecdsa-p1363.c b/crypto/ecdsa-p1363.c
new file mode 100644
index 000000000000..eaae7214d69b
--- /dev/null
+++ b/crypto/ecdsa-p1363.c
@@ -0,0 +1,159 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ECDSA P1363 signature encoding
+ *
+ * Copyright (c) 2024 Intel Corporation
+ */
+
+#include <linux/err.h>
+#include <linux/module.h>
+#include <crypto/algapi.h>
+#include <crypto/sig.h>
+#include <crypto/internal/ecc.h>
+#include <crypto/internal/sig.h>
+
+struct ecdsa_p1363_ctx {
+	struct crypto_sig *child;
+};
+
+static int ecdsa_p1363_verify(struct crypto_sig *tfm,
+			      const void *src, unsigned int slen,
+			      const void *digest, unsigned int dlen)
+{
+	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
+	unsigned int keylen = crypto_sig_keysize(ctx->child);
+	unsigned int ndigits = DIV_ROUND_UP(keylen, sizeof(u64));
+	struct ecdsa_raw_sig sig;
+
+	if (slen != 2 * keylen)
+		return -EINVAL;
+
+	ecc_digits_from_bytes(src, keylen, sig.r, ndigits);
+	ecc_digits_from_bytes(src + keylen, keylen, sig.s, ndigits);
+
+	return crypto_sig_verify(ctx->child, &sig, sizeof(sig), digest, dlen);
+}
+
+static unsigned int ecdsa_p1363_key_size(struct crypto_sig *tfm)
+{
+	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
+
+	return crypto_sig_keysize(ctx->child);
+}
+
+static unsigned int ecdsa_p1363_max_size(struct crypto_sig *tfm)
+{
+	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
+
+	return 2 * crypto_sig_keysize(ctx->child);
+}
+
+static unsigned int ecdsa_p1363_digest_size(struct crypto_sig *tfm)
+{
+	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
+
+	return crypto_sig_digestsize(ctx->child);
+}
+
+static int ecdsa_p1363_set_pub_key(struct crypto_sig *tfm,
+				   const void *key, unsigned int keylen)
+{
+	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
+
+	return crypto_sig_set_pubkey(ctx->child, key, keylen);
+}
+
+static int ecdsa_p1363_init_tfm(struct crypto_sig *tfm)
+{
+	struct sig_instance *inst = sig_alg_instance(tfm);
+	struct crypto_sig_spawn *spawn = sig_instance_ctx(inst);
+	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
+	struct crypto_sig *child_tfm;
+
+	child_tfm = crypto_spawn_sig(spawn);
+	if (IS_ERR(child_tfm))
+		return PTR_ERR(child_tfm);
+
+	ctx->child = child_tfm;
+
+	return 0;
+}
+
+static void ecdsa_p1363_exit_tfm(struct crypto_sig *tfm)
+{
+	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
+
+	crypto_free_sig(ctx->child);
+}
+
+static void ecdsa_p1363_free(struct sig_instance *inst)
+{
+	struct crypto_sig_spawn *spawn = sig_instance_ctx(inst);
+
+	crypto_drop_sig(spawn);
+	kfree(inst);
+}
+
+static int ecdsa_p1363_create(struct crypto_template *tmpl, struct rtattr **tb)
+{
+	struct crypto_sig_spawn *spawn;
+	struct sig_instance *inst;
+	struct sig_alg *ecdsa_alg;
+	u32 mask;
+	int err;
+
+	err = crypto_check_attr_type(tb, CRYPTO_ALG_TYPE_SIG, &mask);
+	if (err)
+		return err;
+
+	inst = kzalloc(sizeof(*inst) + sizeof(*spawn), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+
+	spawn = sig_instance_ctx(inst);
+
+	err = crypto_grab_sig(spawn, sig_crypto_instance(inst),
+			      crypto_attr_alg_name(tb[1]), 0, mask);
+	if (err)
+		goto err_free_inst;
+
+	ecdsa_alg = crypto_spawn_sig_alg(spawn);
+
+	err = -EINVAL;
+	if (strncmp(ecdsa_alg->base.cra_name, "ecdsa", 5) != 0)
+		goto err_free_inst;
+
+	err = crypto_inst_setname(sig_crypto_instance(inst), tmpl->name,
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
+	inst->alg.key_size = ecdsa_p1363_key_size;
+	inst->alg.max_size = ecdsa_p1363_max_size;
+	inst->alg.digest_size = ecdsa_p1363_digest_size;
+	inst->alg.set_pub_key = ecdsa_p1363_set_pub_key;
+
+	inst->free = ecdsa_p1363_free;
+
+	err = sig_register_instance(tmpl, inst);
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
index cf8e0c5d1dd8..117526d15dde 100644
--- a/crypto/ecdsa.c
+++ b/crypto/ecdsa.c
@@ -298,8 +298,15 @@ static int __init ecdsa_init(void)
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
 	crypto_unregister_sig(&ecdsa_nist_p521);
 
@@ -318,6 +325,7 @@ static int __init ecdsa_init(void)
 static void __exit ecdsa_exit(void)
 {
 	crypto_unregister_template(&ecdsa_x962_tmpl);
+	crypto_unregister_template(&ecdsa_p1363_tmpl);
 
 	if (ecdsa_nist_p192_registered)
 		crypto_unregister_sig(&ecdsa_nist_p192);
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 287ed2daadf4..bf266dedd07f 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5494,6 +5494,24 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(nhpoly1305_tv_template)
 		}
+	}, {
+		.alg = "p1363(ecdsa-nist-p192)",
+		.test = alg_test_null,
+	}, {
+		.alg = "p1363(ecdsa-nist-p256)",
+		.test = alg_test_sig,
+		.fips_allowed = 1,
+		.suite = {
+			.sig = __VECS(p1363_ecdsa_nist_p256_tv_template)
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
index 2bd77eaafdf6..55aae1859d2c 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -1805,6 +1805,34 @@ static const struct sig_testvec x962_ecdsa_nist_p521_tv_template[] = {
 	},
 };
 
+/*
+ * ECDSA P1363 test vectors.
+ *
+ * Identical to ECDSA test vectors, except signature in "c" is P1363 encoded.
+ */
+static const struct sig_testvec p1363_ecdsa_nist_p256_tv_template[] = {
+	{
+	.key = /* secp256r1(sha256) */
+	"\x04\xf1\xea\xc4\x53\xf3\xb9\x0e\x9f\x7e\xad\xe3\xea\xd7\x0e\x0f"
+	"\xd6\x98\x9a\xca\x92\x4d\x0a\x80\xdb\x2d\x45\xc7\xec\x4b\x97\x00"
+	"\x2f\xe9\x42\x6c\x29\xdc\x55\x0e\x0b\x53\x12\x9b\x2b\xad\x2c\xe9"
+	"\x80\xe6\xc5\x43\xc2\x1d\x5e\xbb\x65\x21\x50\xb6\x37\xb0\x03\x8e"
+	"\xb8",
+	.key_len = 65,
+	.m =
+	"\x8f\x43\x43\x46\x64\x8f\x6b\x96\xdf\x89\xdd\xa9\x01\xc5\x17\x6b"
+	"\x10\xa6\xd8\x39\x61\xdd\x3c\x1a\xc8\x8b\x59\xb2\xdc\x32\x7a\xa4",
+	.m_size = 32,
+	.c =
+	"\x08\x31\xfa\x74\x0d\x1d\x21\x5d\x09\xdc\x29\x63\xa8\x1a\xad\xfc"
+	"\xac\x44\xc3\xe8\x24\x11\x2d\xa4\x91\xdc\x02\x67\xdc\x0c\xd0\x82"
+	"\xbd\xff\xce\xee\x42\xc3\x97\xff\xf9\xa9\x81\xac\x4a\x50\xd0\x91"
+	"\x0a\x6e\x1b\xc4\xaf\xe1\x83\xc3\x4f\x2a\x65\x35\x23\xe3\x1d\xfa",
+	.c_size = 64,
+	.public_key_vec = true,
+	},
+};
+
 /*
  * EC-RDSA test vectors are generated by gost-engine.
  */
diff --git a/include/crypto/internal/ecc.h b/include/crypto/internal/ecc.h
index 68db975e0963..71483e5305e1 100644
--- a/include/crypto/internal/ecc.h
+++ b/include/crypto/internal/ecc.h
@@ -306,4 +306,5 @@ void ecc_point_mult_shamir(const struct ecc_point *result,
 			   const struct ecc_curve *curve);
 
 extern struct crypto_template ecdsa_x962_tmpl;
+extern struct crypto_template ecdsa_p1363_tmpl;
 #endif
-- 
2.43.0


