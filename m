Return-Path: <keyrings+bounces-3777-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 45308D28E61
	for <lists+keyrings@lfdr.de>; Thu, 15 Jan 2026 22:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BC02B30D3322
	for <lists+keyrings@lfdr.de>; Thu, 15 Jan 2026 21:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B3625BF13;
	Thu, 15 Jan 2026 21:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EtDzXCrx"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1009B32D7EC
	for <keyrings@vger.kernel.org>; Thu, 15 Jan 2026 21:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768513923; cv=none; b=nGg+kpOaKeiDe8K/5P3GEIzj+J3zWSePRG5iQa8ZF4f/GKYSbzxjUDu2yKf3RqfrvR7ts1juSdkxBQYo4yIrlY1MRDkYBxOYgRoypXKwXC96pO274QXEHEPsK/ecxjRk1WNJrI6dxaUdQyhUHu/XokkNJ57vc9weKT4WNSBAxnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768513923; c=relaxed/simple;
	bh=EJcvw/4jAXLJ5HvQmdBhm1HwdS7fdhfrKHsisWbbK1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tJMfVRtaZkMrl4IhWfvNV7XNPpo2wrb/Dt73JiGnswbtmXCWiTg0ZZvFWArFrBTYp6R+nRYkoQCTQSLL6d5klhag44TFo+BCNdOVUzCcv6qB/dzxHJPkClIY1fNAKReWKjuINmy+3Ituslno0EcyAa5U0OsG0QCnN2uwiGpPJOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EtDzXCrx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768513913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iJwOhg5zxiP6Te00V/bTN4JKF7eqae3rQTIXsRM96Vg=;
	b=EtDzXCrx9xSlCdrUw8+MYFVk9SstU9IYEHgKfXPyWguuYeTiYvrJFCHHw1aqXCPr5QPd7g
	ahHQstJ5IZiSrXKQsLRLbnb4nJzUJEWX5G0dF10kVDS0dnwkNKHOdwBw5/YROHb+Zdjp0A
	fTH1ec4WK0lGFSetQiSg7x6uUwR/Few=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-471-zFvh6ETpOVecjOuCjxUHSg-1; Thu,
 15 Jan 2026 16:51:50 -0500
X-MC-Unique: zFvh6ETpOVecjOuCjxUHSg-1
X-Mimecast-MFC-AGG-ID: zFvh6ETpOVecjOuCjxUHSg_1768513907
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 62226195605F;
	Thu, 15 Jan 2026 21:51:47 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.4])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 423DA1800285;
	Thu, 15 Jan 2026 21:51:43 +0000 (UTC)
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
	Tadeusz Struk <tadeusz.struk@intel.com>,
	"David S. Miller" <davem@davemloft.net>
Subject: [PATCH v12 07/10] crypto: Add RSASSA-PSS support
Date: Thu, 15 Jan 2026 21:50:49 +0000
Message-ID: <20260115215100.312611-8-dhowells@redhat.com>
In-Reply-To: <20260115215100.312611-1-dhowells@redhat.com>
References: <20260115215100.312611-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Add support for RSASSA-PSS [RFC8017 sec 8.1] signature verification support
to the RSA driver in crypto/.  Note that signing support is not provided.

The verification function requires an info string formatted as a
space-separated list of key=value pairs.  The following parameters need to
be provided:

 (1) sighash=<algo>

     The hash algorithm to be used to digest the data.

 (2) pss_mask=<type>,...

     The mask generation function (MGF) and its parameters.

 (3) pss_salt=<len>

     The length of the salt used.

The only MGF currently supported is "mgf1".  This takes an additional
parameter indicating the mask-generating hash (which need not be the same
as the data hash).  E.g.:

     "sighash=sha256 pss_mask=mgf1,sha256 pss_salt=32"

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Tadeusz Struk <tadeusz.struk@intel.com>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: David S. Miller <davem@davemloft.net>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/Makefile               |   1 +
 crypto/rsa.c                  |   8 +
 crypto/rsassa-pss.c           | 384 ++++++++++++++++++++++++++++++++++
 include/crypto/hash.h         |   3 +
 include/crypto/internal/rsa.h |   2 +
 5 files changed, 398 insertions(+)
 create mode 100644 crypto/rsassa-pss.c

diff --git a/crypto/Makefile b/crypto/Makefile
index 267d5403045b..5c91440d1751 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -50,6 +50,7 @@ rsa_generic-y += rsa.o
 rsa_generic-y += rsa_helper.o
 rsa_generic-y += rsa-pkcs1pad.o
 rsa_generic-y += rsassa-pkcs1.o
+rsa_generic-y += rsassa-pss.o
 obj-$(CONFIG_CRYPTO_RSA) += rsa_generic.o
 
 $(obj)/ecdsasignature.asn1.o: $(obj)/ecdsasignature.asn1.c $(obj)/ecdsasignature.asn1.h
diff --git a/crypto/rsa.c b/crypto/rsa.c
index 6c7734083c98..189a09d54c16 100644
--- a/crypto/rsa.c
+++ b/crypto/rsa.c
@@ -10,6 +10,7 @@
 #include <linux/mpi.h>
 #include <crypto/internal/rsa.h>
 #include <crypto/internal/akcipher.h>
+#include <crypto/internal/sig.h>
 #include <crypto/akcipher.h>
 #include <crypto/algapi.h>
 
@@ -414,8 +415,14 @@ static int __init rsa_init(void)
 	if (err)
 		goto err_unregister_rsa_pkcs1pad;
 
+	err = crypto_register_sig(&rsassa_pss_alg);
+	if (err)
+		goto err_rsassa_pss;
+
 	return 0;
 
+err_rsassa_pss:
+	crypto_unregister_template(&rsassa_pkcs1_tmpl);
 err_unregister_rsa_pkcs1pad:
 	crypto_unregister_template(&rsa_pkcs1pad_tmpl);
 err_unregister_rsa:
@@ -425,6 +432,7 @@ static int __init rsa_init(void)
 
 static void __exit rsa_exit(void)
 {
+	crypto_unregister_sig(&rsassa_pss_alg);
 	crypto_unregister_template(&rsassa_pkcs1_tmpl);
 	crypto_unregister_template(&rsa_pkcs1pad_tmpl);
 	crypto_unregister_akcipher(&rsa);
diff --git a/crypto/rsassa-pss.c b/crypto/rsassa-pss.c
new file mode 100644
index 000000000000..c12ffa3813df
--- /dev/null
+++ b/crypto/rsassa-pss.c
@@ -0,0 +1,384 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * RSA Signature Scheme combined with EMSA-PSS encoding (RFC 8017 sec 8.2)
+ *
+ * https://www.rfc-editor.org/rfc/rfc8017#section-8.1
+ *
+ * Copyright (c) 2025 Red Hat
+ */
+
+#define pr_fmt(fmt) "RSAPSS: "fmt
+#include <linux/ctype.h>
+#include <linux/module.h>
+#include <linux/oid_registry.h>
+#include <linux/parser.h>
+#include <linux/scatterlist.h>
+#include <crypto/akcipher.h>
+#include <crypto/algapi.h>
+#include <crypto/hash.h>
+#include <crypto/sig.h>
+#include <crypto/internal/akcipher.h>
+#include <crypto/internal/rsa.h>
+#include <crypto/internal/sig.h>
+
+struct rsassa_pss_ctx {
+	struct crypto_akcipher *rsa;
+	unsigned int	key_size;
+	unsigned int	salt_len;
+	char		*pss_hash;
+	char		*mgf1_hash;
+};
+
+enum {
+	rsassa_pss_verify_hash_algo,
+	rsassa_pss_verify_pss_mask,
+	rsassa_pss_verify_pss_salt,
+};
+
+static const match_table_t rsassa_pss_verify_params = {
+	{ rsassa_pss_verify_hash_algo,	"sighash=%s" },
+	{ rsassa_pss_verify_pss_mask,	"pss_mask=%s" },
+	{ rsassa_pss_verify_pss_salt,	"pss_salt=%u" },
+	{}
+};
+
+/*
+ * Parse the signature parameters out of the info string.
+ */
+static int rsassa_pss_vinfo_parse(struct rsassa_pss_ctx *ctx,
+				  char *info)
+{
+	substring_t args[MAX_OPT_ARGS];
+	char *p;
+
+	ctx->pss_hash = NULL;
+	ctx->mgf1_hash = NULL;
+	ctx->salt_len = 0;
+
+	while ((p = strsep(&info, " \t"))) {
+		if (*p == '\0' || *p == ' ' || *p == '\t')
+			continue;
+
+		switch (match_token(p, rsassa_pss_verify_params, args)) {
+		case rsassa_pss_verify_hash_algo:
+			*args[0].to = 0;
+			ctx->pss_hash = args[0].from;
+			break;
+		case rsassa_pss_verify_pss_mask:
+			if (memcmp(args[0].from, "mgf1", 4) != 0)
+				return -ENOPKG;
+			if (args[0].from[4] != ',')
+				return -EINVAL;
+			args[0].from += 5;
+			if (args[0].from >= args[0].to)
+				return -EINVAL;
+			*args[0].to = 0;
+			ctx->mgf1_hash = args[0].from;
+			break;
+		case rsassa_pss_verify_pss_salt:
+			if (match_uint(&args[0], &ctx->salt_len) < 0)
+				return -EINVAL;
+			break;
+		default:
+			pr_debug("Unknown info param\n");
+			return -EINVAL; /* Ignoring it might be better. */
+		}
+	}
+
+	if (!ctx->pss_hash ||
+	    !ctx->mgf1_hash ||
+	    !ctx->salt_len)
+		return -EINVAL;
+	return 0;
+}
+
+/*
+ * Perform mask = MGF1(mgfSeed, masklen) - RFC8017 appendix B.2.1.
+ */
+static int MGF1(struct rsassa_pss_ctx *ctx,
+		const u8 *mgfSeed, unsigned int mgfSeed_len,
+		u8 *mask, unsigned int maskLen)
+{
+	unsigned int counter, count_to, hLen, T_len;
+	__be32 *C;
+	int err;
+	u8 *T, *t, *to_hash;
+
+	struct crypto_shash *hash_tfm __free(crypto_free_shash) =
+		crypto_alloc_shash(ctx->mgf1_hash, 0, 0);
+	if (IS_ERR(hash_tfm))
+		return PTR_ERR(hash_tfm);
+
+	hLen = crypto_shash_digestsize(hash_tfm);
+	count_to = DIV_ROUND_UP(maskLen, hLen);
+	T_len = hLen * count_to;
+
+	struct shash_desc *Hash __free(kfree) =
+		kmalloc(roundup(sizeof(struct shash_desc) +
+				crypto_shash_descsize(hash_tfm), 64) +
+			roundup(T_len, 64) + /* T */
+			roundup(mgfSeed_len + 4, 64), /* mgfSeed||C */
+			GFP_KERNEL);
+	if (!Hash)
+		return -ENOMEM;
+
+	Hash->tfm = hash_tfm;
+
+	/* 2: Let T be the empty octet string. */
+	T = (void *)Hash +
+		roundup(sizeof(struct shash_desc) +
+			crypto_shash_descsize(hash_tfm), 64);
+
+	/* 3: Generate the mask. */
+	to_hash = T + roundup(T_len, 64);
+	memcpy(to_hash, mgfSeed, mgfSeed_len);
+	C = (__be32 *)(to_hash + mgfSeed_len);
+
+	t = T;
+	for (counter = 0; counter < count_to; counter++) {
+		/* 3A: C = I2OSP(counter, 4). */
+		put_unaligned_be32(counter, C);
+
+		/* 3B: T = T || Hash(mgfSeed || C). */
+		err = crypto_shash_digest(Hash, to_hash, mgfSeed_len + 4, t);
+		if (err < 0)
+			return err;
+
+		t += hLen;
+	}
+
+	/* 4: Output T to mask */
+	memcpy(mask, T, maskLen);
+	return 0;
+}
+
+/*
+ * Perform EMSA-PSS-VERIFY(M, EM, emBits) - RFC8017 sec 9.1.2.
+ */
+static int emsa_pss_verify(struct rsassa_pss_ctx *ctx,
+			   const u8 *M, unsigned int M_len,
+			   const u8 *EM, unsigned int emLen)
+{
+	unsigned int emBits, hLen, sLen, DB_len;
+	const u8 *maskedDB, *H;
+	u8 *mHash, *dbMask, *DB, *salt, *Mprime, *Hprime;
+	int err, i;
+
+	emBits = 8 - fls(EM[0]);
+	emBits = emLen * 8 - emBits;
+
+	struct crypto_shash *hash_tfm __free(crypto_free_shash) =
+		crypto_alloc_shash(ctx->pss_hash, 0, 0);
+	if (IS_ERR(hash_tfm))
+		return PTR_ERR(hash_tfm);
+
+	hLen = crypto_shash_digestsize(hash_tfm);
+	sLen = ctx->salt_len;
+
+	if (sLen > 65536 ||
+	    emBits < 8 * (hLen + sLen) + 9)
+		return -EBADMSG;
+
+	DB_len = emLen - hLen - 1;
+
+	struct shash_desc *Hash __free(kfree) =
+		kmalloc(roundup(sizeof(struct shash_desc) +
+				crypto_shash_descsize(hash_tfm), 64) +
+			roundup(hLen, 64) + /* mHash */
+			roundup(DB_len, 64) + /* DB and dbMask */
+			roundup(8 + hLen + sLen, 64) + /* M' */
+			roundup(hLen, 64), /* H' */
+			GFP_KERNEL);
+	if (!Hash)
+		return -ENOMEM;
+
+	Hash->tfm = hash_tfm;
+
+	mHash = (void *)Hash +
+		roundup(sizeof(struct shash_desc) +
+			crypto_shash_descsize(hash_tfm), 64);
+	DB = dbMask = mHash + roundup(hLen, 64);
+	Mprime = dbMask + roundup(DB_len, 64);
+	Hprime = Mprime + roundup(8 + hLen + sLen, 64);
+
+	/* 1. Check len M against hash input limitation. */
+	/* The standard says ~2EiB for SHA1, so I think we can ignore this. */
+
+	/* 2. mHash = Hash(M).
+	 * In theory, we would do:
+	 *	err = crypto_shash_digest(Hash, M, M_len, mHash);
+	 * but the caller is assumed to already have done that for us.
+	 */
+	if (M_len != hLen)
+		return -EINVAL;
+	memcpy(mHash, M, hLen);
+
+	/* 3. Check emLen against hLen + sLen + 2. */
+	if (emLen < hLen + sLen + 2)
+		return -EBADMSG;
+
+	/* 4. Validate EM. */
+	if (EM[emLen - 1] != 0xbc)
+		return -EKEYREJECTED;
+
+	/* 5. Pick maskedDB and H. */
+	maskedDB = EM;
+	H = EM + DB_len;
+
+	/* 6. Check leftmost 8emLen-emBits bits of maskedDB are 0. */
+	/* Can only find emBits by counting the zeros on the Left. */
+
+	/* 7. Let dbMask = MGF(H, emLen - hLen - 1). */
+	err = MGF1(ctx, H, hLen, dbMask, DB_len);
+	if (err < 0)
+		return err;
+
+	/* 8. Let DB = maskedDB XOR dbMask. */
+	for (i = 0; i < DB_len; i++)
+		DB[i] = maskedDB[i] ^ dbMask[i];
+
+	/* 9. Set leftmost bits in DB to zero. */
+	int z = 8 * emLen - emBits;
+
+	if (z > 0) {
+		if (z >= 8) {
+			DB[0] = 0;
+		} else {
+			z = 8 - z;
+			DB[0] &= (1 << z) - 1;
+		}
+	}
+
+	/* 10. Check the left part of DB is {0,0,...,1}. */
+	for (i = 0; i < emLen - hLen - sLen - 2; i++)
+		if (DB[i] != 0)
+			return -EKEYREJECTED;
+	if (DB[i] != 0x01)
+		return -EKEYREJECTED;
+
+	/* 11. Let salt be the last sLen octets of DB. */
+	salt = DB + DB_len - sLen;
+
+	/* 12. Let M' be 00 00 00 00 00 00 00 00 || mHash || salt. */
+	memset(Mprime, 0, 8);
+	memcpy(Mprime + 8, mHash, hLen);
+	memcpy(Mprime + 8 + hLen, salt, sLen);
+
+	/* 13. Let H' = Hash(M'). */
+	err = crypto_shash_digest(Hash, Mprime, 8 + hLen + sLen, Hprime);
+	if (err < 0)
+		return err;
+
+	/* 14. Check H = H'. */
+	if (memcmp(H, Hprime, hLen) != 0)
+		return -EKEYREJECTED;
+	return 0;
+}
+
+/*
+ * Perform RSASSA-PSS-VERIFY((n,e),M,S) - RFC8017 sec 8.1.2.
+ */
+static int rsassa_pss_verify(struct crypto_sig *tfm,
+			     const void *src, unsigned int slen,
+			     const void *digest, unsigned int dlen,
+			     const char *info)
+{
+	struct rsassa_pss_ctx *ctx = crypto_sig_ctx(tfm);
+	struct crypto_wait cwait;
+	struct scatterlist sg;
+	unsigned int rsa_reqsize = crypto_akcipher_reqsize(ctx->rsa);
+	u8 *EM;
+	int err;
+
+	if (!info)
+		return -EINVAL;
+
+	char *str __free(kfree) = kstrdup(info, GFP_KERNEL);
+	if (!str)
+		return -ENOMEM;
+
+	err = rsassa_pss_vinfo_parse(ctx, str);
+	if (err < 0)
+		return err;
+
+	/* RFC8017 sec 8.1.2 step 1 - length checking */
+	if (!ctx->key_size || slen != ctx->key_size)
+		return -EINVAL;
+
+	/* RFC8017 sec 8.1.2 step 2 - RSA verification */
+	struct akcipher_request *rsa_req __free(kfree) =
+		kmalloc(sizeof(*rsa_req) + rsa_reqsize + ctx->key_size,
+			GFP_KERNEL);
+	if (!rsa_req)
+		return -ENOMEM;
+
+	EM = (u8 *)(rsa_req + 1) + rsa_reqsize;
+	memcpy(EM, src, slen);
+
+	crypto_init_wait(&cwait);
+	sg_init_one(&sg, EM, slen);
+	akcipher_request_set_tfm(rsa_req, ctx->rsa);
+	akcipher_request_set_crypt(rsa_req, &sg, &sg, slen, slen);
+	akcipher_request_set_callback(rsa_req, CRYPTO_TFM_REQ_MAY_SLEEP,
+				      crypto_req_done, &cwait);
+
+	err = crypto_akcipher_encrypt(rsa_req);
+	err = crypto_wait_req(err, &cwait);
+	if (err)
+		return err;
+
+	/* RFC 8017 sec 8.1.2 step 3 - EMSA-PSS(M, EM, modbits-1) */
+	return emsa_pss_verify(ctx, digest, dlen, EM, slen);
+}
+
+static unsigned int rsassa_pss_key_size(struct crypto_sig *tfm)
+{
+	struct rsassa_pss_ctx *ctx = crypto_sig_ctx(tfm);
+
+	return ctx->key_size * BITS_PER_BYTE;
+}
+
+static int rsassa_pss_set_pub_key(struct crypto_sig *tfm,
+				    const void *key, unsigned int keylen)
+{
+	struct rsassa_pss_ctx *ctx = crypto_sig_ctx(tfm);
+
+	return rsa_set_key(ctx->rsa, &ctx->key_size, RSA_PUB, key, keylen);
+}
+
+static int rsassa_pss_init_tfm(struct crypto_sig *tfm)
+{
+	struct crypto_akcipher *rsa;
+	struct rsassa_pss_ctx *ctx = crypto_sig_ctx(tfm);
+
+	rsa = crypto_alloc_akcipher("rsa", 0, 0);
+	if (IS_ERR(rsa))
+		return PTR_ERR(rsa);
+
+	ctx->rsa = rsa;
+	return 0;
+}
+
+static void rsassa_pss_exit_tfm(struct crypto_sig *tfm)
+{
+	struct rsassa_pss_ctx *ctx = crypto_sig_ctx(tfm);
+
+	crypto_free_akcipher(ctx->rsa);
+}
+
+struct sig_alg rsassa_pss_alg = {
+	.verify		= rsassa_pss_verify,
+	.set_pub_key	= rsassa_pss_set_pub_key,
+	.key_size	= rsassa_pss_key_size,
+	.init		= rsassa_pss_init_tfm,
+	.exit		= rsassa_pss_exit_tfm,
+	.base = {
+		.cra_name	 = "rsassa-pss",
+		.cra_driver_name = "rsassa-pss-generic",
+		.cra_priority	 = 100,
+		.cra_module	 = THIS_MODULE,
+		.cra_ctxsize	 = sizeof(struct rsassa_pss_ctx),
+	},
+};
+
+MODULE_ALIAS_CRYPTO("rsassa-pss");
diff --git a/include/crypto/hash.h b/include/crypto/hash.h
index 586700332c73..49b1ea5cf78d 100644
--- a/include/crypto/hash.h
+++ b/include/crypto/hash.h
@@ -779,6 +779,9 @@ static inline void crypto_free_shash(struct crypto_shash *tfm)
 	crypto_destroy_tfm(tfm, crypto_shash_tfm(tfm));
 }
 
+DEFINE_FREE(crypto_free_shash, struct crypto_shash*,
+	    if (!IS_ERR_OR_NULL(_T)) { crypto_free_shash(_T); });
+
 static inline const char *crypto_shash_alg_name(struct crypto_shash *tfm)
 {
 	return crypto_tfm_alg_name(crypto_shash_tfm(tfm));
diff --git a/include/crypto/internal/rsa.h b/include/crypto/internal/rsa.h
index 071a1951b992..d7f38a273949 100644
--- a/include/crypto/internal/rsa.h
+++ b/include/crypto/internal/rsa.h
@@ -83,4 +83,6 @@ static inline int rsa_set_key(struct crypto_akcipher *child,
 
 extern struct crypto_template rsa_pkcs1pad_tmpl;
 extern struct crypto_template rsassa_pkcs1_tmpl;
+extern struct sig_alg rsassa_pss_alg;
+
 #endif


