Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CE762FCD91
	for <lists+keyrings@lfdr.de>; Wed, 20 Jan 2021 10:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726493AbhATJKh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 20 Jan 2021 04:10:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728104AbhATJGm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 20 Jan 2021 04:06:42 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D83C0613CF;
        Wed, 20 Jan 2021 01:06:01 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id s15so12161411plr.9;
        Wed, 20 Jan 2021 01:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rEVQORojpxPILZoW25n2HNyuoMNfuJyQRA19mYILOf8=;
        b=eUrUOAmQGTtcQHmscv92Rr9YP8vGRMrNujLw1yvsfOd2jEBLnpiFtMXkXWhdtzyEY4
         M49Lkp1+Xdkgij1tun5HpGdw+f0FHbXe9T39282jlBjuX4EV4UWsNMDR84HeYA6WQp/I
         +K9Izh1IdftESL2yzS8KcMzyMIElL/UGGreMofurhGA3khyiUthESxq9hrfj1z8OIg+H
         STO7dX3ol2dhu/koJrowyCr7tsadsSFwaQg013dtjXeiPAcP8V7XXRDguHBt3VL9pK5L
         abg4+XvO//cHpglW6Pim+u3Gnx64CxblVHt3NkWL+W3Dk1I5scX2hbO7wm3v1/69l5R2
         HQsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rEVQORojpxPILZoW25n2HNyuoMNfuJyQRA19mYILOf8=;
        b=lGZVN6ORm5NQZoNeqJIwBrJhl46pchX6ixGgDB3OP4Icp5iMXV3N5BX1O9+gNRbPhm
         ioEvEAqDRuYR0mRA3glvNyjQqUcxBb/lliZPxzTK9urRSRdtUA/8a2X7sFntp8KM7lB8
         A1qfoyxFyhDexjjvKyvPEOzubrA4YAAJ9EB9EbSdEgMW5niOZX99bEKo+UmWr3cBxcQp
         vk886LW6aEBN54I0gIKWTdL00D0MXCso30fcka5PCSReioHgGgWKI8rntZUeb5jEdW8h
         ClJCWu2Qm2X+9QLwqdI59fqowagNp3sreyc9xTb3YhwrE7YYPSPxm2ELybOKJnLB3BM7
         hXHQ==
X-Gm-Message-State: AOAM531PkNtw0oOvjcJ4B8MYWYVW0kjEXjkjxJd3gzyij7DnsZaXurn7
        Sn0iPFnDlM4eNmKH/+uppSE=
X-Google-Smtp-Source: ABdhPJwjnzVg81wICugVbbYS2ElbIu+3zxJhnEOchjy7lPa82OoUNcPhlSSxBzrsCb2LkIWI4EsG5w==
X-Received: by 2002:a17:902:ed93:b029:de:84d2:9ce1 with SMTP id e19-20020a170902ed93b02900de84d29ce1mr8976390plj.47.1611133561052;
        Wed, 20 Jan 2021 01:06:01 -0800 (PST)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id z2sm1585226pgl.49.2021.01.20.01.05.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jan 2021 01:06:00 -0800 (PST)
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
Date:   Wed, 20 Jan 2021 17:05:15 +0800
Message-Id: <20210120090517.23851-3-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210120090517.23851-1-jlee@suse.com>
References: <20210120090517.23851-1-jlee@suse.com>
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

