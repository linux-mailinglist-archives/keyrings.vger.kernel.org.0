Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7AE9564B5B
	for <lists+keyrings@lfdr.de>; Mon,  4 Jul 2022 03:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbiGDBwo (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 3 Jul 2022 21:52:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbiGDBwm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 3 Jul 2022 21:52:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2106062DA
        for <keyrings@vger.kernel.org>; Sun,  3 Jul 2022 18:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656899560;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nTUj8DskjrdqH+782mh4voi0bsQ4nV3nMCPn/39C26o=;
        b=bC5pxHHrA7d2G3z3qo5YBU/jcSbpFN4GXx+5Gd7dDS2TFUlJKZ+qFRRpGoh7a3U852tFz4
        TEJCiNs0sMeDtOwcJjkRgq/HecjUBe7sIFReen4vg16BsQM6OUkLFHxhiWSOs5Z+7ybLAW
        ueSn40wCi3BwLSKGAtpVAlL1O/QmN0Y=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-vA4WMQs7NiCA4FSdO4ZWwg-1; Sun, 03 Jul 2022 21:52:39 -0400
X-MC-Unique: vA4WMQs7NiCA4FSdO4ZWwg-1
Received: by mail-pj1-f72.google.com with SMTP id e7-20020a17090ac20700b001ef839c824cso1108462pjt.6
        for <keyrings@vger.kernel.org>; Sun, 03 Jul 2022 18:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nTUj8DskjrdqH+782mh4voi0bsQ4nV3nMCPn/39C26o=;
        b=orf7BHqnn7l0gRdJnI87mfsOV29B28fnlIyzYFDdXt8w+fkb+FombVOZFcRanJFMzf
         7neHEgckUMqCg1goZ3xjdrXZ4QmP3K1szyebYe1LruJgMCoow09mh9/CgGEGak3twXF2
         xschq83vBYrWVnCVa8aCue102LIeqI46dUsRP1IwI9k70M344jyw1z1ycWmiGK8MlNmc
         +WM62GeWI+Npba+YvVTvwIGrDmjS0BpClndTdPedV7oQpMs15R+JSPwagDZvc5gwvb1m
         gP4yePu26K3HQQ/PFAD/GyMGzTEvWFBwvRgP1QVambSRMbjIHXKcyM25oDWqnkRHxLtZ
         McQw==
X-Gm-Message-State: AJIora89atd3AopTolC4Wq8k2egAZyyXaoK+eSJwpLhl0e6pG51N0IBy
        qNtoxj7rfLCOdiL2ge3fHB/6+QapgQS+DDPes4o9WgCbVzMA41Fc88uHOpcsjYKu/8gevQAlBfO
        8Vpsc7LWcI0kQNP9WIWI=
X-Received: by 2002:a05:6a00:14d3:b0:528:486d:d576 with SMTP id w19-20020a056a0014d300b00528486dd576mr10568885pfu.24.1656899556862;
        Sun, 03 Jul 2022 18:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sPC0DInjaucHaeeAE1l8WghG5rlTMFBew3zvn/xHz/06n1jLEOyrEMAmRej9+XCnhiWSv1dg==
X-Received: by 2002:a05:6a00:14d3:b0:528:486d:d576 with SMTP id w19-20020a056a0014d300b00528486dd576mr10568874pfu.24.1656899556610;
        Sun, 03 Jul 2022 18:52:36 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id i13-20020a17090332cd00b0016b7c557e08sm11927704plr.56.2022.07.03.18.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 18:52:36 -0700 (PDT)
From:   Coiby Xu <coxu@redhat.com>
To:     kexec@lists.infradead.org, linux-integrity@vger.kernel.org
Cc:     Mimi Zohar <zohar@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org,
        Michal Suchanek <msuchanek@suse.de>,
        Baoquan He <bhe@redhat.com>, Dave Young <dyoung@redhat.com>,
        Will Deacon <will@kernel.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Chun-Yi Lee <jlee@suse.com>, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
        "H. Peter Anvin" <hpa@zytor.com>,
        linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND
        64-BIT))
Subject: [PATCH v9 2/4] kexec, KEYS: make the code in bzImage64_verify_sig generic
Date:   Mon,  4 Jul 2022 09:51:59 +0800
Message-Id: <20220704015201.59744-3-coxu@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220704015201.59744-1-coxu@redhat.com>
References: <20220704015201.59744-1-coxu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

commit 278311e417be ("kexec, KEYS: Make use of platform keyring for
signature verify") adds platform keyring support on x86 kexec but not
arm64.

The code in bzImage64_verify_sig uses the keys on the
.builtin_trusted_keys, .machine, if configured and enabled,
.secondary_trusted_keys, also if configured, and .platform keyrings
to verify the signed kernel image as PE file.

Cc: kexec@lists.infradead.org
Cc: keyrings@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
Reviewed-by: Michal Suchanek <msuchanek@suse.de>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 arch/x86/kernel/kexec-bzimage64.c | 20 +-------------------
 include/linux/kexec.h             |  6 ++++++
 kernel/kexec_file.c               | 17 +++++++++++++++++
 3 files changed, 24 insertions(+), 19 deletions(-)

diff --git a/arch/x86/kernel/kexec-bzimage64.c b/arch/x86/kernel/kexec-bzimage64.c
index 170d0fd68b1f..f299b48f9c9f 100644
--- a/arch/x86/kernel/kexec-bzimage64.c
+++ b/arch/x86/kernel/kexec-bzimage64.c
@@ -17,7 +17,6 @@
 #include <linux/kernel.h>
 #include <linux/mm.h>
 #include <linux/efi.h>
-#include <linux/verification.h>
 
 #include <asm/bootparam.h>
 #include <asm/setup.h>
@@ -528,28 +527,11 @@ static int bzImage64_cleanup(void *loader_data)
 	return 0;
 }
 
-#ifdef CONFIG_KEXEC_BZIMAGE_VERIFY_SIG
-static int bzImage64_verify_sig(const char *kernel, unsigned long kernel_len)
-{
-	int ret;
-
-	ret = verify_pefile_signature(kernel, kernel_len,
-				      VERIFY_USE_SECONDARY_KEYRING,
-				      VERIFYING_KEXEC_PE_SIGNATURE);
-	if (ret == -ENOKEY && IS_ENABLED(CONFIG_INTEGRITY_PLATFORM_KEYRING)) {
-		ret = verify_pefile_signature(kernel, kernel_len,
-					      VERIFY_USE_PLATFORM_KEYRING,
-					      VERIFYING_KEXEC_PE_SIGNATURE);
-	}
-	return ret;
-}
-#endif
-
 const struct kexec_file_ops kexec_bzImage64_ops = {
 	.probe = bzImage64_probe,
 	.load = bzImage64_load,
 	.cleanup = bzImage64_cleanup,
 #ifdef CONFIG_KEXEC_BZIMAGE_VERIFY_SIG
-	.verify_sig = bzImage64_verify_sig,
+	.verify_sig = kexec_kernel_verify_pe_sig,
 #endif
 };
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index e3125fae1599..620018bbc419 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -19,6 +19,7 @@
 #include <asm/io.h>
 
 #include <uapi/linux/kexec.h>
+#include <linux/verification.h>
 
 /* Location of a reserved region to hold the crash kernel.
  */
@@ -194,6 +195,11 @@ int arch_kexec_kernel_image_probe(struct kimage *image, void *buf,
 				  unsigned long buf_len);
 void *arch_kexec_kernel_image_load(struct kimage *image);
 int arch_kimage_file_post_load_cleanup(struct kimage *image);
+#ifdef CONFIG_KEXEC_SIG
+#ifdef CONFIG_SIGNED_PE_FILE_VERIFICATION
+int kexec_kernel_verify_pe_sig(const char *kernel, unsigned long kernel_len);
+#endif
+#endif
 int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf);
 
 extern int kexec_add_buffer(struct kexec_buf *kbuf);
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index c7cbadc754a1..db6e89128b98 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -131,6 +131,23 @@ void kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_KEXEC_SIG
+#ifdef CONFIG_SIGNED_PE_FILE_VERIFICATION
+int kexec_kernel_verify_pe_sig(const char *kernel, unsigned long kernel_len)
+{
+	int ret;
+
+	ret = verify_pefile_signature(kernel, kernel_len,
+				      VERIFY_USE_SECONDARY_KEYRING,
+				      VERIFYING_KEXEC_PE_SIGNATURE);
+	if (ret == -ENOKEY && IS_ENABLED(CONFIG_INTEGRITY_PLATFORM_KEYRING)) {
+		ret = verify_pefile_signature(kernel, kernel_len,
+					      VERIFY_USE_PLATFORM_KEYRING,
+					      VERIFYING_KEXEC_PE_SIGNATURE);
+	}
+	return ret;
+}
+#endif
+
 static int kexec_image_verify_sig(struct kimage *image, void *buf,
 		unsigned long buf_len)
 {
-- 
2.35.3

