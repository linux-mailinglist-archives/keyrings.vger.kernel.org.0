Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07AA2456A93
	for <lists+keyrings@lfdr.de>; Fri, 19 Nov 2021 07:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232922AbhKSHCa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 19 Nov 2021 02:02:30 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.83]:27531 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232589AbhKSHC2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 19 Nov 2021 02:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637305164;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=e9PSTVVwUetqJwcMqAV3hkxvzTITtObwWtsKs4Wuj4k=;
    b=Wfdld9GrIJ4mtU0K+G2I9/x4yot69C8Ti1u2jX+cVRRkNdoc2O0rh1jJjesFzatomR
    y4Ek4A0WmhLE0SDp8hqTqWHaa1t7biBvtLxfArwCYmKU6H3sTk9lyw+Kuzsym4t9hPxT
    vaZSSwL8d+l+wgJL6IeDHpIiIvgcg3rhMHdjuyVhAArj1o4tCPr1s0TOewdHv0bwLHZQ
    K7irzVqg4K1HnFb8IiHLD/8TKJMfjwfWcbntS02RsfuCjUjcW3MJcH4EjrcDt+nbPYS7
    R9atNVz86GE1penHv9RXwNfVg1J1b0HLKO7H4H3gvu3Gj/AAwX1kLm89zWsDWo+o2fAo
    3dAg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXPZJ/SWpaI="
X-RZG-CLASS-ID: mo00
Received: from positron.chronox.de
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id U02dfbxAJ6xOu40
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 19 Nov 2021 07:59:24 +0100 (CET)
From:   Stephan =?ISO-8859-1?Q?M=FCller?= <smueller@chronox.de>
To:     herbert@gondor.apana.org.au
Cc:     ebiggers@kernel.org, jarkko@kernel.org,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        dhowells@redhat.com, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
        simo@redhat.com
Subject: [PATCH v4 1/4] crypto: Add key derivation self-test support code
Date:   Fri, 19 Nov 2021 07:55:33 +0100
Message-ID: <2156033.vFx2qVVIhK@positron.chronox.de>
In-Reply-To: <4642773.OV4Wx5bFTl@positron.chronox.de>
References: <4642773.OV4Wx5bFTl@positron.chronox.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

As a preparation to add the key derivation implementations, the
self-test data structure definition and the common test code is made
available.

The test framework follows the testing applied by the NIST CAVP test
approach.

The structure of the test code follows the implementations found in
crypto/testmgr.c|h. In case the KDF implementations will be made
available via a kernel crypto API templates, the test code is intended
to be merged into testmgr.c|h.

Signed-off-by: Stephan Mueller <smueller@chronox.de>
---
 include/crypto/internal/kdf_selftest.h | 71 ++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 include/crypto/internal/kdf_selftest.h

diff --git a/include/crypto/internal/kdf_selftest.h b/include/crypto/internal/kdf_selftest.h
new file mode 100644
index 000000000000..4d03d2af57b7
--- /dev/null
+++ b/include/crypto/internal/kdf_selftest.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+/*
+ * Copyright (C) 2021, Stephan Mueller <smueller@chronox.de>
+ */
+
+#ifndef _CRYPTO_KDF_SELFTEST_H
+#define _CRYPTO_KDF_SELFTEST_H
+
+#include <crypto/hash.h>
+#include <linux/uio.h>
+
+struct kdf_testvec {
+	unsigned char *key;
+	size_t keylen;
+	unsigned char *ikm;
+	size_t ikmlen;
+	struct kvec info;
+	unsigned char *expected;
+	size_t expectedlen;
+};
+
+static inline int
+kdf_test(const struct kdf_testvec *test, const char *name,
+	 int (*crypto_kdf_setkey)(struct crypto_shash *kmd,
+				  const u8 *key, size_t keylen,
+				  const u8 *ikm, size_t ikmlen),
+	 int (*crypto_kdf_generate)(struct crypto_shash *kmd,
+				    const struct kvec *info,
+				    unsigned int info_nvec,
+				    u8 *dst, unsigned int dlen))
+{
+	struct crypto_shash *kmd;
+	int ret;
+	u8 *buf = kzalloc(test->expectedlen, GFP_KERNEL);
+
+	if (!buf)
+		return -ENOMEM;
+
+	kmd = crypto_alloc_shash(name, 0, 0);
+	if (IS_ERR(kmd)) {
+		pr_err("alg: kdf: could not allocate hash handle for %s\n",
+		       name);
+		kfree(buf);
+		return -ENOMEM;
+	}
+
+	ret = crypto_kdf_setkey(kmd, test->key, test->keylen,
+				test->ikm, test->ikmlen);
+	if (ret) {
+		pr_err("alg: kdf: could not set key derivation key\n");
+		goto err;
+	}
+
+	ret = crypto_kdf_generate(kmd, &test->info, 1, buf, test->expectedlen);
+	if (ret) {
+		pr_err("alg: kdf: could not obtain key data\n");
+		goto err;
+	}
+
+	ret = memcmp(test->expected, buf, test->expectedlen);
+	if (ret)
+		ret = -EINVAL;
+
+err:
+	crypto_free_shash(kmd);
+	kfree(buf);
+	return ret;
+}
+
+#endif /* _CRYPTO_KDF_SELFTEST_H */
-- 
2.33.1




