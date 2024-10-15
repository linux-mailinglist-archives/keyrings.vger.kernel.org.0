Return-Path: <keyrings+bounces-2209-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A892699FB60
	for <lists+keyrings@lfdr.de>; Wed, 16 Oct 2024 00:23:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9E001C23BDA
	for <lists+keyrings@lfdr.de>; Tue, 15 Oct 2024 22:23:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B2B61F818D;
	Tue, 15 Oct 2024 22:22:59 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AEF1D63D1;
	Tue, 15 Oct 2024 22:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729030979; cv=none; b=EuQ37T/V/kAWMXIaAAor2M3FbIvPiLNv/L6GHuFa4aoQ1w5uFlRcI9hah+8fFUl3i4ldFpRoxrl6Mg3HVzjKftWasiEkp8XQFNnhB8Fa7Ehd7WJf9AAe9ikkYLC61v8kjBmwfQIp52RPkuB5Q1freYA3teE0zGPATlhGY96Yxpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729030979; c=relaxed/simple;
	bh=ROp3gViwuilByaFBglCxEIAqRG+QJMVwFVRVm1Z13d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NaaDypZZEA2gh0rKhbTzaXmn+aXJOywwSe8Gshe+E4cjGMP+U6CejaZ89064l3IomOQTcdNO7ejDkPga4FhHz8zI/xBt7pKlYCVAuihO7Xhe7FaIxkOZTswN6BGkVZOcXrLliFlJCYU4dNuyNMSADh85G1LNtDoRRkdxIAD/tYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 52CE416A3;
	Tue, 15 Oct 2024 15:23:26 -0700 (PDT)
Received: from u200865.usa.arm.com (U203867.austin.arm.com [10.118.30.35])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E62C3F71E;
	Tue, 15 Oct 2024 15:22:56 -0700 (PDT)
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
Subject: [RFC 5/5] initramfs: Enforce initramfs signature
Date: Tue, 15 Oct 2024 17:22:35 -0500
Message-ID: <20241015222235.71040-6-jeremy.linton@arm.com>
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

Now that the infrastructure is in place to verify and sign initramfs
images, let's refuse them if the signature is invalid. Additionally, a
command-line option `initrdsig=[enforcing|checking]` is provided to
switch between failing to boot or reporting signature failures.

Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
---
 init/initramfs.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/init/initramfs.c b/init/initramfs.c
index d2d2c68016c2..bb42ba6c0730 100644
--- a/init/initramfs.c
+++ b/init/initramfs.c
@@ -573,6 +573,20 @@ static int __init initramfs_async_setup(char *str)
 }
 __setup("initramfs_async=", initramfs_async_setup);
 
+static bool  __initdata enforce_initrd_sig = IS_ENABLED(CONFIG_INITRAMFS_SIG);
+#ifdef CONFIG_INITRAMFS_SIG
+static int __init initrd_sig_setup(char *str)
+{
+	if (!strcmp(str, "enforcing"))
+		enforce_initrd_sig = true;
+	else if (!strcmp(str, "checking"))
+		enforce_initrd_sig = false;
+	return 1;
+}
+__setup("initrdsig=", initrd_sig_setup);
+#endif
+
+
 extern char __initramfs_start[];
 extern unsigned long __initramfs_size;
 #include <linux/initrd.h>
@@ -766,7 +780,10 @@ static void __init do_populate_rootfs(void *unused, async_cookie_t cookie)
 	else
 		printk(KERN_INFO "Unpacking initramfs...\n");
 
-	initrd_signature_check(&initrd_len);
+	if (initrd_signature_check(&initrd_len) && enforce_initrd_sig) {
+		printk(KERN_EMERG "Initramfs signature required\n");
+		goto done;
+	}
 
 	err = unpack_to_rootfs((char *)initrd_start, initrd_len);
 	if (err) {
-- 
2.46.0


