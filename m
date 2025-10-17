Return-Path: <keyrings+bounces-3233-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B3666BE9458
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 16:45:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 408E035B867
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 14:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D2E336EF3;
	Fri, 17 Oct 2025 14:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LP64E7rT"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC2C336EDD
	for <keyrings@vger.kernel.org>; Fri, 17 Oct 2025 14:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712248; cv=none; b=V7GfS2eSRe3SllFNH9BFbdedPlexTK8TkGgNcvNqCWTH2/NaTslLEH8OnfEXR7zWsjX9iNxaaVxoTTdNeGkc/LEO/N33GQqsysJ53VFkNJSnNKYp9DnDjNm6o4Kkg03r6+C0GsuKa/iPA6YftXC8G8ywDM1WWK48+EJNmo8z/v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712248; c=relaxed/simple;
	bh=rPzf4DkKighfk1WHQplar67LvnwZxS+6imEvZVmWBrg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ttadi6QRH4AcqBlHb4yDPSNQZOwv5fK0GZXI9lSvj/kDWqEHLnkQYRHB8I83iOUs/3Kav6Cpwp8omFBtiTDhtSPjtkRv0qY0d3D5p0bfR9CKQELtETI4JdVgrpVKduEmhMi5X850rVNmZdjs8K52uwBYrL29u4m+ShfZx7yYdWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LP64E7rT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760712244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KuQJUaqC6wz9fi8Ml91CCIPnkzbI/rBKpTM+r2EOMLk=;
	b=LP64E7rTEMLE3U+IrHN5Ym+jTAbTNGmraVM3s+e8L1Q6C+J5IYdtzdn/Mybv3QmSjq1W4X
	j4LdVHr21Pmx+pIVbfsig/+leNkGHoeyV0MvoN8UQgVJ8avADXxO35ZvTTUsy/2vndgqk0
	mBIrzsGbh8qwX8KnAExkhTpDy4vQ/GA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-359-Zz32CB11PUOvnAuICh89xQ-1; Fri,
 17 Oct 2025 10:44:01 -0400
X-MC-Unique: Zz32CB11PUOvnAuICh89xQ-1
X-Mimecast-MFC-AGG-ID: Zz32CB11PUOvnAuICh89xQ_1760712239
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C0351800657;
	Fri, 17 Oct 2025 14:43:59 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.57])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A289D1800452;
	Fri, 17 Oct 2025 14:43:55 +0000 (UTC)
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
Subject: [PATCH v6 07/17] crypto/sha3: Use lib/crypto/sha3
Date: Fri, 17 Oct 2025 15:42:51 +0100
Message-ID: <20251017144311.817771-8-dhowells@redhat.com>
In-Reply-To: <20251017144311.817771-1-dhowells@redhat.com>
References: <20251017144311.817771-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Switch crypto/sha3_generic.c to use lib/crypto/sha3.  Note that this makes
use of the internal general API rather implementing a separate set of
init/update/finup handlers for each algorithm.

Whilst we're at it, eliminate the sha3_state struct and move the st[] state
array into the sha3_ctx struct.

Note that this also eliminates the need to set CRYPTO_AHASH_ALG_BLOCK_ONLY
as the lib/crypto/sha3.c code handles misalignment itself without the need
for a place to stash a block at the cost of a few extra bytes of state.
This may mean that HASH_MAX_STATESIZE can be reduced.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Jason A. Donenfeld <Jason@zx2c4.com>
cc: Ard Biesheuvel <ardb@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: Stephan Mueller <smueller@chronox.de>
cc: linux-crypto@vger.kernel.org
---
 Documentation/crypto/sha3.rst    |   8 +-
 arch/arm64/crypto/sha3-ce-glue.c |  25 ++--
 crypto/sha3_generic.c            | 209 ++++---------------------------
 include/crypto/sha3.h            |   6 +-
 lib/crypto/sha3.c                |  35 +++---
 5 files changed, 56 insertions(+), 227 deletions(-)

diff --git a/Documentation/crypto/sha3.rst b/Documentation/crypto/sha3.rst
index 3255618ea2ec..69d375567b94 100644
--- a/Documentation/crypto/sha3.rst
+++ b/Documentation/crypto/sha3.rst
@@ -151,7 +151,7 @@ further algorithms or APIs as the engine in the same in all cases.  The
 algorithm APIs all wrap the common context structure::
 
 	struct sha3_ctx {
-		struct sha3_state	state;
+		u64			st[SHA3_STATE_SIZE / 8];
 		u8			block_size;
 		u8			padding;
 		u8			absorb_offset;
@@ -159,13 +159,9 @@ algorithm APIs all wrap the common context structure::
 		bool			end_marked;
 	};
 
-	struct sha3_state {
-		u64			st[SHA3_STATE_SIZE / 8];
-	};
-
 The fields are as follows:
 
- * ``state.st``
+ * ``st``
 
    An array of 25 64-bit state buckets that are used to hold the mathematical
    state of the Keccak engine.  Data is XOR'd onto part of this, the engine is
diff --git a/arch/arm64/crypto/sha3-ce-glue.c b/arch/arm64/crypto/sha3-ce-glue.c
index 426d8044535a..1f05cc328e11 100644
--- a/arch/arm64/crypto/sha3-ce-glue.c
+++ b/arch/arm64/crypto/sha3-ce-glue.c
@@ -28,13 +28,18 @@ MODULE_ALIAS_CRYPTO("sha3-256");
 MODULE_ALIAS_CRYPTO("sha3-384");
 MODULE_ALIAS_CRYPTO("sha3-512");
 
+static struct sha3_ctx *crypto_sha3_desc(struct shash_desc *desc)
+{
+	return shash_desc_ctx(desc);
+}
+
 asmlinkage int sha3_ce_transform(u64 *st, const u8 *data, int blocks,
 				 int md_len);
 
 static int arm64_sha3_update(struct shash_desc *desc, const u8 *data,
 		       unsigned int len)
 {
-	struct sha3_state *sctx = shash_desc_ctx(desc);
+	struct sha3_ctx *ctx = crypto_sha3_desc(desc);
 	struct crypto_shash *tfm = desc->tfm;
 	unsigned int bs, ds;
 	int blocks;
@@ -47,7 +52,7 @@ static int arm64_sha3_update(struct shash_desc *desc, const u8 *data,
 		int rem;
 
 		kernel_neon_begin();
-		rem = sha3_ce_transform(sctx->st, data, blocks, ds);
+		rem = sha3_ce_transform(ctx->st, data, blocks, ds);
 		kernel_neon_end();
 		data += (blocks - rem) * bs;
 		blocks = rem;
@@ -58,7 +63,7 @@ static int arm64_sha3_update(struct shash_desc *desc, const u8 *data,
 static int arm64_sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int len,
 			    u8 *out)
 {
-	struct sha3_state *sctx = shash_desc_ctx(desc);
+	struct sha3_ctx *ctx = crypto_sha3_desc(desc);
 	struct crypto_shash *tfm = desc->tfm;
 	__le64 *digest = (__le64 *)out;
 	u8 block[SHA3_224_BLOCK_SIZE];
@@ -74,15 +79,15 @@ static int arm64_sha3_finup(struct shash_desc *desc, const u8 *src, unsigned int
 	block[bs - 1] |= 0x80;
 
 	kernel_neon_begin();
-	sha3_ce_transform(sctx->st, block, 1, ds);
+	sha3_ce_transform(ctx->st, block, 1, ds);
 	kernel_neon_end();
 	memzero_explicit(block , sizeof(block));
 
 	for (i = 0; i < ds / 8; i++)
-		put_unaligned_le64(sctx->st[i], digest++);
+		put_unaligned_le64(ctx->st[i], digest++);
 
 	if (ds & 4)
-		put_unaligned_le32(sctx->st[i], (__le32 *)digest);
+		put_unaligned_le32(ctx->st[i], (__le32 *)digest);
 
 	return 0;
 }
@@ -92,7 +97,7 @@ static struct shash_alg algs[] = { {
 	.init			= crypto_sha3_init,
 	.update			= arm64_sha3_update,
 	.finup			= arm64_sha3_finup,
-	.descsize		= SHA3_STATE_SIZE,
+	.descsize		= sizeof(struct sha3_ctx),
 	.base.cra_name		= "sha3-224",
 	.base.cra_driver_name	= "sha3-224-ce",
 	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
@@ -104,7 +109,7 @@ static struct shash_alg algs[] = { {
 	.init			= crypto_sha3_init,
 	.update			= arm64_sha3_update,
 	.finup			= arm64_sha3_finup,
-	.descsize		= SHA3_STATE_SIZE,
+	.descsize		= sizeof(struct sha3_ctx),
 	.base.cra_name		= "sha3-256",
 	.base.cra_driver_name	= "sha3-256-ce",
 	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
@@ -116,7 +121,7 @@ static struct shash_alg algs[] = { {
 	.init			= crypto_sha3_init,
 	.update			= arm64_sha3_update,
 	.finup			= arm64_sha3_finup,
-	.descsize		= SHA3_STATE_SIZE,
+	.descsize		= sizeof(struct sha3_ctx),
 	.base.cra_name		= "sha3-384",
 	.base.cra_driver_name	= "sha3-384-ce",
 	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
@@ -128,7 +133,7 @@ static struct shash_alg algs[] = { {
 	.init			= crypto_sha3_init,
 	.update			= arm64_sha3_update,
 	.finup			= arm64_sha3_finup,
-	.descsize		= SHA3_STATE_SIZE,
+	.descsize		= sizeof(struct sha3_ctx),
 	.base.cra_name		= "sha3-512",
 	.base.cra_driver_name	= "sha3-512-ce",
 	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
diff --git a/crypto/sha3_generic.c b/crypto/sha3_generic.c
index 41d1e506e6de..7b16e4c27fc8 100644
--- a/crypto/sha3_generic.c
+++ b/crypto/sha3_generic.c
@@ -13,156 +13,19 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
-#include <linux/unaligned.h>
 
-/*
- * On some 32-bit architectures (h8300), GCC ends up using
- * over 1 KB of stack if we inline the round calculation into the loop
- * in keccakf(). On the other hand, on 64-bit architectures with plenty
- * of [64-bit wide] general purpose registers, not inlining it severely
- * hurts performance. So let's use 64-bitness as a heuristic to decide
- * whether to inline or not.
- */
-#ifdef CONFIG_64BIT
-#define SHA3_INLINE	inline
-#else
-#define SHA3_INLINE	noinline
-#endif
-
-#define KECCAK_ROUNDS 24
-
-static const u64 keccakf_rndc[24] = {
-	0x0000000000000001ULL, 0x0000000000008082ULL, 0x800000000000808aULL,
-	0x8000000080008000ULL, 0x000000000000808bULL, 0x0000000080000001ULL,
-	0x8000000080008081ULL, 0x8000000000008009ULL, 0x000000000000008aULL,
-	0x0000000000000088ULL, 0x0000000080008009ULL, 0x000000008000000aULL,
-	0x000000008000808bULL, 0x800000000000008bULL, 0x8000000000008089ULL,
-	0x8000000000008003ULL, 0x8000000000008002ULL, 0x8000000000000080ULL,
-	0x000000000000800aULL, 0x800000008000000aULL, 0x8000000080008081ULL,
-	0x8000000000008080ULL, 0x0000000080000001ULL, 0x8000000080008008ULL
-};
-
-/* update the state with given number of rounds */
-
-static SHA3_INLINE void keccakf_round(u64 st[25])
-{
-	u64 t[5], tt, bc[5];
-
-	/* Theta */
-	bc[0] = st[0] ^ st[5] ^ st[10] ^ st[15] ^ st[20];
-	bc[1] = st[1] ^ st[6] ^ st[11] ^ st[16] ^ st[21];
-	bc[2] = st[2] ^ st[7] ^ st[12] ^ st[17] ^ st[22];
-	bc[3] = st[3] ^ st[8] ^ st[13] ^ st[18] ^ st[23];
-	bc[4] = st[4] ^ st[9] ^ st[14] ^ st[19] ^ st[24];
-
-	t[0] = bc[4] ^ rol64(bc[1], 1);
-	t[1] = bc[0] ^ rol64(bc[2], 1);
-	t[2] = bc[1] ^ rol64(bc[3], 1);
-	t[3] = bc[2] ^ rol64(bc[4], 1);
-	t[4] = bc[3] ^ rol64(bc[0], 1);
-
-	st[0] ^= t[0];
-
-	/* Rho Pi */
-	tt = st[1];
-	st[ 1] = rol64(st[ 6] ^ t[1], 44);
-	st[ 6] = rol64(st[ 9] ^ t[4], 20);
-	st[ 9] = rol64(st[22] ^ t[2], 61);
-	st[22] = rol64(st[14] ^ t[4], 39);
-	st[14] = rol64(st[20] ^ t[0], 18);
-	st[20] = rol64(st[ 2] ^ t[2], 62);
-	st[ 2] = rol64(st[12] ^ t[2], 43);
-	st[12] = rol64(st[13] ^ t[3], 25);
-	st[13] = rol64(st[19] ^ t[4],  8);
-	st[19] = rol64(st[23] ^ t[3], 56);
-	st[23] = rol64(st[15] ^ t[0], 41);
-	st[15] = rol64(st[ 4] ^ t[4], 27);
-	st[ 4] = rol64(st[24] ^ t[4], 14);
-	st[24] = rol64(st[21] ^ t[1],  2);
-	st[21] = rol64(st[ 8] ^ t[3], 55);
-	st[ 8] = rol64(st[16] ^ t[1], 45);
-	st[16] = rol64(st[ 5] ^ t[0], 36);
-	st[ 5] = rol64(st[ 3] ^ t[3], 28);
-	st[ 3] = rol64(st[18] ^ t[3], 21);
-	st[18] = rol64(st[17] ^ t[2], 15);
-	st[17] = rol64(st[11] ^ t[1], 10);
-	st[11] = rol64(st[ 7] ^ t[2],  6);
-	st[ 7] = rol64(st[10] ^ t[0],  3);
-	st[10] = rol64(    tt ^ t[1],  1);
-
-	/* Chi */
-	bc[ 0] = ~st[ 1] & st[ 2];
-	bc[ 1] = ~st[ 2] & st[ 3];
-	bc[ 2] = ~st[ 3] & st[ 4];
-	bc[ 3] = ~st[ 4] & st[ 0];
-	bc[ 4] = ~st[ 0] & st[ 1];
-	st[ 0] ^= bc[ 0];
-	st[ 1] ^= bc[ 1];
-	st[ 2] ^= bc[ 2];
-	st[ 3] ^= bc[ 3];
-	st[ 4] ^= bc[ 4];
-
-	bc[ 0] = ~st[ 6] & st[ 7];
-	bc[ 1] = ~st[ 7] & st[ 8];
-	bc[ 2] = ~st[ 8] & st[ 9];
-	bc[ 3] = ~st[ 9] & st[ 5];
-	bc[ 4] = ~st[ 5] & st[ 6];
-	st[ 5] ^= bc[ 0];
-	st[ 6] ^= bc[ 1];
-	st[ 7] ^= bc[ 2];
-	st[ 8] ^= bc[ 3];
-	st[ 9] ^= bc[ 4];
-
-	bc[ 0] = ~st[11] & st[12];
-	bc[ 1] = ~st[12] & st[13];
-	bc[ 2] = ~st[13] & st[14];
-	bc[ 3] = ~st[14] & st[10];
-	bc[ 4] = ~st[10] & st[11];
-	st[10] ^= bc[ 0];
-	st[11] ^= bc[ 1];
-	st[12] ^= bc[ 2];
-	st[13] ^= bc[ 3];
-	st[14] ^= bc[ 4];
-
-	bc[ 0] = ~st[16] & st[17];
-	bc[ 1] = ~st[17] & st[18];
-	bc[ 2] = ~st[18] & st[19];
-	bc[ 3] = ~st[19] & st[15];
-	bc[ 4] = ~st[15] & st[16];
-	st[15] ^= bc[ 0];
-	st[16] ^= bc[ 1];
-	st[17] ^= bc[ 2];
-	st[18] ^= bc[ 3];
-	st[19] ^= bc[ 4];
-
-	bc[ 0] = ~st[21] & st[22];
-	bc[ 1] = ~st[22] & st[23];
-	bc[ 2] = ~st[23] & st[24];
-	bc[ 3] = ~st[24] & st[20];
-	bc[ 4] = ~st[20] & st[21];
-	st[20] ^= bc[ 0];
-	st[21] ^= bc[ 1];
-	st[22] ^= bc[ 2];
-	st[23] ^= bc[ 3];
-	st[24] ^= bc[ 4];
-}
-
-static void keccakf(u64 st[25])
+static struct sha3_ctx *crypto_sha3_desc(struct shash_desc *desc)
 {
-	int round;
-
-	for (round = 0; round < KECCAK_ROUNDS; round++) {
-		keccakf_round(st);
-		/* Iota */
-		st[0] ^= keccakf_rndc[round];
-	}
+	return shash_desc_ctx(desc);
 }
 
 int crypto_sha3_init(struct shash_desc *desc)
 {
-	struct sha3_state *sctx = shash_desc_ctx(desc);
+	struct sha3_ctx *ctx = crypto_sha3_desc(desc);
 
-	memset(sctx->st, 0, sizeof(sctx->st));
+	memset(ctx, 0, sizeof(*ctx));
+	ctx->block_size = crypto_shash_blocksize(desc->tfm);
+	ctx->padding = 0x06;
 	return 0;
 }
 EXPORT_SYMBOL(crypto_sha3_init);
@@ -170,51 +33,21 @@ EXPORT_SYMBOL(crypto_sha3_init);
 static int crypto_sha3_update(struct shash_desc *desc, const u8 *data,
 			      unsigned int len)
 {
-	unsigned int rsiz = crypto_shash_blocksize(desc->tfm);
-	struct sha3_state *sctx = shash_desc_ctx(desc);
-	unsigned int rsizw = rsiz / 8;
-
-	do {
-		int i;
+	struct sha3_ctx *ctx = crypto_sha3_desc(desc);
 
-		for (i = 0; i < rsizw; i++)
-			sctx->st[i] ^= get_unaligned_le64(data + 8 * i);
-		keccakf(sctx->st);
-
-		data += rsiz;
-		len -= rsiz;
-	} while (len >= rsiz);
+	sha3_update(ctx, data, len);
 	return len;
 }
 
 static int crypto_sha3_finup(struct shash_desc *desc, const u8 *src,
 			     unsigned int len, u8 *out)
 {
-	unsigned int digest_size = crypto_shash_digestsize(desc->tfm);
-	unsigned int rsiz = crypto_shash_blocksize(desc->tfm);
-	struct sha3_state *sctx = shash_desc_ctx(desc);
-	__le64 block[SHA3_224_BLOCK_SIZE / 8] = {};
-	__le64 *digest = (__le64 *)out;
-	unsigned int rsizw = rsiz / 8;
-	u8 *p;
-	int i;
-
-	p = memcpy(block, src, len);
-	p[len++] = 0x06;
-	p[rsiz - 1] |= 0x80;
-
-	for (i = 0; i < rsizw; i++)
-		sctx->st[i] ^= le64_to_cpu(block[i]);
-	memzero_explicit(block, sizeof(block));
-
-	keccakf(sctx->st);
-
-	for (i = 0; i < digest_size / 8; i++)
-		put_unaligned_le64(sctx->st[i], digest++);
-
-	if (digest_size & 4)
-		put_unaligned_le32(sctx->st[i], (__le32 *)digest);
+	struct sha3_ctx *ctx = crypto_sha3_desc(desc);
 
+	if (len && src)
+		sha3_update(ctx, src, len);
+	sha3_squeeze(ctx, out, crypto_shash_digestsize(desc->tfm));
+	sha3_clear(ctx);
 	return 0;
 }
 
@@ -223,10 +56,10 @@ static struct shash_alg algs[] = { {
 	.init			= crypto_sha3_init,
 	.update			= crypto_sha3_update,
 	.finup			= crypto_sha3_finup,
-	.descsize		= SHA3_STATE_SIZE,
+	.descsize		= sizeof(struct sha3_ctx),
 	.base.cra_name		= "sha3-224",
 	.base.cra_driver_name	= "sha3-224-generic",
-	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
+	.base.cra_flags		= 0,
 	.base.cra_blocksize	= SHA3_224_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
 }, {
@@ -234,10 +67,10 @@ static struct shash_alg algs[] = { {
 	.init			= crypto_sha3_init,
 	.update			= crypto_sha3_update,
 	.finup			= crypto_sha3_finup,
-	.descsize		= SHA3_STATE_SIZE,
+	.descsize		= sizeof(struct sha3_ctx),
 	.base.cra_name		= "sha3-256",
 	.base.cra_driver_name	= "sha3-256-generic",
-	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
+	.base.cra_flags		= 0,
 	.base.cra_blocksize	= SHA3_256_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
 }, {
@@ -245,10 +78,10 @@ static struct shash_alg algs[] = { {
 	.init			= crypto_sha3_init,
 	.update			= crypto_sha3_update,
 	.finup			= crypto_sha3_finup,
-	.descsize		= SHA3_STATE_SIZE,
+	.descsize		= sizeof(struct sha3_ctx),
 	.base.cra_name		= "sha3-384",
 	.base.cra_driver_name	= "sha3-384-generic",
-	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
+	.base.cra_flags		= 0,
 	.base.cra_blocksize	= SHA3_384_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
 }, {
@@ -256,10 +89,10 @@ static struct shash_alg algs[] = { {
 	.init			= crypto_sha3_init,
 	.update			= crypto_sha3_update,
 	.finup			= crypto_sha3_finup,
-	.descsize		= SHA3_STATE_SIZE,
+	.descsize		= sizeof(struct sha3_ctx),
 	.base.cra_name		= "sha3-512",
 	.base.cra_driver_name	= "sha3-512-generic",
-	.base.cra_flags		= CRYPTO_AHASH_ALG_BLOCK_ONLY,
+	.base.cra_flags		= 0,
 	.base.cra_blocksize	= SHA3_512_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
 } };
diff --git a/include/crypto/sha3.h b/include/crypto/sha3.h
index a54117cb1546..7e845dde55ac 100644
--- a/include/crypto/sha3.h
+++ b/include/crypto/sha3.h
@@ -38,10 +38,6 @@
 
 struct shash_desc;
 
-struct sha3_state {
-	u64		st[SHA3_STATE_SIZE / 8];
-};
-
 /*
  * The SHA3 context structure and state buffer.
  *
@@ -52,7 +48,7 @@ struct sha3_state {
  * byteswap step is a no-op.
  */
 struct sha3_ctx {
-	struct sha3_state	state;
+	u64			st[SHA3_STATE_SIZE / 8];
 	u8			block_size;	/* Block size in bytes */
 	u8			padding;	/* Padding byte */
 	u8			absorb_offset;	/* Next state byte to absorb into */
diff --git a/lib/crypto/sha3.c b/lib/crypto/sha3.c
index 2c292b0b3db3..911b2c35dbc4 100644
--- a/lib/crypto/sha3.c
+++ b/lib/crypto/sha3.c
@@ -48,10 +48,10 @@ static const u64 sha3_keccakf_rndc[24] = {
 /*
  * Perform a single round of Keccak mixing.
  */
-static SHA3_INLINE void sha3_keccakf_one_round_generic(struct sha3_state *state,
+static SHA3_INLINE void sha3_keccakf_one_round_generic(struct sha3_ctx *ctx,
 						       int round)
 {
-	u64 *st = state->st;
+	u64 *st = ctx->st;
 	u64 t[5], tt, bc[5];
 
 	/* Theta */
@@ -153,13 +153,13 @@ static SHA3_INLINE void sha3_keccakf_one_round_generic(struct sha3_state *state,
 	st[24] ^= bc[ 4];
 
 	/* Iota */
-	state->st[0] ^= sha3_keccakf_rndc[round];
+	ctx->st[0] ^= sha3_keccakf_rndc[round];
 }
 
-static void sha3_keccakf_rounds_generic(struct sha3_state *state)
+static void sha3_keccakf_rounds_generic(struct sha3_ctx *ctx)
 {
 	for (int round = 0; round < SHA3_KECCAK_ROUNDS; round++)
-		sha3_keccakf_one_round_generic(state, round);
+		sha3_keccakf_one_round_generic(ctx, round);
 }
 
 /*
@@ -167,25 +167,24 @@ static void sha3_keccakf_rounds_generic(struct sha3_state *state)
  * machine for the duration of the Keccak mixing function.  Note that these
  * loops are no-ops on LE machines and will be optimised away.
  */
-static void sha3_keccakf_generic(struct sha3_state *state)
+static void sha3_keccakf_generic(struct sha3_ctx *ctx)
 {
-	for (int  i = 0; i < ARRAY_SIZE(state->st); i++)
-		cpu_to_le64s(&state->st[i]);
+	for (int  i = 0; i < ARRAY_SIZE(ctx->st); i++)
+		cpu_to_le64s(&ctx->st[i]);
 
-	sha3_keccakf_rounds_generic(state);
+	sha3_keccakf_rounds_generic(ctx);
 
-	for (int  i = 0; i < ARRAY_SIZE(state->st); i++)
-		le64_to_cpus(&state->st[i]);
+	for (int  i = 0; i < ARRAY_SIZE(ctx->st); i++)
+		le64_to_cpus(&ctx->st[i]);
 }
 
 static void sha3_absorb_block_generic(struct sha3_ctx *ctx, const u8 *data)
 {
-	struct sha3_state *state = &ctx->state;
 	size_t bsize = ctx->block_size;
 
 	for (size_t i = 0; i < bsize / 8; i++)
-		state->st[i] ^= get_unaligned((u64 *)(data + 8 * i));
-	sha3_keccakf_generic(state);
+		ctx->st[i] ^= get_unaligned((u64 *)(data + 8 * i));
+	sha3_keccakf_generic(ctx);
 }
 
 /*
@@ -214,7 +213,7 @@ static void sha3_absorb_blocks_generic(struct sha3_ctx *ctx,
 static void sha3_absorb_xorle(struct sha3_ctx *ctx, const u8 *data,
 			      size_t partial, size_t len)
 {
-	u8 *buf = (u8 *)ctx->state.st;
+	u8 *buf = (u8 *)ctx->st;
 
 	buf += partial;
 	for (size_t i = 0; i < len; i++)
@@ -243,7 +242,7 @@ void sha3_update(struct sha3_ctx *ctx, const u8 *data, size_t len)
 		sha3_absorb_xorle(ctx, data, absorb_offset, bsize - absorb_offset);
 		len  -= bsize - absorb_offset;
 		data += bsize - absorb_offset;
-		sha3_keccakf(&ctx->state);
+		sha3_keccakf(ctx);
 		ctx->absorb_offset = 0;
 	}
 
@@ -282,7 +281,7 @@ void sha3_squeeze(struct sha3_ctx *ctx, u8 *out, size_t out_size)
 {
 	size_t squeeze_offset = ctx->squeeze_offset;
 	size_t bsize = ctx->block_size;
-	u8 *p = (u8 *)ctx->state.st, end_marker = 0x80;
+	u8 *p = (u8 *)ctx->st, end_marker = 0x80;
 
 	if (!ctx->end_marked) {
 		sha3_absorb_xorle(ctx, &ctx->padding, ctx->absorb_offset, 1);
@@ -292,7 +291,7 @@ void sha3_squeeze(struct sha3_ctx *ctx, u8 *out, size_t out_size)
 
 	for (;;) {
 		if (squeeze_offset == 0)
-			sha3_keccakf(&ctx->state);
+			sha3_keccakf(ctx);
 
 		size_t part = umin(out_size, bsize - squeeze_offset);
 


