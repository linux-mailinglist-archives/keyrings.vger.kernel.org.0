Return-Path: <keyrings+bounces-3778-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C1A1FD28DEA
	for <lists+keyrings@lfdr.de>; Thu, 15 Jan 2026 22:52:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 911633013336
	for <lists+keyrings@lfdr.de>; Thu, 15 Jan 2026 21:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC2832C31A;
	Thu, 15 Jan 2026 21:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c4+QpHdB"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6852B329E46
	for <keyrings@vger.kernel.org>; Thu, 15 Jan 2026 21:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768513925; cv=none; b=McKzQy5rqsnRm//WEIZyet2MahM+bGpFS/RrEEmBMahBGeZx2t17ti5FHHne7JAuxCH61ylW9S5cHI/dkiiCo/VA1FtJBxdZC7FLsyqsO5GpO2fbVJb6LX27CoGTtO7dPZ17TlN4QG2F/HWBFGGXkHgHElmAIydY3fWfwgO43Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768513925; c=relaxed/simple;
	bh=EVDdVIKJj6HvxkbgOo9Afadvh/2MU71DolaYocO/5iY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ExZu/KhVcdu5CDB4jDcFp5+pBcNXRWmug192YzKledEBGphRlqnYXrPmIWmY3fO3XRx97ePwGmyS8O30q2Gx01ZzaBw9j9m9h2TLQ+Hoavq3WDRaxlczZaDejR0BlyQWxjXeoauqlpaNpqgAjuTk2SxsaVrKhSaU7VoLEyzf8Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c4+QpHdB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768513918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0OlIGcjGD1wi2sSG+3EVGotk9ZQKyl1hE9svG9MZ510=;
	b=c4+QpHdBhNn4GP6TMpOyMRYD2Z6WaClwFOzzH2sbAETdqRSayPLrXxRE8FkptaRPHO/e1z
	d7B+2RPDzK7bbKRbn+7ZAYzsjXarYjWU0hs7FhKZ+WgsLs13SktEUXkSFDnW1gjVIBX9bc
	csq8ObuSXeEDjdWFicYTsMwFxDIn0Qw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-474-_MtbbwO2Nkiz6Mf_yAb7Dw-1; Thu,
 15 Jan 2026 16:51:54 -0500
X-MC-Unique: _MtbbwO2Nkiz6Mf_yAb7Dw-1
X-Mimecast-MFC-AGG-ID: _MtbbwO2Nkiz6Mf_yAb7Dw_1768513913
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D0DB31956050;
	Thu, 15 Jan 2026 21:51:52 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.4])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id EE31A30002D6;
	Thu, 15 Jan 2026 21:51:48 +0000 (UTC)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 08/10] pkcs7, x509: Add RSASSA-PSS support
Date: Thu, 15 Jan 2026 21:50:50 +0000
Message-ID: <20260115215100.312611-9-dhowells@redhat.com>
In-Reply-To: <20260115215100.312611-1-dhowells@redhat.com>
References: <20260115215100.312611-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Add support for RSASSA-PSS keys and signatures to the PKCS#7 and X.509
implementations.  This requires adding support for algorithm parameters for
keys and signatures as RSASSA-PSS needs metadata.  The ASN.1 encoded data
is converted into a printable key=value list string and passed to the
verification code.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/asymmetric_keys/Makefile           |  12 +-
 crypto/asymmetric_keys/mgf1_params.asn1   |  12 ++
 crypto/asymmetric_keys/pkcs7.asn1         |   2 +-
 crypto/asymmetric_keys/pkcs7_parser.c     | 114 +++++-----
 crypto/asymmetric_keys/public_key.c       |  10 +
 crypto/asymmetric_keys/rsassa_params.asn1 |  25 +++
 crypto/asymmetric_keys/rsassa_parser.c    | 240 ++++++++++++++++++++++
 crypto/asymmetric_keys/rsassa_parser.h    |  25 +++
 crypto/asymmetric_keys/x509.asn1          |   2 +-
 crypto/asymmetric_keys/x509_cert_parser.c | 100 ++++-----
 crypto/asymmetric_keys/x509_parser.h      |  45 +++-
 crypto/asymmetric_keys/x509_public_key.c  |  36 +++-
 include/linux/oid_registry.h              |   2 +
 13 files changed, 503 insertions(+), 122 deletions(-)
 create mode 100644 crypto/asymmetric_keys/mgf1_params.asn1
 create mode 100644 crypto/asymmetric_keys/rsassa_params.asn1
 create mode 100644 crypto/asymmetric_keys/rsassa_parser.c
 create mode 100644 crypto/asymmetric_keys/rsassa_parser.h

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index bc65d3b98dcb..c5aed382ee8a 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -21,7 +21,11 @@ x509_key_parser-y := \
 	x509_akid.asn1.o \
 	x509_cert_parser.o \
 	x509_loader.o \
-	x509_public_key.o
+	x509_public_key.o \
+	rsassa_params.asn1.o \
+	rsassa_parser.o \
+	mgf1_params.asn1.o
+
 obj-$(CONFIG_FIPS_SIGNATURE_SELFTEST) += x509_selftest.o
 x509_selftest-y += selftest.o
 x509_selftest-$(CONFIG_FIPS_SIGNATURE_SELFTEST_RSA) += selftest_rsa.o
@@ -31,8 +35,14 @@ $(obj)/x509_cert_parser.o: \
 	$(obj)/x509.asn1.h \
 	$(obj)/x509_akid.asn1.h
 
+$(obj)/rsassa_parser.o: \
+	$(obj)/rsassa_params.asn1.h \
+	$(obj)/mgf1_params.asn1.h
+
 $(obj)/x509.asn1.o: $(obj)/x509.asn1.c $(obj)/x509.asn1.h
 $(obj)/x509_akid.asn1.o: $(obj)/x509_akid.asn1.c $(obj)/x509_akid.asn1.h
+$(obj)/rsassa_params.asn1.o: $(obj)/rsassa_params.asn1.c $(obj)/rsassa_params.asn1.h
+$(obj)/mgf1_params.asn1.o: $(obj)/mgf1_params.asn1.c $(obj)/mgf1_params.asn1.h
 
 #
 # PKCS#8 private key handling
diff --git a/crypto/asymmetric_keys/mgf1_params.asn1 b/crypto/asymmetric_keys/mgf1_params.asn1
new file mode 100644
index 000000000000..c3bc4643e72c
--- /dev/null
+++ b/crypto/asymmetric_keys/mgf1_params.asn1
@@ -0,0 +1,12 @@
+-- SPDX-License-Identifier: BSD-3-Clause
+--
+-- Copyright (C) 2009 IETF Trust and the persons identified as authors
+-- of the code
+--
+--
+-- https://datatracker.ietf.org/doc/html/rfc4055 Section 6.
+
+AlgorithmIdentifier ::= SEQUENCE {
+	algorithm	OBJECT IDENTIFIER ({ mgf1_note_OID }),
+	parameters	ANY OPTIONAL
+}
diff --git a/crypto/asymmetric_keys/pkcs7.asn1 b/crypto/asymmetric_keys/pkcs7.asn1
index 28e1f4a41c14..03c2248f23bc 100644
--- a/crypto/asymmetric_keys/pkcs7.asn1
+++ b/crypto/asymmetric_keys/pkcs7.asn1
@@ -124,7 +124,7 @@ UnauthenticatedAttribute ::= SEQUENCE {
 
 DigestEncryptionAlgorithmIdentifier ::= SEQUENCE {
 	algorithm		OBJECT IDENTIFIER ({ pkcs7_note_OID }),
-	parameters		ANY OPTIONAL
+	parameters		ANY OPTIONAL ({ pkcs7_sig_note_algo_params })
 }
 
 EncryptedDigest ::= OCTET STRING ({ pkcs7_sig_note_signature })
diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
index 90c36fe1b5ed..47d3c1920e8f 100644
--- a/crypto/asymmetric_keys/pkcs7_parser.c
+++ b/crypto/asymmetric_keys/pkcs7_parser.c
@@ -14,6 +14,7 @@
 #include <linux/oid_registry.h>
 #include <crypto/public_key.h>
 #include "pkcs7_parser.h"
+#include "rsassa_parser.h"
 #include "pkcs7.asn1.h"
 
 MODULE_DESCRIPTION("PKCS#7 parser");
@@ -28,14 +29,16 @@ struct pkcs7_parse_context {
 	struct x509_certificate **ppcerts;
 	unsigned long	data;			/* Start of data */
 	enum OID	last_oid;		/* Last OID encountered */
-	unsigned	x509_index;
-	unsigned	sinfo_index;
+	unsigned int	x509_index;
+	unsigned int	sinfo_index;
+	unsigned int	algo_params_size;
+	const void	*algo_params;
 	const void	*raw_serial;
-	unsigned	raw_serial_size;
-	unsigned	raw_issuer_size;
+	unsigned int	raw_serial_size;
+	unsigned int	raw_issuer_size;
 	const void	*raw_issuer;
 	const void	*raw_skid;
-	unsigned	raw_skid_size;
+	unsigned int	raw_skid_size;
 	bool		expect_skid;
 };
 
@@ -225,45 +228,29 @@ int pkcs7_sig_note_digest_algo(void *context, size_t hdrlen,
 			       const void *value, size_t vlen)
 {
 	struct pkcs7_parse_context *ctx = context;
+	const char *algo;
 
-	switch (ctx->last_oid) {
-	case OID_sha1:
-		ctx->sinfo->sig->hash_algo = "sha1";
-		break;
-	case OID_sha256:
-		ctx->sinfo->sig->hash_algo = "sha256";
-		break;
-	case OID_sha384:
-		ctx->sinfo->sig->hash_algo = "sha384";
-		break;
-	case OID_sha512:
-		ctx->sinfo->sig->hash_algo = "sha512";
-		break;
-	case OID_sha224:
-		ctx->sinfo->sig->hash_algo = "sha224";
-		break;
-	case OID_sm3:
-		ctx->sinfo->sig->hash_algo = "sm3";
-		break;
-	case OID_gost2012Digest256:
-		ctx->sinfo->sig->hash_algo = "streebog256";
-		break;
-	case OID_gost2012Digest512:
-		ctx->sinfo->sig->hash_algo = "streebog512";
-		break;
-	case OID_sha3_256:
-		ctx->sinfo->sig->hash_algo = "sha3-256";
-		break;
-	case OID_sha3_384:
-		ctx->sinfo->sig->hash_algo = "sha3-384";
-		break;
-	case OID_sha3_512:
-		ctx->sinfo->sig->hash_algo = "sha3-512";
-		break;
-	default:
-		printk("Unsupported digest algo: %u\n", ctx->last_oid);
+	algo = oid_to_hash(ctx->last_oid);
+	if (!algo) {
+		pr_notice("Unsupported digest algo: %u\n", ctx->last_oid);
 		return -ENOPKG;
 	}
+
+	ctx->sinfo->sig->hash_algo = algo;
+	return 0;
+}
+
+/*
+ * Note the parameters for the signature.
+ */
+int pkcs7_sig_note_algo_params(void *context, size_t hdrlen,
+			       unsigned char tag,
+			       const void *value, size_t vlen)
+{
+	struct pkcs7_parse_context *ctx = context;
+
+	ctx->algo_params = value - hdrlen;
+	ctx->algo_params_size = vlen + hdrlen;
 	return 0;
 }
 
@@ -275,11 +262,21 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t hdrlen,
 			     const void *value, size_t vlen)
 {
 	struct pkcs7_parse_context *ctx = context;
+	struct public_key_signature *sig = ctx->sinfo->sig;
+	int err;
 
 	switch (ctx->last_oid) {
 	case OID_rsaEncryption:
-		ctx->sinfo->sig->pkey_algo = "rsa";
-		ctx->sinfo->sig->encoding = "pkcs1";
+		sig->pkey_algo = "rsa";
+		sig->encoding = "pkcs1";
+		break;
+	case OID_id_rsassa_pss:
+		err = rsassa_parse_sig_params(sig, ctx->algo_params,
+					      ctx->algo_params_size);
+		if (err < 0)
+			return err;
+		sig->pkey_algo = "rsa";
+		sig->encoding = "emsa-pss";
 		break;
 	case OID_id_ecdsa_with_sha1:
 	case OID_id_ecdsa_with_sha224:
@@ -289,33 +286,36 @@ int pkcs7_sig_note_pkey_algo(void *context, size_t hdrlen,
 	case OID_id_ecdsa_with_sha3_256:
 	case OID_id_ecdsa_with_sha3_384:
 	case OID_id_ecdsa_with_sha3_512:
-		ctx->sinfo->sig->pkey_algo = "ecdsa";
-		ctx->sinfo->sig->encoding = "x962";
+		sig->pkey_algo = "ecdsa";
+		sig->encoding = "x962";
 		break;
 	case OID_gost2012PKey256:
 	case OID_gost2012PKey512:
-		ctx->sinfo->sig->pkey_algo = "ecrdsa";
-		ctx->sinfo->sig->encoding = "raw";
+		sig->pkey_algo = "ecrdsa";
+		sig->encoding = "raw";
 		break;
 	case OID_id_ml_dsa_44:
-		ctx->sinfo->sig->pkey_algo = "mldsa44";
-		ctx->sinfo->sig->encoding = "raw";
-		ctx->sinfo->sig->algo_does_hash = true;
+		sig->pkey_algo = "mldsa44";
+		sig->encoding = "raw";
+		sig->algo_does_hash = true;
 		break;
 	case OID_id_ml_dsa_65:
-		ctx->sinfo->sig->pkey_algo = "mldsa65";
-		ctx->sinfo->sig->encoding = "raw";
-		ctx->sinfo->sig->algo_does_hash = true;
+		sig->pkey_algo = "mldsa65";
+		sig->encoding = "raw";
+		sig->algo_does_hash = true;
 		break;
 	case OID_id_ml_dsa_87:
-		ctx->sinfo->sig->pkey_algo = "mldsa87";
-		ctx->sinfo->sig->encoding = "raw";
-		ctx->sinfo->sig->algo_does_hash = true;
+		sig->pkey_algo = "mldsa87";
+		sig->encoding = "raw";
+		sig->algo_does_hash = true;
 		break;
 	default:
-		printk("Unsupported pkey algo: %u\n", ctx->last_oid);
+		pr_notice("Unsupported pkey algo: %u\n", ctx->last_oid);
 		return -ENOPKG;
 	}
+
+	ctx->algo_params = NULL;
+	ctx->algo_params_size = 0;
 	return 0;
 }
 
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index 61dc4f626620..13a5616becaa 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -100,6 +100,16 @@ software_key_determine_akcipher(const struct public_key *pkey,
 			}
 			return n >= CRYPTO_MAX_ALG_NAME ? -EINVAL : 0;
 		}
+		if (strcmp(encoding, "emsa-pss") == 0) {
+			if (op != kernel_pkey_sign &&
+			    op != kernel_pkey_verify)
+				return -EINVAL;
+			*sig = true;
+			if (!hash_algo)
+				hash_algo = "none";
+			n = snprintf(alg_name, CRYPTO_MAX_ALG_NAME, "rsassa-pss");
+			return n >= CRYPTO_MAX_ALG_NAME ? -EINVAL : 0;
+		}
 		if (strcmp(encoding, "raw") != 0)
 			return -EINVAL;
 		/*
diff --git a/crypto/asymmetric_keys/rsassa_params.asn1 b/crypto/asymmetric_keys/rsassa_params.asn1
new file mode 100644
index 000000000000..95a4e5f0dcd5
--- /dev/null
+++ b/crypto/asymmetric_keys/rsassa_params.asn1
@@ -0,0 +1,25 @@
+-- SPDX-License-Identifier: BSD-3-Clause
+--
+-- Copyright (C) 2009 IETF Trust and the persons identified as authors
+-- of the code
+--
+--
+-- https://datatracker.ietf.org/doc/html/rfc4055 Section 6.
+
+RSASSA-PSS-params ::= SEQUENCE {
+	hashAlgorithm      [0] HashAlgorithm,
+	maskGenAlgorithm   [1] MaskGenAlgorithm,
+	saltLength         [2] INTEGER ({ rsassa_note_salt_length }),
+	trailerField       [3] TrailerField OPTIONAL
+}
+
+TrailerField ::= INTEGER ({ rsassa_note_trailer })
+-- { trailerFieldBC(1) }
+
+HashAlgorithm ::= AlgorithmIdentifier ({ rsassa_note_hash_algo })
+MaskGenAlgorithm ::= AlgorithmIdentifier ({ rsassa_note_maskgen_algo })
+
+AlgorithmIdentifier ::= SEQUENCE {
+	algorithm	OBJECT IDENTIFIER ({ rsassa_note_OID }),
+	parameters	ANY OPTIONAL ({ rsassa_note_params })
+}
diff --git a/crypto/asymmetric_keys/rsassa_parser.c b/crypto/asymmetric_keys/rsassa_parser.c
new file mode 100644
index 000000000000..b80720fa94be
--- /dev/null
+++ b/crypto/asymmetric_keys/rsassa_parser.c
@@ -0,0 +1,240 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/* RSASSA-PSS ASN.1 parameter parser
+ *
+ * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#define pr_fmt(fmt) "RSASSA-PSS: "fmt
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/asn1.h>
+#include <crypto/hash.h>
+#include <crypto/hash_info.h>
+#include <crypto/public_key.h>
+#include "x509_parser.h"
+#include "rsassa_parser.h"
+#include "rsassa_params.asn1.h"
+#include "mgf1_params.asn1.h"
+
+struct rsassa_parse_context {
+	struct rsassa_parameters *rsassa;	/* The parsed parameters */
+	unsigned long	data;			/* Start of data */
+	const void	*params;		/* Algo parameters */
+	unsigned int	params_len;		/* Length of algo parameters */
+	enum OID	last_oid;		/* Last OID encountered */
+	enum OID	mgf1_last_oid;		/* Last OID encountered in MGF1 */
+};
+
+/*
+ * Parse an RSASSA parameter block.
+ */
+struct rsassa_parameters *rsassa_params_parse(const void *data, size_t datalen)
+{
+	struct rsassa_parse_context ctx = {};
+	long ret;
+
+	struct rsassa_parameters *rsassa __free(kfree) =
+		kzalloc(sizeof(*rsassa), GFP_KERNEL);
+	if (!rsassa)
+		return ERR_PTR(-ENOMEM);
+
+	ctx.rsassa = rsassa;
+	ctx.data = (unsigned long)data;
+
+	/* Attempt to decode the parameters */
+	ret = asn1_ber_decoder(&rsassa_params_decoder, &ctx, data, datalen);
+	if (ret < 0) {
+		pr_debug("RSASSA parse failed %ld\n", ret);
+		return ERR_PTR(ret);
+	}
+
+	return no_free_ptr(rsassa);
+}
+
+/*
+ * Note an OID when we find one for later processing when we know how
+ * to interpret it.
+ */
+int rsassa_note_OID(void *context, size_t hdrlen, unsigned char tag,
+		    const void *value, size_t vlen)
+{
+	struct rsassa_parse_context *ctx = context;
+
+	ctx->last_oid = look_up_OID(value, vlen);
+	if (ctx->last_oid == OID__NR) {
+		char buffer[56];
+
+		sprint_oid(value, vlen, buffer, sizeof(buffer));
+		pr_debug("Unknown OID: %s\n", buffer);
+	}
+	return 0;
+}
+
+/*
+ * Parse trailerField.  We only accept trailerFieldBC.
+ */
+int rsassa_note_trailer(void *context, size_t hdrlen, unsigned char tag,
+			const void *value, size_t vlen)
+{
+	if (vlen != 1 || *(u8 *)value != 0x01) {
+		pr_debug("Unknown trailerField\n");
+		return -EINVAL;
+	}
+	return 0;
+}
+
+int rsassa_note_hash_algo(void *context, size_t hdrlen, unsigned char tag,
+			  const void *value, size_t vlen)
+{
+	struct rsassa_parse_context *ctx = context;
+
+	ctx->rsassa->hash_algo = ctx->last_oid;
+	pr_debug("HASH-ALGO %u %u\n", ctx->rsassa->hash_algo, ctx->params_len);
+	ctx->params = NULL;
+	return 0;
+}
+
+int rsassa_note_maskgen_algo(void *context, size_t hdrlen, unsigned char tag,
+			     const void *value, size_t vlen)
+{
+	struct rsassa_parse_context *ctx = context;
+	int ret;
+
+	ctx->rsassa->maskgen_algo = ctx->last_oid;
+	pr_debug("MGF-ALGO %u %u\n", ctx->rsassa->maskgen_algo, ctx->params_len);
+
+	switch (ctx->rsassa->maskgen_algo) {
+	case OID_id_mgf1:
+		if (!vlen) {
+			pr_debug("MGF1 missing parameters\n");
+			return -EBADMSG;
+		}
+
+		ret = asn1_ber_decoder(&mgf1_params_decoder, ctx,
+				       ctx->params, ctx->params_len);
+		if (ret < 0) {
+			pr_debug("MGF1 parse failed %d\n", ret);
+			return ret;
+		}
+		ctx->rsassa->maskgen_hash = ctx->mgf1_last_oid;
+		break;
+
+	default:
+		pr_debug("Unsupported MaskGenAlgorithm %d\n", ret);
+		return -ENOPKG;
+	}
+
+	ctx->params = NULL;
+	return 0;
+}
+
+int rsassa_note_salt_length(void *context, size_t hdrlen, unsigned char tag,
+			    const void *value, size_t vlen)
+{
+	struct rsassa_parse_context *ctx = context;
+	u32 salt_len = 0;
+
+	if (!vlen) {
+		pr_debug("Salt len bad integer\n");
+		return -EBADMSG;
+	}
+	if (vlen > 4) {
+		pr_debug("Salt len too long %zu\n", vlen);
+		return -EBADMSG;
+	}
+	if (((u8 *)value)[0] & 0x80) {
+		pr_debug("Salt len negative\n");
+		return -EBADMSG;
+	}
+
+	for (size_t i = 0; i < vlen; i++) {
+		salt_len <<= 8;
+		salt_len |= ((u8 *)value)[i];
+	}
+
+	ctx->rsassa->salt_len = salt_len;
+	pr_debug("Salt-Len %u\n", salt_len);
+	return 0;
+}
+
+/*
+ * Extract arbitrary parameters.
+ */
+int rsassa_note_params(void *context, size_t hdrlen, unsigned char tag,
+		       const void *value, size_t vlen)
+{
+	struct rsassa_parse_context *ctx = context;
+
+	ctx->params	= value - hdrlen;
+	ctx->params_len	= vlen + hdrlen;
+	return 0;
+}
+
+/*
+ * Note an OID when we find one for later processing when we know how to
+ * interpret it.
+ */
+int mgf1_note_OID(void *context, size_t hdrlen, unsigned char tag,
+		  const void *value, size_t vlen)
+{
+	struct rsassa_parse_context *ctx = context;
+
+	ctx->mgf1_last_oid = look_up_OID(value, vlen);
+	if (ctx->mgf1_last_oid == OID__NR) {
+		char buffer[56];
+
+		sprint_oid(value, vlen, buffer, sizeof(buffer));
+		pr_debug("Unknown MGF1 OID: %s\n", buffer);
+	}
+	return 0;
+}
+
+/*
+ * Parse the signature parameter block and generate a suitable info string from
+ * it.
+ */
+int rsassa_parse_sig_params(struct public_key_signature *sig,
+			    const u8 *sig_params, unsigned int sig_params_size)
+{
+	const char *mf, *mh;
+
+	if (!sig_params || !sig_params_size) {
+		pr_debug("sig algo without parameters\n");
+		return -EBADMSG;
+	}
+
+	struct rsassa_parameters *rsassa __free(rsassa_params_free) =
+		rsassa_params_parse(sig_params, sig_params_size);
+	if (IS_ERR(rsassa))
+		return PTR_ERR(rsassa);
+
+	sig->hash_algo = oid_to_hash(rsassa->hash_algo);
+	if (!sig->hash_algo) {
+		pr_notice("Unsupported hash: %u\n", rsassa->hash_algo);
+		return -ENOPKG;
+	}
+
+	switch (rsassa->maskgen_algo) {
+	case OID_id_mgf1:
+		mf = "mgf1";
+		break;
+	default:
+		pr_notice("Unsupported maskgen algo: %u\n", rsassa->maskgen_algo);
+		return -ENOPKG;
+	}
+
+	mh = oid_to_hash(rsassa->maskgen_hash);
+	if (!mh) {
+		pr_notice("Unsupported MGF1 hash: %u\n", rsassa->maskgen_hash);
+		return -ENOPKG;
+	}
+
+	sig->info = kasprintf(GFP_KERNEL, "sighash=%s pss_mask=%s,%s pss_salt=%u",
+			      sig->hash_algo, mf, mh, rsassa->salt_len);
+	if (!sig->info)
+		return -ENOMEM;
+	pr_debug("Info string: %s\n", sig->info);
+	return 0;
+}
diff --git a/crypto/asymmetric_keys/rsassa_parser.h b/crypto/asymmetric_keys/rsassa_parser.h
new file mode 100644
index 000000000000..b80401a3de8f
--- /dev/null
+++ b/crypto/asymmetric_keys/rsassa_parser.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* RSASSA-PSS parameter parsing context
+ *
+ * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+
+#include <linux/oid_registry.h>
+
+struct rsassa_parameters {
+	enum OID	hash_algo;		/* Hash algorithm identifier */
+	enum OID	maskgen_algo;		/* Mask gen algorithm identifier */
+	enum OID	maskgen_hash;		/* Mask gen hash algorithm identifier */
+	u32		salt_len;
+};
+
+struct rsassa_parameters *rsassa_params_parse(const void *data, size_t datalen);
+int rsassa_parse_sig_params(struct public_key_signature *sig,
+			    const u8 *sig_params, unsigned int sig_params_size);
+
+static inline void rsassa_params_free(struct rsassa_parameters *params)
+{
+	kfree(params);
+}
+DEFINE_FREE(rsassa_params_free,  struct rsassa_parameters*, rsassa_params_free(_T))
diff --git a/crypto/asymmetric_keys/x509.asn1 b/crypto/asymmetric_keys/x509.asn1
index feb9573cacce..453b72eba1fe 100644
--- a/crypto/asymmetric_keys/x509.asn1
+++ b/crypto/asymmetric_keys/x509.asn1
@@ -29,7 +29,7 @@ CertificateSerialNumber ::= INTEGER
 
 AlgorithmIdentifier ::= SEQUENCE {
 	algorithm		OBJECT IDENTIFIER ({ x509_note_OID }),
-	parameters		ANY OPTIONAL ({ x509_note_params })
+	parameters		ANY OPTIONAL ({ x509_note_algo_id_params })
 }
 
 Name ::= SEQUENCE OF RelativeDistinguishedName
diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 5ab5b4e5f1b4..a4b848628e37 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -15,28 +15,7 @@
 #include "x509_parser.h"
 #include "x509.asn1.h"
 #include "x509_akid.asn1.h"
-
-struct x509_parse_context {
-	struct x509_certificate	*cert;		/* Certificate being constructed */
-	unsigned long	data;			/* Start of data */
-	const void	*key;			/* Key data */
-	size_t		key_size;		/* Size of key data */
-	const void	*params;		/* Key parameters */
-	size_t		params_size;		/* Size of key parameters */
-	enum OID	key_algo;		/* Algorithm used by the cert's key */
-	enum OID	last_oid;		/* Last OID encountered */
-	enum OID	sig_algo;		/* Algorithm used to sign the cert */
-	u8		o_size;			/* Size of organizationName (O) */
-	u8		cn_size;		/* Size of commonName (CN) */
-	u8		email_size;		/* Size of emailAddress */
-	u16		o_offset;		/* Offset of organizationName (O) */
-	u16		cn_offset;		/* Offset of commonName (CN) */
-	u16		email_offset;		/* Offset of emailAddress */
-	unsigned	raw_akid_size;
-	const void	*raw_akid;		/* Raw authorityKeyId in ASN.1 */
-	const void	*akid_raw_issuer;	/* Raw directoryName in authorityKeyId */
-	unsigned	akid_raw_issuer_size;
-};
+#include "rsassa_parser.h"
 
 /*
  * Free an X.509 certificate
@@ -60,12 +39,11 @@ EXPORT_SYMBOL_GPL(x509_free_certificate);
  */
 struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
 {
-	struct x509_certificate *cert __free(x509_free_certificate) = NULL;
-	struct x509_parse_context *ctx __free(kfree) = NULL;
 	struct asymmetric_key_id *kid;
 	long ret;
 
-	cert = kzalloc(sizeof(struct x509_certificate), GFP_KERNEL);
+	struct x509_certificate *cert __free(x509_free_certificate) =
+		kzalloc(sizeof(struct x509_certificate), GFP_KERNEL);
 	if (!cert)
 		return ERR_PTR(-ENOMEM);
 	cert->pub = kzalloc(sizeof(struct public_key), GFP_KERNEL);
@@ -74,7 +52,9 @@ struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
 	cert->sig = kzalloc(sizeof(struct public_key_signature), GFP_KERNEL);
 	if (!cert->sig)
 		return ERR_PTR(-ENOMEM);
-	ctx = kzalloc(sizeof(struct x509_parse_context), GFP_KERNEL);
+
+	struct x509_parse_context *ctx __free(kfree) =
+		kzalloc(sizeof(struct x509_parse_context), GFP_KERNEL);
 	if (!ctx)
 		return ERR_PTR(-ENOMEM);
 
@@ -104,15 +84,15 @@ struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
 
 	cert->pub->keylen = ctx->key_size;
 
-	cert->pub->params = kmemdup(ctx->params, ctx->params_size, GFP_KERNEL);
+	cert->pub->params = kmemdup(ctx->key_params, ctx->key_params_size, GFP_KERNEL);
 	if (!cert->pub->params)
 		return ERR_PTR(-ENOMEM);
 
-	cert->pub->paramlen = ctx->params_size;
+	cert->pub->paramlen = ctx->key_params_size;
 	cert->pub->algo = ctx->key_algo;
 
 	/* Grab the signature bits */
-	ret = x509_get_sig_params(cert);
+	ret = x509_get_sig_params(cert, ctx);
 	if (ret < 0)
 		return ERR_PTR(ret);
 
@@ -146,7 +126,7 @@ int x509_note_OID(void *context, size_t hdrlen,
 
 	ctx->last_oid = look_up_OID(value, vlen);
 	if (ctx->last_oid == OID__NR) {
-		char buffer[50];
+		char buffer[56];
 		sprint_oid(value, vlen, buffer, sizeof(buffer));
 		pr_debug("Unknown OID: [%lu] %s\n",
 			 (unsigned long)value - ctx->data, buffer);
@@ -179,6 +159,7 @@ int x509_note_sig_algo(void *context, size_t hdrlen, unsigned char tag,
 		       const void *value, size_t vlen)
 {
 	struct x509_parse_context *ctx = context;
+	int err;
 
 	pr_debug("PubKey Algo: %u\n", ctx->last_oid);
 
@@ -210,6 +191,9 @@ int x509_note_sig_algo(void *context, size_t hdrlen, unsigned char tag,
 		ctx->cert->sig->hash_algo = "sha1";
 		goto ecdsa;
 
+	case OID_id_rsassa_pss:
+		goto rsassa_pss;
+
 	case OID_id_rsassa_pkcs1_v1_5_with_sha3_256:
 		ctx->cert->sig->hash_algo = "sha3-256";
 		goto rsa_pkcs1;
@@ -268,6 +252,19 @@ int x509_note_sig_algo(void *context, size_t hdrlen, unsigned char tag,
 		goto ml_dsa;
 	}
 
+rsassa_pss:
+	err = rsassa_parse_sig_params(ctx->cert->sig,
+				      ctx->algo_params, ctx->algo_params_size);
+	if (err < 0)
+		return err;
+
+	ctx->cert->sig->pkey_algo = "rsa";
+	ctx->cert->sig->encoding = "emsa-pss";
+	ctx->sig_algo = ctx->last_oid;
+	ctx->algo_params = NULL;
+	ctx->algo_params_size = 0;
+	return 0;
+
 rsa_pkcs1:
 	ctx->cert->sig->pkey_algo = "rsa";
 	ctx->cert->sig->encoding = "pkcs1";
@@ -324,8 +321,8 @@ int x509_note_signature(void *context, size_t hdrlen,
 		vlen--;
 	}
 
-	ctx->cert->raw_sig = value;
-	ctx->cert->raw_sig_size = vlen;
+	ctx->sig = value;
+	ctx->sig_size = vlen;
 	return 0;
 }
 
@@ -479,23 +476,16 @@ int x509_note_subject(void *context, size_t hdrlen,
 }
 
 /*
- * Extract the parameters for the public key
+ * Extract the parameters for an AlgorithmIdentifier.
  */
-int x509_note_params(void *context, size_t hdrlen,
-		     unsigned char tag,
-		     const void *value, size_t vlen)
+int x509_note_algo_id_params(void *context, size_t hdrlen,
+			     unsigned char tag,
+			     const void *value, size_t vlen)
 {
 	struct x509_parse_context *ctx = context;
 
-	/*
-	 * AlgorithmIdentifier is used three times in the x509, we should skip
-	 * first and ignore third, using second one which is after subject and
-	 * before subjectPublicKey.
-	 */
-	if (!ctx->cert->raw_subject || ctx->key)
-		return 0;
-	ctx->params = value - hdrlen;
-	ctx->params_size = vlen + hdrlen;
+	ctx->algo_params = value - hdrlen;
+	ctx->algo_params_size = vlen + hdrlen;
 	return 0;
 }
 
@@ -514,12 +504,28 @@ int x509_extract_key_data(void *context, size_t hdrlen,
 	case OID_rsaEncryption:
 		ctx->cert->pub->pkey_algo = "rsa";
 		break;
+	case OID_id_rsassa_pss:
+		/* Parameters are optional for the key itself. */
+		if (ctx->algo_params_size) {
+			ctx->key_params = ctx->algo_params;
+			ctx->key_params_size = ctx->algo_params_size;
+			ctx->algo_params = NULL;
+			ctx->algo_params_size = 0;
+
+			struct rsassa_parameters *params __free(rsassa_params_free) =
+				rsassa_params_parse(ctx->key_params, ctx->key_params_size);
+			if (IS_ERR(params))
+				return PTR_ERR(params);
+			break;
+		}
+		ctx->cert->pub->pkey_algo = "rsa";
+		break;
 	case OID_gost2012PKey256:
 	case OID_gost2012PKey512:
 		ctx->cert->pub->pkey_algo = "ecrdsa";
 		break;
 	case OID_id_ecPublicKey:
-		if (parse_OID(ctx->params, ctx->params_size, &oid) != 0)
+		if (parse_OID(ctx->algo_params, ctx->algo_params_size, &oid) != 0)
 			return -EBADMSG;
 
 		switch (oid) {
@@ -557,6 +563,8 @@ int x509_extract_key_data(void *context, size_t hdrlen,
 		return -EBADMSG;
 	ctx->key = value + 1;
 	ctx->key_size = vlen - 1;
+	ctx->algo_params = NULL;
+	ctx->algo_params_size = 0;
 	return 0;
 }
 
diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_keys/x509_parser.h
index 0688c222806b..578de49c37bc 100644
--- a/crypto/asymmetric_keys/x509_parser.h
+++ b/crypto/asymmetric_keys/x509_parser.h
@@ -22,18 +22,16 @@ struct x509_certificate {
 	time64_t	valid_from;
 	time64_t	valid_to;
 	const void	*tbs;			/* Signed data */
-	unsigned	tbs_size;		/* Size of signed data */
-	unsigned	raw_sig_size;		/* Size of signature */
-	const void	*raw_sig;		/* Signature data */
+	unsigned int	tbs_size;		/* Size of signed data */
 	const void	*raw_serial;		/* Raw serial number in ASN.1 */
-	unsigned	raw_serial_size;
-	unsigned	raw_issuer_size;
+	unsigned int	raw_serial_size;
+	unsigned int	raw_issuer_size;
 	const void	*raw_issuer;		/* Raw issuer name in ASN.1 */
 	const void	*raw_subject;		/* Raw subject name in ASN.1 */
-	unsigned	raw_subject_size;
-	unsigned	raw_skid_size;
+	unsigned int	raw_subject_size;
+	unsigned int	raw_skid_size;
 	const void	*raw_skid;		/* Raw subjectKeyId in ASN.1 */
-	unsigned	index;
+	unsigned int	index;
 	bool		seen;			/* Infinite recursion prevention */
 	bool		verified;
 	bool		self_signed;		/* T if self-signed (check unsupported_sig too) */
@@ -41,6 +39,34 @@ struct x509_certificate {
 	bool		blacklisted;
 };
 
+struct x509_parse_context {
+	struct x509_certificate	*cert;		/* Certificate being constructed */
+	unsigned long	data;			/* Start of data */
+	const void	*key;			/* Key data */
+	size_t		key_size;		/* Size of key data */
+	const void	*algo_params;		/* AlgorithmIdentifier: parameters */
+	size_t		algo_params_size;	/* AlgorithmIdentifier: parameters size */
+	const void	*key_params;		/* Key parameters */
+	size_t		key_params_size;	/* Size of key parameters */
+	const void	*sig_params;		/* Signature parameters */
+	unsigned int	sig_params_size;	/* Size of sig parameters */
+	unsigned int	sig_size;		/* Size of signature */
+	const void	*sig;			/* Signature data */
+	enum OID	key_algo;		/* Algorithm used by the cert's key */
+	enum OID	last_oid;		/* Last OID encountered */
+	enum OID	sig_algo;		/* Algorithm used to sign the cert */
+	u8		o_size;			/* Size of organizationName (O) */
+	u8		cn_size;		/* Size of commonName (CN) */
+	u8		email_size;		/* Size of emailAddress */
+	u16		o_offset;		/* Offset of organizationName (O) */
+	u16		cn_offset;		/* Offset of commonName (CN) */
+	u16		email_offset;		/* Offset of emailAddress */
+	unsigned int	raw_akid_size;
+	const void	*raw_akid;		/* Raw authorityKeyId in ASN.1 */
+	const void	*akid_raw_issuer;	/* Raw directoryName in authorityKeyId */
+	unsigned int	akid_raw_issuer_size;
+};
+
 /*
  * x509_cert_parser.c
  */
@@ -55,5 +81,6 @@ extern int x509_decode_time(time64_t *_t,  size_t hdrlen,
 /*
  * x509_public_key.c
  */
-extern int x509_get_sig_params(struct x509_certificate *cert);
+extern const char *oid_to_hash(enum OID oid);
+extern int x509_get_sig_params(struct x509_certificate *cert, struct x509_parse_context *parse);
 extern int x509_check_for_self_signed(struct x509_certificate *cert);
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 2243add11d48..4490cfa368a3 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -17,11 +17,32 @@
 #include "asymmetric_keys.h"
 #include "x509_parser.h"
 
+/*
+ * Translate OIDs to hash algorithm names.
+ */
+const char *oid_to_hash(enum OID oid)
+{
+	switch (oid) {
+	case OID_sha1:			return "sha1";
+	case OID_sha256:		return "sha256";
+	case OID_sha384:		return "sha384";
+	case OID_sha512:		return "sha512";
+	case OID_sha224:		return "sha224";
+	case OID_sm3:			return "sm3";
+	case OID_gost2012Digest256:	return "streebog256";
+	case OID_gost2012Digest512:	return "streebog512";
+	case OID_sha3_256:		return "sha3-256";
+	case OID_sha3_384:		return "sha3-384";
+	case OID_sha3_512:		return "sha3-512";
+	default:			return NULL;
+	}
+}
+
 /*
  * Set up the signature parameters in an X.509 certificate.  This involves
  * digesting the signed data and extracting the signature.
  */
-int x509_get_sig_params(struct x509_certificate *cert)
+int x509_get_sig_params(struct x509_certificate *cert, struct x509_parse_context *parse)
 {
 	struct public_key_signature *sig = cert->sig;
 	struct crypto_shash *tfm;
@@ -31,11 +52,11 @@ int x509_get_sig_params(struct x509_certificate *cert)
 
 	pr_devel("==>%s()\n", __func__);
 
-	sig->s = kmemdup(cert->raw_sig, cert->raw_sig_size, GFP_KERNEL);
+	sig->s = kmemdup(parse->sig, parse->sig_size, GFP_KERNEL);
 	if (!sig->s)
 		return -ENOMEM;
 
-	sig->s_size = cert->raw_sig_size;
+	sig->s_size = parse->sig_size;
 
 	/* Allocate the hashing algorithm we're going to need and find out how
 	 * big the hash operational data will be.
@@ -43,6 +64,7 @@ int x509_get_sig_params(struct x509_certificate *cert)
 	tfm = crypto_alloc_shash(sig->hash_algo, 0, 0);
 	if (IS_ERR(tfm)) {
 		if (PTR_ERR(tfm) == -ENOENT) {
+			pr_debug("Unsupported hash %s\n", sig->hash_algo);
 			cert->unsupported_sig = true;
 			return 0;
 		}
@@ -149,13 +171,12 @@ int x509_check_for_self_signed(struct x509_certificate *cert)
  */
 static int x509_key_preparse(struct key_preparsed_payload *prep)
 {
-	struct x509_certificate *cert __free(x509_free_certificate) = NULL;
-	struct asymmetric_key_ids *kids __free(kfree) = NULL;
 	char *p, *desc __free(kfree) = NULL;
 	const char *q;
 	size_t srlen, sulen;
 
-	cert = x509_cert_parse(prep->data, prep->datalen);
+	struct x509_certificate *cert __free(x509_free_certificate) =
+		x509_cert_parse(prep->data, prep->datalen);
 	if (IS_ERR(cert))
 		return PTR_ERR(cert);
 
@@ -198,7 +219,8 @@ static int x509_key_preparse(struct key_preparsed_payload *prep)
 	p = bin2hex(p, q, srlen);
 	*p = 0;
 
-	kids = kmalloc(sizeof(struct asymmetric_key_ids), GFP_KERNEL);
+	struct asymmetric_key_ids *kids __free(kfree) =
+		kmalloc(sizeof(struct asymmetric_key_ids), GFP_KERNEL);
 	if (!kids)
 		return -ENOMEM;
 	kids->id[0] = cert->id;
diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index ebce402854de..7fe168f54a6c 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -31,6 +31,8 @@ enum OID {
 	/* PKCS#1 {iso(1) member-body(2) us(840) rsadsi(113549) pkcs(1) pkcs-1(1)} */
 	OID_rsaEncryption,		/* 1.2.840.113549.1.1.1 */
 	OID_sha1WithRSAEncryption,	/* 1.2.840.113549.1.1.5 */
+	OID_id_mgf1,			/* 1.2.840.113549.1.1.8 */
+	OID_id_rsassa_pss,		/* 1.2.840.113549.1.1.10 */
 	OID_sha256WithRSAEncryption,	/* 1.2.840.113549.1.1.11 */
 	OID_sha384WithRSAEncryption,	/* 1.2.840.113549.1.1.12 */
 	OID_sha512WithRSAEncryption,	/* 1.2.840.113549.1.1.13 */


