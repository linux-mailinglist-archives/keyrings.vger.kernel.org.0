Return-Path: <keyrings+bounces-2871-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C13BBAEDF03
	for <lists+keyrings@lfdr.de>; Mon, 30 Jun 2025 15:27:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0790A188C535
	for <lists+keyrings@lfdr.de>; Mon, 30 Jun 2025 13:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CC8528B3F3;
	Mon, 30 Jun 2025 13:27:38 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1750B25C713;
	Mon, 30 Jun 2025 13:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290058; cv=none; b=H2gFn1/btFALwtUvUtcNp2tad97cXycMa1X4qGHQX3MQhy/tY9oWtTMPtjg7i1BBfBZMQm7Dge3ZdgNfQwWDXnp3/evZ7j0f/hCZ9KZIGsyE7PEZ9EvdZZXSxhmhq+h5shynfNx86NX0eSnHwAh1WqdNjjcFiQE9RbuK0P86Y8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290058; c=relaxed/simple;
	bh=rjc6QP2VMjA4I0BeMbJAbGURWYO4/OAh6XgZxfiSIDc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EjIpVOBSd+VN7NaZHAjfredLUZUWi5GR8lV1+o+UFPhWd05dJeeaRRzqjvA/5VmjOS0KaSUGNh4XK+EPT1hqIwuaHGU0QF7ylWv7vmNsjNzLxxzbBSDedUoQSTSva1R+Nlf6pUgYgakmggKSa9yNG7OL7wg7riSED/FQZ3X/HSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bW6My0vcWz1R8CD;
	Mon, 30 Jun 2025 21:25:02 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
	by mail.maildlp.com (Postfix) with ESMTPS id 4ED7E1A0171;
	Mon, 30 Jun 2025 21:27:32 +0800 (CST)
Received: from huawei.com (10.67.174.33) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Jun
 2025 21:27:31 +0800
From: Gu Bowen <gubowen5@huawei.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, David Howells
	<dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Lukas Wunner
	<lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, "David S . Miller"
	<davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Biggers <ebiggers@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, Tianjia Zhang
	<tianjia.zhang@linux.alibaba.com>, Dan Carpenter <dan.carpenter@linaro.org>
CC: <keyrings@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Lu Jialin <lujialin4@huawei.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>, Gu Bowen <gubowen5@huawei.com>
Subject: [PATCH RFC 3/4] crypto/sm2: Rework sm2 alg with sig_alg backend
Date: Mon, 30 Jun 2025 21:39:33 +0800
Message-ID: <20250630133934.766646-4-gubowen5@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250630133934.766646-1-gubowen5@huawei.com>
References: <20250630133934.766646-1-gubowen5@huawei.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemh100007.china.huawei.com (7.202.181.92)

Based on preivous sm2 implementations ea7ecb66440b("crypto: sm2 -
introduce OSCCA SM2 asymmetric cipher algorithm"), rework sm2 alg with
sig_alg backend.

Signed-off-by: Gu Bowen <gubowen5@huawei.com>
---
 crypto/Kconfig           |  18 ++
 crypto/Makefile          |   8 +
 crypto/sm2.c             | 492 +++++++++++++++++++++++++++++++++++++++
 crypto/sm2signature.asn1 |   4 +
 crypto/testmgr.c         |   6 +
 crypto/testmgr.h         |  57 +++++
 include/crypto/sm2.h     |  31 +++
 7 files changed, 616 insertions(+)
 create mode 100644 crypto/sm2.c
 create mode 100644 crypto/sm2signature.asn1
 create mode 100644 include/crypto/sm2.h

diff --git a/crypto/Kconfig b/crypto/Kconfig
index e1cfd0d4cc8f..7bd6f025d29d 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -344,6 +344,24 @@ config CRYPTO_ECRDSA
 	  One of the Russian cryptographic standard algorithms (called GOST
 	  algorithms). Only signature verification is implemented.
 
+config CRYPTO_SM2
+        tristate "SM2 algorithm"
+        select CRYPTO_SM3
+        select CRYPTO_SIG
+        select CRYPTO_MANAGER
+        select MPILIB
+        select ASN1
+        help
+          Generic implementation of the SM2 public key algorithm. It was
+          published by State Encryption Management Bureau, China.
+          as specified by OSCCA GM/T 0003.1-2012 -- 0003.5-2012.
+
+          References:
+          https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02
+          http://www.oscca.gov.cn/sca/xxgk/2010-12/17/content_1002386.shtml
+          http://www.gmbz.org.cn/main/bzlb.html
+
+
 config CRYPTO_CURVE25519
 	tristate "Curve25519"
 	select CRYPTO_KPP
diff --git a/crypto/Makefile b/crypto/Makefile
index 017df3a2e4bb..e36953356f68 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -52,6 +52,14 @@ rsa_generic-y += rsa-pkcs1pad.o
 rsa_generic-y += rsassa-pkcs1.o
 obj-$(CONFIG_CRYPTO_RSA) += rsa_generic.o
 
+$(obj)/sm2signature.asn1.o: $(obj)/sm2signature.asn1.c $(obj)/sm2signature.asn1.h
+$(obj)/sm2.o: $(obj)/sm2signature.asn1.h
+
+sm2_generic-y += sm2signature.asn1.o
+sm2_generic-y += sm2.o
+
+obj-$(CONFIG_CRYPTO_SM2) += sm2_generic.o
+
 $(obj)/ecdsasignature.asn1.o: $(obj)/ecdsasignature.asn1.c $(obj)/ecdsasignature.asn1.h
 $(obj)/ecdsa-x962.o: $(obj)/ecdsasignature.asn1.h
 ecdsa_generic-y += ecdsa.o
diff --git a/crypto/sm2.c b/crypto/sm2.c
new file mode 100644
index 000000000000..31e10fcee13c
--- /dev/null
+++ b/crypto/sm2.c
@@ -0,0 +1,492 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * SM2 asymmetric public-key algorithm
+ * as specified by OSCCA GM/T 0003.1-2012 -- 0003.5-2012 SM2 and
+ * described at https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02
+ *
+ * Copyright (c) 2020, Alibaba Group.
+ * Authors: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
+ *
+ * Copyright (c) 2025, Huawei Tech. Co., Ltd.
+ * Authors: Gu Bowen <gubowen5@huawei.com>
+ */
+
+#include <linux/module.h>
+#include <linux/mpi.h>
+#include <crypto/hash.h>
+#include <crypto/sm3_base.h>
+#include <crypto/rng.h>
+#include <crypto/sm2.h>
+#include <crypto/sig.h>
+#include <crypto/internal/sig.h>
+#include "sm2signature.asn1.h"
+
+/* The default user id as specified in GM/T 0009-2012 */
+#define SM2_DEFAULT_USERID "1234567812345678"
+#define SM2_DEFAULT_USERID_LEN 16
+
+#define MPI_NBYTES(m)   ((mpi_get_nbits(m) + 7) / 8)
+
+struct ecc_domain_parms {
+	const char *desc;           /* Description of the curve.  */
+	unsigned int nbits;         /* Number of bits.  */
+	unsigned int fips:1; /* True if this is a FIPS140-2 approved curve */
+
+	/* The model describing this curve.  This is mainly used to select
+	 * the group equation.
+	 */
+	enum gcry_mpi_ec_models model;
+
+	/* The actual ECC dialect used.  This is used for curve specific
+	 * optimizations and to select encodings etc.
+	 */
+	enum ecc_dialects dialect;
+
+	const char *p;              /* The prime defining the field.  */
+	const char *a, *b;          /* The coefficients.  For Twisted Edwards
+				     * Curves b is used for d.  For Montgomery
+				     * Curves (a,b) has ((A-2)/4,B^-1).
+				     */
+	const char *n;              /* The order of the base point.  */
+	const char *g_x, *g_y;      /* Base point.  */
+	unsigned int h;             /* Cofactor.  */
+};
+
+static const struct ecc_domain_parms sm2_ecp = {
+	.desc = "sm2p256v1",
+	.nbits = 256,
+	.fips = 0,
+	.model = MPI_EC_WEIERSTRASS,
+	.dialect = ECC_DIALECT_STANDARD,
+	.p   = "0xfffffffeffffffffffffffffffffffffffffffff00000000ffffffffffffffff",
+	.a   = "0xfffffffeffffffffffffffffffffffffffffffff00000000fffffffffffffffc",
+	.b   = "0x28e9fa9e9d9f5e344d5a9e4bcf6509a7f39789f515ab8f92ddbcbd414d940e93",
+	.n   = "0xfffffffeffffffffffffffffffffffff7203df6b21c6052b53bbf40939d54123",
+	.g_x = "0x32c4ae2c1f1981195f9904466a39c9948fe30bbff2660be1715a4589334c74c7",
+	.g_y = "0xbc3736a2f4f6779c59bdcee36b692153d0a9877cc62a474002df32e52139f0a0",
+	.h = 1
+};
+
+static int __sm2_set_pub_key(struct mpi_ec_ctx *ec,
+			     const void *key, unsigned int keylen);
+
+static int sm2_ec_ctx_init(struct mpi_ec_ctx *ec)
+{
+	const struct ecc_domain_parms *ecp = &sm2_ecp;
+	MPI p, a, b;
+	MPI x, y;
+	int rc = -EINVAL;
+
+	p = mpi_scanval(ecp->p);
+	a = mpi_scanval(ecp->a);
+	b = mpi_scanval(ecp->b);
+	if (!p || !a || !b)
+		goto free_p;
+
+	x = mpi_scanval(ecp->g_x);
+	y = mpi_scanval(ecp->g_y);
+	if (!x || !y)
+		goto free;
+
+	rc = -ENOMEM;
+
+	ec->Q = mpi_point_new(0);
+	if (!ec->Q)
+		goto free;
+
+	/* mpi_ec_setup_elliptic_curve */
+	ec->G = mpi_point_new(0);
+	if (!ec->G) {
+		mpi_point_release(ec->Q);
+		goto free;
+	}
+
+	mpi_set(ec->G->x, x);
+	mpi_set(ec->G->y, y);
+	mpi_set_ui(ec->G->z, 1);
+
+	rc = -EINVAL;
+	ec->n = mpi_scanval(ecp->n);
+	if (!ec->n) {
+		mpi_point_release(ec->Q);
+		mpi_point_release(ec->G);
+		goto free;
+	}
+
+	ec->h = ecp->h;
+	ec->name = ecp->desc;
+	mpi_ec_init(ec, ecp->model, ecp->dialect, 0, p, a, b);
+
+	rc = 0;
+
+free:
+	mpi_free(x);
+	mpi_free(y);
+free_p:
+	mpi_free(p);
+	mpi_free(a);
+	mpi_free(b);
+
+	return rc;
+}
+
+static void sm2_ec_ctx_deinit(struct mpi_ec_ctx *ec)
+{
+	mpi_ec_deinit(ec);
+
+	memset(ec, 0, sizeof(*ec));
+}
+
+/* RESULT must have been initialized and is set on success to the
+ * point given by VALUE.
+ */
+static int sm2_ecc_os2ec(MPI_POINT result, MPI value)
+{
+	int rc;
+	size_t n;
+	unsigned char *buf;
+	MPI x, y;
+
+	n = MPI_NBYTES(value);
+	buf = kmalloc(n, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	rc = mpi_print(GCRYMPI_FMT_USG, buf, n, &n, value);
+	if (rc)
+		goto err_freebuf;
+
+	rc = -EINVAL;
+	if (n < 1 || ((n - 1) % 2))
+		goto err_freebuf;
+	/* No support for point compression */
+	if (*buf != 0x4)
+		goto err_freebuf;
+
+	rc = -ENOMEM;
+	n = (n - 1) / 2;
+	x = mpi_read_raw_data(buf + 1, n);
+	if (!x)
+		goto err_freebuf;
+	y = mpi_read_raw_data(buf + 1 + n, n);
+	if (!y)
+		goto err_freex;
+
+	mpi_normalize(x);
+	mpi_normalize(y);
+	mpi_set(result->x, x);
+	mpi_set(result->y, y);
+	mpi_set_ui(result->z, 1);
+
+	rc = 0;
+
+	mpi_free(y);
+err_freex:
+	mpi_free(x);
+err_freebuf:
+	kfree(buf);
+	return rc;
+}
+
+struct sm2_signature_ctx {
+	MPI sig_r;
+	MPI sig_s;
+};
+
+int sm2_get_signature_r(void *context, size_t hdrlen, unsigned char tag,
+				const void *value, size_t vlen)
+{
+	struct sm2_signature_ctx *sig = context;
+
+	if (!value || !vlen)
+		return -EINVAL;
+
+	sig->sig_r = mpi_read_raw_data(value, vlen);
+	if (!sig->sig_r)
+		return -ENOMEM;
+
+	return 0;
+}
+
+int sm2_get_signature_s(void *context, size_t hdrlen, unsigned char tag,
+				const void *value, size_t vlen)
+{
+	struct sm2_signature_ctx *sig = context;
+
+	if (!value || !vlen)
+		return -EINVAL;
+
+	sig->sig_s = mpi_read_raw_data(value, vlen);
+	if (!sig->sig_s)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int sm2_z_digest_update(struct shash_desc *desc,
+			MPI m, unsigned int pbytes)
+{
+	static const unsigned char zero[32];
+	unsigned char *in;
+	unsigned int inlen;
+	int err;
+
+	in = mpi_get_buffer(m, &inlen, NULL);
+	if (!in)
+		return -EINVAL;
+
+	if (inlen < pbytes) {
+		/* padding with zero */
+		err = crypto_shash_update(desc, zero, pbytes - inlen) ?:
+		      crypto_shash_update(desc, in, inlen);
+	} else if (inlen > pbytes) {
+		/* skip the starting zero */
+		err = crypto_shash_update(desc, in + inlen - pbytes, pbytes);
+	} else {
+		err = crypto_shash_update(desc, in, inlen);
+	}
+
+	kfree(in);
+	return err;
+}
+
+static int sm2_z_digest_update_point(struct shash_desc *desc,
+				     MPI_POINT point, struct mpi_ec_ctx *ec,
+				     unsigned int pbytes)
+{
+	MPI x, y;
+	int ret = -EINVAL;
+
+	x = mpi_new(0);
+	y = mpi_new(0);
+
+	ret = mpi_ec_get_affine(x, y, point, ec) ? -EINVAL :
+				sm2_z_digest_update(desc, x, pbytes) ?:
+				sm2_z_digest_update(desc, y, pbytes);
+
+	mpi_free(x);
+	mpi_free(y);
+	return ret;
+}
+
+int sm2_compute_z_digest(struct shash_desc *desc,
+			 const void *key, unsigned int keylen, void *dgst)
+{
+	struct mpi_ec_ctx *ec;
+	unsigned int bits_len;
+	unsigned int pbytes;
+	u8 entl[2];
+	int err;
+
+	ec = kmalloc(sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	err = sm2_ec_ctx_init(ec);
+	if (err)
+		goto out_free_ec;
+
+	err = __sm2_set_pub_key(ec, key, keylen);
+	if (err)
+		goto out_deinit_ec;
+
+	bits_len = SM2_DEFAULT_USERID_LEN * 8;
+	entl[0] = bits_len >> 8;
+	entl[1] = bits_len & 0xff;
+
+	pbytes = MPI_NBYTES(ec->p);
+
+	/* ZA = H256(ENTLA | IDA | a | b | xG | yG | xA | yA) */
+	err = crypto_shash_init(desc);
+	if (err)
+		goto out_deinit_ec;
+
+	err = crypto_shash_update(desc, entl, 2);
+	if (err)
+		goto out_deinit_ec;
+
+	err = crypto_shash_update(desc, SM2_DEFAULT_USERID,
+			SM2_DEFAULT_USERID_LEN);
+	if (err)
+		goto out_deinit_ec;
+
+	err = sm2_z_digest_update(desc, ec->a, pbytes) ?:
+		sm2_z_digest_update(desc, ec->b, pbytes) ?:
+		sm2_z_digest_update_point(desc, ec->G, ec, pbytes) ?:
+		sm2_z_digest_update_point(desc, ec->Q, ec, pbytes);
+	if (err)
+		goto out_deinit_ec;
+
+	err = crypto_shash_final(desc, dgst);
+
+out_deinit_ec:
+	sm2_ec_ctx_deinit(ec);
+out_free_ec:
+	kfree(ec);
+	return err;
+}
+EXPORT_SYMBOL_GPL(sm2_compute_z_digest);
+
+static int _sm2_verify(struct mpi_ec_ctx *ec, MPI hash, MPI sig_r, MPI sig_s)
+{
+	int rc = -EINVAL;
+	struct gcry_mpi_point sG, tP;
+	MPI t = NULL;
+	MPI x1 = NULL, y1 = NULL;
+
+	mpi_point_init(&sG);
+	mpi_point_init(&tP);
+	x1 = mpi_new(0);
+	y1 = mpi_new(0);
+	t = mpi_new(0);
+
+	/* r, s in [1, n-1] */
+	if (mpi_cmp_ui(sig_r, 1) < 0 || mpi_cmp(sig_r, ec->n) > 0 ||
+		mpi_cmp_ui(sig_s, 1) < 0 || mpi_cmp(sig_s, ec->n) > 0) {
+		goto leave;
+	}
+
+	/* t = (r + s) % n, t == 0 */
+	mpi_addm(t, sig_r, sig_s, ec->n);
+	if (mpi_cmp_ui(t, 0) == 0)
+		goto leave;
+
+	/* sG + tP = (x1, y1) */
+	rc = -EBADMSG;
+	mpi_ec_mul_point(&sG, sig_s, ec->G, ec);
+	mpi_ec_mul_point(&tP, t, ec->Q, ec);
+	mpi_ec_add_points(&sG, &sG, &tP, ec);
+	if (mpi_ec_get_affine(x1, y1, &sG, ec))
+		goto leave;
+
+	/* R = (e + x1) % n */
+	mpi_addm(t, hash, x1, ec->n);
+
+	/* check R == r */
+	rc = -EKEYREJECTED;
+	if (mpi_cmp(t, sig_r))
+		goto leave;
+
+	rc = 0;
+
+leave:
+	mpi_point_free_parts(&sG);
+	mpi_point_free_parts(&tP);
+	mpi_free(x1);
+	mpi_free(y1);
+	mpi_free(t);
+
+	return rc;
+}
+
+static int sm2_verify(struct crypto_sig *tfm,
+		      const void *src, unsigned int slen,
+		      const void *digest, unsigned int dlen)
+{
+	struct mpi_ec_ctx *ec = crypto_sig_ctx(tfm);
+	struct sm2_signature_ctx sig;
+	MPI hash;
+	int ret;
+
+	if (unlikely(!ec->Q))
+		return -EINVAL;
+
+	sig.sig_r = NULL;
+	sig.sig_s = NULL;
+	ret = asn1_ber_decoder(&sm2signature_decoder, &sig, src, slen);
+	if (ret)
+		goto error;
+
+	ret = -ENOMEM;
+	hash = mpi_read_raw_data(digest, dlen);
+	if (!hash)
+		goto error;
+
+	ret = _sm2_verify(ec, hash, sig.sig_r, sig.sig_s);
+
+	mpi_free(hash);
+error:
+	mpi_free(sig.sig_r);
+	mpi_free(sig.sig_s);
+	return ret;
+}
+
+static int sm2_set_pub_key(struct crypto_sig *tfm,
+			   const void *key, unsigned int keylen)
+{
+	struct mpi_ec_ctx *ec = crypto_sig_ctx(tfm);
+
+	return __sm2_set_pub_key(ec, key, keylen);
+}
+
+static int __sm2_set_pub_key(struct mpi_ec_ctx *ec,
+			     const void *key, unsigned int keylen)
+{
+	MPI a;
+	int rc;
+
+	/* include the uncompressed flag '0x04' */
+	a = mpi_read_raw_data(key, keylen);
+	if (!a)
+		return -ENOMEM;
+
+	mpi_normalize(a);
+	rc = sm2_ecc_os2ec(ec->Q, a);
+	mpi_free(a);
+
+	return rc;
+}
+
+static unsigned int sm2_max_size(struct crypto_sig *tfm)
+{
+	/* Unlimited max size */
+	return PAGE_SIZE;
+}
+
+static int sm2_init_tfm(struct crypto_sig *tfm)
+{
+	struct mpi_ec_ctx *ec = crypto_sig_ctx(tfm);
+
+	return sm2_ec_ctx_init(ec);
+}
+
+static void sm2_exit_tfm(struct crypto_sig *tfm)
+{
+	struct mpi_ec_ctx *ec = crypto_sig_ctx(tfm);
+
+	sm2_ec_ctx_deinit(ec);
+}
+
+static struct sig_alg sm2 = {
+	.verify = sm2_verify,
+	.set_pub_key = sm2_set_pub_key,
+	.max_size = sm2_max_size,
+	.init = sm2_init_tfm,
+	.exit = sm2_exit_tfm,
+	.base = {
+		.cra_name = "sm2",
+		.cra_driver_name = "sm2-generic",
+		.cra_priority = 100,
+		.cra_module = THIS_MODULE,
+		.cra_ctxsize = sizeof(struct mpi_ec_ctx),
+	},
+};
+
+static int __init sm2_init(void)
+{
+	return crypto_register_sig(&sm2);
+}
+
+static void __exit sm2_exit(void)
+{
+	crypto_unregister_sig(&sm2);
+}
+
+subsys_initcall(sm2_init);
+module_exit(sm2_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Tianjia Zhang <tianjia.zhang@linux.alibaba.com>");
+MODULE_AUTHOR("Gu Bowen <gubowen5@huawei.com>");
+MODULE_DESCRIPTION("SM2 generic algorithm");
+MODULE_ALIAS_CRYPTO("sm2-generic");
diff --git a/crypto/sm2signature.asn1 b/crypto/sm2signature.asn1
new file mode 100644
index 000000000000..ab8c0b754d21
--- /dev/null
+++ b/crypto/sm2signature.asn1
@@ -0,0 +1,4 @@
+Sm2Signature ::= SEQUENCE {
+	sig_r	INTEGER ({ sm2_get_signature_r }),
+	sig_s	INTEGER ({ sm2_get_signature_s })
+}
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 32f753d6c430..9fde36527711 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5505,6 +5505,12 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(sha512_tv_template)
 		}
+	}, {
+		.alg = "sm2",
+		.test = alg_test_sig,
+		.suite = {
+			.sig = __VECS(sm2_tv_template)
+		}
 	}, {
 		.alg = "sm3",
 		.test = alg_test_hash,
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 32d099ac9e73..68928b4fbd1c 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -6133,6 +6133,63 @@ static const struct hash_testvec hmac_streebog512_tv_template[] = {
 	},
 };
 
+/*
+ * SM2 test vectors.
+ */
+static const struct sig_testvec sm2_tv_template[] = {
+	{ /* Generated from openssl */
+	.key =
+	"\x04"
+	"\x8e\xa0\x33\x69\x91\x7e\x3d\xec\xad\x8e\xf0\x45\x5e\x13\x3e\x68"
+	"\x5b\x8c\xab\x5c\xc6\xc8\x50\xdf\x91\x00\xe0\x24\x73\x4d\x31\xf2"
+	"\x2e\xc0\xd5\x6b\xee\xda\x98\x93\xec\xd8\x36\xaa\xb9\xcf\x63\x82"
+	"\xef\xa7\x1a\x03\xed\x16\xba\x74\xb8\x8b\xf9\xe5\x70\x39\xa4\x70",
+	.key_len = 65,
+	.param_len = 0,
+	.c =
+	"\x30\x45"
+	"\x02\x20"
+	"\x70\xab\xb6\x7d\xd6\x54\x80\x64\x42\x7e\x2d\x05\x08\x36\xc9\x96"
+	"\x25\xc2\xbb\xff\x08\xe5\x43\x15\x5e\xf3\x06\xd9\x2b\x2f\x0a\x9f"
+	"\x02\x21"
+	"\x00"
+	"\xbf\x21\x5f\x7e\x5d\x3f\x1a\x4d\x8f\x84\xc2\xe9\xa6\x4c\xa4\x18"
+	"\xb2\xb8\x46\xf4\x32\x96\xfa\x57\xc6\x29\xd4\x89\xae\xcc\xda\xdb",
+	.c_size = 71,
+	.algo = OID_SM2_with_SM3,
+	.m =
+	"\x47\xa7\xbf\xd3\xda\xc4\x79\xee\xda\x8b\x4f\xe8\x40\x94\xd4\x32"
+	"\x8f\xf1\xcd\x68\x4d\xbd\x9b\x1d\xe0\xd8\x9a\x5d\xad\x85\x47\x5c",
+	.m_size = 32,
+	.public_key_vec = true,
+	},
+	{ /* From libgcrypt */
+	.key =
+	"\x04"
+	"\x87\x59\x38\x9a\x34\xaa\xad\x07\xec\xf4\xe0\xc8\xc2\x65\x0a\x44"
+	"\x59\xc8\xd9\x26\xee\x23\x78\x32\x4e\x02\x61\xc5\x25\x38\xcb\x47"
+	"\x75\x28\x10\x6b\x1e\x0b\x7c\x8d\xd5\xff\x29\xa9\xc8\x6a\x89\x06"
+	"\x56\x56\xeb\x33\x15\x4b\xc0\x55\x60\x91\xef\x8a\xc9\xd1\x7d\x78",
+	.key_len = 65,
+	.param_len = 0,
+	.c =
+	"\x30\x44"
+	"\x02\x20"
+	"\xd9\xec\xef\xe8\x5f\xee\x3c\x59\x57\x8e\x5b\xab\xb3\x02\xe1\x42"
+	"\x4b\x67\x2c\x0b\x26\xb6\x51\x2c\x3e\xfc\xc6\x49\xec\xfe\x89\xe5"
+	"\x02\x20"
+	"\x43\x45\xd0\xa5\xff\xe5\x13\x27\x26\xd0\xec\x37\xad\x24\x1e\x9a"
+	"\x71\x9a\xa4\x89\xb0\x7e\x0f\xc4\xbb\x2d\x50\xd0\xe5\x7f\x7a\x68",
+	.c_size = 70,
+	.algo = OID_SM2_with_SM3,
+	.m =
+	"\x11\x22\x33\x44\x55\x66\x77\x88\x99\xaa\xbb\xcc\xdd\xee\xff\x00"
+	"\x12\x34\x56\x78\x9a\xbc\xde\xf0\x12\x34\x56\x78\x9a\xbc\xde\xf0",
+	.m_size = 32,
+	.public_key_vec = true,
+	},
+};
+
 /* Example vectors below taken from
  * http://www.oscca.gov.cn/UpFile/20101222141857786.pdf
  *
diff --git a/include/crypto/sm2.h b/include/crypto/sm2.h
new file mode 100644
index 000000000000..a93c6fd395ff
--- /dev/null
+++ b/include/crypto/sm2.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * sm2.h - SM2 asymmetric public-key algorithm
+ * as specified by OSCCA GM/T 0003.1-2012 -- 0003.5-2012 SM2 and
+ * described at https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02
+ *
+ * Copyright (c) 2020, Alibaba Group.
+ * Written by Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
+ *
+ * Copyright (c) 2025, Huawei Tech. Co., Ltd.
+ * Authors: Gu Bowen <gubowen5@huawei.com>
+ */
+
+#ifndef _CRYPTO_SM2_H
+#define _CRYPTO_SM2_H
+
+struct shash_desc;
+
+#if IS_REACHABLE(CONFIG_CRYPTO_SM2)
+int sm2_compute_z_digest(struct shash_desc *desc,
+			 const void *key, unsigned int keylen, void *dgst);
+#else
+static inline int sm2_compute_z_digest(struct shash_desc *desc,
+				       const void *key, unsigned int keylen,
+				       void *dgst)
+{
+	return -EOPNOTSUPP;
+}
+#endif
+
+#endif /* _CRYPTO_SM2_H */
-- 
2.25.1


