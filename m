Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 331D1564B53
	for <lists+keyrings@lfdr.de>; Mon,  4 Jul 2022 03:53:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbiGDBxD (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 3 Jul 2022 21:53:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233112AbiGDBwv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 3 Jul 2022 21:52:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 786536404
        for <keyrings@vger.kernel.org>; Sun,  3 Jul 2022 18:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656899567;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EE8ReJL35xooYMRcL0aldhKZVhFpWy3F9pc1cYwfnGA=;
        b=daa5dcZjjfddAH185hg0yr7ELDqins7Q1RY+3mYK/tnscIF9PgUA5EvH4zjgrMkfp0cZfM
        nAMGYneppMBFbKemYOo0hTJ7w/6CVjUTZCYLVyHRhyy76DIQSnVScmaFKVWQxgVVmL3Xsg
        Izh66graHUEkSv3VrSxFkS92GR9Goao=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-9UKVxUdSNbOxRTY_I6rFmw-1; Sun, 03 Jul 2022 21:52:46 -0400
X-MC-Unique: 9UKVxUdSNbOxRTY_I6rFmw-1
Received: by mail-pl1-f200.google.com with SMTP id e8-20020a17090301c800b0016a57150c37so4275053plh.3
        for <keyrings@vger.kernel.org>; Sun, 03 Jul 2022 18:52:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EE8ReJL35xooYMRcL0aldhKZVhFpWy3F9pc1cYwfnGA=;
        b=f7PmEh88s5PtvCEpVA94/4QZIIvTXhtkbd3sTYzU0M0AXocetdZmTkHKjzBmQi557k
         ghIJrhhr8khZwrS6ySkwpdgPbqVLZ2hUpn5bVXMAiBEOc4uehgzx2El/F5rvF6D7U8cY
         Im1Tr15/z4148ltv8SnubbgZXlRYxGJuk5HoyHtVhtxuehD9EJ/KrnRYKfhenI870vzx
         Z4a6FMW/G1jbQ3OcwjMjPiJIXPNdILDAUsU9+HxNoM2jLUGCjOI/ozlPXEiX7lYDaVht
         ObYFCTMTIl2pYdI8EgZ8SUG3Ma7h31vfoml8Pk8Hh9hm36YCdKVlO13kBGfgoO1eJd/0
         YKgQ==
X-Gm-Message-State: AJIora//r5oXUkUNGHUHadQ6/MHONR7HptdsvBf3RM2DUJCZBozEgXb2
        VdZuqAcafhYOViM9H32x4aSsOt3eJbRWscASpOXgReHzVI3bCGcRt4iHqxQbSuGf2FBU6fI6wV6
        L+ySvfo9207KBlMowLR0=
X-Received: by 2002:a17:90b:4d01:b0:1ef:54e4:f840 with SMTP id mw1-20020a17090b4d0100b001ef54e4f840mr19512584pjb.216.1656899565176;
        Sun, 03 Jul 2022 18:52:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vccVgOsoxySyE6jc8B09IaJFFIALoQ7zprfH6mR3bc+DIDyQRm0eLU55vBwyS03zmcKniWuQ==
X-Received: by 2002:a17:90b:4d01:b0:1ef:54e4:f840 with SMTP id mw1-20020a17090b4d0100b001ef54e4f840mr19512561pjb.216.1656899564976;
        Sun, 03 Jul 2022 18:52:44 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id c12-20020a621c0c000000b0050dc7628178sm19752005pfc.82.2022.07.03.18.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 18:52:44 -0700 (PDT)
From:   Coiby Xu <coxu@redhat.com>
To:     kexec@lists.infradead.org, linux-integrity@vger.kernel.org
Cc:     Mimi Zohar <zohar@linux.ibm.com>,
        linux-arm-kernel@lists.infradead.org,
        Michal Suchanek <msuchanek@suse.de>,
        Baoquan He <bhe@redhat.com>, Dave Young <dyoung@redhat.com>,
        Will Deacon <will@kernel.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Chun-Yi Lee <jlee@suse.com>, stable@vger.kernel.org,
        keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        AKASHI Takahiro <takahiro.akashi@linaro.org>,
        James Morse <james.morse@arm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v9 3/4] arm64: kexec_file: use more system keyrings to verify kernel image signature
Date:   Mon,  4 Jul 2022 09:52:00 +0800
Message-Id: <20220704015201.59744-4-coxu@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220704015201.59744-1-coxu@redhat.com>
References: <20220704015201.59744-1-coxu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Currently, when loading a kernel image via the kexec_file_load() system
call, arm64 can only use the .builtin_trusted_keys keyring to verify
a signature whereas x86 can use three more keyrings i.e.
.secondary_trusted_keys, .machine and .platform keyrings. For example,
one resulting problem is kexec'ing a kernel image  would be rejected
with the error "Lockdown: kexec: kexec of unsigned images is restricted;
see man kernel_lockdown.7".

This patch set enables arm64 to make use of the same keyrings as x86 to
verify the signature kexec'ed kernel image.

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

