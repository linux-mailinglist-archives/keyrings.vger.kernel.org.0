Return-Path: <keyrings+bounces-1198-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9588C4AFE
	for <lists+keyrings@lfdr.de>; Tue, 14 May 2024 03:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B4CE1F22B69
	for <lists+keyrings@lfdr.de>; Tue, 14 May 2024 01:44:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D1AE1869;
	Tue, 14 May 2024 01:44:02 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC31D17F7;
	Tue, 14 May 2024 01:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715651042; cv=none; b=OWNKt7R3rDqvHtnpUnf++Am0Zd/3zua2TWuDFNWgieA416IYs0osNLQJInVCCtqd2qmtkMXe2LrsqeQd6uNWGj3kXVu9kRDqLo/xtN/H9pfGbWx4k9ZGdJAjeLZy8uIflD5lfmo7CqvkNcPBIEQkkYakC9EBwMGikrWjvgC5GOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715651042; c=relaxed/simple;
	bh=CUweIuQ1rzDmMP6JnYIvt1GcMSb/adaEqcvAoAgcPck=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VZr471kEuWTtk58NtTxbOX4tXg1CF1sPSUv9ysQMgz/jZ8PvS5PSgs39qlxo/wmSZ2nvosNZurkqeSrpwOnkaDwSQnWH4q5jvEJ1ry9LJheibK6kWnfhNFvBmX1JwtrcsFAmiEhOa4UALqbvcdo4OYm8Oc4uxLF8+PwmYUVc56I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4VdfHh71gGz1xrV6;
	Tue, 14 May 2024 09:42:40 +0800 (CST)
Received: from kwepemm600010.china.huawei.com (unknown [7.193.23.86])
	by mail.maildlp.com (Postfix) with ESMTPS id 43B311A016C;
	Tue, 14 May 2024 09:43:51 +0800 (CST)
Received: from localhost.localdomain (10.175.104.170) by
 kwepemm600010.china.huawei.com (7.193.23.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 09:43:50 +0800
From: Huaxin Lu <luhuaxin1@huawei.com>
To: David Howells <dhowells@redhat.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
	<keyrings@vger.kernel.org>, <linux-crypto@vger.kernel.org>
CC: <xiujianfeng@huawei.com>, <wangweiyang2@huawei.com>,
	<yiyang13@huawei.com>, <zhujianwei7@huawei.com>, <shenyining@huawei.com>,
	<luhuaxin1@huawei.com>
Subject: [PATCH] Move SM2 digest calculation to signature verification
Date: Tue, 14 May 2024 07:07:18 +0800
Message-ID: <20240513230718.447895-1-luhuaxin1@huawei.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600010.china.huawei.com (7.193.23.86)

In the commit of e5221fa6a355 ("KEYS: asymmetric: Move sm2 code into
x509_public_key"), the SM2 digest hashing is moved to the process of
certificate loading. It cause the SM2 certificate chain validation
failure. For example, when importing a SM2 IMA certificate (x509_ima.der)
verified by the trusted kering. The import fails due to the wrong Z value
calculating. Because he Z value should be calculated from the public key
of the signing certificate, not from the public key of the certificate
itself (reference: datatracker.ietf.org/doc/html/draft-shen-sm2-ecdsa-02).

This commit partially revert the previous commit. Restore SM2 digest value
calculating into the signature verification process, and use the right
information to calculate Z value and SM2 digest.

Fixes: e5221fa6a355 ("KEYS: asymmetric: Move sm2 code into x509_public_key")
Signed-off-by: Huaxin Lu <luhuaxin1@huawei.com>
---
 crypto/asymmetric_keys/public_key.c      | 57 ++++++++++++++++++++++++
 crypto/asymmetric_keys/x509_public_key.c | 20 +++------
 include/crypto/public_key.h              |  2 +
 3 files changed, 64 insertions(+), 15 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index e314fd57e..647a03e00 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -9,8 +9,11 @@
 
 #define pr_fmt(fmt) "PKEY: "fmt
 #include <crypto/akcipher.h>
+#include <crypto/hash.h>
 #include <crypto/public_key.h>
 #include <crypto/sig.h>
+#include <crypto/sm2.h>
+#include <crypto/sm3.h>
 #include <keys/asymmetric-subtype.h>
 #include <linux/asn1.h>
 #include <linux/err.h>
@@ -376,6 +379,54 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 	return ret;
 }
 
+#if IS_REACHABLE(CONFIG_CRYPTO_SM2)
+static int cert_sig_digest_update(const struct public_key_signature *sig,
+				  void *pkey, size_t pkey_len)
+{
+	struct crypto_shash *tfm;
+	struct shash_desc *desc;
+	size_t desc_size;
+	unsigned char dgst[SM3_DIGEST_SIZE];
+	int ret;
+
+	BUG_ON(!sig->data);
+
+	/* SM2 signatures always use the SM3 hash algorithm */
+	if (!sig->hash_algo || strcmp(sig->hash_algo, "sm3") != 0)
+		return -EINVAL;
+
+	tfm = crypto_alloc_shash(sig->hash_algo, 0, 0);
+	if (IS_ERR(tfm))
+		return PTR_ERR(tfm);
+
+	desc_size = crypto_shash_descsize(tfm) + sizeof(*desc);
+	desc = kzalloc(desc_size, GFP_KERNEL);
+	if (!desc) {
+		crypto_free_shash(tfm);
+		return -ENOMEM;
+	}
+
+	desc->tfm = tfm;
+
+	ret = crypto_shash_init(desc) ?:
+	      sm2_compute_z_digest(desc, pkey, pkey_len, dgst) ?:
+	      crypto_shash_init(desc) ?:
+	      crypto_shash_update(desc, dgst, SM3_DIGEST_SIZE) ?:
+	      crypto_shash_finup(desc, sig->data, sig->data_size, sig->digest);
+
+	kfree(desc);
+	crypto_free_shash(tfm);
+	return ret;
+}
+#else
+static inline int cert_sig_digest_update(
+	const struct public_key_signature *sig,
+	void *pkey, size_t pkey_len)
+{
+	return -ENOTSUPP;
+}
+#endif /* ! IS_REACHABLE(CONFIG_CRYPTO_SM2) */
+
 /*
  * Verify a signature using a public key.
  */
@@ -439,6 +490,12 @@ int public_key_verify_signature(const struct public_key *pkey,
 	if (ret)
 		goto error_free_key;
 
+	if (strcmp(pkey->pkey_algo, "sm2") == 0 && sig->data_size) {
+		ret = cert_sig_digest_update(sig, key, pkey->keylen);
+		if (ret)
+			goto error_free_key;
+	}
+
 	ret = crypto_sig_verify(tfm, sig->s, sig->s_size,
 				sig->digest, sig->digest_size);
 
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 6a4f00be2..54738af7d 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -32,6 +32,9 @@ int x509_get_sig_params(struct x509_certificate *cert)
 
 	pr_devel("==>%s()\n", __func__);
 
+	sig->data = cert->tbs;
+	sig->data_size = cert->tbs_size;
+
 	sig->s = kmemdup(cert->raw_sig, cert->raw_sig_size, GFP_KERNEL);
 	if (!sig->s)
 		return -ENOMEM;
@@ -64,21 +67,8 @@ int x509_get_sig_params(struct x509_certificate *cert)
 
 	desc->tfm = tfm;
 
-	if (strcmp(cert->pub->pkey_algo, "sm2") == 0) {
-		ret = strcmp(sig->hash_algo, "sm3") != 0 ? -EINVAL :
-		      crypto_shash_init(desc) ?:
-		      sm2_compute_z_digest(desc, cert->pub->key,
-					   cert->pub->keylen, sig->digest) ?:
-		      crypto_shash_init(desc) ?:
-		      crypto_shash_update(desc, sig->digest,
-					  sig->digest_size) ?:
-		      crypto_shash_finup(desc, cert->tbs, cert->tbs_size,
-					 sig->digest);
-	} else {
-		ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
-					  sig->digest);
-	}
-
+	ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
+				  sig->digest);
 	if (ret < 0)
 		goto error_2;
 
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index b7f308977..fce68803b 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -49,6 +49,8 @@ struct public_key_signature {
 	const char *pkey_algo;
 	const char *hash_algo;
 	const char *encoding;
+	const void *data;
+	unsigned int data_size;
 };
 
 extern void public_key_signature_free(struct public_key_signature *sig);
-- 
2.33.0


