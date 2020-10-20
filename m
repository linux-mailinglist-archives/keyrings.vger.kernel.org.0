Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA439293536
	for <lists+keyrings@lfdr.de>; Tue, 20 Oct 2020 08:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404595AbgJTGun (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Oct 2020 02:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404594AbgJTGum (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Oct 2020 02:50:42 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F1FC061755;
        Mon, 19 Oct 2020 23:50:41 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id e7so612749pfn.12;
        Mon, 19 Oct 2020 23:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Mrea4LjAjlkriBDNrlEPZxK+wRxK9ddZNkjAKVpkbEc=;
        b=dzRGjCJOlyKQf3KF8xPwNR5M6QOjvfsdyIwzGUsWDVJoy19f2fRhYG2AhzZlKRkLmZ
         Cufzy355gF48EGwziQehtmEN7ic0LkRWsqQuTQ/JTZDLDhprOnY8XATOgULW0Z/tn0mW
         jhqdUFTraEpn5e2iFyDtt81vrog7K1DlxNDYHo0DUqRrtKxq/420ytSEIoMOWGx6zgLS
         iSeVvNISiOviIjKETk1gW3SPQgOKzRYok8AnV4peZjMhOlGymc1OPIMydbjMNcl3rHar
         yOQ+W9bOkWmHpAAHerD1dCdOzbeBXHHBSbfGGP7tflas+Xev0gsZNzPisdnc0Xx6P+ek
         Pimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Mrea4LjAjlkriBDNrlEPZxK+wRxK9ddZNkjAKVpkbEc=;
        b=TEXh6MEVEDKdPy1NmBumiK+VNLYaG6Gn9A0wwcwp26LnmKUdzE8gHLJvsibkgRAz8v
         VNoeG0heWgfELpaLlt5uwgIwc12rAGVEhT2181WUCatkSckmEBT9blBj9Q3SrwMeM7E3
         Nks1pMphDdCJYMh3j3caEGROZ+npvNCMRet779fve38wOTjwuRA18DJnjPVIA1VN/T4F
         1wsFdelS3Hlk75xx6PGhcqBNrzVq+l7FxWtklbZ7uZ7cnQ6BpPF9Nleb1HN1ii4Kceum
         wI0x6xIL6C5c0M/3sf61XJWCxVoQA3POOVKSIclO7jkS/12VreCdXWrj/qDQL2+hXo5N
         WOnA==
X-Gm-Message-State: AOAM533IRJ5hdW0rB/cYfyoShV0W5SD5Pvd4RmpHXIAQphFXqF5CMmXs
        IzFQ8BZLOYu6xEIyZM72d/43zEMdvHTmzg==
X-Google-Smtp-Source: ABdhPJxQXxuMfSlxGpGrzojxEZ82apkCkU7/lUvcU9VuuwWXZmhtrbL73KSO1E8n/PqqjhP1rtQLSA==
X-Received: by 2002:a63:f908:: with SMTP id h8mr1488419pgi.203.1603176640723;
        Mon, 19 Oct 2020 23:50:40 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id c203sm1026346pfb.96.2020.10.19.23.50.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Oct 2020 23:50:40 -0700 (PDT)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: [RFC PATCH 2/2] PKCS#7: Check codeSigning EKU for kernel module and kexec pe verification
Date:   Tue, 20 Oct 2020 14:50:01 +0800
Message-Id: <20201020065001.13836-3-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20201020065001.13836-1-jlee@suse.com>
References: <20201020065001.13836-1-jlee@suse.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This patch adds the logic for checking the CodeSigning extended
key usage extenstion when verifying signature of kernel module or
kexec PE binary in PKCS#7.

Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
---
 certs/system_keyring.c               |  2 +-
 crypto/asymmetric_keys/Kconfig       | 10 ++++++++++
 crypto/asymmetric_keys/pkcs7_trust.c | 37 +++++++++++++++++++++++++++++++++---
 include/crypto/pkcs7.h               |  3 ++-
 4 files changed, 47 insertions(+), 5 deletions(-)

diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index 798291177186..4104f5465d8a 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -242,7 +242,7 @@ int verify_pkcs7_message_sig(const void *data, size_t len,
 			goto error;
 		}
 	}
-	ret = pkcs7_validate_trust(pkcs7, trusted_keys);
+	ret = pkcs7_validate_trust(pkcs7, trusted_keys, usage);
 	if (ret < 0) {
 		if (ret == -ENOKEY)
 			pr_devel("PKCS#7 signature not signed with a trusted key\n");
diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kconfig
index 1f1f004dc757..6e3de0c3b5f0 100644
--- a/crypto/asymmetric_keys/Kconfig
+++ b/crypto/asymmetric_keys/Kconfig
@@ -96,4 +96,14 @@ config SIGNED_PE_FILE_VERIFICATION
 	  This option provides support for verifying the signature(s) on a
 	  signed PE binary.
 
+config CHECK_CODESIGN_EKU
+	bool "Check codeSigning extended key usage"
+	depends on PKCS7_MESSAGE_PARSER=y
+	depends on SYSTEM_DATA_VERIFICATION
+	help
+	  This option provides support for checking the codeSigning extended
+	  key usage extension when verifying the signature in PKCS#7. It
+	  affects kernel module verification and kexec PE binary verification
+	  now.
+
 endif # ASYMMETRIC_KEY_TYPE
diff --git a/crypto/asymmetric_keys/pkcs7_trust.c b/crypto/asymmetric_keys/pkcs7_trust.c
index 61af3c4d82cc..1d2318ff63db 100644
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
 /**
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

