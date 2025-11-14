Return-Path: <keyrings+bounces-3355-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 31328C5D46B
	for <lists+keyrings@lfdr.de>; Fri, 14 Nov 2025 14:13:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B286C4E81BC
	for <lists+keyrings@lfdr.de>; Fri, 14 Nov 2025 13:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D143101A2;
	Fri, 14 Nov 2025 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OBNbyIhL"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB24B246798
	for <keyrings@vger.kernel.org>; Fri, 14 Nov 2025 13:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763125604; cv=none; b=QK/fdDFMPg2yhEk81PgRaKMyjA2MYCxOVZBlXL+MX1huHGvJX7EBscOHB84sG+a/sMGnUgfkPpWXmoyA4WA9GE7zVAo/Wk1FNGZlo32JD25ysLq6Ef6nhJ6+hLNlUaGFDFs8LCBx0XiO3EEVF+/9ZytaoVSUUcMGyeHOTdKBDPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763125604; c=relaxed/simple;
	bh=ArMQWvAghMmC2nm8PLAR8JM24q7T9Dcg92z+GgExWLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tos9Rad49E/vS7L0FrfO7wSX2PD9et1jGvPjwom0o1mLNBT4n+rPEkD6aYHLJFg7UGj4U60bBQNhLITIm5fN5josRqoarNYKFhPpV7pHRYiXNbCMG/fwqzxxgkbccW6YwZv/I5Uq1/DMu7SfhayYJ9/sMNy2A3I0IeMoIpRaN1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OBNbyIhL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763125601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+8aPWeACCL8i48F0dUYydfTUGTRPPCX2o+rE9TbKE+0=;
	b=OBNbyIhLC9fM6kRHa65qOV/o3OAt9uDPZNAvRys9rHLsJaCzd6l8fFN6DOQ3F/Kdk03JZU
	N42XELnOMFXp0C9fHnfMOXfMWSwIWjk8luPySEPc7ZBS4ilC8I4U8kl/NN9Fl7EZfMYUwh
	9xfgrOyhHj9HZ9U5G6HTWzljWUKWODc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-518-s8ZNyQ4ZOVme53G_R_3tfg-1; Fri,
 14 Nov 2025 08:04:49 -0500
X-MC-Unique: s8ZNyQ4ZOVme53G_R_3tfg-1
X-Mimecast-MFC-AGG-ID: s8ZNyQ4ZOVme53G_R_3tfg_1763125486
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 069C319560B7;
	Fri, 14 Nov 2025 13:04:46 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.87])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1312F1955F1B;
	Fri, 14 Nov 2025 13:04:41 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David Howells <dhowells@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 3/9] mldsa: Add a simpler API
Date: Fri, 14 Nov 2025 13:04:06 +0000
Message-ID: <20251114130417.1756230-4-dhowells@redhat.com>
In-Reply-To: <20251114130417.1756230-1-dhowells@redhat.com>
References: <20251114130417.1756230-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add a simpler ML-DSA API to hide all the details of packing/unpacking keys
and signatures.

Signed-off-by: David Howells <dhowells@redhat.com>
---
 Documentation/crypto/index.rst  |   1 +
 Documentation/crypto/mldsa.rst  | 111 +++++++++++++++++++
 include/crypto/mldsa.h          |  34 ++++++
 lib/crypto/mldsa/Makefile       |   3 +-
 lib/crypto/mldsa/crypto_mldsa.c |   4 +-
 lib/crypto/mldsa/mldsa_api.c    | 186 ++++++++++++++++++++++++++++++++
 6 files changed, 335 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/crypto/mldsa.rst
 create mode 100644 include/crypto/mldsa.h
 create mode 100644 lib/crypto/mldsa/mldsa_api.c

diff --git a/Documentation/crypto/index.rst b/Documentation/crypto/index.rst
index 4ee667c446f9..4498fc92bfc5 100644
--- a/Documentation/crypto/index.rst
+++ b/Documentation/crypto/index.rst
@@ -28,3 +28,4 @@ for cryptographic use cases, as well as programming examples.
    device_drivers/index
    krb5
    sha3
+   mldsa
diff --git a/Documentation/crypto/mldsa.rst b/Documentation/crypto/mldsa.rst
new file mode 100644
index 000000000000..3dcf9c0f1203
--- /dev/null
+++ b/Documentation/crypto/mldsa.rst
@@ -0,0 +1,111 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+===========================
+ML-DSA Algorithm Collection
+===========================
+
+.. contents::
+
+   - Overview
+   - Library API
+   - References
+   - API Function Reference
+
+
+Overview
+========
+
+The ML-DSA algorithm, as specified in NIST FIPS-204 [1]_, is a "Post Quantum"
+asymmetric cipher/public key algorithm.  It has digestion of the message to be
+signed built in to the algorithm, though options exist to do that separately
+(those aren't supported in the API presented here, however).  The algorithm
+used to digest the message in this implementation is SHAKE256, though in theory
+other algorithms can be used too.
+
+This implementation only supports signature verification and does not support
+keypair generation or signing.
+
+Three strengths are provided:
+
+ - ML-DSA 44
+ - ML-DSA 65
+ - ML-DSA 87
+
+This document describes the ML-DSA library API.
+
+The algorithms are also available through the crypto_sig API, though
+`-EOPNOTSUPP` will be returned if any of the API functions involved in signing
+a message are invoked.
+
+
+Library API
+===========
+
+To use this::
+
+	#include <crypto/mldsa.h>
+
+must be included.
+
+To perform single-step verification of a signature, the following function can
+be used::
+
+	int mldsa_verify(enum mldsa_type type,
+			 const void *pk, size_t pk_len,
+			 const uint8_t *data, size_t data_len,
+			 const void *sig, size_t sig_len);
+
+This takes an optional key type, public key, signature and the complete message
+as a single buffer.  The type should be one of::
+
+	MLDSA_UNKNOWN
+	MLDSA_44
+	MLDSA_65
+	MLDSA_87
+
+It returns `-EINVAL` if the specified type (if known), the public key type and
+signature type don't all match.  It return `-EBADMSG` if the computed signature
+doesn't match the supplied one.
+
+If, however, the message to be verified is split into multiple fragments, then
+the multi-step API must be used.  Firstly, a context must be allocated::
+
+	struct mldsa_ctx *mldsa_ctx_alloc(enum mldsa_type type);
+
+this is type-specific as the size of the allocated state may vary by type.
+Then data can be added to the internal hash::
+
+	int mldsa_verify_update(struct mldsa_ctx *ctx,
+				const void *data, size_t data_len);
+
+And finally the signature verification can be performed::
+
+	int mldsa_verify_final(struct mldsa_ctx *ctx,
+			       const void *pk, size_t pk_len,
+			       const void *sig, size_t sig_len);
+
+This returns `-EINVAL` if the specified type (if known), the public key type
+and signature type don't all match.  It return `-EBADMSG` if the computed
+signature doesn't match the supplied one.
+
+The context can be reset and used again (provided it's for a key of the same
+type)::
+
+	void mldsa_ctx_zeroize(struct mldsa_ctx *ctx);
+
+And finally, it can be freed::
+
+	void mldsa_ctx_free(struct mldsa_ctx *ctx);
+
+
+References
+==========
+
+.. [1] https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.204.pdf
+
+
+API Function Reference
+======================
+
+.. kernel-doc:: include/crypto/mldsa.h
+.. kernel-doc:: lib/crypto/mldsa/mldsa_api.c
diff --git a/include/crypto/mldsa.h b/include/crypto/mldsa.h
new file mode 100644
index 000000000000..e7aac97ac6fd
--- /dev/null
+++ b/include/crypto/mldsa.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause */
+/* Simple API for ML-DSA.
+ *
+ * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ *
+ * See also Documentation/crypto/mldsa.rst
+ */
+
+#ifndef _CRYPTO_MLDSA_H
+#define _CRYPTO_MLDSA_H
+
+struct mldsa_ctx;
+
+enum mldsa_type {
+	MLDSA_UNKNOWN,	/* Unknown key type */
+	MLDSA_87,	/* ML-DSA 87 */
+	MLDSA_65,	/* ML-DSA 65 */
+	MLDSA_44,	/* ML-DSA 44 */
+};
+
+int mldsa_verify(enum mldsa_type type,
+		 const void *pk, size_t pk_len,
+		 const uint8_t *data, size_t data_len,
+		 const void *sig, size_t sig_len);
+struct mldsa_ctx *mldsa_ctx_alloc(enum mldsa_type type);
+int mldsa_verify_update(struct mldsa_ctx *ctx, const void *data, size_t data_len);
+int mldsa_verify_final(struct mldsa_ctx *ctx,
+		       const void *pk, size_t pk_len,
+		       const void *sig, size_t sig_len);
+void mldsa_ctx_zeroize(struct mldsa_ctx *ctx);
+void mldsa_ctx_free(struct mldsa_ctx *ctx);
+
+#endif /* _CRYPTO_MLDSA_H */
diff --git a/lib/crypto/mldsa/Makefile b/lib/crypto/mldsa/Makefile
index e24bc2b57b8d..75e260615d4a 100644
--- a/lib/crypto/mldsa/Makefile
+++ b/lib/crypto/mldsa/Makefile
@@ -4,7 +4,8 @@ mldsa-y += \
 	signature_domain_separation.o \
 	dilithium_api.o \
 	dilithium_zetas.o \
-	dilithium_signature_helper.o
+	dilithium_signature_helper.o \
+	mldsa_api.o
 
 mldsa-$(CONFIG_CRYPTO_LIB_MLDSA_87) += dilithium_87.o
 mldsa-$(CONFIG_CRYPTO_LIB_MLDSA_65) += dilithium_65.o
diff --git a/lib/crypto/mldsa/crypto_mldsa.c b/lib/crypto/mldsa/crypto_mldsa.c
index 26cafeae6f0f..91350a828d94 100644
--- a/lib/crypto/mldsa/crypto_mldsa.c
+++ b/lib/crypto/mldsa/crypto_mldsa.c
@@ -28,9 +28,7 @@ enum dilithium_kernel_key_type {
 };
 
 struct dilithium_kernel_ctx {
-	union {
-		struct dilithium_pk pk;
-	};
+	struct dilithium_pk pk;
 	enum dilithium_kernel_key_type key_type;
 };
 
diff --git a/lib/crypto/mldsa/mldsa_api.c b/lib/crypto/mldsa/mldsa_api.c
new file mode 100644
index 000000000000..6925c5b0d6ee
--- /dev/null
+++ b/lib/crypto/mldsa/mldsa_api.c
@@ -0,0 +1,186 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
+/* Simple API for ML-DSA.
+ *
+ * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ *
+ * See also Documentation/crypto/mldsa.rst
+ */
+
+#include <linux/init.h>
+#include <linux/module.h>
+#include <crypto/mldsa.h>
+#include "dilithium.h"
+
+struct mldsa_ctx {
+	struct dilithium_pk pk;
+	struct dilithium_sig sig;
+	struct dilithium_ctx *dilithium;
+	enum dilithium_type type;
+};
+
+/**
+ * mldsa_verify - All-in-one ML-DSA signature verification
+ * @type: Type of ML-DSA key
+ * @pk: Pointer to public key
+ * @pk_len: Length of public key
+ * @data: Pointer to signed data
+ * @data_len: Length of signed data
+ * @sig: Pointer to signature
+ * @sig_len: Length of signature
+ *
+ * Perform all the steps needed to verify an ML-DSA signature in one go.  Only
+ * one data buffer may be provided.  For multifragment messages, the
+ * alloc/update/final interface must be used instead.
+ *
+ * Return: 0 if signature could be verified correctly, -EBADMSG when signature
+ * cannot be verified and < 0 on other errors.
+ */
+int mldsa_verify(enum mldsa_type type,
+		 const void *pk, size_t pk_len,
+		 const uint8_t *data, size_t data_len,
+		 const void *sig, size_t sig_len)
+{
+	struct mldsa_ctx *ctx;
+	int ret;
+
+	BUILD_BUG_ON((int)MLDSA_UNKNOWN != DILITHIUM_UNKNOWN ||
+		     (int)MLDSA_44 != DILITHIUM_44 ||
+		     (int)MLDSA_65 != DILITHIUM_65 ||
+		     (int)MLDSA_87 != DILITHIUM_87);
+
+	ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ret = dilithium_pk_load(&ctx->pk, pk, pk_len);
+	if (ret < 0)
+		goto out;
+	ret = dilithium_sig_load(&ctx->sig, sig, sig_len);
+	if (ret < 0)
+		goto out;
+
+	ret = -EINVAL;
+	if (type != MLDSA_UNKNOWN && (int)type != ctx->pk.dilithium_type)
+		goto out;
+
+	ret = dilithium_verify(&ctx->sig, data, data_len, &ctx->pk);
+out:
+	kfree_sensitive(ctx);
+	return ret;
+}
+EXPORT_SYMBOL(mldsa_verify);
+
+/**
+ * mldsa_ctx_alloc - Allocate ML-DSA context
+ * @type: The type of ML-DSA involved.
+ *
+ * Return: Pointer to the allocated context or error code on failure.
+ *
+ * Context: Process context.  May sleep to allocate memory.
+ */
+struct mldsa_ctx *mldsa_ctx_alloc(enum mldsa_type type)
+{
+	struct mldsa_ctx *ctx;
+
+	if (type == MLDSA_UNKNOWN)
+		return ERR_PTR(-EINVAL);
+
+	ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
+	ctx->type = (int)type;
+	ctx->dilithium = dilithium_ctx_alloc_ahat(ctx->type);
+	if (!ctx->dilithium) {
+		kfree(ctx);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	return ctx;
+}
+EXPORT_SYMBOL(mldsa_ctx_alloc);
+
+/**
+ * mldsa_verify_update - Add more data to an already initialized context
+ * @ctx: Pointer to an allocated ML-DSA context
+ * @data: Pointer to signed data
+ * @data_len: Length of signed data
+ *
+ * Add more signed data to the state in an allocated context.  This can be use
+ * to provide data that is split into multiple fragments.
+ *
+ * Return: 0 (success) or < 0 on error
+ *
+ * Context: Process context.  May sleep to allocate memory.
+ */
+int mldsa_verify_update(struct mldsa_ctx *ctx, const void *data, size_t data_len)
+{
+	return dilithium_verify_update(ctx->dilithium, data, data_len);
+}
+EXPORT_SYMBOL(mldsa_verify_update);
+
+/**
+ * mldsa_verify_final - Perform signature verification
+ * @ctx: Pointer to an allocated and updated ML-DSA context
+ * @pk: Pointer to public key
+ * @pk_len: Length of public key
+ * @sig: Pointer to signature
+ * @sig_len: Length of signature
+ *
+ * Finalise the state in the ML-DSA context and verify the signature.  The
+ * caller must have allocated it and updated it with all the pieces of data.
+ * Note that this does not free the context, but does reset it.
+ *
+ * Return: 0 if signature could be verified correctly, -EBADMSG when the
+ * signature cannot be verified and < 0 on other errors.
+ *
+ * Context: Process context.  May sleep to allocate memory.
+ */
+int mldsa_verify_final(struct mldsa_ctx *ctx,
+		       const void *pk, size_t pk_len,
+		       const void *sig, size_t sig_len)
+{
+	int ret;
+
+	ret = dilithium_pk_load(&ctx->pk, pk, pk_len);
+	if (ret < 0)
+		return ret;
+	ret = dilithium_sig_load(&ctx->sig, sig, sig_len);
+	if (ret < 0)
+		return ret;
+	if (ctx->type != ctx->pk.dilithium_type)
+		return -EINVAL;
+
+	ret = dilithium_verify_final(&ctx->sig, ctx->dilithium, &ctx->pk);
+	dilithium_ctx_zero(ctx->dilithium);
+	return ret;
+}
+EXPORT_SYMBOL(mldsa_verify_final);
+
+/**
+ * mldsa_ctx_zeroize - Resets an ML-DSA context
+ * @ctx: Context pointer
+ *
+ * Context: Any context.
+ */
+void mldsa_ctx_zeroize(struct mldsa_ctx *ctx)
+{
+	dilithium_ctx_zero(ctx->dilithium);
+	memset(&ctx->pk, 0, sizeof(ctx->pk));
+	memset(&ctx->sig, 0, sizeof(ctx->sig));
+}
+EXPORT_SYMBOL(mldsa_ctx_zeroize);
+
+/**
+ * mldsa_ctx_free - Clears and frees an ML-DSA context.
+ * @ctx: Context pointer
+ *
+ * Context: Any context.
+ */
+void mldsa_ctx_free(struct mldsa_ctx *ctx)
+{
+	dilithium_ctx_zero_free(ctx->dilithium);
+	kfree(ctx);
+}
+EXPORT_SYMBOL(mldsa_ctx_free);


