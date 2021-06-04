Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1332039B29A
	for <lists+keyrings@lfdr.de>; Fri,  4 Jun 2021 08:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhFDGdq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 4 Jun 2021 02:33:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229831AbhFDGdp (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 4 Jun 2021 02:33:45 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CED8C06174A;
        Thu,  3 Jun 2021 23:31:48 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 6so7056905pgk.5;
        Thu, 03 Jun 2021 23:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=6mf9vxePMwOECmPy8sralSQirr3sPMiFyk3gZWElr34=;
        b=UzaoCm5rigkQe3q0/1uMFf0IfEYML8DOo2gHFqwASxXg5NFZGIXk+LgAs4uiAuvYHz
         xELF9HMOfAvmYJR4D6L6uYmiCw52i1kR1cgVNe8+jX4KOjjBtFXu2IPgeE0C8bcGb9bM
         M25zUBGmQ2vkAz/dMq2QEPd0N0ty6WgZBsAYYJqIRxEtUPvC4jLMpCsCxWa55X83u9dl
         8/JY+7zwuSG5EcDSy6WW5X+aN3CzKQkU92Q0Gj3YZM7D23DOKRNdLO6B/zGQB46RIHR3
         xToeLxOS3FjLst+mkiSB0p/Yjiwxncm1btXsWdQhytrlNFSQl+p8Ktvfs2UHB0uFRCru
         2pRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6mf9vxePMwOECmPy8sralSQirr3sPMiFyk3gZWElr34=;
        b=P6wdlhoCjm0CqPIuxcrKZrFXv5Bpmrw4bJuUNz/YA7yddPk2mzNLhwMBIjEyxy1YUc
         DBMenPC1d8F13SmiD9KBZGDJRlU58DYOtRzWN0FlYYgpghvGONAJrRpvCFNYfd4bgIJh
         YKD4e/4XDhZkkQtfRmy2BDLzXU3MoEcAfkDf/FO9boBy3vZoXP7lIyAJujw+8X2jCz5v
         /Pvo5Xz8Bxp/JL4BSd+8G9DUouo6SIhPUGQNnFygVgy2Xkz8qfsWKG823Dcw+eox2rQO
         YOSe4DgCASPOAzYMjhsLaeE9SS+1Cdk7Sen2rWjPbyymm/9bNnmRkWrvGMX3giE69m9l
         KPoA==
X-Gm-Message-State: AOAM532eKGFehZVMB1pWqk3FF7CG5xuQCZruqyfjGDtcGZ93gFQMClZ+
        844zmxC5D+sJCKIyW34MP/RcExz8kWc=
X-Google-Smtp-Source: ABdhPJzDr60WNJMYjj/y8CllOdQxEg5WmCXFIoIV1asX1ACJyKvsiN15qViND77PePe2P6QUQLd9dA==
X-Received: by 2002:a05:6a00:b8a:b029:2ec:761e:33e3 with SMTP id g10-20020a056a000b8ab02902ec761e33e3mr2857730pfj.35.1622788305538;
        Thu, 03 Jun 2021 23:31:45 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.39])
        by smtp.gmail.com with ESMTPSA id z185sm1051178pgb.4.2021.06.03.23.31.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jun 2021 23:31:45 -0700 (PDT)
From:   Hongbo Li <herbert.tencent@gmail.com>
To:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, ebiggers@kernel.org,
        dhowells@redhat.com, jarkko@kernel.org,
        tianjia.zhang@linux.alibaba.com, herberthbli@tencent.com
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH v2] crypto: sm2 - fix a memory leak in sm2
Date:   Fri,  4 Jun 2021 14:30:35 +0800
Message-Id: <1622788235-10739-1-git-send-email-herbert.tencent@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Hongbo Li <herberthbli@tencent.com>

SM2 module alloc ec->Q in sm2_set_pub_key(), when doing alg test in
test_akcipher_one(), it will set public key for every test vector,
and don't free ec->Q. This will cause a memory leak.

This patch alloc ec->Q in sm2_ec_ctx_init().

Fixes: ea7ecb66440b ("crypto: sm2 - introduce OSCCA SM2 asymmetric cipher algorithm")
Signed-off-by: Hongbo Li <herberthbli@tencent.com>
Reviewed-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
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

