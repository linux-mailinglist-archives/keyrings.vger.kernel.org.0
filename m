Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8D02A765F
	for <lists+keyrings@lfdr.de>; Thu,  5 Nov 2020 05:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731118AbgKEEZA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 4 Nov 2020 23:25:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730078AbgKEEY7 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 4 Nov 2020 23:24:59 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 202EEC0613CF;
        Wed,  4 Nov 2020 20:24:59 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id x13so399577pgp.7;
        Wed, 04 Nov 2020 20:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rEVQORojpxPILZoW25n2HNyuoMNfuJyQRA19mYILOf8=;
        b=i71nKCxm/Rk7Qe0vfqXmlNOIbt9fIuievRqcCn5TJ1yWIdb59otcj93oz7j+gpZZWo
         Bp6lTHoFkgmmVJDji7oItHa5kc9VjRnHjZzsPiy/LrWinbv+5uRpmvxIuhDnTMid3S3x
         x9JmlkWfqwTYLVEqsdgw1Shol9H+Mp4WsGw0er643fBik2QBf/oBlbKOXNg8BVHq1P7d
         eweO2JBa6jgeNWz99UIYx/pKdjGP0px9q+CsV9n/AZpXUCCjEIpKBze+wCLNFthZ8LuJ
         CySDEmIbmdVIhQxI03oDD+oIR2gX3i68ERDpDX2/L3OAVGtHDcT3nx+1ihH9vgWSyMue
         A8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rEVQORojpxPILZoW25n2HNyuoMNfuJyQRA19mYILOf8=;
        b=EFHxwh/aKzxhOhj40dQzqrXRW8Vl58l0Zs4S2FTh6O7awn9Ycn8z+tpwMznDWwDOfY
         ZyrJMOZ1k2ZzKzMH2OeB+OtiStfrR0n6uo0k9nGAvmoLu2vpEFBZxpMH5LbSQSW74SjX
         BOxBZsb6COLjNcRuxBi77N/iARbm7MKYWz/hq78QAYfX5NgCDcfRIFJECYAxQP9TOQPd
         hhnBKuQfCz2aipwmZHrs9yUFGDeC6bQSGuflmrk79xlAC6bVYfxxVbsjOEw+kJFLc6TY
         3YHbJnGEBPOhw2pt6xQ/4TwoKYV7YSdrkb2DknqXOq+s2q4keDeEmeVUDO/rrVuJF/Qv
         F7pw==
X-Gm-Message-State: AOAM5336vik3CNGFz6NYeb6Db1yYXQ1pt7G7FNm3qhYhGMthxT3+9jRg
        uDypJdr84Ztv73KtKZA9L/k=
X-Google-Smtp-Source: ABdhPJxxSyyliKXbv7VU2uhEsbi4aEkX5Awvipq0CP4TmL0j/U/T8uSPpKMflgkHnq9+9ELOvhfBgQ==
X-Received: by 2002:aa7:8b50:0:b029:18a:adb4:8411 with SMTP id i16-20020aa78b500000b029018aadb48411mr775573pfd.66.1604550298712;
        Wed, 04 Nov 2020 20:24:58 -0800 (PST)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id z22sm472782pfa.220.2020.11.04.20.24.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2020 20:24:58 -0800 (PST)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: [PATCH v2 2/2] PKCS#7: Check codeSigning EKU for kernel module and kexec pe verification
Date:   Thu,  5 Nov 2020 12:24:06 +0800
Message-Id: <20201105042406.5783-3-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20201105042406.5783-1-jlee@suse.com>
References: <20201105042406.5783-1-jlee@suse.com>
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

