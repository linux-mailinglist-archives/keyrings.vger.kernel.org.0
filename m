Return-Path: <keyrings+bounces-3359-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 53509C64C3A
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 16:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 38BE834E039
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 14:57:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB4B3358B5;
	Mon, 17 Nov 2025 14:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IqmdXW0C"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA185332EC4
	for <keyrings@vger.kernel.org>; Mon, 17 Nov 2025 14:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391403; cv=none; b=NQPDVxvNDwoqmTIsJfZfPNDOYuEnrDs9tCQELTaCdyKKeb1gahTFBMgBHp6vmprWYxELKRKNKXS9fBVuzgBMhw+sRHVujvpHBmfOJ2yRZ7IeiN+bDQQlAi6nIFnT8rTaFksZdPZzE2evNgBeb4GuGMKN7PpOgDyq+8EhhB0NDnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391403; c=relaxed/simple;
	bh=ja2b8bU+sXp3qZTcml3ZDezlx/4vpUJgXGHKe1gSQkk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YHi3FRK2ayk+3T8hdXWdg5pPaf9FnFEm6kgZJwRXsH0JB5bZuyK5g1aTNiG1ewJTSc80kRtjg+0bgAAI7yx/J9AG1n4h8IMH+qCkgUQJdKXuZ7R89PKxSrdn65fugILpbU6hxDy5FmuiRc9YWbSVrNqUGQ4XXe6BdifN7afKnDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IqmdXW0C; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763391400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jT1M8WvX57AumohPjIY2ihx7JO9kCliMtgeaiwX6QQM=;
	b=IqmdXW0CSq5XTtKxjCb5mmdHK2w99tUelgyBHEX+aNRc5MIUtS5fDgZ5NhLq6p+aMeD195
	YhLV26JI0BweFiFwEyF30VmPOEAhjq5hMKOrfc3THJMXhjPusfumvpZ7fCovzWIO1WCCYT
	FsAvtjIOKnmLuk0nMLDHGHvhz2pvfNg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-193-eunhGJ2GMyCW_X6J9WjpfQ-1; Mon,
 17 Nov 2025 09:56:36 -0500
X-MC-Unique: eunhGJ2GMyCW_X6J9WjpfQ-1
X-Mimecast-MFC-AGG-ID: eunhGJ2GMyCW_X6J9WjpfQ_1763391394
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 03B791800452;
	Mon, 17 Nov 2025 14:56:34 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.5])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C2C8A18004A3;
	Mon, 17 Nov 2025 14:56:29 +0000 (UTC)
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
Subject: [PATCH v9 3/9] mldsa: Add a simpler API
Date: Mon, 17 Nov 2025 14:55:52 +0000
Message-ID: <20251117145606.2155773-4-dhowells@redhat.com>
In-Reply-To: <20251117145606.2155773-1-dhowells@redhat.com>
References: <20251117145606.2155773-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Add a simpler ML-DSA API to hide all the details of packing/unpacking keys
and signatures.

Signed-off-by: David Howells <dhowells@redhat.com>
---
 Documentation/crypto/index.rst    |   1 +
 Documentation/crypto/mldsa.rst    | 143 +++++++++++++++++++++++++
 include/crypto/mldsa.h            |  50 +++++++++
 lib/crypto/mldsa/dilithium_44.c   |   1 +
 lib/crypto/mldsa/dilithium_65.c   |   1 +
 lib/crypto/mldsa/dilithium_87.c   |   1 +
 lib/crypto/mldsa/dilithium_type.h |  13 +++
 lib/crypto/mldsa/mldsa_api.c      | 168 ++++++++++++++++++++++++++++++
 8 files changed, 378 insertions(+)
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
index 000000000000..dda5d42bfae9
--- /dev/null
+++ b/Documentation/crypto/mldsa.rst
@@ -0,0 +1,143 @@
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
+This document describes the ML-DSA library API.  Each strength has its own API
+and would be built as a separate module if not built in.  There is also a
+common module for shared pieces.
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
+[Note for anyone looking for the following functions in the code!  These
+functions are created by preprocessor templating and should be looked for
+without the strength in the name.]
+
+To perform single-step verification of a signature, one of the following
+functions can be used::
+
+	int mldsa_44_verify(const void *pk, size_t pk_len,
+			    const uint8_t *data, size_t data_len,
+			    const void *sig, size_t sig_len);
+
+	int mldsa_65_verify(const void *pk, size_t pk_len,
+			    const uint8_t *data, size_t data_len,
+			    const void *sig, size_t sig_len);
+
+	int mldsa_87_verify(const void *pk, size_t pk_len,
+			    const uint8_t *data, size_t data_len,
+			    const void *sig, size_t sig_len);
+
+They take the public key, signature and the complete message as a single
+buffer.  They return `-EINVAL` the public key type and/or signature size are
+incorrect.  They return `-EBADMSG` if the computed signature doesn't match the
+supplied one.
+
+If, however, the message to be verified is split into multiple fragments, then
+the multi-step API must be used.  Firstly, a context must be allocated::
+
+	struct mldsa_44_ctx *mldsa_ctx_alloc(void);
+
+	struct mldsa_65_ctx *mldsa_ctx_alloc(void);
+
+	struct mldsa_87_ctx *mldsa_ctx_alloc(void);
+
+This is type-specific as the size of the allocated state may vary by strength.
+Then data can be added to the internal hash::
+
+	int mldsa_44_verify_update(struct mldsa_44_ctx *ctx,
+				   const void *data, size_t data_len);
+
+	int mldsa_65_verify_update(struct mldsa_65_ctx *ctx,
+				   const void *data, size_t data_len);
+
+	int mldsa_87_verify_update(struct mldsa_87_ctx *ctx,
+				   const void *data, size_t data_len);
+
+And finally the signature verification can be performed::
+
+	int mldsa_44_verify_final(struct mldsa_44_ctx *ctx,
+				  const void *pk, size_t pk_len,
+				  const void *sig, size_t sig_len);
+
+	int mldsa_65_verify_final(struct mldsa_65_ctx *ctx,
+				  const void *pk, size_t pk_len,
+				  const void *sig, size_t sig_len);
+
+	int mldsa_87_verify_final(struct mldsa_87_ctx *ctx,
+				  const void *pk, size_t pk_len,
+				  const void *sig, size_t sig_len);
+
+These return `-EINVAL` if the specified type (if known), the public key type
+and signature type don't all match.  It return `-EBADMSG` if the computed
+signature doesn't match the supplied one.
+
+The context can be reset and used again (provided it's for a key of the same
+type)::
+
+	void mldsa_44_ctx_zeroize(struct mldsa_44_ctx *ctx);
+
+	void mldsa_65_ctx_zeroize(struct mldsa_65_ctx *ctx);
+
+	void mldsa_87_ctx_zeroize(struct mldsa_87_ctx *ctx);
+
+And finally, it can be freed::
+
+	void mldsa_44_ctx_free(struct mldsa_44_ctx *ctx);
+
+	void mldsa_65_ctx_free(struct mldsa_65_ctx *ctx);
+
+	void mldsa_87_ctx_free(struct mldsa_87_ctx *ctx);
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
index 000000000000..f105f23b66b0
--- /dev/null
+++ b/include/crypto/mldsa.h
@@ -0,0 +1,50 @@
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
+struct mldsa_44_ctx;
+struct mldsa_65_ctx;
+struct mldsa_87_ctx;
+
+int mldsa_44_verify(const void *pk, size_t pk_len,
+		    const uint8_t *data, size_t data_len,
+		    const void *sig, size_t sig_len);
+struct mldsa_44_ctx *mldsa_44_ctx_alloc(void);
+int mldsa_44_verify_update(struct mldsa_44_ctx *ctx, const void *data, size_t data_len);
+int mldsa_44_verify_final(struct mldsa_44_ctx *ctx,
+			  const void *pk, size_t pk_len,
+			  const void *sig, size_t sig_len);
+void mldsa_44_ctx_zeroize(struct mldsa_44_ctx *ctx);
+void mldsa_44_ctx_free(struct mldsa_44_ctx *ctx);
+
+int mldsa_65_verify(const void *pk, size_t pk_len,
+		    const uint8_t *data, size_t data_len,
+		    const void *sig, size_t sig_len);
+struct mldsa_65_ctx *mldsa_65_ctx_alloc(void);
+int mldsa_65_verify_update(struct mldsa_65_ctx *ctx, const void *data, size_t data_len);
+int mldsa_65_verify_final(struct mldsa_65_ctx *ctx,
+			  const void *pk, size_t pk_len,
+			  const void *sig, size_t sig_len);
+void mldsa_65_ctx_zeroize(struct mldsa_65_ctx *ctx);
+void mldsa_65_ctx_free(struct mldsa_65_ctx *ctx);
+
+int mldsa_87_verify(const void *pk, size_t pk_len,
+		    const uint8_t *data, size_t data_len,
+		    const void *sig, size_t sig_len);
+struct mldsa_87_ctx *mldsa_87_ctx_alloc(void);
+int mldsa_87_verify_update(struct mldsa_87_ctx *ctx, const void *data, size_t data_len);
+int mldsa_87_verify_final(struct mldsa_87_ctx *ctx,
+			  const void *pk, size_t pk_len,
+			  const void *sig, size_t sig_len);
+void mldsa_87_ctx_zeroize(struct mldsa_87_ctx *ctx);
+void mldsa_87_ctx_free(struct mldsa_87_ctx *ctx);
+
+#endif /* _CRYPTO_MLDSA_H */
diff --git a/lib/crypto/mldsa/dilithium_44.c b/lib/crypto/mldsa/dilithium_44.c
index 1aea716016f0..4c70465a5601 100644
--- a/lib/crypto/mldsa/dilithium_44.c
+++ b/lib/crypto/mldsa/dilithium_44.c
@@ -31,3 +31,4 @@
 #include "dilithium_poly.c"
 #include "dilithium_rounding.c"
 #include "dilithium_signature_c.c"
+#include "mldsa_api.c"
diff --git a/lib/crypto/mldsa/dilithium_65.c b/lib/crypto/mldsa/dilithium_65.c
index 08f3a8e71228..7a2ab3f5a179 100644
--- a/lib/crypto/mldsa/dilithium_65.c
+++ b/lib/crypto/mldsa/dilithium_65.c
@@ -31,3 +31,4 @@
 #include "dilithium_poly.c"
 #include "dilithium_rounding.c"
 #include "dilithium_signature_c.c"
+#include "mldsa_api.c"
diff --git a/lib/crypto/mldsa/dilithium_87.c b/lib/crypto/mldsa/dilithium_87.c
index fcc3e0229ed9..548a7d1d365c 100644
--- a/lib/crypto/mldsa/dilithium_87.c
+++ b/lib/crypto/mldsa/dilithium_87.c
@@ -31,3 +31,4 @@
 #include "dilithium_poly.c"
 #include "dilithium_rounding.c"
 #include "dilithium_signature_c.c"
+#include "mldsa_api.c"
diff --git a/lib/crypto/mldsa/dilithium_type.h b/lib/crypto/mldsa/dilithium_type.h
index 84da7b97dd19..27b21b298001 100644
--- a/lib/crypto/mldsa/dilithium_type.h
+++ b/lib/crypto/mldsa/dilithium_type.h
@@ -34,23 +34,29 @@
  * compilation different sizes would not be possible.
  */
 #ifdef DILITHIUM_TYPE_65
+#define MLDSA_F(name) mldsa_65_##name
 #define DILITHIUM_F(name) dilithium_65_##name
 #define dilithium_pk dilithium_65_pk
 #define dilithium_sig dilithium_65_sig
+#define mldsa_ctx mldsa_65_ctx
 
 #include "dilithium_65.h"
 
 #elif defined DILITHIUM_TYPE_44
+#define MLDSA_F(name) mldsa_44_##name
 #define DILITHIUM_F(name) dilithium_44_##name
 #define dilithium_pk dilithium_44_pk
 #define dilithium_sig dilithium_44_sig
+#define mldsa_ctx mldsa_44_ctx
 
 #include "dilithium_44.h"
 
 #else
+#define MLDSA_F(name) mldsa_87_##name
 #define DILITHIUM_F(name) dilithium_87_##name
 #define dilithium_pk dilithium_87_pk
 #define dilithium_sig dilithium_87_sig
+#define mldsa_ctx mldsa_87_ctx
 
 #include "dilithium_87.h"
 
@@ -60,6 +66,13 @@
  * The following defines simply allow duplicate compilation of the
  * respective functions.
  */
+#define mldsa_verify		MLDSA_F(verify)
+#define mldsa_verify_update	MLDSA_F(verify_update)
+#define mldsa_verify_final	MLDSA_F(verify_final)
+#define mldsa_ctx_alloc		MLDSA_F(ctx_alloc)
+#define mldsa_ctx_zeroize	MLDSA_F(ctx_zeroize)
+#define mldsa_ctx_free		MLDSA_F(ctx_free)
+
 #define dilithium_pk_load	DILITHIUM_F(pk_load)
 #define dilithium_sig_load	DILITHIUM_F(sig_load)
 #define dilithium_pk_ptr	DILITHIUM_F(pk_ptr)
diff --git a/lib/crypto/mldsa/mldsa_api.c b/lib/crypto/mldsa/mldsa_api.c
new file mode 100644
index 000000000000..23895df30357
--- /dev/null
+++ b/lib/crypto/mldsa/mldsa_api.c
@@ -0,0 +1,168 @@
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
+int mldsa_verify(const void *pk, size_t pk_len,
+		 const uint8_t *data, size_t data_len,
+		 const void *sig, size_t sig_len)
+{
+	struct mldsa_ctx *ctx;
+	int ret;
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
+	ret = dilithium_verify(&ctx->sig, data, data_len, &ctx->pk);
+out:
+	kfree_sensitive(ctx);
+	return ret;
+}
+EXPORT_SYMBOL(mldsa_verify);
+
+/**
+ * mldsa_ctx_alloc - Allocate ML-DSA context
+ *
+ * Return: Pointer to the allocated context or error code on failure.
+ *
+ * Context: Process context.  May sleep to allocate memory.
+ */
+struct mldsa_ctx *mldsa_ctx_alloc(void)
+{
+	struct mldsa_ctx *ctx;
+
+	ctx = kmalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return ERR_PTR(-ENOMEM);
+
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


