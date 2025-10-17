Return-Path: <keyrings+bounces-3237-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 121B3BE94AB
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 16:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 608CF1AA57C5
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 14:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D7C33508C;
	Fri, 17 Oct 2025 14:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iuZ75zxS"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64478369998
	for <keyrings@vger.kernel.org>; Fri, 17 Oct 2025 14:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712275; cv=none; b=Y5FY8DDN0dbgaGHDF18eDq6u46BEWGPHV8uW72fm49+FSqn2R2tBD0tOBrxWzofPZScTgLvQ+ONz579n1518fcIsMDa+QzeN/pFVy13Kwy84PuCK3ZwKHGMN2nEqNgQUs30+mAp2rsCvPVPy+unybHBu1sKgcMT3AFR+BmIM3Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712275; c=relaxed/simple;
	bh=+i64/t1LdXmq0ewwasM18vHc4f6jlXaPMhKxYMF6qbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O2dvyqgVYZhTQ49qQ/Na2ISxKwX2LQ6d9YgtUdd8PvZAQeUsduNZIFsyPo/M4ZP8sPA1yhAyUDEOt+z8IVDCeaoR1Xtz9fCEvo0eTWVCtT5/grnL2evLrrfjNnY6GMDyvmqnOPX5OU6ynI0ORKYkwaqljWfOiymPlLw8jq4p/cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iuZ75zxS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760712262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AS+R/im7ssFi7PmuGHOQuD6aS8euvtzHDTE59LQMx0Y=;
	b=iuZ75zxSg/64fF4u0aoPgocosXdwl5cmx4KVcOblQr2MhMYXrwRBvtW4fL7iU0FU8Q1AHS
	9GTlmjWOI7tzothxuOcbTkJwpmNgwlvNWxNZosI82rEJOnLfaXD/3/3zy8n0V6BASZ0LaU
	8q1MjYKZ239RQ7t7kZkk3hJtHi+7iKE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-65-H9DpVF2lO5eA6zl0nPVfyA-1; Fri,
 17 Oct 2025 10:44:17 -0400
X-MC-Unique: H9DpVF2lO5eA6zl0nPVfyA-1
X-Mimecast-MFC-AGG-ID: H9DpVF2lO5eA6zl0nPVfyA_1760712255
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6FF97180035A;
	Fri, 17 Oct 2025 14:44:15 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.57])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EF4DE19560AD;
	Fri, 17 Oct 2025 14:44:10 +0000 (UTC)
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
Subject: [PATCH v6 10/17] crypto: Add ML-DSA/Dilithium support
Date: Fri, 17 Oct 2025 15:42:54 +0100
Message-ID: <20251017144311.817771-11-dhowells@redhat.com>
In-Reply-To: <20251017144311.817771-1-dhowells@redhat.com>
References: <20251017144311.817771-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Port Stephan Mueller's Leancrypto implementation of ML-DSA/Dilithium to the
kernel.

[!] NOTE: This isn't entirely cleaned up yet!  This includes converting the
documentation comments and removing more compatibility macros.  I wanted to
concentrate on getting it actually working first.

Apologies to Stephan, but I've stripped out a bunch of macros to do return
checking and suchlike and removed a bunch of "lc_" prefixes from the code.

The code retains the following features, some of which probably need to
be separated out or dropped entirely:

 - Signature verification
 - Signing
 - Prehash support
 - External Mu support

Composite signature support is mostly removed and none of the arch-specific
code from Leancrypto has been included for the moment, so this is pure C.

The interface to this code is through the crypto_sig API as the PKCS#7 code
wants to use that rather than calling it directly.  As such, I've placed it
in crypto/ rather than lib/crypto/.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Jason A. Donenfeld <Jason@zx2c4.com>
cc: Ard Biesheuvel <ardb@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: linux-crypto@vger.kernel.org
---
 crypto/Kconfig                              |   1 +
 crypto/Makefile                             |   1 +
 crypto/ml_dsa/Kconfig                       |  17 +
 crypto/ml_dsa/Makefile                      |  18 +
 crypto/ml_dsa/dilithium.h                   | 750 ++++++++++++++++++
 crypto/ml_dsa/dilithium_44.c                |  33 +
 crypto/ml_dsa/dilithium_44.h                | 377 +++++++++
 crypto/ml_dsa/dilithium_65.c                |  33 +
 crypto/ml_dsa/dilithium_65.h                | 377 +++++++++
 crypto/ml_dsa/dilithium_87.c                |  33 +
 crypto/ml_dsa/dilithium_87.h                | 377 +++++++++
 crypto/ml_dsa/dilithium_api.c               | 729 +++++++++++++++++
 crypto/ml_dsa/dilithium_debug.h             |  80 ++
 crypto/ml_dsa/dilithium_ntt.c               |  89 +++
 crypto/ml_dsa/dilithium_ntt.h               |  35 +
 crypto/ml_dsa/dilithium_pack.h              | 210 +++++
 crypto/ml_dsa/dilithium_poly.c              | 586 ++++++++++++++
 crypto/ml_dsa/dilithium_poly.h              | 190 +++++
 crypto/ml_dsa/dilithium_poly_c.h            | 149 ++++
 crypto/ml_dsa/dilithium_poly_common.h       |  35 +
 crypto/ml_dsa/dilithium_polyvec.h           | 343 ++++++++
 crypto/ml_dsa/dilithium_polyvec_c.h         |  94 +++
 crypto/ml_dsa/dilithium_reduce.h            | 108 +++
 crypto/ml_dsa/dilithium_rounding.c          | 128 +++
 crypto/ml_dsa/dilithium_rounding.h          |  45 ++
 crypto/ml_dsa/dilithium_service_helpers.h   |  99 +++
 crypto/ml_dsa/dilithium_sig.c               | 404 ++++++++++
 crypto/ml_dsa/dilithium_signature_c.c       | 174 ++++
 crypto/ml_dsa/dilithium_signature_c.h       |  53 ++
 crypto/ml_dsa/dilithium_signature_helper.c  | 110 +++
 crypto/ml_dsa/dilithium_signature_impl.h    | 838 ++++++++++++++++++++
 crypto/ml_dsa/dilithium_type.h              | 259 ++++++
 crypto/ml_dsa/dilithium_zetas.c             |  67 ++
 crypto/ml_dsa/fips_mode.h                   |  45 ++
 crypto/ml_dsa/signature_domain_separation.c | 213 +++++
 crypto/ml_dsa/signature_domain_separation.h |  33 +
 crypto/ml_dsa/small_stack_support.h         |  40 +
 37 files changed, 7173 insertions(+)
 create mode 100644 crypto/ml_dsa/Kconfig
 create mode 100644 crypto/ml_dsa/Makefile
 create mode 100644 crypto/ml_dsa/dilithium.h
 create mode 100644 crypto/ml_dsa/dilithium_44.c
 create mode 100644 crypto/ml_dsa/dilithium_44.h
 create mode 100644 crypto/ml_dsa/dilithium_65.c
 create mode 100644 crypto/ml_dsa/dilithium_65.h
 create mode 100644 crypto/ml_dsa/dilithium_87.c
 create mode 100644 crypto/ml_dsa/dilithium_87.h
 create mode 100644 crypto/ml_dsa/dilithium_api.c
 create mode 100644 crypto/ml_dsa/dilithium_debug.h
 create mode 100644 crypto/ml_dsa/dilithium_ntt.c
 create mode 100644 crypto/ml_dsa/dilithium_ntt.h
 create mode 100644 crypto/ml_dsa/dilithium_pack.h
 create mode 100644 crypto/ml_dsa/dilithium_poly.c
 create mode 100644 crypto/ml_dsa/dilithium_poly.h
 create mode 100644 crypto/ml_dsa/dilithium_poly_c.h
 create mode 100644 crypto/ml_dsa/dilithium_poly_common.h
 create mode 100644 crypto/ml_dsa/dilithium_polyvec.h
 create mode 100644 crypto/ml_dsa/dilithium_polyvec_c.h
 create mode 100644 crypto/ml_dsa/dilithium_reduce.h
 create mode 100644 crypto/ml_dsa/dilithium_rounding.c
 create mode 100644 crypto/ml_dsa/dilithium_rounding.h
 create mode 100644 crypto/ml_dsa/dilithium_service_helpers.h
 create mode 100644 crypto/ml_dsa/dilithium_sig.c
 create mode 100644 crypto/ml_dsa/dilithium_signature_c.c
 create mode 100644 crypto/ml_dsa/dilithium_signature_c.h
 create mode 100644 crypto/ml_dsa/dilithium_signature_helper.c
 create mode 100644 crypto/ml_dsa/dilithium_signature_impl.h
 create mode 100644 crypto/ml_dsa/dilithium_type.h
 create mode 100644 crypto/ml_dsa/dilithium_zetas.c
 create mode 100644 crypto/ml_dsa/fips_mode.h
 create mode 100644 crypto/ml_dsa/signature_domain_separation.c
 create mode 100644 crypto/ml_dsa/signature_domain_separation.h
 create mode 100644 crypto/ml_dsa/small_stack_support.h

diff --git a/crypto/Kconfig b/crypto/Kconfig
index a04595f9d0ca..b027460d54b7 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -1451,5 +1451,6 @@ source "drivers/crypto/Kconfig"
 source "crypto/asymmetric_keys/Kconfig"
 source "certs/Kconfig"
 source "crypto/krb5/Kconfig"
+source "crypto/ml_dsa/Kconfig"
 
 endif	# if CRYPTO
diff --git a/crypto/Makefile b/crypto/Makefile
index e430e6e99b6a..ecd1ef79c28c 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -210,3 +210,4 @@ obj-$(CONFIG_CRYPTO_SIMD) += crypto_simd.o
 obj-$(CONFIG_CRYPTO_KDF800108_CTR) += kdf_sp800108.o
 
 obj-$(CONFIG_CRYPTO_KRB5) += krb5/
+obj-$(CONFIG_CRYPTO_ML_DSA) += ml_dsa/
diff --git a/crypto/ml_dsa/Kconfig b/crypto/ml_dsa/Kconfig
new file mode 100644
index 000000000000..cc0567c5b990
--- /dev/null
+++ b/crypto/ml_dsa/Kconfig
@@ -0,0 +1,17 @@
+# SPDX-License-Identifier: GPL-2.0
+menuconfig CRYPTO_ML_DSA
+	tristate "ML-DSA/Dilithium algorithm"
+	select CRYPTO_LIB_SHA3
+
+if CRYPTO_ML_DSA
+
+config CRYPTO_DILITHIUM_44
+	bool "Enable Dilithium-44 support"
+
+config CRYPTO_DILITHIUM_65
+	bool "Enable Dilithium-65 support"
+
+config CRYPTO_DILITHIUM_87
+	bool "Enable Dilithium-87 support"
+
+endif
diff --git a/crypto/ml_dsa/Makefile b/crypto/ml_dsa/Makefile
new file mode 100644
index 000000000000..d420a8ba6033
--- /dev/null
+++ b/crypto/ml_dsa/Makefile
@@ -0,0 +1,18 @@
+################################################################################
+# Signature implementation: Dilithium
+
+################################################################################
+# C Implementation
+################################################################################
+ml_dsa-y += \
+	signature_domain_separation.o \
+	dilithium_api.o \
+	dilithium_zetas.o \
+	dilithium_sig.o \
+	dilithium_signature_helper.o
+
+ml_dsa-$(CONFIG_CRYPTO_DILITHIUM_87) += dilithium_87.o
+ml_dsa-$(CONFIG_CRYPTO_DILITHIUM_65) += dilithium_65.o
+ml_dsa-$(CONFIG_CRYPTO_DILITHIUM_44) += dilithium_44.o
+
+obj-$(CONFIG_CRYPTO_ML_DSA) += ml_dsa.o
diff --git a/crypto/ml_dsa/dilithium.h b/crypto/ml_dsa/dilithium.h
new file mode 100644
index 000000000000..6d4982164201
--- /dev/null
+++ b/crypto/ml_dsa/dilithium.h
@@ -0,0 +1,750 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#ifndef DILITHIUM_H
+#define DILITHIUM_H
+
+#undef pr_fmt
+#define pr_fmt(fmt) "ML-DSA: " fmt
+#include <linux/types.h>
+#include <linux/errno.h>
+#include <linux/string.h>
+#include <crypto/sha2.h>
+#include <crypto/sha3.h>
+#include <crypto/hash.h>
+#include <crypto/rng.h>
+
+#define DILITHIUM_SEEDBYTES 32
+#define DILITHIUM_CRHBYTES 64
+#define DILITHIUM_TRBYTES 64
+#define DILITHIUM_RNDBYTES 32
+#define DILITHIUM_N 256
+#define DILITHIUM_Q 8380417
+#define DILITHIUM_D 13
+#define DILITHIUM_ROOT_OF_UNITY 1753
+
+extern const int32_t dilithium_zetas[DILITHIUM_N];
+#define lc_seeded_rng crypto_default_rng
+
+struct dilithium_ctx {
+	/**
+	 * @brief Hash context used internally to the library - it should not
+	 * be touched by the user
+	 */
+	struct shake256_ctx dilithium_hash_ctx;
+
+	/**
+	 * @brief When using HashML-DSA, set the hash reference used for the
+	 * hash operation. Allowed values are lc_sha256, lc_sha512, lc_sha3_256,
+	 * lc_sha3_384, lc_sha3_512, lc_shake128 and lc_shake256. Note, the
+	 * actual message digest operation can be performed external to
+	 * leancrypto. This parameter only shall indicate the used hash
+	 * operation.
+	 *
+	 * \note Use \p dilithium_ctx_hash or
+	 * \p dilithium_ed25519_ctx_hash to set this value.
+	 */
+	struct crypto_shash *dilithium_prehash_type;
+
+	/**
+	 * @brief length of the user context (allowed range between 0 and 255
+	 * bytes)
+	 *
+	 * \note Use \p dilithium_ctx_userctx or
+	 * \p dilithium_ed25519_ctx_userctx to set this value.
+	 */
+	size_t userctxlen;
+
+	/**
+	 * @brief buffer with a caller-specified context string
+	 *
+	 * \note Use \p dilithium_ctx_userctx or
+	 * \p dilithium_ed25519_ctx_userctx to set this value.
+	 */
+	const uint8_t *userctx;
+
+	/**
+	 * @brief Pointer to the AHat buffer. This can be provided by the caller
+	 * or it must be NULL otherwise.
+	 *
+	 * \note Use \p DILITHIUM_CTX_ON_STACK_AHAT to provide memory for
+	 * storing AHat in the caller context and thus make the signature
+	 * operation much faster starting with the 2nd use of the key (pair).
+	 */
+	void *ahat;
+	unsigned short ahat_size;
+
+	/**
+	 * @brief Pointer to the external mu.
+	 *
+	 * If set, the signature operation will use the provided mu instead of
+	 * the message. In this case, the message pointer to the signature
+	 * generation or verification can be NULL.
+	 */
+	const uint8_t *external_mu;
+	size_t external_mu_len;
+
+	/**
+	 * @brief Pointer to the randomizer
+	 *
+	 * This is used for the Composite signature: For the discussion of the
+	 * randomizer, see https://lamps-wg.github.io/draft-composite-sigs/draft-ietf-lamps-pq-composite-sigs.html
+	 */
+	const uint8_t *randomizer;
+	size_t randomizerlen;
+
+	/**
+	 * @brief NIST category required for composite signatures
+	 *
+	 * The domain separation logic depends on the selection of the right
+	 * OID for the "Domain" data.
+	 */
+	unsigned int nist_category;
+
+	/**
+	 * @brief When set to true, only the ML-DSA.Sign_internal or
+	 * ML-DSA.Verify_internal are performed (see FIPS 204 chapter 6).
+	 * Otherwise the ML-DSA.Sign / ML-DSA.Verify (see FIPS chapter 5) is
+	 * applied.
+	 *
+	 * \note Use \p dilithium_ctx_internal or
+	 * \p dilithium_ed25519_ctx_internal to set this value.
+	 *
+	 * \warning Only set this value to true if you exactly know what you are
+	 * doing!.
+	 */
+	bool ml_dsa_internal:1;
+
+	/**
+	 * @brief Was aHat already filled? This is used and set internally.
+	 */
+	bool ahat_expanded:1;
+} __aligned(CRYPTO_MINALIGN);
+
+static inline void dilithium_hash_init(struct dilithium_ctx *ctx)
+{
+	shake256_init(&ctx->dilithium_hash_ctx);
+}
+
+static inline bool dilithium_hash_check_blocksize(const struct dilithium_ctx *ctx, size_t bsize)
+{
+	return bsize == SHAKE256_BLOCK_SIZE;
+	//return crypto_shash_blocksize(hash_ctx->tfm) == bsize;
+}
+
+static inline bool dilithium_hash_check_digestsize(const struct dilithium_ctx *ctx, size_t dsize)
+{
+	return true;
+	//return crypto_shash_digestsize(hash_ctx->tfm) == dsize;
+}
+
+static inline void dilithium_hash_clear(struct dilithium_ctx *ctx)
+{
+	shake256_clear(&ctx->dilithium_hash_ctx);
+}
+
+static inline void dilithium_hash_update(struct dilithium_ctx *ctx,
+					 const u8 *in, size_t in_size)
+{
+	shake256_update(&ctx->dilithium_hash_ctx, in, in_size);
+}
+
+static inline void dilithium_hash_finup(struct dilithium_ctx *ctx,
+					const u8 *in, size_t in_size,
+					u8 *out, size_t out_size)
+{
+	shake256_update(&ctx->dilithium_hash_ctx, in, in_size);
+	shake256_squeeze(&ctx->dilithium_hash_ctx, out, out_size);
+	shake256_clear(&ctx->dilithium_hash_ctx);
+}
+
+static inline void dilithium_hash_final(struct dilithium_ctx *ctx, u8 *out, size_t out_size)
+{
+	shake256_squeeze(&ctx->dilithium_hash_ctx, out, out_size);
+	shake256_clear(&ctx->dilithium_hash_ctx);
+}
+
+#include "dilithium_87.h"
+#include "dilithium_65.h"
+#include "dilithium_44.h"
+
+enum dilithium_type {
+	DILITHIUM_UNKNOWN,	/** Unknown key type */
+	DILITHIUM_87,		/** Dilithium 87 */
+	DILITHIUM_65,		/** Dilithium 65 */
+	DILITHIUM_44,		/** Dilithium 44 */
+};
+
+/** @defgroup Dilithium ML-DSA / CRYSTALS-Dilithium Signature Mechanism
+ *
+ * \note Although the API uses the term "dilithium", the implementation complies
+ * with FIPS 204. Thus the terms Dilithium and ML-DSA are used interchangeably.
+ *
+ * Dilithium API concept
+ *
+ * The Dilithium API is accessible via the following header files with the
+ * mentioned purpose.
+ *
+ * * dilithium.h: This API is the generic API allowing the caller to select
+ *   which Dilithium type (Dilithium 87, 65 or 44) are to be used. The selection
+ *   is made either with the flag specified during key generation or by matching
+ *   the size of the imported data with the different dilithium_*_load API
+ *   calls. All remaining APIs take the information about the Dilithium type
+ *   from the provided input data.
+ *
+ *   This header file only provides inline functions which selectively call
+ *   the API provided with the header files below.
+ *
+ * * dilithium_87.h: Direct access to Dilithium 87.
+ *
+ * * dilithium_65.h: Direct access to Dilithium 65.
+ *
+ * * dilithium_44.h: Direct access to Dilithium 44.
+ *
+ * To support the stream mode of the Dilithium signature operation, a
+ * context structure is required. This context structure can be allocated either
+ * on the stack or heap with \p DILITHIUM_CTX_ON_STACK or
+ * \p dilithium_ctx_alloc. The context should be zeroized
+ * and freed (only for heap) with \p dilithium_ctx_zero or
+ * \p dilithium_ctx_zero_free.
+ */
+
+/**
+ * @brief Dilithium secret key
+ */
+struct dilithium_sk {
+	enum dilithium_type dilithium_type;
+	union {
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		struct dilithium_87_sk sk_87;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		struct dilithium_65_sk sk_65;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		struct dilithium_44_sk sk_44;
+#endif
+	} key;
+};
+
+/**
+ * @brief Dilithium public key
+ */
+struct dilithium_pk {
+	enum dilithium_type dilithium_type;
+	union {
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		struct dilithium_87_pk pk_87;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		struct dilithium_65_pk pk_65;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		struct dilithium_44_pk pk_44;
+#endif
+	} key;
+};
+
+/**
+ * @brief Dilithium signature
+ */
+struct dilithium_sig {
+	enum dilithium_type dilithium_type;
+	union {
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		struct dilithium_87_sig sig_87;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		struct dilithium_65_sig sig_65;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		struct dilithium_44_sig sig_44;
+#endif
+	} sig;
+};
+
+/**
+ * @ingroup Dilithium
+ * @brief Allocates Dilithium context on heap
+ *
+ * @param [out] ctx Dilithium context pointer
+ *
+ * @return 0 (success) or < 0 on error
+ */
+struct dilithium_ctx *dilithium_ctx_alloc(void);
+
+/**
+ * @ingroup Dilithium
+ * @brief Allocates Dilithium context on heap with support to keep the internal
+ *	  representation of the key.
+ *
+ * \note See \p DILITHIUM_CTX_ON_STACK_AHAT for details.
+ *
+ * @param [out] ctx Dilithium context pointer
+ *
+ * @return 0 (success) or < 0 on error
+ */
+struct dilithium_ctx *dilithium_ctx_alloc_ahat(enum dilithium_type type);
+
+/**
+ * @ingroup Dilithium
+ * @brief Zeroizes and frees Dilithium context on heap
+ *
+ * @param [out] ctx Dilithium context pointer
+ */
+void dilithium_ctx_zero_free(struct dilithium_ctx *ctx);
+
+/**
+ * @ingroup Dilithium
+ * @brief Zeroizes Dilithium context either on heap or on stack
+ *
+ * @param [out] ctx Dilithium context pointer
+ */
+void dilithium_ctx_zero(struct dilithium_ctx *ctx);
+
+/**
+ * @ingroup Dilithium
+ * @brief Mark the Dilithium context to execute ML-DSA.Sign_internal /
+ *	  ML-DSA.Verify_internal.
+ *
+ * @param [in] ctx Dilithium context
+ */
+void dilithium_ctx_internal(struct dilithium_ctx *ctx);
+
+/**
+ * @ingroup Dilithium
+ * @brief Set the hash type that was used for pre-hashing the message. The
+ *	  message digest is used with the HashML-DSA. The message digest
+ *	  is to be provided via the message pointer in the sign/verify APIs.
+ *
+ * @param [in] ctx Dilithium context
+ * @param [in] hash Hash context referencing the used hash for pre-hashing the
+ *		    message
+ */
+void dilithium_ctx_hash(struct dilithium_ctx *ctx,
+			struct crypto_shash *hash);
+
+/**
+ * @ingroup Dilithium
+ * @brief Specify the optional user context string to be applied with the
+ *	  Dilithium signature operation.
+ *
+ * @param [in] ctx Dilithium context
+ * @param [in] userctx User context string
+ * @param [in] userctxlen Size of the user context string
+ */
+void dilithium_ctx_userctx(struct dilithium_ctx *ctx,
+			   const uint8_t *userctx, size_t userctxlen);
+
+/**
+ * @ingroup Dilithium
+ * @brief Specify the optional external mu value.
+ *
+ * \note If the external mu is specified, the signature generation /
+ * verification APIs do not require a message. In this case, the message buffer
+ * can be set to NULL.
+ *
+ * \note If both a message and an external mu are provided, the external mu
+ * takes precedence.
+ *
+ * @param [in] ctx Dilithium context
+ * @param [in] external_mu User context string
+ * @param [in] external_mu_len Size of the user context string
+ */
+void dilithium_ctx_external_mu(struct dilithium_ctx *ctx,
+			       const uint8_t *external_mu,
+			       size_t external_mu_len);
+
+/**
+ * @ingroup Dilithium
+ * @brief Invalidate the expanded key that potentially is stored in the context.
+ *
+ * This call can be executed on a context irrespective it was allocated with
+ * space for the expanded representation or not. Thus, the caller does not need
+ * to track whether the context supports the expanded key.
+ *
+ * @param [in] ctx Dilithium context
+ */
+void dilithium_ctx_drop_ahat(struct dilithium_ctx *ctx);
+
+/**
+ * @ingroup Dilithium
+ * @brief Obtain Dilithium type from secret key
+ *
+ * @param [in] sk Secret key from which the type is to be obtained
+ *
+ * @return key type
+ */
+enum dilithium_type dilithium_sk_type(const struct dilithium_sk *sk);
+
+/**
+ * @ingroup Dilithium
+ * @brief Obtain Dilithium type from public key
+ *
+ * @param [in] pk Public key from which the type is to be obtained
+ *
+ * @return key type
+ */
+enum dilithium_type dilithium_pk_type(const struct dilithium_pk *pk);
+
+/**
+ * @ingroup Dilithium
+ * @brief Obtain Dilithium type from signature
+ *
+ * @param [in] sig Signature from which the type is to be obtained
+ *
+ * @return key type
+ */
+enum dilithium_type
+dilithium_sig_type(const struct dilithium_sig *sig);
+
+/**
+ * @ingroup Dilithium
+ * @brief Return the size of the Dilithium secret key.
+ *
+ * @param [in] dilithium_type Dilithium type for which the size is requested
+ *
+ * @return requested size
+ */
+__pure unsigned int
+dilithium_sk_size(enum dilithium_type dilithium_type);
+
+/**
+ * @ingroup Dilithium
+ * @brief Return the size of the Dilithium public key.
+ *
+ * @param [in] dilithium_type Dilithium type for which the size is requested
+ *
+ * @return requested size
+ */
+__pure unsigned int
+dilithium_pk_size(enum dilithium_type dilithium_type);
+
+/**
+ * @ingroup Dilithium
+ * @brief Return the size of the Dilithium signature.
+ *
+ * @param [in] dilithium_type Dilithium type for which the size is requested
+ *
+ * @return requested size
+ */
+unsigned int __pure
+dilithium_sig_size(enum dilithium_type dilithium_type);
+
+/**
+ * @ingroup Dilithium
+ * @brief Load a Dilithium secret key provided with a buffer into the leancrypto
+ *	  data structure.
+ *
+ * @param [out] sk Secret key to be filled (the caller must have it allocated)
+ * @param [in] src_key Buffer that holds the key to be imported
+ * @param [in] src_key_len Buffer length that holds the key to be imported
+ *
+ * @return 0 on success or < 0 on error
+ */
+int dilithium_sk_load(struct dilithium_sk *sk, const uint8_t *src_key,
+		      size_t src_key_len);
+
+/**
+ * @ingroup Dilithium
+ * @brief Load a Dilithium public key provided with a buffer into the leancrypto
+ *	  data structure.
+ *
+ * @param [out] pk Secret key to be filled (the caller must have it allocated)
+ * @param [in] src_key Buffer that holds the key to be imported
+ * @param [in] src_key_len Buffer length that holds the key to be imported
+ *
+ * @return 0 on success or < 0 on error
+ */
+int dilithium_pk_load(struct dilithium_pk *pk, const uint8_t *src_key,
+		      size_t src_key_len);
+
+/**
+ * @ingroup Dilithium
+ * @brief Load a Dilithium signature provided with a buffer into the leancrypto
+ *	  data structure.
+ *
+ * @param [out] sig Secret key to be filled (the caller must have it allocated)
+ * @param [in] src_sig Buffer that holds the signature to be imported
+ * @param [in] src_sig_len Buffer length that holds the signature to be imported
+ *
+ * @return 0 on success or < 0 on error
+ */
+int dilithium_sig_load(struct dilithium_sig *sig, const uint8_t *src_sig,
+		       size_t src_sig_len);
+
+/**
+ * @ingroup Dilithium
+ * @brief Obtain the reference to the Dilithium key and its length
+ *
+ * \note Only pointer references into the leancrypto data structure are returned
+ * which implies that any modification will modify the leancrypto key, too.
+ *
+ * @param [out] dilithium_key Dilithium key pointer
+ * @param [out] dilithium_key_len Length of the key buffer
+ * @param [in] sk Dilithium secret key from which the references are obtained
+ *
+ * @return 0 on success, != 0 on error
+ */
+int dilithium_sk_ptr(uint8_t **dilithium_key, size_t *dilithium_key_len,
+		     struct dilithium_sk *sk);
+
+/**
+ * @ingroup Dilithium
+ * @brief Obtain the reference to the Dilithium key and its length
+ *
+ * \note Only pointer references into the leancrypto data structure are returned
+ * which implies that any modification will modify the leancrypto key, too.
+ *
+ * @param [out] dilithium_key Dilithium key pointer
+ * @param [out] dilithium_key_len Length of the key buffer
+ * @param [in] pk Dilithium publi key from which the references are obtained
+ *
+ * @return 0 on success, != 0 on error
+ */
+int dilithium_pk_ptr(uint8_t **dilithium_key, size_t *dilithium_key_len,
+		     struct dilithium_pk *pk);
+
+/**
+ * @ingroup Dilithium
+ * @brief Obtain the reference to the Dilithium signature and its length
+ *
+ * \note Only pointer references into the leancrypto data structure are returned
+ * which implies that any modification will modify the leancrypto signature,
+ * too.
+ *
+ * @param [out] dilithium_sig Dilithium signature pointer
+ * @param [out] dilithium_sig_len Length of the signature buffer
+ * @param [in] sig Dilithium signature from which the references are obtained
+ *
+ * @return 0 on success, != 0 on error
+ */
+int dilithium_sig_ptr(uint8_t **dilithium_sig, size_t *dilithium_sig_len,
+		      struct dilithium_sig *sig);
+
+/**
+ * @ingroup Dilithium
+ * @brief Computes signature in one shot
+ *
+ * @param [out] sig pointer to output signature
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ * @param [in] sk pointer to bit-packed secret key
+ * @param [in] rng_ctx pointer to seeded random number generator context - when
+ *		       pointer is non-NULL, perform a randomized signing.
+ *		       Otherwise use deterministic signing.
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_sign(struct dilithium_sig *sig, const uint8_t *m,
+		   size_t mlen, const struct dilithium_sk *sk,
+		   struct crypto_rng *rng_ctx);
+
+/**
+ * @ingroup Dilithium
+ * @brief Computes signature woth user context in one shot
+ *
+ * This API allows the caller to provide an arbitrary context buffer which
+ * is hashed together with the message to form the message digest to be signed.
+ *
+ * Using the ctx structure, the caller can select 3 different types of ML-DSA:
+ *
+ * * ctx->dilithium_prehash_type set to a hash type, HashML-DSA is assumed which
+ *   implies that the message m must be exactly digest size (FIPS 204 section
+ *   5.4)
+ *
+ * * ctx->ml_dsa_internal set to 1, the ML-DSA.Sign_internal and
+ *   .Verify_internal are executed (FIPS 204 chapter 6)
+ *
+ * * both aforementioned parameter set to NULL / 0, ML-DSA.Sign and
+ *   ML-DSA.Verify are executed (FIPS 204 sections 5.2 and 5.3)
+ *
+ * @param [out] sig pointer to output signature
+ * @param [in] ctx reference to the allocated Dilithium context handle
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ * @param [in] sk pointer to bit-packed secret key
+ * @param [in] rng_ctx pointer to seeded random number generator context - when
+ *		       pointer is non-NULL, perform a randomized signing.
+ *		       Otherwise use deterministic signing.
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_sign_ctx(struct dilithium_sig *sig,
+		       struct dilithium_ctx *ctx, const uint8_t *m,
+		       size_t mlen, const struct dilithium_sk *sk,
+		       struct crypto_rng *rng_ctx);
+
+/**
+ * @ingroup Dilithium
+ * @brief Initializes a signature operation
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_sign_update and dilithium_sign_final.
+ *
+ * @param [in,out] ctx pointer Dilithium context
+ * @param [in] sk pointer to bit-packed secret key
+ *
+ * @return 0 (success) or < 0 on error; -EOPNOTSUPP is returned if a different
+ *	   hash than lc_shake256 is used.
+ */
+int dilithium_sign_init(struct dilithium_ctx *ctx,
+			const struct dilithium_sk *sk);
+
+/**
+ * @ingroup Dilithium
+ * @brief Add more data to an already initialized signature state
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_sign_init and dilithium_sign_final.
+ *
+ * @param [in] ctx pointer to Dilithium context that was initialized with
+ *	      	   dilithium_sign_init
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_sign_update(struct dilithium_ctx *ctx, const uint8_t *m,
+			  size_t mlen);
+
+/**
+ * @ingroup Dilithium
+ * @brief Computes signature
+ *
+ * @param [out] sig pointer to output signature
+ * @param [in] ctx pointer to Dilithium context that was initialized with
+ *	      	   dilithium_sign_init and filled with
+ * 		   dilithium_sign_update
+ * @param [in] sk pointer to bit-packed secret key
+ * @param [in] rng_ctx pointer to seeded random number generator context - when
+ *		       pointer is non-NULL, perform a randomized signing.
+ *		       Otherwise use deterministic signing.
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_sign_final(struct dilithium_sig *sig,
+			 struct dilithium_ctx *ctx,
+			 const struct dilithium_sk *sk,
+			 struct crypto_rng *rng_ctx);
+
+/**
+ * @ingroup Dilithium
+ * @brief Verifies signature in one shot
+ *
+ * @param [in] sig pointer to input signature
+ * @param [in] m pointer to message
+ * @param [in] mlen length of message
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 if signature could be verified correctly and -EBADMSG when
+ * signature cannot be verified, < 0 on other errors
+ */
+int dilithium_verify(const struct dilithium_sig *sig, const uint8_t *m,
+		     size_t mlen, const struct dilithium_pk *pk);
+
+/**
+ * @ingroup Dilithium
+ * @brief Verifies signature with Dilithium context in one shot
+ *
+ * This API allows the caller to provide an arbitrary context buffer which
+ * is hashed together with the message to form the message digest to be signed.
+ *
+ * @param [in] sig pointer to input signature
+ * @param [in] ctx reference to the allocated Dilithium context handle
+ * @param [in] m pointer to message
+ * @param [in] mlen length of message
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 if signature could be verified correctly and -EBADMSG when
+ * signature cannot be verified, < 0 on other errors
+ */
+int dilithium_verify_ctx(const struct dilithium_sig *sig,
+			 struct dilithium_ctx *ctx, const uint8_t *m,
+			 size_t mlen, const struct dilithium_pk *pk);
+
+/**
+ * @ingroup Dilithium
+ * @brief Initializes a signature verification operation
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_verify_update and
+ * dilithium_verify_final.
+ *
+ * @param [in,out] ctx pointer to an allocated Dilithium context
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 (success) or < 0 on error; -EOPNOTSUPP is returned if a different
+ *	   hash than lc_shake256 is used.
+ */
+int dilithium_verify_init(struct dilithium_ctx *ctx,
+			  const struct dilithium_pk *pk);
+
+/**
+ * @ingroup Dilithium
+ * @brief Add more data to an already initialized signature state
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_verify_init and
+ * dilithium_verify_final.
+ *
+ * @param [in] ctx pointer to Dilithium context that was initialized with
+ *		   dilithium_sign_init
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_verify_update(struct dilithium_ctx *ctx, const uint8_t *m,
+			    size_t mlen);
+
+/**
+ * @ingroup Dilithium
+ * @brief Verifies signature
+ *
+ * @param [in] sig pointer to output signature
+ * @param [in] ctx pointer to Dilithium context that was initialized with
+ *		   dilithium_sign_init and filled with
+ *		   dilithium_sign_update
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 if signature could be verified correctly and -EBADMSG when
+ * signature cannot be verified, < 0 on other errors
+ */
+int dilithium_verify_final(const struct dilithium_sig *sig,
+			   struct dilithium_ctx *ctx,
+			   const struct dilithium_pk *pk);
+
+/* No valgrind */
+#define poison(addr, len)
+#define unpoison(addr, len)
+#define is_poisoned(addr, len)
+
+#endif /* DILITHIUM_H */
diff --git a/crypto/ml_dsa/dilithium_44.c b/crypto/ml_dsa/dilithium_44.c
new file mode 100644
index 000000000000..1aea716016f0
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_44.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#define DILITHIUM_TYPE_44
+#include "dilithium.h"
+
+#define DILITHIUM_TYPE			"44"
+#define DILITHIUM_MODE			2
+#define DILITHIUM_NIST_CATEGORY		DILITHIUM44_NIST_CATEGORY
+#define DILITHIUM_LAMBDA		DILITHIUM44_LAMBDA
+#define DILITHIUM_K			DILITHIUM44_K
+#define DILITHIUM_L			DILITHIUM44_L
+#define DILITHIUM_ETA			DILITHIUM44_ETA
+#define DILITHIUM_TAU			DILITHIUM44_TAU
+#define DILITHIUM_BETA			DILITHIUM44_BETA
+#define DILITHIUM_GAMMA1		DILITHIUM44_GAMMA1
+#define DILITHIUM_GAMMA2		DILITHIUM44_GAMMA2
+#define DILITHIUM_OMEGA			DILITHIUM44_OMEGA
+
+#define DILITHIUM_CTILDE_BYTES		DILITHIUM44_CTILDE_BYTES
+#define DILITHIUM_POLYT1_PACKEDBYTES	DILITHIUM44_POLYT1_PACKEDBYTES
+#define DILITHIUM_POLYT0_PACKEDBYTES	DILITHIUM44_POLYT0_PACKEDBYTES
+#define DILITHIUM_POLYVECH_PACKEDBYTES	DILITHIUM44_POLYVECH_PACKEDBYTES
+#define DILITHIUM_POLYZ_PACKEDBYTES	DILITHIUM44_POLYZ_PACKEDBYTES
+#define DILITHIUM_POLYW1_PACKEDBYTES	DILITHIUM44_POLYW1_PACKEDBYTES
+#define DILITHIUM_POLYETA_PACKEDBYTES	DILITHIUM44_POLYETA_PACKEDBYTES
+
+#define DILITHIUM_PUBLICKEYBYTES	DILITHIUM44_PUBLICKEYBYTES
+#define DILITHIUM_SECRETKEYBYTES	DILITHIUM44_SECRETKEYBYTES
+#define DILITHIUM_CRYPTO_BYTES		DILITHIUM44_CRYPTO_BYTES
+
+#include "dilithium_ntt.c"
+#include "dilithium_poly.c"
+#include "dilithium_rounding.c"
+#include "dilithium_signature_c.c"
diff --git a/crypto/ml_dsa/dilithium_44.h b/crypto/ml_dsa/dilithium_44.h
new file mode 100644
index 000000000000..6490c83e7100
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_44.h
@@ -0,0 +1,377 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#ifndef DILITHIUM_44_H
+#define DILITHIUM_44_H
+
+/*
+ * Dilithium Security Levels
+ * 2 -> 192 bits of security strength
+ * 3 -> 225 bits of security strength
+ * 5 -> 257 bits of security strength
+ */
+
+/* DILITHIUM_MODE 2 */
+#define DILITHIUM44_NIST_CATEGORY 1
+#define DILITHIUM44_LAMBDA 128
+#define DILITHIUM44_K 4
+#define DILITHIUM44_L 4
+#define DILITHIUM44_ETA 2
+#define DILITHIUM44_TAU 39
+#define DILITHIUM44_BETA 78
+#define DILITHIUM44_GAMMA1 (1 << 17)
+#define DILITHIUM44_GAMMA2 ((DILITHIUM_Q - 1) / 88)
+#define DILITHIUM44_OMEGA 80
+
+#define DILITHIUM44_CTILDE_BYTES (DILITHIUM44_LAMBDA * 2 / 8)
+#define DILITHIUM44_POLYT1_PACKEDBYTES 320
+#define DILITHIUM44_POLYT0_PACKEDBYTES 416
+#define DILITHIUM44_POLYVECH_PACKEDBYTES (DILITHIUM44_OMEGA + DILITHIUM44_K)
+
+#if DILITHIUM44_GAMMA1 == (1 << 17)
+#define DILITHIUM44_POLYZ_PACKEDBYTES 576
+#elif DILITHIUM44_GAMMA1 == (1 << 19)
+#define DILITHIUM44_POLYZ_PACKEDBYTES 640
+#endif
+
+#if DILITHIUM44_GAMMA2 == (DILITHIUM_Q - 1) / 88
+#define DILITHIUM44_POLYW1_PACKEDBYTES 192
+#elif DILITHIUM44_GAMMA2 == (DILITHIUM_Q - 1) / 32
+#define DILITHIUM44_POLYW1_PACKEDBYTES 128
+#endif
+
+#if DILITHIUM44_ETA == 2
+#define DILITHIUM44_POLYETA_PACKEDBYTES 96
+#elif DILITHIUM44_ETA == 4
+#define DILITHIUM44_POLYETA_PACKEDBYTES 128
+#endif
+
+/*
+ * Sizes of the different Dilithium buffer types.
+ *
+ * WARNING: Do not use these defines in your code. If you need the sizes of
+ * the different variable sizes, use sizeof of the different variable structs or
+ * use the different *_size functions documented below to retrieve the data size
+ * of a particular Dilithium component.
+ */
+#define DILITHIUM44_PUBLICKEYBYTES					\
+	(DILITHIUM_SEEDBYTES +						\
+	 DILITHIUM44_K * DILITHIUM44_POLYT1_PACKEDBYTES)
+#define DILITHIUM44_SECRETKEYBYTES					\
+	(2 * DILITHIUM_SEEDBYTES + DILITHIUM_TRBYTES +			\
+	 DILITHIUM44_L * DILITHIUM44_POLYETA_PACKEDBYTES +		\
+	 DILITHIUM44_K * DILITHIUM44_POLYETA_PACKEDBYTES +		\
+	 DILITHIUM44_K * DILITHIUM44_POLYT0_PACKEDBYTES)
+
+#define DILITHIUM44_CRYPTO_BYTES					\
+	(DILITHIUM44_CTILDE_BYTES +					\
+	 DILITHIUM44_L * DILITHIUM44_POLYZ_PACKEDBYTES +		\
+	 DILITHIUM44_POLYVECH_PACKEDBYTES)
+
+#ifndef __ASSEMBLER__
+/**
+ * @brief Dilithium secret key
+ */
+struct dilithium_44_sk {
+	uint8_t sk[DILITHIUM44_SECRETKEYBYTES];
+};
+
+/**
+ * @brief Dilithium public key
+ */
+struct dilithium_44_pk {
+	uint8_t pk[DILITHIUM44_PUBLICKEYBYTES];
+};
+
+/**
+ * @brief Dilithium signature
+ */
+struct dilithium_44_sig {
+	uint8_t sig[DILITHIUM44_CRYPTO_BYTES];
+};
+
+/*
+ * The alignment is based on largest alignment of a polyvecl typedef - this is
+ * the AVX2 definition.
+ */
+#define DILITHIUM_AHAT_ALIGNMENT (32)
+
+/* Size of the AHat matrix for ML-DSA 87 */
+#define DILITHIUM_44_AHAT_SIZE                                              \
+	(256 * sizeof(int32_t) * DILITHIUM44_K * DILITHIUM44_L)
+
+/**
+ * @brief Zeroize Dilithium context allocated with
+ *	  DILITHIUM_CTX_ON_STACK dilithium_ed25519_alloc
+ *
+ * @param [in] ctx Dilithium context to be zeroized
+ */
+static inline void dilithium_44_ctx_zero(struct dilithium_ctx *ctx)
+{
+	if (!ctx)
+		return;
+	dilithium_hash_clear(ctx);
+	if (ctx->ahat) {
+		memzero_explicit(ctx->ahat, ctx->ahat_size);
+		ctx->ahat_expanded = 0;
+	}
+}
+
+/**
+ * @brief Allocate Dilithium stream context on heap
+ *
+ * @param [out] ctx Allocated Dilithium stream context
+ *
+ * @return: 0 on success, < 0 on error
+ */
+struct dilithium_ctx *dilithium_44_ctx_alloc(void);
+
+/**
+ * @brief Allocate Dilithium stream context on heap including additional
+ * parameter relevant for the signature operation.
+ *
+ * \note See \p DILITHIUM_44_CTX_ON_STACK_AHAT for details.
+ *
+ * @param [out] ctx Allocated Dilithium stream context
+ *
+ * @return: 0 on success, < 0 on error
+ */
+struct dilithium_ctx *dilithium_44_ctx_alloc_ahat(void);
+
+/**
+ * @brief Zeroize and free Dilithium stream context
+ *
+ * @param [in] ctx Dilithium stream context to be zeroized and freed
+ */
+void dilithium_44_ctx_zero_free(struct dilithium_ctx *ctx);
+
+/**
+ * @brief Return the size of the Dilithium secret key.
+ */
+__pure
+static inline unsigned int dilithium_44_sk_size(void)
+{
+	return sizeof_field(struct dilithium_44_sk, sk);
+}
+
+/**
+ * @brief Return the size of the Dilithium public key.
+ */
+__pure
+static inline unsigned int dilithium_44_pk_size(void)
+{
+	return sizeof_field(struct dilithium_44_pk, pk);
+}
+
+/**
+ * @brief Return the size of the Dilithium signature.
+ */
+__pure
+static inline unsigned int dilithium_44_sig_size(void)
+{
+	return sizeof_field(struct dilithium_44_sig, sig);
+}
+
+/**
+ * @brief Computes ML-DSA signature in one shot
+ *
+ * @param [out] sig pointer to output signature
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ * @param [in] sk pointer to bit-packed secret key
+ * @param [in] rng_ctx pointer to seeded random number generator context - when
+ *		       pointer is non-NULL, perform a randomized signing.
+ *		       Otherwise use deterministic signing.
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_44_sign(struct dilithium_44_sig *sig, const uint8_t *m,
+		      size_t mlen, const struct dilithium_44_sk *sk,
+		      struct crypto_rng *rng_ctx);
+
+/**
+ * @brief Computes signature with Dilithium context in one shot
+ *
+ * This API allows the caller to provide an arbitrary context buffer which
+ * is hashed together with the message to form the message digest to be signed.
+ *
+ * @param [out] sig pointer to output signature
+ * @param [in] ctx reference to the allocated Dilithium context handle
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ * @param [in] sk pointer to bit-packed secret key
+ * @param [in] rng_ctx pointer to seeded random number generator context - when
+ *		       pointer is non-NULL, perform a randomized signing.
+ *		       Otherwise use deterministic signing.
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_44_sign_ctx(struct dilithium_44_sig *sig,
+			      struct dilithium_ctx *ctx,
+			      const uint8_t *m, size_t mlen,
+			      const struct dilithium_44_sk *sk,
+			      struct crypto_rng *rng_ctx);
+
+/**
+ * @brief Initializes a signature operation
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_sign_update and dilithium_sign_final.
+ *
+ * @param [in,out] ctx pointer to an allocated Dilithium context
+ * @param [in] sk pointer to bit-packed secret key
+ *
+ * @return 0 (success) or < 0 on error; -EOPNOTSUPP is returned if a different
+ *	   hash than lc_shake256 is used.
+ */
+int dilithium_44_sign_init(struct dilithium_ctx *ctx,
+			   const struct dilithium_44_sk *sk);
+
+/**
+ * @brief Add more data to an already initialized signature state
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_sign_init and dilithium_sign_final.
+ *
+ * @param [in] ctx pointer to Dilithium context that was initialized with
+ *			    dilithium_sign_init
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_44_sign_update(struct dilithium_ctx *ctx, const uint8_t *m,
+			     size_t mlen);
+
+/**
+ * @brief Computes signature
+ *
+ * @param [out] sig pointer to output signature
+ * @param [in] ctx pointer to Dilithium context that was initialized with
+ *			dilithium_sign_init and filled with
+ *			dilithium_sign_update
+ * @param [in] sk pointer to bit-packed secret key
+ * @param [in] rng_ctx pointer to seeded random number generator context - when
+ *		       pointer is non-NULL, perform a randomized signing.
+ *		       Otherwise use deterministic signing.
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_44_sign_final(struct dilithium_44_sig *sig,
+			    struct dilithium_ctx *ctx,
+			    const struct dilithium_44_sk *sk,
+			    struct crypto_rng *rng_ctx);
+
+/**
+ * @brief Verifies ML-DSA signature in one shot
+ *
+ * @param [in] sig pointer to input signature
+ * @param [in] m pointer to message
+ * @param [in] mlen length of message
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 if signature could be verified correctly and -EBADMSG when
+ * signature cannot be verified, < 0 on other errors
+ */
+int dilithium_44_verify(const struct dilithium_44_sig *sig, const uint8_t *m,
+			size_t mlen, const struct dilithium_44_pk *pk);
+
+/**
+ * @brief Verifies signature with Dilithium context in one shot
+ *
+ * This API allows the caller to provide an arbitrary context buffer which
+ * is hashed together with the message to form the message digest to be signed.
+ *
+ * @param [in] sig pointer to input signature
+ * @param [in] ctx reference to the allocated Dilithium context handle
+ * @param [in] m pointer to message
+ * @param [in] mlen length of message
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 if signature could be verified correctly and -EBADMSG when
+ * signature cannot be verified, < 0 on other errors
+ */
+int dilithium_44_verify_ctx(const struct dilithium_44_sig *sig,
+				struct dilithium_ctx *ctx,
+				const uint8_t *m, size_t mlen,
+				const struct dilithium_44_pk *pk);
+
+/**
+ * @brief Initializes a signature verification operation
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_verify_update and
+ * dilithium_verify_final.
+ *
+ * @param [in,out] ctx pointer to an allocated Dilithium context
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 (success) or < 0 on error; -EOPNOTSUPP is returned if a different
+ *	   hash than lc_shake256 is used.
+ */
+int dilithium_44_verify_init(struct dilithium_ctx *ctx,
+			     const struct dilithium_44_pk *pk);
+
+/**
+ * @brief Add more data to an already initialized signature state
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_verify_init and
+ * dilithium_verify_final.
+ *
+ * @param [in,out] ctx pointer to Dilithium context that was initialized with
+ *			    dilithium_sign_init
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_44_verify_update(struct dilithium_ctx *ctx, const uint8_t *m,
+			       size_t mlen);
+
+/**
+ * @brief Verifies signature
+ *
+ * @param [in] sig pointer to output signature
+ * @param [in] ctx pointer to Dilithium context that was initialized with
+ *			dilithium_sign_init and filled with
+ *			dilithium_sign_update
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 if signature could be verified correctly and -EBADMSG when
+ * signature cannot be verified, < 0 on other errors
+ */
+int dilithium_44_verify_final(const struct dilithium_44_sig *sig,
+			      struct dilithium_ctx *ctx,
+			      const struct dilithium_44_pk *pk);
+
+#endif /* __ASSEMBLER__ */
+
+#endif /* DILITHIUM_44_H */
diff --git a/crypto/ml_dsa/dilithium_65.c b/crypto/ml_dsa/dilithium_65.c
new file mode 100644
index 000000000000..08f3a8e71228
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_65.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#define DILITHIUM_TYPE_65
+#include "dilithium.h"
+
+#define DILITHIUM_TYPE			"65"
+#define DILITHIUM_MODE			3
+#define DILITHIUM_NIST_CATEGORY		DILITHIUM65_NIST_CATEGORY
+#define DILITHIUM_LAMBDA		DILITHIUM65_LAMBDA
+#define DILITHIUM_K			DILITHIUM65_K
+#define DILITHIUM_L			DILITHIUM65_L
+#define DILITHIUM_ETA			DILITHIUM65_ETA
+#define DILITHIUM_TAU			DILITHIUM65_TAU
+#define DILITHIUM_BETA			DILITHIUM65_BETA
+#define DILITHIUM_GAMMA1		DILITHIUM65_GAMMA1
+#define DILITHIUM_GAMMA2		DILITHIUM65_GAMMA2
+#define DILITHIUM_OMEGA			DILITHIUM65_OMEGA
+
+#define DILITHIUM_CTILDE_BYTES		DILITHIUM65_CTILDE_BYTES
+#define DILITHIUM_POLYT1_PACKEDBYTES	DILITHIUM65_POLYT1_PACKEDBYTES
+#define DILITHIUM_POLYT0_PACKEDBYTES	DILITHIUM65_POLYT0_PACKEDBYTES
+#define DILITHIUM_POLYVECH_PACKEDBYTES	DILITHIUM65_POLYVECH_PACKEDBYTES
+#define DILITHIUM_POLYZ_PACKEDBYTES	DILITHIUM65_POLYZ_PACKEDBYTES
+#define DILITHIUM_POLYW1_PACKEDBYTES	DILITHIUM65_POLYW1_PACKEDBYTES
+#define DILITHIUM_POLYETA_PACKEDBYTES	DILITHIUM65_POLYETA_PACKEDBYTES
+
+#define DILITHIUM_PUBLICKEYBYTES	DILITHIUM65_PUBLICKEYBYTES
+#define DILITHIUM_SECRETKEYBYTES	DILITHIUM65_SECRETKEYBYTES
+#define DILITHIUM_CRYPTO_BYTES		DILITHIUM65_CRYPTO_BYTES
+
+#include "dilithium_ntt.c"
+#include "dilithium_poly.c"
+#include "dilithium_rounding.c"
+#include "dilithium_signature_c.c"
diff --git a/crypto/ml_dsa/dilithium_65.h b/crypto/ml_dsa/dilithium_65.h
new file mode 100644
index 000000000000..0a36f7eed63e
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_65.h
@@ -0,0 +1,377 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#ifndef DILITHIUM_65_H
+#define DILITHIUM_65_H
+
+/*
+ * Dilithium Security Levels
+ * 2 -> 192 bits of security strength
+ * 3 -> 225 bits of security strength
+ * 5 -> 257 bits of security strength
+ */
+
+/* DILITHIUM_MODE 3 */
+#define DILITHIUM65_NIST_CATEGORY 3
+#define DILITHIUM65_LAMBDA 192
+#define DILITHIUM65_K 6
+#define DILITHIUM65_L 5
+#define DILITHIUM65_ETA 4
+#define DILITHIUM65_TAU 49
+#define DILITHIUM65_BETA 196
+#define DILITHIUM65_GAMMA1 (1 << 19)
+#define DILITHIUM65_GAMMA2 ((DILITHIUM_Q - 1) / 32)
+#define DILITHIUM65_OMEGA 55
+
+#define DILITHIUM65_CTILDE_BYTES (DILITHIUM65_LAMBDA * 2 / 8)
+#define DILITHIUM65_POLYT1_PACKEDBYTES 320
+#define DILITHIUM65_POLYT0_PACKEDBYTES 416
+#define DILITHIUM65_POLYVECH_PACKEDBYTES (DILITHIUM65_OMEGA + DILITHIUM65_K)
+
+#if DILITHIUM65_GAMMA1 == (1 << 17)
+#define DILITHIUM65_POLYZ_PACKEDBYTES 576
+#elif DILITHIUM65_GAMMA1 == (1 << 19)
+#define DILITHIUM65_POLYZ_PACKEDBYTES 640
+#endif
+
+#if DILITHIUM65_GAMMA2 == (DILITHIUM_Q - 1) / 88
+#define DILITHIUM65_POLYW1_PACKEDBYTES 192
+#elif DILITHIUM65_GAMMA2 == (DILITHIUM_Q - 1) / 32
+#define DILITHIUM65_POLYW1_PACKEDBYTES 128
+#endif
+
+#if DILITHIUM65_ETA == 2
+#define DILITHIUM65_POLYETA_PACKEDBYTES 96
+#elif DILITHIUM65_ETA == 4
+#define DILITHIUM65_POLYETA_PACKEDBYTES 128
+#endif
+
+/*
+ * Sizes of the different Dilithium buffer types.
+ *
+ * WARNING: Do not use these defines in your code. If you need the sizes of
+ * the different variable sizes, use sizeof of the different variable structs or
+ * use the different *_size functions documented below to retrieve the data size
+ * of a particular Dilithium component.
+ */
+#define DILITHIUM65_PUBLICKEYBYTES			\
+	(DILITHIUM_SEEDBYTES +				\
+	 DILITHIUM65_K * DILITHIUM65_POLYT1_PACKEDBYTES)
+#define DILITHIUM65_SECRETKEYBYTES			\
+	(2 * DILITHIUM_SEEDBYTES + DILITHIUM_TRBYTES +	\
+	 DILITHIUM65_L * DILITHIUM65_POLYETA_PACKEDBYTES +	\
+	 DILITHIUM65_K * DILITHIUM65_POLYETA_PACKEDBYTES +	\
+	 DILITHIUM65_K * DILITHIUM65_POLYT0_PACKEDBYTES)
+
+#define DILITHIUM65_CRYPTO_BYTES				\
+	(DILITHIUM65_CTILDE_BYTES +			\
+	 DILITHIUM65_L * DILITHIUM65_POLYZ_PACKEDBYTES +	\
+	 DILITHIUM65_POLYVECH_PACKEDBYTES)
+
+#ifndef __ASSEMBLER__
+/**
+ * @brief Dilithium secret key
+ */
+struct dilithium_65_sk {
+	uint8_t sk[DILITHIUM65_SECRETKEYBYTES];
+};
+
+/**
+ * @brief Dilithium public key
+ */
+struct dilithium_65_pk {
+	uint8_t pk[DILITHIUM65_PUBLICKEYBYTES];
+};
+
+/**
+ * @brief Dilithium signature
+ */
+struct dilithium_65_sig {
+	uint8_t sig[DILITHIUM65_CRYPTO_BYTES];
+};
+
+/*
+ * The alignment is based on largest alignment of a polyvecl typedef - this is
+ * the AVX2 definition.
+ */
+#define DILITHIUM_AHAT_ALIGNMENT (32)
+
+/* Size of the AHat matrix for ML-DSA 87 */
+#define DILITHIUM_65_AHAT_SIZE					\
+	(256 * sizeof(int32_t) * DILITHIUM65_K * DILITHIUM65_L)
+
+/**
+ * @brief Zeroize Dilithium context allocated with
+ *	  DILITHIUM_CTX_ON_STACK dilithium_ed25519_alloc
+ *
+ * @param [in] ctx Dilithium context to be zeroized
+ */
+static inline void dilithium_65_ctx_zero(struct dilithium_ctx *ctx)
+{
+	if (!ctx)
+		return;
+	dilithium_hash_clear(ctx);
+	if (ctx->ahat) {
+		memzero_explicit(ctx->ahat, ctx->ahat_size);
+		ctx->ahat_expanded = 0;
+	}
+}
+
+/**
+ * @brief Allocate Dilithium stream context on heap
+ *
+ * @param [out] ctx Allocated Dilithium stream context
+ *
+ * @return: 0 on success, < 0 on error
+ */
+struct dilithium_ctx *dilithium_65_ctx_alloc(void);
+
+/**
+ * @brief Allocate Dilithium stream context on heap including additional
+ * parameter relevant for the signature operation.
+ *
+ * \note See \p DILITHIUM_65_CTX_ON_STACK_AHAT for details.
+ *
+ * @param [out] ctx Allocated Dilithium stream context
+ *
+ * @return: 0 on success, < 0 on error
+ */
+struct dilithium_ctx *dilithium_65_ctx_alloc_ahat(void);
+
+/**
+ * @brief Zeroize and free Dilithium stream context
+ *
+ * @param [in] ctx Dilithium stream context to be zeroized and freed
+ */
+void dilithium_65_ctx_zero_free(struct dilithium_ctx *ctx);
+
+/**
+ * @brief Return the size of the Dilithium secret key.
+ */
+__pure
+static inline unsigned int dilithium_65_sk_size(void)
+{
+	return sizeof_field(struct dilithium_65_sk, sk);
+}
+
+/**
+ * @brief Return the size of the Dilithium public key.
+ */
+__pure
+static inline unsigned int dilithium_65_pk_size(void)
+{
+	return sizeof_field(struct dilithium_65_pk, pk);
+}
+
+/**
+ * @brief Return the size of the Dilithium signature.
+ */
+__pure
+static inline unsigned int dilithium_65_sig_size(void)
+{
+	return sizeof_field(struct dilithium_65_sig, sig);
+}
+
+/**
+ * @brief Computes ML-DSA signature in one shot
+ *
+ * @param [out] sig pointer to output signature
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ * @param [in] sk pointer to bit-packed secret key
+ * @param [in] rng_ctx pointer to seeded random number generator context - when
+ *		       pointer is non-NULL, perform a randomized signing.
+ *		       Otherwise use deterministic signing.
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_65_sign(struct dilithium_65_sig *sig, const uint8_t *m,
+		      size_t mlen, const struct dilithium_65_sk *sk,
+		      struct crypto_rng *rng_ctx);
+
+/**
+ * @brief Computes signature with Dilithium context in one shot
+ *
+ * This API allows the caller to provide an arbitrary context buffer which
+ * is hashed together with the message to form the message digest to be signed.
+ *
+ * @param [out] sig pointer to output signature
+ * @param [in] ctx reference to the allocated Dilithium context handle
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ * @param [in] sk pointer to bit-packed secret key
+ * @param [in] rng_ctx pointer to seeded random number generator context - when
+ *		       pointer is non-NULL, perform a randomized signing.
+ *		       Otherwise use deterministic signing.
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_65_sign_ctx(struct dilithium_65_sig *sig,
+			  struct dilithium_ctx *ctx,
+			  const uint8_t *m, size_t mlen,
+			  const struct dilithium_65_sk *sk,
+			  struct crypto_rng *rng_ctx);
+
+/**
+ * @brief Initializes a signature operation
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_sign_update and dilithium_sign_final.
+ *
+ * @param [in,out] ctx pointer to an allocated Dilithium context
+ * @param [in] sk pointer to bit-packed secret key
+ *
+ * @return 0 (success) or < 0 on error; -EOPNOTSUPP is returned if a different
+ *	   hash than lc_shake256 is used.
+ */
+int dilithium_65_sign_init(struct dilithium_ctx *ctx,
+			   const struct dilithium_65_sk *sk);
+
+/**
+ * @brief Add more data to an already initialized signature state
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_sign_init and dilithium_sign_final.
+ *
+ * @param [in] ctx pointer to Dilithium context that was initialized with
+ *			    dilithium_sign_init
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_65_sign_update(struct dilithium_ctx *ctx, const uint8_t *m,
+			     size_t mlen);
+
+/**
+ * @brief Computes signature
+ *
+ * @param [out] sig pointer to output signature
+ * @param [in] ctx pointer to Dilithium context that was initialized with
+ *			dilithium_sign_init and filled with
+ *			dilithium_sign_update
+ * @param [in] sk pointer to bit-packed secret key
+ * @param [in] rng_ctx pointer to seeded random number generator context - when
+ *		       pointer is non-NULL, perform a randomized signing.
+ *		       Otherwise use deterministic signing.
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_65_sign_final(struct dilithium_65_sig *sig,
+			    struct dilithium_ctx *ctx,
+			    const struct dilithium_65_sk *sk,
+			    struct crypto_rng *rng_ctx);
+
+/**
+ * @brief Verifies ML-DSA signature in one shot
+ *
+ * @param [in] sig pointer to input signature
+ * @param [in] m pointer to message
+ * @param [in] mlen length of message
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 if signature could be verified correctly and -EBADMSG when
+ * signature cannot be verified, < 0 on other errors
+ */
+int dilithium_65_verify(const struct dilithium_65_sig *sig, const uint8_t *m,
+			size_t mlen, const struct dilithium_65_pk *pk);
+
+/**
+ * @brief Verifies signature with Dilithium context in one shot
+ *
+ * This API allows the caller to provide an arbitrary context buffer which
+ * is hashed together with the message to form the message digest to be signed.
+ *
+ * @param [in] sig pointer to input signature
+ * @param [in] ctx reference to the allocated Dilithium context handle
+ * @param [in] m pointer to message
+ * @param [in] mlen length of message
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 if signature could be verified correctly and -EBADMSG when
+ * signature cannot be verified, < 0 on other errors
+ */
+int dilithium_65_verify_ctx(const struct dilithium_65_sig *sig,
+			    struct dilithium_ctx *ctx,
+			    const uint8_t *m, size_t mlen,
+			    const struct dilithium_65_pk *pk);
+
+/**
+ * @brief Initializes a signature verification operation
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_verify_update and
+ * dilithium_verify_final.
+ *
+ * @param [in,out] ctx pointer to an allocated Dilithium context
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 (success) or < 0 on error; -EOPNOTSUPP is returned if a different
+ *	   hash than lc_shake256 is used.
+ */
+int dilithium_65_verify_init(struct dilithium_ctx *ctx,
+			     const struct dilithium_65_pk *pk);
+
+/**
+ * @brief Add more data to an already initialized signature state
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_verify_init and
+ * dilithium_verify_final.
+ *
+ * @param [in,out] ctx pointer to Dilithium context that was initialized with
+ *			    dilithium_sign_init
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_65_verify_update(struct dilithium_ctx *ctx, const uint8_t *m,
+			       size_t mlen);
+
+/**
+ * @brief Verifies signature
+ *
+ * @param [in] sig pointer to output signature
+ * @param [in] ctx pointer to Dilithium context that was initialized with
+ *			dilithium_sign_init and filled with
+ *			dilithium_sign_update
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 if signature could be verified correctly and -EBADMSG when
+ * signature cannot be verified, < 0 on other errors
+ */
+int dilithium_65_verify_final(const struct dilithium_65_sig *sig,
+			      struct dilithium_ctx *ctx,
+			      const struct dilithium_65_pk *pk);
+
+#endif /* __ASSEMBLER__ */
+
+#endif /* DILITHIUM_65_H */
diff --git a/crypto/ml_dsa/dilithium_87.c b/crypto/ml_dsa/dilithium_87.c
new file mode 100644
index 000000000000..fcc3e0229ed9
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_87.c
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+#define DILITHIUM_TYPE_87
+#include "dilithium.h"
+
+#define DILITHIUM_TYPE			"87"
+#define DILITHIUM_MODE			5
+#define DILITHIUM_NIST_CATEGORY		DILITHIUM87_NIST_CATEGORY
+#define DILITHIUM_LAMBDA		DILITHIUM87_LAMBDA
+#define DILITHIUM_K			DILITHIUM87_K
+#define DILITHIUM_L			DILITHIUM87_L
+#define DILITHIUM_ETA			DILITHIUM87_ETA
+#define DILITHIUM_TAU			DILITHIUM87_TAU
+#define DILITHIUM_BETA			DILITHIUM87_BETA
+#define DILITHIUM_GAMMA1		DILITHIUM87_GAMMA1
+#define DILITHIUM_GAMMA2		DILITHIUM87_GAMMA2
+#define DILITHIUM_OMEGA			DILITHIUM87_OMEGA
+
+#define DILITHIUM_CTILDE_BYTES		DILITHIUM87_CTILDE_BYTES
+#define DILITHIUM_POLYT1_PACKEDBYTES	DILITHIUM87_POLYT1_PACKEDBYTES
+#define DILITHIUM_POLYT0_PACKEDBYTES	DILITHIUM87_POLYT0_PACKEDBYTES
+#define DILITHIUM_POLYVECH_PACKEDBYTES	DILITHIUM87_POLYVECH_PACKEDBYTES
+#define DILITHIUM_POLYZ_PACKEDBYTES	DILITHIUM87_POLYZ_PACKEDBYTES
+#define DILITHIUM_POLYW1_PACKEDBYTES	DILITHIUM87_POLYW1_PACKEDBYTES
+#define DILITHIUM_POLYETA_PACKEDBYTES	DILITHIUM87_POLYETA_PACKEDBYTES
+
+#define DILITHIUM_PUBLICKEYBYTES	DILITHIUM87_PUBLICKEYBYTES
+#define DILITHIUM_SECRETKEYBYTES	DILITHIUM87_SECRETKEYBYTES
+#define DILITHIUM_CRYPTO_BYTES		DILITHIUM87_CRYPTO_BYTES
+
+#include "dilithium_ntt.c"
+#include "dilithium_poly.c"
+#include "dilithium_rounding.c"
+#include "dilithium_signature_c.c"
diff --git a/crypto/ml_dsa/dilithium_87.h b/crypto/ml_dsa/dilithium_87.h
new file mode 100644
index 000000000000..eaed8e675383
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_87.h
@@ -0,0 +1,377 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#ifndef DILITHIUM_87_H
+#define DILITHIUM_87_H
+
+/*
+ * Dilithium Security Levels
+ * 2 -> 192 bits of security strength
+ * 3 -> 225 bits of security strength
+ * 5 -> 257 bits of security strength
+ */
+
+/* DILITHIUM_MODE 5 */
+#define DILITHIUM87_NIST_CATEGORY 5
+#define DILITHIUM87_LAMBDA 256
+#define DILITHIUM87_K 8
+#define DILITHIUM87_L 7
+#define DILITHIUM87_ETA 2
+#define DILITHIUM87_TAU 60
+#define DILITHIUM87_BETA 120
+#define DILITHIUM87_GAMMA1 (1 << 19)
+#define DILITHIUM87_GAMMA2 ((DILITHIUM_Q - 1) / 32)
+#define DILITHIUM87_OMEGA 75
+
+#define DILITHIUM87_CTILDE_BYTES (DILITHIUM87_LAMBDA * 2 / 8)
+#define DILITHIUM87_POLYT1_PACKEDBYTES 320
+#define DILITHIUM87_POLYT0_PACKEDBYTES 416
+#define DILITHIUM87_POLYVECH_PACKEDBYTES (DILITHIUM87_OMEGA + DILITHIUM87_K)
+
+#if DILITHIUM87_GAMMA1 == (1 << 17)
+#define DILITHIUM87_POLYZ_PACKEDBYTES 576
+#elif DILITHIUM87_GAMMA1 == (1 << 19)
+#define DILITHIUM87_POLYZ_PACKEDBYTES 640
+#endif
+
+#if DILITHIUM87_GAMMA2 == (DILITHIUM_Q - 1) / 88
+#define DILITHIUM87_POLYW1_PACKEDBYTES 192
+#elif DILITHIUM87_GAMMA2 == (DILITHIUM_Q - 1) / 32
+#define DILITHIUM87_POLYW1_PACKEDBYTES 128
+#endif
+
+#if DILITHIUM87_ETA == 2
+#define DILITHIUM87_POLYETA_PACKEDBYTES 96
+#elif DILITHIUM87_ETA == 4
+#define DILITHIUM87_POLYETA_PACKEDBYTES 128
+#endif
+
+/*
+ * Sizes of the different Dilithium buffer types.
+ *
+ * WARNING: Do not use these defines in your code. If you need the sizes of
+ * the different variable sizes, use sizeof of the different variable structs or
+ * use the different *_size functions documented below to retrieve the data size
+ * of a particular Dilithium component.
+ */
+#define DILITHIUM87_PUBLICKEYBYTES			\
+	(DILITHIUM_SEEDBYTES +				\
+	 DILITHIUM87_K * DILITHIUM87_POLYT1_PACKEDBYTES)
+#define DILITHIUM87_SECRETKEYBYTES			\
+	(2 * DILITHIUM_SEEDBYTES + DILITHIUM_TRBYTES +	\
+	 DILITHIUM87_L * DILITHIUM87_POLYETA_PACKEDBYTES +	\
+	 DILITHIUM87_K * DILITHIUM87_POLYETA_PACKEDBYTES +	\
+	 DILITHIUM87_K * DILITHIUM87_POLYT0_PACKEDBYTES)
+
+#define DILITHIUM87_CRYPTO_BYTES				\
+	(DILITHIUM87_CTILDE_BYTES +			\
+	 DILITHIUM87_L * DILITHIUM87_POLYZ_PACKEDBYTES +	\
+	 DILITHIUM87_POLYVECH_PACKEDBYTES)
+
+#ifndef __ASSEMBLER__
+/**
+ * @brief Dilithium secret key
+ */
+struct dilithium_87_sk {
+	uint8_t sk[DILITHIUM87_SECRETKEYBYTES];
+};
+
+/**
+ * @brief Dilithium public key
+ */
+struct dilithium_87_pk {
+	uint8_t pk[DILITHIUM87_PUBLICKEYBYTES];
+};
+
+/**
+ * @brief Dilithium signature
+ */
+struct dilithium_87_sig {
+	uint8_t sig[DILITHIUM87_CRYPTO_BYTES];
+};
+
+/*
+ * The alignment is based on largest alignment of a polyvecl typedef - this is
+ * the AVX2 definition.
+ */
+#define DILITHIUM_AHAT_ALIGNMENT (32)
+
+/* Size of the AHat matrix for ML-DSA 87 */
+#define DILITHIUM_87_AHAT_SIZE					\
+	(256 * sizeof(int32_t) * DILITHIUM87_K * DILITHIUM87_L)
+
+/**
+ * @brief Zeroize Dilithium context allocated with
+ *	  DILITHIUM87_CTX_ON_STACK dilithium_ed25519_alloc
+ *
+ * @param [in] ctx Dilithium context to be zeroized
+ */
+static inline void dilithium_87_ctx_zero(struct dilithium_ctx *ctx)
+{
+	if (!ctx)
+		return;
+	dilithium_hash_clear(ctx);
+	if (ctx->ahat) {
+		memzero_explicit(ctx->ahat, ctx->ahat_size);
+		ctx->ahat_expanded = 0;
+	}
+}
+
+/**
+ * @brief Allocate Dilithium stream context on heap
+ *
+ * @param [out] ctx Allocated Dilithium stream context
+ *
+ * @return: 0 on success, < 0 on error
+ */
+struct dilithium_ctx *dilithium_87_ctx_alloc(void);
+
+/**
+ * @brief Allocate Dilithium stream context on heap including additional
+ * parameter relevant for the signature operation.
+ *
+ * \note See \p DILITHIUM_87_CTX_ON_STACK_AHAT for details.
+ *
+ * @param [out] ctx Allocated Dilithium stream context
+ *
+ * @return: 0 on success, < 0 on error
+ */
+struct dilithium_ctx *dilithium_87_ctx_alloc_ahat(void);
+
+/**
+ * @brief Zeroize and free Dilithium stream context
+ *
+ * @param [in] ctx Dilithium stream context to be zeroized and freed
+ */
+void dilithium_87_ctx_zero_free(struct dilithium_ctx *ctx);
+
+/**
+ * @brief Return the size of the Dilithium secret key.
+ */
+__pure
+static inline unsigned int dilithium_87_sk_size(void)
+{
+	return sizeof_field(struct dilithium_87_sk, sk);
+}
+
+/**
+ * @brief Return the size of the Dilithium public key.
+ */
+__pure
+static inline unsigned int dilithium_87_pk_size(void)
+{
+	return sizeof_field(struct dilithium_87_pk, pk);
+}
+
+/**
+ * @brief Return the size of the Dilithium signature.
+ */
+__pure
+static inline unsigned int dilithium_87_sig_size(void)
+{
+	return sizeof_field(struct dilithium_87_sig, sig);
+}
+
+/**
+ * @brief Computes ML-DSA signature in one shot
+ *
+ * @param [out] sig pointer to output signature
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ * @param [in] sk pointer to bit-packed secret key
+ * @param [in] rng_ctx pointer to seeded random number generator context - when
+ *		       pointer is non-NULL, perform a randomized signing.
+ *		       Otherwise use deterministic signing.
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_87_sign(struct dilithium_87_sig *sig, const uint8_t *m,
+		      size_t mlen, const struct dilithium_87_sk *sk,
+		      struct crypto_rng *rng_ctx);
+
+/**
+ * @brief Computes signature with Dilithium context in one shot
+ *
+ * This API allows the caller to provide an arbitrary context buffer which
+ * is hashed together with the message to form the message digest to be signed.
+ *
+ * @param [out] sig pointer to output signature
+ * @param [in] ctx reference to the allocated Dilithium context handle
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ * @param [in] sk pointer to bit-packed secret key
+ * @param [in] rng_ctx pointer to seeded random number generator context - when
+ *		       pointer is non-NULL, perform a randomized signing.
+ *		       Otherwise use deterministic signing.
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_87_sign_ctx(struct dilithium_87_sig *sig,
+			  struct dilithium_ctx *ctx,
+			  const uint8_t *m, size_t mlen,
+			  const struct dilithium_87_sk *sk,
+			  struct crypto_rng *rng_ctx);
+
+/**
+ * @brief Initializes a signature operation
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_sign_update and dilithium_sign_final.
+ *
+ * @param [in,out] ctx pointer to an allocated Dilithium context
+ * @param [in] sk pointer to bit-packed secret key
+ *
+ * @return 0 (success) or < 0 on error; -EOPNOTSUPP is returned if a different
+ *	   hash than lc_shake256 is used.
+ */
+int dilithium_87_sign_init(struct dilithium_ctx *ctx,
+			   const struct dilithium_87_sk *sk);
+
+/**
+ * @brief Add more data to an already initialized signature state
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_sign_init and dilithium_sign_final.
+ *
+ * @param [in] ctx pointer to Dilithium context that was initialized with
+ *			    dilithium_sign_init
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_87_sign_update(struct dilithium_ctx *ctx, const uint8_t *m,
+			     size_t mlen);
+
+/**
+ * @brief Computes signature
+ *
+ * @param [out] sig pointer to output signature
+ * @param [in] ctx pointer to Dilithium context that was initialized with
+ *			dilithium_sign_init and filled with
+ *			dilithium_sign_update
+ * @param [in] sk pointer to bit-packed secret key
+ * @param [in] rng_ctx pointer to seeded random number generator context - when
+ *		       pointer is non-NULL, perform a randomized signing.
+ *		       Otherwise use deterministic signing.
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_87_sign_final(struct dilithium_87_sig *sig,
+			    struct dilithium_ctx *ctx,
+			    const struct dilithium_87_sk *sk,
+			    struct crypto_rng *rng_ctx);
+
+/**
+ * @brief Verifies ML-DSA signature in one shot
+ *
+ * @param [in] sig pointer to input signature
+ * @param [in] m pointer to message
+ * @param [in] mlen length of message
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 if signature could be verified correctly and -EBADMSG when
+ * signature cannot be verified, < 0 on other errors
+ */
+int dilithium_87_verify(const struct dilithium_87_sig *sig, const uint8_t *m,
+			size_t mlen, const struct dilithium_87_pk *pk);
+
+/**
+ * @brief Verifies signature with Dilithium context in one shot
+ *
+ * This API allows the caller to provide an arbitrary context buffer which
+ * is hashed together with the message to form the message digest to be signed.
+ *
+ * @param [in] sig pointer to input signature
+ * @param [in] ctx reference to the allocated Dilithium context handle
+ * @param [in] m pointer to message
+ * @param [in] mlen length of message
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 if signature could be verified correctly and -EBADMSG when
+ * signature cannot be verified, < 0 on other errors
+ */
+int dilithium_87_verify_ctx(const struct dilithium_87_sig *sig,
+			    struct dilithium_ctx *ctx,
+			    const uint8_t *m, size_t mlen,
+			    const struct dilithium_87_pk *pk);
+
+/**
+ * @brief Initializes a signature verification operation
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_verify_update and
+ * dilithium_verify_final.
+ *
+ * @param [in,out] ctx pointer to an allocated Dilithium context
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 (success) or < 0 on error; -EOPNOTSUPP is returned if a different
+ *	   hash than lc_shake256 is used.
+ */
+int dilithium_87_verify_init(struct dilithium_ctx *ctx,
+			     const struct dilithium_87_pk *pk);
+
+/**
+ * @brief Add more data to an already initialized signature state
+ *
+ * This call is intended to support messages that are located in non-contiguous
+ * places and even becomes available at different times. This call is to be
+ * used together with the dilithium_verify_init and
+ * dilithium_verify_final.
+ *
+ * @param [in,out] ctx pointer to Dilithium context that was initialized with
+ *			    dilithium_sign_init
+ * @param [in] m pointer to message to be signed
+ * @param [in] mlen length of message
+ *
+ * @return 0 (success) or < 0 on error
+ */
+int dilithium_87_verify_update(struct dilithium_ctx *ctx, const uint8_t *m,
+			       size_t mlen);
+
+/**
+ * @brief Verifies signature
+ *
+ * @param [in] sig pointer to output signature
+ * @param [in] ctx pointer to Dilithium context that was initialized with
+ *			dilithium_sign_init and filled with
+ *			dilithium_sign_update
+ * @param [in] pk pointer to bit-packed public key
+ *
+ * @return 0 if signature could be verified correctly and -EBADMSG when
+ * signature cannot be verified, < 0 on other errors
+ */
+int dilithium_87_verify_final(const struct dilithium_87_sig *sig,
+			      struct dilithium_ctx *ctx,
+			      const struct dilithium_87_pk *pk);
+
+#endif /* __ASSEMBLER__ */
+
+#endif /* DILITHIUM_87_H */
diff --git a/crypto/ml_dsa/dilithium_api.c b/crypto/ml_dsa/dilithium_api.c
new file mode 100644
index 000000000000..363984f01169
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_api.c
@@ -0,0 +1,729 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#ifndef DILITHIUM_API_H
+#define DILITHIUM_API_H
+
+#include <linux/export.h>
+#include "dilithium.h"
+
+void dilithium_ctx_zero(struct dilithium_ctx *ctx)
+{
+	if (!ctx)
+		return;
+
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+	dilithium_87_ctx_zero(ctx);
+#elif defined(CONFIG_CRYPTO_DILITHIUM_65)
+	dilithium_65_ctx_zero(ctx);
+#elif defined(CONFIG_CRYPTO_DILITHIUM_44)
+	dilithium_44_ctx_zero(ctx);
+#endif
+}
+EXPORT_SYMBOL(dilithium_ctx_zero);
+
+void dilithium_ctx_internal(struct dilithium_ctx *ctx)
+{
+	if (ctx)
+		ctx->ml_dsa_internal = 1;
+}
+EXPORT_SYMBOL(dilithium_ctx_internal);
+
+void dilithium_ctx_hash(struct dilithium_ctx *ctx,
+			struct crypto_shash *hash)
+{
+	if (ctx)
+		ctx->dilithium_prehash_type = hash;
+}
+EXPORT_SYMBOL(dilithium_ctx_hash);
+
+void dilithium_ctx_userctx(struct dilithium_ctx *ctx, const uint8_t *userctx,
+			   size_t userctxlen)
+{
+	if (ctx) {
+		ctx->userctx = userctx;
+		ctx->userctxlen = userctxlen;
+	}
+}
+EXPORT_SYMBOL(dilithium_ctx_userctx);
+
+void dilithium_ctx_external_mu(struct dilithium_ctx *ctx, const uint8_t *external_mu,
+			       size_t external_mu_len)
+{
+	if (ctx) {
+		ctx->external_mu = external_mu;
+		ctx->external_mu_len = external_mu_len;
+	}
+}
+EXPORT_SYMBOL(dilithium_ctx_external_mu);
+
+void dilithium_ctx_drop_ahat(struct dilithium_ctx *ctx)
+{
+	if (ctx)
+		ctx->ahat_expanded = 0;
+}
+EXPORT_SYMBOL(dilithium_ctx_drop_ahat);
+
+enum dilithium_type dilithium_sk_type(const struct dilithium_sk *sk)
+{
+	if (!sk)
+		return DILITHIUM_UNKNOWN;
+	return sk->dilithium_type;
+}
+EXPORT_SYMBOL(dilithium_sk_type);
+
+enum dilithium_type dilithium_pk_type(const struct dilithium_pk *pk)
+{
+	if (!pk)
+		return DILITHIUM_UNKNOWN;
+	return pk->dilithium_type;
+}
+EXPORT_SYMBOL(dilithium_pk_type);
+
+enum dilithium_type dilithium_sig_type(const struct dilithium_sig *sig)
+{
+	if (!sig)
+		return DILITHIUM_UNKNOWN;
+	return sig->dilithium_type;
+}
+EXPORT_SYMBOL(dilithium_sig_type);
+
+__pure unsigned int dilithium_sk_size(enum dilithium_type dilithium_type)
+{
+	switch (dilithium_type) {
+	case DILITHIUM_87:
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		return sizeof_field(struct dilithium_sk, key.sk_87);
+#else
+		return 0;
+#endif
+	case DILITHIUM_65:
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		return sizeof_field(struct dilithium_sk, key.sk_65);
+#else
+		return 0;
+#endif
+	case DILITHIUM_44:
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		return sizeof_field(struct dilithium_sk, key.sk_44);
+#else
+		return 0;
+#endif
+	case DILITHIUM_UNKNOWN:
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL(dilithium_sk_size);
+
+__pure unsigned int dilithium_pk_size(enum dilithium_type dilithium_type)
+{
+	switch (dilithium_type) {
+	case DILITHIUM_87:
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		return sizeof_field(struct dilithium_pk, key.pk_87);
+#else
+		return 0;
+#endif
+	case DILITHIUM_65:
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		return sizeof_field(struct dilithium_pk, key.pk_65);
+#else
+		return 0;
+#endif
+	case DILITHIUM_44:
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		return sizeof_field(struct dilithium_pk, key.pk_44);
+#else
+		return 0;
+#endif
+	case DILITHIUM_UNKNOWN:
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL(dilithium_pk_size);
+
+__pure unsigned int dilithium_sig_size(enum dilithium_type dilithium_type)
+{
+	switch (dilithium_type) {
+	case DILITHIUM_87:
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		return sizeof_field(struct dilithium_sig, sig.sig_87);
+#else
+		return 0;
+#endif
+	case DILITHIUM_65:
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		return sizeof_field(struct dilithium_sig, sig.sig_65);
+#else
+		return 0;
+#endif
+	case DILITHIUM_44:
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		return sizeof_field(struct dilithium_sig, sig.sig_44);
+#else
+		return 0;
+#endif
+	case DILITHIUM_UNKNOWN:
+	default:
+		return 0;
+	}
+}
+EXPORT_SYMBOL(dilithium_sig_size);
+
+int dilithium_sk_load(struct dilithium_sk *sk,
+		      const uint8_t *src_key, size_t src_key_len)
+{
+	if (!sk || !src_key || src_key_len == 0) {
+		return -EINVAL;
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+	} else if (src_key_len == dilithium_sk_size(DILITHIUM_87)) {
+		struct dilithium_87_sk *_sk = &sk->key.sk_87;
+
+		memcpy(_sk->sk, src_key, src_key_len);
+		sk->dilithium_type = DILITHIUM_87;
+		return 0;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+	} else if (src_key_len == dilithium_sk_size(DILITHIUM_65)) {
+		struct dilithium_65_sk *_sk = &sk->key.sk_65;
+
+		memcpy(_sk->sk, src_key, src_key_len);
+		sk->dilithium_type = DILITHIUM_65;
+		return 0;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+	} else if (src_key_len == dilithium_sk_size(DILITHIUM_44)) {
+		struct dilithium_44_sk *_sk = &sk->key.sk_44;
+
+		memcpy(_sk->sk, src_key, src_key_len);
+		sk->dilithium_type = DILITHIUM_44;
+		return 0;
+#endif
+	} else {
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL(dilithium_sk_load);
+
+int dilithium_pk_load(struct dilithium_pk *pk,
+		      const uint8_t *src_key, size_t src_key_len)
+{
+	if (!pk || !src_key || src_key_len == 0) {
+		return -EINVAL;
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+	} else if (src_key_len == dilithium_pk_size(DILITHIUM_87)) {
+		struct dilithium_87_pk *_pk = &pk->key.pk_87;
+
+		memcpy(_pk->pk, src_key, src_key_len);
+		pk->dilithium_type = DILITHIUM_87;
+		return 0;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+	} else if (src_key_len == dilithium_pk_size(DILITHIUM_65)) {
+		struct dilithium_65_pk *_pk = &pk->key.pk_65;
+
+		memcpy(_pk->pk, src_key, src_key_len);
+		pk->dilithium_type = DILITHIUM_65;
+		return 0;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+	} else if (src_key_len == dilithium_pk_size(DILITHIUM_44)) {
+		struct dilithium_44_pk *_pk = &pk->key.pk_44;
+
+		memcpy(_pk->pk, src_key, src_key_len);
+		pk->dilithium_type = DILITHIUM_44;
+		return 0;
+#endif
+	} else {
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL(dilithium_pk_load);
+
+int dilithium_sig_load(struct dilithium_sig *sig,
+		       const uint8_t *src_sig, size_t src_sig_len)
+{
+	if (!sig || !src_sig || src_sig_len == 0) {
+		return -EINVAL;
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+	} else if (src_sig_len == dilithium_sig_size(DILITHIUM_87)) {
+		struct dilithium_87_sig *_sig = &sig->sig.sig_87;
+
+		memcpy(_sig->sig, src_sig, src_sig_len);
+		sig->dilithium_type = DILITHIUM_87;
+		return 0;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+	} else if (src_sig_len == dilithium_sig_size(DILITHIUM_65)) {
+		struct dilithium_65_sig *_sig = &sig->sig.sig_65;
+
+		memcpy(_sig->sig, src_sig, src_sig_len);
+		sig->dilithium_type = DILITHIUM_65;
+		return 0;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+	} else if (src_sig_len == dilithium_sig_size(DILITHIUM_44)) {
+		struct dilithium_44_sig *_sig = &sig->sig.sig_44;
+
+		memcpy(_sig->sig, src_sig, src_sig_len);
+		sig->dilithium_type = DILITHIUM_44;
+		return 0;
+#endif
+	} else {
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL(dilithium_sig_load);
+
+int dilithium_sk_ptr(uint8_t **dilithium_key,
+		     size_t *dilithium_key_len, struct dilithium_sk *sk)
+{
+	if (!sk || !dilithium_key || !dilithium_key_len) {
+		return -EINVAL;
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+	} else if (sk->dilithium_type == DILITHIUM_87) {
+		struct dilithium_87_sk *_sk = &sk->key.sk_87;
+
+		*dilithium_key = _sk->sk;
+		*dilithium_key_len = dilithium_sk_size(sk->dilithium_type);
+		return 0;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+	} else if (sk->dilithium_type == DILITHIUM_65) {
+		struct dilithium_65_sk *_sk = &sk->key.sk_65;
+
+		*dilithium_key = _sk->sk;
+		*dilithium_key_len = dilithium_sk_size(sk->dilithium_type);
+		return 0;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+	} else if (sk->dilithium_type == DILITHIUM_44) {
+		struct dilithium_44_sk *_sk = &sk->key.sk_44;
+
+		*dilithium_key = _sk->sk;
+		*dilithium_key_len = dilithium_sk_size(sk->dilithium_type);
+		return 0;
+#endif
+	} else {
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL(dilithium_sk_ptr);
+
+int dilithium_pk_ptr(uint8_t **dilithium_key,
+		     size_t *dilithium_key_len, struct dilithium_pk *pk)
+{
+	if (!pk || !dilithium_key || !dilithium_key_len) {
+		return -EINVAL;
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+	} else if (pk->dilithium_type == DILITHIUM_87) {
+		struct dilithium_87_pk *_pk = &pk->key.pk_87;
+
+		*dilithium_key = _pk->pk;
+		*dilithium_key_len = dilithium_pk_size(pk->dilithium_type);
+		return 0;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+	} else if (pk->dilithium_type == DILITHIUM_65) {
+		struct dilithium_65_pk *_pk = &pk->key.pk_65;
+
+		*dilithium_key = _pk->pk;
+		*dilithium_key_len = dilithium_pk_size(pk->dilithium_type);
+		return 0;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+	} else if (pk->dilithium_type == DILITHIUM_44) {
+		struct dilithium_44_pk *_pk = &pk->key.pk_44;
+
+		*dilithium_key = _pk->pk;
+		*dilithium_key_len = dilithium_pk_size(pk->dilithium_type);
+		return 0;
+#endif
+	} else {
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL(dilithium_pk_ptr);
+
+int dilithium_sig_ptr(uint8_t **dilithium_sig,
+		      size_t *dilithium_sig_len, struct dilithium_sig *sig)
+{
+	if (!sig || !dilithium_sig || !dilithium_sig_len) {
+		return -EINVAL;
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+	} else if (sig->dilithium_type == DILITHIUM_87) {
+		struct dilithium_87_sig *_sig = &sig->sig.sig_87;
+
+		*dilithium_sig = _sig->sig;
+		*dilithium_sig_len = dilithium_sig_size(sig->dilithium_type);
+		return 0;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+	} else if (sig->dilithium_type == DILITHIUM_65) {
+		struct dilithium_65_sig *_sig = &sig->sig.sig_65;
+
+		*dilithium_sig = _sig->sig;
+		*dilithium_sig_len = dilithium_sig_size(sig->dilithium_type);
+		return 0;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+	} else if (sig->dilithium_type == DILITHIUM_44) {
+		struct dilithium_44_sig *_sig = &sig->sig.sig_44;
+
+		*dilithium_sig = _sig->sig;
+		*dilithium_sig_len = dilithium_sig_size(sig->dilithium_type);
+		return 0;
+#endif
+	} else {
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL(dilithium_sig_ptr);
+
+int dilithium_sign(struct dilithium_sig *sig,
+		   const uint8_t *m, size_t mlen,
+		   const struct dilithium_sk *sk,
+		   struct crypto_rng *rng_ctx)
+{
+	if (!sk || !sig)
+		return -EINVAL;
+
+	switch (sk->dilithium_type) {
+	case DILITHIUM_87:
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		sig->dilithium_type = DILITHIUM_87;
+		return dilithium_87_sign(&sig->sig.sig_87, m, mlen,
+					 &sk->key.sk_87, rng_ctx);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_65:
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		sig->dilithium_type = DILITHIUM_65;
+		return dilithium_65_sign(&sig->sig.sig_65, m, mlen,
+					 &sk->key.sk_65, rng_ctx);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_44:
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		sig->dilithium_type = DILITHIUM_44;
+		return dilithium_44_sign(&sig->sig.sig_44, m, mlen,
+					 &sk->key.sk_44, rng_ctx);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_UNKNOWN:
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+EXPORT_SYMBOL(dilithium_sign);
+
+int dilithium_sign_ctx(struct dilithium_sig *sig,
+		       struct dilithium_ctx *ctx, const uint8_t *m,
+		       size_t mlen, const struct dilithium_sk *sk,
+		       struct crypto_rng *rng_ctx)
+{
+	if (!sk || !sig)
+		return -EINVAL;
+
+	switch (sk->dilithium_type) {
+	case DILITHIUM_87:
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		sig->dilithium_type = DILITHIUM_87;
+		return dilithium_87_sign_ctx(&sig->sig.sig_87, ctx, m, mlen,
+					     &sk->key.sk_87, rng_ctx);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_65:
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		sig->dilithium_type = DILITHIUM_65;
+		return dilithium_65_sign_ctx(&sig->sig.sig_65, ctx, m, mlen,
+					     &sk->key.sk_65, rng_ctx);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_44:
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		sig->dilithium_type = DILITHIUM_44;
+		return dilithium_44_sign_ctx(&sig->sig.sig_44, ctx, m, mlen,
+					     &sk->key.sk_44, rng_ctx);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_UNKNOWN:
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+EXPORT_SYMBOL(dilithium_sign_ctx);
+
+int dilithium_sign_init(struct dilithium_ctx *ctx,
+			const struct dilithium_sk *sk)
+{
+	if (!sk)
+		return -EINVAL;
+
+	switch (sk->dilithium_type) {
+	case DILITHIUM_87:
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		return dilithium_87_sign_init(ctx, &sk->key.sk_87);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_65:
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		return dilithium_65_sign_init(ctx, &sk->key.sk_65);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_44:
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		return dilithium_44_sign_init(ctx, &sk->key.sk_44);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_UNKNOWN:
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+EXPORT_SYMBOL(dilithium_sign_init);
+
+int dilithium_sign_update(struct dilithium_ctx *ctx, const uint8_t *m,
+			  size_t mlen)
+{
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+	return dilithium_87_sign_update(ctx, m, mlen);
+#elif defined(CONFIG_CRYPTO_DILITHIUM_65)
+	return dilithium_65_sign_update(ctx, m, mlen);
+#elif defined(CONFIG_CRYPTO_DILITHIUM_44)
+	return dilithium_44_sign_update(ctx, m, mlen);
+#else
+	return -EOPNOTSUPP;
+#endif
+}
+EXPORT_SYMBOL(dilithium_sign_update);
+
+int dilithium_sign_final(struct dilithium_sig *sig,
+			 struct dilithium_ctx *ctx,
+			 const struct dilithium_sk *sk,
+			 struct crypto_rng *rng_ctx)
+{
+	if (!sk || !sig)
+		return -EINVAL;
+
+	switch (sk->dilithium_type) {
+	case DILITHIUM_87:
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		sig->dilithium_type = DILITHIUM_87;
+		return dilithium_87_sign_final(&sig->sig.sig_87, ctx,
+					       &sk->key.sk_87, rng_ctx);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_65:
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		sig->dilithium_type = DILITHIUM_65;
+		return dilithium_65_sign_final(&sig->sig.sig_65, ctx,
+					       &sk->key.sk_65, rng_ctx);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_44:
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		sig->dilithium_type = DILITHIUM_44;
+		return dilithium_44_sign_final(&sig->sig.sig_44, ctx,
+					       &sk->key.sk_44, rng_ctx);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_UNKNOWN:
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+EXPORT_SYMBOL(dilithium_sign_final);
+
+int dilithium_verify(const struct dilithium_sig *sig, const uint8_t *m,
+		     size_t mlen, const struct dilithium_pk *pk)
+{
+	if (!pk || !sig || sig->dilithium_type != pk->dilithium_type)
+		return -EINVAL;
+
+	switch (pk->dilithium_type) {
+	case DILITHIUM_87:
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		return dilithium_87_verify(&sig->sig.sig_87, m, mlen,
+					   &pk->key.pk_87);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_65:
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		return dilithium_65_verify(&sig->sig.sig_65, m, mlen,
+					   &pk->key.pk_65);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_44:
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		return dilithium_44_verify(&sig->sig.sig_44, m, mlen,
+					   &pk->key.pk_44);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_UNKNOWN:
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+EXPORT_SYMBOL(dilithium_verify);
+
+int dilithium_verify_ctx(const struct dilithium_sig *sig,
+			 struct dilithium_ctx *ctx, const uint8_t *m,
+			 size_t mlen, const struct dilithium_pk *pk)
+{
+	if (!pk || !sig || sig->dilithium_type != pk->dilithium_type)
+		return -EINVAL;
+
+	switch (pk->dilithium_type) {
+	case DILITHIUM_87:
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		return dilithium_87_verify_ctx(&sig->sig.sig_87, ctx, m,
+					       mlen, &pk->key.pk_87);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_65:
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		return dilithium_65_verify_ctx(&sig->sig.sig_65, ctx, m,
+					       mlen, &pk->key.pk_65);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_44:
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		return dilithium_44_verify_ctx(&sig->sig.sig_44, ctx, m,
+					       mlen, &pk->key.pk_44);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_UNKNOWN:
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+EXPORT_SYMBOL(dilithium_verify_ctx);
+
+int dilithium_verify_init(struct dilithium_ctx *ctx,
+			  const struct dilithium_pk *pk)
+{
+	if (!pk)
+		return -EINVAL;
+
+	switch (pk->dilithium_type) {
+	case DILITHIUM_87:
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		return dilithium_87_verify_init(ctx, &pk->key.pk_87);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_65:
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		return dilithium_65_verify_init(ctx, &pk->key.pk_65);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_44:
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		return dilithium_44_verify_init(ctx, &pk->key.pk_44);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_UNKNOWN:
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+EXPORT_SYMBOL(dilithium_verify_init);
+
+int dilithium_verify_update(struct dilithium_ctx *ctx, const uint8_t *m,
+			    size_t mlen)
+{
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+	return dilithium_87_verify_update(ctx, m, mlen);
+#elif defined(CONFIG_CRYPTO_DILITHIUM_65)
+	return dilithium_65_verify_update(ctx, m, mlen);
+#elif defined(CONFIG_CRYPTO_DILITHIUM_44)
+	return dilithium_44_verify_update(ctx, m, mlen);
+#else
+	return -EOPNOTSUPP;
+#endif
+}
+EXPORT_SYMBOL(dilithium_verify_update);
+
+int dilithium_verify_final(const struct dilithium_sig *sig,
+			   struct dilithium_ctx *ctx,
+			   const struct dilithium_pk *pk)
+{
+	if (!pk || !sig || sig->dilithium_type != pk->dilithium_type)
+		return -EINVAL;
+
+	switch (pk->dilithium_type) {
+	case DILITHIUM_87:
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+		return dilithium_87_verify_final(&sig->sig.sig_87, ctx,
+						 &pk->key.pk_87);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_65:
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+		return dilithium_65_verify_final(&sig->sig.sig_65, ctx,
+						 &pk->key.pk_65);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_44:
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+		return dilithium_44_verify_final(&sig->sig.sig_44, ctx,
+						 &pk->key.pk_44);
+#else
+		return -EOPNOTSUPP;
+#endif
+	case DILITHIUM_UNKNOWN:
+	default:
+		return -EOPNOTSUPP;
+	}
+}
+EXPORT_SYMBOL(dilithium_verify_final);
+
+#endif /* DILITHIUM_API_H */
diff --git a/crypto/ml_dsa/dilithium_debug.h b/crypto/ml_dsa/dilithium_debug.h
new file mode 100644
index 000000000000..9448c252175f
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_debug.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2023 - 2025, Stephan Mueller <smueller@chronox.de>
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
+#ifndef DILITHIUM_DEBUG_H
+#define DILITHIUM_DEBUG_H
+
+#include "dilithium_type.h"
+
+#ifdef DILITHIUM_DEBUG
+
+/* Disable selftests */
+#define DILITHIUM_TEST_INIT 1
+
+void dilithium_print_buffer(const uint8_t *buffer, const size_t bufferlen,
+			    const char *explanation);
+void dilithium_print_polyvecl_k(polyvecl mat[DILITHIUM_K],
+				const char *explanation);
+void dilithium_print_polyvecl(polyvecl *polyvec, const char *explanation);
+void dilithium_print_polyveck(polyveck *polyvec, const char *explanation);
+void dilithium_print_poly(poly *vec, const char *explanation);
+
+#else /* DILITHIUM_DEBUG */
+
+/* Enable selftests */
+#define DILITHIUM_TEST_INIT 0
+
+static inline void dilithium_print_buffer(const uint8_t *buffer,
+					  const size_t bufferlen,
+					  const char *explanation)
+{
+	(void)buffer;
+	(void)bufferlen;
+	(void)explanation;
+}
+
+static inline void dilithium_print_polyvecl_k(polyvecl mat[DILITHIUM_K],
+					      const char *explanation)
+{
+	(void)mat;
+	(void)explanation;
+}
+
+static inline void dilithium_print_polyvecl(polyvecl *polyvec,
+					    const char *explanation)
+{
+	(void)polyvec;
+	(void)explanation;
+}
+
+static inline void dilithium_print_polyveck(polyveck *polyvec,
+					    const char *explanation)
+{
+	(void)polyvec;
+	(void)explanation;
+}
+
+static inline void dilithium_print_poly(poly *vec, const char *explanation)
+{
+	(void)vec;
+	(void)explanation;
+}
+
+#endif /* DILITHIUM_DEBUG */
+
+#endif /* DILITHIUM_DEBUG_H */
diff --git a/crypto/ml_dsa/dilithium_ntt.c b/crypto/ml_dsa/dilithium_ntt.c
new file mode 100644
index 000000000000..839f4cb8a0aa
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_ntt.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#include "dilithium_ntt.h"
+#include "dilithium_reduce.h"
+
+/**
+ * @brief ntt - Forward NTT, in-place. No modular reduction is performed after
+ *		additions or subtractions. Output vector is in bitreversed
+ *		order.
+ *
+ * @param [in,out] p input/output coefficient array
+ */
+void ntt(int32_t a[DILITHIUM_N])
+{
+	unsigned int len, start, j, k;
+	int32_t zeta, t;
+
+	k = 0;
+
+	for (len = 128; len > 0; len >>= 1) {
+		for (start = 0; start < DILITHIUM_N; start = j + len) {
+			zeta = dilithium_zetas[++k];
+			for (j = start; j < start + len; ++j) {
+				t = montgomery_reduce((int64_t)zeta *
+						      a[j + len]);
+				a[j + len] = a[j] - t;
+				a[j] = a[j] + t;
+			}
+		}
+	}
+}
+
+/**
+ * @brief invntt_tomont - Inverse NTT and multiplication by Montgomery factor
+ *			  2^32. In-place. No modular reductions after additions
+ *			  or subtractions; input coefficients need to be smaller
+ *			  than Q in absolute value. Output coefficient are
+ *			  smaller than Q in absolute value.
+ *
+ * @param [in,out] p input/output coefficient array
+ */
+void invntt_tomont(int32_t a[DILITHIUM_N])
+{
+	unsigned int start, len, j, k;
+	int32_t t, zeta;
+	const int32_t f = 41978; // mont^2/256
+
+	k = 256;
+
+	for (len = 1; len < DILITHIUM_N; len <<= 1) {
+		for (start = 0; start < DILITHIUM_N; start = j + len) {
+			zeta = -dilithium_zetas[--k];
+			for (j = start; j < start + len; ++j) {
+				t = a[j];
+				a[j] = t + a[j + len];
+				a[j + len] = t - a[j + len];
+				a[j + len] = montgomery_reduce((int64_t)zeta *
+							       a[j + len]);
+			}
+		}
+	}
+
+	for (j = 0; j < DILITHIUM_N; ++j)
+		a[j] = montgomery_reduce((int64_t)f * a[j]);
+}
diff --git a/crypto/ml_dsa/dilithium_ntt.h b/crypto/ml_dsa/dilithium_ntt.h
new file mode 100644
index 000000000000..5dfea3a936cd
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_ntt.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#ifndef DILITHIUM_NTT_H
+#define DILITHIUM_NTT_H
+
+#include "dilithium_type.h"
+
+void ntt(int32_t a[DILITHIUM_N]);
+void invntt_tomont(int32_t a[DILITHIUM_N]);
+
+#endif /* DILITHIUM_NTT_H */
diff --git a/crypto/ml_dsa/dilithium_pack.h b/crypto/ml_dsa/dilithium_pack.h
new file mode 100644
index 000000000000..e17c6256a16d
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_pack.h
@@ -0,0 +1,210 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#ifndef DILITHIUM_PACK_H
+#define DILITHIUM_PACK_H
+
+/*******************************************************************************
+ * Pack / Unpack public key
+ ******************************************************************************/
+
+static inline void unpack_pk_rho(uint8_t rho[DILITHIUM_SEEDBYTES],
+				 const struct dilithium_pk *pk)
+{
+	memcpy(rho, pk->pk, DILITHIUM_SEEDBYTES);
+}
+
+static inline void unpack_pk_t1(polyveck *t1, const struct dilithium_pk *pk)
+{
+	unsigned int i;
+	const uint8_t *pubkey = pk->pk + DILITHIUM_SEEDBYTES;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		polyt1_unpack(&t1->vec[i],
+			      pubkey + i * DILITHIUM_POLYT1_PACKEDBYTES);
+}
+
+/*******************************************************************************
+ * Pack / Unpack secret key
+ ******************************************************************************/
+static inline void unpack_sk_key(uint8_t key[DILITHIUM_SEEDBYTES],
+				 const struct dilithium_sk *sk)
+{
+	memcpy(key, sk->sk + DILITHIUM_SEEDBYTES, DILITHIUM_SEEDBYTES);
+}
+
+static inline void unpack_sk_tr(uint8_t tr[DILITHIUM_TRBYTES],
+				const struct dilithium_sk *sk)
+{
+	memcpy(tr, sk->sk + 2 * DILITHIUM_SEEDBYTES, DILITHIUM_TRBYTES);
+}
+
+static inline void unpack_sk_s1(polyvecl *s1, const struct dilithium_sk *sk)
+{
+	unsigned int i;
+	const uint8_t *seckey =
+		sk->sk + 2 * DILITHIUM_SEEDBYTES + DILITHIUM_TRBYTES;
+
+	for (i = 0; i < DILITHIUM_L; ++i)
+		polyeta_unpack(&s1->vec[i],
+			       seckey + i * DILITHIUM_POLYETA_PACKEDBYTES);
+}
+
+static inline void unpack_sk_s2(polyveck *s2, const struct dilithium_sk *sk)
+{
+	unsigned int i;
+	const uint8_t *seckey =
+		sk->sk + 2 * DILITHIUM_SEEDBYTES + DILITHIUM_TRBYTES +
+		DILITHIUM_L * DILITHIUM_POLYETA_PACKEDBYTES;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		polyeta_unpack(&s2->vec[i],
+			       seckey + i * DILITHIUM_POLYETA_PACKEDBYTES);
+}
+
+static inline void unpack_sk_t0(polyveck *t0, const struct dilithium_sk *sk)
+{
+	unsigned int i;
+	const uint8_t *seckey =
+		sk->sk + 2 * DILITHIUM_SEEDBYTES + DILITHIUM_TRBYTES +
+		DILITHIUM_L * DILITHIUM_POLYETA_PACKEDBYTES +
+		DILITHIUM_K * DILITHIUM_POLYETA_PACKEDBYTES;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		polyt0_unpack(&t0->vec[i],
+			      seckey + i * DILITHIUM_POLYT0_PACKEDBYTES);
+}
+
+/**
+ * @brief pack_sig - Bit-pack signature sig = (c, z, h).
+ *
+ * NOTE: A signature is the concatenation of sig = (c || packed z || packed h).
+ *	 As c is already present in the first bytes of sig, this function does
+ *	 not need to copy it yet again to the right location. This implies that
+ *	 this function does not process c.
+ *
+ * @param [out] sig signature
+ * @param [in] z pointer to vector z
+ * @param [in] h pointer to hint vector h
+ */
+static inline void pack_sig(struct dilithium_sig *sig, const polyvecl *z,
+			    const polyveck *h)
+{
+	unsigned int i, j, k;
+	/* Skip c */
+	uint8_t *signature = sig->sig + DILITHIUM_CTILDE_BYTES;
+
+	BUILD_BUG_ON((1ULL << (sizeof(j) << 3)) < DILITHIUM_N);
+	BUILD_BUG_ON((1ULL << (sizeof(k) << 3)) < DILITHIUM_N);
+
+	for (i = 0; i < DILITHIUM_L; ++i)
+		polyz_pack(signature + i * DILITHIUM_POLYZ_PACKEDBYTES,
+			   &z->vec[i]);
+	signature += DILITHIUM_L * DILITHIUM_POLYZ_PACKEDBYTES;
+
+	/* Encode h */
+	memset(signature, 0, DILITHIUM_OMEGA + DILITHIUM_K);
+
+	k = 0;
+	for (i = 0; i < DILITHIUM_K; ++i) {
+		for (j = 0; j < DILITHIUM_N; ++j)
+			if (h->vec[i].coeffs[j] != 0)
+				signature[k++] = (uint8_t)j;
+
+		signature[DILITHIUM_OMEGA + i] = (uint8_t)k;
+	}
+}
+
+/**
+ * @brief unpack_sig_z - Unpack z part of signature sig = (c, z, h).
+ *
+ * NOTE: The c value is not unpacked as it can be used right from the signature.
+ *	 To access it, a caller simply needs to use the first
+ *	 DILITHIUM_CTILDE_BYTES of the signature.
+ *
+ * @param [out] z pointer to output vector z
+ * @param [in] sig signature
+ */
+static inline void unpack_sig_z(polyvecl *z, const struct dilithium_sig *sig)
+{
+	unsigned int i;
+	/* Skip c */
+	const uint8_t *signature = sig->sig + DILITHIUM_CTILDE_BYTES;
+
+	for (i = 0; i < DILITHIUM_L; ++i)
+		polyz_unpack(&z->vec[i],
+			     signature + i * DILITHIUM_POLYZ_PACKEDBYTES);
+}
+
+/**
+ * @brief unpack_sig - Unpack h value of signature sig = (c, z, h).
+ *
+ * NOTE: The c value is not unpacked as it can be used right from the signature.
+ *	 To access it, a caller simply needs to use the first
+ *	 DILITHIUM_CTILDE_BYTES of the signature.
+ *
+ * @param [out] h pointer to output hint vector h
+ * @param [in] sig signature
+ *
+ * @return 1 in case of malformed signature; otherwise 0.
+ */
+static inline int unpack_sig_h(polyveck *h, const struct dilithium_sig *sig)
+{
+	unsigned int i, j, k;
+	/* Skip c */
+	const uint8_t *signature =
+		sig->sig + DILITHIUM_CTILDE_BYTES +
+		DILITHIUM_L * DILITHIUM_POLYZ_PACKEDBYTES;
+
+	/* Decode h */
+	k = 0;
+	for (i = 0; i < DILITHIUM_K; ++i) {
+		for (j = 0; j < DILITHIUM_N; ++j)
+			h->vec[i].coeffs[j] = 0;
+
+		if (signature[DILITHIUM_OMEGA + i] < k ||
+		    signature[DILITHIUM_OMEGA + i] > DILITHIUM_OMEGA)
+			return 1;
+
+		for (j = k; j < signature[DILITHIUM_OMEGA + i]; ++j) {
+			/* Coefficients are ordered for strong unforgeability */
+			if (j > k && signature[j] <= signature[j - 1])
+				return 1;
+			h->vec[i].coeffs[signature[j]] = 1;
+		}
+
+		k = signature[DILITHIUM_OMEGA + i];
+	}
+
+	/* Extra indices are zero for strong unforgeability */
+	for (j = k; j < DILITHIUM_OMEGA; ++j)
+		if (signature[j])
+			return 1;
+
+	return 0;
+}
+
+#endif /* DILITHIUM_PACK_H */
diff --git a/crypto/ml_dsa/dilithium_poly.c b/crypto/ml_dsa/dilithium_poly.c
new file mode 100644
index 000000000000..45ce07d2d4fb
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_poly.c
@@ -0,0 +1,586 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#include "dilithium_poly.h"
+#include "dilithium_poly_common.h"
+#include "dilithium_service_helpers.h"
+#include <crypto/sha3.h>
+
+/**
+ * @brief poly_chknorm - Check infinity norm of polynomial against given bound.
+ *			 Assumes input coefficients were reduced by reduce32().
+ *
+ * @param [in] a pointer to polynomial
+ * @param [in] B norm bound
+ *
+ * @return 0 if norm is strictly smaller than B <= (Q-1)/8 and 1 otherwise.
+ */
+int poly_chknorm(const poly *a, int32_t B)
+{
+	unsigned int i;
+	int32_t t;
+
+	if (B > (DILITHIUM_Q - 1) / 8)
+		return 1;
+
+	/*
+	 * It is ok to leak which coefficient violates the bound since
+	 * the probability for each coefficient *is independent of secret
+	 * data but we must not leak the sign of the centralized representative.
+	 */
+	for (i = 0; i < DILITHIUM_N; ++i) {
+		/* Absolute value */
+		t = a->coeffs[i] >> 31;
+		t = a->coeffs[i] - (t & 2 * a->coeffs[i]);
+
+		if (t >= B)
+			return 1;
+	}
+
+	return 0;
+}
+
+/**
+ * @brief poly_uniform - Sample polynomial with uniformly random coefficients
+ *			 in [0,Q-1] by performing rejection sampling on the
+ *			 output stream of SHAKE128(seed|nonce).
+ *
+ * @param [out] a pointer to output polynomial
+ * @param [in] seed byte array with seed of length DILITHIUM_SEEDBYTES
+ * @param [in] nonce 2-byte nonce
+ */
+void poly_uniform(poly *a, const uint8_t seed[DILITHIUM_SEEDBYTES],
+		  uint16_t nonce, void *ws_buf)
+{
+	struct shake128_ctx hash_ctx;
+	unsigned int i, ctr, off;
+	unsigned int buflen = POLY_UNIFORM_NBLOCKS * SHAKE128_BLOCK_SIZE;
+	uint8_t *buf = ws_buf;
+
+	shake128_init(&hash_ctx);
+	shake128_update(&hash_ctx, seed, DILITHIUM_SEEDBYTES);
+	shake128_update(&hash_ctx, (uint8_t *)&nonce, sizeof(nonce));
+	shake128_squeeze(&hash_ctx, buf, buflen);
+
+	ctr = rej_uniform(a->coeffs, DILITHIUM_N, buf, buflen);
+
+	while (ctr < DILITHIUM_N) {
+		off = buflen % 3;
+		for (i = 0; i < off; ++i)
+			buf[i] = buf[buflen - off + i];
+
+		shake128_squeeze(&hash_ctx, buf + off, SHAKE128_BLOCK_SIZE);
+		buflen = DILITHIUM_SEEDBYTES + off;
+		ctr += rej_uniform(a->coeffs + ctr, DILITHIUM_N - ctr, buf,
+				   buflen);
+	}
+
+	shake128_clear(&hash_ctx);
+}
+
+/**
+ * @brief poly_uniform_eta - Sample polynomial with uniformly random
+ *			     coefficients in [-ETA,ETA] by performing rejection
+ *			     sampling on the output stream from
+ *			     SHAKE256(seed|nonce).
+ *
+ * @param [out] a pointer to output polynomial
+ * @param [in] seed byte array with seed of length DILITHIUM_CRHBYTES
+ * @param [in] nonce 2-byte nonce
+ */
+void poly_uniform_eta(poly *a, const uint8_t seed[DILITHIUM_CRHBYTES],
+		      uint16_t nonce, void *ws_buf)
+{
+	struct shake256_ctx hash_ctx;
+	unsigned int ctr;
+	uint8_t *buf = ws_buf;
+
+	shake256_init(&hash_ctx);
+	shake256_update(&hash_ctx, seed, DILITHIUM_CRHBYTES);
+	shake256_update(&hash_ctx, (uint8_t *)&nonce, sizeof(nonce));
+	shake256_squeeze(&hash_ctx, buf, POLY_UNIFORM_ETA_BYTES);
+
+	ctr = rej_eta(a->coeffs, DILITHIUM_N, buf, POLY_UNIFORM_ETA_BYTES);
+
+	while (ctr < DILITHIUM_N) {
+		shake256_squeeze(&hash_ctx, buf, POLY_UNIFORM_ETA_BYTES);
+
+		ctr += rej_eta(a->coeffs + ctr, DILITHIUM_N - ctr, buf,
+			       SHAKE256_BLOCK_SIZE);
+	}
+
+	shake256_clear(&hash_ctx);
+}
+
+/**
+ * @brief poly_uniform_gamma1 - Sample polynomial with uniformly random
+ *				coefficients in [-(GAMMA1 - 1), GAMMA1] by
+ *				unpacking output stream of
+ *				SHAKE256(seed|nonce).
+ *
+ * @param [out] a pointer to output polynomial
+ * @param [in] seed: byte array with seed of length DILITHIUM_CRHBYTES
+ * @param nonce 16-bit nonce
+ */
+void poly_uniform_gamma1(poly *a, const uint8_t seed[DILITHIUM_CRHBYTES],
+			 uint16_t nonce, void *ws_buf)
+{
+	struct shake256_ctx hash_ctx;
+
+	shake256_init(&hash_ctx);
+	shake256_update(&hash_ctx, seed, DILITHIUM_CRHBYTES);
+	shake256_update(&hash_ctx, (uint8_t *)&nonce, sizeof(nonce));
+	shake256_squeeze(&hash_ctx, ws_buf, POLY_UNIFORM_GAMMA1_BYTES);
+	shake256_clear(&hash_ctx);
+
+	polyz_unpack(a, ws_buf);
+}
+
+/**
+ * @brief poly_challenge - Implementation of H. Samples polynomial with TAU
+ *			   nonzero coefficients in {-1,1} using the output
+ *			   stream of SHAKE256(seed).
+ *
+ * @param [out] c pointer to output polynomial
+ * @param [in] mu byte array containing seed of length DILITHIUM_CTILDE_BYTES
+ */
+void poly_challenge(poly *c, const uint8_t seed[DILITHIUM_CTILDE_BYTES],
+		    void *ws_buf)
+{
+	struct shake256_ctx hash_ctx;
+	unsigned int i, b, pos;
+	uint64_t signs;
+	uint8_t *buf = ws_buf;
+
+	shake256_init(&hash_ctx);
+	shake256_update(&hash_ctx, seed, DILITHIUM_CTILDE_BYTES);
+	shake256_squeeze(&hash_ctx, buf, POLY_CHALLENGE_BYTES);
+
+	signs = 0;
+	for (i = 0; i < 8; ++i)
+		signs |= (uint64_t)buf[i] << 8 * i;
+	pos = 8;
+
+	for (i = 0; i < DILITHIUM_N; ++i)
+		c->coeffs[i] = 0;
+
+	for (i = DILITHIUM_N - DILITHIUM_TAU; i < DILITHIUM_N; ++i) {
+		do {
+			if (pos >= SHAKE256_BLOCK_SIZE) {
+				shake256_squeeze(&hash_ctx, buf, POLY_CHALLENGE_BYTES);
+				pos = 0;
+			}
+
+			b = buf[pos++];
+		} while (b > i);
+
+		c->coeffs[i] = c->coeffs[b];
+		c->coeffs[b] = 1 - (int32_t)(2 * (signs & 1));
+		signs >>= 1;
+	}
+
+	shake256_clear(&hash_ctx);
+}
+
+/**
+ * @brief polyeta_pack - Bit-pack polynomial with coefficients in [-ETA,ETA].
+ *
+ * @param [out] r pointer to output byte array with at least
+ *		  DILITHIUM_POLYETA_PACKEDBYTES bytes
+ * @param [in] a pointer to input polynomial
+ */
+void polyeta_pack(uint8_t *r, const poly *a)
+{
+	unsigned int i;
+	uint8_t t[8];
+
+#if DILITHIUM_ETA == 2
+	for (i = 0; i < DILITHIUM_N / 8; ++i) {
+		t[0] = (uint8_t)(DILITHIUM_ETA - a->coeffs[8 * i + 0]);
+		t[1] = (uint8_t)(DILITHIUM_ETA - a->coeffs[8 * i + 1]);
+		t[2] = (uint8_t)(DILITHIUM_ETA - a->coeffs[8 * i + 2]);
+		t[3] = (uint8_t)(DILITHIUM_ETA - a->coeffs[8 * i + 3]);
+		t[4] = (uint8_t)(DILITHIUM_ETA - a->coeffs[8 * i + 4]);
+		t[5] = (uint8_t)(DILITHIUM_ETA - a->coeffs[8 * i + 5]);
+		t[6] = (uint8_t)(DILITHIUM_ETA - a->coeffs[8 * i + 6]);
+		t[7] = (uint8_t)(DILITHIUM_ETA - a->coeffs[8 * i + 7]);
+
+		r[3 * i + 0] =
+			(uint8_t)((t[0] >> 0) | (t[1] << 3) | (t[2] << 6));
+		r[3 * i + 1] = (uint8_t)((t[2] >> 2) | (t[3] << 1) |
+					 (t[4] << 4) | (t[5] << 7));
+		r[3 * i + 2] =
+			(uint8_t)((t[5] >> 1) | (t[6] << 2) | (t[7] << 5));
+	}
+#elif DILITHIUM_ETA == 4
+	for (i = 0; i < DILITHIUM_N / 2; ++i) {
+		t[0] = (uint8_t)(DILITHIUM_ETA - a->coeffs[2 * i + 0]);
+		t[1] = (uint8_t)(DILITHIUM_ETA - a->coeffs[2 * i + 1]);
+		r[i] = (uint8_t)(t[0] | (t[1] << 4));
+	}
+#else
+#error "Undefined DILITHIUM_ETA"
+#endif
+}
+
+/**
+ * @brief polyeta_unpack - Unpack polynomial with coefficients in [-ETA,ETA].
+ *
+ * @param [out] r pointer to output polynomial
+ * @param [in] a byte array with bit-packed polynomial
+ */
+void polyeta_unpack(poly *r, const uint8_t *a)
+{
+	unsigned int i;
+
+#if DILITHIUM_ETA == 2
+	for (i = 0; i < DILITHIUM_N / 8; ++i) {
+		r->coeffs[8 * i + 0] = (a[3 * i + 0] >> 0) & 7;
+		r->coeffs[8 * i + 1] = (a[3 * i + 0] >> 3) & 7;
+		r->coeffs[8 * i + 2] =
+			((a[3 * i + 0] >> 6) | (a[3 * i + 1] << 2)) & 7;
+		r->coeffs[8 * i + 3] = (a[3 * i + 1] >> 1) & 7;
+		r->coeffs[8 * i + 4] = (a[3 * i + 1] >> 4) & 7;
+		r->coeffs[8 * i + 5] =
+			((a[3 * i + 1] >> 7) | (a[3 * i + 2] << 1)) & 7;
+		r->coeffs[8 * i + 6] = (a[3 * i + 2] >> 2) & 7;
+		r->coeffs[8 * i + 7] = (a[3 * i + 2] >> 5) & 7;
+
+		r->coeffs[8 * i + 0] = DILITHIUM_ETA - r->coeffs[8 * i + 0];
+		r->coeffs[8 * i + 1] = DILITHIUM_ETA - r->coeffs[8 * i + 1];
+		r->coeffs[8 * i + 2] = DILITHIUM_ETA - r->coeffs[8 * i + 2];
+		r->coeffs[8 * i + 3] = DILITHIUM_ETA - r->coeffs[8 * i + 3];
+		r->coeffs[8 * i + 4] = DILITHIUM_ETA - r->coeffs[8 * i + 4];
+		r->coeffs[8 * i + 5] = DILITHIUM_ETA - r->coeffs[8 * i + 5];
+		r->coeffs[8 * i + 6] = DILITHIUM_ETA - r->coeffs[8 * i + 6];
+		r->coeffs[8 * i + 7] = DILITHIUM_ETA - r->coeffs[8 * i + 7];
+	}
+#elif DILITHIUM_ETA == 4
+	for (i = 0; i < DILITHIUM_N / 2; ++i) {
+		r->coeffs[2 * i + 0] = a[i] & 0x0F;
+		r->coeffs[2 * i + 1] = a[i] >> 4;
+		r->coeffs[2 * i + 0] = DILITHIUM_ETA - r->coeffs[2 * i + 0];
+		r->coeffs[2 * i + 1] = DILITHIUM_ETA - r->coeffs[2 * i + 1];
+	}
+#else
+#error "Undefined DILITHIUM_ETA"
+#endif
+}
+
+/**
+ * @brief polyt1_pack - Bit-pack polynomial t1 with coefficients fitting in 10
+ *			bits. Input coefficients are assumed to be standard
+ *			representatives.
+ *
+ * @param [out] r pointer to output byte array with at least
+ * 		  DILITHIUM_POLYT1_PACKEDBYTES bytes
+ * @param [in] a pointer to input polynomial
+ */
+void polyt1_pack(uint8_t *r, const poly *a)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_N / 4; ++i) {
+		r[5 * i + 0] = (uint8_t)((a->coeffs[4 * i + 0] >> 0));
+		r[5 * i + 1] = (uint8_t)((a->coeffs[4 * i + 0] >> 8) |
+					 (a->coeffs[4 * i + 1] << 2));
+		r[5 * i + 2] = (uint8_t)((a->coeffs[4 * i + 1] >> 6) |
+					 (a->coeffs[4 * i + 2] << 4));
+		r[5 * i + 3] = (uint8_t)((a->coeffs[4 * i + 2] >> 4) |
+					 (a->coeffs[4 * i + 3] << 6));
+		r[5 * i + 4] = (uint8_t)((a->coeffs[4 * i + 3] >> 2));
+	}
+}
+
+/**
+ * @brief polyt0_pack - Bit-pack polynomial t0 with coefficients in
+ *			]-2^{D-1}, 2^{D-1}].
+ *
+ * @param [out] r pointer to output byte array with at least
+ *		  DILITHIUM_POLYT0_PACKEDBYTES bytes
+ * @param [in] a pointer to input polynomial
+ */
+void polyt0_pack(uint8_t *r, const poly *a)
+{
+	unsigned int i;
+	uint32_t t[8];
+
+	for (i = 0; i < DILITHIUM_N / 8; ++i) {
+		t[0] = (uint32_t)((1 << (DILITHIUM_D - 1)) -
+				  a->coeffs[8 * i + 0]);
+		t[1] = (uint32_t)((1 << (DILITHIUM_D - 1)) -
+				  a->coeffs[8 * i + 1]);
+		t[2] = (uint32_t)((1 << (DILITHIUM_D - 1)) -
+				  a->coeffs[8 * i + 2]);
+		t[3] = (uint32_t)((1 << (DILITHIUM_D - 1)) -
+				  a->coeffs[8 * i + 3]);
+		t[4] = (uint32_t)((1 << (DILITHIUM_D - 1)) -
+				  a->coeffs[8 * i + 4]);
+		t[5] = (uint32_t)((1 << (DILITHIUM_D - 1)) -
+				  a->coeffs[8 * i + 5]);
+		t[6] = (uint32_t)((1 << (DILITHIUM_D - 1)) -
+				  a->coeffs[8 * i + 6]);
+		t[7] = (uint32_t)((1 << (DILITHIUM_D - 1)) -
+				  a->coeffs[8 * i + 7]);
+
+		r[13 * i + 0] = (uint8_t)(t[0]);
+		r[13 * i + 1] = (uint8_t)(t[0] >> 8);
+		r[13 * i + 1] |= (uint8_t)(t[1] << 5);
+		r[13 * i + 2] = (uint8_t)(t[1] >> 3);
+		r[13 * i + 3] = (uint8_t)(t[1] >> 11);
+		r[13 * i + 3] |= (uint8_t)(t[2] << 2);
+		r[13 * i + 4] = (uint8_t)(t[2] >> 6);
+		r[13 * i + 4] |= (uint8_t)(t[3] << 7);
+		r[13 * i + 5] = (uint8_t)(t[3] >> 1);
+		r[13 * i + 6] = (uint8_t)(t[3] >> 9);
+		r[13 * i + 6] |= (uint8_t)(t[4] << 4);
+		r[13 * i + 7] = (uint8_t)(t[4] >> 4);
+		r[13 * i + 8] = (uint8_t)(t[4] >> 12);
+		r[13 * i + 8] |= (uint8_t)(t[5] << 1);
+		r[13 * i + 9] = (uint8_t)(t[5] >> 7);
+		r[13 * i + 9] |= (uint8_t)(t[6] << 6);
+		r[13 * i + 10] = (uint8_t)(t[6] >> 2);
+		r[13 * i + 11] = (uint8_t)(t[6] >> 10);
+		r[13 * i + 11] |= (uint8_t)(t[7] << 3);
+		r[13 * i + 12] = (uint8_t)(t[7] >> 5);
+	}
+
+	memzero_explicit(t, sizeof(t));
+}
+
+/**
+ * @brief polyt0_unpack - Unpack polynomial t0 with coefficients in
+ *			  ]-2^{D-1}, 2^{D-1}].
+ *
+ * @param [out] r pointer to output polynomial
+ * @param [in] a byte array with bit-packed polynomial
+ */
+void polyt0_unpack(poly *r, const uint8_t *a)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_N / 8; ++i) {
+		r->coeffs[8 * i + 0] = a[13 * i + 0];
+		r->coeffs[8 * i + 0] |= (int32_t)a[13 * i + 1] << 8;
+		r->coeffs[8 * i + 0] &= 0x1FFF;
+
+		r->coeffs[8 * i + 1] = a[13 * i + 1] >> 5;
+		r->coeffs[8 * i + 1] |= (int32_t)a[13 * i + 2] << 3;
+		r->coeffs[8 * i + 1] |= (int32_t)a[13 * i + 3] << 11;
+		r->coeffs[8 * i + 1] &= 0x1FFF;
+
+		r->coeffs[8 * i + 2] = a[13 * i + 3] >> 2;
+		r->coeffs[8 * i + 2] |= (int32_t)a[13 * i + 4] << 6;
+		r->coeffs[8 * i + 2] &= 0x1FFF;
+
+		r->coeffs[8 * i + 3] = a[13 * i + 4] >> 7;
+		r->coeffs[8 * i + 3] |= (int32_t)a[13 * i + 5] << 1;
+		r->coeffs[8 * i + 3] |= (int32_t)a[13 * i + 6] << 9;
+		r->coeffs[8 * i + 3] &= 0x1FFF;
+
+		r->coeffs[8 * i + 4] = a[13 * i + 6] >> 4;
+		r->coeffs[8 * i + 4] |= (int32_t)a[13 * i + 7] << 4;
+		r->coeffs[8 * i + 4] |= (int32_t)a[13 * i + 8] << 12;
+		r->coeffs[8 * i + 4] &= 0x1FFF;
+
+		r->coeffs[8 * i + 5] = a[13 * i + 8] >> 1;
+		r->coeffs[8 * i + 5] |= (int32_t)a[13 * i + 9] << 7;
+		r->coeffs[8 * i + 5] &= 0x1FFF;
+
+		r->coeffs[8 * i + 6] = a[13 * i + 9] >> 6;
+		r->coeffs[8 * i + 6] |= (int32_t)a[13 * i + 10] << 2;
+		r->coeffs[8 * i + 6] |= (int32_t)a[13 * i + 11] << 10;
+		r->coeffs[8 * i + 6] &= 0x1FFF;
+
+		r->coeffs[8 * i + 7] = a[13 * i + 11] >> 3;
+		r->coeffs[8 * i + 7] |= (int32_t)a[13 * i + 12] << 5;
+		r->coeffs[8 * i + 7] &= 0x1FFF;
+
+		r->coeffs[8 * i + 0] =
+			(1 << (DILITHIUM_D - 1)) - r->coeffs[8 * i + 0];
+		r->coeffs[8 * i + 1] =
+			(1 << (DILITHIUM_D - 1)) - r->coeffs[8 * i + 1];
+		r->coeffs[8 * i + 2] =
+			(1 << (DILITHIUM_D - 1)) - r->coeffs[8 * i + 2];
+		r->coeffs[8 * i + 3] =
+			(1 << (DILITHIUM_D - 1)) - r->coeffs[8 * i + 3];
+		r->coeffs[8 * i + 4] =
+			(1 << (DILITHIUM_D - 1)) - r->coeffs[8 * i + 4];
+		r->coeffs[8 * i + 5] =
+			(1 << (DILITHIUM_D - 1)) - r->coeffs[8 * i + 5];
+		r->coeffs[8 * i + 6] =
+			(1 << (DILITHIUM_D - 1)) - r->coeffs[8 * i + 6];
+		r->coeffs[8 * i + 7] =
+			(1 << (DILITHIUM_D - 1)) - r->coeffs[8 * i + 7];
+	}
+}
+
+/**
+ * @param polyz_pack - Bit-pack polynomial with coefficients
+ *		       in [-(GAMMA1 - 1), GAMMA1].
+ *
+ * @param [out] r pointer to output byte array with at least
+ *		  DILITHIUM_POLYZ_PACKEDBYTES bytes
+ * @param [in] a pointer to input polynomial
+ */
+void polyz_pack(uint8_t *r, const poly *a)
+{
+	unsigned int i;
+	uint32_t t[4];
+
+#if DILITHIUM_GAMMA1 == (1 << 17)
+	for (i = 0; i < DILITHIUM_N / 4; ++i) {
+		t[0] = (uint32_t)(DILITHIUM_GAMMA1 - a->coeffs[4 * i + 0]);
+		t[1] = (uint32_t)(DILITHIUM_GAMMA1 - a->coeffs[4 * i + 1]);
+		t[2] = (uint32_t)(DILITHIUM_GAMMA1 - a->coeffs[4 * i + 2]);
+		t[3] = (uint32_t)(DILITHIUM_GAMMA1 - a->coeffs[4 * i + 3]);
+
+		r[9 * i + 0] = (uint8_t)(t[0]);
+		r[9 * i + 1] = (uint8_t)(t[0] >> 8);
+		r[9 * i + 2] = (uint8_t)(t[0] >> 16);
+		r[9 * i + 2] |= (uint8_t)(t[1] << 2);
+		r[9 * i + 3] = (uint8_t)(t[1] >> 6);
+		r[9 * i + 4] = (uint8_t)(t[1] >> 14);
+		r[9 * i + 4] |= (uint8_t)(t[2] << 4);
+		r[9 * i + 5] = (uint8_t)(t[2] >> 4);
+		r[9 * i + 6] = (uint8_t)(t[2] >> 12);
+		r[9 * i + 6] |= (uint8_t)(t[3] << 6);
+		r[9 * i + 7] = (uint8_t)(t[3] >> 2);
+		r[9 * i + 8] = (uint8_t)(t[3] >> 10);
+	}
+#elif DILITHIUM_GAMMA1 == (1 << 19)
+	for (i = 0; i < DILITHIUM_N / 2; ++i) {
+		t[0] = (uint32_t)(DILITHIUM_GAMMA1 - a->coeffs[2 * i + 0]);
+		t[1] = (uint32_t)(DILITHIUM_GAMMA1 - a->coeffs[2 * i + 1]);
+
+		r[5 * i + 0] = (uint8_t)(t[0]);
+		r[5 * i + 1] = (uint8_t)(t[0] >> 8);
+		r[5 * i + 2] = (uint8_t)(t[0] >> 16);
+		r[5 * i + 2] |= (uint8_t)(t[1] << 4);
+		r[5 * i + 3] = (uint8_t)(t[1] >> 4);
+		r[5 * i + 4] = (uint8_t)(t[1] >> 12);
+	}
+#else
+#error "Undefined Gamma"
+#endif
+
+	memzero_explicit(t, sizeof(t));
+}
+
+/**
+ * @brief polyz_unpack - Unpack polynomial z with coefficients
+ *			 in [-(GAMMA1 - 1), GAMMA1].
+ *
+ * @param [out] r pointer to output polynomial
+ * @param [in] a byte array with bit-packed polynomial
+ */
+void polyz_unpack(poly *r, const uint8_t *a)
+{
+	unsigned int i;
+
+#if DILITHIUM_GAMMA1 == (1 << 17)
+	for (i = 0; i < DILITHIUM_N / 4; ++i) {
+		r->coeffs[4 * i + 0] = a[9 * i + 0];
+		r->coeffs[4 * i + 0] |= (int32_t)a[9 * i + 1] << 8;
+		r->coeffs[4 * i + 0] |= (int32_t)a[9 * i + 2] << 16;
+		r->coeffs[4 * i + 0] &= 0x3FFFF;
+
+		r->coeffs[4 * i + 1] = a[9 * i + 2] >> 2;
+		r->coeffs[4 * i + 1] |= (int32_t)a[9 * i + 3] << 6;
+		r->coeffs[4 * i + 1] |= (int32_t)a[9 * i + 4] << 14;
+		r->coeffs[4 * i + 1] &= 0x3FFFF;
+
+		r->coeffs[4 * i + 2] = a[9 * i + 4] >> 4;
+		r->coeffs[4 * i + 2] |= (int32_t)a[9 * i + 5] << 4;
+		r->coeffs[4 * i + 2] |= (int32_t)a[9 * i + 6] << 12;
+		r->coeffs[4 * i + 2] &= 0x3FFFF;
+
+		r->coeffs[4 * i + 3] = a[9 * i + 6] >> 6;
+		r->coeffs[4 * i + 3] |= (int32_t)a[9 * i + 7] << 2;
+		r->coeffs[4 * i + 3] |= (int32_t)a[9 * i + 8] << 10;
+		r->coeffs[4 * i + 3] &= 0x3FFFF;
+
+		r->coeffs[4 * i + 0] =
+			DILITHIUM_GAMMA1 - r->coeffs[4 * i + 0];
+		r->coeffs[4 * i + 1] =
+			DILITHIUM_GAMMA1 - r->coeffs[4 * i + 1];
+		r->coeffs[4 * i + 2] =
+			DILITHIUM_GAMMA1 - r->coeffs[4 * i + 2];
+		r->coeffs[4 * i + 3] =
+			DILITHIUM_GAMMA1 - r->coeffs[4 * i + 3];
+	}
+#elif DILITHIUM_GAMMA1 == (1 << 19)
+	for (i = 0; i < DILITHIUM_N / 2; ++i) {
+		r->coeffs[2 * i + 0] = a[5 * i + 0];
+		r->coeffs[2 * i + 0] |= (int32_t)a[5 * i + 1] << 8;
+		r->coeffs[2 * i + 0] |= (int32_t)a[5 * i + 2] << 16;
+		r->coeffs[2 * i + 0] &= 0xFFFFF;
+
+		r->coeffs[2 * i + 1] = a[5 * i + 2] >> 4;
+		r->coeffs[2 * i + 1] |= (int32_t)a[5 * i + 3] << 4;
+		r->coeffs[2 * i + 1] |= (int32_t)a[5 * i + 4] << 12;
+		r->coeffs[2 * i + 1] &= 0xFFFFF;
+
+		r->coeffs[2 * i + 0] =
+			DILITHIUM_GAMMA1 - r->coeffs[2 * i + 0];
+		r->coeffs[2 * i + 1] =
+			DILITHIUM_GAMMA1 - r->coeffs[2 * i + 1];
+	}
+#else
+#error "Undefined Gamma"
+#endif
+}
+
+/**
+ * @brief polyw1_pack - Bit-pack polynomial w1 with coefficients in [0,15] or
+ *			[0,43]. Input coefficients are assumed to be standard
+ *			representatives.
+ *
+ * @param [out] r pointer to output byte array with at least
+ *		  DILITHIUM_POLYW1_PACKEDBYTES bytes
+ * @param [in] a pointer to input polynomial
+ */
+void polyw1_pack(uint8_t *r, const poly *a)
+{
+	unsigned int i;
+
+#if DILITHIUM_GAMMA2 == (DILITHIUM_Q - 1) / 88
+	for (i = 0; i < DILITHIUM_N / 4; ++i) {
+		r[3 * i + 0] = (uint8_t)(a->coeffs[4 * i + 0]);
+		r[3 * i + 0] |= (uint8_t)(a->coeffs[4 * i + 1] << 6);
+		r[3 * i + 1] = (uint8_t)(a->coeffs[4 * i + 1] >> 2);
+		r[3 * i + 1] |= (uint8_t)(a->coeffs[4 * i + 2] << 4);
+		r[3 * i + 2] = (uint8_t)(a->coeffs[4 * i + 2] >> 4);
+		r[3 * i + 2] |= (uint8_t)(a->coeffs[4 * i + 3] << 2);
+	}
+#elif DILITHIUM_GAMMA2 == (DILITHIUM_Q - 1) / 32
+	for (i = 0; i < DILITHIUM_N / 2; ++i)
+		r[i] = (uint8_t)(a->coeffs[2 * i + 0] |
+				 (a->coeffs[2 * i + 1] << 4));
+#else
+#error "Undefined Gamma"
+#endif
+}
diff --git a/crypto/ml_dsa/dilithium_poly.h b/crypto/ml_dsa/dilithium_poly.h
new file mode 100644
index 000000000000..a894f5483fe8
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_poly.h
@@ -0,0 +1,190 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#ifndef DILITHIUM_POLY_H
+#define DILITHIUM_POLY_H
+
+#include "dilithium_type.h"
+#include "dilithium_reduce.h"
+#include "dilithium_rounding.h"
+
+typedef struct {
+	int32_t coeffs[DILITHIUM_N];
+} poly;
+
+/**
+ * @brief poly_add - Add polynomials. No modular reduction is performed.
+ *
+ * @param [out] c pointer to output polynomial
+ * @param [in] a pointer to first summand
+ * @param [in] b pointer to second summand
+ */
+static inline void poly_add(poly *c, const poly *a, const poly *b)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_N; ++i)
+		c->coeffs[i] = a->coeffs[i] + b->coeffs[i];
+}
+
+/**
+ * @brief poly_sub - Subtract polynomials. No modular reduction is
+ *		     performed.
+ *
+ * @param [out] c pointer to output polynomial
+ * @param [in] a pointer to first input polynomial
+ * @param [in] b pointer to second input polynomial to be subtraced from first
+ *		 input polynomial
+ */
+static inline void poly_sub(poly *c, const poly *a, const poly *b)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_N; ++i)
+		c->coeffs[i] = a->coeffs[i] - b->coeffs[i];
+}
+
+/**
+ * @brief poly_shiftl - Multiply polynomial by 2^D without modular reduction.
+ *			Assumes input coefficients to be less than 2^{31-D} in
+ *			absolute value.
+ *
+ * @param [in,out] a pointer to input/output polynomial
+ */
+static inline void poly_shiftl(poly *a)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_N; ++i)
+		a->coeffs[i] <<= DILITHIUM_D;
+}
+
+/**
+ * @brief poly_decompose - For all coefficients c of the input polynomial,
+ *			   compute high and low bits c0, c1 such
+ *			   c mod Q = c1*ALPHA + c0 with
+ *			   -ALPHA/2 < c0 <= ALPHA/2 except c1 = (Q-1)/ALPHA
+ *			   where we set c1 = 0 and
+ *			   -ALPHA/2 <= c0 = c mod Q - Q < 0.
+ *			   Assumes coefficients to be standard representatives.
+ *
+ * @param [out] a1 pointer to output polynomial with coefficients c1
+ * @param [out] a0 pointer to output polynomial with coefficients c0
+ * @param [in] a pointer to input polynomial
+ */
+static inline void poly_decompose(poly *a1, poly *a0, const poly *a)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_N; ++i)
+		a1->coeffs[i] = decompose(&a0->coeffs[i], a->coeffs[i]);
+}
+
+/**
+ * @brief poly_make_hint - Compute hint polynomial. The coefficients of which
+ *			   indicate whether the low bits of the corresponding
+ *			   coefficient of the input polynomial overflow into the
+ *			   high bits.
+ *
+ * @param [out] h pointer to output hint polynomial
+ * @param [in] a0 pointer to low part of input polynomial
+ * @param [in] a1 pointer to high part of input polynomial
+ *
+ * @return number of 1 bits.
+ */
+static inline unsigned int poly_make_hint(poly *h, const poly *a0,
+					  const poly *a1)
+{
+	unsigned int i, s = 0;
+
+	for (i = 0; i < DILITHIUM_N; ++i) {
+		h->coeffs[i] = make_hint(a0->coeffs[i], a1->coeffs[i]);
+		s += (unsigned int)h->coeffs[i];
+	}
+
+	return s;
+}
+
+/**
+ * @brief poly_use_hint - Use hint polynomial to correct the high bits of a
+ *			  polynomial.
+ *
+ * @param [out] b pointer to output polynomial with corrected high bits
+ * @param [in] a pointer to input polynomial
+ * @param [in] h pointer to input hint polynomial
+ */
+static inline void poly_use_hint(poly *b, const poly *a, const poly *h)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_N; ++i)
+		b->coeffs[i] = use_hint(a->coeffs[i], h->coeffs[i]);
+}
+
+int poly_chknorm(const poly *a, int32_t B);
+
+#define POLY_UNIFORM_NBLOCKS                                                   \
+	((768 + SHAKE128_BLOCK_SIZE - 1) / SHAKE128_BLOCK_SIZE)
+void poly_uniform(poly *a, const uint8_t seed[DILITHIUM_SEEDBYTES],
+		  uint16_t nonce, void *ws_buf);
+
+#if DILITHIUM_ETA == 2
+#define POLY_UNIFORM_ETA_NBLOCKS                                               \
+	((136 + SHAKE256_BLOCK_SIZE - 1) / SHAKE256_BLOCK_SIZE)
+#elif DILITHIUM_ETA == 4
+#define POLY_UNIFORM_ETA_NBLOCKS                                               \
+	((227 + SHAKE256_BLOCK_SIZE - 1) / SHAKE256_BLOCK_SIZE)
+#else
+#error "Undefined DILITHIUM_ETA"
+#endif
+#define POLY_UNIFORM_ETA_BYTES POLY_UNIFORM_ETA_NBLOCKS *SHAKE256_BLOCK_SIZE
+void poly_uniform_eta(poly *a, const uint8_t seed[DILITHIUM_CRHBYTES],
+		      uint16_t nonce, void *ws_buf);
+
+#define POLY_UNIFORM_GAMMA1_NBLOCKS                                            \
+	((DILITHIUM_POLYZ_PACKEDBYTES + SHAKE256_BLOCK_SIZE - 1) /      \
+	 SHAKE256_BLOCK_SIZE)
+#define POLY_UNIFORM_GAMMA1_BYTES                                              \
+	POLY_UNIFORM_GAMMA1_NBLOCKS *SHAKE256_BLOCK_SIZE
+
+#define POLY_CHALLENGE_BYTES SHAKE256_BLOCK_SIZE
+void poly_challenge(poly *c, const uint8_t seed[DILITHIUM_CTILDE_BYTES],
+		    void *ws_buf);
+
+void polyeta_pack(uint8_t *r, const poly *a);
+void polyeta_unpack(poly *r, const uint8_t *a);
+
+void polyt1_pack(uint8_t *r, const poly *a);
+
+void polyt0_pack(uint8_t *r, const poly *a);
+void polyt0_unpack(poly *r, const uint8_t *a);
+
+void polyz_pack(uint8_t *r, const poly *a);
+void polyz_unpack(poly *r, const uint8_t *a);
+
+void polyw1_pack(uint8_t *r, const poly *a);
+
+#endif /* DILITHIUM_POLY_H */
diff --git a/crypto/ml_dsa/dilithium_poly_c.h b/crypto/ml_dsa/dilithium_poly_c.h
new file mode 100644
index 000000000000..ca0107f75bab
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_poly_c.h
@@ -0,0 +1,149 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2023 - 2025, Stephan Mueller <smueller@chronox.de>
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
+#ifndef DILITHIUM_POLY_C_H
+#define DILITHIUM_POLY_C_H
+
+#include "dilithium_ntt.h"
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+/**
+ * @brief poly_reduce - Inplace reduction of all coefficients of polynomial to
+ *			representative in [-6283009,6283007].
+ *
+ * @param [in,out] a pointer to input/output polynomial
+ */
+static inline void poly_reduce(poly *a)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_N; ++i)
+		a->coeffs[i] = reduce32(a->coeffs[i]);
+}
+
+/**
+ * @brief poly_caddq - For all coefficients of in/out polynomial add Q if
+ *		       coefficient is negative.
+ *
+ * @param [in,out] a pointer to input/output polynomial
+ */
+static inline void poly_caddq(poly *a)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_N; ++i)
+		a->coeffs[i] = caddq(a->coeffs[i]);
+}
+
+/**
+ * @brief poly_pointwise_montgomery - Pointwise multiplication of polynomials in
+ *				      NTT domain representation and
+ *				      multiplication of resulting polynomial
+ *				      by 2^{-32}.
+ *
+ * @param [out] c pointer to output polynomial
+ * @param [in] a pointer to first input polynomial
+ * @param [in] b pointer to second input polynomial
+ */
+static inline void poly_pointwise_montgomery(poly *c, const poly *a,
+					     const poly *b)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_N; ++i)
+		c->coeffs[i] =
+			montgomery_reduce((int64_t)a->coeffs[i] * b->coeffs[i]);
+}
+
+/**
+ * @brief poly_power2round - For all coefficients c of the input polynomial,
+ *			     compute c0, c1 such that c mod Q = c1*2^D + c0
+ *			     with -2^{D-1} < c0 <= 2^{D-1}. Assumes coefficients
+ *			     to be standard representatives.
+ *
+ * @param [out] a1 pointer to output polynomial with coefficients c1
+ * @param [out] a0 pointer to output polynomial with coefficients c0
+ * @param [in] a pointer to input polynomial
+ */
+static inline void poly_power2round(poly *a1, poly *a0, const poly *a)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_N; ++i)
+		a1->coeffs[i] = power2round(&a0->coeffs[i], a->coeffs[i]);
+}
+
+/**
+ * @brief polyt1_unpack - Unpack polynomial t1 with 10-bit coefficients.
+ *			  Output coefficients are standard representatives.
+ *
+ * @param [out] r pointer to output polynomial
+ * @param [in] a byte array with bit-packed polynomial
+ */
+static inline void polyt1_unpack(poly *r, const uint8_t *a)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_N / 4; ++i) {
+		r->coeffs[4 * i + 0] =
+			((a[5 * i + 0] >> 0) | ((uint32_t)a[5 * i + 1] << 8)) &
+			0x3FF;
+		r->coeffs[4 * i + 1] =
+			((a[5 * i + 1] >> 2) | ((uint32_t)a[5 * i + 2] << 6)) &
+			0x3FF;
+		r->coeffs[4 * i + 2] =
+			((a[5 * i + 2] >> 4) | ((uint32_t)a[5 * i + 3] << 4)) &
+			0x3FF;
+		r->coeffs[4 * i + 3] =
+			((a[5 * i + 3] >> 6) | ((uint32_t)a[5 * i + 4] << 2)) &
+			0x3FF;
+	}
+}
+
+/**
+ * @brief poly_ntt - Inplace forward NTT. Coefficients can grow by
+ *		     8*Q in absolute value.
+ *
+ * @param [in,out] a pointer to input/output polynomial
+ */
+static inline void poly_ntt(poly *a)
+{
+	ntt(a->coeffs);
+}
+
+/**
+ * @brief poly_invntt_tomont - Inplace inverse NTT and multiplication by 2^{32}.
+ *			       Input coefficients need to be less than Q in
+ *			       absolute value and output coefficients are again
+ *			       bounded by Q.
+ *
+ * @param [in,out] a pointer to input/output polynomial
+ */
+static inline void poly_invntt_tomont(poly *a)
+{
+	invntt_tomont(a->coeffs);
+}
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* DILITHIUM_POLY_C_H */
diff --git a/crypto/ml_dsa/dilithium_poly_common.h b/crypto/ml_dsa/dilithium_poly_common.h
new file mode 100644
index 000000000000..7c7cef28b545
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_poly_common.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#ifndef DILITHIUM_POLY_COMMON_H
+#define DILITHIUM_POLY_COMMON_H
+
+#include "dilithium_type.h"
+
+void poly_uniform_gamma1(poly *a, const uint8_t seed[DILITHIUM_CRHBYTES],
+			 uint16_t nonce, void *ws_buf);
+
+#endif /* DILITHIUM_POLY_COMMON_H */
diff --git a/crypto/ml_dsa/dilithium_polyvec.h b/crypto/ml_dsa/dilithium_polyvec.h
new file mode 100644
index 000000000000..7e428e3becfd
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_polyvec.h
@@ -0,0 +1,343 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#ifndef DILITHIUM_POLYVEC_H
+#define DILITHIUM_POLYVEC_H
+
+#include "dilithium_type.h"
+#include "dilithium_poly.h"
+
+typedef struct {
+	poly vec[DILITHIUM_L];
+} polyvecl;
+
+/* Vectors of polynomials of length K */
+typedef struct {
+	poly vec[DILITHIUM_K];
+} polyveck;
+
+/**************************************************************/
+/************ Vectors of polynomials of length L **************/
+/**************************************************************/
+
+static inline void polyvecl_reduce(polyvecl *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_L; ++i)
+		poly_reduce(&v->vec[i]);
+}
+
+/**
+ * @brief polyvecl_add - Add vectors of polynomials of length L.
+ *			 No modular reduction is performed.
+ *
+ * @param [out] w pointer to output vector
+ * @param [in] u pointer to first summand
+ * @param [in] v pointer to second summand
+ */
+static inline void polyvecl_add(polyvecl *w, const polyvecl *u,
+				const polyvecl *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_L; ++i)
+		poly_add(&w->vec[i], &u->vec[i], &v->vec[i]);
+}
+
+/**
+ * @brief polyvecl_ntt - Forward NTT of all polynomials in vector of length L.
+ *			 Output coefficients can be up to 16*Q larger than input
+ *			 coefficients.
+ *
+ * @param [in,out] v pointer to input/output vector
+ */
+static inline void polyvecl_ntt(polyvecl *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_L; ++i)
+		poly_ntt(&v->vec[i]);
+}
+
+static inline void polyvecl_invntt_tomont(polyvecl *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_L; ++i)
+		poly_invntt_tomont(&v->vec[i]);
+}
+
+static inline void polyvecl_pointwise_poly_montgomery(polyvecl *r,
+						      const poly *a,
+						      const polyvecl *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_L; ++i)
+		poly_pointwise_montgomery(&r->vec[i], a, &v->vec[i]);
+}
+
+/**
+ * @brief polyvecl_chknorm - Check infinity norm of polynomials in vector of
+ *			     length L. Assumes input polyvecl to be reduced by
+ *			     polyvecl_reduce().
+ *
+ * @param [in] v pointer to vector
+ * @param [in] bound norm bound
+ *
+ * @return 0 if norm of all polynomials is strictly smaller than B <= (Q-1)/8
+ * and 1 otherwise.
+ */
+static inline int polyvecl_chknorm(const polyvecl *v, int32_t bound)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_L; ++i)
+		if (poly_chknorm(&v->vec[i], bound))
+			return 1;
+
+	return 0;
+}
+
+/**************************************************************/
+/************ Vectors of polynomials of length K **************/
+/**************************************************************/
+
+/**
+ * @brief polyveck_reduce - Reduce coefficients of polynomials in vector of
+ *			    length DILITHIUM_K to representatives in
+ *			    [-6283009,6283007].
+ *
+ * @param [in,out] v pointer to input/output vector
+ */
+static inline void polyveck_reduce(polyveck *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		poly_reduce(&v->vec[i]);
+}
+
+/**
+ * @brief polyveck_caddq - For all coefficients of polynomials in vector of
+ * 			   length DILITHIUM_K add DILITHIUM_Q if
+ *			   coefficient is negative.
+ *
+ * @param [in,out] v pointer to input/output vector
+ */
+static inline void polyveck_caddq(polyveck *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		poly_caddq(&v->vec[i]);
+}
+
+/**
+ * @brief polyveck_add - Add vectors of polynomials of length DILITHIUM_K.
+ *			 No modular reduction is performed.
+ *
+ * @param [out] w pointer to output vector
+ * @param [in] u pointer to first summand
+ * @param [in] v pointer to second summand
+ */
+static inline void polyveck_add(polyveck *w, const polyveck *u,
+				const polyveck *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		poly_add(&w->vec[i], &u->vec[i], &v->vec[i]);
+}
+
+/**
+ * @brief olyveck_sub - Subtract vectors of polynomials of length
+ *			DILITHIUM_K. No modular reduction is performed.
+ *
+ * @param [out] w pointer to output vector
+ * @param [in] u pointer to first input vector
+ * @param [in] v pointer to second input vector to be subtracted from first
+ *		 input vector
+ */
+static inline void polyveck_sub(polyveck *w, const polyveck *u,
+				const polyveck *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		poly_sub(&w->vec[i], &u->vec[i], &v->vec[i]);
+}
+
+/**
+ * @brief polyveck_shiftl - Multiply vector of polynomials of Length K by
+ *			    2^D without modular reduction. Assumes input
+ *			    coefficients to be less than 2^{31-D}.
+ *
+ * @param [in,out] v pointer to input/output vector
+ */
+static inline void polyveck_shiftl(polyveck *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		poly_shiftl(&v->vec[i]);
+}
+
+/**
+ * @brief polyveck_ntt - Forward NTT of all polynomials in vector of length K.
+ *			 Output coefficients can be up to 16*Q larger than input
+ *			 coefficients.
+ *
+ * @param [in,out] v pointer to input/output vector
+ */
+static inline void polyveck_ntt(polyveck *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		poly_ntt(&v->vec[i]);
+}
+
+/**
+ * @brief polyveck_invntt_tomont - Inverse NTT and multiplication by 2^{32} of
+ *				   polynomials in vector of length K. Input
+ *				   coefficients need to be less than 2*Q.
+ *
+ * @param [in,out] v pointer to input/output vector
+ */
+static inline void polyveck_invntt_tomont(polyveck *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		poly_invntt_tomont(&v->vec[i]);
+}
+
+static inline void polyveck_pointwise_poly_montgomery(polyveck *r,
+						      const poly *a,
+						      const polyveck *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		poly_pointwise_montgomery(&r->vec[i], a, &v->vec[i]);
+}
+
+/**
+ * @brief polyveck_chknorm - Check infinity norm of polynomials in vector of
+ *			     length K. Assumes input polyveck to be reduced by
+ *			     polyveck_reduce().
+ *
+ * @param [in] v pointer to vector
+ * @param [in] bound norm bound
+ *
+ * @return 0 if norm of all polynomials are strictly smaller than B <= (Q-1)/8
+ * and 1 otherwise.
+ */
+static inline int polyveck_chknorm(const polyveck *v, int32_t bound)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		if (poly_chknorm(&v->vec[i], bound))
+			return 1;
+
+	return 0;
+}
+
+/**
+ * @brief polyveck_decompose - For all coefficients a of polynomials in vector
+ *			       of length K, compute high and low bits a0, a1
+ *			       such a mod^+ Q = a1*ALPHA + a0 with
+ *			       -ALPHA/2 < a0 <= ALPHA/2 except a1 = (Q-1)/ALPHA
+ *			       where we set a1 = 0 and
+ *			       -ALPHA/2 <= a0 = a mod Q - Q < 0. Assumes
+ *			       coefficients to be standard representatives.
+ *
+ * @param [out] v1 pointer to output vector of polynomials with coefficients a1
+ * @param [in] v0 pointer to output vector of polynomials with coefficients a0
+ * @param [in] v pointer to input vector
+ */
+static inline void polyveck_decompose(polyveck *v1, polyveck *v0,
+				      const polyveck *v)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		poly_decompose(&v1->vec[i], &v0->vec[i], &v->vec[i]);
+}
+
+/**
+ * @brief polyveck_make_hint - Compute hint vector.
+ *
+ * @param [out] h pointer to output vector
+ * @param [in] v0 pointer to low part of input vector
+ * @param [in] v1 pointer to high part of input vector
+ *
+ * @return number of 1 bits.
+ */
+static inline unsigned int polyveck_make_hint(polyveck *h, const polyveck *v0,
+					      const polyveck *v1)
+{
+	unsigned int i, s = 0;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		s += poly_make_hint(&h->vec[i], &v0->vec[i], &v1->vec[i]);
+
+	return s;
+}
+
+/**
+ * @brief polyveck_use_hint - Use hint vector to correct the high bits of input
+ *			      vector.
+ *
+ * @param [out] w pointer to output vector of polynomials with corrected high
+ *		  bits
+ * @param [in] u pointer to input vector
+ * @param [in] h pointer to input hint vector
+ */
+static inline void polyveck_use_hint(polyveck *w, const polyveck *u,
+				     const polyveck *h)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		poly_use_hint(&w->vec[i], &u->vec[i], &h->vec[i]);
+}
+
+static inline void
+polyveck_pack_w1(uint8_t r[DILITHIUM_K * DILITHIUM_POLYW1_PACKEDBYTES],
+		 const polyveck *w1)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		polyw1_pack(&r[i * DILITHIUM_POLYW1_PACKEDBYTES],
+			    &w1->vec[i]);
+}
+
+#endif /* DILITHIUM_POLYVEC_H */
diff --git a/crypto/ml_dsa/dilithium_polyvec_c.h b/crypto/ml_dsa/dilithium_polyvec_c.h
new file mode 100644
index 000000000000..0f8c2d914e4d
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_polyvec_c.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2023 - 2025, Stephan Mueller <smueller@chronox.de>
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
+#ifndef DILITHIUM_POLYVEC_C_H
+#define DILITHIUM_POLYVEC_C_H
+
+static inline void
+polyvecl_uniform_gamma1(polyvecl *v, const uint8_t seed[DILITHIUM_CRHBYTES],
+			uint16_t nonce, void *ws_buf)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_L; ++i)
+		poly_uniform_gamma1(
+			&v->vec[i], seed,
+			cpu_to_le16((uint16_t)(DILITHIUM_L * nonce + i)),
+			ws_buf);
+}
+
+/**
+ * @brief expand_mat - Implementation of ExpandA. Generates matrix A with
+ *		       uniformly random coefficients a_{i,j} by performing
+ *		       rejection sampling on the output stream of
+ *		       SHAKE128(rho|j|i).
+ *
+ * @param [out] mat output matrix
+ * @param [in] rho byte array containing seed rho
+ */
+static inline void
+polyvec_matrix_expand(polyvecl mat[DILITHIUM_K],
+		      const uint8_t rho[DILITHIUM_SEEDBYTES], void *ws_buf)
+{
+	unsigned int i, j;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		for (j = 0; j < DILITHIUM_L; ++j)
+			poly_uniform(
+				&mat[i].vec[j], rho,
+				cpu_to_le16((uint16_t)(i << 8) + (uint16_t)j),
+				ws_buf);
+}
+
+/**
+ * @brief polyvecl_pointwise_acc_montgomery -
+ *	  Pointwise multiply vectors of polynomials of length L, multiply
+ *	  resulting vector by 2^{-32} and add (accumulate) polynomials
+ *	  in it. Input/output vectors are in NTT domain representation.
+ *
+ * @param [out] w output polynomial
+ * @param [in] u pointer to first input vector
+ * @param [in] v pointer to second input vector
+ */
+static inline void polyvecl_pointwise_acc_montgomery(poly *w, const polyvecl *u,
+						     const polyvecl *v,
+						     void *ws_buf)
+{
+	unsigned int i;
+	poly *t = ws_buf;
+
+	poly_pointwise_montgomery(w, &u->vec[0], &v->vec[0]);
+	for (i = 1; i < DILITHIUM_L; ++i) {
+		poly_pointwise_montgomery(t, &u->vec[i], &v->vec[i]);
+		poly_add(w, w, t);
+	}
+}
+
+static inline void
+polyvec_matrix_pointwise_montgomery(polyveck *t,
+				    const polyvecl mat[DILITHIUM_K],
+				    const polyvecl *v, void *ws_buf)
+{
+	unsigned int i;
+
+	for (i = 0; i < DILITHIUM_K; ++i)
+		polyvecl_pointwise_acc_montgomery(&t->vec[i], &mat[i], v,
+						  ws_buf);
+}
+
+#endif /* DILITHIUM_POLYVEC_C_H */
diff --git a/crypto/ml_dsa/dilithium_reduce.h b/crypto/ml_dsa/dilithium_reduce.h
new file mode 100644
index 000000000000..c4dd78be2575
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_reduce.h
@@ -0,0 +1,108 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#ifndef DILITHIUM_REDUCE_H
+#define DILITHIUM_REDUCE_H
+
+#include "dilithium_type.h"
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+#define MONT -4186625 // 2^32 % Q
+#define QINV 58728449 // q^(-1) mod 2^32
+
+/**
+ * @brief montgomery_reduce - For finite field element a with
+ *			     -2^{31}Q <= a <= Q*2^31,
+ *			     compute r \equiv a*2^{-32} (mod Q) such that
+ *			     -Q < r < Q.
+ *
+ * @param [in] a finite field element
+ *
+ * @return r
+ */
+static inline int32_t montgomery_reduce(int64_t a)
+{
+	int32_t t;
+
+	t = (int32_t)a * QINV;
+	t = (int32_t)((a - (int64_t)t * DILITHIUM_Q) >> 32);
+	return t;
+}
+
+/**
+ * @brief reduce32 - For finite field element a with a <= 2^{31} - 2^{22} - 1,
+ *		     compute r \equiv a (mod Q) such that
+ *		     -6283009 <= r <= 6283007.
+ *
+ * @param [in] a finite field element
+ *
+ * @return r
+ */
+static inline int32_t reduce32(int32_t a)
+{
+	int32_t t;
+
+	t = (a + (1 << 22)) >> 23;
+	t = a - t * DILITHIUM_Q;
+	return t;
+}
+
+/**
+ * @brief caddq - Add Q if input coefficient is negative.
+ *
+ * @param [in] a finite field element
+ *
+ * @return r
+ */
+static inline int32_t caddq(int32_t a)
+{
+	a += (a >> 31) & DILITHIUM_Q;
+	return a;
+}
+
+/**
+ * @brief freeze - For finite field element a, compute standard representative
+ *		   r = a mod^+ Q.
+ *
+ * @param [in] a finite field element a
+ *
+ * @return r
+ */
+static inline int32_t freeze(int32_t a)
+{
+	a = reduce32(a);
+	a = caddq(a);
+	return a;
+}
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* DILITHIUM_REDUCE_H */
diff --git a/crypto/ml_dsa/dilithium_rounding.c b/crypto/ml_dsa/dilithium_rounding.c
new file mode 100644
index 000000000000..c8a9c88185cf
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_rounding.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#include "dilithium_rounding.h"
+
+/**
+ * @brief power2round - For finite field element a, compute a0, a1 such that
+ *			a mod^+ Q = a1*2^D + a0 with -2^{D-1} < a0 <= 2^{D-1}.
+ *			Assumes a to be standard representative.
+ *
+ * @param [in] a input element
+ * @param [out] a0 pointer to output element a0
+ *
+ * @return a1.
+ */
+int32_t power2round(int32_t *a0, int32_t a)
+{
+	int32_t a1;
+
+	a1 = (a + (1 << (DILITHIUM_D - 1)) - 1) >> DILITHIUM_D;
+	*a0 = a - (a1 << DILITHIUM_D);
+	return a1;
+}
+
+/**
+ * @brief decompose - For finite field element a, compute high and low bits a0,
+ *		      a1 such that a mod^+ Q = a1*ALPHA + a0 with
+ *		      -ALPHA/2 < a0 <= ALPHA/2 except if a1 = (Q-1)/ALPHA where
+ *		      we set a1 = 0 and -ALPHA/2 <= a0 = a mod^+ Q - Q < 0.
+ *		      Assumes a to be standard representative.
+ *
+ * @param [in] a input element
+ * @param [out] a0 pointer to output element a0
+ *
+ * @return a1.
+ */
+int32_t decompose(int32_t *a0, int32_t a)
+{
+	int32_t a1;
+
+	a1 = (a + 127) >> 7;
+#if DILITHIUM_GAMMA2 == (DILITHIUM_Q - 1) / 32
+	a1 = (a1 * 1025 + (1 << 21)) >> 22;
+	a1 &= 15;
+#elif DILITHIUM_GAMMA2 == (DILITHIUM_Q - 1) / 88
+	a1 = (a1 * 11275 + (1 << 23)) >> 24;
+	a1 ^= ((43 - a1) >> 31) & a1;
+#else
+#error "Uknown GAMMA2"
+#endif
+
+	*a0 = a - a1 * 2 * DILITHIUM_GAMMA2;
+	*a0 -= (((DILITHIUM_Q - 1) / 2 - *a0) >> 31) & DILITHIUM_Q;
+
+	return a1;
+}
+
+/**
+ * @brief make_hint - Compute hint bit indicating whether the low bits of the
+ *		      input element overflow into the high bits.
+ *
+ * @param  a0 [in] low bits of input element
+ * @param  a1 [in] high bits of input element
+ *
+ * @return 1 if overflow.
+ */
+int32_t make_hint(int32_t a0, int32_t a1)
+{
+	if (a0 > DILITHIUM_GAMMA2 || a0 < -DILITHIUM_GAMMA2 ||
+	    (a0 == -DILITHIUM_GAMMA2 && a1 != 0))
+		return 1;
+
+	return 0;
+}
+
+/**
+ * @brief use_hint - Correct high bits according to hint.
+ *
+ * @param [in] a input element
+ * @param [in] hint hint bit
+ *
+ * @return corrected high bits.
+ */
+int32_t use_hint(int32_t a, int32_t hint)
+{
+	int32_t a0, a1;
+
+	a1 = decompose(&a0, a);
+	if (hint == 0)
+		return a1;
+
+#if DILITHIUM_GAMMA2 == (DILITHIUM_Q - 1) / 32
+	if (a0 > 0)
+		return (a1 + 1) & 15;
+	else
+		return (a1 - 1) & 15;
+#elif DILITHIUM_GAMMA2 == (DILITHIUM_Q - 1) / 88
+	if (a0 > 0)
+		return (a1 == 43) ? 0 : a1 + 1;
+	else
+		return (a1 == 0) ? 43 : a1 - 1;
+#else
+#error "Uknown GAMMA2"
+#endif
+}
diff --git a/crypto/ml_dsa/dilithium_rounding.h b/crypto/ml_dsa/dilithium_rounding.h
new file mode 100644
index 000000000000..928b041856e9
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_rounding.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#ifndef DILITHIUM_ROUNDING_H
+#define DILITHIUM_ROUNDING_H
+
+#include "dilithium_type.h"
+
+#ifdef __cplusplus
+extern "C" {
+#endif
+
+int32_t power2round(int32_t *a0, int32_t a);
+int32_t decompose(int32_t *a0, int32_t a);
+int32_t make_hint(int32_t a0, int32_t a1);
+int32_t use_hint(int32_t a, int32_t hint);
+
+#ifdef __cplusplus
+}
+#endif
+
+#endif /* DILITHIUM_ROUNDING_H */
diff --git a/crypto/ml_dsa/dilithium_service_helpers.h b/crypto/ml_dsa/dilithium_service_helpers.h
new file mode 100644
index 000000000000..d671634e2040
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_service_helpers.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+#ifndef DILITHIUM_SERVICE_HELPERS_H
+#define DILITHIUM_SERVICE_HELPERS_H
+
+/**
+ * @brief rej_uniform - Sample uniformly random coefficients in [0, Q-1] by
+ *			performing rejection sampling on array of random bytes.
+ *
+ * @param [out] a pointer to output array (allocated)
+ * @param [in] len number of coefficients to be sampled
+ * @param [in] buf array of random bytes
+ * @param [in] buflen length of array of random bytes
+ *
+ * @return number of sampled coefficients. Can be smaller than len if not enough
+ * random bytes were given.
+ */
+static inline unsigned int rej_uniform(int32_t *a, unsigned int len,
+				       const uint8_t *buf, unsigned int buflen)
+{
+	unsigned int ctr, pos;
+	uint32_t t;
+
+	ctr = pos = 0;
+	while (ctr < len && pos + 3 <= buflen) {
+		t = buf[pos++];
+		t |= (uint32_t)buf[pos++] << 8;
+		t |= (uint32_t)buf[pos++] << 16;
+		t &= 0x7FFFFF;
+
+		if (t < DILITHIUM_Q)
+			a[ctr++] = (int32_t)t;
+	}
+
+	return ctr;
+}
+
+/**
+ * @brief rej_eta - Sample uniformly random coefficients in [-ETA, ETA] by
+ *		    performing rejection sampling on array of random bytes.
+ *
+ * @param [out] a pointer to output array (allocated)
+ * @param [in] len number of coefficients to be sampled
+ * @param [in] buf array of random bytes
+ * @param [in] buflen length of array of random bytes
+ *
+ * @return number of sampled coefficients. Can be smaller than len if not enough
+ * random bytes were given.
+ */
+static inline unsigned int rej_eta(int32_t *a, unsigned int len,
+				   const uint8_t *buf, unsigned int buflen)
+{
+	unsigned int ctr, pos;
+	int32_t t0, t1;
+
+	ctr = pos = 0;
+	while (ctr < len && pos < buflen) {
+		t0 = buf[pos] & 0x0F;
+		t1 = buf[pos++] >> 4;
+
+#if DILITHIUM_ETA == 2
+		if (t0 < 15) {
+			t0 = t0 - (205 * t0 >> 10) * 5;
+			a[ctr++] = 2 - t0;
+		}
+		if (t1 < 15 && ctr < len) {
+			t1 = t1 - (205 * t1 >> 10) * 5;
+			a[ctr++] = 2 - t1;
+		}
+#elif DILITHIUM_ETA == 4
+		if (t0 < 9)
+			a[ctr++] = 4 - t0;
+		if (t1 < 9 && ctr < len)
+			a[ctr++] = 4 - t1;
+#else
+#error "Undefined DILITHIUM_ETA"
+#endif
+	}
+
+	return ctr;
+}
+
+#endif /* DILITHIUM_SERVICE_HELPERS_H */
diff --git a/crypto/ml_dsa/dilithium_sig.c b/crypto/ml_dsa/dilithium_sig.c
new file mode 100644
index 000000000000..5495dd451de0
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_sig.c
@@ -0,0 +1,404 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
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
+#include <linux/init.h>
+#include <linux/module.h>
+#include <crypto/internal/sig.h>
+#include "dilithium.h"
+
+enum dilithium_kernel_key_type {
+	dilithium_kernel_key_unset = 0,
+	dilithium_kernel_key_sk = 1,
+	dilithium_kernel_key_pk = 2,
+};
+
+struct dilithium_kernel_ctx {
+	union {
+		struct dilithium_sk sk;
+		struct dilithium_pk pk;
+	};
+	enum dilithium_kernel_key_type key_type;
+};
+
+/* src -> message */
+/* dst -> signature */
+static int dilithium_kernel_sign(struct crypto_sig *tfm, const void *src,
+				 unsigned int slen, void *dst,
+				 unsigned int dlen)
+{
+	struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
+	struct dilithium_sig *sig;
+	enum dilithium_type type;
+	uint8_t *sig_ptr;
+	size_t sig_len;
+	int ret;
+
+	if (unlikely(ctx->key_type != dilithium_kernel_key_sk))
+		return -EINVAL;
+
+	type = dilithium_sk_type(&ctx->sk);
+	if (dlen != dilithium_sig_size(type))
+		return -EINVAL;
+
+	sig = kmalloc(sizeof(struct dilithium_sig), GFP_KERNEL);
+	if (!sig)
+		return -ENOMEM;
+
+	ret = dilithium_sign(sig, src, slen, &ctx->sk, lc_seeded_rng);
+	if (ret)
+		goto out;
+
+	ret = dilithium_sig_ptr(&sig_ptr, &sig_len, sig);
+	if (ret)
+		goto out;
+
+	memcpy(dst, sig_ptr, sig_len);
+	ret = sig_len;
+
+out:
+	kfree_sensitive(sig);
+	return ret;
+}
+
+/* src -> signature */
+/* msg -> message */
+static int dilithium_kernel_verify(struct crypto_sig *tfm, const void *src,
+				   unsigned int slen, const void *msg,
+				   unsigned int msg_len)
+{
+	struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
+	struct dilithium_sig *sig;
+	size_t sig_len;
+	enum dilithium_type type;
+	int ret;
+
+	if (unlikely(ctx->key_type != dilithium_kernel_key_pk))
+		return -EINVAL;
+
+	type = dilithium_pk_type(&ctx->pk);
+	sig_len = dilithium_sig_size(type);
+	if (slen < sig_len)
+		return -EINVAL;
+
+	sig = kmalloc(sizeof(struct dilithium_sig), GFP_KERNEL);
+	if (!sig)
+		return -ENOMEM;
+
+	ret = dilithium_sig_load(sig, src, sig_len);
+	if (ret)
+		goto out;
+
+	ret = dilithium_verify(sig, msg, msg_len, &ctx->pk);
+
+out:
+	kfree_sensitive(sig);
+	return ret;
+}
+
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+static unsigned int dilithium_kernel_87_key_size(struct crypto_sig *tfm)
+{
+	struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
+
+	switch (ctx->key_type) {
+	case dilithium_kernel_key_sk:
+		return sizeof(struct dilithium_87_sk);
+
+	case dilithium_kernel_key_unset:
+	case dilithium_kernel_key_pk:
+	default:
+		return sizeof(struct dilithium_87_pk);
+	}
+}
+#endif
+
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+static unsigned int dilithium_kernel_65_key_size(struct crypto_sig *tfm)
+{
+	struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
+
+	switch (ctx->key_type) {
+	case dilithium_kernel_key_sk:
+		return sizeof(struct dilithium_65_sk);
+
+	case dilithium_kernel_key_unset:
+	case dilithium_kernel_key_pk:
+	default:
+		return sizeof(struct dilithium_65_pk);
+	}
+}
+#endif
+
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+static unsigned int dilithium_kernel_44_key_size(struct crypto_sig *tfm)
+{
+	struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
+
+	switch (ctx->key_type) {
+	case dilithium_kernel_key_sk:
+		return sizeof(struct dilithium_44_sk);
+
+	case dilithium_kernel_key_unset:
+	case dilithium_kernel_key_pk:
+	default:
+		return sizeof(struct dilithium_44_pk);
+	}
+}
+#endif
+
+static int dilithium_kernel_set_pub_key_int(struct crypto_sig *tfm,
+					    const void *key,
+					    unsigned int keylen,
+					    enum dilithium_type type)
+{
+	struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
+	int ret;
+
+	ctx->key_type = dilithium_kernel_key_unset;
+
+	ret = dilithium_pk_load(&ctx->pk, key, keylen);
+	if (!ret) {
+		if (dilithium_pk_type(&ctx->pk) != type)
+			ret = -EOPNOTSUPP;
+		else
+			ctx->key_type = dilithium_kernel_key_pk;
+	}
+
+	return ret;
+}
+
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+static int dilithium_kernel_44_set_pub_key(struct crypto_sig *tfm,
+					   const void *key,
+					   unsigned int keylen)
+{
+	return dilithium_kernel_set_pub_key_int(tfm, key, keylen, DILITHIUM_44);
+}
+#endif
+
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+static int dilithium_kernel_65_set_pub_key(struct crypto_sig *tfm,
+					   const void *key,
+					   unsigned int keylen)
+{
+	return dilithium_kernel_set_pub_key_int(tfm, key, keylen, DILITHIUM_65);
+}
+#endif
+
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+static int dilithium_kernel_87_set_pub_key(struct crypto_sig *tfm,
+					   const void *key,
+					   unsigned int keylen)
+{
+	return dilithium_kernel_set_pub_key_int(tfm, key, keylen, DILITHIUM_87);
+}
+#endif
+
+static int dilithium_kernel_set_priv_key_int(struct crypto_sig *tfm,
+					     const void *key,
+					     unsigned int keylen,
+					     enum dilithium_type type)
+{
+	struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
+	int ret;
+
+	ctx->key_type = dilithium_kernel_key_unset;
+
+	ret = dilithium_sk_load(&ctx->sk, key, keylen);
+
+	if (!ret) {
+		if (dilithium_sk_type(&ctx->sk) != type)
+			ret = -EOPNOTSUPP;
+		else
+			ctx->key_type = dilithium_kernel_key_sk;
+	}
+
+	return ret;
+}
+
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+static int dilithium_kernel_44_set_priv_key(struct crypto_sig *tfm,
+					    const void *key,
+					    unsigned int keylen)
+{
+	return dilithium_kernel_set_priv_key_int(tfm, key, keylen,
+						    DILITHIUM_44);
+}
+#endif
+
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+static int dilithium_kernel_65_set_priv_key(struct crypto_sig *tfm,
+					    const void *key,
+					    unsigned int keylen)
+{
+	return dilithium_kernel_set_priv_key_int(tfm, key, keylen,
+						    DILITHIUM_65);
+}
+#endif
+
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+static int dilithium_kernel_87_set_priv_key(struct crypto_sig *tfm,
+					    const void *key,
+					    unsigned int keylen)
+{
+	return dilithium_kernel_set_priv_key_int(tfm, key, keylen,
+						    DILITHIUM_87);
+}
+#endif
+
+static unsigned int dilithium_kernel_max_size(struct crypto_sig *tfm)
+{
+	struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
+	enum dilithium_type type;
+
+	switch (ctx->key_type) {
+	case dilithium_kernel_key_sk:
+		type = dilithium_sk_type(&ctx->sk);
+		/* When SK is set -> generate a signature */
+		return dilithium_sig_size(type);
+	case dilithium_kernel_key_pk:
+		type = dilithium_pk_type(&ctx->pk);
+		/* When PK is set, this is a safety valve, result is boolean */
+		return dilithium_sig_size(type);
+	default:
+		return 0;
+	}
+}
+
+static int dilithium_kernel_alg_init(struct crypto_sig *tfm)
+{
+	return 0;
+}
+
+static void dilithium_kernel_alg_exit(struct crypto_sig *tfm)
+{
+	struct dilithium_kernel_ctx *ctx = crypto_sig_ctx(tfm);
+
+	ctx->key_type = dilithium_kernel_key_unset;
+}
+
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+static struct sig_alg dilithium_kernel_87 = {
+	.sign			= dilithium_kernel_sign,
+	.verify			= dilithium_kernel_verify,
+	.set_pub_key		= dilithium_kernel_87_set_pub_key,
+	.set_priv_key		= dilithium_kernel_87_set_priv_key,
+	.key_size		= dilithium_kernel_87_key_size,
+	.max_size		= dilithium_kernel_max_size,
+	.init			= dilithium_kernel_alg_init,
+	.exit			= dilithium_kernel_alg_exit,
+	.base.cra_name		= "ml-dsa87",
+	.base.cra_driver_name	= "ml-dsa87-leancrypto",
+	.base.cra_ctxsize	= sizeof(struct dilithium_kernel_ctx),
+	.base.cra_module	= THIS_MODULE,
+	.base.cra_priority	= 5000,
+};
+#endif
+
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+static struct sig_alg dilithium_kernel_65 = {
+	.sign			= dilithium_kernel_sign,
+	.verify			= dilithium_kernel_verify,
+	.set_pub_key		= dilithium_kernel_65_set_pub_key,
+	.set_priv_key		= dilithium_kernel_65_set_priv_key,
+	.key_size		= dilithium_kernel_65_key_size,
+	.max_size		= dilithium_kernel_max_size,
+	.init			= dilithium_kernel_alg_init,
+	.exit			= dilithium_kernel_alg_exit,
+	.base.cra_name		= "ml-dsa65",
+	.base.cra_driver_name	= "ml-dsa65-leancrypto",
+	.base.cra_ctxsize	= sizeof(struct dilithium_kernel_ctx),
+	.base.cra_module	= THIS_MODULE,
+	.base.cra_priority	= 5000,
+};
+#endif
+
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+static struct sig_alg dilithium_kernel_44 = {
+	.sign			= dilithium_kernel_sign,
+	.verify			= dilithium_kernel_verify,
+	.set_pub_key		= dilithium_kernel_44_set_pub_key,
+	.set_priv_key		= dilithium_kernel_44_set_priv_key,
+	.key_size		= dilithium_kernel_44_key_size,
+	.max_size		= dilithium_kernel_max_size,
+	.init			= dilithium_kernel_alg_init,
+	.exit			= dilithium_kernel_alg_exit,
+	.base.cra_name		= "ml-dsa44",
+	.base.cra_driver_name	= "ml-dsa44-leancrypto",
+	.base.cra_ctxsize	= sizeof(struct dilithium_kernel_ctx),
+	.base.cra_module	= THIS_MODULE,
+	.base.cra_priority	= 5000,
+};
+#endif
+
+static int __init dilithium_init(void)
+{
+	int ret;
+
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+	ret = crypto_register_sig(&dilithium_kernel_44);
+	if (ret < 0)
+		goto error_44;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+	ret = crypto_register_sig(&dilithium_kernel_65);
+	if (ret < 0)
+		goto error_65;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+	ret = crypto_register_sig(&dilithium_kernel_87);
+	if (ret < 0)
+		goto error_87;
+#endif
+	return 0;
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+error_87:
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+	crypto_unregister_sig(&dilithium_kernel_65);
+error_65:
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+	crypto_unregister_sig(&dilithium_kernel_44);
+error_44:
+#endif
+	pr_err("Failed to register (%d)\n", ret);
+	return ret;
+}
+module_init(dilithium_init);
+
+static void dilithium_exit(void)
+{
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+	crypto_unregister_sig(&dilithium_kernel_87);
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+	crypto_unregister_sig(&dilithium_kernel_65);
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+	crypto_unregister_sig(&dilithium_kernel_44);
+#endif
+}
+module_exit(dilithium_exit);
+
+MODULE_LICENSE("Dual BSD/GPL");
+MODULE_DESCRIPTION("Leancrypto ML-DSA/Dilithium");
+MODULE_AUTHOR("Stephan Mueller <smueller@chronox.de>");
+MODULE_ALIAS_CRYPTO("ml-dsa44");
+MODULE_ALIAS_CRYPTO("ml-dsa65");
+MODULE_ALIAS_CRYPTO("ml-dsa87");
diff --git a/crypto/ml_dsa/dilithium_signature_c.c b/crypto/ml_dsa/dilithium_signature_c.c
new file mode 100644
index 000000000000..a4a9d0bfdd37
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_signature_c.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#include "dilithium_signature_c.h"
+
+/* We need once the buffer size to handle the hashing */
+#define LC_POLY_UNIFOR_BUF_SIZE_MULTIPLIER 1
+
+#include "dilithium_poly.h"
+#include "dilithium_poly_common.h"
+#include "dilithium_poly_c.h"
+#include "dilithium_polyvec.h"
+#include "dilithium_polyvec_c.h"
+#include "dilithium_pack.h"
+#include "dilithium_signature_impl.h"
+
+int dilithium_sign_c(struct dilithium_sig *sig,
+		     const uint8_t *m, size_t mlen,
+		     const struct dilithium_sk *sk,
+		     struct crypto_rng *rng_ctx)
+{
+	return dilithium_sign_impl(sig, m, mlen, sk, rng_ctx);
+}
+
+int dilithium_sign_ctx_c(struct dilithium_sig *sig,
+			 struct dilithium_ctx *ctx, const uint8_t *m,
+			 size_t mlen, const struct dilithium_sk *sk,
+			 struct crypto_rng *rng_ctx)
+{
+	return dilithium_sign_ctx_impl(sig, ctx, m, mlen, sk, rng_ctx);
+}
+
+int dilithium_sign_init_c(struct dilithium_ctx *ctx,
+			  const struct dilithium_sk *sk)
+{
+	return dilithium_sign_init_impl(ctx, sk);
+}
+
+int dilithium_sign_update_c(struct dilithium_ctx *ctx, const uint8_t *m,
+			    size_t mlen)
+{
+	return dilithium_sign_update_impl(ctx, m, mlen);
+}
+
+int dilithium_sign_final_c(struct dilithium_sig *sig,
+			   struct dilithium_ctx *ctx,
+			   const struct dilithium_sk *sk,
+			   struct crypto_rng *rng_ctx)
+{
+	return dilithium_sign_final_impl(sig, ctx, sk, rng_ctx);
+}
+
+int dilithium_verify_c(const struct dilithium_sig *sig, const uint8_t *m,
+		       size_t mlen, const struct dilithium_pk *pk)
+{
+	return dilithium_verify_impl(sig, m, mlen, pk);
+}
+
+int dilithium_verify_ctx_c(const struct dilithium_sig *sig,
+			   struct dilithium_ctx *ctx, const uint8_t *m,
+			   size_t mlen, const struct dilithium_pk *pk)
+{
+	return dilithium_verify_ctx_impl(sig, ctx, m, mlen, pk);
+}
+
+int dilithium_verify_init_c(struct dilithium_ctx *ctx,
+			    const struct dilithium_pk *pk)
+{
+	return dilithium_verify_init_impl(ctx, pk);
+}
+
+int dilithium_verify_update_c(struct dilithium_ctx *ctx, const uint8_t *m,
+			      size_t mlen)
+{
+	return dilithium_verify_update_impl(ctx, m, mlen);
+}
+
+int dilithium_verify_final_c(const struct dilithium_sig *sig,
+			     struct dilithium_ctx *ctx,
+			     const struct dilithium_pk *pk)
+{
+	return dilithium_verify_final_impl(sig, ctx, pk);
+}
+
+int dilithium_sign(struct dilithium_sig *sig,
+		     const uint8_t *m, size_t mlen,
+		     const struct dilithium_sk *sk,
+		     struct crypto_rng *rng_ctx)
+{
+	return dilithium_sign_c(sig, m, mlen, sk, rng_ctx);
+}
+
+int dilithium_sign_ctx(struct dilithium_sig *sig,
+			 struct dilithium_ctx *ctx, const uint8_t *m,
+			 size_t mlen, const struct dilithium_sk *sk,
+			 struct crypto_rng *rng_ctx)
+{
+	return dilithium_sign_ctx_c(sig, ctx, m, mlen, sk, rng_ctx);
+}
+
+int dilithium_sign_init(struct dilithium_ctx *ctx,
+			  const struct dilithium_sk *sk)
+{
+	return dilithium_sign_init_c(ctx, sk);
+}
+
+int dilithium_sign_update(struct dilithium_ctx *ctx, const uint8_t *m,
+			    size_t mlen)
+{
+	return dilithium_sign_update_c(ctx, m, mlen);
+}
+
+int dilithium_sign_final(struct dilithium_sig *sig,
+			   struct dilithium_ctx *ctx,
+			   const struct dilithium_sk *sk,
+			   struct crypto_rng *rng_ctx)
+{
+	return dilithium_sign_final_c(sig, ctx, sk, rng_ctx);
+}
+
+int dilithium_verify(const struct dilithium_sig *sig, const uint8_t *m,
+		       size_t mlen, const struct dilithium_pk *pk)
+{
+	return dilithium_verify_c(sig, m, mlen, pk);
+}
+
+int dilithium_verify_ctx(const struct dilithium_sig *sig,
+			   struct dilithium_ctx *ctx, const uint8_t *m,
+			   size_t mlen, const struct dilithium_pk *pk)
+{
+	return dilithium_verify_ctx_c(sig, ctx, m, mlen, pk);
+}
+
+int dilithium_verify_init(struct dilithium_ctx *ctx,
+			    const struct dilithium_pk *pk)
+{
+	return dilithium_verify_init_c(ctx, pk);
+}
+
+int dilithium_verify_update(struct dilithium_ctx *ctx, const uint8_t *m,
+			      size_t mlen)
+{
+	return dilithium_verify_update_c(ctx, m, mlen);
+}
+
+int dilithium_verify_final(const struct dilithium_sig *sig,
+			     struct dilithium_ctx *ctx,
+			     const struct dilithium_pk *pk)
+{
+	return dilithium_verify_final_c(sig, ctx, pk);
+}
diff --git a/crypto/ml_dsa/dilithium_signature_c.h b/crypto/ml_dsa/dilithium_signature_c.h
new file mode 100644
index 000000000000..a7d20cd49672
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_signature_c.h
@@ -0,0 +1,53 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+#ifndef DILITHIUM_SIGNATURE_C_H
+#define DILITHIUM_SIGNATURE_C_H
+
+#include "dilithium_type.h"
+
+int dilithium_sign_c(struct dilithium_sig *sig, const uint8_t *m,
+		     size_t mlen, const struct dilithium_sk *sk,
+		     struct crypto_rng *rng_ctx);
+int dilithium_sign_ctx_c(struct dilithium_sig *sig,
+			 struct dilithium_ctx *ctx, const uint8_t *m,
+			 size_t mlen, const struct dilithium_sk *sk,
+			 struct crypto_rng *rng_ctx);
+int dilithium_sign_init_c(struct dilithium_ctx *ctx,
+			  const struct dilithium_sk *sk);
+int dilithium_sign_update_c(struct dilithium_ctx *ctx, const uint8_t *m,
+			    size_t mlen);
+int dilithium_sign_final_c(struct dilithium_sig *sig,
+			   struct dilithium_ctx *ctx,
+			   const struct dilithium_sk *sk,
+			   struct crypto_rng *rng_ctx);
+
+int dilithium_verify_c(const struct dilithium_sig *sig, const uint8_t *m,
+		       size_t mlen, const struct dilithium_pk *pk);
+int dilithium_verify_ctx_c(const struct dilithium_sig *sig,
+			   struct dilithium_ctx *ctx, const uint8_t *m,
+			   size_t mlen, const struct dilithium_pk *pk);
+int dilithium_verify_init_c(struct dilithium_ctx *ctx,
+			    const struct dilithium_pk *pk);
+int dilithium_verify_update_c(struct dilithium_ctx *ctx, const uint8_t *m,
+			      size_t mlen);
+int dilithium_verify_final_c(const struct dilithium_sig *sig,
+			     struct dilithium_ctx *ctx,
+			     const struct dilithium_pk *pk);
+
+#endif /* DILITHIUM_SIGNATURE_C_H */
diff --git a/crypto/ml_dsa/dilithium_signature_helper.c b/crypto/ml_dsa/dilithium_signature_helper.c
new file mode 100644
index 000000000000..3f6b9d02602f
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_signature_helper.c
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
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
+#include <linux/export.h>
+#include <linux/math.h>
+#include <linux/slab.h>
+#include "dilithium_type.h"
+
+#define cround(x) round_up((x), umax(DILITHIUM_AHAT_ALIGNMENT, CRYPTO_MINALIGN))
+
+struct dilithium_ctx *dilithium_ctx_alloc(void)
+{
+	struct dilithium_ctx *ctx;
+	struct crypto_shash *shash;
+	void *p;
+
+	shash = crypto_alloc_shash("shake256", 0, 0);
+	if (IS_ERR(shash)) {
+		pr_warn("no shake256: %ld\n", PTR_ERR(shash));
+		return ERR_CAST(shash);
+	}
+
+	p = kzalloc(cround(sizeof(struct dilithium_ctx)) +
+		    cround(crypto_shash_descsize(shash)),
+		    GFP_KERNEL);
+	if (!p) {
+		crypto_free_shash(shash);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	ctx = p;
+	//ctx->dilithium_hash_ctx = p + cround(sizeof(struct dilithium_ctx));
+	ctx->dilithium_prehash_type = shash;
+	return ctx;
+}
+EXPORT_SYMBOL(dilithium_ctx_alloc);
+
+struct dilithium_ctx *dilithium_ctx_alloc_ahat(enum dilithium_type type)
+{
+	struct dilithium_ctx *ctx;
+	struct crypto_shash *shash;
+	size_t ahat_size;
+	void *p;
+
+	shash = crypto_alloc_shash("shake256", 0, 0);
+	if (IS_ERR(shash))
+		return ERR_CAST(shash);
+
+	switch (type) {
+#ifdef CONFIG_CRYPTO_DILITHIUM_44
+	case DILITHIUM_44:
+		ahat_size = DILITHIUM_44_AHAT_SIZE;
+		break;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_65
+	case DILITHIUM_65:
+		ahat_size = DILITHIUM_65_AHAT_SIZE;
+		break;
+#endif
+#ifdef CONFIG_CRYPTO_DILITHIUM_87
+	case DILITHIUM_87:
+		ahat_size = DILITHIUM_87_AHAT_SIZE;
+		break;
+#endif
+	default:
+		WARN_ON(1);
+		return ERR_PTR(-EINVAL);
+	}
+
+	p = kzalloc(cround(sizeof(struct dilithium_ctx)) +
+		    cround(ahat_size) +
+		    cround(crypto_shash_descsize(shash)),
+		    GFP_KERNEL);
+	if (!p) {
+		crypto_free_shash(shash);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	ctx = p;
+	p += cround(sizeof(struct dilithium_ctx));
+	ctx->ahat = p;
+	ctx->ahat_size = ahat_size;
+	p += cround(ahat_size);
+	//ctx->dilithium_hash_ctx = p;
+	ctx->dilithium_prehash_type = shash;
+	return ctx;
+}
+EXPORT_SYMBOL(dilithium_ctx_alloc_ahat);
+
+void dilithium_ctx_zero_free(struct dilithium_ctx *ctx)
+{
+	crypto_free_shash(ctx->dilithium_prehash_type);
+	kfree_sensitive(ctx);
+}
+EXPORT_SYMBOL(dilithium_ctx_zero_free);
diff --git a/crypto/ml_dsa/dilithium_signature_impl.h b/crypto/ml_dsa/dilithium_signature_impl.h
new file mode 100644
index 000000000000..1f0ec0f7c27c
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_signature_impl.h
@@ -0,0 +1,838 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#ifndef DILITHIUM_SIGNATURE_IMPL_H
+#define DILITHIUM_SIGNATURE_IMPL_H
+
+#include "dilithium.h"
+#include "dilithium_type.h"
+#include "dilithium_debug.h"
+#include "dilithium_pack.h"
+#include "dilithium_signature_impl.h"
+#include "signature_domain_separation.h"
+#include "small_stack_support.h"
+
+/*
+ * Enable this macro to report the rejection code paths taken with the
+ * signature generation operation. When disabled, the compiler should
+ * eliminate this code which means that the counting code is folded away.
+ */
+#undef REJECTION_TEST_SAMPLING
+
+#define _WS_POLY_UNIFORM_BUF_SIZE                                              \
+	(POLY_UNIFORM_NBLOCKS * SHAKE128_BLOCK_SIZE + 2)
+
+#ifndef LC_POLY_UNIFOR_BUF_SIZE_MULTIPLIER
+#error "LC_POLY_UNIFOR_BUF_SIZE_MULTIPLIER is not defined"
+#endif
+
+#define WS_POLY_UNIFORM_BUF_SIZE                                               \
+	(_WS_POLY_UNIFORM_BUF_SIZE * LC_POLY_UNIFOR_BUF_SIZE_MULTIPLIER)
+
+static int dilithium_sign_internal_ahat(struct dilithium_sig *sig,
+					const struct dilithium_sk *sk,
+					struct dilithium_ctx *ctx,
+					struct crypto_rng *rng_ctx)
+{
+	struct workspace_sign {
+		polyvecl s1, y, z;
+		polyveck t0, s2, w1, w0, h;
+		poly cp;
+		uint8_t seedbuf[DILITHIUM_SEEDBYTES + DILITHIUM_RNDBYTES +
+				DILITHIUM_CRHBYTES];
+		union {
+			uint8_t poly_uniform_gamma1_buf[WS_POLY_UNIFORM_BUF_SIZE];
+			uint8_t poly_challenge_buf[POLY_CHALLENGE_BYTES];
+		} tmp;
+	};
+	unsigned int n;
+	uint8_t *key, *mu, *rhoprime, *rnd;
+	const polyvecl *mat = ctx->ahat;
+	uint16_t nonce = 0;
+	int ret = 0;
+	uint8_t __maybe_unused rej_total = 0;
+	LC_DECLARE_MEM(ws, struct workspace_sign, sizeof(uint64_t));
+
+	/* AHat must be present at this time */
+	if (WARN_ON_ONCE(!mat)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	key = ws->seedbuf;
+	rnd = key + DILITHIUM_SEEDBYTES;
+	mu = rnd + DILITHIUM_RNDBYTES;
+
+	/*
+	 * If the external mu is provided, use this verbatim, otherwise
+	 * calculate the mu value.
+	 */
+	if (ctx->external_mu) {
+		if (ctx->external_mu_len != DILITHIUM_CRHBYTES)
+			return -EINVAL;
+		memcpy(mu, ctx->external_mu, DILITHIUM_CRHBYTES);
+	} else {
+		/*
+		 * Set the digestsize - for SHA512 this is a noop, for SHAKE256,
+		 * it sets the value. The BUILD_BUG_ON is to check that the
+		 * SHA-512 output size is identical to the expected length.
+		 */
+		BUILD_BUG_ON(DILITHIUM_CRHBYTES != SHA3_512_DIGEST_SIZE);
+		if (!dilithium_hash_check_digestsize(ctx, DILITHIUM_CRHBYTES)) {
+			ret = -EINVAL;
+			goto out;
+		}
+		dilithium_hash_final(ctx, mu, DILITHIUM_CRHBYTES);
+	}
+	dilithium_print_buffer(mu, DILITHIUM_CRHBYTES, "Siggen - MU:");
+
+	if (rng_ctx) {
+		ret = crypto_rng_generate(rng_ctx, NULL, 0, rnd,
+					  DILITHIUM_RNDBYTES);
+		if (ret < 0)
+			goto out;
+	} else {
+		memset(rnd, 0, DILITHIUM_RNDBYTES);
+	}
+	dilithium_print_buffer(rnd, DILITHIUM_RNDBYTES, "Siggen - RND:");
+
+	unpack_sk_key(key, sk);
+
+	/* Timecop: key is secret */
+	poison(key, DILITHIUM_SEEDBYTES);
+
+	/* Re-use the ws->seedbuf, but making sure that mu is unchanged */
+	BUILD_BUG_ON(DILITHIUM_CRHBYTES >
+		     DILITHIUM_SEEDBYTES + DILITHIUM_RNDBYTES);
+	rhoprime = key;
+
+	shake256(key,
+		 DILITHIUM_SEEDBYTES + DILITHIUM_RNDBYTES +
+		 DILITHIUM_CRHBYTES,
+		 rhoprime, DILITHIUM_CRHBYTES);
+	dilithium_print_buffer(rhoprime, DILITHIUM_CRHBYTES,
+			       "Siggen - RHOPrime:");
+
+	/*
+	 * Timecop: RHO' is the hash of the secret value of key which is
+	 * enlarged to sample the intermediate vector y from. Due to the hashing
+	 * any side channel on RHO' cannot allow the deduction of the original
+	 * key.
+	 */
+	unpoison(rhoprime, DILITHIUM_CRHBYTES);
+
+	unpack_sk_s1(&ws->s1, sk);
+
+	/* Timecop: s1 is secret */
+	poison(&ws->s1, sizeof(polyvecl));
+
+	polyvecl_ntt(&ws->s1);
+	dilithium_print_polyvecl(&ws->s1,
+				 "Siggen - S1 L x N matrix after NTT:");
+
+	unpack_sk_s2(&ws->s2, sk);
+
+	/* Timecop: s2 is secret */
+	poison(&ws->s2, sizeof(polyveck));
+
+	polyveck_ntt(&ws->s2);
+	dilithium_print_polyveck(&ws->s2,
+				 "Siggen - S2 K x N matrix after NTT:");
+
+	unpack_sk_t0(&ws->t0, sk);
+	polyveck_ntt(&ws->t0);
+	dilithium_print_polyveck(&ws->t0,
+				 "Siggen - T0 K x N matrix after NTT:");
+
+rej:
+	/* Sample intermediate vector y */
+	polyvecl_uniform_gamma1(&ws->y, rhoprime, nonce++,
+				ws->tmp.poly_uniform_gamma1_buf);
+	dilithium_print_polyvecl(
+		&ws->y,
+		"Siggen - Y L x N matrix after ExpandMask - start of loop");
+
+	/* Timecop: s2 is secret */
+	poison(&ws->y, sizeof(polyvecl));
+
+	/* Matrix-vector multiplication */
+	ws->z = ws->y;
+	polyvecl_ntt(&ws->z);
+
+	/* Use the cp for this operation as it is not used here so far. */
+	polyvec_matrix_pointwise_montgomery(&ws->w1, mat, &ws->z, &ws->cp);
+	polyveck_reduce(&ws->w1);
+	polyveck_invntt_tomont(&ws->w1);
+	dilithium_print_polyveck(&ws->w1,
+				 "Siggen - W K x N matrix after NTT-1");
+
+	/* Decompose w and call the random oracle */
+	polyveck_caddq(&ws->w1);
+	polyveck_decompose(&ws->w1, &ws->w0, &ws->w1);
+
+	/* Timecop: the signature component w1 is not sensitive any more. */
+	unpoison(&ws->w1, sizeof(polyveck));
+	polyveck_pack_w1(sig->sig, &ws->w1);
+	dilithium_print_buffer(sig->sig,
+			       DILITHIUM_K * DILITHIUM_POLYW1_PACKEDBYTES,
+			       "Siggen - w1Encode of W1");
+
+	dilithium_hash_init(ctx);
+	dilithium_hash_update(ctx, mu, DILITHIUM_CRHBYTES);
+	dilithium_hash_finup(ctx, sig->sig,
+			     DILITHIUM_K * DILITHIUM_POLYW1_PACKEDBYTES,
+			     sig->sig, DILITHIUM_CTILDE_BYTES);
+
+	dilithium_print_buffer(sig->sig, DILITHIUM_CTILDE_BYTES,
+			       "Siggen - ctilde");
+
+	poly_challenge(&ws->cp, sig->sig, ws->tmp.poly_challenge_buf);
+	dilithium_print_poly(&ws->cp, "Siggen - c after SampleInBall");
+	poly_ntt(&ws->cp);
+	dilithium_print_poly(&ws->cp, "Siggen - c after NTT");
+
+	/* Compute z, reject if it reveals secret */
+	polyvecl_pointwise_poly_montgomery(&ws->z, &ws->cp, &ws->s1);
+	polyvecl_invntt_tomont(&ws->z);
+	polyvecl_add(&ws->z, &ws->z, &ws->y);
+	dilithium_print_polyvecl(&ws->z, "Siggen - z <- y + cs1");
+
+	polyvecl_reduce(&ws->z);
+	dilithium_print_polyvecl(&ws->z, "Siggen - z reduction");
+
+	/* Timecop: the signature component z is not sensitive any more. */
+	unpoison(&ws->z, sizeof(polyvecl));
+
+	if (polyvecl_chknorm(&ws->z, DILITHIUM_GAMMA1 - DILITHIUM_BETA)) {
+		dilithium_print_polyvecl(&ws->z, "Siggen - z rejection");
+		rej_total |= 1 << 0;
+		goto rej;
+	}
+
+	/*
+	 * Check that subtracting cs2 does not change high bits of w and low
+	 * bits do not reveal secret information.
+	 */
+	polyveck_pointwise_poly_montgomery(&ws->h, &ws->cp, &ws->s2);
+	polyveck_invntt_tomont(&ws->h);
+	polyveck_sub(&ws->w0, &ws->w0, &ws->h);
+	polyveck_reduce(&ws->w0);
+
+	/* Timecop: verification data w0 is not sensitive any more. */
+	unpoison(&ws->w0, sizeof(polyveck));
+
+	if (polyveck_chknorm(&ws->w0,
+			     DILITHIUM_GAMMA2 - DILITHIUM_BETA)) {
+		dilithium_print_polyveck(&ws->w0, "Siggen - r0 rejection");
+		rej_total |= 1 << 1;
+		goto rej;
+	}
+
+	/* Compute hints for w1 */
+	polyveck_pointwise_poly_montgomery(&ws->h, &ws->cp, &ws->t0);
+	polyveck_invntt_tomont(&ws->h);
+	polyveck_reduce(&ws->h);
+
+	/* Timecop: the signature component h is not sensitive any more. */
+	unpoison(&ws->h, sizeof(polyveck));
+
+	if (polyveck_chknorm(&ws->h, DILITHIUM_GAMMA2)) {
+		dilithium_print_polyveck(&ws->h, "Siggen - ct0 rejection");
+		rej_total |= 1 << 2;
+		goto rej;
+	}
+
+	polyveck_add(&ws->w0, &ws->w0, &ws->h);
+
+	n = polyveck_make_hint(&ws->h, &ws->w0, &ws->w1);
+	if (n > DILITHIUM_OMEGA) {
+		dilithium_print_polyveck(&ws->w0, "Siggen - h rejection");
+		rej_total |= 1 << 3;
+		goto rej;
+	}
+
+	/* Write signature */
+	dilithium_print_buffer(sig->sig, DILITHIUM_CTILDE_BYTES,
+			       "Siggen - Ctilde:");
+	dilithium_print_polyvecl(&ws->z, "Siggen - Z L x N matrix:");
+	dilithium_print_polyveck(&ws->h, "Siggen - H K x N matrix:");
+
+	pack_sig(sig, &ws->z, &ws->h);
+
+	dilithium_print_buffer(sig->sig, DILITHIUM_CRYPTO_BYTES,
+			       "Siggen - Signature:");
+
+out:
+	LC_RELEASE_MEM(ws);
+#ifdef REJECTION_TEST_SAMPLING
+	return ret ? ret : rej_total;
+#else
+	return ret;
+#endif
+}
+
+static int dilithium_sign_internal_noahat(struct dilithium_sig *sig,
+					  const struct dilithium_sk *sk,
+					  struct dilithium_ctx *ctx,
+					  struct crypto_rng *rng_ctx)
+{
+	struct workspace_sign {
+		polyvecl mat[DILITHIUM_K];
+		uint8_t poly_uniform_buf[WS_POLY_UNIFORM_BUF_SIZE];
+	};
+	/* The first bytes of the key is rho. */
+	const uint8_t *rho = sk->sk;
+	int ret = 0;
+	LC_DECLARE_MEM(ws, struct workspace_sign, DILITHIUM_AHAT_ALIGNMENT);
+
+	polyvec_matrix_expand(ws->mat, rho, ws->poly_uniform_buf);
+
+	/* Temporarily set the pointer */
+	ctx->ahat = ws->mat;
+
+	ret = dilithium_sign_internal_ahat(sig, sk, ctx, rng_ctx);
+
+	ctx->ahat = NULL;
+	LC_RELEASE_MEM(ws);
+	return ret;
+}
+
+static int dilithium_sk_expand_impl(const struct dilithium_sk *sk,
+				    struct dilithium_ctx *ctx)
+{
+	struct workspace_sign {
+		uint8_t poly_uniform_buf[WS_POLY_UNIFORM_BUF_SIZE];
+	};
+	/* The first bytes of the key is rho. */
+	const uint8_t *rho = sk->sk;
+	polyvecl *mat = ctx->ahat;
+	int ret = 0;
+	LC_DECLARE_MEM(ws, struct workspace_sign, sizeof(uint64_t));
+
+	/*
+	 * The compile time sanity check links API header file with
+	 * Dilithium-internal definitions.
+	 *
+	 * Runtime sanity check ensures that the allocated context has
+	 * sufficient size (e.g. not that caller used, say,
+	 * DILITHIUM_44_CTX_ON_STACK_AHAT with a ML-DSA 65 or 87 key)
+	 */
+#if DILITHIUM_MODE == 2
+	BUILD_BUG_ON(DILITHIUM_44_AHAT_SIZE !=
+		     sizeof(polyvecl) * DILITHIUM44_K);
+	if (ctx->ahat_size < DILITHIUM_44_AHAT_SIZE) {
+		ret = -EOVERFLOW;
+		goto out;
+	}
+#elif DILITHIUM_MODE == 3
+	BUILD_BUG_ON(DILITHIUM_65_AHAT_SIZE !=
+		     sizeof(polyvecl) * DILITHIUM65_K);
+	if (ctx->ahat_size < DILITHIUM_65_AHAT_SIZE) {
+		ret = -EOVERFLOW;
+		goto out;
+	}
+#elif DILITHIUM_MODE == 5
+	BUILD_BUG_ON(DILITHIUM_87_AHAT_SIZE !=
+		     sizeof(polyvecl) * DILITHIUM87_K);
+	if (ctx->ahat_size < DILITHIUM_87_AHAT_SIZE) {
+		ret = -EOVERFLOW;
+		goto out;
+	}
+#else
+#error "Undefined DILITHIUM_MODE"
+#endif
+
+	polyvec_matrix_expand(mat, rho, ws->poly_uniform_buf);
+	dilithium_print_polyvecl_k(mat,
+				   "AHAT - A K x L x N matrix after ExpandA:");
+
+	ctx->ahat_expanded = 1;
+
+out:
+	LC_RELEASE_MEM(ws);
+	return ret;
+}
+
+static int dilithium_sign_internal(struct dilithium_sig *sig,
+				   const struct dilithium_sk *sk,
+				   struct dilithium_ctx *ctx,
+				   struct crypto_rng *rng_ctx)
+{
+	int ret;
+
+	if (!ctx->ahat)
+		return dilithium_sign_internal_noahat(sig, sk, ctx, rng_ctx);
+
+	if (!ctx->ahat_expanded) {
+		ret = dilithium_sk_expand_impl(sk, ctx);
+		if (ret < 0)
+			goto out;
+	}
+
+	ret = dilithium_sign_internal_ahat(sig, sk, ctx, rng_ctx);
+
+out:
+	return ret;
+}
+
+static int dilithium_sign_ctx_impl(struct dilithium_sig *sig,
+				   struct dilithium_ctx *ctx,
+				   const uint8_t *m, size_t mlen,
+				   const struct dilithium_sk *sk,
+				   struct crypto_rng *rng_ctx)
+{
+	uint8_t tr[DILITHIUM_TRBYTES];
+	int ret = 0;
+
+	/* rng_ctx is allowed to be NULL as handled below */
+	if (!sig || !sk || !ctx)
+		return -EINVAL;
+	/* Either the message or the external mu must be provided */
+	if (!m && !ctx->external_mu)
+		return -EINVAL;
+
+	dilithium_print_buffer(m, mlen, "Siggen - Message");
+
+	unpack_sk_tr(tr, sk);
+
+	if (m) {
+		/* Compute mu = CRH(tr, msg) */
+		dilithium_hash_init(ctx);
+		dilithium_hash_update(ctx, tr, DILITHIUM_TRBYTES);
+
+		ret = signature_domain_separation(
+			&ctx->dilithium_hash_ctx, ctx->ml_dsa_internal,
+			ctx->userctx, ctx->userctxlen,
+			m, mlen,
+			ctx->randomizer, ctx->randomizerlen,
+			DILITHIUM_NIST_CATEGORY);
+		if (ret < 0)
+			goto out;
+	}
+
+	ret = dilithium_sign_internal(sig, sk, ctx, rng_ctx);
+
+out:
+	memzero_explicit(tr, sizeof(tr));
+	return ret;
+}
+
+static int dilithium_sign_impl(struct dilithium_sig *sig,
+			       const uint8_t *m, size_t mlen,
+			       const struct dilithium_sk *sk,
+			       struct crypto_rng *rng_ctx)
+{
+	struct dilithium_ctx *ctx;
+	int ret;
+
+	ctx = dilithium_ctx_alloc();
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = dilithium_sign_ctx_impl(sig, ctx, m, mlen, sk, rng_ctx);
+
+	dilithium_ctx_zero_free(ctx);
+	return ret;
+}
+
+static int dilithium_sign_init_impl(struct dilithium_ctx *ctx,
+				    const struct dilithium_sk *sk)
+{
+	uint8_t tr[DILITHIUM_TRBYTES];
+
+	/* rng_ctx is allowed to be NULL as handled below */
+	if (!ctx || !sk)
+		return -EINVAL;
+
+	/* Require the use of SHAKE256 */
+	if (!dilithium_hash_check_blocksize(ctx, SHAKE256_BLOCK_SIZE))
+		return -EOPNOTSUPP;
+
+	unpack_sk_tr(tr, sk);
+
+	/* Compute mu = CRH(tr, msg) */
+	dilithium_hash_init(ctx);
+	dilithium_hash_update(ctx, tr, DILITHIUM_TRBYTES);
+	memzero_explicit(tr, sizeof(tr));
+
+	return signature_domain_separation(
+		&ctx->dilithium_hash_ctx, ctx->ml_dsa_internal,
+		ctx->userctx, ctx->userctxlen,
+		NULL, 0,
+		ctx->randomizer, ctx->randomizerlen,
+		DILITHIUM_NIST_CATEGORY);
+}
+
+static int dilithium_sign_update_impl(struct dilithium_ctx *ctx,
+				      const uint8_t *m, size_t mlen)
+{
+	if (!ctx || !m)
+		return -EINVAL;
+
+	/* Compute CRH(tr, msg) */
+	dilithium_hash_update(ctx, m, mlen);
+
+	return 0;
+}
+
+static int dilithium_sign_final_impl(struct dilithium_sig *sig,
+				     struct dilithium_ctx *ctx,
+				     const struct dilithium_sk *sk,
+				     struct crypto_rng *rng_ctx)
+{
+	int ret = 0;
+
+	/* rng_ctx is allowed to be NULL as handled below */
+	if (!sig || !ctx || !sk) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = dilithium_sign_internal(sig, sk, ctx, rng_ctx);
+
+out:
+	dilithium_ctx_zero(ctx);
+	return ret;
+}
+
+static int dilithium_verify_internal_ahat(const struct dilithium_sig *sig,
+					  const struct dilithium_pk *pk,
+					  struct dilithium_ctx *ctx)
+{
+	struct workspace_verify {
+		union {
+			poly cp;
+		} matrix;
+		polyveck w1;
+		union {
+			polyveck t1, h;
+			polyvecl z;
+			uint8_t mu[DILITHIUM_CRHBYTES];
+			union {
+				uint8_t coeffs[round_up(DILITHIUM_CTILDE_BYTES, 8)];
+			} __aligned(8) c2;
+		} buf;
+
+		union {
+			poly polyvecl_pointwise_acc_montgomery_buf;
+			uint8_t buf[DILITHIUM_K *
+				    DILITHIUM_POLYW1_PACKEDBYTES];
+			uint8_t poly_challenge_buf[POLY_CHALLENGE_BYTES];
+		} tmp;
+	};
+	/* The first bytes of the signature is c~ and thus contains c1. */
+	const uint8_t *c1 = sig->sig;
+	const polyvecl *mat = ctx->ahat;
+	int ret = 0;
+	LC_DECLARE_MEM(ws, struct workspace_verify, sizeof(uint64_t));
+
+	/* AHat must be present at this time */
+	if (!mat) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	unpack_sig_z(&ws->buf.z, sig);
+	if (polyvecl_chknorm(&ws->buf.z,
+			     DILITHIUM_GAMMA1 - DILITHIUM_BETA)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	polyvecl_ntt(&ws->buf.z);
+	polyvec_matrix_pointwise_montgomery(
+		&ws->w1, mat, &ws->buf.z,
+		&ws->tmp.polyvecl_pointwise_acc_montgomery_buf);
+
+	/* Matrix-vector multiplication; compute Az - c2^dt1 */
+	poly_challenge(&ws->matrix.cp, c1, ws->tmp.poly_challenge_buf);
+	poly_ntt(&ws->matrix.cp);
+
+	unpack_pk_t1(&ws->buf.t1, pk);
+	polyveck_shiftl(&ws->buf.t1);
+	polyveck_ntt(&ws->buf.t1);
+	polyveck_pointwise_poly_montgomery(&ws->buf.t1, &ws->matrix.cp,
+					   &ws->buf.t1);
+
+	polyveck_sub(&ws->w1, &ws->w1, &ws->buf.t1);
+	polyveck_reduce(&ws->w1);
+	polyveck_invntt_tomont(&ws->w1);
+
+	/* Reconstruct w1 */
+	polyveck_caddq(&ws->w1);
+	dilithium_print_polyveck(&ws->w1,
+				 "Sigver - W K x N matrix before hint:");
+
+	if (unpack_sig_h(&ws->buf.h, sig))
+		return -EINVAL;
+	dilithium_print_polyveck(&ws->buf.h, "Siggen - H K x N matrix:");
+
+	polyveck_use_hint(&ws->w1, &ws->w1, &ws->buf.h);
+	dilithium_print_polyveck(&ws->w1,
+				 "Sigver - W K x N matrix after hint:");
+	polyveck_pack_w1(ws->tmp.buf, &ws->w1);
+	dilithium_print_buffer(ws->tmp.buf,
+			       DILITHIUM_K * DILITHIUM_POLYW1_PACKEDBYTES,
+			       "Sigver - W after w1Encode");
+
+	if (ctx->external_mu) {
+		if (ctx->external_mu_len != DILITHIUM_CRHBYTES)
+			return -EINVAL;
+
+		/* Call random oracle and verify challenge */
+		dilithium_hash_init(ctx);
+		dilithium_hash_update(ctx, ctx->external_mu, DILITHIUM_CRHBYTES);
+	} else {
+		dilithium_hash_final(ctx, ws->buf.mu, DILITHIUM_CRHBYTES);
+
+		/* Call random oracle and verify challenge */
+		dilithium_hash_init(ctx);
+		dilithium_hash_update(ctx, ws->buf.mu, DILITHIUM_CRHBYTES);
+	}
+
+	dilithium_hash_finup(ctx,
+			     ws->tmp.buf, DILITHIUM_K * DILITHIUM_POLYW1_PACKEDBYTES,
+			     ws->buf.c2.coeffs, DILITHIUM_CTILDE_BYTES);
+
+	/* Signature verification operation */
+	if (memcmp(c1, ws->buf.c2.coeffs, DILITHIUM_CTILDE_BYTES) != 0)
+		ret = -EBADMSG;
+
+out:
+	LC_RELEASE_MEM(ws);
+	return ret;
+}
+
+static int
+dilithium_verify_internal_noahat(const struct dilithium_sig *sig,
+				 const struct dilithium_pk *pk,
+				 struct dilithium_ctx *ctx)
+{
+	struct workspace_verify {
+		polyvecl mat[DILITHIUM_K];
+		uint8_t poly_uniform_buf[WS_POLY_UNIFORM_BUF_SIZE];
+	};
+	/* The first bytes of the key is rho. */
+	const uint8_t *rho = pk->pk;
+	int ret = 0;
+	LC_DECLARE_MEM(ws, struct workspace_verify, sizeof(uint64_t));
+
+	polyvec_matrix_expand(ws->mat, rho, ws->poly_uniform_buf);
+
+	/* Temporarily set the pointer */
+	ctx->ahat = ws->mat;
+
+	ret = dilithium_verify_internal_ahat(sig, pk, ctx);
+
+	ctx->ahat = NULL;
+	LC_RELEASE_MEM(ws);
+	return ret;
+}
+
+static int dilithium_pk_expand_impl(const struct dilithium_pk *pk,
+				    struct dilithium_ctx *ctx)
+{
+	struct workspace_verify {
+		uint8_t poly_uniform_buf[WS_POLY_UNIFORM_BUF_SIZE];
+	};
+	/* The first bytes of the key is rho. */
+	const uint8_t *rho = pk->pk;
+	polyvecl *mat = ctx->ahat;
+	int ret = 0;
+	LC_DECLARE_MEM(ws, struct workspace_verify, sizeof(uint64_t));
+
+	/*
+	 * Runtime sanity check ensures that the allocated context has
+	 * sufficient size (e.g. not that caller used, say,
+	 * DILITHIUM_44_CTX_ON_STACK_AHAT with a ML-DSA 65 or 87 key)
+	 */
+#if DILITHIUM_MODE == 2
+	if (ctx->ahat_size < DILITHIUM_44_AHAT_SIZE) {
+		ret = -EOVERFLOW;
+		goto out;
+	}
+#elif DILITHIUM_MODE == 3
+	if (ctx->ahat_size < DILITHIUM_65_AHAT_SIZE) {
+		ret = -EOVERFLOW;
+		goto out;
+	}
+#elif DILITHIUM_MODE == 5
+	if (ctx->ahat_size < DILITHIUM_87_AHAT_SIZE) {
+		ret = -EOVERFLOW;
+		goto out;
+	}
+#else
+#error "Undefined DILITHIUM_MODE"
+#endif
+
+	polyvec_matrix_expand(mat, rho, ws->poly_uniform_buf);
+	ctx->ahat_expanded = 1;
+
+out:
+	LC_RELEASE_MEM(ws);
+	return ret;
+}
+
+static int dilithium_verify_internal(const struct dilithium_sig *sig,
+				     const struct dilithium_pk *pk,
+				     struct dilithium_ctx *ctx)
+{
+	int ret;
+
+	if (!ctx->ahat)
+		return dilithium_verify_internal_noahat(sig, pk, ctx);
+
+	if (!ctx->ahat_expanded) {
+		ret = dilithium_pk_expand_impl(pk, ctx);
+		if (ret < 0)
+			goto out;
+	}
+
+	ret = dilithium_verify_internal_ahat(sig, pk, ctx);
+
+out:
+	return ret;
+}
+
+static int dilithium_verify_ctx_impl(const struct dilithium_sig *sig,
+				     struct dilithium_ctx *ctx,
+				     const uint8_t *m, size_t mlen,
+				     const struct dilithium_pk *pk)
+{
+	uint8_t tr[DILITHIUM_TRBYTES];
+	int ret = 0;
+
+	if (!sig || !pk || !ctx)
+		return -EINVAL;
+
+	/* Either the message or the external mu must be provided */
+	if (!m && !ctx->external_mu)
+		return -EINVAL;
+
+	/* Make sure that ->mu is large enough for ->tr */
+	BUILD_BUG_ON(DILITHIUM_TRBYTES > DILITHIUM_CRHBYTES);
+
+	/* Compute CRH(H(rho, t1), msg) */
+	shake256(pk->pk, DILITHIUM_PUBLICKEYBYTES, tr,
+		 DILITHIUM_TRBYTES);
+
+	if (m) {
+		dilithium_hash_init(ctx);
+		dilithium_hash_update(ctx, tr, DILITHIUM_TRBYTES);
+		ret = signature_domain_separation(
+			&ctx->dilithium_hash_ctx, ctx->ml_dsa_internal,
+			ctx->userctx, ctx->userctxlen,
+			m, mlen,
+			ctx->randomizer, ctx->randomizerlen,
+			DILITHIUM_NIST_CATEGORY);
+		if (ret < 0)
+			goto out;
+	}
+
+	ret = dilithium_verify_internal(sig, pk, ctx);
+
+out:
+	memzero_explicit(tr, sizeof(tr));
+	return ret;
+}
+
+static int dilithium_verify_impl(const struct dilithium_sig *sig,
+				 const uint8_t *m, size_t mlen,
+				 const struct dilithium_pk *pk)
+{
+	struct dilithium_ctx *ctx;
+	int ret;
+
+	ctx = dilithium_ctx_alloc();
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ret = dilithium_verify_ctx_impl(sig, ctx, m, mlen, pk);
+
+	dilithium_ctx_zero_free(ctx);
+	return ret;
+}
+
+static int dilithium_verify_init_impl(struct dilithium_ctx *ctx,
+				      const struct dilithium_pk *pk)
+{
+	uint8_t mu[DILITHIUM_TRBYTES];
+
+	/* rng_ctx is allowed to be NULL as handled below */
+	if (!ctx || !pk)
+		return -EINVAL;
+
+	/* Require the use of SHAKE256 */
+	if (!dilithium_hash_check_blocksize(ctx, SHAKE256_BLOCK_SIZE))
+		return -EOPNOTSUPP;
+
+	/* Compute CRH(H(rho, t1), msg) */
+	shake256(pk->pk, DILITHIUM_PUBLICKEYBYTES, mu,
+		 DILITHIUM_TRBYTES);
+
+	dilithium_hash_init(ctx);
+	dilithium_hash_update(ctx, mu, DILITHIUM_TRBYTES);
+	memzero_explicit(mu, sizeof(mu));
+
+	return signature_domain_separation(
+		&ctx->dilithium_hash_ctx, ctx->ml_dsa_internal,
+		ctx->userctx, ctx->userctxlen,
+		NULL, 0,
+		ctx->randomizer, ctx->randomizerlen,
+		DILITHIUM_NIST_CATEGORY);
+}
+
+static int dilithium_verify_update_impl(struct dilithium_ctx *ctx,
+					const uint8_t *m, size_t mlen)
+{
+	if (!ctx || !m)
+		return -EINVAL;
+
+	/* Compute CRH(H(rho, t1), msg) */
+	dilithium_hash_update(ctx, m, mlen);
+
+	return 0;
+}
+
+static int dilithium_verify_final_impl(const struct dilithium_sig *sig,
+				       struct dilithium_ctx *ctx,
+				       const struct dilithium_pk *pk)
+{
+	int ret = 0;
+
+	if (!sig || !ctx || !pk) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = dilithium_verify_internal(sig, pk, ctx);
+
+out:
+	dilithium_ctx_zero(ctx);
+	return ret;
+}
+
+#endif /* DILITHIUM_SIGNATURE_IMPL_H */
diff --git a/crypto/ml_dsa/dilithium_type.h b/crypto/ml_dsa/dilithium_type.h
new file mode 100644
index 000000000000..f9f7ffa2cd38
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_type.h
@@ -0,0 +1,259 @@
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
+#ifndef DILITHIUM_TYPE_H
+#define DILITHIUM_TYPE_H
+
+#include "dilithium.h"
+
+/*
+ * This define replaces all symbol names accordingly to allow double compilation
+ * of the same code base.
+ *
+ * Due to the replacement operation, this header file must be included as the
+ * first header file in the entire stack.
+ *
+ * This file can easily be replaced with dilithium.h to achieve the common
+ * functionality without symbol duplication. But in this case, only the
+ * Dilithium security strength is compiled defined in dilithium.h. Duplicate
+ * compilation different sizes would not be possible.
+ */
+#ifdef DILITHIUM_TYPE_65
+#define DILITHIUM_F(name) dilithium_65_##name
+#define dilithium_pk dilithium_65_pk
+#define dilithium_sk dilithium_65_sk
+#define dilithium_sig dilithium_65_sig
+
+#include "dilithium_65.h"
+
+#elif defined DILITHIUM_TYPE_44
+#define DILITHIUM_F(name) dilithium_44_##name
+#define dilithium_pk dilithium_44_pk
+#define dilithium_sk dilithium_44_sk
+#define dilithium_sig dilithium_44_sig
+
+#include "dilithium_44.h"
+
+#else
+#define DILITHIUM_F(name) dilithium_87_##name
+#define dilithium_pk dilithium_87_pk
+#define dilithium_sk dilithium_87_sk
+#define dilithium_sig dilithium_87_sig
+
+#include "dilithium_87.h"
+
+#endif
+
+/*
+ * The following defines simply allow duplicate compilation of the
+ * respective functions.
+ */
+#define dilithium_sign DILITHIUM_F(sign)
+#define dilithium_sign_ctx DILITHIUM_F(sign_ctx)
+#define dilithium_sign_init DILITHIUM_F(sign_init)
+#define dilithium_sign_update DILITHIUM_F(sign_update)
+#define dilithium_sign_final DILITHIUM_F(sign_final)
+#define dilithium_verify DILITHIUM_F(verify)
+#define dilithium_verify_ctx DILITHIUM_F(verify_ctx)
+#define dilithium_verify_init DILITHIUM_F(verify_init)
+#define dilithium_verify_update DILITHIUM_F(verify_update)
+#define dilithium_verify_final DILITHIUM_F(verify_final)
+
+#define dilithium_sign_c DILITHIUM_F(sign_c)
+#define dilithium_sign_ctx_c DILITHIUM_F(sign_ctx_c)
+#define dilithium_sign_init_c DILITHIUM_F(sign_init_c)
+#define dilithium_sign_update_c DILITHIUM_F(sign_update_c)
+#define dilithium_sign_final_c DILITHIUM_F(sign_final_c)
+#define dilithium_verify_c DILITHIUM_F(verify_c)
+#define dilithium_verify_ctx_c DILITHIUM_F(verify_ctx_c)
+#define dilithium_verify_init_c DILITHIUM_F(verify_init_c)
+#define dilithium_verify_update_c DILITHIUM_F(verify_update_c)
+#define dilithium_verify_final_c DILITHIUM_F(verify_final_c)
+
+#define ntt DILITHIUM_F(ntt)
+#define invntt_tomont DILITHIUM_F(invntt_tomont)
+#define poly_chknorm DILITHIUM_F(poly_chknorm)
+#define poly_uniform DILITHIUM_F(poly_uniform)
+#define poly_uniform_eta DILITHIUM_F(poly_uniform_eta)
+#define poly_uniform_gamma1 DILITHIUM_F(poly_uniform_gamma1)
+#define polyz_unpack DILITHIUM_F(polyz_unpack)
+#define poly_challenge DILITHIUM_F(poly_challenge)
+#define polyeta_pack DILITHIUM_F(polyeta_pack)
+#define polyeta_unpack DILITHIUM_F(polyeta_unpack)
+#define polyt1_pack DILITHIUM_F(polyt1_pack)
+#define polyt0_pack DILITHIUM_F(polyt0_pack)
+#define polyt0_unpack DILITHIUM_F(polyt0_unpack)
+#define polyz_pack DILITHIUM_F(polyz_pack)
+#define polyw1_pack DILITHIUM_F(polyw1_pack)
+#define power2round DILITHIUM_F(power2round)
+#define decompose DILITHIUM_F(decompose)
+#define make_hint DILITHIUM_F(make_hint)
+#define use_hint DILITHIUM_F(use_hint)
+
+#define dilithium_print_buffer DILITHIUM_F(print_buffer)
+#define dilithium_print_polyvecl_k DILITHIUM_F(print_polyvecl_k)
+#define dilithium_print_polyvecl DILITHIUM_F(print_polyvecl)
+#define dilithium_print_polyveck DILITHIUM_F(print_polyveck)
+#define dilithium_print_poly DILITHIUM_F(print_poly)
+
+/* AVX2 Implementation */
+#define dilithium_invntt_avx DILITHIUM_F(invntt_avx)
+#define dilithium_ntt_avx DILITHIUM_F(ntt_avx)
+#define dilithium_nttunpack_avx DILITHIUM_F(nttunpack_avx)
+#define dilithium_pointwise_avx DILITHIUM_F(pointwise_avx)
+#define dilithium_pointwise_acc_avx DILITHIUM_F(pointwise_acc_avx)
+#define poly_reduce_avx DILITHIUM_F(poly_reduce_avx)
+#define poly_caddq_avx DILITHIUM_F(poly_caddq_avx)
+#define poly_add_avx DILITHIUM_F(poly_add_avx)
+#define poly_sub_avx DILITHIUM_F(poly_sub_avx)
+#define poly_shiftl_avx DILITHIUM_F(poly_shiftl_avx)
+#define poly_chknorm_avx DILITHIUM_F(poly_chknorm_avx)
+#define poly_uniform_4x_avx DILITHIUM_F(poly_uniform_4x_avx)
+#define poly_uniform_eta_4x_avx DILITHIUM_F(poly_uniform_eta_4x_avx)
+#define poly_uniform_gamma1_4x_avx DILITHIUM_F(poly_uniform_gamma1_4x_avx)
+#define polyz_unpack_avx DILITHIUM_F(polyz_unpack_avx)
+#define poly_challenge_avx DILITHIUM_F(poly_challenge_avx)
+#define polyeta_pack_avx DILITHIUM_F(polyeta_pack_avx)
+#define polyeta_unpack_avx DILITHIUM_F(polyeta_unpack_avx)
+#define polyt1_pack_avx DILITHIUM_F(polyt1_pack_avx)
+#define polyt1_unpack_avx DILITHIUM_F(polyt1_unpack_avx)
+#define polyt0_pack_avx DILITHIUM_F(polyt0_pack_avx)
+#define polyt0_unpack_avx DILITHIUM_F(polyt0_unpack_avx)
+#define polyz_pack_avx DILITHIUM_F(polyz_pack_avx)
+#define polyw1_pack_avx DILITHIUM_F(polyw1_pack_avx)
+#define polyvec_matrix_expand DILITHIUM_F(polyvec_matrix_expand)
+#define polyvec_matrix_expand_row0 DILITHIUM_F(polyvec_matrix_expand_row0)
+#define polyvec_matrix_expand_row1 DILITHIUM_F(polyvec_matrix_expand_row1)
+#define polyvec_matrix_expand_row2 DILITHIUM_F(polyvec_matrix_expand_row2)
+#define polyvec_matrix_expand_row3 DILITHIUM_F(polyvec_matrix_expand_row3)
+#define polyvec_matrix_expand_row4 DILITHIUM_F(polyvec_matrix_expand_row4)
+#define polyvec_matrix_expand_row5 DILITHIUM_F(polyvec_matrix_expand_row5)
+#define polyvec_matrix_expand_row6 DILITHIUM_F(polyvec_matrix_expand_row6)
+#define polyvec_matrix_expand_row7 DILITHIUM_F(polyvec_matrix_expand_row7)
+#define rej_uniform_avx DILITHIUM_F(rej_uniform_avx)
+#define rej_eta_avx DILITHIUM_F(rej_eta_avx)
+#define idxlut DILITHIUM_F(idxlut)
+#define power2round_avx DILITHIUM_F(power2round_avx)
+#define decompose_avx DILITHIUM_F(decompose_avx)
+#define make_hint_avx DILITHIUM_F(make_hint_avx)
+#define use_hint_avx DILITHIUM_F(use_hint_avx)
+#define dilithium_sign_avx2 DILITHIUM_F(sign_avx2)
+#define dilithium_sign_ctx_avx2 DILITHIUM_F(sign_ctx_avx2)
+#define dilithium_sign_init_avx2 DILITHIUM_F(sign_init_avx2)
+#define dilithium_sign_update_avx2 DILITHIUM_F(sign_update_avx2)
+#define dilithium_sign_final_avx2 DILITHIUM_F(sign_final_avx2)
+#define dilithium_verify_avx2 DILITHIUM_F(verify_avx2)
+#define dilithium_verify_ctx_avx2 DILITHIUM_F(verify_ctx_avx2)
+#define dilithium_verify_init_avx2 DILITHIUM_F(verify_init_avx2)
+#define dilithium_verify_update_avx2 DILITHIUM_F(verify_update_avx2)
+#define dilithium_verify_final_avx2 DILITHIUM_F(verify_final_avx2)
+
+/* ARMv8 Implementation */
+#define intt_SIMD_top_armv8 DILITHIUM_F(intt_SIMD_top_armv8)
+#define intt_SIMD_bot_armv8 DILITHIUM_F(intt_SIMD_bot_armv8)
+#define ntt_SIMD_top_armv8 DILITHIUM_F(ntt_SIMD_top_armv8)
+#define ntt_SIMD_bot_armv8 DILITHIUM_F(ntt_SIMD_bot_armv8)
+#define poly_uniformx2 DILITHIUM_F(poly_uniformx2)
+#define poly_uniform_etax2 DILITHIUM_F(poly_uniform_etax2)
+#define poly_uniform_gamma1x2 DILITHIUM_F(poly_uniform_gamma1x2)
+#define armv8_10_to_32 DILITHIUM_F(armv8_10_to_32)
+#define poly_reduce_armv8 DILITHIUM_F(poly_reduce_armv8)
+#define poly_caddq_armv8 DILITHIUM_F(poly_caddq_armv8)
+#define poly_power2round_armv8 DILITHIUM_F(poly_power2round_armv8)
+#define poly_pointwise_montgomery_armv8                                        \
+	DILITHIUM_F(poly_pointwise_montgomery_armv8)
+#define polyvecl_pointwise_acc_montgomery_armv8                                \
+	DILITHIUM_F(polyvecl_pointwise_acc_montgomery_armv8)
+#define dilithium_sign_armv8 DILITHIUM_F(sign_armv8)
+#define dilithium_sign_ctx_armv8 DILITHIUM_F(sign_ctx_armv8)
+#define dilithium_sign_init_armv8 DILITHIUM_F(sign_init_armv8)
+#define dilithium_sign_update_armv8 DILITHIUM_F(sign_update_armv8)
+#define dilithium_sign_final_armv8 DILITHIUM_F(sign_final_armv8)
+#define dilithium_verify_armv8 DILITHIUM_F(verify_armv8)
+#define dilithium_verify_ctx_armv8 DILITHIUM_F(verify_ctx_armv8)
+#define dilithium_verify_init_armv8 DILITHIUM_F(verify_init_armv8)
+#define dilithium_verify_update_armv8 DILITHIUM_F(verify_update_armv8)
+#define dilithium_verify_final_armv8 DILITHIUM_F(verify_final_armv8)
+
+/* ARMv7 Implementation */
+#define armv7_ntt_asm_smull DILITHIUM_F(armv7_ntt_asm_smull)
+#define armv7_inv_ntt_asm_smull DILITHIUM_F(armv7_inv_ntt_asm_smull)
+#define armv7_poly_pointwise_invmontgomery_asm_smull                           \
+	DILITHIUM_F(armv7_poly_pointwise_invmontgomery_asm_smull)
+#define armv7_poly_pointwise_acc_invmontgomery_asm_smull                       \
+	DILITHIUM_F(armv7_poly_pointwise_acc_invmontgomery_asm_smull)
+#define poly_uniform_armv7 DILITHIUM_F(poly_uniform_armv7)
+#define armv7_poly_reduce_asm DILITHIUM_F(armv7_poly_reduce_asm)
+#define armv7_rej_uniform_asm DILITHIUM_F(armv7_rej_uniform_asm)
+#define dilithium_sign_armv7 DILITHIUM_F(sign_armv7)
+#define dilithium_sign_ctx_armv7 DILITHIUM_F(sign_ctx_armv7)
+#define dilithium_sign_init_armv7 DILITHIUM_F(sign_init_armv7)
+#define dilithium_sign_update_armv7 DILITHIUM_F(sign_update_armv7)
+#define dilithium_sign_final_armv7 DILITHIUM_F(sign_final_armv7)
+#define dilithium_verify_armv7 DILITHIUM_F(verify_armv7)
+#define dilithium_verify_ctx_armv7 DILITHIUM_F(verify_ctx_armv7)
+#define dilithium_verify_init_armv7 DILITHIUM_F(verify_init_armv7)
+#define dilithium_verify_update_armv7 DILITHIUM_F(verify_update_armv7)
+#define dilithium_verify_final_armv7 DILITHIUM_F(verify_final_armv7)
+
+/* RISCV 64 ASM Implementation */
+#define dilithium_sign_riscv64 DILITHIUM_F(sign_riscv64)
+#define dilithium_sign_ctx_riscv64 DILITHIUM_F(sign_ctx_riscv64)
+#define dilithium_sign_init_riscv64 DILITHIUM_F(sign_init_riscv64)
+#define dilithium_sign_update_riscv64 DILITHIUM_F(sign_update_riscv64)
+#define dilithium_sign_final_riscv64 DILITHIUM_F(sign_final_riscv64)
+#define dilithium_verify_riscv64 DILITHIUM_F(verify_riscv64)
+#define dilithium_verify_ctx_riscv64 DILITHIUM_F(verify_ctx_riscv64)
+#define dilithium_verify_init_riscv64 DILITHIUM_F(verify_init_riscv64)
+#define dilithium_verify_update_riscv64 DILITHIUM_F(verify_update_riscv64)
+#define dilithium_verify_final_riscv64 DILITHIUM_F(verify_final_riscv64)
+#define dilithium_ntt_8l_rv64im DILITHIUM_F(ntt_8l_rv64im)
+#define dilithium_intt_8l_rv64im DILITHIUM_F(intt_8l_rv64im)
+#define dilithium_poly_basemul_8l_init_rv64im                                  \
+	DILITHIUM_F(poly_basemul_8l_init_rv64im)
+#define dilithium_poly_basemul_8l_acc_rv64im                                   \
+	DILITHIUM_F(poly_basemul_8l_acc_rv64im)
+#define dilithium_poly_basemul_8l_acc_end_rv64im                               \
+	DILITHIUM_F(poly_basemul_8l_acc_end_rv64im)
+#define dilithium_poly_basemul_8l_rv64im DILITHIUM_F(poly_basemul_8l_rv64im)
+#define dilithium_poly_reduce_rv64im DILITHIUM_F(poly_reduce_rv64im)
+
+/* RISCV 64 RVV Implementation */
+#define dilithium_sign_riscv64_rvv DILITHIUM_F(sign_riscv64_rvv)
+#define dilithium_sign_ctx_riscv64_rvv DILITHIUM_F(sign_ctx_riscv64_rvv)
+#define dilithium_sign_init_riscv64_rvv DILITHIUM_F(sign_init_riscv64_rvv)
+#define dilithium_sign_update_riscv64_rvv                                   \
+	DILITHIUM_F(sign_update_riscv64_rvv)
+#define dilithium_sign_final_riscv64_rvv DILITHIUM_F(sign_final_riscv64_rvv)
+#define dilithium_verify_riscv64_rvv DILITHIUM_F(verify_riscv64_rvv)
+#define dilithium_verify_ctx_riscv64_rvv DILITHIUM_F(verify_ctx_riscv64_rvv)
+#define dilithium_verify_init_riscv64_rvv                                   \
+	DILITHIUM_F(verify_init_riscv64_rvv)
+#define dilithium_verify_update_riscv64_rvv                                 \
+	DILITHIUM_F(verify_update_riscv64_rvv)
+#define dilithium_verify_final_riscv64_rvv                                  \
+	DILITHIUM_F(verify_final_riscv64_rvv)
+#define dilithium_ntt_8l_rvv DILITHIUM_F(ntt_8l_rvv)
+#define dilithium_intt_8l_rvv DILITHIUM_F(intt_8l_rvv)
+#define dilithium_poly_basemul_8l_rvv DILITHIUM_F(poly_basemul_8l_rvv)
+#define dilithium_poly_basemul_acc_8l_rvv DILITHIUM_F(poly_basemul_acc_8l_rvv)
+#define dilithium_ntt2normal_order_8l_rvv DILITHIUM_F(ntt2normal_order_8l_rvv)
+#define dilithium_normal2ntt_order_8l_rvv DILITHIUM_F(normal2ntt_order_8l_rvv)
+#define dilithium_poly_reduce_rvv DILITHIUM_F(poly_reduce_rvv)
+
+#endif /* DILITHIUM_TYPE_H */
diff --git a/crypto/ml_dsa/dilithium_zetas.c b/crypto/ml_dsa/dilithium_zetas.c
new file mode 100644
index 000000000000..f0e9203f35dd
--- /dev/null
+++ b/crypto/ml_dsa/dilithium_zetas.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+/*
+ * This code is derived in parts from the code distribution provided with
+ * https://github.com/pq-crystals/dilithium
+ *
+ * That code is released under Public Domain
+ * (https://creativecommons.org/share-your-work/public-domain/cc0/);
+ * or Apache 2.0 License (https://www.apache.org/licenses/LICENSE-2.0.html).
+ */
+
+#include "dilithium.h"
+
+const int32_t dilithium_zetas[DILITHIUM_N] = {
+	0,	  25847,    -2608894, -518909,	237124,	  -777960,  -876248,
+	466468,	  1826347,  2353451,  -359251,	-2091905, 3119733,  -2884855,
+	3111497,  2680103,  2725464,  1024112,	-1079900, 3585928,  -549488,
+	-1119584, 2619752,  -2108549, -2118186, -3859737, -1399561, -3277672,
+	1757237,  -19422,   4010497,  280005,	2706023,  95776,    3077325,
+	3530437,  -1661693, -3592148, -2537516, 3915439,  -3861115, -3043716,
+	3574422,  -2867647, 3539968,  -300467,	2348700,  -539299,  -1699267,
+	-1643818, 3505694,  -3821735, 3507263,	-2140649, -1600420, 3699596,
+	811944,	  531354,   954230,   3881043,	3900724,  -2556880, 2071892,
+	-2797779, -3930395, -1528703, -3677745, -3041255, -1452451, 3475950,
+	2176455,  -1585221, -1257611, 1939314,	-4083598, -1000202, -3190144,
+	-3157330, -3632928, 126922,   3412210,	-983419,  2147896,  2715295,
+	-2967645, -3693493, -411027,  -2477047, -671102,  -1228525, -22981,
+	-1308169, -381987,  1349076,  1852771,	-1430430, -3343383, 264944,
+	508951,	  3097992,  44288,    -1100098, 904516,	  3958618,  -3724342,
+	-8578,	  1653064,  -3249728, 2389356,	-210977,  759969,   -1316856,
+	189548,	  -3553272, 3159746,  -1851402, -2409325, -177440,  1315589,
+	1341330,  1285669,  -1584928, -812732,	-1439742, -3019102, -3881060,
+	-3628969, 3839961,  2091667,  3407706,	2316500,  3817976,  -3342478,
+	2244091,  -2446433, -3562462, 266997,	2434439,  -1235728, 3513181,
+	-3520352, -3759364, -1197226, -3193378, 900702,	  1859098,  909542,
+	819034,	  495491,   -1613174, -43260,	-522500,  -655327,  -3122442,
+	2031748,  3207046,  -3556995, -525098,	-768622,  -3595838, 342297,
+	286988,	  -2437823, 4108315,  3437287,	-3342277, 1735879,  203044,
+	2842341,  2691481,  -2590150, 1265009,	4055324,  1247620,  2486353,
+	1595974,  -3767016, 1250494,  2635921,	-3548272, -2994039, 1869119,
+	1903435,  -1050970, -1333058, 1237275,	-3318210, -1430225, -451100,
+	1312455,  3306115,  -1962642, -1279661, 1917081,  -2546312, -1374803,
+	1500165,  777191,   2235880,  3406031,	-542412,  -2831860, -1671176,
+	-1846953, -2584293, -3724270, 594136,	-3776993, -2013608, 2432395,
+	2454455,  -164721,  1957272,  3369112,	185531,	  -1207385, -3183426,
+	162844,	  1616392,  3014001,  810149,	1652634,  -3694233, -1799107,
+	-3038916, 3523897,  3866901,  269760,	2213111,  -975884,  1717735,
+	472078,	  -426683,  1723600,  -1803090, 1910376,  -1667432, -1104333,
+	-260646,  -3833893, -2939036, -2235985, -420899,  -2286327, 183443,
+	-976891,  1612842,  -3545687, -554416,	3919660,  -48306,   -1362209,
+	3937738,  1400424,  -846154,  1976782
+};
diff --git a/crypto/ml_dsa/fips_mode.h b/crypto/ml_dsa/fips_mode.h
new file mode 100644
index 000000000000..f185f204366e
--- /dev/null
+++ b/crypto/ml_dsa/fips_mode.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2025, Stephan Mueller <smueller@chronox.de>
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
+#ifndef FIPS_MODE_H
+#define FIPS_MODE_H
+
+/**
+ * @brief Is FIPS 140 Mode enabled?
+ *
+ * return 0 == false, 1 == true
+ */
+static inline bool fips140_mode_enabled(void)
+{
+	return false;
+}
+
+#define FIPS140_PCT_LOOP(func)						\
+	if (fips140_mode_enabled()) {					\
+		unsigned int __i;					\
+		int __ret;						\
+									\
+		for (__i = 0; __i < 5; __i++) {				\
+			__ret = func;					\
+			if (!__ret)					\
+				return __ret;				\
+		}							\
+		WARN_ON(0);						\
+	}
+
+#endif /* FIPS_MODE_H */
diff --git a/crypto/ml_dsa/signature_domain_separation.c b/crypto/ml_dsa/signature_domain_separation.c
new file mode 100644
index 000000000000..f0a173797c96
--- /dev/null
+++ b/crypto/ml_dsa/signature_domain_separation.c
@@ -0,0 +1,213 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
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
+#include <crypto/sha3.h>
+#include <crypto/hash.h>
+#include "signature_domain_separation.h"
+
+static const char *signature_prehash_type;
+
+/* RFC4055 2.16.840.1.101.3.4.2.1 */
+static const uint8_t sha256_oid_der[] __maybe_unused = { 0x06, 0x09, 0x60, 0x86,
+							 0x48, 0x01, 0x65, 0x03,
+							 0x04, 0x02, 0x01 };
+/* RFC4055 2.16.840.1.101.3.4.2.2 */
+static const uint8_t sha384_oid_der[] __maybe_unused = { 0x06, 0x09, 0x60, 0x86,
+							 0x48, 0x01, 0x65, 0x03,
+							 0x04, 0x02, 0x02 };
+/* RFC4055 2.16.840.1.101.3.4.2.3 */
+static const uint8_t sha512_oid_der[] __maybe_unused = { 0x06, 0x09, 0x60, 0x86,
+							 0x48, 0x01, 0x65, 0x03,
+							 0x04, 0x02, 0x03 };
+
+/*
+ * https://lamps-wg.github.io/draft-composite-sigs/draft-ietf-lamps-pq-composite-sigs.html
+ */
+static const uint8_t sha3_256_oid_der[] __maybe_unused = {
+	0x06, 0x09, 0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x08
+};
+static const uint8_t sha3_384_oid_der[] __maybe_unused = {
+	0x06, 0x09, 0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x09
+};
+static const uint8_t sha3_512_oid_der[] __maybe_unused = {
+	0x06, 0x09, 0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x0a
+};
+
+/* RFC8692 2.16.840.1.101.3.4.2.11 */
+static const uint8_t shake128_oid_der[] __maybe_unused = {
+	0x06, 0x09, 0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x0B
+};
+
+/* RFC8692 2.16.840.1.101.3.4.2.11 */
+static const uint8_t shake256_oid_der[] __maybe_unused = {
+	0x06, 0x09, 0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x0C
+};
+
+int signature_ph_oids(struct shake256_ctx *hash_ctx, size_t mlen,
+		      unsigned int nist_category)
+{
+	/* If no hash is supplied, we have no HashML-DSA */
+	if (!signature_prehash_type)
+		return 0;
+
+	/*
+	 * The signature init/update/final operation will not work with the
+	 * check of mlen, as only when _final is invoked, the message length
+	 * is known.
+	 *
+	 * As defined in FIPS 204, section 5.4 requires
+	 * "... the digest that is signed needs to be generated using an
+	 * approved hash function or XOF (e.g., from FIPS 180 or FIPS 202) that
+	 * provides at least λ bits of classical security strength against both
+	 * collision and second preimage attacks ... Obtaining at least λ bits
+	 * of classical security strength against collision attacks requires
+	 * that the digest to be signed be at least 2λ bits in length."
+	 * This requirement implies in the following definitions.
+	 */
+	(void)mlen;
+
+	switch (nist_category) {
+	case 1:
+		if (strcmp(signature_prehash_type, "sha256") == 0) {
+			// if (mlen != LC_SHA256_SIZE_DIGEST)
+			// 	return -EOPNOTSUPP;
+			shake256_update(hash_ctx, sha256_oid_der,
+					sizeof(sha256_oid_der));
+			return 0;
+		}
+		if (strcmp(signature_prehash_type, "sha3-256") == 0) {
+			// if (mlen != LC_SHA3_256_SIZE_DIGEST)
+			// 	return -EOPNOTSUPP;
+			shake256_update(hash_ctx, sha3_256_oid_der,
+					sizeof(sha3_256_oid_der));
+			return 0;
+		}
+		if (strcmp(signature_prehash_type, "shake128") == 0) {
+			/* FIPS 204 section 5.4.1 */
+			// if (mlen != 32)
+			// 	return -EOPNOTSUPP;
+			shake256_update(hash_ctx, shake128_oid_der,
+					sizeof(shake128_oid_der));
+			return 0;
+		}
+		/* FALLTHROUGH - Dilithium44 allows the following, too */
+		fallthrough;
+	case 3:
+		if (strcmp(signature_prehash_type, "sha3-384") == 0) {
+			// if (mlen != LC_SHA3_384_SIZE_DIGEST)
+			// 	return -EOPNOTSUPP;
+			shake256_update(hash_ctx, sha3_384_oid_der,
+					sizeof(sha3_384_oid_der));
+			return 0;
+		}
+		if (strcmp(signature_prehash_type, "sha384") == 0) {
+			// if (mlen != LC_SHA384_SIZE_DIGEST)
+			// 	return -EOPNOTSUPP;
+			shake256_update(hash_ctx, sha384_oid_der,
+					sizeof(sha384_oid_der));
+			return 0;
+		}
+		/* FALLTHROUGH - Dilithium[44|65] allows the following, too  */
+		fallthrough;
+	case 5:
+		if (strcmp(signature_prehash_type, "sha512") == 0) {
+			// if (mlen != LC_SHA512_SIZE_DIGEST)
+			// 	return -EOPNOTSUPP;
+			shake256_update(hash_ctx, sha512_oid_der,
+					sizeof(sha512_oid_der));
+			return 0;
+		}
+		if (strcmp(signature_prehash_type, "sha3-512") == 0) {
+			// if (mlen != LC_SHA3_512_SIZE_DIGEST)
+			// 	return -EOPNOTSUPP;
+			shake256_update(hash_ctx, sha3_512_oid_der,
+					sizeof(sha3_512_oid_der));
+			return 0;
+		} else if (strcmp(signature_prehash_type, "shake256") == 0) {
+			/* FIPS 204 section 5.4.1 */
+			/*
+			 * TODO: mlen must be >= 64 to comply with the
+			 * aforementioned requirement - unfortunately we can
+			 * only check mlen at the end of the signature
+			 * operation - shall this be implemented?
+			 */
+			// if (mlen != 64)
+			// 	return -EOPNOTSUPP;
+			shake256_update(hash_ctx, shake256_oid_der,
+					sizeof(shake256_oid_der));
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+/* FIPS 204 pre-hash ML-DSA domain separation, but without original message */
+static int standalone_signature_domain_separation(
+	struct shake256_ctx *hash_ctx, const uint8_t *userctx,
+	size_t userctxlen, size_t mlen, unsigned int nist_category)
+{
+	uint8_t domainseparation[2];
+
+	domainseparation[0] = signature_prehash_type ? 1 : 0;
+	domainseparation[1] = (uint8_t)userctxlen;
+
+	shake256_update(hash_ctx, domainseparation, sizeof(domainseparation));
+	shake256_update(hash_ctx, userctx, userctxlen);
+
+	return signature_ph_oids(hash_ctx, mlen, nist_category);
+}
+
+/*
+ * Domain separation as required by:
+ *
+ * FIPS 204 pre-hash ML-DSA: randomizer is NULL
+ * Composite ML-DSA draft 5: randomizer is set
+ */
+int signature_domain_separation(struct shake256_ctx *hash_ctx,
+				unsigned int ml_dsa_internal,
+				const uint8_t *userctx, size_t userctxlen,
+				const uint8_t *m, size_t mlen,
+				const uint8_t *randomizer, size_t randomizerlen,
+				unsigned int nist_category)
+{
+	int ret = 0;
+
+	/* The internal operation skips the domain separation code */
+	if (ml_dsa_internal)
+		goto out;
+
+	if (userctxlen > 255)
+		return -EINVAL;
+
+	/* If Composite ML-DSA is requested, use domain as userctx */
+	if (randomizer) {
+		return -EOPNOTSUPP;
+	} else {
+		ret = standalone_signature_domain_separation(
+			hash_ctx, userctx, userctxlen,
+			mlen, nist_category);
+	}
+
+out:
+	shake256_update(hash_ctx, m, mlen);
+	return ret;
+}
diff --git a/crypto/ml_dsa/signature_domain_separation.h b/crypto/ml_dsa/signature_domain_separation.h
new file mode 100644
index 000000000000..01dafaa851bf
--- /dev/null
+++ b/crypto/ml_dsa/signature_domain_separation.h
@@ -0,0 +1,33 @@
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
+#ifndef SIGNATURE_DOMAIN_SEPARATION_H
+#define SIGNATURE_DOMAIN_SEPARATION_H
+
+#include <crypto/sha3.h>
+
+int signature_domain_separation(struct shake256_ctx *hash_ctx,
+				unsigned int ml_dsa_internal,
+				const uint8_t *userctx, size_t userctxlen,
+				const uint8_t *m, size_t mlen,
+				const uint8_t *randomizer, size_t randomizerlen,
+				unsigned int nist_category);
+int signature_ph_oids(struct shake256_ctx *hash_ctx, size_t mlen,
+		      unsigned int nist_category);
+
+#endif /* SIGNATURE_DOMAIN_SEPARATION_H */
diff --git a/crypto/ml_dsa/small_stack_support.h b/crypto/ml_dsa/small_stack_support.h
new file mode 100644
index 000000000000..9c1eba6c40bf
--- /dev/null
+++ b/crypto/ml_dsa/small_stack_support.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/*
+ * Copyright (C) 2022 - 2025, Stephan Mueller <smueller@chronox.de>
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
+#ifndef SMALL_STACK_SUPPORT_H
+#define SMALL_STACK_SUPPORT_H
+
+/* Allocate memory on heap */
+#define __LC_DECLARE_MEM_HEAP(name, type, alignment)                           \
+	type *name = kzalloc(round_up(sizeof(type), alignment), GFP_KERNEL);	\
+	if (!name)                                                    \
+		return -ENOMEM;                                                  \
+
+#define __LC_RELEASE_MEM_HEAP(name)                                            \
+	kfree_sensitive(name);
+
+#define noinline_stack noinline
+
+#define LC_DECLARE_MEM(name, type, alignment)                                  \
+	_Pragma("GCC diagnostic push")                                         \
+		_Pragma("GCC diagnostic ignored \"-Wcast-align\"")             \
+			__LC_DECLARE_MEM_HEAP(name, type, alignment);          \
+	_Pragma("GCC diagnostic pop")
+#define LC_RELEASE_MEM(name) __LC_RELEASE_MEM_HEAP(name)
+
+#endif /* SMALL_STACK_SUPPORT_H */


