Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B03B034567D
	for <lists+keyrings@lfdr.de>; Tue, 23 Mar 2021 04:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhCWD4c (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 22 Mar 2021 23:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhCWDz6 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 22 Mar 2021 23:55:58 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C055C061574;
        Mon, 22 Mar 2021 20:55:58 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id j25so12891511pfe.2;
        Mon, 22 Mar 2021 20:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=3jn01rfak00HumWqfPS+bL637Js5LvIW2OJzeMurQFU=;
        b=QkjwxOMu48G0rNB9DuyGof5vlGstmavJYCB/+VQdvAM595uqyDsPQFkciK0HhNjHgA
         Yp6HubUzxDN20L5GJcH3uFGI+Q7yhHU4KAmJVmUPN7oief0llOSpBUmaXLzGkmesM1hp
         kAiBEROEVM3XZIzampgz99D7PslvQMzv7Y+wcAskqxNXioDw1Ry9RazM11E5q+/scOgq
         OC1hMlzbHGFXnun+Vh4lNbzy0zJAf+ETIHKVFK9wBZLl3OKPgQQcD5mvzzzXJmTvtm/b
         /5H5BISAtzlDuCK+VmGlEjPaBkODXjyS+pUd+5oeCA/c3CbYzqBk8xGPnMyOiIl3jooj
         wx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=3jn01rfak00HumWqfPS+bL637Js5LvIW2OJzeMurQFU=;
        b=n1+hzNSOkOhAkTk5ri9BJkrNZKRJupMzVDz3Eg58Pbx9sxngaKFR9T5VBvsu716k9Q
         m0QfPKQh0KC/2LUn1U/NpXMh2qf97IIfeLGzY4xbY0ltqC2DNIsGe/PyW65wr01bIsY6
         Ursj+rZCxkTISmyncQc+T1tEBx+RnOhGpSdKB84vniiQt4kvFezdhghOjZrFzHK+a4jK
         ud2vytsY/FRe0D53PMSgd1NXZYhbMdj94C9KKD/YtIT6UnvulweKnWhvwq7Z7V/Z36Z0
         EQI9GPmlpWjCfmc96xy4o5f6S3CHpSC/jvu79qCGdO5PKDnzYC3ijr2sdC2QrDRnKpOl
         7kCw==
X-Gm-Message-State: AOAM532YKbM2Vgp7P2VNDeHHfinHvDj3+3En5rs5RWnX6j25WLmbA/W7
        s3uffPj7m85y2FUBXQnznJ4=
X-Google-Smtp-Source: ABdhPJzX9V6pWRrvwRoO5KRrO8UHnbk259A5RNfdTTVDIiJWBOSjOaBSchUEJpr6pQVOg2Wt+YB6BQ==
X-Received: by 2002:a62:1dcc:0:b029:209:7eef:b14e with SMTP id d195-20020a621dcc0000b02902097eefb14emr2917965pfd.3.1616471757814;
        Mon, 22 Mar 2021 20:55:57 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id z22sm14415630pfa.41.2021.03.22.20.55.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Mar 2021 20:55:57 -0700 (PDT)
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
Date:   Tue, 23 Mar 2021 11:55:19 +0800
Message-Id: <20210323035521.5843-3-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210323035521.5843-1-jlee@suse.com>
References: <20210323035521.5843-1-jlee@suse.com>
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

