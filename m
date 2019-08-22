Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFE3D99851
	for <lists+keyrings@lfdr.de>; Thu, 22 Aug 2019 17:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733074AbfHVPgJ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 22 Aug 2019 11:36:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:52196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732536AbfHVPgJ (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Thu, 22 Aug 2019 11:36:09 -0400
Received: from zzz.localdomain (ip-173-136-158-138.anahca.spcsdns.net [173.136.158.138])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E9A5F21743;
        Thu, 22 Aug 2019 15:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566488168;
        bh=aE3VBg0kvWvpgkdc21suFHuKEwyTWDtaqJfR6nBAhfw=;
        h=From:To:Cc:Subject:Date:From;
        b=z5Vx+HkNWMh4eY0VIioHrB0PqeoSX+DIvxI7IfclhOgvh43fuAw6hb9gpfrBWAWYo
         8KFYS9zKV4Isfy2NnIWsxqXO5Gh0+bmt1IlFvsWUaTDNXiPPKxhiUfm075AKqwB+/d
         CvtY7XHkeVNfD0FUjB6VyJycH0+k3Eo+/JZduaZw=
From:   Eric Biggers <ebiggers@kernel.org>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>
Cc:     James Morris <jamorris@linux.microsoft.com>
Subject: [PATCH RESEND] KEYS: remove CONFIG_KEYS_COMPAT
Date:   Thu, 22 Aug 2019 08:36:01 -0700
Message-Id: <20190822153601.9832-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.1
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
index dd313438fecf..47c041563d41 100644
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
index 9cef54064f60..c694458d9a46 100644
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
index b0e59546e7bd..c25971de61a4 100644
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
index e0c5bb8b1685..795c3fb5d51f 100644
--- a/security/keys/internal.h
+++ b/security/keys/internal.h
@@ -271,7 +271,7 @@ extern long keyctl_dh_compute(struct keyctl_dh_params __user *, char __user *,
 			      size_t, struct keyctl_kdf_params __user *);
 extern long __keyctl_dh_compute(struct keyctl_dh_params __user *, char __user *,
 				size_t, struct keyctl_kdf_params *);
-#ifdef CONFIG_KEYS_COMPAT
+#ifdef CONFIG_COMPAT
 extern long compat_keyctl_dh_compute(struct keyctl_dh_params __user *params,
 				char __user *buffer, size_t buflen,
 				struct compat_keyctl_kdf_params __user *kdf);
@@ -286,7 +286,7 @@ static inline long keyctl_dh_compute(struct keyctl_dh_params __user *params,
 	return -EOPNOTSUPP;
 }
 
-#ifdef CONFIG_KEYS_COMPAT
+#ifdef CONFIG_COMPAT
 static inline long compat_keyctl_dh_compute(
 				struct keyctl_dh_params __user *params,
 				char __user *buffer, size_t buflen,
-- 
2.22.1

