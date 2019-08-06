Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1B1832DD
	for <lists+keyrings@lfdr.de>; Tue,  6 Aug 2019 15:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731580AbfHFNik (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 6 Aug 2019 09:38:40 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:44673 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731584AbfHFNih (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 6 Aug 2019 09:38:37 -0400
Received: by mail-pf1-f193.google.com with SMTP id t16so41504835pfe.11
        for <keyrings@vger.kernel.org>; Tue, 06 Aug 2019 06:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vl9Wpi/Syv/6aGqe6I7JLyQ+9QJLPAtQrqCkcLZrp+g=;
        b=AmytCpKHIdrZWHvR3OE+nGmsWqILVMw1wCC5MLq6Puy+MdEVVQNfKiyT1t6ya0hCkK
         HEVZPa2AXThZy9HuXbWrnsHLLtpa5kVfU6mRqTst3KzU/OuJvgmVyY5zLUSzD/IxOHUa
         rZVd1BnBHi+OzBFG1eGaHfwGhgo4Y+0+MnlKGsLWRNZF6xa1GMLonvKQawTY3dXd18Jk
         1XM1PPf27wjwlPf9PLYg5chHTN4+zX7eE9wvykV+0w0l8DMqgpsp55rdtkZ6XBMNr/BM
         LHycmZNel8bd7IZvO8k/M9R+ysDwxyQ2IwgF1N7ShFPAx3+eTZ4rzESSJeJYeM/Qi6QP
         VSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vl9Wpi/Syv/6aGqe6I7JLyQ+9QJLPAtQrqCkcLZrp+g=;
        b=PLOsSpISTpKUDFD8M/DWGnil+iAsx5Yp372fQ2H+oChM+SVLNdmxC6MjvtfPUqQ9Mk
         9254TENZM2J7T+5lJV2j250TYhWMz5uOkj0sxN3jfYRo7dTofJrJQkEFl85vDjb8yFAD
         qGNt9Gty8AbjqYC4GGyq+noXsMb+PX+1kP3ViFNU/Xu11m9FL53hwzWNdaEZsgCtZ2U3
         nLCLDM9Ev7d7Og/VdTkN48PTROqDmx6+PK4UYnO9Cj5Yz+FYYJWXHeaXJhImMbRMHaVi
         JFl22hBWeMea9Zoq0T8Yz+EZv07WZEGjK6H1Nj7KOcwuMJUDNTo/Em1L+RwV+Mkssik/
         wyBg==
X-Gm-Message-State: APjAAAVpk9dQ/4AJ0HyN23tLFg3A1vQZ2aXURysiCPlgIy0WDXjPwP2v
        n5goR6EHeNMeq+gXL6xlXGyZjPDKl3I=
X-Google-Smtp-Source: APXvYqyZISzpTbT8n+UVN/vIHXvq88xBreL8dTcdkfzzWSFOUZYpLawCfghYi7aAE/yApimv+F9dJA==
X-Received: by 2002:a17:90a:24e4:: with SMTP id i91mr3425152pje.9.1565098716641;
        Tue, 06 Aug 2019 06:38:36 -0700 (PDT)
Received: from localhost.localdomain ([45.114.72.197])
        by smtp.gmail.com with ESMTPSA id l4sm89183984pff.50.2019.08.06.06.38.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 06 Aug 2019 06:38:35 -0700 (PDT)
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
Subject: [RFC/RFT v3 1/3] KEYS: trusted: create trusted keys subsystem
Date:   Tue,  6 Aug 2019 19:07:18 +0530
Message-Id: <1565098640-12536-2-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565098640-12536-1-git-send-email-sumit.garg@linaro.org>
References: <1565098640-12536-1-git-send-email-sumit.garg@linaro.org>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Move existing code to trusted keys subsystem. Also, rename files with
"tpm" as suffix which provides the underlying implementation.

Suggested-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 crypto/asymmetric_keys/asym_tpm.c                       | 2 +-
 include/keys/{trusted.h => trusted_tpm.h}               | 4 ++--
 security/keys/Makefile                                  | 2 +-
 security/keys/trusted-keys/Makefile                     | 6 ++++++
 security/keys/{trusted.c => trusted-keys/trusted-tpm.c} | 2 +-
 5 files changed, 11 insertions(+), 5 deletions(-)
 rename include/keys/{trusted.h => trusted_tpm.h} (98%)
 create mode 100644 security/keys/trusted-keys/Makefile
 rename security/keys/{trusted.c => trusted-keys/trusted-tpm.c} (99%)

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
 
diff --git a/include/keys/trusted.h b/include/keys/trusted_tpm.h
similarity index 98%
rename from include/keys/trusted.h
rename to include/keys/trusted_tpm.h
index 0071298..7d7b108 100644
--- a/include/keys/trusted.h
+++ b/include/keys/trusted_tpm.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __TRUSTED_KEY_H
-#define __TRUSTED_KEY_H
+#ifndef __TRUSTED_TPM_H
+#define __TRUSTED_TPM_H
 
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
index 0000000..ad34d17
--- /dev/null
+++ b/security/keys/trusted-keys/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for trusted keys
+#
+
+obj-$(CONFIG_TRUSTED_KEYS) += trusted-tpm.o
diff --git a/security/keys/trusted.c b/security/keys/trusted-keys/trusted-tpm.c
similarity index 99%
rename from security/keys/trusted.c
rename to security/keys/trusted-keys/trusted-tpm.c
index 9a94672..b7e53a3 100644
--- a/security/keys/trusted.c
+++ b/security/keys/trusted-keys/trusted-tpm.c
@@ -27,7 +27,7 @@
 #include <linux/tpm.h>
 #include <linux/tpm_command.h>
 
-#include <keys/trusted.h>
+#include <keys/trusted_tpm.h>
 
 static const char hmac_alg[] = "hmac(sha1)";
 static const char hash_alg[] = "sha1";
-- 
2.7.4

