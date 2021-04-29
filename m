Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F179636E5F0
	for <lists+keyrings@lfdr.de>; Thu, 29 Apr 2021 09:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239295AbhD2Had (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Apr 2021 03:30:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239616AbhD2Hac (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Apr 2021 03:30:32 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32DEBC06138D;
        Thu, 29 Apr 2021 00:29:14 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so10495337pjv.1;
        Thu, 29 Apr 2021 00:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2VAL6t0JhjYuENdb0/a6OoZ5pXUaFlWqPPwScBUiDow=;
        b=UdXmwskiwOU0DVaLuOM4b6FewZNzWff444sb7ueg0mJxjO/Ipzdw+hP4EiFhvU9om2
         Qb+AM7wdWRbj6X0VtyrwSCUYuEJhKXxLmi/ALNYrdl3xlJWPIFry/88e96rcI+Rktn09
         hXgMp57Utpq1gzSvP735oigoLVtQO4ZUG19bvrh4/KmW+emSUvDxaOGbssLbMCnKlBFG
         ZGkPHaSXKe2S+X/+iBXyUx+HhmWT5aW7o9YNA+RtUYoiO7kv7F3RkSK8XqeaHyHSmmmf
         rV5xIi1TsRVtCJLG1q01yT7pdnHtCeh86eo9DcJLRKnOEZaVVdayeC2KCxyBrXdhpi7l
         oapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2VAL6t0JhjYuENdb0/a6OoZ5pXUaFlWqPPwScBUiDow=;
        b=dukEtA39e9ZZzCli3HfKfhmPaGOKtX//b3IIykJk2MhPIVVuwtXoL02ByudWR+h22h
         6zeHtKeWbwQv6nIGncZMRNGnnSbO2EIV/MaYyXp2zgjwQ6A8OgNoWKSzNEQ62V+iquRi
         k3LAv7pY7CD7gJ5O4A83aidRDImM9++NqV9Gpke9BYSBhMYn4jphvtShnStasYv0rXPr
         YL58uNMJPfYZciZmLyP7xbBAtoZOvl0lu7AuuCwR+GT3IZxKb6D4gY1iNciWlmlBlFgp
         NYF5jd1GBeUJHXuMtMroAs0MkeZ9fLs8GZHLbeaFdEnfqEF3LmxyaKoGsJXISyXS1DQC
         mMkQ==
X-Gm-Message-State: AOAM532zrEdR6sGCj5uXnXr8sflh6NTrWgQmVozt4VEAO+OVIwCxMlil
        VGQJ6R2ogx7cuZ/goQQEbng=
X-Google-Smtp-Source: ABdhPJxoV/SG4BZSPLMQ97AcSJ4dQH3ewEH2DtmFl04AiqKFr2PnayjdrCVnyRbDp7/wo8NMzcpevg==
X-Received: by 2002:a17:902:8f8d:b029:ea:e059:84a6 with SMTP id z13-20020a1709028f8db02900eae05984a6mr34788392plo.35.1619681353802;
        Thu, 29 Apr 2021 00:29:13 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id z29sm1632085pga.52.2021.04.29.00.29.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Apr 2021 00:29:13 -0700 (PDT)
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
Subject: [PATCH v6,2/4] PKCS#7: Check codeSigning EKU for kernel module and kexec pe verification
Date:   Thu, 29 Apr 2021 15:28:49 +0800
Message-Id: <20210429072851.24057-3-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210429072851.24057-1-jlee@suse.com>
References: <20210429072851.24057-1-jlee@suse.com>
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
 crypto/asymmetric_keys/pkcs7_trust.c | 38 +++++++++++++++++++++++++++++++++---
 include/crypto/pkcs7.h               |  3 ++-
 4 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index 0c9a4795e847..302ca0555e75 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -206,7 +206,7 @@ int verify_pkcs7_message_sig(const void *data, size_t len,
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
index b531df2013c4..7c27bf81aca9 100644
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
@@ -135,6 +165,7 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
  * pkcs7_validate_trust - Validate PKCS#7 trust chain
  * @pkcs7: The PKCS#7 certificate to validate
  * @trust_keyring: Signing certificates to use as starting points
+ * @usage: The use to which the key is being put.
  *
  * Validate that the certificate chain inside the PKCS#7 message intersects
  * keys we already know and trust.
@@ -156,7 +187,8 @@ static int pkcs7_validate_trust_one(struct pkcs7_message *pkcs7,
  * May also return -ENOMEM.
  */
 int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
-			 struct key *trust_keyring)
+			 struct key *trust_keyring,
+			 enum key_being_used_for usage)
 {
 	struct pkcs7_signed_info *sinfo;
 	struct x509_certificate *p;
@@ -167,7 +199,7 @@ int pkcs7_validate_trust(struct pkcs7_message *pkcs7,
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

