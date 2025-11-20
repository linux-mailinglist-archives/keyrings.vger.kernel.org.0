Return-Path: <keyrings+bounces-3397-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DC624C7383F
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 11:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8FE434E025F
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 10:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39172F7477;
	Thu, 20 Nov 2025 10:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hoJwi9ZH"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC812874F8
	for <keyrings@vger.kernel.org>; Thu, 20 Nov 2025 10:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635502; cv=none; b=s9lMUPQh/fkfOLJLpMvycufdkBfSTHKaw3twaQ3hKnqoPmScGfrpy7A7P1mVs85Eora0S5Gzzr+YUmj5C/hULXsGSd6erShGEdm81b9/89CzYbCjDZHoGnlDLOVUtfXMxELKBagTiUR6n/olqZ/eMbZmhMOMGKIIrNE3+lX5uC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635502; c=relaxed/simple;
	bh=oLpSATWfFvRNZRY8x+81dHTPA1aB8xMin/ii96UHcd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBCHviU7L9pgy129NF4FJTJibjmpaD/T8JUwBTRFQpmIs98utjpbSj5maeYID6lGQT/19UzyMFIbV91VtbtJ1Ih2sTjDSmaHNu8NkUUYz13q+Fh82In1+7BGHB5zp4TwVLfvxPvsivvUNDAKjPMhsiTq6Z/LkSmznLN2JzfjT1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hoJwi9ZH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763635499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xQMvkbyRi9XwNEQc0JvOE+RSUhPOJZsxAIcfRZklOo=;
	b=hoJwi9ZHLNqB7GtkJEE6jlFtFiEHFEcKbU9qBqrv5odtwXAN491gepBlukdEfjXCAQ2SM0
	fHb7OJ3E5wLeIg1NC9V5FGRa4UpvHQyh+rRwID6lHcl456sKAzXa2Wm7nHVxcW4nPGOdeV
	Wj9AES2G3/iZ2/H0poAfjNbulnlXuyM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-407-oyc3XaSKM1WCf4MW1Wydcw-1; Thu,
 20 Nov 2025 05:44:55 -0500
X-MC-Unique: oyc3XaSKM1WCf4MW1Wydcw-1
X-Mimecast-MFC-AGG-ID: oyc3XaSKM1WCf4MW1Wydcw_1763635493
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30C8E195608E;
	Thu, 20 Nov 2025 10:44:53 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.5])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7A0EC1940E82;
	Thu, 20 Nov 2025 10:44:49 +0000 (UTC)
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
Subject: [PATCH v10 1/8] lib/crypto: Add ML-DSA verification support
Date: Thu, 20 Nov 2025 10:44:28 +0000
Message-ID: <20251120104439.2620205-2-dhowells@redhat.com>
In-Reply-To: <20251120104439.2620205-1-dhowells@redhat.com>
References: <20251120104439.2620205-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

From: Eric Biggers <ebiggers@kernel.org>

Add support for verifying ML-DSA signatures.

ML-DSA (Module-Lattice-Based Digital Signature Algorithm) is specified
in FIPS 204 and is the standard version of Dilithium.  Unlike RSA and
elliptic-curve cryptography, ML-DSA is believed to be secure even
against adversaries in possession of a large-scale quantum computer.

Compared to the earlier patch
(https://lore.kernel.org/r/20251117145606.2155773-3-dhowells@redhat.com/)
that was based on "leancrypto", this implementation:

  - Is about 600 lines of source code instead of 4800.
  - Generates about 4 KB of object code instead of 28 KB.
  - Uses 9-13 KB of memory to verify a signature instead of 31-84 KB.
  - Is 3-5% faster, depending on the ML-DSA parameter set.

The API just consists of a single function mldsa_verify(), supporting
the standard parameter sets (ML-DSA-44, ML-DSA-65, and ML-DSA-87) as
selected by an enum.  That's all that's actually needed.

HashML-DSA, incremental message hashing, and nonempty contexts aren't
supported, as they aren't needed yet.  Likewise, only verification
support is included, since it's all the kernel needs.  It's much simpler
than full keygen+sign+verify support, and it means that constant-time
code isn't needed either.  (I've still used constant-time patterns in
some places anyway, but technically it's not needed.  And some steps in
ML-DSA verification are inherently variable-time anyway.)

Note that mldsa_verify() allocates memory, so it can sleep and can fail
with ENOMEM.  Unfortunately we don't have much choice about that, since
ML-DSA needs a lot of memory.  At least callers have to check for errors
anyway, since the signature could be invalid.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: David Howells <dhowells@redhat.com>
---
 include/crypto/mldsa.h |  51 ++++
 lib/crypto/Kconfig     |   7 +
 lib/crypto/Makefile    |   5 +
 lib/crypto/mldsa.c     | 570 +++++++++++++++++++++++++++++++++++++++++
 4 files changed, 633 insertions(+)
 create mode 100644 include/crypto/mldsa.h
 create mode 100644 lib/crypto/mldsa.c

diff --git a/include/crypto/mldsa.h b/include/crypto/mldsa.h
new file mode 100644
index 000000000000..f0c212e9e4f1
--- /dev/null
+++ b/include/crypto/mldsa.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Support for verifying ML-DSA signatures
+ *
+ * Copyright 2025 Google LLC
+ */
+#ifndef _CRYPTO_MLDSA_H
+#define _CRYPTO_MLDSA_H
+
+#include <linux/types.h>
+
+/* Identifier for an ML-DSA parameter set */
+enum mldsa_alg {
+	MLDSA44, /* ML-DSA-44 */
+	MLDSA65, /* ML-DSA-65 */
+	MLDSA87, /* ML-DSA-87 */
+};
+
+/* Lengths of ML-DSA public keys and signatures in bytes */
+#define MLDSA44_PUBLIC_KEY_SIZE 1312
+#define MLDSA65_PUBLIC_KEY_SIZE 1952
+#define MLDSA87_PUBLIC_KEY_SIZE 2592
+#define MLDSA44_SIGNATURE_SIZE 2420
+#define MLDSA65_SIGNATURE_SIZE 3309
+#define MLDSA87_SIGNATURE_SIZE 4627
+
+/**
+ * mldsa_verify() - Verify an ML-DSA signature
+ * @alg: The ML-DSA parameter set to use
+ * @sig: The signature
+ * @sig_len: Length of the signature in bytes.  Should match the
+ *	     MLDSA*_SIGNATURE_SIZE constant associated with @alg,
+ *	     otherwise -EBADMSG will be returned right away.
+ * @msg: The message
+ * @msg_len: Length of the message in bytes
+ * @pk: The public key
+ * @pk_len: Length of the public key in bytes.  Should match the
+ *	    MLDSA*_PUBLIC_KEY_SIZE constant associated with @alg,
+ *	    otherwise -EBADMSG will be returned right away.
+ *
+ * This verifies an ML-DSA signature using the specified ML-DSA parameter set.
+ * The context string is assumed to be empty.
+ *
+ * Context: Might sleep
+ * Return: 0 if the signature is valid, -EBADMSG if the signature is invalid, or
+ *	   -ENOMEM if out of memory so the validity of the signature is unknown
+ */
+int mldsa_verify(enum mldsa_alg alg, const u8 *sig, size_t sig_len,
+		 const u8 *msg, size_t msg_len, const u8 *pk, size_t pk_len);
+
+#endif /* _CRYPTO_MLDSA_H */
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index 9d04b3771ce2..51ac3186ebc2 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -100,6 +100,13 @@ config CRYPTO_LIB_MD5_ARCH
 	default y if PPC
 	default y if SPARC64
 
+config CRYPTO_LIB_MLDSA
+	tristate
+	select CRYPTO_LIB_SHA3
+	help
+	  The ML-DSA library functions.  Select this if your module uses any of
+	  the functions from <crypto/mldsa.h>.
+
 config CRYPTO_LIB_POLY1305
 	tristate
 	help
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 6580991f8e12..fb83ec480ec0 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -127,6 +127,11 @@ endif # CONFIG_CRYPTO_LIB_MD5_ARCH
 
 ################################################################################
 
+obj-$(CONFIG_CRYPTO_LIB_MLDSA) += libmldsa.o
+libmldsa-y := mldsa.o
+
+################################################################################
+
 obj-$(CONFIG_CRYPTO_LIB_POLY1305) += libpoly1305.o
 libpoly1305-y := poly1305.o
 ifeq ($(CONFIG_ARCH_SUPPORTS_INT128),y)
diff --git a/lib/crypto/mldsa.c b/lib/crypto/mldsa.c
new file mode 100644
index 000000000000..8060cad9a874
--- /dev/null
+++ b/lib/crypto/mldsa.c
@@ -0,0 +1,570 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Support for verifying ML-DSA signatures
+ *
+ * Copyright 2025 Google LLC
+ */
+
+#include <crypto/mldsa.h>
+#include <crypto/sha3.h>
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+
+#define Q 8380417 /* The prime q = 2^23 - 2^13 + 1 */
+#define QINV_MOD_R 58728449 /* Multiplicative inverse of q mod 2^32 */
+#define R_MOD_Q 4193792 /* 2^32 mod q */
+#define N 256 /* Number of components per ring element */
+#define D 13 /* Number of dropped bits in t */
+#define RHO_LEN 32 /* Length of the public random seed in bytes */
+
+/*
+ * The zetas array in Montgomery form, i.e. with extra factor of 2^32.
+ * Reference: FIPS 204 Section 7.5 "NTT and NTT^-1"
+ * Generated by the following Python code:
+ * q=8380417; [a%q - q*(a%q > q//2) for a in [1753**(int(f'{i:08b}'[::-1], 2)) << 32 for i in range(256)]]
+ */
+static const s32 zetas_times_2_32[N] = {
+	-4186625, 25847,    -2608894, -518909,	237124,	  -777960,  -876248,
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
+
+/* Reference: FIPS 204 Section 4 "Parameter Sets" */
+static const struct mldsa_parameter_set {
+	u8 k; /* num rows in the matrix A */
+	u8 l; /* num columns in the matrix A */
+	u8 ctilde_len; /* length of commitment hash ctilde in bytes; lambda/4 */
+	u8 omega; /* max num of 1's in the hint vector h */
+	u8 tau; /* num of +-1's in challenge c */
+	u8 beta; /* tau times eta */
+	u16 pk_len; /* length of public keys in bytes */
+	u16 sig_len; /* length of signatures in bytes */
+	s32 gamma1; /* coefficient range of y */
+} mldsa_parameter_sets[] = {
+	[MLDSA44] = {
+		.k = 4,
+		.l = 4,
+		.ctilde_len = 32,
+		.omega = 80,
+		.tau = 39,
+		.beta = 78,
+		.pk_len = MLDSA44_PUBLIC_KEY_SIZE,
+		.sig_len = MLDSA44_SIGNATURE_SIZE,
+		.gamma1 = 1 << 17,
+	},
+	[MLDSA65] = {
+		.k = 6,
+		.l = 5,
+		.ctilde_len = 48,
+		.omega = 55,
+		.tau = 49,
+		.beta = 196,
+		.pk_len = MLDSA65_PUBLIC_KEY_SIZE,
+		.sig_len = MLDSA65_SIGNATURE_SIZE,
+		.gamma1 = 1 << 19,
+	},
+	[MLDSA87] = {
+		.k = 8,
+		.l = 7,
+		.ctilde_len = 64,
+		.omega = 75,
+		.tau = 60,
+		.beta = 120,
+		.pk_len = MLDSA87_PUBLIC_KEY_SIZE,
+		.sig_len = MLDSA87_SIGNATURE_SIZE,
+		.gamma1 = 1 << 19,
+	},
+};
+
+/* An element of the ring R_q (normal form) or the ring T_q (NTT form) */
+struct mldsa_ring_elem {
+	s32 x[N];
+};
+
+struct mldsa_verification_workspace {
+	/* SHAKE context for computing c, mu, and ctildeprime */
+	struct shake_ctx shake;
+	/* The fields in this union are used in their order of declaration. */
+	union {
+		/* The hash of the public key */
+		u8 tr[64];
+		/* The message representative mu */
+		u8 mu[64];
+		/* Encoded element of w'_1.  Real length is either 128 or 192 */
+		u8 w1_encoded[192];
+		/* The commitment hash.  Real length is params->ctilde_len */
+		u8 ctildeprime[64];
+	};
+	/* SHAKE context for generating the matrix A */
+	struct shake_ctx a_shake;
+	/*
+	 * An element of the matrix A generated from the public seed, or an
+	 * element of the vector t_1 decoded from the public key and pre-scaled
+	 * by 2^d.  Both are in NTT form.  To reduce memory usage, we generate
+	 * or decode these elements only as needed.
+	 */
+	union {
+		struct mldsa_ring_elem a;
+		struct mldsa_ring_elem t1_scaled;
+	};
+	/* The challenge c, generated from ctilde */
+	struct mldsa_ring_elem c;
+	/* A temporary element used during calculations */
+	struct mldsa_ring_elem tmp;
+
+	/* The following fields are variable-length. */
+
+	/* The signer's response vector */
+	struct mldsa_ring_elem z[/* l */];
+
+	/* The signer's hint vector */
+	/* u8 h[k][N]; */
+};
+
+/*
+ * Compute a * b * 2^-32 mod q.  a * b must be in the range [-2^31 * q, 2^31 *
+ * q) before reduction.  This uses Montgomery reduction with R=2^32 and produces
+ * a product in the range (-q, q), i.e. almost fully reduced but not quite.
+ */
+static inline s32 Zq_mult(s32 a, s32 b)
+{
+	/* Compute the unreduced product c. */
+	s64 c = (s64)a * b;
+
+	/* Compute d = (c mod 2^32) * (q^-1 mod 2^32). */
+	s32 d = (s32)c * QINV_MOD_R;
+
+	/*
+	 * Compute e = c - d * q.  This makes the low 32 bits zero, since
+	 *   c - (c * q^-1) * q mod 2^32
+	 * = c - c * (q^-1 * q) mod 2^32
+	 * = c - c * 1 mod 2^32
+	 * = c - c mod 2^32
+	 * = 0 mod 2^32
+	 */
+	s64 e = c - (s64)d * Q;
+
+	/* Finally, return e * 2^-32. */
+	return e >> 32;
+}
+
+/*
+ * Convert @w to its number-theoretically-transformed representation in-place.
+ * Reference: FIPS 204 Algorithm 41, NTT
+ *
+ * To prevent overflows of intermediate values, all input values should be in
+ * the range (-q, q).  The output values are in the range [-9*(q-1), 9*(q-1)].
+ */
+static void ntt(struct mldsa_ring_elem *w)
+{
+	for (int m = 0, len = 128; len >= 1; len /= 2) {
+		for (int start = 0; start < 256; start += 2 * len) {
+			const s32 z = zetas_times_2_32[++m];
+
+			for (int j = start; j < start + len; j++) {
+				s32 t = Zq_mult(z, w->x[j + len]);
+
+				w->x[j + len] = w->x[j] - t;
+				w->x[j] += t;
+			}
+		}
+	}
+}
+
+/*
+ * Convert @w from its number-theoretically-transformed representation in-place.
+ * Reference: FIPS 204 Algorithm 42, NTT^-1
+ *
+ * This also multiplies the values by 2^32, undoing an extra factor of 2^-32
+ * introduced earlier.
+ *
+ * To prevent overflows of intermediate values, all input values should be in
+ * the range (-q, q).  The output values are in the range (-q, q) as well.
+ */
+static void invntt_and_mul_2_32(struct mldsa_ring_elem *w)
+{
+	for (int m = 256, len = 1; len < 256; len *= 2) {
+		for (int start = 0; start < 256; start += 2 * len) {
+			const s32 z = -zetas_times_2_32[--m];
+
+			for (int j = start; j < start + len; j++) {
+				s32 t = w->x[j];
+
+				w->x[j] = t + w->x[j + len];
+				w->x[j + len] = Zq_mult(z, t - w->x[j + len]);
+			}
+		}
+	}
+	/*
+	 * Multiply by 2^32 * 256^-1.  2^32 cancels the factor of 2^-32 from
+	 * earlier Montgomery multiplications.  256^-1 is for NTT^-1.  This
+	 * itself uses Montgomery multiplication, so *another* 2^32 is needed.
+	 * Thus the actual multiplicand is 2^32 * 2^32 * 256^-1 mod q = 41978.
+	 */
+	for (int j = 0; j < 256; j++)
+		w->x[j] = Zq_mult(w->x[j], 41978);
+}
+
+/*
+ * Decode an element of t_1, the high d bits of t = As_1 + s_2.
+ * Multiply it by 2^d and convert it to NTT form.
+ */
+static const u8 *decode_t1_elem(struct mldsa_ring_elem *out,
+				const u8 *t1_encoded)
+{
+	for (int j = 0; j < N; j += 4, t1_encoded += 5) {
+		u32 v = get_unaligned_le32(t1_encoded);
+
+		out->x[j + 0] = ((v >> 0) & 0x3ff) << D;
+		out->x[j + 1] = ((v >> 10) & 0x3ff) << D;
+		out->x[j + 2] = ((v >> 20) & 0x3ff) << D;
+		out->x[j + 3] = ((v >> 30) | (t1_encoded[4] << 2)) << D;
+		static_assert(0x3ff << D < Q); /* All values < q. */
+	}
+	ntt(out);
+	return t1_encoded; /* Return updated pointer. */
+}
+
+/*
+ * Decode the signer's response vector 'z' from the signature.
+ * Reference: FIPS 204 Algorithm 27, sigDecode.
+ *
+ * This also validates that the coefficients of z are in range, corresponding
+ * the infinity norm check at the end of Algorithm 8, ML-DSA.Verify_internal.
+ *
+ * Finally, this also converts z to NTT form.
+ */
+static bool decode_z(struct mldsa_ring_elem z[/* l */], int l, s32 gamma1,
+		     int beta, const u8 **sig_ptr)
+{
+	const u8 *sig = *sig_ptr;
+
+	for (int i = 0; i < l; i++) {
+		if (l == 4) { /* ML-DSA-44? */
+			/* 18-bit coefficients: decode 4 from 9 bytes. */
+			for (int j = 0; j < N; j += 4, sig += 9) {
+				u64 v = get_unaligned_le64(sig);
+
+				z[i].x[j + 0] = (v >> 0) & 0x3ffff;
+				z[i].x[j + 1] = (v >> 18) & 0x3ffff;
+				z[i].x[j + 2] = (v >> 36) & 0x3ffff;
+				z[i].x[j + 3] = (v >> 54) | (sig[8] << 10);
+			}
+		} else {
+			/* 20-bit coefficients: decode 4 from 10 bytes. */
+			for (int j = 0; j < N; j += 4, sig += 10) {
+				u64 v = get_unaligned_le64(sig);
+
+				z[i].x[j + 0] = (v >> 0) & 0xfffff;
+				z[i].x[j + 1] = (v >> 20) & 0xfffff;
+				z[i].x[j + 2] = (v >> 40) & 0xfffff;
+				z[i].x[j + 3] =
+					(v >> 60) |
+					(get_unaligned_le16(&sig[8]) << 4);
+			}
+		}
+		for (int j = 0; j < N; j++) {
+			z[i].x[j] = gamma1 - z[i].x[j];
+			if (z[i].x[j] <= -(gamma1 - beta) ||
+			    z[i].x[j] >= gamma1 - beta)
+				return false;
+		}
+		ntt(&z[i]);
+	}
+	*sig_ptr = sig; /* Return updated pointer. */
+	return true;
+}
+
+/*
+ * Decode the hint vector 'h' from the signature.  It should have at most omega
+ * 1's.  Reference: FIPS 204 Algorithm 21, HintBitUnpack
+ */
+static bool decode_hint_vector(u8 h[/* k */][N], int k, int omega, const u8 *y)
+{
+	int index = 0;
+
+	memset(h, 0, k * N);
+	for (int i = 0; i < k; i++) {
+		int count = y[omega + i]; /* num 1's in elems 0 through i */
+		int prev = -1;
+
+		/* Cumulative count mustn't decrease or exceed omega. */
+		if (count < index || count > omega)
+			return false;
+		for (; index < count; index++) {
+			if (y[index] <= prev) /* Coefficients out of order? */
+				return false;
+			prev = y[index];
+			h[i][y[index]] = 1;
+		}
+	}
+	return mem_is_zero(&y[index], omega - index);
+}
+
+/*
+ * Use @seed to generate a ring element @c with coefficients in {-1, 0, 1},
+ * exactly @tau of them nonzero.  Reference: FIPS 204 Algorithm 29, SampleInBall
+ */
+static void sample_in_ball(struct mldsa_ring_elem *c, const u8 *seed,
+			   size_t seed_len, int tau, struct shake_ctx *shake)
+{
+	u64 signs;
+	u8 j;
+
+	shake256_init(shake);
+	shake_update(shake, seed, seed_len);
+	shake_squeeze(shake, (u8 *)&signs, sizeof(signs));
+	le64_to_cpus(&signs);
+	*c = (struct mldsa_ring_elem){};
+	for (int i = N - tau; i < N; i++, signs >>= 1) {
+		do {
+			shake_squeeze(shake, &j, 1);
+		} while (j > i);
+		c->x[i] = c->x[j];
+		c->x[j] = 1 - 2 * (s32)(signs & 1);
+	}
+}
+
+/*
+ * Expand the public seed @rho and @row_and_column into an element of T_q @out.
+ * Reference: FIPS 204 Algorithm 30, RejNTTPoly
+ */
+static void rej_ntt_poly(struct mldsa_ring_elem *out, const u8 rho[RHO_LEN],
+			 __le16 row_and_column, struct shake_ctx *shake)
+{
+	u8 block[SHAKE128_BLOCK_SIZE + 1]; /* 1 extra to allow 4-byte loads */
+
+	shake128_init(shake);
+	shake_update(shake, rho, RHO_LEN);
+	shake_update(shake, (u8 *)&row_and_column, sizeof(row_and_column));
+	for (int i = 0; i < N;) {
+		shake_squeeze(shake, block, SHAKE128_BLOCK_SIZE);
+		static_assert(SHAKE128_BLOCK_SIZE % 3 == 0);
+		for (int j = 0; j < SHAKE128_BLOCK_SIZE && i < N; j += 3) {
+			u32 x = get_unaligned_le32(&block[j]) & 0x7fffff;
+
+			if (x < Q) /* Ignore values >= q. */
+				out->x[i++] = x;
+		}
+	}
+}
+
+/*
+ * Return the high bits of r adjusted according to hint h.
+ * Reference: FIPS 204 Algorithm 40, UseHint
+ */
+static s32 use_hint(u8 h, s32 r, int k)
+{
+	s32 r0, r1;
+
+	r1 = (r + 127) >> 7;
+	if (k == 4) { /* ML-DSA-44? */
+		const s32 gamma2 = (Q - 1) / 88;
+		const s32 m = 44; /* (q - 1) / (2 * gamma2) */
+
+		/* Algorithm 36, Decompose; specialized for gamma2 = (q-1)/88 */
+		/* Formula borrowed from the reference implementation */
+		r1 = (r1 * 11275 + (1 << 23)) >> 24;
+		r1 ^= ((m - 1 - r1) >> 31) & r1;
+		r0 = r - r1 * 2 * gamma2;
+		r0 -= (((Q - 1) / 2 - r0) >> 31) & Q;
+
+		if (h == 0)
+			return r1;
+		if (r0 > 0)
+			return (r1 == m - 1) ? 0 : r1 + 1;
+		else
+			return (r1 == 0) ? m - 1 : r1 - 1;
+	} else {
+		const s32 gamma2 = (Q - 1) / 32;
+		const s32 m = 16; /* (q - 1) / (2 * gamma2) */
+
+		/* Algorithm 36, Decompose; specialized for gamma2 = (q-1)/32 */
+		/* Formula borrowed from the reference implementation */
+		r1 = ((r1 * 1025 + (1 << 21)) >> 22) & (m - 1);
+		r0 = r - r1 * 2 * gamma2;
+		r0 -= (((Q - 1) / 2 - r0) >> 31) & Q;
+
+		if (h == 0)
+			return r1;
+		if (r0 > 0)
+			return (r1 + 1) & (m - 1);
+		else
+			return (r1 - 1) & (m - 1);
+	}
+}
+
+/* Reference: FIPS 204 Section 6.3, "ML-DSA Verifying (Internal)" */
+int mldsa_verify(enum mldsa_alg alg, const u8 *sig, size_t sig_len,
+		 const u8 *msg, size_t msg_len, const u8 *pk, size_t pk_len)
+{
+	const struct mldsa_parameter_set *params = &mldsa_parameter_sets[alg];
+	const int k = params->k, l = params->l;
+	/* For now, this implementation doesn't support nonempty contexts. */
+	static const u8 msg_prefix[2] = { /* dom_sep= */ 0, /* ctx_len= */ 0 };
+	const u8 *ctilde; /* The signer's commitment hash */
+	const u8 *t1_encoded = &pk[RHO_LEN]; /* Next encoded element of t_1 */
+	u8 (*h)[N]; /* The signer's hint vector, length k */
+	int w1_pos;
+
+	/* Validate the public key and signature sizes. */
+	if (pk_len != params->pk_len || sig_len != params->sig_len)
+		return -EBADMSG;
+
+	/* Allocate the workspace, including variable-length fields. */
+	/* Size depends only on the ML-DSA parameter set, not the inputs. */
+	struct mldsa_verification_workspace *ws __free(kfree) = kmalloc(
+		sizeof(*ws) + (l * sizeof(ws->z[0])) + (k * N), GFP_KERNEL);
+	if (!ws)
+		return -ENOMEM;
+	h = (u8 (*)[N])&ws->z[l];
+
+	/* Decode the signature.  Reference: FIPS 204 Algorithm 27, sigDecode */
+	ctilde = sig;
+	sig += params->ctilde_len;
+	if (!decode_z(ws->z, l, params->gamma1, params->beta, &sig))
+		return -EBADMSG;
+	if (!decode_hint_vector(h, k, params->omega, sig))
+		return -EBADMSG;
+
+	/* Recreate the challenge c from the signer's commitment hash. */
+	sample_in_ball(&ws->c, ctilde, params->ctilde_len, params->tau,
+		       &ws->shake);
+	ntt(&ws->c);
+
+	/* Compute the message representative mu. */
+	shake256(pk, pk_len, ws->tr, sizeof(ws->tr));
+	shake256_init(&ws->shake);
+	shake_update(&ws->shake, ws->tr, sizeof(ws->tr));
+	shake_update(&ws->shake, msg_prefix, sizeof(msg_prefix));
+	shake_update(&ws->shake, msg, msg_len);
+	shake_squeeze(&ws->shake, ws->mu, sizeof(ws->mu));
+
+	/* Start computing ctildeprime = H(mu || w1Encode(w'_1)). */
+	shake256_init(&ws->shake);
+	shake_update(&ws->shake, ws->mu, sizeof(ws->mu));
+
+	/*
+	 * Compute the commitment w'_1 from A, z, c, t_1, and h.
+	 *
+	 * The computation is the same for each of the k rows.  Just do each row
+	 * before moving on to the next, resulting in only one loop over k.
+	 */
+	for (int i = 0; i < k; i++) {
+		/*
+		 * tmp = NTT(A) * NTT(z) * 2^-32
+		 * To reduce memory use, generate each element of A on-demand.
+		 * Note that each element of A is used only once.
+		 */
+		ws->tmp = (struct mldsa_ring_elem){};
+		for (int j = 0; j < l; j++) {
+			rej_ntt_poly(&ws->a, /* rho is first field of pk */ pk,
+				     cpu_to_le16((i << 8) | j), &ws->a_shake);
+			for (int n = 0; n < N; n++)
+				ws->tmp.x[n] +=
+					Zq_mult(ws->a.x[n], ws->z[j].x[n]);
+		}
+		/* Coefficients of tmp now have abs value <= l*(q-1). */
+
+		/* Decode the next element of t_1. */
+		t1_encoded = decode_t1_elem(&ws->t1_scaled, t1_encoded);
+
+		/*
+		 * tmp -= NTT(c) * NTT(t_1 * 2^d) * 2^-32
+		 *
+		 * Taking a conservative bound for the output of ntt(), the
+		 * multiplicands can have coefficients with absolute value up to
+		 * 9*q.  That corresponds to a product with absolute value 81*q.
+		 * That is within the limits of Zq_mult() which needs < ~256*q.
+		 */
+		for (int j = 0; j < N; j++)
+			ws->tmp.x[j] -= Zq_mult(ws->c.x[j], ws->t1_scaled.x[j]);
+
+		/*
+		 * Coefficients of tmp now have abs value <= (l+1)*(q-1).
+		 * To safely do the inverse NTT, reduce them to abs value < q.
+		 */
+		for (int j = 0; j < N; j++)
+			ws->tmp.x[j] = Zq_mult(ws->tmp.x[j], R_MOD_Q);
+
+		/* tmp = w'_Approx = NTT^-1(tmp) * 2^32 */
+		invntt_and_mul_2_32(&ws->tmp);
+
+		/* Reduce to [0, q), then tmp = w'_1 = UseHint(h, w'_Approx) */
+		for (int j = 0; j < N; j++) {
+			ws->tmp.x[j] += (ws->tmp.x[j] >> 31) & Q;
+			ws->tmp.x[j] = use_hint(h[i][j], ws->tmp.x[j], k);
+		}
+
+		/* w1Encode(w'_1) */
+		w1_pos = 0;
+		if (k == 4) { /* ML-DSA-44? */
+			/* 6 bits per value.  Pack 4 at a time. */
+			for (int j = 0; j < N; j += 4) {
+				u32 v = (ws->tmp.x[j + 0] << 0) |
+					(ws->tmp.x[j + 1] << 6) |
+					(ws->tmp.x[j + 2] << 12) |
+					(ws->tmp.x[j + 3] << 18);
+				ws->w1_encoded[w1_pos++] = v >> 0;
+				ws->w1_encoded[w1_pos++] = v >> 8;
+				ws->w1_encoded[w1_pos++] = v >> 16;
+			}
+		} else {
+			/* 4 bits per value.  Pack 2 at a time. */
+			for (int j = 0; j < N; j += 2)
+				ws->w1_encoded[w1_pos++] =
+					ws->tmp.x[j] | (ws->tmp.x[j + 1] << 4);
+		}
+		/* Update the hash with w1Encode(w'_1). */
+		shake_update(&ws->shake, ws->w1_encoded, w1_pos);
+	}
+
+	/* Finish computing ctildeprime. */
+	shake_squeeze(&ws->shake, ws->ctildeprime, params->ctilde_len);
+
+	/* Verify that ctilde == ctildeprime. */
+	if (memcmp(ws->ctildeprime, ctilde, params->ctilde_len) != 0)
+		return -EBADMSG;
+	/* ||z||_infinity < gamma1 - beta was already checked in decode_z(). */
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mldsa_verify);
+
+MODULE_DESCRIPTION("ML-DSA signature verification");
+MODULE_LICENSE("GPL");


