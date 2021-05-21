Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03CB138C3A4
	for <lists+keyrings@lfdr.de>; Fri, 21 May 2021 11:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237005AbhEUJoy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 21 May 2021 05:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236951AbhEUJol (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 21 May 2021 05:44:41 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA5A4C061574;
        Fri, 21 May 2021 02:43:17 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id u7so2114105plq.4;
        Fri, 21 May 2021 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=d4ttKCOYGlPANGRL5I5eYWePmnjLRicDrCzRRbqf6M0=;
        b=Yhhh5f5vRcMVPZic8w1VbI5A9ULne9P2DtKDzmZHTtiKVPnH3IJnDrTBuojg5qCaeg
         dumxD6FZSABTa0rFtj6rI76Mr1wB7kFC5rebpuM8lFH27oA86ahxYQhUH0QrJdrkNOAn
         oBDnJ122Z+6BlXCPejrFLBs5x4KJxK25WK5QoUMWqSDq5hZOIIS/MVB3LRrlLlAr/3ot
         3Y2cr9zEOUh8ar/Kw7NkEF99p+5xbKEzXfq1fyINmr/1G6FQbAjPC6n4r1wy5cmzPp9i
         t9lS0D3Rli6WsuTY9o+0u4iH3TJXjHtDB3x+ajqZvL4FfcRAWylZbFvJ65OebkMR4djm
         tcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=d4ttKCOYGlPANGRL5I5eYWePmnjLRicDrCzRRbqf6M0=;
        b=crrHPV6MMufwCTZJP4lVpwq5hzGkmlf+IYFclWH+W0e7dIwSBS477lOSXoD2D+Yzxt
         R8puytKnzAnSLXu/2S9yuIipLS9N9astUOYDR68gLgfyF9L09OunmiQZoK5EOrv0Qves
         1n5cdr+BGD6eV7gv3uoZtUS/416qtDtZlsgEuvbyS9weqB8/ghkrCuogfB58uU86lKV8
         Wt29l3Npc+rdUjBygbnzjThO1sRTlv2QA3ZSbyHfYOku1MkiKa2Kee47gROK2VGja9AT
         +H7KAbAPmI8NKvx0iWfgpdz394D42hOrzx1uJiShiw8ODoKWDf5fkO3NuYPRDaVUTtZw
         L5pw==
X-Gm-Message-State: AOAM532bx8NadiaCAc09QPA3HVFcbcBoSmqgqficq6OohhT3SX+I17w1
        URhZRj00PM1IG9KfCe8FwK63BEGENS0=
X-Google-Smtp-Source: ABdhPJxeasmWBUsCxaCEhBBi9RikRPi8o+jXf0WIwn2/zVBaCb1B0D33BFqjHrE/4EPK53Qe+F5Jgw==
X-Received: by 2002:a17:903:2403:b029:ef:9419:b914 with SMTP id e3-20020a1709032403b02900ef9419b914mr11162027plo.59.1621590197307;
        Fri, 21 May 2021 02:43:17 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id g202sm4091931pfb.54.2021.05.21.02.43.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 02:43:17 -0700 (PDT)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>,
        Varad Gautam <varad.gautam@suse.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: [PATCH v7,2/4] PKCS#7: Check codeSigning EKU for kernel module and kexec pe verification
Date:   Fri, 21 May 2021 17:42:18 +0800
Message-Id: <20210521094220.1238-3-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210521094220.1238-1-jlee@suse.com>
References: <20210521094220.1238-1-jlee@suse.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This patch adds the logic for checking the CodeSigning extended
key usage when verifying signature of kernel module or
kexec PE binary in PKCS#7.

Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
---
 certs/blacklist.c                    |  6 +++--
 certs/system_keyring.c               |  4 ++--
 crypto/asymmetric_keys/Kconfig       |  9 ++++++++
 crypto/asymmetric_keys/pkcs7_trust.c | 43 +++++++++++++++++++++++++++++++++---
 include/crypto/pkcs7.h               |  4 +++-
 include/keys/system_keyring.h        |  7 ++++--
 6 files changed, 63 insertions(+), 10 deletions(-)

diff --git a/certs/blacklist.c b/certs/blacklist.c
index c9a435b15af4..a4ef26286584 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -16,6 +16,7 @@
 #include <linux/seq_file.h>
 #include <linux/uidgid.h>
 #include <keys/system_keyring.h>
+#include <keys/asymmetric-type.h>
 #include "blacklist.h"
 #include "common.h"
 
@@ -181,11 +182,12 @@ int add_key_to_revocation_list(const char *data, size_t size)
  * is_key_on_revocation_list - Determine if the key for a PKCS#7 message is revoked
  * @pkcs7: The PKCS#7 message to check
  */
-int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
+int is_key_on_revocation_list(struct pkcs7_message *pkcs7,
+			      enum key_being_used_for usage)
 {
 	int ret;
 
-	ret = pkcs7_validate_trust(pkcs7, blacklist_keyring);
+	ret = pkcs7_validate_trust(pkcs7, blacklist_keyring, usage, false);
 
 	if (ret == 0)
 		return -EKEYREJECTED;
diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index 692365dee2bd..394cf4e0feed 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -221,13 +221,13 @@ int verify_pkcs7_message_sig(const void *data, size_t len,
 			goto error;
 		}
 
-		ret = is_key_on_revocation_list(pkcs7);
+		ret = is_key_on_revocation_list(pkcs7, usage);
 		if (ret != -ENOKEY) {
 			pr_devel("PKCS#7 platform key is on revocation list\n");
 			goto error;
 		}
 	}
-	ret = pkcs7_validate_trust(pkcs7, trusted_keys);
+	ret = pkcs7_validate_trust(pkcs7, trusted_keys, usage, true);
 	if (ret < 0) {
 		if (ret == -ENOKEY)
 			pr_devel("PKCS#7 signature not signed with a trusted key\n");
diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kconfig
index 1f1f004dc757..1754812df989 100644
--- a/crypto/asymmetric_keys/Kconfig
+++ b/crypto/asymmetric_keys/Kconfig
@@ -96,4 +96,13 @@ config SIGNED_PE_FILE_VERIFICATION
 	  This option provides support for verifying the signature(s) on a
 	  signed PE binary.
 
+config CHECK_CODESIGN_EKU
+	bool "Check codeSigning extended key usage"
+	depends on PKCS7_MESSAGE_PARSER=y
+	depends on SYSTEM_DATA_VERIFICATION
+	help
+	  This option provides support for checking the codeSigning extended
+	  key usage when verifying the signature in PKCS#7. It affects kernel
+	  module verification and kexec PE binary verification.
+
 endif # ASYMMETRIC_KEY_TYPE
diff --git a/crypto/asymmetric_keys/pkcs7_trust.c b/crypto/asymmetric_keys/pkcs7_trust.c
index b531df2013c4..c6ebf3e6adfd 100644
--- a/crypto/asymmetric_keys/pkcs7_trust.c
+++ b/crypto/asymmetric_keys/pkcs7_trust.c
@@ -16,12 +16,40 @@
 #include <crypto/public_key.h>
 #include "pkcs7_parser.h"
 
+#ifdef CONFIG_CHECK_CODESIGN_EKU
+static bool check_eku_by_usage(struct key *key, enum key_being_used_for usage)
+{
+	struct public_key *public_key = key->payload.data[asym_crypto];
+	bool ret = true;
+
+	switch (usage) {
+	case VERIFYING_MODULE_SIGNATURE:
+	case VERIFYING_KEXEC_PE_SIGNATURE:
+		ret = !!(public_key->eku & EKU_codeSigning);
+		if (!ret)
+			pr_warn("The signer '%s' key is not CodeSigning\n",
+				key->description);
+		break;
+	default:
+		break;
+	}
+	return ret;
+}
+#else
+static bool check_eku_by_usage(struct key *key, enum key_being_used_for usage)
+{
+	return true;
+}
+#endif
+
 /*
  * Check the trust on one PKCS#7 SignedInfo block.
  */
 static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
 				    struct pkcs7_signed_info *sinfo,
-				    struct key *trust_keyring)
+				    struct key *trust_keyring,
+				    enum key_being_used_for usage,
+				    bool check_eku)
 {
 	struct public_key_signature *sig = sinfo->sig;
 	struct x509_certificate *x509, *last = NULL, *p;
@@ -112,6 +140,10 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
 	return -ENOKEY;
 
 matched:
+	if (check_eku && !check_eku_by_usage(key, usage)) {
+		key_put(key);
+		return -ENOKEY;
+	}
 	ret = verify_signature(key, sig);
 	key_put(key);
 	if (ret < 0) {
@@ -135,6 +167,8 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
  * pkcs7_validate_trust - Validate PKCS#7 trust chain
  * @pkcs7: The PKCS#7 certificate to validate
  * @trust_keyring: Signing certificates to use as starting points
+ * @usage: The use to which the key is being put.
+ * @check_eku: Check EKU (Extended Key Usage)
  *
  * Validate that the certificate chain inside the PKCS#7 message intersects
  * keys we already know and trust.
@@ -156,7 +190,9 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
  * May also return -ENOMEM.
  */
 int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
-			 struct key *trust_keyring)
+			 struct key *trust_keyring,
+			 enum key_being_used_for usage,
+			 bool check_eku)
 {
 	struct pkcs7_signed_info *sinfo;
 	struct x509_certificate *p;
@@ -167,7 +203,8 @@ int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
 		p->seen = false;
 
 	for (sinfo = pkcs7->signed_infos; sinfo; sinfo = sinfo->next) {
-		ret = pkcs7_validate_trust_one(pkcs7, sinfo, trust_keyring);
+		ret = pkcs7_validate_trust_one(pkcs7, sinfo, trust_keyring,
+					       usage, check_eku);
 		switch (ret) {
 		case -ENOKEY:
 			continue;
diff --git a/include/crypto/pkcs7.h b/include/crypto/pkcs7.h
index 38ec7f5f9041..5d87b8a02f79 100644
--- a/include/crypto/pkcs7.h
+++ b/include/crypto/pkcs7.h
@@ -30,7 +30,9 @@ extern int pkcs7_get_content_data(const struct pkcs7_message *pkcs7,
  * pkcs7_trust.c
  */
 extern int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
-				struct key *trust_keyring);
+				struct key *trust_keyring,
+				enum key_being_used_for usage,
+				bool check_eku);
 
 /*
  * pkcs7_verify.c
diff --git a/include/keys/system_keyring.h b/include/keys/system_keyring.h
index 6acd3cf13a18..3da982c3aef5 100644
--- a/include/keys/system_keyring.h
+++ b/include/keys/system_keyring.h
@@ -9,6 +9,7 @@
 #define _KEYS_SYSTEM_KEYRING_H
 
 #include <linux/key.h>
+#include <keys/asymmetric-type.h>
 
 #ifdef CONFIG_SYSTEM_TRUSTED_KEYRING
 
@@ -59,13 +60,15 @@ static inline int is_binary_blacklisted(const u8 *hash, size_t hash_len)
 
 #ifdef CONFIG_SYSTEM_REVOCATION_LIST
 extern int add_key_to_revocation_list(const char *data, size_t size);
-extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7);
+extern int is_key_on_revocation_list(struct pkcs7_message *pkcs7,
+				     enum key_being_used_for usage);
 #else
 static inline int add_key_to_revocation_list(const char *data, size_t size)
 {
 	return 0;
 }
-static inline int is_key_on_revocation_list(struct pkcs7_message *pkcs7)
+static inline int is_key_on_revocation_list(struct pkcs7_message *pkcs7,
+					    enum key_being_used_for usage);
 {
 	return -ENOKEY;
 }
-- 
2.16.4

