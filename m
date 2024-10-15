Return-Path: <keyrings+bounces-2207-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3834A99FB57
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2024 00:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 914741F22863
	for <lists+keyrings@lfdr.de>; Tue, 15 Oct 2024 22:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B811D63E4;
	Tue, 15 Oct 2024 22:22:57 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD781B6CED;
	Tue, 15 Oct 2024 22:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729030977; cv=none; b=NCbFFRuugUkMZlbNfeJ/dTbfWADR3fEcOFrxhzxo565Ip8k9cN6Kqt9qlBtHelX3joHb4l7uUOB49FGaompuwF/T1AMeXTwcDyzWLdx9AUyiKzB4gr+JQXZ5v8EXIjZjV+LzpT83tC3evC0nlCudYZEN2Jkp+V6sa4j33tYN+Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729030977; c=relaxed/simple;
	bh=BqOeHEtc1k32tWuUWaZhaEli3OQ7/QlXnTlOvCW7df4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SK7puA3ux2LjDTE281AReWJc7NvDFrvAK1ly88sHBhVl4AHxzfqxfIQ+8xctW7WtccL5C/XAy8S+WKOpxkYIEpwwySNqqpNbnkxfdoXADGX9K4Z1PCyMcLoqI8VPMRopJFWB8HSNllOV4hHRVqHoS0AMqJ309Qy2zHGXldL6Az4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C9811692;
	Tue, 15 Oct 2024 15:23:25 -0700 (PDT)
Received: from u200865.usa.arm.com (U203867.austin.arm.com [10.118.30.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 784793F71E;
	Tue, 15 Oct 2024 15:22:55 -0700 (PDT)
From: Jeremy Linton <jeremy.linton@arm.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	hch@lst.de,
	gregkh@linuxfoundation.org,
	graf@amazon.com,
	lukas@wunner.de,
	wufan@linux.microsoft.com,
	brauner@kernel.org,
	jsperbeck@google.com,
	ardb@kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	keyrings@vger.kernel.org,
	Jeremy Linton <jeremy.linton@arm.com>
Subject: [RFC 3/5] initramfs: Use existing module signing infrastructure
Date: Tue, 15 Oct 2024 17:22:33 -0500
Message-ID: <20241015222235.71040-4-jeremy.linton@arm.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241015222235.71040-1-jeremy.linton@arm.com>
References: <20241015222235.71040-1-jeremy.linton@arm.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adding some security checks around the configuration data and early
init processes running on the machine is a good idea. There is a move
to do this via systemd UKIs using the UEFI and shim infrastructure to
wrap a kernel and its associated initramfs into a single PE
executable, which is then validated and measured together. The
existing kernel boot methods can also provide a similar level of
security by leveraging the kernel's signing and validation
infrastructure to check a signature on the initramfs.

Kernel-validated initramfs images maintain the existing UEFI boot flow
while enabling functionality on non-UEFI machines. They keep the UEFI
secure boot verification separate from current and future choices over
how the kernel verifies data used after it boots. Additionally, this
makes it possible for multiple signed initramfs images, for example,
debug and recovery images, to share a single kernel image.

Let's reuse the kernel's sign-file utility, which appends a trailing
signature, signature description, and module signature string to sign
the initramfs. Then, immediately before we unpack the image, detect if
there is a signature, validate it, and strip it off. Then, with a
later patch, we can decide what happens when the image is unsigned or
cannot be verified.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 include/linux/initrd.h |  3 ++
 init/initramfs.c       | 67 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/include/linux/initrd.h b/include/linux/initrd.h
index f1a1f4c92ded..e123d3cb39bb 100644
--- a/include/linux/initrd.h
+++ b/include/linux/initrd.h
@@ -5,6 +5,9 @@
 
 #define INITRD_MINOR 250 /* shouldn't collide with /dev/ram* too soon ... */
 
+/* the len here equals the modsig string len */
+#define INITRD_SIG_STRING "~initrd signature appended~\n"
+
 /* starting block # of image */
 extern int rd_image_start;
 
diff --git a/init/initramfs.c b/init/initramfs.c
index bc911e466d5b..d2d2c68016c2 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/init.h>
+#include <linux/initrd.h>
 #include <linux/async.h>
 #include <linux/fs.h>
 #include <linux/slab.h>
@@ -14,6 +15,7 @@
 #include <linux/kstrtox.h>
 #include <linux/memblock.h>
 #include <linux/mm.h>
+#include <linux/module_signature.h>
 #include <linux/namei.h>
 #include <linux/init_syscalls.h>
 #include <linux/umh.h>
@@ -688,8 +690,69 @@ static void __init populate_initrd_image(char *err)
 }
 #endif /* CONFIG_BLK_DEV_RAM */
 
+static int __init initrd_signature_check(size_t *initrd_len)
+{
+	struct module_signature *ms;
+	size_t sig_len;
+	int ret = -ENODATA;
+	const size_t m_len = sizeof(INITRD_SIG_STRING) - 1;
+
+	*initrd_len = (initrd_end - initrd_start);
+
+	if (*initrd_len < (m_len + sizeof(*ms)))
+		goto fail;
+
+	if (memcmp((char *)(initrd_end - m_len), INITRD_SIG_STRING, m_len)) {
+		pr_info("unsigned initramfs\n");
+		goto fail;
+	}
+
+	/* remove module sig string from len computations going forward */
+	*initrd_len -= m_len;
+
+	ms = (struct module_signature *)(initrd_end - sizeof(*ms) - m_len);
+
+	ret = mod_check_sig(ms, *initrd_len, "initramfs");
+	if (ret)
+		goto fail;
+
+	sig_len = be32_to_cpu(ms->sig_len);
+	*initrd_len -= sizeof(*ms) + sig_len;
+
+#ifdef CONFIG_INITRAMFS_SIG
+	ret = verify_pkcs7_signature((char *)initrd_start, *initrd_len,
+				     (char *)(initrd_start + *initrd_len),
+				     sig_len,
+				     VERIFY_USE_SECONDARY_KEYRING,
+				     VERIFYING_UNSPECIFIED_SIGNATURE,
+				     NULL, NULL);
+
+	switch (ret) {
+	case 0:
+		pr_info("initramfs: valid signature\n");
+		break;
+	case -ENODATA:
+		pr_err("initramfs: invalid signature\n");
+		break;
+	case -ENOPKG:
+		pr_err("initramfs: unsupported crypto\n");
+		break;
+	case -ENOKEY:
+		pr_err("initramfs: unknown key\n");
+		break;
+	default:
+		pr_err("initramfs: unknown error %d\n", ret);
+	}
+#endif
+
+fail:
+	return ret;
+}
+
 static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 {
+	size_t initrd_len;
+
 	/* Load the built in initramfs */
 	char *err = unpack_to_rootfs(__initramfs_start, __initramfs_size);
 	if (err)
@@ -703,7 +766,9 @@ static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 	else
 		printk(KERN_INFO "Unpacking initramfs...\n");
 
-	err = unpack_to_rootfs((char *)initrd_start, initrd_end - initrd_start);
+	initrd_signature_check(&initrd_len);
+
+	err = unpack_to_rootfs((char *)initrd_start, initrd_len);
 	if (err) {
 #ifdef CONFIG_BLK_DEV_RAM
 		populate_initrd_image(err);
-- 
2.46.0


