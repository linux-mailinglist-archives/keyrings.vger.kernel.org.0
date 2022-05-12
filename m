Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE8B52464F
	for <lists+keyrings@lfdr.de>; Thu, 12 May 2022 09:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350621AbiELHBw (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 12 May 2022 03:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350652AbiELHBo (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 12 May 2022 03:01:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E82D4990D
        for <keyrings@vger.kernel.org>; Thu, 12 May 2022 00:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652338898;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Mevjy/DGPy4eqIk5EbdLPFrJaGfCXH1nWhTn6iIdPnc=;
        b=h0Alj0t096FzvHDlGiZ3qyd8ZJw6mVhfYxd8+w8Uk2sKO3GWAHC0DK1CInnIfSn98sXyZ3
        G+/2m7v6gHj6RasFK9+Vsx1wBlsglXR6Xws+ZbXffc4op5BEB8DkFtFGWBvhZgauXay7KA
        8QB9Qyz8zcNUQKVVXLJyS5fnEnMqOBQ=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-3NUJCFz_MtmuoxRf2Dat6g-1; Thu, 12 May 2022 03:01:37 -0400
X-MC-Unique: 3NUJCFz_MtmuoxRf2Dat6g-1
Received: by mail-pg1-f200.google.com with SMTP id y17-20020a637d11000000b003ab06870074so2191561pgc.15
        for <keyrings@vger.kernel.org>; Thu, 12 May 2022 00:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mevjy/DGPy4eqIk5EbdLPFrJaGfCXH1nWhTn6iIdPnc=;
        b=6CaSCYdJ2sPJUeRUA5Z90/rT2q/IaZ/azZsXC5QaZGv8L3IRPN34zjCuVjCx6/MUuo
         ZMDycmRnoj2/33ZhSWbQxOaDonxedGA0E58GJluR3lxKW/9mskHsO3GN57SLxkjSiDgN
         fhwtTt/dLoLtfMLjh1TRzGs2hkZT4OXmBrnl9RO8o2c81myQc3gGVT5Y4n8j35pOZ5ts
         JdyDQBBOym60wLScx7BQyPZ3Sx5a8rtatiB8GnSauZB5H6kgz4m44TtcRjkRZorFKl+v
         Fl1yFsdmLiZEgnNfshuf7aMF4aW/fn3/9kpvJQtt+wBjLJAjNdAaN42QeH2flWxFikWu
         wVyw==
X-Gm-Message-State: AOAM5312bCS5b/pBmx3eIQXV2b6gVJ7eoTbl2vqYPkEZO7EFtYuTarj1
        6dw6B3Af6A2n7oprBwqbdxcTlmfw3S9XJ7TLVnzDuK9lHSaryGUu0EcEV8oeA9k5d9SpWgAfig2
        sx2/zEaR19yWJWK79lmw=
X-Received: by 2002:a17:90b:50b:b0:1dc:a0b1:c783 with SMTP id r11-20020a17090b050b00b001dca0b1c783mr9496044pjz.49.1652338895888;
        Thu, 12 May 2022 00:01:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL7dbJyojSNiYp6yhVPBLmJfJDRySqPe4tUcXYdPqOzrvmcXE2jXe5MahLEz2xxAmrohNavg==
X-Received: by 2002:a17:90b:50b:b0:1dc:a0b1:c783 with SMTP id r11-20020a17090b050b00b001dca0b1c783mr9496032pjz.49.1652338895671;
        Thu, 12 May 2022 00:01:35 -0700 (PDT)
Received: from localhost ([240e:3a1:2e9:efa0:e73c:e550:ac9e:58fd])
        by smtp.gmail.com with ESMTPSA id gn21-20020a17090ac79500b001d903861194sm1082640pjb.30.2022.05.12.00.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 00:01:35 -0700 (PDT)
From:   Coiby Xu <coxu@redhat.com>
To:     kexec@lists.infradead.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Michal Suchanek <msuchanek@suse.de>,
        Baoquan He <bhe@redhat.com>, Dave Young <dyoung@redhat.com>,
        Will Deacon <will@kernel.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Mimi Zohar <zohar@linux.ibm.com>, Chun-Yi Lee <jlee@suse.com>,
        stable@vger.kernel.org, keyrings@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        James Morse <james.morse@arm.com>,
        AKASHI Takahiro <takahiro.akashi@linaro.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v8 3/4] arm64: kexec_file: use more system keyrings to verify kernel image signature
Date:   Thu, 12 May 2022 15:01:22 +0800
Message-Id: <20220512070123.29486-4-coxu@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220512070123.29486-1-coxu@redhat.com>
References: <20220512070123.29486-1-coxu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Currently, a problem faced by arm64 is if a kernel image is signed by a
MOK key, loading it via the kexec_file_load() system call would be
rejected with the error "Lockdown: kexec: kexec of unsigned images is
restricted; see man kernel_lockdown.7".

This happens because image_verify_sig uses only the primary keyring that
contains only kernel built-in keys to verify the kexec image.

This patch allows to verify arm64 kernel image signature using not only
.builtin_trusted_keys but also .platform and .secondary_trusted_keys
keyring.

Fixes: 732b7b93d849 ("arm64: kexec_file: add kernel signature verification support")
Cc: stable@vger.kernel.org # 34d5960af253: kexec: clean up arch_kexec_kernel_verify_sig
Cc: stable@vger.kernel.org # 83b7bb2d49ae: kexec, KEYS: make the code in bzImage64_verify_sig generic
Acked-by: Baoquan He <bhe@redhat.com>
Cc: kexec@lists.infradead.org
Cc: keyrings@vger.kernel.org
Cc: linux-security-module@vger.kernel.org
Co-developed-by: Michal Suchanek <msuchanek@suse.de>
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 arch/arm64/kernel/kexec_image.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index 9ec34690e255..5ed6a585f21f 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -14,7 +14,6 @@
 #include <linux/kexec.h>
 #include <linux/pe.h>
 #include <linux/string.h>
-#include <linux/verification.h>
 #include <asm/byteorder.h>
 #include <asm/cpufeature.h>
 #include <asm/image.h>
@@ -130,18 +129,10 @@ static void *image_load(struct kimage *image,
 	return NULL;
 }
 
-#ifdef CONFIG_KEXEC_IMAGE_VERIFY_SIG
-static int image_verify_sig(const char *kernel, unsigned long kernel_len)
-{
-	return verify_pefile_signature(kernel, kernel_len, NULL,
-				       VERIFYING_KEXEC_PE_SIGNATURE);
-}
-#endif
-
 const struct kexec_file_ops kexec_image_ops = {
 	.probe = image_probe,
 	.load = image_load,
 #ifdef CONFIG_KEXEC_IMAGE_VERIFY_SIG
-	.verify_sig = image_verify_sig,
+	.verify_sig = kexec_kernel_verify_pe_sig,
 #endif
 };
-- 
2.35.3

