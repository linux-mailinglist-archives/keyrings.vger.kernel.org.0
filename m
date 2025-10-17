Return-Path: <keyrings+bounces-3232-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 25613BE9449
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 16:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9E70735B858
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 14:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF0D336ED0;
	Fri, 17 Oct 2025 14:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WtTEi4Tf"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F4833507F
	for <keyrings@vger.kernel.org>; Fri, 17 Oct 2025 14:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712242; cv=none; b=XqFdByOJlyi6WDPBlzQsuH1e8gqS/V3+MsPD1msozP6LBjqEL4nK9LQ+mQJePVa/Ip6Djk5b/SMc8kXucW7O0fk7WQidAnlxFeOAYHIIg5SOi0+EzbsG0DOaDXR1Z06qJElMj4mAwVFaQbFXAeORLOSqVm7cA7HLh9E1CW+vDf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712242; c=relaxed/simple;
	bh=jDjIVrpgSDYQgsBdYacbakIY+MVll1GSg7saaMtsYS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V/l9HinAUj82bvIo4zA5RhjiVi5BLAAsmFILUDPskJ+MrMwKB7bIq0tf/kpmibxkud2aPsOVFqhlhBeV1VWiDzOtHW+OPDVrVZhwcvtLv60ZG9cWfWLOEGBJijwrXwbuxqc6+AZ7RTgGqWwc5aMLiar//jpH77zTg1pyhtl7ZwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WtTEi4Tf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760712239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wGtiLlou1EFBYYBXtbFfRUirmWy+mVJPL6o4ESRCGmw=;
	b=WtTEi4TfJNVFGatvOeI6F3v3EDUSrtv3aBDqrsAtzc0BuZvGwzsd4pUQsxI25W/DnjvZGj
	ddbmPGR51ujicAAPgYQdg0HhzWbY6pjG28FCkf90NTZEECdgzqfhha7mOr4o4X4N6STXNH
	xjZKichaL1tNhr6PRcPvzPz1hv/eHpM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-541-whMOVfHVOqKDJHVUhW2z4w-1; Fri,
 17 Oct 2025 10:43:56 -0400
X-MC-Unique: whMOVfHVOqKDJHVUhW2z4w-1
X-Mimecast-MFC-AGG-ID: whMOVfHVOqKDJHVUhW2z4w_1760712234
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 369541956096;
	Fri, 17 Oct 2025 14:43:54 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.57])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5E87630001BC;
	Fri, 17 Oct 2025 14:43:50 +0000 (UTC)
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
Subject: [PATCH v6 06/17] crypto/jitterentropy: Use lib/crypto/sha3
Date: Fri, 17 Oct 2025 15:42:50 +0100
Message-ID: <20251017144311.817771-7-dhowells@redhat.com>
In-Reply-To: <20251017144311.817771-1-dhowells@redhat.com>
References: <20251017144311.817771-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Make the jitterentropy RNG use lib/crypto/sha3 rather than crypto/sha3.

For some reason it goes absolutely wild if crypto/sha3 is reimplemented
to use lib/crypto/sha3, but it's fine if it uses lib directly.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: linux-crypto@vger.kernel.org
---
 crypto/jitterentropy-kcapi.c | 100 ++++++++++-------------------------
 crypto/jitterentropy.c       |   7 +--
 crypto/jitterentropy.h       |   8 +--
 3 files changed, 36 insertions(+), 79 deletions(-)

diff --git a/crypto/jitterentropy-kcapi.c b/crypto/jitterentropy-kcapi.c
index a53de7affe8d..b38118fe51cd 100644
--- a/crypto/jitterentropy-kcapi.c
+++ b/crypto/jitterentropy-kcapi.c
@@ -101,23 +101,13 @@ void jent_get_nstime(__u64 *out)
 	jent_raw_hires_entropy_store(tmp);
 }
 
-int jent_hash_time(void *hash_state, __u64 time, u8 *addtl,
+int jent_hash_time(struct sha3_256_ctx *hash_state, __u64 time, u8 *addtl,
 		   unsigned int addtl_len, __u64 hash_loop_cnt,
 		   unsigned int stuck)
 {
-	struct shash_desc *hash_state_desc = (struct shash_desc *)hash_state;
-	SHASH_DESC_ON_STACK(desc, hash_state_desc->tfm);
+	struct sha3_256_ctx desc;
 	u8 intermediary[SHA3_256_DIGEST_SIZE];
 	__u64 j = 0;
-	int ret;
-
-	desc->tfm = hash_state_desc->tfm;
-
-	if (sizeof(intermediary) != crypto_shash_digestsize(desc->tfm)) {
-		pr_warn_ratelimited("Unexpected digest size\n");
-		return -EINVAL;
-	}
-	kmsan_unpoison_memory(intermediary, sizeof(intermediary));
 
 	/*
 	 * This loop fills a buffer which is injected into the entropy pool.
@@ -130,24 +120,20 @@ int jent_hash_time(void *hash_state, __u64 time, u8 *addtl,
 	 *
 	 * Note, it does not matter which or how much data you inject, we are
 	 * interested in one Keccack1600 compression operation performed with
-	 * the crypto_shash_final.
+	 * the sha3_256_final.
 	 */
 	for (j = 0; j < hash_loop_cnt; j++) {
-		ret = crypto_shash_init(desc) ?:
-		      crypto_shash_update(desc, intermediary,
-					  sizeof(intermediary)) ?:
-		      crypto_shash_finup(desc, addtl, addtl_len, intermediary);
-		if (ret)
-			goto err;
+		sha3_256_init(&desc);
+		sha3_256_update(&desc, intermediary, sizeof(intermediary));
+		sha3_256_update(&desc, addtl, addtl_len);
+		sha3_256_final(&desc, intermediary);
 	}
 
 	/*
 	 * Inject the data from the previous loop into the pool. This data is
 	 * not considered to contain any entropy, but it stirs the pool a bit.
 	 */
-	ret = crypto_shash_update(hash_state_desc, intermediary, sizeof(intermediary));
-	if (ret)
-		goto err;
+	sha3_256_update(hash_state, intermediary, sizeof(intermediary));
 
 	/*
 	 * Insert the time stamp into the hash context representing the pool.
@@ -162,30 +148,25 @@ int jent_hash_time(void *hash_state, __u64 time, u8 *addtl,
 		time = 0;
 	}
 
-	ret = crypto_shash_update(hash_state_desc, (u8 *)&time, sizeof(__u64));
-
-err:
-	shash_desc_zero(desc);
+	sha3_256_update(hash_state, (u8 *)&time, sizeof(__u64));
 	memzero_explicit(intermediary, sizeof(intermediary));
-
-	return ret;
+	return 0;
 }
 
-int jent_read_random_block(void *hash_state, char *dst, unsigned int dst_len)
+int jent_read_random_block(struct sha3_256_ctx *hash_state, char *dst, unsigned int dst_len)
 {
-	struct shash_desc *hash_state_desc = (struct shash_desc *)hash_state;
 	u8 jent_block[SHA3_256_DIGEST_SIZE];
+
 	/* Obtain data from entropy pool and re-initialize it */
-	int ret = crypto_shash_final(hash_state_desc, jent_block) ?:
-		  crypto_shash_init(hash_state_desc) ?:
-		  crypto_shash_update(hash_state_desc, jent_block,
-				      sizeof(jent_block));
+	sha3_256_final(hash_state, jent_block);
+	sha3_256_init(hash_state);
+	sha3_256_update(hash_state, jent_block, sizeof(jent_block));
 
-	if (!ret && dst_len)
+	if (dst_len)
 		memcpy(dst, jent_block, dst_len);
 
 	memzero_explicit(jent_block, sizeof(jent_block));
-	return ret;
+	return 0;
 }
 
 /***************************************************************************
@@ -195,8 +176,7 @@ int jent_read_random_block(void *hash_state, char *dst, unsigned int dst_len)
 struct jitterentropy {
 	spinlock_t jent_lock;
 	struct rand_data *entropy_collector;
-	struct crypto_shash *tfm;
-	struct shash_desc *sdesc;
+	struct sha3_256_ctx *sdesc;
 };
 
 static void jent_kcapi_cleanup(struct crypto_tfm *tfm)
@@ -205,16 +185,10 @@ static void jent_kcapi_cleanup(struct crypto_tfm *tfm)
 
 	spin_lock(&rng->jent_lock);
 
-	if (rng->sdesc) {
-		shash_desc_zero(rng->sdesc);
-		kfree(rng->sdesc);
-	}
+	if (rng->sdesc)
+		kfree_sensitive(rng->sdesc);
 	rng->sdesc = NULL;
 
-	if (rng->tfm)
-		crypto_free_shash(rng->tfm);
-	rng->tfm = NULL;
-
 	if (rng->entropy_collector)
 		jent_entropy_collector_free(rng->entropy_collector);
 	rng->entropy_collector = NULL;
@@ -224,9 +198,8 @@ static void jent_kcapi_cleanup(struct crypto_tfm *tfm)
 static int jent_kcapi_init(struct crypto_tfm *tfm)
 {
 	struct jitterentropy *rng = crypto_tfm_ctx(tfm);
-	struct crypto_shash *hash;
-	struct shash_desc *sdesc;
-	int size, ret = 0;
+	struct sha3_256_ctx *sdesc;
+	int ret = 0;
 
 	spin_lock_init(&rng->jent_lock);
 
@@ -239,22 +212,13 @@ static int jent_kcapi_init(struct crypto_tfm *tfm)
 	 * using a fast implementation, we would need to call it more often
 	 * as its variations are lower.
 	 */
-	hash = crypto_alloc_shash(JENT_CONDITIONING_HASH, 0, 0);
-	if (IS_ERR(hash)) {
-		pr_err("Cannot allocate conditioning digest\n");
-		return PTR_ERR(hash);
-	}
-	rng->tfm = hash;
-
-	size = sizeof(struct shash_desc) + crypto_shash_descsize(hash);
-	sdesc = kmalloc(size, GFP_KERNEL);
+	sdesc = kmalloc(sizeof(struct sha3_256_ctx), GFP_KERNEL);
 	if (!sdesc) {
 		ret = -ENOMEM;
 		goto err;
 	}
 
-	sdesc->tfm = hash;
-	crypto_shash_init(sdesc);
+	sha3_256_init(sdesc);
 	rng->sdesc = sdesc;
 
 	rng->entropy_collector =
@@ -334,23 +298,15 @@ static struct rng_alg jent_alg = {
 
 static int __init jent_mod_init(void)
 {
-	SHASH_DESC_ON_STACK(desc, tfm);
-	struct crypto_shash *tfm;
+	struct sha3_256_ctx desc;
 	int ret = 0;
 
 	jent_testing_init();
 
-	tfm = crypto_alloc_shash(JENT_CONDITIONING_HASH, 0, 0);
-	if (IS_ERR(tfm)) {
-		jent_testing_exit();
-		return PTR_ERR(tfm);
-	}
+	sha3_256_init(&desc);
 
-	desc->tfm = tfm;
-	crypto_shash_init(desc);
-	ret = jent_entropy_init(CONFIG_CRYPTO_JITTERENTROPY_OSR, 0, desc, NULL);
-	shash_desc_zero(desc);
-	crypto_free_shash(tfm);
+	ret = jent_entropy_init(CONFIG_CRYPTO_JITTERENTROPY_OSR, 0, &desc, NULL);
+	memzero_explicit(&desc, sizeof(desc));
 	if (ret) {
 		/* Handle permanent health test error */
 		if (fips_enabled)
diff --git a/crypto/jitterentropy.c b/crypto/jitterentropy.c
index 3f93cdc9a7af..36701447cc85 100644
--- a/crypto/jitterentropy.c
+++ b/crypto/jitterentropy.c
@@ -68,7 +68,7 @@ struct rand_data {
 	 * of the RNG are marked as SENSITIVE. A user must not
 	 * access that information while the RNG executes its loops to
 	 * calculate the next random value. */
-	void *hash_state;		/* SENSITIVE hash state entropy pool */
+	struct sha3_256_ctx *hash_state; /* SENSITIVE hash state entropy pool */
 	__u64 prev_time;		/* SENSITIVE Previous time stamp */
 	__u64 last_delta;		/* SENSITIVE stuck test */
 	__s64 last_delta2;		/* SENSITIVE stuck test */
@@ -656,7 +656,7 @@ int jent_read_entropy(struct rand_data *ec, unsigned char *data,
 
 struct rand_data *jent_entropy_collector_alloc(unsigned int osr,
 					       unsigned int flags,
-					       void *hash_state)
+					       struct sha3_256_ctx *hash_state)
 {
 	struct rand_data *entropy_collector;
 
@@ -704,7 +704,8 @@ void jent_entropy_collector_free(struct rand_data *entropy_collector)
 	jent_zfree(entropy_collector);
 }
 
-int jent_entropy_init(unsigned int osr, unsigned int flags, void *hash_state,
+int jent_entropy_init(unsigned int osr, unsigned int flags,
+		      struct sha3_256_ctx *hash_state,
 		      struct rand_data *p_ec)
 {
 	/*
diff --git a/crypto/jitterentropy.h b/crypto/jitterentropy.h
index 4c5dbf2a8d8f..e4acbce79d9d 100644
--- a/crypto/jitterentropy.h
+++ b/crypto/jitterentropy.h
@@ -5,20 +5,20 @@ extern void jent_kvzfree(void *ptr, unsigned int len);
 extern void *jent_zalloc(unsigned int len);
 extern void jent_zfree(void *ptr);
 extern void jent_get_nstime(__u64 *out);
-extern int jent_hash_time(void *hash_state, __u64 time, u8 *addtl,
+extern int jent_hash_time(struct sha3_256_ctx *hash_state, __u64 time, u8 *addtl,
 			  unsigned int addtl_len, __u64 hash_loop_cnt,
 			  unsigned int stuck);
-int jent_read_random_block(void *hash_state, char *dst, unsigned int dst_len);
+int jent_read_random_block(struct sha3_256_ctx *hash_state, char *dst, unsigned int dst_len);
 
 struct rand_data;
 extern int jent_entropy_init(unsigned int osr, unsigned int flags,
-			     void *hash_state, struct rand_data *p_ec);
+			     struct sha3_256_ctx *hash_state, struct rand_data *p_ec);
 extern int jent_read_entropy(struct rand_data *ec, unsigned char *data,
 			     unsigned int len);
 
 extern struct rand_data *jent_entropy_collector_alloc(unsigned int osr,
 						      unsigned int flags,
-						      void *hash_state);
+						      struct sha3_256_ctx *hash_state);
 extern void jent_entropy_collector_free(struct rand_data *entropy_collector);
 
 #ifdef CONFIG_CRYPTO_JITTERENTROPY_TESTINTERFACE


