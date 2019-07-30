Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CBF27A835
	for <lists+keyrings@lfdr.de>; Tue, 30 Jul 2019 14:24:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729575AbfG3MYm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 30 Jul 2019 08:24:42 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40326 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729539AbfG3MYm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 30 Jul 2019 08:24:42 -0400
Received: by mail-pg1-f193.google.com with SMTP id w10so29991412pgj.7
        for <keyrings@vger.kernel.org>; Tue, 30 Jul 2019 05:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=F6RVSFR3EtlCJ6lvWs5T4vKHtTJAwPryiatLZ1M1aSY=;
        b=tfILgsUTF754qwTkDQPJD0rCNoaw5Uefc9p9gu+bUyOB285QrfyyfBMXVCuakpWXxU
         HICwYDIoYTjs/+ornlvVNUoij4mg9ij8bxODX+c7q02mHaK7IrzMH1R7ecmTkMo4+2xO
         Us9rLCt7owepUui89bfkEE/+tfrGjWsmuEK7kWBlWuXdpLhbvxXU6dLLp7egHq3QfEOx
         EAnFbfA73EDc7EvI/7xV2L+LruWbM8T/aZwxfA/Fok9dNyUsOb1nZjkFl2ZhnvrgF20f
         tcRKcSqCuXR5PmdwOUIpurnXSTsuhM16BUhSnW79IuqvzINcCDhZiAimeJCJ/3aEVT/+
         Skzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=F6RVSFR3EtlCJ6lvWs5T4vKHtTJAwPryiatLZ1M1aSY=;
        b=MwXpQP9cHknIvOD1M0e81Bk4YUZZP/P8SuCFaIMrqL5OUefA76oCJmIdG1Ie969H1I
         l0u/JNmiCZHx/7q6WdHSubPyX1UQPdkbJOMk8C9YbHmAiyERpPqKveDl5N4k0/+x+11o
         D4lGwC60/M1r2mgE8DBSlkn/EU4hLKtFeAaGuhwVidfWN1OO15EfW921TA/Vck47vMXx
         bMAfOEy6KonKsvPj2ULGpinAy9KQcHGvST3Zr99qanIbCx4bGnVAKKsdhYIpAX90py7H
         JDvUZV8NopnNyjUee1w7f5sz1PrmQTXvPOkiWnCMKwu5ZRuQzVg+Ibjl77PWnfy42+jc
         dV2Q==
X-Gm-Message-State: APjAAAXnfRdji6Qv1OscM1pmWnJ8NHuPoQndSOajLVq9DJtRzbFBQ6ZC
        8vAEmyWIXuaEMHYhmR3kipVmICoLrt4=
X-Google-Smtp-Source: APXvYqxOXWjfS6W6Wq7C2Wm2EcZsROERy2icoey7lDKRVXENBtDjIep6/+XJLEKlNdfJ39CZmoJ1DQ==
X-Received: by 2002:a63:d04e:: with SMTP id s14mr103689463pgi.189.1564489481707;
        Tue, 30 Jul 2019 05:24:41 -0700 (PDT)
Received: from localhost.localdomain ([45.114.72.197])
        by smtp.gmail.com with ESMTPSA id v8sm54895462pgs.82.2019.07.30.05.24.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 30 Jul 2019 05:24:40 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     keyrings@vger.kernel.org, linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org
Cc:     jens.wiklander@linaro.org, corbet@lwn.net, dhowells@redhat.com,
        jejb@linux.ibm.com, jarkko.sakkinen@linux.intel.com,
        zohar@linux.ibm.com, jmorris@namei.org, serge@hallyn.com,
        casey@schaufler-ca.com, ard.biesheuvel@linaro.org,
        daniel.thompson@linaro.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        tee-dev@lists.linaro.org, Sumit Garg <sumit.garg@linaro.org>
Subject: [RFC v2 2/6] tee: enable support to register kernel memory
Date:   Tue, 30 Jul 2019 17:53:36 +0530
Message-Id: <1564489420-677-3-git-send-email-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564489420-677-1-git-send-email-sumit.garg@linaro.org>
References: <1564489420-677-1-git-send-email-sumit.garg@linaro.org>
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Enable support to register kernel memory reference with TEE. This change
will allow TEE bus drivers to register memory references.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Reviewed-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_shm.c   | 16 ++++++++++++++--
 include/linux/tee_drv.h |  1 +
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 2da026f..5c69b89 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -9,6 +9,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/tee_drv.h>
+#include <linux/uio.h>
 #include "tee_private.h"
 
 static void tee_shm_release(struct tee_shm *shm)
@@ -224,13 +225,14 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
 {
 	struct tee_device *teedev = ctx->teedev;
 	const u32 req_flags = TEE_SHM_DMA_BUF | TEE_SHM_USER_MAPPED;
+	const u32 req_ker_flags = TEE_SHM_DMA_BUF | TEE_SHM_KERNEL_MAPPED;
 	struct tee_shm *shm;
 	void *ret;
 	int rc;
 	int num_pages;
 	unsigned long start;
 
-	if (flags != req_flags)
+	if (flags != req_flags && flags != req_ker_flags)
 		return ERR_PTR(-ENOTSUPP);
 
 	if (!tee_device_get(teedev))
@@ -264,7 +266,17 @@ struct tee_shm *tee_shm_register(struct tee_context *ctx, unsigned long addr,
 		goto err;
 	}
 
-	rc = get_user_pages_fast(start, num_pages, FOLL_WRITE, shm->pages);
+	if (flags & TEE_SHM_USER_MAPPED) {
+		rc = get_user_pages_fast(start, num_pages, FOLL_WRITE,
+					 shm->pages);
+	} else {
+		const struct kvec kiov = {
+			.iov_base = (void *)start,
+			.iov_len = PAGE_SIZE
+		};
+
+		rc = get_kernel_pages(&kiov, num_pages, 0, shm->pages);
+	}
 	if (rc > 0)
 		shm->num_pages = rc;
 	if (rc != num_pages) {
diff --git a/include/linux/tee_drv.h b/include/linux/tee_drv.h
index 7a03f68..dedf8fa 100644
--- a/include/linux/tee_drv.h
+++ b/include/linux/tee_drv.h
@@ -26,6 +26,7 @@
 #define TEE_SHM_REGISTER	BIT(3)  /* Memory registered in secure world */
 #define TEE_SHM_USER_MAPPED	BIT(4)  /* Memory mapped in user space */
 #define TEE_SHM_POOL		BIT(5)  /* Memory allocated from pool */
+#define TEE_SHM_KERNEL_MAPPED	BIT(6)  /* Memory mapped in kernel space */
 
 struct device;
 struct tee_device;
-- 
2.7.4

