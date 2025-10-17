Return-Path: <keyrings+bounces-3231-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EB8BE945E
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 16:45:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8A1194E8642
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 14:44:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0415335094;
	Fri, 17 Oct 2025 14:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b8yRnV90"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3D533507F
	for <keyrings@vger.kernel.org>; Fri, 17 Oct 2025 14:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712239; cv=none; b=sM5yRXv1z15GQv61Klu6jCsdGSz1oa5PQK23+SJiCqmpoWmDnTayjheah5JDfrfYYmXnP9IxIuAedasNjkzp3uSe5b+C+AiOSIN1ytLjcGjTp1EhSAdUQxc+sEK0y8LsHGdxH7PY6rXLdWG5Q6hw0yo3MRq/rsOOprqwV/PEB+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712239; c=relaxed/simple;
	bh=tS166vLhMbttA/fBz5p6gT7g+q371ddtEzJX9QwV3vA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aXd1MCrp0cw5EyHhYajtWlvjQtclPze/J+2ctWZW+MBJ8FI/fZaC93xaLzYtlaNptYP9tbxgWX6Z/ebhHTpC6NP70WDjvrqPHhNdMgd/qVhBdK0CbPtkkwl5pRifpIDDfic5uPCVpHJgyHnKJ1Sz1cZ7ymup9hdL9UzW1vQ16mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b8yRnV90; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760712235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UJAK/toTiI3hNtpqVIiD0821rWNSKGGzWQMeX7WKN4M=;
	b=b8yRnV90SefvKsGnFS9aseLZS5OPj49AMIs8BCTiGLxnJ4Y1HF9WNzO0wQx/V2DhUos+fv
	CkMQQ8vCKk7GK8EB8bQ9rr1QDlt6YWDE8m6N9xY2zthSyRIxxel2pwe7s+IqeK+u0hIw7o
	hbVaBxnQyOXCU45JghnRfBxwsb/MMmE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-616-AhjoFFXePHiMk5fx-UZBQg-1; Fri,
 17 Oct 2025 10:43:51 -0400
X-MC-Unique: AhjoFFXePHiMk5fx-UZBQg-1
X-Mimecast-MFC-AGG-ID: AhjoFFXePHiMk5fx-UZBQg_1760712229
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 23835195608E;
	Fri, 17 Oct 2025 14:43:49 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.57])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5B98519560AD;
	Fri, 17 Oct 2025 14:43:45 +0000 (UTC)
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
Subject: [PATCH v6 05/17] lib/crypto: Add SHA3 kunit tests
Date: Fri, 17 Oct 2025 15:42:49 +0100
Message-ID: <20251017144311.817771-6-dhowells@redhat.com>
In-Reply-To: <20251017144311.817771-1-dhowells@redhat.com>
References: <20251017144311.817771-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add a SHA3 kunit test, providing the following:

 (*) A simple test of each of SHA3-224, SHA3-256, SHA3-384, SHA-512,
     SHAKE128 and SHAKE256.

 (*) NIST 0- and 1600-bit test vectors for SHAKE128 and SHAKE256.

 (*) Output tiling (multiple squeezing) tests for SHAKE256.

 (*) Standard hash template test for SHA3-256.

 (*) Standard benchmark test for SHA3-256.

gen-hash-testvecs.py is also modified in a number of ways:

 (1) To be able to generate SHAKE* testvecs because Python's hashlib
     requires the output digest size supplying for those two algorithms as
     they produce arbitrary length digests.

 (2) To change '-' in the algo name into '_' when generating symbols from
     it.

 (3) To not generate HMAC for SHA3 or SHAKE as support for that isn't
     currently implemented.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Jason A. Donenfeld <Jason@zx2c4.com>
cc: Ard Biesheuvel <ardb@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: Stephan Mueller <smueller@chronox.de>
cc: linux-crypto@vger.kernel.org

Changes
=======
v5)
 - Fix gen-hash-testvecs.py to correctly handle algo names that contain a
   dash.
 - Fix gen-hash-testvecs.py to not generate HMAC for SHA3-* or SHAKE* as
   these don't currently have HMAC variants.
 - Fix algo names to be correct.
 - Fix kunit module description as it now tests all SHA3 variants.
---
 lib/crypto/tests/Kconfig            |  11 +
 lib/crypto/tests/Makefile           |   1 +
 lib/crypto/tests/sha3_kunit.c       | 342 ++++++++++++++++++++++++++++
 lib/crypto/tests/sha3_testvecs.h    | 231 +++++++++++++++++++
 scripts/crypto/gen-hash-testvecs.py |  10 +-
 5 files changed, 593 insertions(+), 2 deletions(-)
 create mode 100644 lib/crypto/tests/sha3_kunit.c
 create mode 100644 lib/crypto/tests/sha3_testvecs.h

diff --git a/lib/crypto/tests/Kconfig b/lib/crypto/tests/Kconfig
index 578af717e13a..67538968edab 100644
--- a/lib/crypto/tests/Kconfig
+++ b/lib/crypto/tests/Kconfig
@@ -72,6 +72,17 @@ config CRYPTO_LIB_SHA512_KUNIT_TEST
 	  KUnit tests for the SHA-384 and SHA-512 cryptographic hash functions
 	  and their corresponding HMACs.
 
+config CRYPTO_LIB_SHA3_KUNIT_TEST
+	tristate "KUnit tests for SHA-3" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
+	select CRYPTO_LIB_BENCHMARK_VISIBLE
+	select CRYPTO_LIB_SHA3
+	help
+	  KUnit tests for the SHA3 cryptographic hash and XOF functions,
+	  including SHA3-224, SHA3-256, SHA3-384, SHA3-512, SHAKE128 and
+	  SHAKE256.
+
 config CRYPTO_LIB_BENCHMARK_VISIBLE
 	bool
 
diff --git a/lib/crypto/tests/Makefile b/lib/crypto/tests/Makefile
index a71fad19922b..9c61b29ac4ca 100644
--- a/lib/crypto/tests/Makefile
+++ b/lib/crypto/tests/Makefile
@@ -7,3 +7,4 @@ obj-$(CONFIG_CRYPTO_LIB_POLY1305_KUNIT_TEST) += poly1305_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_SHA1_KUNIT_TEST) += sha1_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_SHA256_KUNIT_TEST) += sha224_kunit.o sha256_kunit.o
 obj-$(CONFIG_CRYPTO_LIB_SHA512_KUNIT_TEST) += sha384_kunit.o sha512_kunit.o
+obj-$(CONFIG_CRYPTO_LIB_SHA3_KUNIT_TEST) += sha3_kunit.o
diff --git a/lib/crypto/tests/sha3_kunit.c b/lib/crypto/tests/sha3_kunit.c
new file mode 100644
index 000000000000..032fa3950afe
--- /dev/null
+++ b/lib/crypto/tests/sha3_kunit.c
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2025 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+#include <crypto/sha3.h>
+#include "sha3_testvecs.h"
+
+#define HASH		sha3_256
+#define HASH_CTX	sha3_256_ctx
+#define HASH_SIZE	SHA3_256_DIGEST_SIZE
+#define HASH_INIT	sha3_256_init
+#define HASH_UPDATE	sha3_256_update
+#define HASH_FINAL	sha3_256_final
+#include "hash-test-template.h"
+
+/*
+ * Sample message and the output generated for various algorithms by passing it
+ * into "openssl sha3-224" etc..
+ */
+static const u8 test_sha3_sample[] =
+	"The quick red fox jumped over the lazy brown dog!\n"
+	"The quick red fox jumped over the lazy brown dog!\n"
+	"The quick red fox jumped over the lazy brown dog!\n"
+	"The quick red fox jumped over the lazy brown dog!\n";
+
+static const u8 test_sha3_224[8 + SHA3_224_DIGEST_SIZE + 8] = {
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guard */
+	0xd6, 0xe8, 0xd8, 0x80, 0xfa, 0x42, 0x80, 0x70,
+	0x7e, 0x7f, 0xd7, 0xd2, 0xd7, 0x7a, 0x35, 0x65,
+	0xf0, 0x0b, 0x4f, 0x9f, 0x2a, 0x33, 0xca, 0x0a,
+	0xef, 0xa6, 0x4c, 0xb8,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard */
+};
+
+static const u8 test_sha3_256[8 + SHA3_256_DIGEST_SIZE + 8] = {
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guard */
+	0xdb, 0x3b, 0xb0, 0xb8, 0x8d, 0x15, 0x78, 0xe5,
+	0x78, 0x76, 0x8e, 0x39, 0x7e, 0x89, 0x86, 0xb9,
+	0x14, 0x3a, 0x1e, 0xe7, 0x96, 0x7c, 0xf3, 0x25,
+	0x70, 0xbd, 0xc3, 0xa9, 0xae, 0x63, 0x71, 0x1d,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard */
+};
+
+static const u8 test_sha3_384[8 + SHA3_384_DIGEST_SIZE + 8] = {
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guard */
+	0x2d, 0x4b, 0x29, 0x85, 0x19, 0x94, 0xaa, 0x31,
+	0x9b, 0x04, 0x9d, 0x6e, 0x79, 0x66, 0xc7, 0x56,
+	0x8a, 0x2e, 0x99, 0x84, 0x06, 0xcf, 0x10, 0x2d,
+	0xec, 0xf0, 0x03, 0x04, 0x1f, 0xd5, 0x99, 0x63,
+	0x2f, 0xc3, 0x2b, 0x0d, 0xd9, 0x45, 0xf7, 0xbb,
+	0x0a, 0xc3, 0x46, 0xab, 0xfe, 0x4d, 0x94, 0xc2,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard */
+};
+
+static const u8 test_sha3_512[8 + SHA3_512_DIGEST_SIZE + 8] = {
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guard */
+	0xdd, 0x71, 0x3b, 0x44, 0xb6, 0x6c, 0xd7, 0x78,
+	0xe7, 0x93, 0xa1, 0x4c, 0xd7, 0x24, 0x16, 0xf1,
+	0xfd, 0xa2, 0x82, 0x4e, 0xed, 0x59, 0xe9, 0x83,
+	0x15, 0x38, 0x89, 0x7d, 0x39, 0x17, 0x0c, 0xb2,
+	0xcf, 0x12, 0x80, 0x78, 0xa1, 0x78, 0x41, 0xeb,
+	0xed, 0x21, 0x4c, 0xa4, 0x4a, 0x5f, 0x30, 0x1a,
+	0x70, 0x98, 0x4f, 0x14, 0xa2, 0xd1, 0x64, 0x1b,
+	0xc2, 0x0a, 0xff, 0x3b, 0xe8, 0x26, 0x41, 0x8f,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard */
+};
+
+static const u8 test_shake128[8 + SHAKE128_DEFAULT_SIZE + 8] = {
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guard */
+	0x41, 0xd6, 0xb8, 0x9c, 0xf8, 0xe8, 0x54, 0xf2,
+	0x5c, 0xde, 0x51, 0x12, 0xaf, 0x9e, 0x0d, 0x91,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard */
+};
+
+static const u8 test_shake256[8 + SHAKE256_DEFAULT_SIZE + 8] = {
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-before guard */
+	0xab, 0x06, 0xd4, 0xf9, 0x8b, 0xfd, 0xb2, 0xc4,
+	0xfe, 0xf1, 0xcc, 0xe2, 0x40, 0x45, 0xdd, 0x15,
+	0xcb, 0xdd, 0x02, 0x8d, 0xb7, 0x9f, 0x1e, 0x67,
+	0xd6, 0x7f, 0x98, 0x5e, 0x1b, 0x19, 0xf8, 0x01,
+	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* Write-after guard */
+};
+
+static void test_sha3_224_basic(struct kunit *test)
+{
+	u8 out[8 + SHA3_224_DIGEST_SIZE + 8];
+
+	BUILD_BUG_ON(sizeof(out) != sizeof(test_sha3_224));
+
+	memset(out, 0, sizeof(out));
+	sha3_224(test_sha3_sample, sizeof(test_sha3_sample) - 1, out + 8);
+
+	KUNIT_ASSERT_MEMEQ_MSG(test, out, test_sha3_224, sizeof(test_sha3_224),
+			       "SHA3-224 gives wrong output");
+}
+
+static void test_sha3_256_basic(struct kunit *test)
+{
+	u8 out[8 + SHA3_256_DIGEST_SIZE + 8];
+
+	BUILD_BUG_ON(sizeof(out) != sizeof(test_sha3_256));
+
+	memset(out, 0, sizeof(out));
+	sha3_256(test_sha3_sample, sizeof(test_sha3_sample) - 1, out + 8);
+
+	KUNIT_ASSERT_MEMEQ_MSG(test, out, test_sha3_256, sizeof(test_sha3_256),
+			       "SHA3-256 gives wrong output");
+}
+
+static void test_sha3_384_basic(struct kunit *test)
+{
+	u8 out[8 + SHA3_384_DIGEST_SIZE + 8];
+
+	BUILD_BUG_ON(sizeof(out) != sizeof(test_sha3_384));
+
+	memset(out, 0, sizeof(out));
+	sha3_384(test_sha3_sample, sizeof(test_sha3_sample) - 1, out + 8);
+
+	KUNIT_ASSERT_MEMEQ_MSG(test, out, test_sha3_384, sizeof(test_sha3_384),
+			       "SHA3-384 gives wrong output");
+}
+
+static void test_sha3_512_basic(struct kunit *test)
+{
+	u8 out[8 + SHA3_512_DIGEST_SIZE + 8];
+
+	BUILD_BUG_ON(sizeof(out) != sizeof(test_sha3_512));
+
+	memset(out, 0, sizeof(out));
+	sha3_512(test_sha3_sample, sizeof(test_sha3_sample) - 1, out + 8);
+
+	KUNIT_ASSERT_MEMEQ_MSG(test, out, test_sha3_512, sizeof(test_sha3_512),
+			       "SHA3-512 gives wrong output");
+}
+
+static void test_shake128_basic(struct kunit *test)
+{
+	u8 out[8 + SHAKE128_DEFAULT_SIZE + 8];
+
+	BUILD_BUG_ON(sizeof(out) != sizeof(test_shake128));
+
+	memset(out, 0, sizeof(out));
+	shake128(test_sha3_sample, sizeof(test_sha3_sample) - 1,
+		 out + 8, sizeof(out) - 16);
+
+	KUNIT_ASSERT_MEMEQ_MSG(test, out, test_shake128, sizeof(test_shake128),
+			       "SHAKE128 gives wrong output");
+}
+
+static void test_shake256_basic(struct kunit *test)
+{
+	u8 out[8 + SHAKE256_DEFAULT_SIZE + 8];
+
+	BUILD_BUG_ON(sizeof(out) != sizeof(test_shake256));
+
+	memset(out, 0, sizeof(out));
+	shake256(test_sha3_sample, sizeof(test_sha3_sample) - 1,
+		 out + 8, sizeof(out) - 16);
+
+	KUNIT_ASSERT_MEMEQ_MSG(test, out, test_shake256, sizeof(test_shake256),
+			       "SHAKE256 gives wrong output");
+}
+
+/*
+ * Usable NIST tests.
+ *
+ * From: https://csrc.nist.gov/projects/cryptographic-standards-and-guidelines/example-values
+ */
+static const u8 test_nist_1600_sample[] = {
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3,
+	0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3, 0xa3
+};
+
+static const u8 test_shake128_nist_0[] = {
+	0x7f, 0x9c, 0x2b, 0xa4, 0xe8, 0x8f, 0x82, 0x7d,
+	0x61, 0x60, 0x45, 0x50, 0x76, 0x05, 0x85, 0x3e
+};
+
+static const u8 test_shake128_nist_1600[] = {
+	0x13, 0x1a, 0xb8, 0xd2, 0xb5, 0x94, 0x94, 0x6b,
+	0x9c, 0x81, 0x33, 0x3f, 0x9b, 0xb6, 0xe0, 0xce,
+};
+
+static const u8 test_shake256_nist_0[] = {
+	0x46, 0xb9, 0xdd, 0x2b, 0x0b, 0xa8, 0x8d, 0x13,
+	0x23, 0x3b, 0x3f, 0xeb, 0x74, 0x3e, 0xeb, 0x24,
+	0x3f, 0xcd, 0x52, 0xea, 0x62, 0xb8, 0x1b, 0x82,
+	0xb5, 0x0c, 0x27, 0x64, 0x6e, 0xd5, 0x76, 0x2f
+};
+
+static const u8 test_shake256_nist_1600[] = {
+	0xcd, 0x8a, 0x92, 0x0e, 0xd1, 0x41, 0xaa, 0x04,
+	0x07, 0xa2, 0x2d, 0x59, 0x28, 0x86, 0x52, 0xe9,
+	0xd9, 0xf1, 0xa7, 0xee, 0x0c, 0x1e, 0x7c, 0x1c,
+	0xa6, 0x99, 0x42, 0x4d, 0xa8, 0x4a, 0x90, 0x4d,
+};
+
+static void test_shake128_nist(struct kunit *test)
+{
+	u8 out[SHAKE128_DEFAULT_SIZE];
+
+	shake128("", 0, out, sizeof(out));
+	KUNIT_ASSERT_MEMEQ_MSG(test, out, test_shake128_nist_0, sizeof(out),
+			       "SHAKE128 gives wrong output for NIST.0");
+
+	shake128(test_nist_1600_sample, sizeof(test_nist_1600_sample),
+		 out, sizeof(out));
+	KUNIT_ASSERT_MEMEQ_MSG(test, out, test_shake128_nist_1600, sizeof(out),
+			       "SHAKE128 gives wrong output for NIST.1600");
+}
+
+static void test_shake256_nist(struct kunit *test)
+{
+	u8 out[SHAKE256_DEFAULT_SIZE];
+
+	shake256("", 0, out, sizeof(out));
+	KUNIT_ASSERT_MEMEQ_MSG(test, out, test_shake256_nist_0, sizeof(out),
+			       "SHAKE256 gives wrong output for NIST.0");
+
+	shake256(test_nist_1600_sample, sizeof(test_nist_1600_sample),
+		 out, sizeof(out));
+	KUNIT_ASSERT_MEMEQ_MSG(test, out, test_shake256_nist_1600, sizeof(out),
+			       "SHAKE256 gives wrong output for NIST.1600");
+}
+
+/*
+ * Output tiling test of SHAKE256; equal output tiles barring the last.  A
+ * series of squeezings of the same context should, if laid end-to-end, match a
+ * single squeezing of the combined size.
+ */
+static void test_shake256_tiling(struct kunit *test)
+{
+	struct shake256_ctx ctx;
+	u8 out[8 + SHA3_512_DIGEST_SIZE + 8];
+
+	for (int tile_size = 1; tile_size < SHAKE256_DEFAULT_SIZE; tile_size++) {
+		int left = SHAKE256_DEFAULT_SIZE;
+		u8 *p = out + 8;
+
+		memset(out, 0, sizeof(out));
+		shake256_init(&ctx);
+		shake256_update(&ctx, test_sha3_sample, sizeof(test_sha3_sample) - 1);
+		while (left > 0) {
+			int part = umin(tile_size, left);
+
+			shake256_squeeze(&ctx, p, part);
+			p += part;
+			left -= part;
+		}
+
+		KUNIT_ASSERT_MEMEQ_MSG(test, out, test_shake256, sizeof(test_shake256),
+				       "SHAKE tile %u gives wrong output", tile_size);
+	}
+}
+
+/*
+ * Output tiling test of SHAKE256; output tiles getting gradually smaller and
+ * then cycling round to medium sized ones.  A series of squeezings of the same
+ * context should, if laid end-to-end, match a single squeezing of the combined
+ * size.
+ */
+static void test_shake256_tiling2(struct kunit *test)
+{
+	struct shake256_ctx ctx;
+	u8 out[8 + SHA3_512_DIGEST_SIZE + 8];
+
+	for (int first_tile_size = 3;
+	     first_tile_size < SHAKE256_DEFAULT_SIZE;
+	     first_tile_size++) {
+		int tile_size = first_tile_size;
+		int left = SHAKE256_DEFAULT_SIZE;
+		u8 *p = out + 8;
+
+		memset(out, 0, sizeof(out));
+		shake256_init(&ctx);
+		shake256_update(&ctx, test_sha3_sample, sizeof(test_sha3_sample) - 1);
+		while (left > 0) {
+			int part = umin(tile_size, left);
+
+			shake256_squeeze(&ctx, p, part);
+			p += part;
+			left -= part;
+			tile_size--;
+			if (tile_size < 1)
+				tile_size = 5;
+		}
+
+		KUNIT_ASSERT_MEMEQ_MSG(test, out, test_shake256, sizeof(test_shake256),
+				       "SHAKE tile %u gives wrong output", tile_size);
+	}
+}
+
+static struct kunit_case hash_test_cases[] = {
+	KUNIT_CASE(test_sha3_224_basic),
+	KUNIT_CASE(test_sha3_256_basic),
+	KUNIT_CASE(test_sha3_384_basic),
+	KUNIT_CASE(test_sha3_512_basic),
+	KUNIT_CASE(test_shake128_basic),
+	KUNIT_CASE(test_shake256_basic),
+	KUNIT_CASE(test_shake128_nist),
+	KUNIT_CASE(test_shake256_nist),
+	KUNIT_CASE(test_shake256_tiling),
+	KUNIT_CASE(test_shake256_tiling2),
+	HASH_KUNIT_CASES,
+	KUNIT_CASE(benchmark_hash),
+	{},
+};
+
+static struct kunit_suite hash_test_suite = {
+	.name = "sha3",
+	.test_cases = hash_test_cases,
+	.suite_init = hash_suite_init,
+	.suite_exit = hash_suite_exit,
+};
+kunit_test_suite(hash_test_suite);
+
+MODULE_DESCRIPTION("KUnit tests and benchmark for SHA3");
+MODULE_LICENSE("GPL");
diff --git a/lib/crypto/tests/sha3_testvecs.h b/lib/crypto/tests/sha3_testvecs.h
new file mode 100644
index 000000000000..9c4c403cc6e0
--- /dev/null
+++ b/lib/crypto/tests/sha3_testvecs.h
@@ -0,0 +1,231 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* This file was generated by: ./scripts/crypto/gen-hash-testvecs.py sha3-256 */
+
+static const struct {
+	size_t data_len;
+	u8 digest[SHA3_256_DIGEST_SIZE];
+} hash_testvecs[] = {
+	{
+		.data_len = 0,
+		.digest = {
+			0xa7, 0xff, 0xc6, 0xf8, 0xbf, 0x1e, 0xd7, 0x66,
+			0x51, 0xc1, 0x47, 0x56, 0xa0, 0x61, 0xd6, 0x62,
+			0xf5, 0x80, 0xff, 0x4d, 0xe4, 0x3b, 0x49, 0xfa,
+			0x82, 0xd8, 0x0a, 0x4b, 0x80, 0xf8, 0x43, 0x4a,
+		},
+	},
+	{
+		.data_len = 1,
+		.digest = {
+			0x11, 0x03, 0xe7, 0x84, 0x51, 0x50, 0x86, 0x35,
+			0x71, 0x8a, 0x70, 0xe3, 0xc4, 0x26, 0x7b, 0x21,
+			0x02, 0x13, 0xa0, 0x81, 0xe8, 0xe6, 0x14, 0x25,
+			0x07, 0x34, 0xe5, 0xc5, 0x40, 0x06, 0xf2, 0x8b,
+		},
+	},
+	{
+		.data_len = 2,
+		.digest = {
+			0x2f, 0x6f, 0x6d, 0x47, 0x48, 0x52, 0x11, 0xb9,
+			0xe4, 0x3d, 0xc8, 0x71, 0xcf, 0xb2, 0xee, 0xae,
+			0x5b, 0xf4, 0x12, 0x84, 0x5b, 0x1c, 0xec, 0x6c,
+			0xc1, 0x66, 0x88, 0xaa, 0xc3, 0x40, 0xbd, 0x7e,
+		},
+	},
+	{
+		.data_len = 3,
+		.digest = {
+			0xec, 0x02, 0xe8, 0x81, 0x4f, 0x84, 0x41, 0x69,
+			0x06, 0xd8, 0xdc, 0x1d, 0x01, 0x78, 0xd7, 0xcb,
+			0x39, 0xdf, 0xd3, 0x12, 0x1c, 0x99, 0xfd, 0xf3,
+			0x5c, 0x83, 0xc9, 0xc2, 0x7a, 0x7b, 0x6a, 0x05,
+		},
+	},
+	{
+		.data_len = 16,
+		.digest = {
+			0xff, 0x6f, 0xc3, 0x41, 0xc3, 0x5f, 0x34, 0x6d,
+			0xa7, 0xdf, 0x3e, 0xc2, 0x8b, 0x29, 0xb6, 0xf1,
+			0xf8, 0x67, 0xfd, 0xcd, 0xb1, 0x9f, 0x38, 0x08,
+			0x1d, 0x8d, 0xd9, 0xc2, 0x43, 0x66, 0x18, 0x6c,
+		},
+	},
+	{
+		.data_len = 32,
+		.digest = {
+			0xe4, 0xb1, 0x06, 0x17, 0xf8, 0x8b, 0x91, 0x95,
+			0xe7, 0x57, 0x66, 0xac, 0x08, 0xb2, 0x03, 0x3e,
+			0xf7, 0x84, 0x1f, 0xe3, 0x25, 0xa3, 0x11, 0xd2,
+			0x11, 0xa4, 0x78, 0x74, 0x2a, 0x43, 0x20, 0xa5,
+		},
+	},
+	{
+		.data_len = 48,
+		.digest = {
+			0xeb, 0x57, 0x5f, 0x20, 0xa3, 0x6b, 0xc7, 0xb4,
+			0x66, 0x2a, 0xa0, 0x30, 0x3b, 0x52, 0x00, 0xc9,
+			0xce, 0x6a, 0xd8, 0x1e, 0xbe, 0xed, 0xa1, 0xd1,
+			0xbe, 0x63, 0xc7, 0xe1, 0xe2, 0x66, 0x67, 0x0c,
+		},
+	},
+	{
+		.data_len = 49,
+		.digest = {
+			0xf0, 0x67, 0xad, 0x66, 0xbe, 0xec, 0x5a, 0xfd,
+			0x29, 0xd2, 0x4f, 0x1d, 0xb2, 0x24, 0xb8, 0x90,
+			0x05, 0x28, 0x0e, 0x66, 0x67, 0x74, 0x2d, 0xee,
+			0x66, 0x25, 0x11, 0xd1, 0x76, 0xa2, 0xfc, 0x3a,
+		},
+	},
+	{
+		.data_len = 63,
+		.digest = {
+			0x57, 0x56, 0x21, 0xb3, 0x2d, 0x2d, 0xe1, 0x9d,
+			0xbf, 0x2c, 0x82, 0xa8, 0xad, 0x7e, 0x6c, 0x46,
+			0xfb, 0x30, 0xeb, 0xce, 0xcf, 0xed, 0x2d, 0x65,
+			0xe7, 0xe4, 0x96, 0x69, 0xe0, 0x48, 0xd2, 0xb6,
+		},
+	},
+	{
+		.data_len = 64,
+		.digest = {
+			0x7b, 0xba, 0x67, 0x15, 0xe5, 0x21, 0xc4, 0x69,
+			0xd3, 0xef, 0x5c, 0x97, 0x9f, 0x5b, 0xba, 0x9c,
+			0xfa, 0x55, 0x64, 0xec, 0xb5, 0x37, 0x53, 0x1b,
+			0x3f, 0x4c, 0x0a, 0xed, 0x51, 0x98, 0x2b, 0x52,
+		},
+	},
+	{
+		.data_len = 65,
+		.digest = {
+			0x44, 0xb6, 0x6b, 0x83, 0x09, 0x83, 0x55, 0x83,
+			0xde, 0x1f, 0xcc, 0x33, 0xef, 0xdc, 0x05, 0xbb,
+			0x3b, 0x63, 0x76, 0x45, 0xe4, 0x8e, 0x14, 0x7a,
+			0x2d, 0xae, 0x90, 0xce, 0x68, 0xc3, 0xa4, 0xf2,
+		},
+	},
+	{
+		.data_len = 127,
+		.digest = {
+			0x50, 0x3e, 0x99, 0x4e, 0x28, 0x2b, 0xc9, 0xf4,
+			0xf5, 0xeb, 0x2b, 0x16, 0x04, 0x2d, 0xf5, 0xbe,
+			0xc0, 0x91, 0x41, 0x2a, 0x8e, 0x69, 0x5e, 0x39,
+			0x53, 0x2c, 0xc1, 0x18, 0xa5, 0xeb, 0xd8, 0xda,
+		},
+	},
+	{
+		.data_len = 128,
+		.digest = {
+			0x90, 0x0b, 0xa6, 0x92, 0x84, 0x30, 0xaf, 0xee,
+			0x38, 0x59, 0x83, 0x83, 0xe9, 0xfe, 0xab, 0x86,
+			0x79, 0x1b, 0xcd, 0xe7, 0x0a, 0x0f, 0x58, 0x53,
+			0x36, 0xab, 0x12, 0xe1, 0x5c, 0x97, 0xc1, 0xfb,
+		},
+	},
+	{
+		.data_len = 129,
+		.digest = {
+			0x2b, 0x52, 0x1e, 0x54, 0xbe, 0x38, 0x4c, 0x3e,
+			0x73, 0x37, 0x18, 0xf5, 0x25, 0x2c, 0xc8, 0xc7,
+			0xda, 0x7e, 0xb6, 0x47, 0x9d, 0xf4, 0x46, 0xce,
+			0xfa, 0x80, 0x20, 0x6b, 0xbd, 0xfd, 0x2a, 0xd8,
+		},
+	},
+	{
+		.data_len = 256,
+		.digest = {
+			0x45, 0xf0, 0xf5, 0x9b, 0xd9, 0x91, 0x26, 0xd5,
+			0x91, 0x3b, 0xf8, 0x87, 0x8b, 0x34, 0x02, 0x31,
+			0x64, 0xab, 0xf4, 0x1c, 0x6e, 0x34, 0x72, 0xdf,
+			0x32, 0x6d, 0xe5, 0xd2, 0x67, 0x5e, 0x86, 0x93,
+		},
+	},
+	{
+		.data_len = 511,
+		.digest = {
+			0xb3, 0xaf, 0x71, 0x64, 0xfa, 0xd4, 0xf1, 0x07,
+			0x38, 0xef, 0x04, 0x8e, 0x89, 0xf4, 0x02, 0xd2,
+			0xa5, 0xaf, 0x3b, 0xf5, 0x67, 0x56, 0xcf, 0xa9,
+			0x8e, 0x43, 0xf5, 0xb5, 0xe3, 0x91, 0x8e, 0xe7,
+		},
+	},
+	{
+		.data_len = 513,
+		.digest = {
+			0x51, 0xac, 0x0a, 0x65, 0xb7, 0x96, 0x20, 0xcf,
+			0x88, 0xf6, 0x97, 0x35, 0x89, 0x0d, 0x31, 0x0f,
+			0xbe, 0x17, 0xbe, 0x62, 0x03, 0x67, 0xc0, 0xee,
+			0x4f, 0xc1, 0xe3, 0x7f, 0x6f, 0xab, 0xac, 0xb4,
+		},
+	},
+	{
+		.data_len = 1000,
+		.digest = {
+			0x7e, 0xea, 0xa8, 0xd7, 0xde, 0x20, 0x1b, 0x58,
+			0x24, 0xd8, 0x26, 0x40, 0x36, 0x5f, 0x3f, 0xaa,
+			0xe5, 0x5a, 0xea, 0x98, 0x58, 0xd4, 0xd6, 0xfc,
+			0x20, 0x4c, 0x5c, 0x4f, 0xaf, 0x56, 0xc7, 0xc3,
+		},
+	},
+	{
+		.data_len = 3333,
+		.digest = {
+			0x61, 0xb1, 0xb1, 0x3e, 0x0e, 0x7e, 0x90, 0x3d,
+			0x31, 0x54, 0xbd, 0xc9, 0x0d, 0x53, 0x62, 0xf1,
+			0xcd, 0x18, 0x80, 0xf9, 0x91, 0x75, 0x41, 0xb3,
+			0x51, 0x39, 0x57, 0xa7, 0xa8, 0x1e, 0xfb, 0xc9,
+		},
+	},
+	{
+		.data_len = 4096,
+		.digest = {
+			0xab, 0x29, 0xda, 0x10, 0xc4, 0x11, 0x2d, 0x5c,
+			0xd1, 0xce, 0x1c, 0x95, 0xfa, 0xc6, 0xc7, 0xb0,
+			0x1b, 0xd1, 0xdc, 0x6f, 0xa0, 0x9d, 0x1b, 0x23,
+			0xfb, 0x6e, 0x90, 0x97, 0xd0, 0x75, 0x44, 0x7a,
+		},
+	},
+	{
+		.data_len = 4128,
+		.digest = {
+			0x02, 0x45, 0x95, 0xf4, 0x19, 0xb5, 0x93, 0x29,
+			0x90, 0xf2, 0x63, 0x3f, 0x89, 0xe8, 0xa5, 0x31,
+			0x76, 0xf2, 0x89, 0x79, 0x66, 0xd3, 0x96, 0xdf,
+			0x33, 0xd1, 0xa6, 0x17, 0x73, 0xb1, 0xd0, 0x45,
+		},
+	},
+	{
+		.data_len = 4160,
+		.digest = {
+			0xd1, 0x8e, 0x22, 0xea, 0x44, 0x87, 0x6e, 0x9d,
+			0xfb, 0x36, 0x02, 0x20, 0x63, 0xb7, 0x69, 0x45,
+			0x25, 0x41, 0x69, 0xe0, 0x9b, 0x87, 0xcf, 0xa3,
+			0x51, 0xbb, 0xfc, 0x8d, 0xf7, 0x29, 0xa7, 0xea,
+		},
+	},
+	{
+		.data_len = 4224,
+		.digest = {
+			0x11, 0x86, 0x7d, 0x84, 0xf9, 0x8c, 0x6e, 0xc4,
+			0x64, 0x36, 0xc6, 0xf3, 0x42, 0x92, 0x31, 0x2b,
+			0x1e, 0x12, 0xe6, 0x4d, 0xbe, 0xfa, 0x77, 0x3f,
+			0x89, 0x41, 0x33, 0x58, 0x1c, 0x98, 0x16, 0x0a,
+		},
+	},
+	{
+		.data_len = 16384,
+		.digest = {
+			0xb2, 0xba, 0x0c, 0x8c, 0x9d, 0xbb, 0x1e, 0xb0,
+			0x03, 0xb5, 0xdf, 0x4f, 0xf5, 0x35, 0xdb, 0xec,
+			0x60, 0xf2, 0x5b, 0xb6, 0xd0, 0x49, 0xd3, 0xed,
+			0x55, 0xc0, 0x7a, 0xd7, 0xaf, 0xa1, 0xea, 0x53,
+		},
+	},
+};
+
+static const u8 hash_testvec_consolidated[SHA3_256_DIGEST_SIZE] = {
+	0x3b, 0x33, 0x67, 0xf8, 0xea, 0x92, 0x78, 0x62,
+	0xdd, 0xbe, 0x72, 0x15, 0xbd, 0x6f, 0xfa, 0xe5,
+	0x5e, 0xab, 0x9f, 0xb1, 0xe4, 0x23, 0x7c, 0x2c,
+	0x80, 0xcf, 0x09, 0x75, 0xf8, 0xe2, 0xfa, 0x30,
+};
diff --git a/scripts/crypto/gen-hash-testvecs.py b/scripts/crypto/gen-hash-testvecs.py
index fc063f2ee95f..cb6f6cfbedeb 100755
--- a/scripts/crypto/gen-hash-testvecs.py
+++ b/scripts/crypto/gen-hash-testvecs.py
@@ -61,6 +61,10 @@ def hash_update(ctx, data):
     ctx.update(data)
 
 def hash_final(ctx):
+    if ctx.name == "shake_128":
+        return ctx.digest(16)
+    if ctx.name == "shake_256":
+        return ctx.digest(32)
     return ctx.digest()
 
 def compute_hash(alg, data):
@@ -87,7 +91,7 @@ def print_c_struct_u8_array_field(name, value):
 def alg_digest_size_const(alg):
     if alg == 'blake2s':
         return 'BLAKE2S_HASH_SIZE'
-    return f'{alg.upper()}_DIGEST_SIZE'
+    return f'{alg.upper().replace('-', '_')}_DIGEST_SIZE'
 
 def gen_unkeyed_testvecs(alg):
     print('')
@@ -122,7 +126,7 @@ def gen_hmac_testvecs(alg):
         ctx.update(mac)
     print_static_u8_array_definition(
             f'hmac_testvec_consolidated[{alg.upper()}_DIGEST_SIZE]',
-            ctx.digest())
+            hash_final(ctx))
 
 BLAKE2S_KEY_SIZE = 32
 BLAKE2S_HASH_SIZE = 32
@@ -164,5 +168,7 @@ if alg == 'blake2s':
     gen_additional_blake2s_testvecs()
 elif alg == 'poly1305':
     gen_additional_poly1305_testvecs()
+elif alg.startswith('sha3-') or alg.startswith('shake'):
+    pass # no HMAC
 else:
     gen_hmac_testvecs(alg)


