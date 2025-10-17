Return-Path: <keyrings+bounces-3229-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 59797BE9446
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 16:44:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 45BD04E8798
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 14:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D08AB32E137;
	Fri, 17 Oct 2025 14:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AJ8+EUU3"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2376335073
	for <keyrings@vger.kernel.org>; Fri, 17 Oct 2025 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712229; cv=none; b=UbQ4QZG9Rbu95Za2KUvZruwI/lI/jotfXeP6O9xLear4qReIscjvh0oe65gU7u38GOsq9GcFG1CWxOerfv5K0gx8D2iv8rqbfKLF6MoyECnsIU9LGVR1/7TLes5APqInBVkVxSa6mQ+zeth0g40dSvPI6X7VAApivvTOHI7zpu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712229; c=relaxed/simple;
	bh=MKtLPb3JWAY/ODMfAAbJuc8AYO4OysaoyHal7fdxAsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o+tI4+kW7iCc2lxLRVo+nlMCeM2AaYG3XZbml6PXWvKGr457BL3MvWCGlcsjJBlc+pyRn1tPkSqupaN3YdZchkI+zoyKkoxg981RrOtN3NxieddFdeLz4aDCAgia51OP/7dMzrU+15xLUnC3HjyVQu5nmXMBz3Yo7S6SwmD4TYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AJ8+EUU3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760712224;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fIihT7BLG6S9/RDveEx+N/FsskCDLsZ81KaOXCtfdIQ=;
	b=AJ8+EUU3GTQML5XdfiUFpyq/okZwbt0of9ppsn8XpIhKuj8I7LdlzPT6Z27FK7d7sBMAjn
	nFQ7JWK6QAdovn3KO90U7gOBW5TjZo/uyjn/C5dxFSOUCz30Qm6O3wruWfN2MLFbUHPiDU
	ZdRzfrbJiyffzLuZlYTDevnlhwsLif0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-331-Oq6Qpi2-OxiKrHOyC1upag-1; Fri,
 17 Oct 2025 10:43:41 -0400
X-MC-Unique: Oq6Qpi2-OxiKrHOyC1upag-1
X-Mimecast-MFC-AGG-ID: Oq6Qpi2-OxiKrHOyC1upag_1760712219
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE6E81800742;
	Fri, 17 Oct 2025 14:43:38 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.57])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C622C300019F;
	Fri, 17 Oct 2025 14:43:34 +0000 (UTC)
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
Subject: [PATCH v6 03/17] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA3-512, SHAKE128, SHAKE256
Date: Fri, 17 Oct 2025 15:42:47 +0100
Message-ID: <20251017144311.817771-4-dhowells@redhat.com>
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

Add SHA3, providing SHA3-224, SHA3-256, SHA3-384, SHA3-512, SHAKE128 and
SHAKE256 to lib/crypto.

Notes:

 (1) I've left hooks in sha3.c for asm-optimised variants, but as I don't
     entirely know what those might look like, not having implemented any,
     the hooks' usability is uncertain.

 (2) The SHAKE algorithms will be required for ML-DSA.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Jason A. Donenfeld <Jason@zx2c4.com>
cc: Ard Biesheuvel <ardb@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: Stephan Mueller <smueller@chronox.de>
cc: linux-crypto@vger.kernel.org

Changes
=======
v4)
 - Doc fixes:
   - Fix the description of the algorithm to be closer to the NIST spec's
     terminology.
   - Don't talk of finialising the context for XOFs.
   - Don't say "Return: None".
   - Declare the "Context" to be "Any context" and make no mention of the
     fact that it might use the FPU.
   - Change "initialise" to "initialize".
   - Don't warn that the context is relatively large for stack use.
 - Use size_t for size parameters/variables.
 - Make the module_exit unconditional.

v3)
 - Split the s390 function rename out to a separate patch.

v2)
 - Simplify things by keeping the state array in LE form and byteswapping
   all the 64-bit words before and after applying the keccak function on a
   BE system.  This means no byteswapping is required when XOR'ing data
   into the state array or when extracting the digest.  Further, this is a
   no-op on LE systems.

 - Rename sha3_final() to sha3_squeeze() and don't clear the context at the
   end as it's permitted to continue calling sha3_final() to extract
   continuations of the digest (needed by ML-DSA).

 - Don't reapply the end marker to the hash state in continuation
   sha3_squeeze() unless sha3_update() gets called again (needed by
   ML-DSA).

 - Give sha3_squeeze() the amount of digest to produce as a parameter
   rather than using ctx->digest_size and don't return the amount digested.

 - Reimplement sha3_final() as a wrapper around sha3_squeeze() that
   extracts ctx->digest_size amount of digest and then zeroes out the
   context.  The latter is necessary to avoid upsetting
   hash-test-template.h.

 - Provide a sha3_reinit() function to clear the state, but to leave the
   parameters that indicate the hash properties unaffected, allowing for
   reuse.

 - Provide a sha3_set_digestsize() function to change the size of the
   digest to be extracted by sha3_final().  sha3_squeeze() takes a
   parameter for this instead.

 - Don't pass the digest size as a parameter to shake128/256_init() but
   rather default to 128/256 bits as per the function name.

 - Provide a sha3_clear() function to zero out the context.
---
 Documentation/crypto/index.rst |   1 +
 Documentation/crypto/sha3.rst  | 241 ++++++++++++++++
 include/crypto/sha3.h          | 433 +++++++++++++++++++++++++++-
 lib/crypto/Kconfig             |   7 +
 lib/crypto/Makefile            |   6 +
 lib/crypto/sha3.c              | 511 +++++++++++++++++++++++++++++++++
 6 files changed, 1198 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/crypto/sha3.rst
 create mode 100644 lib/crypto/sha3.c

diff --git a/Documentation/crypto/index.rst b/Documentation/crypto/index.rst
index 100b47d049c0..4ee667c446f9 100644
--- a/Documentation/crypto/index.rst
+++ b/Documentation/crypto/index.rst
@@ -27,3 +27,4 @@ for cryptographic use cases, as well as programming examples.
    descore-readme
    device_drivers/index
    krb5
+   sha3
diff --git a/Documentation/crypto/sha3.rst b/Documentation/crypto/sha3.rst
new file mode 100644
index 000000000000..3255618ea2ec
--- /dev/null
+++ b/Documentation/crypto/sha3.rst
@@ -0,0 +1,241 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+==========================
+SHA-3 Algorithm collection
+==========================
+
+.. Contents:
+
+  - Overview
+  - Basic API
+    - Extendable-Output Functions
+  - Convenience API
+  - Internal API
+    - Testing
+  - References
+  - API Function Reference
+
+
+Overview
+========
+
+The SHA-3 algorithm base, as specified in NIST FIPS-202[1], provides a number
+of specific variants all based on the same basic algorithm (the Keccak sponge
+function and permutation).  The differences between them are: the "rate" (how
+much of the common state buffer gets updated with new data between invocations
+of the Keccak function and analogous to the "block size"), what domain
+separation suffix/padding gets appended to the message and how much data is
+extracted at the end.  The Keccak sponge function is designed such that
+arbitrary amounts of output can be obtained for certain algorithms.
+
+Four standard digest algorithms are provided:
+
+ - SHA3-224
+ - SHA3-256
+ - SHA3-384
+ - SHA3-512
+
+and two Extendable-Output Functions (XOF):
+
+ - SHAKE128
+ - SHAKE256
+
+If selectable algorithms are required then the crypto_hash API may be used
+instead as this binds each algorithm to a specific C type.
+
+
+Basic API
+=========
+
+The basic API has a separate context struct for each algorithm in the SHA3
+suite, none of the contents of which are expected to be accessed directly::
+
+	struct sha3_224_ctx { ... };
+	struct sha3_256_ctx { ... };
+	struct sha3_384_ctx { ... };
+	struct sha3_512_ctx { ... };
+	struct shake128_ctx { ... };
+	struct shake256_ctx { ... };
+
+There are a collection of initialisation functions, one for each algorithm
+supported, that initialise the context appropriately for that algorithm::
+
+	void sha3_224_init(struct sha3_224_ctx *ctx);
+	void sha3_256_init(struct sha3_256_ctx *ctx);
+	void sha3_384_init(struct sha3_384_ctx *ctx);
+	void sha3_512_init(struct sha3_512_ctx *ctx);
+	void shake128_init(struct shake128_ctx *ctx);
+	void shake256_init(struct shake256_ctx *ctx);
+
+Data is then added with the appropriate update function, again one per
+algorithm::
+
+	void sha3_224_update(struct sha3_224_ctx *ctx,
+			     const u8 *data, size_t len);
+	void sha3_256_update(struct sha3_256_ctx *ctx,
+			     const u8 *data, size_t len);
+	void sha3_384_update(struct sha3_384_ctx *ctx,
+			     const u8 *data, size_t len);
+	void sha3_512_update(struct sha3_512_ctx *ctx,
+			     const u8 *data, size_t len);
+	void shake128_update(struct shake128_ctx *ctx,
+			     const u8 *data, size_t len);
+	void shake256_update(struct shake256_ctx *ctx,
+			     const u8 *data, size_t len);
+
+The update function may be called multiple times if need be to add
+non-contiguous data.
+
+For digest algorithms, the digest is finalised and extracted with the
+algorithm-specific function::
+
+	void sha3_224_final(struct sha3_224_ctx *ctx,
+			    u8 out[SHA3_224_DIGEST_SIZE]);
+	void sha3_256_final(struct sha3_256_ctx *ctx,
+			    u8 out[SHA3_256_DIGEST_SIZE]);
+	void sha3_384_final(struct sha3_384_ctx *ctx,
+			    u8 out[SHA3_384_DIGEST_SIZE]);
+	void sha3_512_final(struct sha3_512_ctx *ctx,
+			    u8 out[SHA3_512_DIGEST_SIZE]);
+
+which also explicitly clears the context.  The amount of data extracted is
+determined by the type.
+
+
+Extendable-Output Functions
+---------------------------
+
+For XOFs, once the data has been added to a context, a variable amount of data
+may be extracted.  This can be done by calling the appropriate squeeze
+function::
+
+	void shake128_squeeze(struct shake128_ctx *ctx, u8 *out, size_t out_len);
+	void shake256_squeeze(struct shake256_ctx *ctx, u8 *out, size_t out_len);
+
+and telling it how much data should be extracted.  The squeeze function may be
+called multiple times but it will only append the domain separation suffix on
+the first invocation.
+
+Note that performing a number of squeezes, with the output laid consequitively
+in a buffer, gets exactly the same output as doing a single squeeze for the
+combined amount over the same buffer.
+
+Once all the desired output has been extracted, the context should be cleared
+with the clear function appropriate to the algorithm::
+
+	void shake128_clear(struct shake128_ctx *ctx);
+	void shake256_clear(struct shake256_ctx *ctx);
+
+
+Convenience API
+===============
+
+It only a single contiguous buffer of input needs to be added and only a single
+buffer of digest or XOF output is required, then a convenience API is provided
+that wraps all the required steps into a single function.  There is one
+function for each algorithm supported::
+
+	void sha3_224(const u8 *in, size_t in_len, u8 out[SHA3_224_DIGEST_SIZE]);
+	void sha3_256(const u8 *in, size_t in_len, u8 out[SHA3_256_DIGEST_SIZE]);
+	void sha3_384(const u8 *in, size_t in_len, u8 out[SHA3_384_DIGEST_SIZE]);
+	void sha3_512(const u8 *in, size_t in_len, u8 out[SHA3_512_DIGEST_SIZE]);
+	void shake128(const u8 *in, size_t in_len, u8 *out, size_t out_len);
+	void shake256(const u8 *in, size_t in_len, u8 *out, size_t out_len);
+
+
+Internal API
+============
+
+There is a common internal API underlying all of this that may be used to build
+further algorithms or APIs as the engine in the same in all cases.  The
+algorithm APIs all wrap the common context structure::
+
+	struct sha3_ctx {
+		struct sha3_state	state;
+		u8			block_size;
+		u8			padding;
+		u8			absorb_offset;
+		u8			squeeze_offset;
+		bool			end_marked;
+	};
+
+	struct sha3_state {
+		u64			st[SHA3_STATE_SIZE / 8];
+	};
+
+The fields are as follows:
+
+ * ``state.st``
+
+   An array of 25 64-bit state buckets that are used to hold the mathematical
+   state of the Keccak engine.  Data is XOR'd onto part of this, the engine is
+   cranked and then the output is copied from this.
+
+   For the convenience of adding input and extract output from it, the array is
+   kept in little-endian order most of the time, but is byteswapped to
+   host-endian in order to perform the Keccak function and then byteswapped
+   back again.  On an LE machine, the byteswapping is a no-op.
+
+ * ``block_size``
+
+   The size of the block of state that can be updated or extracted at a time.
+   This is related to the algorithm size and is analogous to the "rate" in the
+   algorithm definition.
+
+ * ``padding``
+
+   The terminating byte to add when finalising the stat.  This may differ
+   between algorithms.
+
+ * ``absorb_offset``
+
+   This tracks which is the next byte of state to be updated; when it hits
+   ``block_size``, the engine is cranked and this is reset to 0.
+
+ * ``squeeze_offset``
+
+   This tracks which is the next byte of state to be extracted; similar to
+   ``partial``, when it hits ``block_size``, if more output is requested, the
+   engine is cranked to generate more and this is reset to 0.
+
+ * ``end_marked``
+
+   This is set to true when the domain separation suffix and any padding have
+   been appended to the state to prevent multiple squeezings from XOF
+   algorithms from re-appending this.
+
+Note that the size of the digest is *not* included here as that's only needed
+at finalisation time for digest algorithms and can be supplied then.  It is not
+relevant to XOFs.
+
+To make use of the context, the following internal functions are provided::
+
+	void sha3_update(struct sha3_ctx *ctx, const u8 *data, size_t len);
+	void sha3_squeeze(struct sha3_ctx *ctx, u8 *out, size_t out_len);
+	void sha3_clear(struct sha3_ctx *ctx);
+
+These allow data to be appended to/absorbed into the state, output to be
+extracted/squeezed from the state and for the state to be cleared.  Note that
+there is no "final" function, per se, but that can be constructed by squeezing
+and clearing.
+
+
+Testing
+-------
+
+The sha3 module does a basic sanity test on initialisation, but there is also a
+kunit test module available.
+
+
+References
+==========
+
+[1] https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
+
+
+
+API Function Reference
+======================
+
+.. kernel-doc:: crypto/lib/sha3.c
+.. kernel-doc:: include/crypto/sha3.h
diff --git a/include/crypto/sha3.h b/include/crypto/sha3.h
index 41e1b83a6d91..a54117cb1546 100644
--- a/include/crypto/sha3.h
+++ b/include/crypto/sha3.h
@@ -1,11 +1,14 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
  * Common values for SHA-3 algorithms
+ *
+ * See also Documentation/crypto/sha3.rst
  */
 #ifndef __CRYPTO_SHA3_H__
 #define __CRYPTO_SHA3_H__
 
 #include <linux/types.h>
+#include <linux/string.h>
 
 #define SHA3_224_DIGEST_SIZE	(224 / 8)
 #define SHA3_224_BLOCK_SIZE	(200 - 2 * SHA3_224_DIGEST_SIZE)
@@ -23,6 +26,14 @@
 #define SHA3_512_BLOCK_SIZE	(200 - 2 * SHA3_512_DIGEST_SIZE)
 #define SHA3_512_EXPORT_SIZE	SHA3_STATE_SIZE + SHA3_512_BLOCK_SIZE + 1
 
+/* SHAKE128 and SHAKE256 actually have variable output size, but this is
+ * used to calculate the block size/rate analogously to the above..
+ */
+#define SHAKE128_DEFAULT_SIZE	(128 / 8)
+#define SHAKE128_BLOCK_SIZE	(200 - 2 * SHAKE128_DEFAULT_SIZE)
+#define SHAKE256_DEFAULT_SIZE	(256 / 8)
+#define SHAKE256_BLOCK_SIZE	(200 - 2 * SHAKE256_DEFAULT_SIZE)
+
 #define SHA3_STATE_SIZE		200
 
 struct shash_desc;
@@ -31,6 +42,426 @@ struct sha3_state {
 	u64		st[SHA3_STATE_SIZE / 8];
 };
 
+/*
+ * The SHA3 context structure and state buffer.
+ *
+ * To avoid the need to byteswap when adding input and extracting output from
+ * the state array, the state array is kept in little-endian order most of the
+ * time, but is byteswapped to host-endian in order to perform the Keccak
+ * function and then byteswapped back again after.  On a LE machine, the
+ * byteswap step is a no-op.
+ */
+struct sha3_ctx {
+	struct sha3_state	state;
+	u8			block_size;	/* Block size in bytes */
+	u8			padding;	/* Padding byte */
+	u8			absorb_offset;	/* Next state byte to absorb into */
+	u8			squeeze_offset;	/* Next state byte to extract */
+	bool			end_marked;	/* T if end marker inserted */
+};
+
 int crypto_sha3_init(struct shash_desc *desc);
 
-#endif
+/**
+ * sha3_clear() - Explicitly clear the entire context
+ * @ctx: the context to clear
+ *
+ * Explicitly clear the entire context, including the type parameters; after
+ * this, the context must be fully initialized again.
+ *
+ * Context: Any context.
+ */
+static inline void sha3_clear(struct sha3_ctx *ctx)
+{
+	memzero_explicit(ctx, sizeof(*ctx));
+}
+
+void sha3_update(struct sha3_ctx *ctx, const u8 *data, size_t len);
+void sha3_squeeze(struct sha3_ctx *ctx, u8 *out, size_t out_len);
+
+/*
+ * Context wrapper for SHA3-224.
+ */
+struct sha3_224_ctx {
+	struct sha3_ctx ctx;
+};
+
+/**
+ * sha3_224_init() - Set a SHA3 context for SHA3-224
+ * @ctx: the context to initialize
+ *
+ * Initialize a SHA3 context for the production of a SHA3-224 digest of a
+ * message.
+ *
+ * Context: Any context.
+ */
+static inline void sha3_224_init(struct sha3_224_ctx *ctx)
+{
+	*ctx = (struct sha3_224_ctx){
+		.ctx.block_size	= SHA3_224_BLOCK_SIZE,
+		.ctx.padding	= 0x06,
+	};
+}
+
+/**
+ * sha3_224_update() - Update a SHA3-224 hash with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times to add data to the hash, performing
+ * the "keccak sponge absorbing" phase.
+ *
+ * Context: Any context.
+ */
+static inline void sha3_224_update(struct sha3_224_ctx *ctx, const u8 *data, size_t len)
+{
+	return sha3_update(&ctx->ctx, data, len);
+}
+
+/**
+ * sha3_224_final() - Finalise a SHA3-224 hash and extract the digest
+ * @ctx: The context to finalise; must have been initialized
+ * @out: Where to write the resulting message digest
+ *
+ * Finish the computation of a SHA3-224 hash and perform the "Keccak sponge
+ * squeezing" phase.  The digest is written to @out buffer and the context will
+ * be completely zeroed out.
+ *
+ * Context: Any context.
+ */
+static inline void sha3_224_final(struct sha3_224_ctx *ctx, u8 out[SHA3_224_DIGEST_SIZE])
+{
+	sha3_squeeze(&ctx->ctx, out, SHA3_224_DIGEST_SIZE);
+	sha3_clear(&ctx->ctx);
+}
+
+/*
+ * Context wrapper for SHA3-256.
+ */
+struct sha3_256_ctx {
+	struct sha3_ctx ctx;
+};
+
+/**
+ * sha3_256_init() - Set a SHA3 context for SHA3-256
+ * @ctx: the context to initialize
+ *
+ * Initialize a SHA3 context for the production of a SHA3-256 digest of a
+ * message.
+ *
+ * Context: Any context.
+ */
+static inline void sha3_256_init(struct sha3_256_ctx *ctx)
+{
+	*ctx = (struct sha3_256_ctx){
+		.ctx.block_size	= SHA3_256_BLOCK_SIZE,
+		.ctx.padding	= 0x06,
+	};
+}
+
+/**
+ * sha3_256_update() - Update a SHA3-256 hash with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times to add data to the hash, performing
+ * the "keccak sponge absorbing" phase.
+ *
+ * Context: Any context.
+ */
+static inline void sha3_256_update(struct sha3_256_ctx *ctx, const u8 *data, size_t len)
+{
+	return sha3_update(&ctx->ctx, data, len);
+}
+
+/**
+ * sha3_256_final() - Finalise a SHA3-256 hash and extract the digest
+ * @ctx: The context to finalise; must have been initialized
+ * @out: Where to write the resulting message digest
+ *
+ * Finish the computation of a SHA3-256 hash and perform the "Keccak sponge
+ * squeezing" phase.  The digest is written to @out buffer and the context will
+ * be completely zeroed out.
+ *
+ * Context: Any context.
+ */
+static inline void sha3_256_final(struct sha3_256_ctx *ctx, u8 out[SHA3_256_DIGEST_SIZE])
+{
+	sha3_squeeze(&ctx->ctx, out, SHA3_256_DIGEST_SIZE);
+	sha3_clear(&ctx->ctx);
+}
+
+/*
+ * Context wrapper for SHA3-384.
+ */
+struct sha3_384_ctx {
+	struct sha3_ctx ctx;
+};
+
+/**
+ * sha3_384_init() - Set a SHA3 context for SHA3-384
+ * @ctx: the context to initialize
+ *
+ * Initialize a SHA3 context for the production of a SHA3-384 digest of a
+ * message.
+ *
+ * Context: Any context.
+ */
+static inline void sha3_384_init(struct sha3_384_ctx *ctx)
+{
+	*ctx = (struct sha3_384_ctx){
+		.ctx.block_size	= SHA3_384_BLOCK_SIZE,
+		.ctx.padding	= 0x06,
+	};
+}
+
+/**
+ * sha3_384_update() - Update a SHA3-384 hash with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times to add data to the hash, performing
+ * the "keccak sponge absorbing" phase.
+ *
+ * Context: Any context.
+ */
+static inline void sha3_384_update(struct sha3_384_ctx *ctx, const u8 *data, size_t len)
+{
+	return sha3_update(&ctx->ctx, data, len);
+}
+
+/**
+ * sha3_384_final() - Finalise a SHA3-384 hash and extract the digest
+ * @ctx: The context to finalise; must have been initialized
+ * @out: Where to write the resulting message digest
+ *
+ * Finish the computation of a SHA3-384 hash and perform the "Keccak sponge
+ * squeezing" phase.  The digest is written to @out buffer and the context will
+ * be completely zeroed out.
+ *
+ * Context: Any context.
+ */
+static inline void sha3_384_final(struct sha3_384_ctx *ctx, u8 out[SHA3_384_DIGEST_SIZE])
+{
+	sha3_squeeze(&ctx->ctx, out, SHA3_384_DIGEST_SIZE);
+	sha3_clear(&ctx->ctx);
+}
+
+/*
+ * Context wrapper for SHA3-512.
+ */
+struct sha3_512_ctx {
+	struct sha3_ctx ctx;
+};
+
+/**
+ * sha3_512_init() - Set a SHA3 context for SHA3-512
+ * @ctx: the context to initialize
+ *
+ * Initialize a SHA3 context for the production of a SHA3-512 digest of a
+ * message.
+ *
+ * Context: Any context.
+ */
+static inline void sha3_512_init(struct sha3_512_ctx *ctx)
+{
+	*ctx = (struct sha3_512_ctx){
+		.ctx.block_size	= SHA3_512_BLOCK_SIZE,
+		.ctx.padding	= 0x06,
+	};
+}
+
+/**
+ * sha3_512_update() - Update a SHA3-512 hash with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times to add data to the hash, performing
+ * the "keccak sponge absorbing" phase.
+ *
+ * Context: Any context.
+ */
+static inline void sha3_512_update(struct sha3_512_ctx *ctx, const u8 *data, size_t len)
+{
+	return sha3_update(&ctx->ctx, data, len);
+}
+
+/**
+ * sha3_512_final() - Finalise a SHA3-512 hash and extract the digest
+ * @ctx: The context to finalise; must have been initialized
+ * @out: Where to write the resulting message digest
+ *
+ * Finish the computation of a SHA3-512 hash and perform the "Keccak sponge
+ * squeezing" phase.  The digest is written to @out buffer and the context will
+ * be completely zeroed out.
+ *
+ * Context: Any context.
+ */
+static inline void sha3_512_final(struct sha3_512_ctx *ctx, u8 out[SHA3_512_DIGEST_SIZE])
+{
+	sha3_squeeze(&ctx->ctx, out, SHA3_512_DIGEST_SIZE);
+	sha3_clear(&ctx->ctx);
+}
+
+/*
+ * Context wrapper for SHAKE128.
+ */
+struct shake128_ctx {
+	struct sha3_ctx ctx;
+};
+
+/**
+ * shake128_init() - Set a SHA3 context for SHAKE128
+ * @ctx: The context to initialize
+ *
+ * Initialize a SHA3 context for the production of SHAKE128 output generation
+ * from a message.  The sha3_squeeze() function can be used to extract an
+ * arbitrary amount of data from the context.
+ *
+ * Context: Any context.
+ */
+static inline void shake128_init(struct shake128_ctx *ctx)
+{
+	*ctx = (struct shake128_ctx){
+		.ctx.block_size	= SHAKE128_BLOCK_SIZE,
+		.ctx.padding	= 0x1f,
+	};
+}
+
+/**
+ * shake128_update() - Update a SHAKE128 hash with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times to add data to the XOF state,
+ * performing the "keccak sponge absorbing" phase.
+ *
+ * Context: Any context.
+ */
+static inline void shake128_update(struct shake128_ctx *ctx, const u8 *data, size_t len)
+{
+	return sha3_update(&ctx->ctx, data, len);
+}
+
+/**
+ * shake128_squeeze() - Finalize a SHAKE128 digest of any type and extract the digest
+ * @ctx: the context to finalize; must have been initialized
+ * @out: Where to write the resulting message digest
+ * @out_size: The amount of digest to extract to @out in bytes
+ *
+ * Finish the computation of a SHAKE128 XOF and perform the "Keccak sponge
+ * squeezing" phase.  @out_size amount of digest is written to @out buffer.
+ *
+ * This may be called multiple times to extract continuations of the digest.
+ * Note that, a number of consecutive squeezes laid end-to-end will yield the
+ * same output as one big squeeze generating the same total amount of output.
+ *
+ * Context: Any context.
+ */
+static inline void shake128_squeeze(struct shake128_ctx *ctx, u8 *out, size_t out_size)
+{
+	return sha3_squeeze(&ctx->ctx, out, out_size);
+}
+
+/**
+ * shake128_clear() - Explicitly clear the entire SHAKE128 context
+ * @ctx: the context to clear
+ *
+ * Explicitly clear the entire context; after this, the context must be
+ * initialized again.
+ *
+ * Context: Any context.
+ */
+static inline void shake128_clear(struct shake128_ctx *ctx)
+{
+	sha3_clear(&ctx->ctx);
+}
+
+/*
+ * Context wrapper for SHAKE256.
+ */
+struct shake256_ctx {
+	struct sha3_ctx ctx;
+};
+
+/**
+ * shake256_init() - Set a SHA3 context for SHAKE256
+ * @ctx: The context to initialize
+ *
+ * Initialize a SHA3 context for the production of SHAKE256 output generation
+ * from a message.  The sha3_squeeze() function can be used to extract an
+ * arbitrary amount of data from the context.
+ *
+ * Context: Any context.
+ */
+static inline void shake256_init(struct shake256_ctx *ctx)
+{
+	*ctx = (struct shake256_ctx){
+		.ctx.block_size	= SHAKE256_BLOCK_SIZE,
+		.ctx.padding	= 0x1f,
+	};
+}
+
+/**
+ * shake256_update() - Update a SHAKE256 hash with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times to add data to the XOF state,
+ * performing the "keccak sponge absorbing" phase.
+ *
+ * Context: Any context.
+ */
+static inline void shake256_update(struct shake256_ctx *ctx, const u8 *data, size_t len)
+{
+	return sha3_update(&ctx->ctx, data, len);
+}
+
+/**
+ * shake256_squeeze() - Finalize a SHAKE256 digest of any type and extract the digest
+ * @ctx: the context to finalize; must have been initialized
+ * @out: Where to write the resulting message digest
+ * @out_size: The amount of digest to extract to @out in bytes
+ *
+ * Finish the computation of a SHAKE256 XOF and perform the "Keccak sponge
+ * squeezing" phase.  @out_size amount of digest is written to @out buffer.
+ *
+ * This may be called multiple times to extract continuations of the digest.
+ * Note that, a number of consecutive squeezes laid end-to-end will yield the
+ * same output as one big squeeze generating the same total amount of output.
+ *
+ * Context: Any context.
+ */
+static inline void shake256_squeeze(struct shake256_ctx *ctx, u8 *out, size_t out_size)
+{
+	return sha3_squeeze(&ctx->ctx, out, out_size);
+}
+
+/**
+ * shake256_clear() - Explicitly clear the entire SHAKE256 context
+ * @ctx: the context to clear
+ *
+ * Explicitly clear the entire context; after this, the context must be
+ * initialized again.
+ *
+ * Context: Any context.
+ */
+static inline void shake256_clear(struct shake256_ctx *ctx)
+{
+	sha3_clear(&ctx->ctx);
+}
+
+void sha3_224(const u8 *in, size_t in_len, u8 out[SHA3_224_DIGEST_SIZE]);
+void sha3_256(const u8 *in, size_t in_len, u8 out[SHA3_256_DIGEST_SIZE]);
+void sha3_384(const u8 *in, size_t in_len, u8 out[SHA3_384_DIGEST_SIZE]);
+void sha3_512(const u8 *in, size_t in_len, u8 out[SHA3_512_DIGEST_SIZE]);
+void shake128(const u8 *in, size_t in_len, u8 *out, size_t out_len);
+void shake256(const u8 *in, size_t in_len, u8 *out, size_t out_len);
+
+#endif /* __CRYPTO_SHA3_H__ */
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index eea17e36a22b..1caf3fbe24bf 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -184,6 +184,13 @@ config CRYPTO_LIB_SHA512_ARCH
 	default y if SPARC64
 	default y if X86_64
 
+config CRYPTO_LIB_SHA3
+	tristate
+	help
+	  The SHA3 library functions.
+	  Select this if your module uses any of these functions from
+	  <crypto/sha3.h>.
+
 config CRYPTO_LIB_SM3
 	tristate
 
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index bded351aeace..b7fa51bfeebb 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -268,6 +268,12 @@ endif # CONFIG_CRYPTO_LIB_SHA512_ARCH
 
 ################################################################################
 
+#obj-$(CONFIG_CRYPTO_LIB_SHA3) += libsha3.o
+#libsha3-y := sha3.o
+obj-$(CONFIG_CRYPTO_SHA3) += sha3.o
+
+################################################################################
+
 obj-$(CONFIG_MPILIB) += mpi/
 
 obj-$(CONFIG_CRYPTO_SELFTESTS_FULL)		+= simd.o
diff --git a/lib/crypto/sha3.c b/lib/crypto/sha3.c
new file mode 100644
index 000000000000..5f847a5eecdc
--- /dev/null
+++ b/lib/crypto/sha3.c
@@ -0,0 +1,511 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Cryptographic API.
+ *
+ * SHA-3, as specified in
+ * https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.202.pdf
+ *
+ * SHA-3 code by Jeff Garzik <jeff@garzik.org>
+ *               Ard Biesheuvel <ard.biesheuvel@linaro.org>
+ *		 David Howells <dhowells@redhat.com>
+ *
+ * See also Documentation/crypto/sha3.rst
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#include <crypto/sha3.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/unaligned.h>
+
+/*
+ * On some 32-bit architectures, such as h8300, GCC ends up using over 1 KB of
+ * stack if the round calculation gets inlined into the loop in
+ * sha3_keccakf_rounds_generic().  On the other hand, on 64-bit architectures
+ * with plenty of [64-bit wide] general purpose registers, not inlining it
+ * severely hurts performance.  So let's use 64-bitness as a heuristic to
+ * decide whether to inline or not.
+ */
+#ifdef CONFIG_64BIT
+#define SHA3_INLINE	inline
+#else
+#define SHA3_INLINE	noinline
+#endif
+
+#define SHA3_KECCAK_ROUNDS 24
+
+static const u64 sha3_keccakf_rndc[24] = {
+	0x0000000000000001ULL, 0x0000000000008082ULL, 0x800000000000808aULL,
+	0x8000000080008000ULL, 0x000000000000808bULL, 0x0000000080000001ULL,
+	0x8000000080008081ULL, 0x8000000000008009ULL, 0x000000000000008aULL,
+	0x0000000000000088ULL, 0x0000000080008009ULL, 0x000000008000000aULL,
+	0x000000008000808bULL, 0x800000000000008bULL, 0x8000000000008089ULL,
+	0x8000000000008003ULL, 0x8000000000008002ULL, 0x8000000000000080ULL,
+	0x000000000000800aULL, 0x800000008000000aULL, 0x8000000080008081ULL,
+	0x8000000000008080ULL, 0x0000000080000001ULL, 0x8000000080008008ULL
+};
+
+/*
+ * Perform a single round of Keccak mixing.
+ */
+static SHA3_INLINE void sha3_keccakf_one_round_generic(struct sha3_state *state)
+{
+	u64 *st = state->st;
+	u64 t[5], tt, bc[5];
+
+	/* Theta */
+	bc[0] = st[0] ^ st[5] ^ st[10] ^ st[15] ^ st[20];
+	bc[1] = st[1] ^ st[6] ^ st[11] ^ st[16] ^ st[21];
+	bc[2] = st[2] ^ st[7] ^ st[12] ^ st[17] ^ st[22];
+	bc[3] = st[3] ^ st[8] ^ st[13] ^ st[18] ^ st[23];
+	bc[4] = st[4] ^ st[9] ^ st[14] ^ st[19] ^ st[24];
+
+	t[0] = bc[4] ^ rol64(bc[1], 1);
+	t[1] = bc[0] ^ rol64(bc[2], 1);
+	t[2] = bc[1] ^ rol64(bc[3], 1);
+	t[3] = bc[2] ^ rol64(bc[4], 1);
+	t[4] = bc[3] ^ rol64(bc[0], 1);
+
+	st[0] ^= t[0];
+
+	/* Rho Pi */
+	tt = st[1];
+	st[ 1] = rol64(st[ 6] ^ t[1], 44);
+	st[ 6] = rol64(st[ 9] ^ t[4], 20);
+	st[ 9] = rol64(st[22] ^ t[2], 61);
+	st[22] = rol64(st[14] ^ t[4], 39);
+	st[14] = rol64(st[20] ^ t[0], 18);
+	st[20] = rol64(st[ 2] ^ t[2], 62);
+	st[ 2] = rol64(st[12] ^ t[2], 43);
+	st[12] = rol64(st[13] ^ t[3], 25);
+	st[13] = rol64(st[19] ^ t[4],  8);
+	st[19] = rol64(st[23] ^ t[3], 56);
+	st[23] = rol64(st[15] ^ t[0], 41);
+	st[15] = rol64(st[ 4] ^ t[4], 27);
+	st[ 4] = rol64(st[24] ^ t[4], 14);
+	st[24] = rol64(st[21] ^ t[1],  2);
+	st[21] = rol64(st[ 8] ^ t[3], 55);
+	st[ 8] = rol64(st[16] ^ t[1], 45);
+	st[16] = rol64(st[ 5] ^ t[0], 36);
+	st[ 5] = rol64(st[ 3] ^ t[3], 28);
+	st[ 3] = rol64(st[18] ^ t[3], 21);
+	st[18] = rol64(st[17] ^ t[2], 15);
+	st[17] = rol64(st[11] ^ t[1], 10);
+	st[11] = rol64(st[ 7] ^ t[2],  6);
+	st[ 7] = rol64(st[10] ^ t[0],  3);
+	st[10] = rol64(    tt ^ t[1],  1);
+
+	/* Chi */
+	bc[ 0] = ~st[ 1] & st[ 2];
+	bc[ 1] = ~st[ 2] & st[ 3];
+	bc[ 2] = ~st[ 3] & st[ 4];
+	bc[ 3] = ~st[ 4] & st[ 0];
+	bc[ 4] = ~st[ 0] & st[ 1];
+	st[ 0] ^= bc[ 0];
+	st[ 1] ^= bc[ 1];
+	st[ 2] ^= bc[ 2];
+	st[ 3] ^= bc[ 3];
+	st[ 4] ^= bc[ 4];
+
+	bc[ 0] = ~st[ 6] & st[ 7];
+	bc[ 1] = ~st[ 7] & st[ 8];
+	bc[ 2] = ~st[ 8] & st[ 9];
+	bc[ 3] = ~st[ 9] & st[ 5];
+	bc[ 4] = ~st[ 5] & st[ 6];
+	st[ 5] ^= bc[ 0];
+	st[ 6] ^= bc[ 1];
+	st[ 7] ^= bc[ 2];
+	st[ 8] ^= bc[ 3];
+	st[ 9] ^= bc[ 4];
+
+	bc[ 0] = ~st[11] & st[12];
+	bc[ 1] = ~st[12] & st[13];
+	bc[ 2] = ~st[13] & st[14];
+	bc[ 3] = ~st[14] & st[10];
+	bc[ 4] = ~st[10] & st[11];
+	st[10] ^= bc[ 0];
+	st[11] ^= bc[ 1];
+	st[12] ^= bc[ 2];
+	st[13] ^= bc[ 3];
+	st[14] ^= bc[ 4];
+
+	bc[ 0] = ~st[16] & st[17];
+	bc[ 1] = ~st[17] & st[18];
+	bc[ 2] = ~st[18] & st[19];
+	bc[ 3] = ~st[19] & st[15];
+	bc[ 4] = ~st[15] & st[16];
+	st[15] ^= bc[ 0];
+	st[16] ^= bc[ 1];
+	st[17] ^= bc[ 2];
+	st[18] ^= bc[ 3];
+	st[19] ^= bc[ 4];
+
+	bc[ 0] = ~st[21] & st[22];
+	bc[ 1] = ~st[22] & st[23];
+	bc[ 2] = ~st[23] & st[24];
+	bc[ 3] = ~st[24] & st[20];
+	bc[ 4] = ~st[20] & st[21];
+	st[20] ^= bc[ 0];
+	st[21] ^= bc[ 1];
+	st[22] ^= bc[ 2];
+	st[23] ^= bc[ 3];
+	st[24] ^= bc[ 4];
+}
+
+static void sha3_keccakf_rounds_generic(struct sha3_state *state)
+{
+	for (int round = 0; round < SHA3_KECCAK_ROUNDS; round++) {
+		sha3_keccakf_one_round_generic(state);
+		/* Iota */
+		state->st[0] ^= sha3_keccakf_rndc[round];
+	}
+}
+
+/*
+ * Byteswap the state buckets to CPU-endian if we're not on a little-endian
+ * machine for the duration of the Keccak mixing function.  Note that these
+ * loops are no-ops on LE machines and will be optimised away.
+ */
+static void sha3_keccakf_generic(struct sha3_state *state)
+{
+	for (int  i = 0; i < ARRAY_SIZE(state->st); i++)
+		cpu_to_le64s(&state->st[i]);
+
+	sha3_keccakf_rounds_generic(state);
+
+	for (int  i = 0; i < ARRAY_SIZE(state->st); i++)
+		le64_to_cpus(&state->st[i]);
+}
+
+static void sha3_absorb_block_generic(struct sha3_ctx *ctx, const u8 *data)
+{
+	struct sha3_state *state = &ctx->state;
+	size_t bsize = ctx->block_size;
+
+	for (size_t i = 0; i < bsize / 8; i++)
+		state->st[i] ^= get_unaligned((u64 *)(data + 8 * i));
+	sha3_keccakf_generic(state);
+}
+
+/*
+ * Perform rounds of XOR'ing whole blocks of data into the state buffer and
+ * then performing a keccak mix step.
+ */
+static void sha3_absorb_blocks_generic(struct sha3_ctx *ctx,
+				       const u8 *data, size_t nblocks)
+{
+	do {
+		sha3_absorb_block_generic(ctx, data);
+		data += ctx->block_size;
+	} while (--nblocks);
+}
+
+#ifdef CONFIG_CRYPTO_LIB_SHA3_ARCH
+#include "sha3.h" /* $(SRCARCH)/sha3.h */
+#else
+#define sha3_keccakf		sha3_keccakf_generic
+#define sha3_absorb_blocks	sha3_absorb_blocks_generic
+#endif
+
+/*
+ * XOR in partial data that's insufficient to fill a whole block.
+ */
+static void sha3_absorb_xorle(struct sha3_ctx *ctx, const u8 *data,
+			      size_t partial, size_t len)
+{
+	u8 *buf = (u8 *)ctx->state.st;
+
+	buf += partial;
+	for (size_t i = 0; i < len; i++)
+		*buf++ ^= *data++;
+}
+
+/**
+ * sha3_update() - Update a SHA3 context of any type with message data
+ * @ctx: the context to update; must have been initialized
+ * @data: the message data
+ * @len: the data length in bytes
+ *
+ * This can be called any number of times to perform the "keccak sponge
+ * absorbing" phase.
+ *
+ * Context: May use the FPU/Vector unit registers.
+ */
+void sha3_update(struct sha3_ctx *ctx, const u8 *data, size_t len)
+{
+	size_t absorb_offset = ctx->absorb_offset;
+	size_t bsize = ctx->block_size;
+
+	WARN_ON_ONCE(ctx->end_marked);
+
+	if (absorb_offset && absorb_offset + len >= bsize) {
+		sha3_absorb_xorle(ctx, data, absorb_offset, bsize - absorb_offset);
+		len  -= bsize - absorb_offset;
+		data += bsize - absorb_offset;
+		sha3_keccakf(&ctx->state);
+		ctx->absorb_offset = 0;
+	}
+
+	if (len >= bsize) {
+		size_t nblocks = len / bsize;
+
+		sha3_absorb_blocks(ctx, data, nblocks);
+		data += nblocks * bsize;
+		len  -= nblocks * bsize;
+	}
+
+	if (len) {
+		sha3_absorb_xorle(ctx, data, ctx->absorb_offset, len);
+		ctx->absorb_offset += len;
+	}
+}
+EXPORT_SYMBOL_GPL(sha3_update);
+
+/**
+ * sha3_squeeze() - Finalize a SHA3 digest of any type and extract the digest
+ * @ctx: the context to finalize; must have been initialized
+ * @out: Where to write the resulting message digest
+ * @out_size: The amount of digest to extract to @out
+ *
+ * Finish the computation of a SHA3 message digest of any type and perform the
+ * "Keccak sponge squeezing" phase.  @out_size amount of digest is written to
+ * @out buffer.
+ *
+ * This may be called multiple times to extract continuations of the digest.
+ * Note that, for example, two consecutive 16-byte squeezes laid end-to-end
+ * will yield the same as one 32-byte squeeze.
+ *
+ * Context: May use the FPU/Vector unit registers.
+ */
+void sha3_squeeze(struct sha3_ctx *ctx, u8 *out, size_t out_size)
+{
+	size_t squeeze_offset = ctx->squeeze_offset;
+	size_t bsize = ctx->block_size;
+	u8 *p = (u8 *)ctx->state.st, end_marker = 0x80;
+
+	if (!ctx->end_marked) {
+		sha3_absorb_xorle(ctx, &ctx->padding, ctx->absorb_offset, 1);
+		sha3_absorb_xorle(ctx, &end_marker, bsize - 1, 1);
+		ctx->end_marked = true;
+	}
+
+	for (;;) {
+		if (squeeze_offset == 0)
+			sha3_keccakf(&ctx->state);
+
+		size_t part = umin(out_size, bsize - squeeze_offset);
+
+		if (part > 0) {
+			memcpy(out, p + squeeze_offset, part);
+			out_size -= part;
+			out += part;
+			squeeze_offset += part;
+		}
+		if (!out_size)
+			break;
+		if (squeeze_offset >= bsize)
+			squeeze_offset = 0;
+	}
+
+	ctx->squeeze_offset = squeeze_offset;
+}
+EXPORT_SYMBOL_GPL(sha3_squeeze);
+
+/**
+ * sha3_224() - Convenience wrapper to digest a simple buffer as SHA3-224
+ * @in: The data to be digested
+ * @in_len: The amount of data to be digested in bytes
+ * @out: The buffer into which the digest will be stored (size not checked)
+ *
+ * Convenience wrapper to initialise a SHA3 context for SHA-224, add the input
+ * data to it, finalise it, extract 28 bytes of digest and clear the context.
+ *
+ * Context: May use the FPU/Vector unit registers.
+ */
+void sha3_224(const u8 *in, size_t in_len, u8 out[SHA3_224_DIGEST_SIZE])
+{
+	struct sha3_224_ctx ctx;
+
+	sha3_224_init(&ctx);
+	sha3_224_update(&ctx, in, in_len);
+	sha3_224_final(&ctx, out);
+}
+EXPORT_SYMBOL(sha3_224);
+
+/**
+ * sha3_256() - Convenience wrapper to digest a simple buffer as SHA3-256
+ * @in: The data to be digested
+ * @in_len: The amount of data to be digested in bytes
+ * @out: The buffer into which the digest will be stored (size not checked)
+ *
+ * Convenience wrapper to initialise a SHA3 context for SHA-256, add the input
+ * data to it, finalise it, extract 32 bytes of digest and clear the context.
+ *
+ * Context: May use the FPU/Vector unit registers.
+ */
+void sha3_256(const u8 *in, size_t in_len, u8 out[SHA3_256_DIGEST_SIZE])
+{
+	struct sha3_256_ctx ctx;
+
+	sha3_256_init(&ctx);
+	sha3_256_update(&ctx, in, in_len);
+	sha3_256_final(&ctx, out);
+}
+EXPORT_SYMBOL(sha3_256);
+
+/**
+ * sha3_384() - Convenience wrapper to digest a simple buffer as SHA3-384
+ * @in: The data to be digested
+ * @in_len: The amount of data to be digested in bytes
+ * @out: The buffer into which the digest will be stored (size not checked)
+ *
+ * Convenience wrapper to initialise a SHA3 context for SHA-384, add the input
+ * data to it, finalise it, extract 48 bytes of digest and clear the context.
+ *
+ * Context: May use the FPU/Vector unit registers.
+ */
+void sha3_384(const u8 *in, size_t in_len, u8 out[SHA3_384_DIGEST_SIZE])
+{
+	struct sha3_384_ctx ctx;
+
+	sha3_384_init(&ctx);
+	sha3_384_update(&ctx, in, in_len);
+	sha3_384_final(&ctx, out);
+}
+EXPORT_SYMBOL(sha3_384);
+
+/**
+ * sha3_512() - Convenience wrapper to digest a simple buffer as SHA3-512
+ * @in: The data to be digested in bytes
+ * @in_len: The amount of data to be digested in bytes
+ * @out: The buffer into which the digest will be stored (size not checked)
+ *
+ * Convenience wrapper to initialise a SHA3 context for SHA-512, add the input
+ * data to it, finalise it, extract 64 bytes of digest and clear the context.
+ *
+ * Context: May use the FPU/Vector unit registers.
+ */
+void sha3_512(const u8 *in, size_t in_len, u8 out[SHA3_512_DIGEST_SIZE])
+{
+	struct sha3_512_ctx ctx;
+
+	sha3_512_init(&ctx);
+	sha3_512_update(&ctx, in, in_len);
+	sha3_512_final(&ctx, out);
+}
+EXPORT_SYMBOL(sha3_512);
+
+/**
+ * shake128() - Convenience wrapper to apply SHAKE128 to a simple buffer
+ * @in: The input data to be used
+ * @in_len: The amount of input data in bytes
+ * @out: The buffer in which to store the output
+ * @out_len: The amount of output to store in bytes (variable length)
+ *
+ * Convenience wrapper to initialise a SHA3 context for SHAKE128, add the input
+ * data to it, finalise it, extract the requested amount of output and clear
+ * the context.
+ *
+ * Context: May use the FPU/Vector unit registers.
+ */
+void shake128(const u8 *in, size_t in_len, u8 *out, size_t out_len)
+{
+	struct shake128_ctx ctx;
+
+	shake128_init(&ctx);
+	shake128_update(&ctx, in, in_len);
+	shake128_squeeze(&ctx, out, out_len);
+	shake128_clear(&ctx);
+}
+EXPORT_SYMBOL(shake128);
+
+/**
+ * shake256() - Convenience wrapper to apply SHAKE256 to a simple buffer
+ * @in: The input data to be used
+ * @in_len: The amount of input data in bytes
+ * @out: The buffer in which to store the output
+ * @out_len: The amount of output to store in bytes (variable length)
+ *
+ * Convenience wrapper to initialise a SHA3 context for SHAKE128, add the input
+ * data to it, finalise it, extract the requested amount of output and clear
+ * the context.
+ *
+ * Context: May use the FPU/Vector unit registers.
+ */
+void shake256(const u8 *in, size_t in_len, u8 *out, size_t out_len)
+{
+	struct shake256_ctx ctx;
+
+	shake256_init(&ctx);
+	shake256_update(&ctx, in, in_len);
+	shake256_squeeze(&ctx, out, out_len);
+	shake256_clear(&ctx);
+}
+EXPORT_SYMBOL(shake256);
+
+/*
+ * Do a quick test using SHAKE256 and a 200 byte digest.
+ */
+static const u8 sha3_sample[] __initconst =
+	"The quick red fox jumped over the lazy brown dog!\n"
+	"The quick red fox jumped over the lazy brown dog!\n"
+	"The quick red fox jumped over the lazy brown dog!\n"
+	"The quick red fox jumped over the lazy brown dog!\n";
+
+static const u8 sha3_sample_shake256_200[] __initconst = {
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guard */
+	0xab, 0x06, 0xd4, 0xf9, 0x8b, 0xfd, 0xb2, 0xc4, 0xfe, 0xf1, 0xcc, 0xe2,
+	0x40, 0x45, 0xdd, 0x15, 0xcb, 0xdd, 0x02, 0x8d, 0xb7, 0x9f, 0x1e, 0x67,
+	0xd6, 0x7f, 0x98, 0x5e, 0x1b, 0x19, 0xf8, 0x01, 0x43, 0x82, 0xcb, 0xd8,
+	0x5d, 0x21, 0x64, 0xa8, 0x80, 0xc9, 0x22, 0xe5, 0x07, 0xaf, 0xe2, 0x5d,
+	0xcd, 0xc6, 0x23, 0x36, 0x2b, 0xc7, 0xc7, 0x7d, 0x09, 0x9d, 0x68, 0x05,
+	0xe4, 0x62, 0x63, 0x1b, 0x67, 0xbc, 0xf8, 0x95, 0x07, 0xd2, 0xe4, 0xd0,
+	0xba, 0xa2, 0x67, 0xf5, 0xe3, 0x15, 0xbc, 0x85, 0xa1, 0x50, 0xd6, 0x6f,
+	0x6f, 0xd4, 0x54, 0x4c, 0x3f, 0x4f, 0xe5, 0x1f, 0xb7, 0x00, 0x27, 0xfc,
+	0x15, 0x33, 0xc2, 0xf9, 0xb3, 0x4b, 0x9e, 0x81, 0xe5, 0x96, 0xbe, 0x05,
+	0x6c, 0xac, 0xf9, 0x9f, 0x65, 0x36, 0xbb, 0x11, 0x47, 0x6d, 0xf6, 0x8f,
+	0x9f, 0xa2, 0x77, 0x37, 0x3b, 0x18, 0x77, 0xcf, 0x65, 0xc5, 0xa1, 0x7e,
+	0x2c, 0x0e, 0x71, 0xf0, 0x4d, 0x18, 0x67, 0xb9, 0xc4, 0x8c, 0x64, 0x3b,
+	0x4b, 0x45, 0xea, 0x16, 0xb2, 0x4a, 0xc5, 0xf5, 0x85, 0xdc, 0xd2, 0xd9,
+	0x13, 0x77, 0xb3, 0x19, 0xd9, 0x8c, 0x9f, 0x28, 0xe7, 0x64, 0x91, 0x0f,
+	0x6f, 0x32, 0xbf, 0xa8, 0xa8, 0xa3, 0xff, 0x99, 0x0e, 0x0b, 0x62, 0x50,
+	0xf8, 0x3a, 0xc2, 0xf5, 0x98, 0x21, 0xeb, 0x9d, 0xe8, 0x45, 0xf4, 0x46,
+	0x1e, 0x8b, 0xbd, 0x10, 0x59, 0x2c, 0x87, 0xe2,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard */
+};
+
+static int __init sha3_mod_init(void)
+{
+#define out_len 200
+	u8 out[8 + out_len + 8] = {};
+
+#ifdef sha3_mod_init_arch
+	sha3_mod_init_arch();
+#endif
+
+	BUILD_BUG_ON(sizeof(out) != sizeof(sha3_sample_shake256_200));
+
+	shake256(sha3_sample, sizeof(sha3_sample) - 1, out + 8, out_len);
+
+	if (memcmp(out, sha3_sample_shake256_200,
+		   sizeof(sha3_sample_shake256_200)) != 0) {
+		pr_err("SHAKE256(200) failed\n");
+		for (size_t i = 0; i < out_len;) {
+			size_t part = min(out_len - i, 32);
+
+			pr_err("%*phN\n", (int)part, out + i);
+			i += part;
+		}
+		return -EBADMSG;
+	}
+	return 0;
+}
+subsys_initcall(sha3_mod_init);
+
+static void __exit sha3_mod_exit(void)
+{
+}
+module_exit(sha3_mod_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("SHA-3 Secure Hash Algorithm");


