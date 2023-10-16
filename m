Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E93E7C9E9D
	for <lists+keyrings@lfdr.de>; Mon, 16 Oct 2023 07:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjJPFV7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 16 Oct 2023 01:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbjJPFV6 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 16 Oct 2023 01:21:58 -0400
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64114DC;
        Sun, 15 Oct 2023 22:21:55 -0700 (PDT)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
        by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
        id 1qsG2t-007PS5-JK; Mon, 16 Oct 2023 13:21:40 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 16 Oct 2023 13:21:44 +0800
Date:   Mon, 16 Oct 2023 13:21:44 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
        Jarkko Sakkinen <jarkko@kernel.org>
Subject: [PATCH] certs: Break circular dependency when selftest is modular
Message-ID: <ZSzIaBZ8YQHss2Dv@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The modular build fails because the self-test code depends on pkcs7
which in turn depends on x509 which contains the self-test.

Split the self-test out into its own module to break the cycle.

Fixes: 3cde3174eb91 ("certs: Add FIPS selftests")
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kconfig
index 1ef3b46d6f6e..59ec726b7c77 100644
--- a/crypto/asymmetric_keys/Kconfig
+++ b/crypto/asymmetric_keys/Kconfig
@@ -76,7 +76,7 @@ config SIGNED_PE_FILE_VERIFICATION
 	  signed PE binary.
 
 config FIPS_SIGNATURE_SELFTEST
-	bool "Run FIPS selftests on the X.509+PKCS7 signature verification"
+	tristate "Run FIPS selftests on the X.509+PKCS7 signature verification"
 	help
 	  This option causes some selftests to be run on the signature
 	  verification code, using some built in data.  This is required
@@ -84,5 +84,6 @@ config FIPS_SIGNATURE_SELFTEST
 	depends on KEYS
 	depends on ASYMMETRIC_KEY_TYPE
 	depends on PKCS7_MESSAGE_PARSER=X509_CERTIFICATE_PARSER
+	depends on X509_CERTIFICATE_PARSER
 
 endif # ASYMMETRIC_KEY_TYPE
diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makefile
index 0d1fa1b692c6..1a273d6df3eb 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -22,7 +22,8 @@ x509_key_parser-y := \
 	x509_cert_parser.o \
 	x509_loader.o \
 	x509_public_key.o
-x509_key_parser-$(CONFIG_FIPS_SIGNATURE_SELFTEST) += selftest.o
+obj-$(CONFIG_FIPS_SIGNATURE_SELFTEST) += x509_selftest.o
+x509_selftest-y += selftest.o
 
 $(obj)/x509_cert_parser.o: \
 	$(obj)/x509.asn1.h \
diff --git a/crypto/asymmetric_keys/selftest.c b/crypto/asymmetric_keys/selftest.c
index fa0bf7f24284..c50da7ef90ae 100644
--- a/crypto/asymmetric_keys/selftest.c
+++ b/crypto/asymmetric_keys/selftest.c
@@ -4,10 +4,11 @@
  * Written by David Howells (dhowells@redhat.com)
  */
 
-#include <linux/kernel.h>
-#include <linux/cred.h>
-#include <linux/key.h>
 #include <crypto/pkcs7.h>
+#include <linux/cred.h>
+#include <linux/kernel.h>
+#include <linux/key.h>
+#include <linux/module.h>
 #include "x509_parser.h"
 
 struct certs_test {
@@ -175,7 +176,7 @@ static const struct certs_test certs_tests[] __initconst = {
 	TEST(certs_selftest_1_data, certs_selftest_1_pkcs7),
 };
 
-int __init fips_signature_selftest(void)
+static int __init fips_signature_selftest(void)
 {
 	struct key *keyring;
 	int ret, i;
@@ -222,3 +223,9 @@ int __init fips_signature_selftest(void)
 	key_put(keyring);
 	return 0;
 }
+
+late_initcall(fips_signature_selftest);
+
+MODULE_DESCRIPTION("X.509 self tests");
+MODULE_AUTHOR("Red Hat, Inc.");
+MODULE_LICENSE("GPL");
diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_keys/x509_parser.h
index a299c9c56f40..97a886cbe01c 100644
--- a/crypto/asymmetric_keys/x509_parser.h
+++ b/crypto/asymmetric_keys/x509_parser.h
@@ -40,15 +40,6 @@ struct x509_certificate {
 	bool		blacklisted;
 };
 
-/*
- * selftest.c
- */
-#ifdef CONFIG_FIPS_SIGNATURE_SELFTEST
-extern int __init fips_signature_selftest(void);
-#else
-static inline int fips_signature_selftest(void) { return 0; }
-#endif
-
 /*
  * x509_cert_parser.c
  */
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 7c71db3ac23d..6a4f00be22fc 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -262,15 +262,9 @@ static struct asymmetric_key_parser x509_key_parser = {
 /*
  * Module stuff
  */
-extern int __init certs_selftest(void);
 static int __init x509_key_init(void)
 {
-	int ret;
-
-	ret = register_asymmetric_key_parser(&x509_key_parser);
-	if (ret < 0)
-		return ret;
-	return fips_signature_selftest();
+	return register_asymmetric_key_parser(&x509_key_parser);
 }
 
 static void __exit x509_key_exit(void)
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
