Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3877D1C61
	for <lists+keyrings@lfdr.de>; Thu, 10 Oct 2019 01:04:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731959AbfJIXE4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 9 Oct 2019 19:04:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:34230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731763AbfJIXE4 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Wed, 9 Oct 2019 19:04:56 -0400
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown [104.132.1.77])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EB9BB206BB;
        Wed,  9 Oct 2019 23:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570662295;
        bh=jCz6Xn+ITPG6KQzjH5NK5bfHDwh9XWR1dqiUGclxGts=;
        h=From:To:Subject:Date:From;
        b=jyKjTIL+alSfD+My6dbEIZypsXbP71qiL8aSDAkZHpzBE4KUKO9lzSrpxu4EyoaMq
         qpOk2d9UDBCG9knb/VYqBZjgVnSptuslgTr4LEwkbOnS/ztxEdhr6u4EAaoDWlIlOH
         ULIwCvN/PcMqZpT5NPrMmU7jMsA1URAwQtRLDBCw=
From:   Eric Biggers <ebiggers@kernel.org>
To:     David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        keyrings@vger.kernel.org
Subject: [PATCH RESEND] KEYS: remove CONFIG_KEYS_COMPAT
Date:   Wed,  9 Oct 2019 16:04:43 -0700
Message-Id: <20191009230443.127512-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.23.0.581.g78d2f28ef7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

KEYS_COMPAT now always takes the value of COMPAT && KEYS.  But the
security/keys/ directory is only compiled if KEYS is enabled, so in
practice KEYS_COMPAT is the same as COMPAT.  Therefore, remove the
unnecessary KEYS_COMPAT and just use COMPAT directly.

(Also remove an outdated comment from compat.c.)

Reviewed-by: James Morris <jamorris@linux.microsoft.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 security/keys/Kconfig    | 4 ----
 security/keys/Makefile   | 2 +-
 security/keys/compat.c   | 5 -----
 security/keys/internal.h | 4 ++--
 4 files changed, 3 insertions(+), 12 deletions(-)

diff --git a/security/keys/Kconfig b/security/keys/Kconfig
index dd313438fecf9..47c041563d41c 100644
--- a/security/keys/Kconfig
+++ b/security/keys/Kconfig
@@ -21,10 +21,6 @@ config KEYS
 
 	  If you are unsure as to whether this is required, answer N.
 
-config KEYS_COMPAT
-	def_bool y
-	depends on COMPAT && KEYS
-
 config KEYS_REQUEST_CACHE
 	bool "Enable temporary caching of the last request_key() result"
 	depends on KEYS
diff --git a/security/keys/Makefile b/security/keys/Makefile
index 9cef54064f608..c694458d9a46c 100644
--- a/security/keys/Makefile
+++ b/security/keys/Makefile
@@ -17,7 +17,7 @@ obj-y := \
 	request_key_auth.o \
 	user_defined.o
 compat-obj-$(CONFIG_KEY_DH_OPERATIONS) += compat_dh.o
-obj-$(CONFIG_KEYS_COMPAT) += compat.o $(compat-obj-y)
+obj-$(CONFIG_COMPAT) += compat.o $(compat-obj-y)
 obj-$(CONFIG_PROC_FS) += proc.o
 obj-$(CONFIG_SYSCTL) += sysctl.o
 obj-$(CONFIG_PERSISTENT_KEYRINGS) += persistent.o
diff --git a/security/keys/compat.c b/security/keys/compat.c
index 9bcc404131aa0..b975f8f11124b 100644
--- a/security/keys/compat.c
+++ b/security/keys/compat.c
@@ -46,11 +46,6 @@ static long compat_keyctl_instantiate_key_iov(
 
 /*
  * The key control system call, 32-bit compatibility version for 64-bit archs
- *
- * This should only be called if the 64-bit arch uses weird pointers in 32-bit
- * mode or doesn't guarantee that the top 32-bits of the argument registers on
- * taking a 32-bit syscall are zero.  If you can, you should call sys_keyctl()
- * directly.
  */
 COMPAT_SYSCALL_DEFINE5(keyctl, u32, option,
 		       u32, arg2, u32, arg3, u32, arg4, u32, arg5)
diff --git a/security/keys/internal.h b/security/keys/internal.h
index c039373488bd9..ba3e2da14ceff 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -264,7 +264,7 @@ extern long keyctl_dh_compute(struct keyctl_dh_params __user *, char __user *,
 			      size_t, struct keyctl_kdf_params __user *);
 extern long __keyctl_dh_compute(struct keyctl_dh_params __user *, char __user *,
 				size_t, struct keyctl_kdf_params *);
-#ifdef CONFIG_KEYS_COMPAT
+#ifdef CONFIG_COMPAT
 extern long compat_keyctl_dh_compute(struct keyctl_dh_params __user *params,
 				char __user *buffer, size_t buflen,
 				struct compat_keyctl_kdf_params __user *kdf);
@@ -279,7 +279,7 @@ static inline long keyctl_dh_compute(struct keyctl_dh_params __user *params,
 	return -EOPNOTSUPP;
 }
 
-#ifdef CONFIG_KEYS_COMPAT
+#ifdef CONFIG_COMPAT
 static inline long compat_keyctl_dh_compute(
 				struct keyctl_dh_params __user *params,
 				char __user *buffer, size_t buflen,
-- 
2.23.0.581.g78d2f28ef7-goog

