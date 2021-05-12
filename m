Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F09D37BF50
	for <lists+keyrings@lfdr.de>; Wed, 12 May 2021 16:06:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbhELOGr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 12 May 2021 10:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbhELOGl (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 12 May 2021 10:06:41 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F76DC06174A;
        Wed, 12 May 2021 07:05:32 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id x188so18575937pfd.7;
        Wed, 12 May 2021 07:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dV0x/tnHtDFzJC3L/bpk43LWIqmMV6OlE9B94s6d0EA=;
        b=I9/3EclVAtXYZ9A3M3aVahb/Zre1/dWPYpdmZIE63plFu/WOheS3z9F4jbzPqDsH2C
         0T8NPo8mLOWdIWyx/k2shbeqoPit5V2UfbAtTcZMCd9Xk303VOf0S7bx6sCxJrUoygDt
         vRd5MzejgOcF387hw5xmh9m5iGUZYzexV4KObUwcHqz2EcnVkFAzm7ncbn35Sno4FXKJ
         9i3eeIghVEG/MUaorcaq0eQ6Nza8/UrDrbBxzdU9sokC52lLdP29uqBeVbkddKwW6/ro
         KzI4H/fu3TCTMgUgRvwnDc0Az9zFSCKudW+GOCCJA6WIUAfwoF5R6/blkd5zciJ35gGs
         HbCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dV0x/tnHtDFzJC3L/bpk43LWIqmMV6OlE9B94s6d0EA=;
        b=rTUCEIjciJVSmasc1B97aL1CMSRUdiXmFdcCvU9e5hq4Rcw0kEZ8LMNuY3EdZJGigB
         5uR1V2mVQqVCspyQzzJRdY0GRyFNfWrsT6yWw+xkqW7FgSuu+PeUXrwUxsqeG89D4pNu
         VjRifVUnMv2MrKwZfQjgZoIWlDaiEixn8/ajBvLpnBzJN2kkRGGoTu5+qd2BpZFQqFcb
         mEvIpJS8P/gsaFOm8kdhq7rz2T6EVEOHz79WGrl+f5wi6rMaMz67jDQlN0mcmB90EmCB
         HD2zBCrPHQTNjx4v4xt0S0Ru0dCivxNx6BR9N89mqzQi8rOH7MBlxmyJEiPJsImdHBhh
         adhA==
X-Gm-Message-State: AOAM532YIo43wQpfr0ArHDJTK+cyZRNOopLki67VwjDTQCKGeiKTyIxy
        OAtbKNxZO13KVk6tvTMIUwVgS+BVHoM=
X-Google-Smtp-Source: ABdhPJzUMKypvnAoXNtmhiTrLzVQ0nTGGaLiobH88hKLo0+/IU8wKH50DxzRJjOhr/AXBA2CELj7Ag==
X-Received: by 2002:a63:d509:: with SMTP id c9mr35730614pgg.280.1620828331896;
        Wed, 12 May 2021 07:05:31 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.39])
        by smtp.gmail.com with ESMTPSA id in16sm28546pjb.14.2021.05.12.07.05.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 May 2021 07:05:31 -0700 (PDT)
From:   Hongbo Li <herbert.tencent@gmail.com>
To:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, dhowells@redhat.com,
        jarkko@kernel.org, tianjia.zhang@linux.alibaba.com,
        herberthbli@tencent.com
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] crypto: move common code in sm2 to ec_mpi.c and ec_mpi.h
Date:   Wed, 12 May 2021 22:04:12 +0800
Message-Id: <1620828254-25545-6-git-send-email-herbert.tencent@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
References: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Hongbo Li <herberthbli@tencent.com>

Some structs and functions in sm2 are common codes, and could be
used by the following eddsa patch. So move them to common files:
ec_mpi.c and ec_mpi.h.

Signed-off-by: Hongbo Li <herberthbli@tencent.com>
---
 crypto/Kconfig  |  4 +++
 crypto/Makefile |  1 +
 crypto/ec_mpi.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++
 crypto/ec_mpi.h | 37 ++++++++++++++++++++++
 crypto/sm2.c    | 98 ++-------------------------------------------------------
 5 files changed, 127 insertions(+), 95 deletions(-)
 create mode 100644 crypto/ec_mpi.c
 create mode 100644 crypto/ec_mpi.h

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 4a0d187..75ae7d3 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -265,6 +265,9 @@ config CRYPTO_ECRDSA
 	  standard algorithms (called GOST algorithms). Only signature verification
 	  is implemented.
 
+config CRYPTO_EC_MPI
+	tristate
+
 config CRYPTO_SM2
 	tristate "SM2 algorithm"
 	select CRYPTO_SM3
@@ -272,6 +275,7 @@ config CRYPTO_SM2
 	select CRYPTO_MANAGER
 	select MPILIB
 	select ASN1
+	select CRYPTO_EC_MPI
 	help
 	  Generic implementation of the SM2 public key algorithm. It was
 	  published by State Encryption Management Bureau, China.
diff --git a/crypto/Makefile b/crypto/Makefile
index 10526d4..8afb393 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -177,6 +177,7 @@ obj-$(CONFIG_CRYPTO_OFB) += ofb.o
 obj-$(CONFIG_CRYPTO_ECC) += ecc.o
 obj-$(CONFIG_CRYPTO_ESSIV) += essiv.o
 obj-$(CONFIG_CRYPTO_CURVE25519) += curve25519-generic.o
+obj-$(CONFIG_CRYPTO_EC_MPI) += ec_mpi.o
 
 ecdh_generic-y += ecdh.o
 ecdh_generic-y += ecdh_helper.o
diff --git a/crypto/ec_mpi.c b/crypto/ec_mpi.c
new file mode 100644
index 0000000..a537e6f
--- /dev/null
+++ b/crypto/ec_mpi.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * EC MPI common functions.
+ *
+ * Copyright (c) 2020, Alibaba Group.
+ * Authors: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
+ */
+
+#include <linux/module.h>
+#include <linux/mpi.h>
+#include "ec_mpi.h"
+
+int ec_mpi_ctx_init(struct mpi_ec_ctx *ec, const struct ecc_domain_parms *ecp)
+{
+	MPI p, a, b;
+	MPI x, y;
+	int rc = -EINVAL;
+
+	p = mpi_scanval(ecp->p);
+	a = mpi_scanval(ecp->a);
+	b = mpi_scanval(ecp->b);
+	if (!p || !a || !b)
+		goto free_p;
+
+	x = mpi_scanval(ecp->g_x);
+	y = mpi_scanval(ecp->g_y);
+	if (!x || !y)
+		goto free;
+
+	rc = -ENOMEM;
+
+	ec->Q = mpi_point_new(0);
+	if (!ec->Q)
+		goto free;
+
+	/* mpi_ec_setup_elliptic_curve */
+	ec->G = mpi_point_new(0);
+	if (!ec->G) {
+		mpi_point_release(ec->Q);
+		goto free;
+	}
+
+	mpi_set(ec->G->x, x);
+	mpi_set(ec->G->y, y);
+	mpi_set_ui(ec->G->z, 1);
+
+	rc = -EINVAL;
+	ec->n = mpi_scanval(ecp->n);
+	if (!ec->n) {
+		mpi_point_release(ec->Q);
+		mpi_point_release(ec->G);
+		goto free;
+	}
+
+	ec->h = ecp->h;
+	ec->name = ecp->desc;
+	mpi_ec_init(ec, ecp->model, ecp->dialect, 0, p, a, b);
+
+	rc = 0;
+
+free:
+	mpi_free(x);
+	mpi_free(y);
+free_p:
+	mpi_free(p);
+	mpi_free(a);
+	mpi_free(b);
+
+	return rc;
+}
+EXPORT_SYMBOL(ec_mpi_ctx_init);
+
+void ec_mpi_ctx_deinit(struct mpi_ec_ctx *ec)
+{
+	mpi_ec_deinit(ec);
+
+	memset(ec, 0, sizeof(*ec));
+}
+EXPORT_SYMBOL(ec_mpi_ctx_deinit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Tianjia Zhang <tianjia.zhang@linux.alibaba.com>");
diff --git a/crypto/ec_mpi.h b/crypto/ec_mpi.h
new file mode 100644
index 0000000..e1f6d3aa
--- /dev/null
+++ b/crypto/ec_mpi.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * EC MPI common structs.
+ *
+ * Copyright (c) 2020, Alibaba Group.
+ * Authors: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
+ */
+
+#include <linux/mpi.h>
+
+struct ecc_domain_parms {
+	const char *desc;           /* Description of the curve.  */
+	unsigned int nbits;         /* Number of bits.  */
+	unsigned int fips:1; /* True if this is a FIPS140-2 approved curve */
+
+	/* The model describing this curve.  This is mainly used to select
+	 * the group equation.
+	 */
+	enum gcry_mpi_ec_models model;
+
+	/* The actual ECC dialect used.  This is used for curve specific
+	 * optimizations and to select encodings etc.
+	 */
+	enum ecc_dialects dialect;
+
+	const char *p;              /* The prime defining the field.  */
+	const char *a, *b;          /* The coefficients.  For Twisted Edwards
+				     * Curves b is used for d.  For Montgomery
+				     * Curves (a,b) has ((A-2)/4,B^-1).
+				     */
+	const char *n;              /* The order of the base point.  */
+	const char *g_x, *g_y;      /* Base point.  */
+	unsigned int h;             /* Cofactor.  */
+};
+
+int ec_mpi_ctx_init(struct mpi_ec_ctx *ec, const struct ecc_domain_parms *ecp);
+void ec_mpi_ctx_deinit(struct mpi_ec_ctx *ec);
diff --git a/crypto/sm2.c b/crypto/sm2.c
index db8a4a2..ea1676b 100644
--- a/crypto/sm2.c
+++ b/crypto/sm2.c
@@ -9,42 +9,17 @@
  */
 
 #include <linux/module.h>
-#include <linux/mpi.h>
 #include <crypto/internal/akcipher.h>
 #include <crypto/akcipher.h>
 #include <crypto/hash.h>
 #include <crypto/sm3_base.h>
 #include <crypto/rng.h>
 #include <crypto/sm2.h>
+#include "ec_mpi.h"
 #include "sm2signature.asn1.h"
 
 #define MPI_NBYTES(m)   ((mpi_get_nbits(m) + 7) / 8)
 
-struct ecc_domain_parms {
-	const char *desc;           /* Description of the curve.  */
-	unsigned int nbits;         /* Number of bits.  */
-	unsigned int fips:1; /* True if this is a FIPS140-2 approved curve */
-
-	/* The model describing this curve.  This is mainly used to select
-	 * the group equation.
-	 */
-	enum gcry_mpi_ec_models model;
-
-	/* The actual ECC dialect used.  This is used for curve specific
-	 * optimizations and to select encodings etc.
-	 */
-	enum ecc_dialects dialect;
-
-	const char *p;              /* The prime defining the field.  */
-	const char *a, *b;          /* The coefficients.  For Twisted Edwards
-				     * Curves b is used for d.  For Montgomery
-				     * Curves (a,b) has ((A-2)/4,B^-1).
-				     */
-	const char *n;              /* The order of the base point.  */
-	const char *g_x, *g_y;      /* Base point.  */
-	unsigned int h;             /* Cofactor.  */
-};
-
 static const struct ecc_domain_parms sm2_ecp = {
 	.desc = "sm2p256v1",
 	.nbits = 256,
@@ -60,73 +35,6 @@ struct ecc_domain_parms {
 	.h = 1
 };
 
-static int sm2_ec_ctx_init(struct mpi_ec_ctx *ec)
-{
-	const struct ecc_domain_parms *ecp = &sm2_ecp;
-	MPI p, a, b;
-	MPI x, y;
-	int rc = -EINVAL;
-
-	p = mpi_scanval(ecp->p);
-	a = mpi_scanval(ecp->a);
-	b = mpi_scanval(ecp->b);
-	if (!p || !a || !b)
-		goto free_p;
-
-	x = mpi_scanval(ecp->g_x);
-	y = mpi_scanval(ecp->g_y);
-	if (!x || !y)
-		goto free;
-
-	rc = -ENOMEM;
-
-	ec->Q = mpi_point_new(0);
-	if (!ec->Q)
-		goto free;
-
-	/* mpi_ec_setup_elliptic_curve */
-	ec->G = mpi_point_new(0);
-	if (!ec->G) {
-		mpi_point_release(ec->Q);
-		goto free;
-	}
-
-	mpi_set(ec->G->x, x);
-	mpi_set(ec->G->y, y);
-	mpi_set_ui(ec->G->z, 1);
-
-	rc = -EINVAL;
-	ec->n = mpi_scanval(ecp->n);
-	if (!ec->n) {
-		mpi_point_release(ec->Q);
-		mpi_point_release(ec->G);
-		goto free;
-	}
-
-	ec->h = ecp->h;
-	ec->name = ecp->desc;
-	mpi_ec_init(ec, ecp->model, ecp->dialect, 0, p, a, b);
-
-	rc = 0;
-
-free:
-	mpi_free(x);
-	mpi_free(y);
-free_p:
-	mpi_free(p);
-	mpi_free(a);
-	mpi_free(b);
-
-	return rc;
-}
-
-static void sm2_ec_ctx_deinit(struct mpi_ec_ctx *ec)
-{
-	mpi_ec_deinit(ec);
-
-	memset(ec, 0, sizeof(*ec));
-}
-
 /* RESULT must have been initialized and is set on success to the
  * point given by VALUE.
  */
@@ -416,14 +324,14 @@ static int sm2_init_tfm(struct crypto_akcipher *tfm)
 {
 	struct mpi_ec_ctx *ec = akcipher_tfm_ctx(tfm);
 
-	return sm2_ec_ctx_init(ec);
+	return ec_mpi_ctx_init(ec, &sm2_ecp);
 }
 
 static void sm2_exit_tfm(struct crypto_akcipher *tfm)
 {
 	struct mpi_ec_ctx *ec = akcipher_tfm_ctx(tfm);
 
-	sm2_ec_ctx_deinit(ec);
+	ec_mpi_ctx_deinit(ec);
 }
 
 static struct akcipher_alg sm2 = {
-- 
1.8.3.1

