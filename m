Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2657A359227
	for <lists+keyrings@lfdr.de>; Fri,  9 Apr 2021 04:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232960AbhDICrk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 22:47:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232921AbhDICrc (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 22:47:32 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A6ABC061760;
        Thu,  8 Apr 2021 19:47:20 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d124so3226672pfa.13;
        Thu, 08 Apr 2021 19:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3jn01rfak00HumWqfPS+bL637Js5LvIW2OJzeMurQFU=;
        b=C8XsRsOwGl6B6axyiJl4Lk1gGg2EWbrdM+6Iue17vTDGQqWXDv9vYWbKUGab4cCDP2
         7RcG4HN63UIopzwMgP1AInDdeXqQkJbUBIkekl237UWCHAhHXHgsVkDkLCDGo73bmO30
         +dOMFQoUCypWCC7ts/jxuq8Bc12QJr7Ed4qwYXYUFYnhSls2Hzg6SQ87olFb5nmEptzW
         EkQwDK4vo8WaU6a2LmhDUg+O3zlEodn8/8hugDBJ9jv925Uc3oiXBzYTwRANzbbW5TQ4
         0sxORvnR6kqNVTp7gg764Ad5smyMtE/wJ66C6Nfn8EwhomApYjHD/4q8ep+H9T9p4TP/
         wQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3jn01rfak00HumWqfPS+bL637Js5LvIW2OJzeMurQFU=;
        b=UN8789robeocJt9XI126xq60ze1sxSF4LTkjUzgTtFdP6B1VWRZJMh3b/e77zUgGMJ
         Bom1ma4pp/XEk1wYIQyYH03mgjTSzOguWp5vEFcyKsNAAElQFcdkCLcKKot83CqqtVhJ
         fS6Rcmv8gI483j+3HOnhUNU/YKLNEy1UQECDsoFFpIcDX7eqrGtmlsz6QFSuUYp5B4ji
         LrfexpFZxgE9nvARYjiBIdB2S/7gcSPDFUkp/H709pl6sz6b4uQ00sTZTiWl56ZZbQ2g
         4QK8q/O8ZTIAcT3IxvH9ZX6EcDT9Pkmd0vmtOp+vXlK5Kl8knLpvDSnNm3Rww7GRSVmd
         DKOg==
X-Gm-Message-State: AOAM5301chf5PbvDanlrkNqUf9ICCYuGeyQ7ZKUdsr12Z1INaYWAyqwd
        PGE+Pj6QA1vKV6OcklMXK24=
X-Google-Smtp-Source: ABdhPJzKYaKccq9qRJQ9bdCw8N71xOBGpM9EzSkIIr+keAt1IF8yeP+TtujxlqM3P9UUMqo/jJ36Sw==
X-Received: by 2002:a05:6a00:1484:b029:214:23e5:a4f3 with SMTP id v4-20020a056a001484b029021423e5a4f3mr10478722pfu.26.1617936439654;
        Thu, 08 Apr 2021 19:47:19 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id d26sm665525pfo.162.2021.04.08.19.47.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Apr 2021 19:47:19 -0700 (PDT)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: [PATCH 2/4] PKCS#7: Check codeSigning EKU for kernel module and kexec pe verification
Date:   Fri,  9 Apr 2021 10:46:54 +0800
Message-Id: <20210409024656.8083-3-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210409024656.8083-1-jlee@suse.com>
References: <20210409024656.8083-1-jlee@suse.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This patch adds the logic for checking the CodeSigning extended
key usage when verifying signature of kernel module or
kexec PE binary in PKCS#7.

Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
---
 certs/system_keyring.c               |  2 +-
 crypto/asymmetric_keys/Kconfig       |  9 +++++++++
 crypto/asymmetric_keys/pkcs7_trust.c | 37 +++++++++++++++++++++++++++++++++---
 include/crypto/pkcs7.h               |  3 ++-
 4 files changed, 46 insertions(+), 5 deletions(-)

diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index 4b693da488f1..c9f8bca0b0d3 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -243,7 +243,7 @@ int verify_pkcs7_message_sig(const void *data, size_t len,
 			goto error;
 		}
 	}
-	ret = pkcs7_validate_trust(pkcs7, trusted_keys);
+	ret = pkcs7_validate_trust(pkcs7, trusted_keys, usage);
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
index b531df2013c4..077bfef928b6 100644
--- a/crypto/asymmetric_keys/pkcs7_trust.c
+++ b/crypto/asymmetric_keys/pkcs7_trust.c
@@ -16,12 +16,36 @@
 #include <crypto/public_key.h>
 #include "pkcs7_parser.h"
 
+#ifdef CONFIG_CHECK_CODESIGN_EKU
+static bool check_codesign_eku(struct key *key,
+			     enum key_being_used_for usage)
+{
+	struct public_key *public_key = key->payload.data[asym_crypto];
+
+	switch (usage) {
+	case VERIFYING_MODULE_SIGNATURE:
+	case VERIFYING_KEXEC_PE_SIGNATURE:
+		return !!(public_key->eku & EKU_codeSigning);
+	default:
+		break;
+	}
+	return true;
+}
+#else
+static bool check_codesign_eku(struct key *key,
+			     enum key_being_used_for usage)
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
+				    enum key_being_used_for usage)
 {
 	struct public_key_signature *sig = sinfo->sig;
 	struct x509_certificate *x509, *last = NULL, *p;
@@ -112,6 +136,12 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
 	return -ENOKEY;
 
 matched:
+	if (!check_codesign_eku(key, usage)) {
+		pr_warn("sinfo %u: The signer %x key is not CodeSigning\n",
+			sinfo->index, key_serial(key));
+		key_put(key);
+		return -ENOKEY;
+	}
 	ret = verify_signature(key, sig);
 	key_put(key);
 	if (ret < 0) {
@@ -156,7 +186,8 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
  * May also return -ENOMEM.
  */
 int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
-			 struct key *trust_keyring)
+			 struct key *trust_keyring,
+			 enum key_being_used_for usage)
 {
 	struct pkcs7_signed_info *sinfo;
 	struct x509_certificate *p;
@@ -167,7 +198,7 @@ int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
 		p->seen = false;
 
 	for (sinfo = pkcs7->signed_infos; sinfo; sinfo = sinfo->next) {
-		ret = pkcs7_validate_trust_one(pkcs7, sinfo, trust_keyring);
+		ret = pkcs7_validate_trust_one(pkcs7, sinfo, trust_keyring, usage);
 		switch (ret) {
 		case -ENOKEY:
 			continue;
diff --git a/include/crypto/pkcs7.h b/include/crypto/pkcs7.h
index 38ec7f5f9041..b3b48240ba73 100644
--- a/include/crypto/pkcs7.h
+++ b/include/crypto/pkcs7.h
@@ -30,7 +30,8 @@ extern int pkcs7_get_content_data(const struct pkcs7_message *pkcs7,
  * pkcs7_trust.c
  */
 extern int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
-				struct key *trust_keyring);
+				struct key *trust_keyring,
+				enum key_being_used_for usage);
 
 /*
  * pkcs7_verify.c
-- 
2.16.4

