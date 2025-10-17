Return-Path: <keyrings+bounces-3236-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E442BE94BB
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 16:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1BB764F4A3B
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 14:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC49A335086;
	Fri, 17 Oct 2025 14:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KFFh5ue2"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523DA33507D
	for <keyrings@vger.kernel.org>; Fri, 17 Oct 2025 14:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712272; cv=none; b=T/bbBtt56js56f+HpYEC3uyT1N6L8n5cfNBz8lte8WuOmmF1ug5DgBLtW1pnpbzQ3b1UG2yRjrB/Oa8pilo2lL7yhm6E/jjqvmaD9JV/zhPEP61C3Vn70rWVEtrdJlCjz9V7ZT8dDWUDTIK6SEW5eue+WJFODr9fWU/eYLWYimw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712272; c=relaxed/simple;
	bh=avD4sr/Bw/svERbNO00c+jl89oNtTNGEPzG11bZ2l2c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nar0+/ihDd/C+WYZ+YmSclxZN4u3oVcowSj5/VXuqHIk2zBZFXogrZiKfjbwMeSF7CYQH5zUr6Wzfv9Bu0QN7MVE4kwGn8H7v09d7A7R4XqXJksQ3jqWxQ/5pOFwpqub2CaZ7T0fLpo/CM++J/FvG8U9Xo69i9hv28UDI9RitWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KFFh5ue2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760712268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EcBhDPLx7b75XO7a5KYLacS0jzH+HU9Z/XI2HqLsDLM=;
	b=KFFh5ue2M8MWpt1AXXD0x1Sueisr1BLn6JQdcaNIgM1zsgdH8dL3O0Bw11GLgjujMJjPSV
	uV5XGdf4hQ1RFEf7T9yXhzwoUEidWQcYJezjxXw3rCDo3e7nA9b8P/gJrEgQamUzsGqj7o
	PPGSUh+SNlr+shX5AA+cu0sf7u6mgPY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-135-bBZEckSONTKa0dxkTl5NgQ-1; Fri,
 17 Oct 2025 10:44:23 -0400
X-MC-Unique: bBZEckSONTKa0dxkTl5NgQ-1
X-Mimecast-MFC-AGG-ID: bBZEckSONTKa0dxkTl5NgQ_1760712260
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 849F418001D1;
	Fri, 17 Oct 2025 14:44:20 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.57])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C98C0180057A;
	Fri, 17 Oct 2025 14:44:16 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 11/17] crypto: Add ML-DSA/Dilithium keypair generation support
Date: Fri, 17 Oct 2025 15:42:55 +0100
Message-ID: <20251017144311.817771-12-dhowells@redhat.com>
In-Reply-To: <20251017144311.817771-1-dhowells@redhat.com>
References: <20251017144311.817771-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Add generation of keypairs.  I suspect we don't want to do this in the
kernel.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Jason A. Donenfeld <Jason@zx2c4.com>
cc: Ard Biesheuvel <ardb@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: linux-crypto@vger.kernel.org
---
 crypto/ml_dsa/dilithium.h                |  54 +++++++
 crypto/ml_dsa/dilithium_44.h             |  35 ++++
 crypto/ml_dsa/dilithium_65.h             |  35 ++++
 crypto/ml_dsa/dilithium_87.h             |  35 ++++
 crypto/ml_dsa/dilithium_api.c            |  92 +++++++++++
 crypto/ml_dsa/dilithium_pack.h           |  75 +++++++++
 crypto/ml_dsa/dilithium_pct.h            |  53 ++++++
 crypto/ml_dsa/dilithium_polyvec.h        |  20 +++
 crypto/ml_dsa/dilithium_polyvec_c.h      |  20 +++
 crypto/ml_dsa/dilithium_signature_c.c    |  24 +++
 crypto/ml_dsa/dilithium_signature_c.h    |   7 +
 crypto/ml_dsa/dilithium_signature_impl.h | 195 +++++++++++++++++++++++
 crypto/ml_dsa/dilithium_type.h           |  22 +++
 13 files changed, 667 insertions(+)
 create mode 100644 crypto/ml_dsa/dilithium_pct.h

diff --git a/crypto/ml_dsa/dilithium.h b/crypto/ml_dsa/dilithium.h
index 6d4982164201..d2c9dac4967e 100644
--- a/crypto/ml_dsa/dilithium.h
+++ b/crypto/ml_dsa/dilithium.h
@@ -545,6 +545,60 @@ int dilithium_pk_ptr(uint8_t **dilithium_key, size_t *dilithium_key_len,
 int dilithium_sig_ptr(uint8_t **dilithium_sig, size_t *dilithium_sig_len,
 		      struct dilithium_sig *sig);
 
+/**
+ * @ingroup Dilithium
+ * @brief Generates Dilithium public and private key.
+ *
+ * @param [out] pk pointer to allocated output public key
+ * @param [out] sk pointer to allocated output private key
+ * @param [in] rng_ctx pointer to seeded random number generator context
+ * @param [in] dilithium_type type of the Dilithium key to generate
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_keypair(struct dilithium_pk *pk, struct dilithium_sk *sk,
+		      struct crypto_rng *rng_ctx,
+		      enum dilithium_type dilithium_type);
+
+/**
+ * @ingroup Dilithium
+ * @brief Generates Dilithium public and private key from a given seed.
+ *
+ * The idea of the function is the allowance of FIPS 204 to maintain the seed
+ * used to generate a key pair in lieu of maintaining a private key or the
+ * key pair (which used much more memory). The seed must be treated equally
+ * sensitive as a private key.
+ *
+ * The seed is generated by simply obtaining 32 bytes from a properly seeded
+ * DRNG, i.e. the same way as a symmetric key would be generated.
+ *
+ * @param [out] pk pointer to allocated output public key
+ * @param [out] sk pointer to allocated output private key
+ * @param [in] seed buffer with the seed data which must be exactly 32 bytes
+ *		    in size
+ * @param [in] seedlen length of the seed buffer
+ * @param [in] dilithium_type type of the Dilithium key to generate
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_keypair_from_seed(struct dilithium_pk *pk,
+				struct dilithium_sk *sk,
+				const uint8_t *seed, size_t seedlen,
+				enum dilithium_type dilithium_type);
+
+/**
+ * @brief Pairwise consistency check as per FIPS 140 IG
+ *
+ * This call should be invoked after generating a key pair in FIPS mode
+ *
+ * @param [in] pk Public key
+ * @param [in] sk Secret key
+ *
+ * @return 0 on success, < 0 on error
+ */
+int dilithium_pct(const struct dilithium_pk *pk,
+		  const struct dilithium_sk *sk);
+
 /**
  * @ingroup Dilithium
  * @brief Computes signature in one shot
diff --git a/crypto/ml_dsa/dilithium_44.h b/crypto/ml_dsa/dilithium_44.h
index 6490c83e7100..d5a03bbebb1a 100644
--- a/crypto/ml_dsa/dilithium_44.h
+++ b/crypto/ml_dsa/dilithium_44.h
@@ -195,6 +195,41 @@ static inline unsigned int dilithium_44_sig_size(void)
 	return sizeof_field(struct dilithium_44_sig, sig);
 }
 
+/**
+ * @brief Generates Dilithium public and private key.
+ *
+ * @param [out] pk pointer to allocated output public key
+ * @param [out] sk pointer to allocated output private key
+ * @param [in] rng_ctx pointer to seeded random number generator context
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_44_keypair(struct dilithium_44_pk *pk, struct dilithium_44_sk *sk,
+			 struct crypto_rng *rng_ctx);
+
+/**
+ * @brief Generates Dilithium public and private key from a given seed.
+ *
+ * The idea of the function is the allowance of FIPS 204 to maintain the seed
+ * used to generate a key pair in lieu of maintaining a private key or the
+ * key pair (which used much more memory). The seed must be treated equally
+ * sensitive as a private key.
+ *
+ * The seed is generated by simply obtaining 32 bytes from a properly seeded
+ * DRNG, i.e. the same way as a symmetric key would be generated.
+ *
+ * @param [out] pk pointer to allocated output public key
+ * @param [out] sk pointer to allocated output private key
+ * @param [in] seed buffer with the seed data which must be exactly 32 bytes
+ *		    in size
+ * @param [in] seedlen length of the seed buffer
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_44_keypair_from_seed(struct dilithium_44_pk *pk,
+				       struct dilithium_44_sk *sk,
+				       const uint8_t *seed, size_t seedlen);
+
 /**
  * @brief Computes ML-DSA signature in one shot
  *
diff --git a/crypto/ml_dsa/dilithium_65.h b/crypto/ml_dsa/dilithium_65.h
index 0a36f7eed63e..d93fea2a8798 100644
--- a/crypto/ml_dsa/dilithium_65.h
+++ b/crypto/ml_dsa/dilithium_65.h
@@ -195,6 +195,41 @@ static inline unsigned int dilithium_65_sig_size(void)
 	return sizeof_field(struct dilithium_65_sig, sig);
 }
 
+/**
+ * @brief Generates Dilithium public and private key.
+ *
+ * @param [out] pk pointer to allocated output public key
+ * @param [out] sk pointer to allocated output private key
+ * @param [in] rng_ctx pointer to seeded random number generator context
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_65_keypair(struct dilithium_65_pk *pk, struct dilithium_65_sk *sk,
+			 struct crypto_rng *rng_ctx);
+
+/**
+ * @brief Generates Dilithium public and private key from a given seed.
+ *
+ * The idea of the function is the allowance of FIPS 204 to maintain the seed
+ * used to generate a key pair in lieu of maintaining a private key or the
+ * key pair (which used much more memory). The seed must be treated equally
+ * sensitive as a private key.
+ *
+ * The seed is generated by simply obtaining 32 bytes from a properly seeded
+ * DRNG, i.e. the same way as a symmetric key would be generated.
+ *
+ * @param [out] pk pointer to allocated output public key
+ * @param [out] sk pointer to allocated output private key
+ * @param [in] seed buffer with the seed data which must be exactly 32 bytes
+ *		    in size
+ * @param [in] seedlen length of the seed buffer
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_65_keypair_from_seed(struct dilithium_65_pk *pk,
+				   struct dilithium_65_sk *sk,
+				   const uint8_t *seed, size_t seedlen);
+
 /**
  * @brief Computes ML-DSA signature in one shot
  *
diff --git a/crypto/ml_dsa/dilithium_87.h b/crypto/ml_dsa/dilithium_87.h
index eaed8e675383..69d9f03643d3 100644
--- a/crypto/ml_dsa/dilithium_87.h
+++ b/crypto/ml_dsa/dilithium_87.h
@@ -195,6 +195,41 @@ static inline unsigned int dilithium_87_sig_size(void)
 	return sizeof_field(struct dilithium_87_sig, sig);
 }
 
+/**
+ * @brief Generates Dilithium public and private key.
+ *
+ * @param [out] pk pointer to allocated output public key
+ * @param [out] sk pointer to allocated output private key
+ * @param [in] rng_ctx pointer to seeded random number generator context
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_87_keypair(struct dilithium_87_pk *pk, struct dilithium_87_sk *sk,
+			 struct crypto_rng *rng_ctx);
+
+/**
+ * @brief Generates Dilithium public and private key from a given seed.
+ *
+ * The idea of the function is the allowance of FIPS 204 to maintain the seed
+ * used to generate a key pair in lieu of maintaining a private key or the
+ * key pair (which used much more memory). The seed must be treated equally
+ * sensitive as a private key.
+ *
+ * The seed is generated by simply obtaining 32 bytes from a properly seeded
+ * DRNG, i.e. the same way as a symmetric key would be generated.
+ *
+ * @param [out] pk pointer to allocated output public key
+ * @param [out] sk pointer to allocated output private key
+ * @param [in] seed buffer with the seed data which must be exactly 32 bytes
+ *		    in size
+ * @param [in] seedlen length of the seed buffer
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_87_keypair_from_seed(struct dilithium_87_pk *pk,
+				   struct dilithium_87_sk *sk,
+				   const uint8_t *seed, size_t seedlen);
+
 /**
  * @brief Computes ML-DSA signature in one shot
  *
diff --git a/crypto/ml_dsa/dilithium_api.c b/crypto/ml_dsa/dilithium_api.c
index 363984f01169..215ab5fd7195 100644
--- a/crypto/ml_dsa/dilithium_api.c
+++ b/crypto/ml_dsa/dilithium_api.c
@@ -29,6 +29,7 @@
 
 #include <linux/export.h>
 #include "dilithium.h"
+#include "dilithium_pct.h"
 
 void dilithium_ctx_zero(struct dilithium_ctx *ctx)
 {
@@ -405,6 +406,97 @@ int dilithium_sig_ptr(uint8_t **dilithium_sig,
 }
 EXPORT_SYMBOL(dilithium_sig_ptr);
 
+int dilithium_keypair(struct dilithium_pk *pk,
+		      struct dilithium_sk *sk, struct crypto_rng *rng_ctx,
+		      enum dilithium_type dilithium_type)
+{
+	if (!pk || !sk)
+		return -EINVAL;
+
+	switch (dilithium_type) {
+	case DILITHIUM_87:
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		pk->dilithium_type = dilithium_type;
+		sk->dilithium_type = dilithium_type;
+		return dilithium_87_keypair(&pk->key.pk_87, &sk->key.sk_87,
+					    rng_ctx);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_65:
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		pk->dilithium_type = dilithium_type;
+		sk->dilithium_type = dilithium_type;
+		return dilithium_65_keypair(&pk->key.pk_65, &sk->key.sk_65,
+					    rng_ctx);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_44:
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		pk->dilithium_type = dilithium_type;
+		sk->dilithium_type = dilithium_type;
+		return dilithium_44_keypair(&pk->key.pk_44, &sk->key.sk_44,
+					    rng_ctx);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_UNKNOWN:
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+EXPORT_SYMBOL(dilithium_keypair);
+
+int dilithium_keypair_from_seed(struct dilithium_pk *pk, struct dilithium_sk *sk,
+				const uint8_t *seed, size_t seedlen,
+				enum dilithium_type dilithium_type)
+{
+	if (!pk || !sk)
+		return -EINVAL;
+
+	switch (dilithium_type) {
+	case DILITHIUM_87:
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		pk->dilithium_type = dilithium_type;
+		sk->dilithium_type = dilithium_type;
+		return dilithium_87_keypair_from_seed(
+			&pk->key.pk_87, &sk->key.sk_87, seed, seedlen);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_65:
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		pk->dilithium_type = dilithium_type;
+		sk->dilithium_type = dilithium_type;
+		return dilithium_65_keypair_from_seed(
+			&pk->key.pk_65, &sk->key.sk_65, seed, seedlen);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_44:
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		pk->dilithium_type = dilithium_type;
+		sk->dilithium_type = dilithium_type;
+		return dilithium_44_keypair_from_seed(
+			&pk->key.pk_44, &sk->key.sk_44, seed, seedlen);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_UNKNOWN:
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+EXPORT_SYMBOL(dilithium_keypair_from_seed);
+
+int dilithium_pct(const struct dilithium_pk *pk,
+		  const struct dilithium_sk *sk)
+{
+	return _dilithium_pct_fips(pk, sk);
+}
+EXPORT_SYMBOL(dilithium_pct);
+
 int dilithium_sign(struct dilithium_sig *sig,
 		   const uint8_t *m, size_t mlen,
 		   const struct dilithium_sk *sk,
diff --git a/crypto/ml_dsa/dilithium_pack.h b/crypto/ml_dsa/dilithium_pack.h
index e17c6256a16d..152aafd1df30 100644
--- a/crypto/ml_dsa/dilithium_pack.h
+++ b/crypto/ml_dsa/dilithium_pack.h
@@ -30,6 +30,21 @@
 /*******************************************************************************
  * Pack / Unpack public key
  ******************************************************************************/
+static inline void pack_pk_rho(struct dilithium_pk *pk,
+			       const uint8_t rho[DILITHIUM_SEEDBYTES])
+{
+	memcpy(pk->pk, rho, DILITHIUM_SEEDBYTES);
+}
+
+static inline void pack_pk_t1(struct dilithium_pk *pk, const polyveck *t1)
+{
+	unsigned int i;
+	uint8_t *pubkey = pk->pk + DILITHIUM_SEEDBYTES;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		polyt1_pack(pubkey + i * DILITHIUM_POLYT1_PACKEDBYTES,
+			    &t1->vec[i]);
+}
 
 static inline void unpack_pk_rho(uint8_t rho[DILITHIUM_SEEDBYTES],
 				 const struct dilithium_pk *pk)
@@ -50,6 +65,66 @@ static inline void unpack_pk_t1(polyveck *t1, const struct dilithium_pk *pk)
 /*******************************************************************************
  * Pack / Unpack secret key
  ******************************************************************************/
+static inline void pack_sk_rho(struct dilithium_sk *sk,
+			       const uint8_t rho[DILITHIUM_SEEDBYTES])
+{
+	memcpy(sk->sk, rho, DILITHIUM_SEEDBYTES);
+}
+
+static inline void pack_sk_key(struct dilithium_sk *sk,
+			       const uint8_t key[DILITHIUM_SEEDBYTES])
+{
+	memcpy(sk->sk + DILITHIUM_SEEDBYTES, key, DILITHIUM_SEEDBYTES);
+}
+
+static inline void pack_sk_tr(struct dilithium_sk *sk,
+			      const uint8_t tr[DILITHIUM_TRBYTES])
+{
+	memcpy(sk->sk + 2 * DILITHIUM_SEEDBYTES, tr, DILITHIUM_TRBYTES);
+}
+
+static inline void pack_sk_s1(struct dilithium_sk *sk, const polyvecl *s1)
+{
+	unsigned int i;
+	uint8_t *seckey =
+		sk->sk + 2 * DILITHIUM_SEEDBYTES + DILITHIUM_TRBYTES;
+
+	for (i = 0; i < DILITHIUM_L; ++i)
+		polyeta_pack(seckey + i * DILITHIUM_POLYETA_PACKEDBYTES,
+			     &s1->vec[i]);
+}
+
+static inline void pack_sk_s2(struct dilithium_sk *sk, const polyveck *s2)
+{
+	unsigned int i;
+	uint8_t *seckey = sk->sk + 2 * DILITHIUM_SEEDBYTES +
+			  DILITHIUM_TRBYTES +
+			  DILITHIUM_L * DILITHIUM_POLYETA_PACKEDBYTES;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		polyeta_pack(seckey + i * DILITHIUM_POLYETA_PACKEDBYTES,
+			     &s2->vec[i]);
+}
+
+static inline void pack_sk_t0(struct dilithium_sk *sk, const polyveck *t0)
+{
+	unsigned int i;
+	uint8_t *seckey = sk->sk + 2 * DILITHIUM_SEEDBYTES +
+			  DILITHIUM_TRBYTES +
+			  DILITHIUM_L * DILITHIUM_POLYETA_PACKEDBYTES +
+			  DILITHIUM_K * DILITHIUM_POLYETA_PACKEDBYTES;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		polyt0_pack(seckey + i * DILITHIUM_POLYT0_PACKEDBYTES,
+			    &t0->vec[i]);
+}
+
+static inline void unpack_sk_rho(uint8_t rho[DILITHIUM_SEEDBYTES],
+				 const struct dilithium_sk *sk)
+{
+	memcpy(rho, sk->sk, DILITHIUM_SEEDBYTES);
+}
+
 static inline void unpack_sk_key(uint8_t key[DILITHIUM_SEEDBYTES],
 				 const struct dilithium_sk *sk)
 {
diff --git a/crypto/ml_dsa/dilithium_pct.h b/crypto/ml_dsa/dilithium_pct.h
new file mode 100644
index 000000000000..d153e5a95dd1
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_pct.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2024 - 2025, Stephan Mueller <smueller@chronox.de>
+ *
+ * THIS SOFTWARE IS PROVIDED ``AS IS'' AND ANY EXPRESS OR IMPLIED
+ * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
+ * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE, ALL OF
+ * WHICH ARE HEREBY DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
+ * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
+ * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
+ * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
+ * USE OF THIS SOFTWARE, EVEN IF NOT ADVISED OF THE POSSIBILITY OF SUCH
+ * DAMAGE.
+ */
+
+#ifndef DILITHIUM_PCT_H
+#define DILITHIUM_PCT_H
+
+#include "fips_mode.h"
+#include "small_stack_support.h"
+
+static inline int _dilithium_pct_fips(const struct dilithium_pk *pk,
+				      const struct dilithium_sk *sk)
+{
+	struct workspace {
+		uint8_t m[32];
+		struct dilithium_sig sig;
+	};
+	int ret;
+	LC_DECLARE_MEM(ws, struct workspace, sizeof(uint64_t));
+
+	ret = dilithium_sign(&ws->sig, ws->m, sizeof(ws->m), sk,
+			     lc_seeded_rng);
+	if (ret < 0)
+		goto out;
+	ret = dilithium_verify(&ws->sig, ws->m, sizeof(ws->m), pk);
+out:
+	LC_RELEASE_MEM(ws);
+	return ret;
+}
+
+static inline int dilithium_pct_fips(const struct dilithium_pk *pk,
+				     const struct dilithium_sk *sk)
+{
+	FIPS140_PCT_LOOP(_dilithium_pct_fips(pk, sk))
+
+	return 0;
+}
+
+#endif /* DILITHIUM_PCT_H */
diff --git a/crypto/ml_dsa/dilithium_polyvec.h b/crypto/ml_dsa/dilithium_polyvec.h
index 7e428e3becfd..609df0769f5c 100644
--- a/crypto/ml_dsa/dilithium_polyvec.h
+++ b/crypto/ml_dsa/dilithium_polyvec.h
@@ -269,6 +269,26 @@ static inline int polyveck_chknorm(const polyveck *v, int32_t bound)
 	return 0;
 }
 
+/**
+ * @brief polyveck_power2round - For all coefficients a of polynomials in vector
+ *				 of length K, compute a0, a1 such that
+ *				 a mod^+ Q = a1*2^D + a0 with
+ *				 -2^{D-1} < a0 <= 2^{D-1}. Assumes coefficients
+ *				 to be standard representatives.
+ *
+ * @param [out] v1 pointer to output vector of polynomials with coefficients a1
+ * @param [in] v0 pointer to output vector of polynomials with coefficients a0
+ * @param [in] v pointer to input vector
+ */
+static inline void polyveck_power2round(polyveck *v1, polyveck *v0,
+					const polyveck *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		poly_power2round(&v1->vec[i], &v0->vec[i], &v->vec[i]);
+}
+
 /**
  * @brief polyveck_decompose - For all coefficients a of polynomials in vector
  *			       of length K, compute high and low bits a0, a1
diff --git a/crypto/ml_dsa/dilithium_polyvec_c.h b/crypto/ml_dsa/dilithium_polyvec_c.h
index 0f8c2d914e4d..1628e3217cbc 100644
--- a/crypto/ml_dsa/dilithium_polyvec_c.h
+++ b/crypto/ml_dsa/dilithium_polyvec_c.h
@@ -19,6 +19,16 @@
 #ifndef DILITHIUM_POLYVEC_C_H
 #define DILITHIUM_POLYVEC_C_H
 
+static inline void
+polyvecl_uniform_eta(polyvecl *v, const uint8_t seed[DILITHIUM_CRHBYTES],
+		     uint16_t nonce, void *ws_buf)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_L; ++i)
+		poly_uniform_eta(&v->vec[i], seed, cpu_to_le16(nonce++), ws_buf);
+}
+
 static inline void
 polyvecl_uniform_gamma1(polyvecl *v, const uint8_t seed[DILITHIUM_CRHBYTES],
 			uint16_t nonce, void *ws_buf)
@@ -32,6 +42,16 @@ polyvecl_uniform_gamma1(polyvecl *v, const uint8_t seed[DILITHIUM_CRHBYTES],
 			ws_buf);
 }
 
+static inline void
+polyveck_uniform_eta(polyveck *v, const uint8_t seed[DILITHIUM_CRHBYTES],
+		     uint16_t nonce, void *ws_buf)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		poly_uniform_eta(&v->vec[i], seed, cpu_to_le16(nonce++), ws_buf);
+}
+
 /**
  * @brief expand_mat - Implementation of ExpandA. Generates matrix A with
  *		       uniformly random coefficients a_{i,j} by performing
diff --git a/crypto/ml_dsa/dilithium_signature_c.c b/crypto/ml_dsa/dilithium_signature_c.c
index a4a9d0bfdd37..ebaab0db7fda 100644
--- a/crypto/ml_dsa/dilithium_signature_c.c
+++ b/crypto/ml_dsa/dilithium_signature_c.c
@@ -37,6 +37,18 @@
 #include "dilithium_pack.h"
 #include "dilithium_signature_impl.h"
 
+int dilithium_keypair_from_seed_c(struct dilithium_pk *pk, struct dilithium_sk *sk,
+				  const uint8_t *seed, size_t seedlen)
+{
+	return dilithium_keypair_from_seed_impl(pk, sk, seed, seedlen);
+}
+
+int dilithium_keypair_c(struct dilithium_pk *pk,
+			struct dilithium_sk *sk, struct crypto_rng *rng_ctx)
+{
+	return dilithium_keypair_impl(pk, sk, rng_ctx);
+}
+
 int dilithium_sign_c(struct dilithium_sig *sig,
 		     const uint8_t *m, size_t mlen,
 		     const struct dilithium_sk *sk,
@@ -105,6 +117,18 @@ int dilithium_verify_final_c(const struct dilithium_sig *sig,
 	return dilithium_verify_final_impl(sig, ctx, pk);
 }
 
+int dilithium_keypair_from_seed(struct dilithium_pk *pk, struct dilithium_sk *sk,
+				  const uint8_t *seed, size_t seedlen)
+{
+	return dilithium_keypair_from_seed_c(pk, sk, seed, seedlen);
+}
+
+int dilithium_keypair(struct dilithium_pk *pk,
+			struct dilithium_sk *sk, struct crypto_rng *rng_ctx)
+{
+	return dilithium_keypair_c(pk, sk, rng_ctx);
+}
+
 int dilithium_sign(struct dilithium_sig *sig,
 		     const uint8_t *m, size_t mlen,
 		     const struct dilithium_sk *sk,
diff --git a/crypto/ml_dsa/dilithium_signature_c.h b/crypto/ml_dsa/dilithium_signature_c.h
index a7d20cd49672..eab4d5e8c686 100644
--- a/crypto/ml_dsa/dilithium_signature_c.h
+++ b/crypto/ml_dsa/dilithium_signature_c.h
@@ -21,6 +21,13 @@
 
 #include "dilithium_type.h"
 
+int dilithium_keypair_c(struct dilithium_pk *pk,
+			struct dilithium_sk *sk,
+			struct crypto_rng *rng_ctx);
+int dilithium_keypair_from_seed_c(struct dilithium_pk *pk,
+				  struct dilithium_sk *sk,
+				  const uint8_t *seed, size_t seedlen);
+
 int dilithium_sign_c(struct dilithium_sig *sig, const uint8_t *m,
 		     size_t mlen, const struct dilithium_sk *sk,
 		     struct crypto_rng *rng_ctx);
diff --git a/crypto/ml_dsa/dilithium_signature_impl.h b/crypto/ml_dsa/dilithium_signature_impl.h
index 1f0ec0f7c27c..1682f64b6877 100644
--- a/crypto/ml_dsa/dilithium_signature_impl.h
+++ b/crypto/ml_dsa/dilithium_signature_impl.h
@@ -31,6 +31,7 @@
 #include "dilithium_type.h"
 #include "dilithium_debug.h"
 #include "dilithium_pack.h"
+#include "dilithium_pct.h"
 #include "dilithium_signature_impl.h"
 #include "signature_domain_separation.h"
 #include "small_stack_support.h"
@@ -52,6 +53,200 @@
 #define WS_POLY_UNIFORM_BUF_SIZE                                               \
 	(_WS_POLY_UNIFORM_BUF_SIZE * LC_POLY_UNIFOR_BUF_SIZE_MULTIPLIER)
 
+static int dilithium_keypair_from_seed_impl(struct dilithium_pk *pk,
+					    struct dilithium_sk *sk,
+					    const uint8_t *seed,
+					    size_t seedlen);
+
+static int dilithium_keypair_impl(struct dilithium_pk *pk,
+				  struct dilithium_sk *sk,
+				  struct crypto_rng *rng_ctx)
+{
+	struct workspace {
+		union {
+			polyvecl s1, s1hat;
+		} s1;
+		union {
+			polyvecl mat[DILITHIUM_K];
+			polyveck t0;
+		} matrix;
+		polyveck s2, t1;
+		uint8_t seedbuf[2 * DILITHIUM_SEEDBYTES +
+				DILITHIUM_CRHBYTES];
+		union {
+			poly polyvecl_pointwise_acc_montgomery_buf;
+			uint8_t poly_uniform_buf[WS_POLY_UNIFORM_BUF_SIZE];
+			uint8_t poly_uniform_eta_buf[POLY_UNIFORM_ETA_BYTES];
+			uint8_t tr[DILITHIUM_TRBYTES];
+		} tmp;
+	};
+	static const uint8_t dimension[2] = { DILITHIUM_K, DILITHIUM_L };
+	const uint8_t *rho, *rhoprime, *key;
+	int ret;
+	struct shake256_ctx shake256_ctx;
+	LC_DECLARE_MEM(ws, struct workspace, sizeof(uint64_t));
+
+	if (WARN_ON_ONCE(!pk) ||
+	    WARN_ON_ONCE(!sk)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Get randomness for rho, rhoprime and key */
+	ret = crypto_rng_generate(rng_ctx, NULL, 0, ws->seedbuf,
+				  DILITHIUM_SEEDBYTES);
+	if (ret < 0)
+		goto out;
+	dilithium_print_buffer(ws->seedbuf, DILITHIUM_SEEDBYTES,
+			       "Keygen - Seed");
+
+	shake256_init(&shake256_ctx);
+	shake256_update(&shake256_ctx, ws->seedbuf, DILITHIUM_SEEDBYTES);
+	shake256_update(&shake256_ctx, dimension, sizeof(dimension));
+	shake256_squeeze(&shake256_ctx, ws->seedbuf, sizeof(ws->seedbuf));
+	shake256_clear(&shake256_ctx);
+
+	rho = ws->seedbuf;
+	dilithium_print_buffer(ws->seedbuf, DILITHIUM_SEEDBYTES,
+			       "Keygen - RHO");
+	pack_pk_rho(pk, rho);
+	pack_sk_rho(sk, rho);
+
+	/*
+	 * Timecop: RHO' is a random number which is enlarged to sample the
+	 * vectors S1 and S2 from. The sampling operation is not considered
+	 * relevant for the side channel operation as (a) an attacker does not
+	 * have access to the random number and (b) only the result after the
+	 * sampling operation of S1 and S2 is released.
+	 */
+	rhoprime = rho + DILITHIUM_SEEDBYTES;
+	dilithium_print_buffer(rhoprime, DILITHIUM_CRHBYTES,
+			       "Keygen - RHOPrime");
+
+	key = rhoprime + DILITHIUM_CRHBYTES;
+	dilithium_print_buffer(key, DILITHIUM_SEEDBYTES, "Keygen - Key");
+
+	/* Timecop: key goes into the secret key */
+	poison(key, DILITHIUM_SEEDBYTES);
+
+	pack_sk_key(sk, key);
+
+	/* Sample short vectors s1 and s2 */
+
+	polyvecl_uniform_eta(&ws->s1.s1, rhoprime, 0,
+			     ws->tmp.poly_uniform_eta_buf);
+	polyveck_uniform_eta(&ws->s2, rhoprime, DILITHIUM_L,
+			     ws->tmp.poly_uniform_eta_buf);
+
+	/* Timecop: s1 and s2 are secret */
+	poison(&ws->s1.s1, sizeof(polyvecl));
+	poison(&ws->s2, sizeof(polyveck));
+
+	dilithium_print_polyvecl(&ws->s1.s1,
+				 "Keygen - S1 L x N matrix after ExpandS:");
+	dilithium_print_polyveck(&ws->s2,
+				 "Keygen - S2 K x N matrix after ExpandS:");
+
+	pack_sk_s1(sk, &ws->s1.s1);
+	pack_sk_s2(sk, &ws->s2);
+
+	polyvecl_ntt(&ws->s1.s1hat);
+	dilithium_print_polyvecl(&ws->s1.s1hat,
+				 "Keygen - S1 L x N matrix after NTT:");
+
+	/* Expand matrix */
+	polyvec_matrix_expand(ws->matrix.mat, rho, ws->tmp.poly_uniform_buf);
+	dilithium_print_polyvecl_k(
+		ws->matrix.mat, "Keygen - MAT K x L x N matrix after ExpandA:");
+
+	polyvec_matrix_pointwise_montgomery(
+		&ws->t1, ws->matrix.mat, &ws->s1.s1hat,
+		&ws->tmp.polyvecl_pointwise_acc_montgomery_buf);
+	dilithium_print_polyveck(&ws->t1,
+				 "Keygen - T K x N matrix after A*NTT(s1):");
+
+	polyveck_reduce(&ws->t1);
+	dilithium_print_polyveck(
+		&ws->t1, "Keygen - T K x N matrix reduce after A*NTT(s1):");
+
+	polyveck_invntt_tomont(&ws->t1);
+	dilithium_print_polyveck(&ws->t1,
+				 "Keygen - T K x N matrix after NTT-1:");
+
+	/* Add error vector s2 */
+	polyveck_add(&ws->t1, &ws->t1, &ws->s2);
+	dilithium_print_polyveck(&ws->t1,
+				 "Keygen - T K x N matrix after add S2:");
+
+	/* Extract t1 and write public key */
+	polyveck_caddq(&ws->t1);
+	dilithium_print_polyveck(&ws->t1, "Keygen - T K x N matrix caddq:");
+
+	polyveck_power2round(&ws->t1, &ws->matrix.t0, &ws->t1);
+	dilithium_print_polyveck(&ws->matrix.t0,
+				 "Keygen - T0 K x N matrix after power2round:");
+	dilithium_print_polyveck(&ws->t1,
+				 "Keygen - T1 K x N matrix after power2round:");
+
+	pack_sk_t0(sk, &ws->matrix.t0);
+	pack_pk_t1(pk, &ws->t1);
+	dilithium_print_buffer(pk->pk, DILITHIUM_PUBLICKEYBYTES,
+			       "Keygen - PK after pkEncode:");
+
+	/* Compute H(rho, t1) and write secret key */
+	shake256(pk->pk, sizeof(pk->pk), ws->tmp.tr, sizeof(ws->tmp.tr));
+	dilithium_print_buffer(ws->tmp.tr, sizeof(ws->tmp.tr), "Keygen - TR:");
+	pack_sk_tr(sk, ws->tmp.tr);
+
+	dilithium_print_buffer(sk->sk, DILITHIUM_SECRETKEYBYTES,
+			       "Keygen - SK:");
+
+	/* Timecop: pk and sk are not relevant for side-channels any more. */
+	unpoison(pk->pk, sizeof(pk->pk));
+	unpoison(sk->sk, sizeof(sk->sk));
+
+	ret = dilithium_pct_fips(pk, sk);
+
+out:
+	LC_RELEASE_MEM(ws);
+	return ret;
+}
+
+static int dilithium_keypair_from_seed_impl(struct dilithium_pk *pk,
+					    struct dilithium_sk *sk,
+					    const uint8_t *seed,
+					    size_t seedlen)
+{
+	struct crypto_rng *rng;
+	int ret;
+
+	if (seedlen != DILITHIUM_SEEDBYTES)
+		return -EINVAL;
+
+	rng = crypto_alloc_rng("stdrng", 0, 0);
+	if (IS_ERR(rng))
+		return PTR_ERR(rng);
+
+	ret = crypto_rng_seedsize(rng);
+	if (ret < 0)
+		goto out;
+	if (seedlen != ret) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	/* Set the seed that the key generation can pull via the RNG. */
+	ret = crypto_rng_reset(rng, seed, seedlen);
+	if (ret < 0)
+		goto out;
+
+	/* Generate the key pair from the seed. */
+	ret = dilithium_keypair_impl(pk, sk, rng);
+
+out:
+	return ret;
+}
+
 static int dilithium_sign_internal_ahat(struct dilithium_sig *sig,
 					const struct dilithium_sk *sk,
 					struct dilithium_ctx *ctx,
diff --git a/crypto/ml_dsa/dilithium_type.h b/crypto/ml_dsa/dilithium_type.h
index f9f7ffa2cd38..cc2664b62048 100644
--- a/crypto/ml_dsa/dilithium_type.h
+++ b/crypto/ml_dsa/dilithium_type.h
@@ -63,6 +63,8 @@
  * The following defines simply allow duplicate compilation of the
  * respective functions.
  */
+#define dilithium_keypair DILITHIUM_F(keypair)
+#define dilithium_keypair_from_seed DILITHIUM_F(keypair_from_seed)
 #define dilithium_sign DILITHIUM_F(sign)
 #define dilithium_sign_ctx DILITHIUM_F(sign_ctx)
 #define dilithium_sign_init DILITHIUM_F(sign_init)
@@ -74,6 +76,8 @@
 #define dilithium_verify_update DILITHIUM_F(verify_update)
 #define dilithium_verify_final DILITHIUM_F(verify_final)
 
+#define dilithium_keypair_c DILITHIUM_F(keypair_c)
+#define dilithium_keypair_from_seed_c DILITHIUM_F(keypair_from_seed_c)
 #define dilithium_sign_c DILITHIUM_F(sign_c)
 #define dilithium_sign_ctx_c DILITHIUM_F(sign_ctx_c)
 #define dilithium_sign_init_c DILITHIUM_F(sign_init_c)
@@ -85,6 +89,10 @@
 #define dilithium_verify_update_c DILITHIUM_F(verify_update_c)
 #define dilithium_verify_final_c DILITHIUM_F(verify_final_c)
 
+#define dilithium_keypair_tester DILITHIUM_F(keypair_tester)
+#define dilithium_siggen_tester DILITHIUM_F(siggen_tester)
+#define dilithium_sigver_tester DILITHIUM_F(sigver_tester)
+
 #define ntt DILITHIUM_F(ntt)
 #define invntt_tomont DILITHIUM_F(invntt_tomont)
 #define poly_chknorm DILITHIUM_F(poly_chknorm)
@@ -152,6 +160,8 @@
 #define decompose_avx DILITHIUM_F(decompose_avx)
 #define make_hint_avx DILITHIUM_F(make_hint_avx)
 #define use_hint_avx DILITHIUM_F(use_hint_avx)
+#define dilithium_keypair_avx2 DILITHIUM_F(keypair_avx2)
+#define dilithium_keypair_from_seed_avx2 DILITHIUM_F(keypair_from_seed_avx2)
 #define dilithium_sign_avx2 DILITHIUM_F(sign_avx2)
 #define dilithium_sign_ctx_avx2 DILITHIUM_F(sign_ctx_avx2)
 #define dilithium_sign_init_avx2 DILITHIUM_F(sign_init_avx2)
@@ -179,6 +189,9 @@
 	DILITHIUM_F(poly_pointwise_montgomery_armv8)
 #define polyvecl_pointwise_acc_montgomery_armv8                                \
 	DILITHIUM_F(polyvecl_pointwise_acc_montgomery_armv8)
+#define dilithium_keypair_armv8 DILITHIUM_F(keypair_armv8)
+#define dilithium_keypair_from_seed_armv8                                   \
+	DILITHIUM_F(keypair_from_seed_armv8)
 #define dilithium_sign_armv8 DILITHIUM_F(sign_armv8)
 #define dilithium_sign_ctx_armv8 DILITHIUM_F(sign_ctx_armv8)
 #define dilithium_sign_init_armv8 DILITHIUM_F(sign_init_armv8)
@@ -200,6 +213,9 @@
 #define poly_uniform_armv7 DILITHIUM_F(poly_uniform_armv7)
 #define armv7_poly_reduce_asm DILITHIUM_F(armv7_poly_reduce_asm)
 #define armv7_rej_uniform_asm DILITHIUM_F(armv7_rej_uniform_asm)
+#define dilithium_keypair_armv7 DILITHIUM_F(keypair_armv7)
+#define dilithium_keypair_from_seed_armv7                                   \
+	DILITHIUM_F(keypair_from_seed_armv7)
 #define dilithium_sign_armv7 DILITHIUM_F(sign_armv7)
 #define dilithium_sign_ctx_armv7 DILITHIUM_F(sign_ctx_armv7)
 #define dilithium_sign_init_armv7 DILITHIUM_F(sign_init_armv7)
@@ -212,6 +228,9 @@
 #define dilithium_verify_final_armv7 DILITHIUM_F(verify_final_armv7)
 
 /* RISCV 64 ASM Implementation */
+#define dilithium_keypair_riscv64 DILITHIUM_F(keypair_riscv64)
+#define dilithium_keypair_from_seed_riscv64                                 \
+	DILITHIUM_F(keypair_from_seed_riscv64)
 #define dilithium_sign_riscv64 DILITHIUM_F(sign_riscv64)
 #define dilithium_sign_ctx_riscv64 DILITHIUM_F(sign_ctx_riscv64)
 #define dilithium_sign_init_riscv64 DILITHIUM_F(sign_init_riscv64)
@@ -234,6 +253,9 @@
 #define dilithium_poly_reduce_rv64im DILITHIUM_F(poly_reduce_rv64im)
 
 /* RISCV 64 RVV Implementation */
+#define dilithium_keypair_riscv64_rvv DILITHIUM_F(keypair_riscv64_rvv)
+#define dilithium_keypair_from_seed_riscv64_rvv                             \
+	DILITHIUM_F(keypair_from_seed_riscv64_rvv)
 #define dilithium_sign_riscv64_rvv DILITHIUM_F(sign_riscv64_rvv)
 #define dilithium_sign_ctx_riscv64_rvv DILITHIUM_F(sign_ctx_riscv64_rvv)
 #define dilithium_sign_init_riscv64_rvv DILITHIUM_F(sign_init_riscv64_rvv)


