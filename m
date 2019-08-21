Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE2797A34
	for <lists+keyrings@lfdr.de>; Wed, 21 Aug 2019 15:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728815AbfHUNAJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 21 Aug 2019 09:00:09 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39546 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728821AbfHUNAH (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 21 Aug 2019 09:00:07 -0400
Received: by mail-pf1-f194.google.com with SMTP id f17so1395053pfn.6
        for <keyrings@vger.kernel.org>; Wed, 21 Aug 2019 06:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dCpbsUikcAiIIXp7jgc0W0pYfHlRBYPDddlP94xglMY=;
        b=A+anOlKtIb/37ODmD/JLSvKsH5N4SyH5JTe4f04NJHj1jZGo/RG9ZRUxLTZioJ36SB
         KsVbHytTm1wk77s/h5xyTCdVddEcXQRdaA47ipGw4gaNuBEIPlPlDPBDFgcLMO//UZsi
         DmFzXx1oYJnjnRjZ0t/6f2L1Epkb2m0l6fn37M/L76sihLCqsYMKGQeTPX7Gz+1CJGvm
         ihq9M4sFum3jRcb3UXs0k9/jfYRHU+bhqGxi7ndwqefUuKQJsyM1wJlxiW6D4n2/s9gl
         st+ejQ1mDYkoe1g6MVY9vZArjXf+BfGrytbbbr2lJbjblojXB99krE1pgr4a0tR9aBNk
         8JSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dCpbsUikcAiIIXp7jgc0W0pYfHlRBYPDddlP94xglMY=;
        b=GTHRtgozWfSTnQ8J2IddZgaGdd38v3zAsx9Ez3KvTPOXWoJg1gMjPmf3cQi9HCdjtP
         ifmfG4im/4cJdU7UpS8bpebiHppTD0PG2xHLh+48HVigRna+OqXU11Z9ubUGrrWrtsHJ
         Sy65NEzOj+Lks5/FX9eK+jDrKo91+AZwQy/wra8fCoo2JEoiUY1jh6V5ZvXFVOrUzdVt
         n+Zcj8yuUBVm8+Ceae+ns/PhWyvs202BTIJkLifEog0aBD+1fKjmeE6v3zw/L1EIRDNe
         ZANujILAtm44ddDL3r7pBkhsSQp9vH/Eg2RIZzGe7tuDgkF0lIbdq6kCpsgbEk5dC0+I
         0VGg==
X-Gm-Message-State: APjAAAVGNzdZqwVfRAOgPgQkNLdb85vtvg2ugGiS9FY036TpC6RMDy0n
        w3rVV4RxVn+NrTajFvbOjbcCHz04Z/8=
X-Google-Smtp-Source: APXvYqygbzEsF6gP1UwgYNFLZ9JTMY5jXKYfgZx5qR0RboHs3MdoQX81ERKLnDKaf3tTe++tRRnLJg==
X-Received: by 2002:aa7:96b3:: with SMTP id g19mr34281542pfk.26.1566392405646;
        Wed, 21 Aug 2019 06:00:05 -0700 (PDT)
Received: from localhost.localdomain ([117.252.68.28])
        by smtp.gmail.com with ESMTPSA id o24sm47377476pfp.135.2019.08.21.05.59.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 21 Aug 2019 06:00:04 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org
Cc:     dhowells@redhat.com, herbert@gondor.apana.org.au,
        davem@davemloft.net, peterhuewe@gmx.de, jgg@ziepe.ca,
        jejb@linux.ibm.com, jarkko.sakkinen@linux.intel.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, zohar@linux.ibm.com, jmorris@namei.org,
        serge@hallyn.com, casey@schaufler-ca.com,
        ard.biesheuvel@linaro.org, daniel.thompson@linaro.org,
        linux-kernel@vger.kernel.org, tee-dev@lists.linaro.org,
        Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH v5 3/4] KEYS: trusted: create trusted keys subsystem
Date:   Wed, 21 Aug 2019 18:29:04 +0530
Message-Id: <1566392345-15419-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566392345-15419-1-git-send-email-sumit.garg@linaro.org>
References: <1566392345-15419-1-git-send-email-sumit.garg@linaro.org>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Move existing code to trusted keys subsystem. Also, rename files with
"tpm" as suffix which provides the underlying implementation.

Suggested-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 crypto/asymmetric_keys/asym_tpm.c                        | 2 +-
 include/Kbuild                                           | 1 -
 include/keys/{trusted.h => trusted_tpm.h}                | 7 +++++--
 security/keys/Makefile                                   | 2 +-
 security/keys/trusted-keys/Makefile                      | 7 +++++++
 security/keys/{trusted.c => trusted-keys/trusted_tpm1.c} | 2 +-
 6 files changed, 15 insertions(+), 6 deletions(-)
 rename include/keys/{trusted.h => trusted_tpm.h} (96%)
 create mode 100644 security/keys/trusted-keys/Makefile
 rename security/keys/{trusted.c => trusted-keys/trusted_tpm1.c} (99%)

diff --git a/crypto/asymmetric_keys/asym_tpm.c b/crypto/asymmetric_keys/asym_tpm.c
index 76d2ce3..ec3f309 100644
--- a/crypto/asymmetric_keys/asym_tpm.c
+++ b/crypto/asymmetric_keys/asym_tpm.c
@@ -13,7 +13,7 @@
 #include <crypto/sha.h>
 #include <asm/unaligned.h>
 #include <keys/asymmetric-subtype.h>
-#include <keys/trusted.h>
+#include <keys/trusted_tpm.h>
 #include <crypto/asym_tpm_subtype.h>
 #include <crypto/public_key.h>
 
diff --git a/include/Kbuild b/include/Kbuild
index 7e9f1ac..e9546a8 100644
--- a/include/Kbuild
+++ b/include/Kbuild
@@ -65,7 +65,6 @@ header-test-			+= keys/asymmetric-subtype.h
 header-test-			+= keys/asymmetric-type.h
 header-test-			+= keys/big_key-type.h
 header-test-			+= keys/request_key_auth-type.h
-header-test-			+= keys/trusted.h
 header-test-			+= kvm/arm_arch_timer.h
 header-test-			+= kvm/arm_pmu.h
 header-test-$(CONFIG_ARM)	+= kvm/arm_psci.h
diff --git a/include/keys/trusted.h b/include/keys/trusted_tpm.h
similarity index 96%
rename from include/keys/trusted.h
rename to include/keys/trusted_tpm.h
index 29e3e9b..7b9d7b4 100644
--- a/include/keys/trusted.h
+++ b/include/keys/trusted_tpm.h
@@ -1,6 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __TRUSTED_KEY_H
-#define __TRUSTED_KEY_H
+#ifndef __TRUSTED_TPM_H
+#define __TRUSTED_TPM_H
+
+#include <keys/trusted-type.h>
+#include <linux/tpm_command.h>
 
 /* implementation specific TPM constants */
 #define MAX_BUF_SIZE			1024
diff --git a/security/keys/Makefile b/security/keys/Makefile
index 9cef540..074f275 100644
--- a/security/keys/Makefile
+++ b/security/keys/Makefile
@@ -28,5 +28,5 @@ obj-$(CONFIG_ASYMMETRIC_KEY_TYPE) += keyctl_pkey.o
 # Key types
 #
 obj-$(CONFIG_BIG_KEYS) += big_key.o
-obj-$(CONFIG_TRUSTED_KEYS) += trusted.o
+obj-$(CONFIG_TRUSTED_KEYS) += trusted-keys/
 obj-$(CONFIG_ENCRYPTED_KEYS) += encrypted-keys/
diff --git a/security/keys/trusted-keys/Makefile b/security/keys/trusted-keys/Makefile
new file mode 100644
index 0000000..1a24680
--- /dev/null
+++ b/security/keys/trusted-keys/Makefile
@@ -0,0 +1,7 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for trusted keys
+#
+
+obj-$(CONFIG_TRUSTED_KEYS) += trusted.o
+trusted-y += trusted_tpm1.o
diff --git a/security/keys/trusted.c b/security/keys/trusted-keys/trusted_tpm1.c
similarity index 99%
rename from security/keys/trusted.c
rename to security/keys/trusted-keys/trusted_tpm1.c
index f7134d6..66687e7 100644
--- a/security/keys/trusted.c
+++ b/security/keys/trusted-keys/trusted_tpm1.c
@@ -27,7 +27,7 @@
 #include <linux/tpm.h>
 #include <linux/tpm_command.h>
 
-#include <keys/trusted.h>
+#include <keys/trusted_tpm.h>
 
 static const char hmac_alg[] = "hmac(sha1)";
 static const char hash_alg[] = "sha1";
-- 
2.7.4

