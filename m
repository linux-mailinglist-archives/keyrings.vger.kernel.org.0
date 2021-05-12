Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF41937BF46
	for <lists+keyrings@lfdr.de>; Wed, 12 May 2021 16:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231414AbhELOGh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 12 May 2021 10:06:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbhELOGf (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 12 May 2021 10:06:35 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52BE1C061760;
        Wed, 12 May 2021 07:05:26 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id h127so18569101pfe.9;
        Wed, 12 May 2021 07:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xI4f2jHshcNN/xZ7UCPPVmcOswo5V25dZp2u2z1jqBw=;
        b=gc9YnntSPNz2/AvwSpUiiLzpWw6Eqosgt6fQcpmHhXQWOcMr03/DkZkVhklNPAfiI3
         aBBH1YeUSoPlW2Y7Y/yhnb9hzCaRcVtfyr6lH1Q7mu0LssCgM9LkhCrIF8xqZl7PTdQG
         MNNB+uWVS8RS4NiWtWWPXZbj7ccQhLvalIPJ8szPZstmWoQl177cZbMH7CzlWJ3sQ2f+
         RdcTCv41LLTwqEMW/btyM9veS6JejHl2SQqYYgedXEFfGzKC9TsTADSTMKsb4xHqLYi3
         mGLKh5jMxMBCCWEUmE8zXpuoTQ796oQg3KcN19sjMTzM58R2ZEB82uan3HYC289F9NiC
         YzBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xI4f2jHshcNN/xZ7UCPPVmcOswo5V25dZp2u2z1jqBw=;
        b=Xi22bxDlx6yn+ng3P7p48yH5BRUaRvSEYZ0lt3AoYUhguIMGiI7Z/VkwdjKjQCm/3k
         WVwyUeQQm/DtWHsDDCTNQnKHVrOZ1yiel4aRjsVc/bPFVoWqKPijmkoI9BoIyMA5wFnG
         aVxXWqFlcTTNMwG7tOkFx7WMr+rE8vmpyPM2XnDTL6fadcRLLilAttr7RI3d74b/cV/q
         A4/QDE+obDYEsR/ej8uyon2EeM+deDaqlP5NWipYdKrUOgmme1ppv0dLr+/PW+Xucsh3
         4ZunB27bcsDPVt2hufNeZx9etxoBt6X+5U8xgmTKgWuqL/JhKAWjdb82NQNAiPBt/daL
         9m7w==
X-Gm-Message-State: AOAM533F7j1LfkdbdEwhjfKMwDGpv1GhZeFxq3rbz6SMyNytzfBTARw2
        pYduNMF0Iy+6UPSNGTXD23I4eDYmoTA=
X-Google-Smtp-Source: ABdhPJyKHy6cfsgyN+W2lcUIolCFe2Ns9m99z7n8iEgjk6AY+ld7wWEIGB1fyhEstB01bvsNxF94Pg==
X-Received: by 2002:a62:1450:0:b029:2c8:a185:8a19 with SMTP id 77-20020a6214500000b02902c8a1858a19mr9458522pfu.78.1620828325727;
        Wed, 12 May 2021 07:05:25 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.39])
        by smtp.gmail.com with ESMTPSA id in16sm28546pjb.14.2021.05.12.07.05.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 May 2021 07:05:25 -0700 (PDT)
From:   Hongbo Li <herbert.tencent@gmail.com>
To:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, dhowells@redhat.com,
        jarkko@kernel.org, tianjia.zhang@linux.alibaba.com,
        herberthbli@tencent.com
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] lib/mpi: use kcalloc in mpi_resize
Date:   Wed, 12 May 2021 22:04:09 +0800
Message-Id: <1620828254-25545-3-git-send-email-herbert.tencent@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
References: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Hongbo Li <herberthbli@tencent.com>

We should set the additional space to 0 in mpi_resize().
So use kcalloc() instead of kmalloc_array().

Signed-off-by: Hongbo Li <herberthbli@tencent.com>
---
 lib/mpi/mpiutil.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/mpi/mpiutil.c b/lib/mpi/mpiutil.c
index 3c63710..e6c4b31 100644
--- a/lib/mpi/mpiutil.c
+++ b/lib/mpi/mpiutil.c
@@ -148,7 +148,7 @@ int mpi_resize(MPI a, unsigned nlimbs)
 		return 0;	/* no need to do it */
 
 	if (a->d) {
-		p = kmalloc_array(nlimbs, sizeof(mpi_limb_t), GFP_KERNEL);
+		p = kcalloc(nlimbs, sizeof(mpi_limb_t), GFP_KERNEL);
 		if (!p)
 			return -ENOMEM;
 		memcpy(p, a->d, a->alloced * sizeof(mpi_limb_t));
-- 
1.8.3.1

