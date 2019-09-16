Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3729AB382F
	for <lists+keyrings@lfdr.de>; Mon, 16 Sep 2019 12:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730813AbfIPKf0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 16 Sep 2019 06:35:26 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40377 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730806AbfIPKf0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 16 Sep 2019 06:35:26 -0400
Received: by mail-pf1-f194.google.com with SMTP id x127so22736567pfb.7
        for <keyrings@vger.kernel.org>; Mon, 16 Sep 2019 03:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=vWhzdsB9uzCvRwKGknlCyYMC7XSQEgoYcx5GO5z/Lh8=;
        b=FDPriqTUPWFcKb3sARuBJvJwVUszQSO30TxZUq6p9pm/d0wIWU/VE6+GWbZpTP6RRv
         5jooIua7dr1KGZoF7JijV8Uq8WqiAYfcgBnaNNivjtied4pIADTQOUFDyHC37iFECHBC
         BzF4ZlCKNOkpdz+BnZX4qSqhO14FCxBi8IUTkErPpZcMb6fhpmNK+sPTOu1KcgiD8Uw+
         NYElPestVdaX18B9/zVWHZGkQfZYSxKPnMeRdMNGJYTtp1f00THuKp/Qp9Vhqf228S6F
         KlsWQWMSpAHdlKn+REMvw3aDmGqL25Q10pbXNauqYK3QAhp0BLJXE49ioBhbqMnAzLn2
         KsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=vWhzdsB9uzCvRwKGknlCyYMC7XSQEgoYcx5GO5z/Lh8=;
        b=d4YhU1ZUVg+q/7FVPn7pOg3ly4MaL0CtUVzXELJ7r+5VbV6IuT0RF2zhaIxyQZmfqg
         wFitIZE96hc2NoJix0JwSPxbRJol9Ro33JQlK6xtLb4v0bN09C10svJ3tjcjTtq9SANj
         w7GhbLsjij+lGYnf4jS4ep0KED9Hm8k0hJTZZwHwEqeivTlown8SC4M81GG5DBFjrMtb
         Brn52Qwpu8yv5GE375mn0PFeOUgLLHa2cSpkmQI6e++qkETBKo5leKqj/sTFnElq+Jg9
         uFPRusy3bepJ+eJpIlqZ/JkgE2bYS6xdCjH+AcMCUubcXjUgrPtXmrJZnZ82P7dRgtkm
         YvYA==
X-Gm-Message-State: APjAAAUkDS13DXHKr1RdROHOw1Fw4IuFRe6uT/tzZdoMXL61K/fALhFK
        NH/PDZbvaYXjbQ/vfAA+oY5HNw==
X-Google-Smtp-Source: APXvYqzJiUbb6ho+01tcJYW6wRsSksO4x3CcPVmZM7A3CU40HqTsc4+y8bhZJQ6gyiKtAZc5IiB+8g==
X-Received: by 2002:a63:4812:: with SMTP id v18mr26781025pga.83.1568630125215;
        Mon, 16 Sep 2019 03:35:25 -0700 (PDT)
Received: from localhost.localdomain ([117.252.69.68])
        by smtp.gmail.com with ESMTPSA id d14sm58256914pfh.36.2019.09.16.03.35.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 16 Sep 2019 03:35:24 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     jarkko.sakkinen@linux.intel.com, dhowells@redhat.com,
        peterhuewe@gmx.de
Cc:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-crypto@vger.kernel.org,
        linux-security-module@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, jgg@ziepe.ca, arnd@arndb.de,
        gregkh@linuxfoundation.org, jejb@linux.ibm.com,
        zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
        jsnitsel@redhat.com, linux-kernel@vger.kernel.org,
        daniel.thompson@linaro.org, Sumit Garg <sumit.garg@linaro.org>
Subject: [Patch v6 3/4] KEYS: trusted: Create trusted keys subsystem
Date:   Mon, 16 Sep 2019 16:04:23 +0530
Message-Id: <1568630064-14887-4-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568630064-14887-1-git-send-email-sumit.garg@linaro.org>
References: <1568630064-14887-1-git-send-email-sumit.garg@linaro.org>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Move existing code to trusted keys subsystem. Also, rename files with
"tpm" as suffix which provides the underlying implementation.

Suggested-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
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
index a2b2a61..d16d893 100644
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
index c38f0d4..a5801c0 100644
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
index 7071011..e3155fd 100644
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

