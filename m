Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897D7444379
	for <lists+keyrings@lfdr.de>; Wed,  3 Nov 2021 15:27:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbhKCO3v (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 3 Nov 2021 10:29:51 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:52468 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231679AbhKCO3u (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 3 Nov 2021 10:29:50 -0400
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
        by smtp-out2.suse.de (Postfix) with ESMTP id 005D21FD39;
        Wed,  3 Nov 2021 14:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1635949633; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WjVRAY/znLnXw9klPTASWRvUFX89s7VJBB58DLKxfUQ=;
        b=hPdDISF7zAFlR3D1VghEwmjLHCyJzAEZGI0T8s7i9kBvzyNFjrw+frUJBJfEZeC8Ip0b2k
        9CYntkKVcibvtIt4bOiDd2rt7wfUJMSf6sMOczsmStyf+tPif9oe5fW8uRhLvXi6kodmy2
        B8ic5OKRxc3H7Yhx3sv/wI4gfMCqG1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1635949633;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WjVRAY/znLnXw9klPTASWRvUFX89s7VJBB58DLKxfUQ=;
        b=M/L7iHHfkmz+2rw50TnNglTComYCUk4dpfnWf3iG+LhOoQW3W2vt25Q5xGT8rHAr1z6NTC
        faUcUhialZOVm3AQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
        by relay2.suse.de (Postfix) with ESMTP id D155AA3B92;
        Wed,  3 Nov 2021 14:27:12 +0000 (UTC)
From:   Michal Suchanek <msuchanek@suse.de>
To:     keyrings@vger.kernel.org
Cc:     Michal Suchanek <msuchanek@suse.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        David Howells <dhowells@redhat.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>, Rob Herring <robh@kernel.org>,
        Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Frank van der Linden <fllinden@amazon.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: [PATCH 3/3] powerpc/kexec_file: Add KEXEC_SIG support.
Date:   Wed,  3 Nov 2021 15:27:08 +0100
Message-Id: <ba7ffddf9e15288baeae6c2099e573509321738c.1635948742.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635948742.git.msuchanek@suse.de>
References: <cover.1635948742.git.msuchanek@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Use the module verifier for the kernel image verification.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/Kconfig        | 11 +++++++++++
 arch/powerpc/kexec/elf_64.c | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 743c9783c64f..27bffafa9e79 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -558,6 +558,17 @@ config KEXEC_FILE
 config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
+config KEXEC_SIG
+	bool "Verify kernel signature during kexec_file_load() syscall"
+	depends on KEXEC_FILE && MODULE_SIG_FORMAT
+	help
+	  This option makes kernel signature verification mandatory for
+	  the kexec_file_load() syscall.
+
+	  In addition to that option, you need to enable signature
+	  verification for the corresponding kernel image type being
+	  loaded in order for this to work.
+
 config PPC64_BUILD_ELF_V2_ABI
 	bool
 
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index eeb258002d1e..e8dff6b23ac5 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -23,6 +23,7 @@
 #include <linux/of_fdt.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/verification.h>
 
 static void *elf64_load(struct kimage *image, char *kernel_buf,
 			unsigned long kernel_len, char *initrd,
@@ -151,7 +152,20 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	return ret ? ERR_PTR(ret) : NULL;
 }
 
+#ifdef CONFIG_KEXEC_SIG
+int elf64_verify_sig(const char *kernel, unsigned long length)
+{
+	size_t kernel_len = length;
+
+	return verify_appended_signature(kernel, &kernel_len, VERIFY_USE_PLATFORM_KEYRING,
+					 "kexec_file");
+}
+#endif /* CONFIG_KEXEC_SIG */
+
 const struct kexec_file_ops kexec_elf64_ops = {
 	.probe = kexec_elf_probe,
 	.load = elf64_load,
+#ifdef CONFIG_KEXEC_SIG
+	.verify_sig = elf64_verify_sig,
+#endif
 };
-- 
2.31.1

