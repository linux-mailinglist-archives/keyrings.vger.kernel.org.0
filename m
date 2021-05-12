Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D95237BF45
	for <lists+keyrings@lfdr.de>; Wed, 12 May 2021 16:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231389AbhELOGe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 12 May 2021 10:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231381AbhELOGd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 12 May 2021 10:06:33 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60431C061574;
        Wed, 12 May 2021 07:05:24 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id a5so11537243pfa.11;
        Wed, 12 May 2021 07:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=16+UcKJ3Nq0KBbp7Mrl/Wv8e7UFYuoLVoKmj9Zo7By8=;
        b=GeerjIcvcY5NT9eSYvebylybP0WBNmMIfiXZnvDzrDau2PYQ0BMA/0IawGwtzLT8qX
         pGcHGuG1HXR5/G5jef19lgjd3N5rKQj1ztkk3FUWKyVBkZiPXOcEu1+5RKjkZtNmB5ld
         FXs3lbuxcbnKUj/+yegu0lrFUtAYjujVqsImGpT4dpRYX8SvpnsbCiAFGBLPxeW1ge37
         UsWKXrT3lGWQ8WJb3RuiW0JaHmBp5Ega2c5xi6M+GgoqVJYMjtVWy1lOBWg1w74zQP9i
         Icg3CZCFXYERhmVaOIFUkMWB4Kc4ZgSzyAWc/J4N9Hk7oSTsowaQ8FHf4+f+mgc5WUBW
         snjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=16+UcKJ3Nq0KBbp7Mrl/Wv8e7UFYuoLVoKmj9Zo7By8=;
        b=QMPVFnSmnPouak9imT7Ba+ipLeFB/TBNANrkoDXL9uaBxe+p9G0TUtJIsMFGyCqNsS
         LJ9wnTJnQQjozlzccteLwKUR7EMN53gNFIEZayRvUfGkMbJRsGgcyfNiJoURjNeKfYJQ
         bS/eC1DMYad1/vX+aEnHR5AMoFLt0tDXrK6/jEyWiA5BittJl79kgeLogmcphp/UD+XH
         c/kmH68BSXXLVNvxu7fcCTnjAdfvoNwrbKNkAvnguR4CCN3/83ooKyEH828OBIhxPi5G
         TlCjZrTgb5aJGgLzuWkuWdaYJuilF6HdMxbcymftOM2nBM47voWfdjLkxOGwZdN+BWHd
         +7GA==
X-Gm-Message-State: AOAM532OGABN5buLlVPFRWuOj96F6RAuXWm9BFbPiPCHzVT1+qRPbUC4
        byGcW0ZTz2ksXc9ZTiyXFv1pS4W4Dvs=
X-Google-Smtp-Source: ABdhPJzpolpGG1BHqchMLQCzmQT3qG8IPSkC+pTJirG6QyiPleBDZGTKv53LgiMzR+Mx3pM/dqiWHQ==
X-Received: by 2002:a62:b415:0:b029:2cc:61be:6db4 with SMTP id h21-20020a62b4150000b02902cc61be6db4mr5968995pfn.50.1620828323782;
        Wed, 12 May 2021 07:05:23 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.39])
        by smtp.gmail.com with ESMTPSA id in16sm28546pjb.14.2021.05.12.07.05.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 May 2021 07:05:23 -0700 (PDT)
From:   Hongbo Li <herbert.tencent@gmail.com>
To:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, dhowells@redhat.com,
        jarkko@kernel.org, tianjia.zhang@linux.alibaba.com,
        herberthbli@tencent.com
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] crypto: fix a memory leak in sm2
Date:   Wed, 12 May 2021 22:04:08 +0800
Message-Id: <1620828254-25545-2-git-send-email-herbert.tencent@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
References: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Hongbo Li <herberthbli@tencent.com>

SM2 module alloc ec->Q in sm2_set_pub_key(), when doing alg test in
test_akcipher_one(), it will set public key for every test vector,
and don't free ec->Q. This will cause a memory leak.

This patch alloc ec->Q in sm2_ec_ctx_init().

Signed-off-by: Hongbo Li <herberthbli@tencent.com>
---
 crypto/sm2.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/crypto/sm2.c b/crypto/sm2.c
index b21addc..db8a4a2 100644
--- a/crypto/sm2.c
+++ b/crypto/sm2.c
@@ -79,10 +79,17 @@ static int sm2_ec_ctx_init(struct mpi_ec_ctx *ec)
 		goto free;
 
 	rc = -ENOMEM;
+
+	ec->Q = mpi_point_new(0);
+	if (!ec->Q)
+		goto free;
+
 	/* mpi_ec_setup_elliptic_curve */
 	ec->G = mpi_point_new(0);
-	if (!ec->G)
+	if (!ec->G) {
+		mpi_point_release(ec->Q);
 		goto free;
+	}
 
 	mpi_set(ec->G->x, x);
 	mpi_set(ec->G->y, y);
@@ -91,6 +98,7 @@ static int sm2_ec_ctx_init(struct mpi_ec_ctx *ec)
 	rc = -EINVAL;
 	ec->n = mpi_scanval(ecp->n);
 	if (!ec->n) {
+		mpi_point_release(ec->Q);
 		mpi_point_release(ec->G);
 		goto free;
 	}
@@ -386,27 +394,15 @@ static int sm2_set_pub_key(struct crypto_akcipher *tfm,
 	MPI a;
 	int rc;
 
-	ec->Q = mpi_point_new(0);
-	if (!ec->Q)
-		return -ENOMEM;
-
 	/* include the uncompressed flag '0x04' */
-	rc = -ENOMEM;
 	a = mpi_read_raw_data(key, keylen);
 	if (!a)
-		goto error;
+		return -ENOMEM;
 
 	mpi_normalize(a);
 	rc = sm2_ecc_os2ec(ec->Q, a);
 	mpi_free(a);
-	if (rc)
-		goto error;
-
-	return 0;
 
-error:
-	mpi_point_release(ec->Q);
-	ec->Q = NULL;
 	return rc;
 }
 
-- 
1.8.3.1

