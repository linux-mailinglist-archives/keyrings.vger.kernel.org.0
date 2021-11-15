Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8251745004C
	for <lists+keyrings@lfdr.de>; Mon, 15 Nov 2021 09:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbhKOIzH (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 15 Nov 2021 03:55:07 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.84]:26956 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236940AbhKOIyf (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 15 Nov 2021 03:54:35 -0500
X-Greylist: delayed 358 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Nov 2021 03:54:35 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636965902;
    s=strato-dkim-0002; d=chronox.de;
    h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Cc:Date:
    From:Subject:Sender;
    bh=e9PSTVVwUetqJwcMqAV3hkxvzTITtObwWtsKs4Wuj4k=;
    b=WwzjrA3zyOjv4QkRA5kqlWhVSCjh2H6HQWBg3WPRJTdz259wG+ExDqRV97tVA7Ca9Q
    EkIjiYcamylslogk4zajtq7CKHSqF6747j5SxkcGFqGHRonwn+5d1OI+4pMSQm4yyOuu
    RioRuUAUBEmOaMC0E3so+7ny6qIgSsqf89Loz6Hfgt/7xaLOegLWBzPDI5vjB+maiIVW
    ZOnyauULdrjczaXT6GH6F8izA/V9YxFt620q7MZ4WsNSl5r3plUi3a7vOvrX6yucST7X
    KXAYWfXGqkFVXERcwywsN5NJlpDs3+OfumAIRX/Zp5Ip2vRJVunPyG0ImqvUyAxvjzPu
    XO8Q==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXvTOeuXTEc="
X-RZG-CLASS-ID: mo00
Received: from positron.chronox.de
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id U02dfbxAF8j1U8u
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 15 Nov 2021 09:45:01 +0100 (CET)
From:   Stephan =?ISO-8859-1?Q?M=FCller?= <smueller@chronox.de>
To:     herbert@gondor.apana.org.au
Cc:     ebiggers@kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        "dhowells@redhat.com" <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings <keyrings@vger.kernel.org>, simo@redhat.com
Subject: [PATCH v3 1/4] crypto: Add key derivation self-test support code
Date:   Mon, 15 Nov 2021 09:42:35 +0100
Message-ID: <2580991.lGaqSPkdTl@positron.chronox.de>
In-Reply-To: <2589009.vuYhMxLoTh@positron.chronox.de>
References: <2589009.vuYhMxLoTh@positron.chronox.de>
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




