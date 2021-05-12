Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 113DB37BF57
	for <lists+keyrings@lfdr.de>; Wed, 12 May 2021 16:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231479AbhELOG4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 12 May 2021 10:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231426AbhELOGq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 12 May 2021 10:06:46 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3401C061761;
        Wed, 12 May 2021 07:05:36 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id bo23-20020a17090b0917b029015cb1f2fd59so475199pjb.2;
        Wed, 12 May 2021 07:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4LIq+bz5lnH5lUkY8iYUzXMCbY6aYzyuWY+qUtLmZAM=;
        b=pFxCMcoM+qKX2GsF691TVaHCi+QqYuNgj23BhbqZ1TMtZvDc5ANFic7+tk0XoYlozN
         3MjsvzPGbf/RYFWIpXwYN3aP9bm90leapxGrJWhCk7hv9pUGzvPHHx/I+e8lq1ys6KOQ
         uUn7XV+UtF8syrAkPUNXxt8WHY4LrKgs/uKjG11AfQtkzSiq9P7f8R0yrghTGItOuncd
         ZcukArOpmlLGG9r0TLZ4cZ7/ytpYpcm0RFWVugGLUgQj4UTozg949SqV6G5i6kC+3W6r
         z//L/a+yDlUo4v917ykg39yRN19zS0kVMeojyKQoAD6/WTe7DivFEEJb9KKSVkQpyKpQ
         t6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4LIq+bz5lnH5lUkY8iYUzXMCbY6aYzyuWY+qUtLmZAM=;
        b=BJ+TP/TuNb+L7V4cntRikBW+bdjPijZZ/NaSMlNj2A5pbjCOep+7A4g6qFJ1mqx9if
         iKVqhqbD2tdKKwK8M2wJDxg1Co7sXekItD3B9ANB1FnE8KrQ8b/XKeP/8qcIryOzIuND
         Bf6WYStkOFXF9san/fsEcQfQ/6zQcDgvzqiUYnvmP4PXsdNqqDnx4bIRXyInOxubD8JA
         c5INbNmRPmKLPuvbRG/TFkcazIakWGHyZkLoVREbIv4mhdEg4wUvpGh5UOxlvzy324e2
         MZXFqP2lzJ+IZt4S3EvYI1mJwTjHuruWX9CZdt+Y06s2ene+VRp6f77FEJuM0c8B/iS3
         bX5w==
X-Gm-Message-State: AOAM533+TjpxX+5AFaIHbwVPvlgddg5RxurKSC8cOqe33zJ3puDvoPeQ
        bZhKpznOXNWSjifuBtIT28tRXIMdZOA=
X-Google-Smtp-Source: ABdhPJzp3wwqMAqG6uIrPd1BFM8u5ILKfL43n0dtAknECBn1RWt6OnsMuinGmZYSWAm/Q/ymGKcGbw==
X-Received: by 2002:a17:90b:46c4:: with SMTP id jx4mr40322847pjb.155.1620828336187;
        Wed, 12 May 2021 07:05:36 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.39])
        by smtp.gmail.com with ESMTPSA id in16sm28546pjb.14.2021.05.12.07.05.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 May 2021 07:05:35 -0700 (PDT)
From:   Hongbo Li <herbert.tencent@gmail.com>
To:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, dhowells@redhat.com,
        jarkko@kernel.org, tianjia.zhang@linux.alibaba.com,
        herberthbli@tencent.com
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] crypto: add eddsa test vector
Date:   Wed, 12 May 2021 22:04:14 +0800
Message-Id: <1620828254-25545-8-git-send-email-herbert.tencent@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
References: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Hongbo Li <herberthbli@tencent.com>

This patch adds the test vector for ed25519.

Signed-off-by: Hongbo Li <herberthbli@tencent.com>
---
 crypto/testmgr.c |  6 ++++++
 crypto/testmgr.h | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 10c5b3b..498d186 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -4939,6 +4939,12 @@ static int alg_test_null(const struct alg_test_desc *desc,
 			.akcipher = __VECS(ecrdsa_tv_template)
 		}
 	}, {
+		.alg = "eddsa-25519",
+		.test = alg_test_akcipher,
+		.suite = {
+			.akcipher = __VECS(eddsa_25519_tv_template)
+		}
+	}, {
 		.alg = "essiv(authenc(hmac(sha256),cbc(aes)),sha256)",
 		.test = alg_test_aead,
 		.fips_allowed = 1,
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 34e4a3d..11807a3 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -1145,6 +1145,38 @@ struct kpp_testvec {
 };
 
 /*
+ * EDDSA test vectors.
+ * From RFC8032 section 7.1
+ */
+static const struct akcipher_testvec eddsa_25519_tv_template[] = {
+	{
+	.key =
+	"\x3d\x40\x17\xc3\xe8\x43\x89\x5a\x92\xb7\x0a\xa7\x4d\x1b\x7e\xbc"
+	"\x9c\x98\x2c\xcf\x2e\xc4\x96\x8c\xc0\xcd\x55\xf1\x2a\xf4\x66\x0c",
+	.key_len = 32,
+	/*
+	 * RFC8032 section 5.1.7. m is SHA512(dom2(F, C) || R || A || PH(M))
+	 * M is 0x72
+	 */
+	.m =
+	"\xa2\x71\xdf\x0d\x2b\x0d\x03\xbd\x17\xb4\xed\x9a\x4b\x6a\xfd\xdf"
+	"\x2e\x73\x28\x7f\xd6\x30\xf1\xa1\x37\xd8\x7c\xe8\x73\xa5\x91\xcc"
+	"\x31\xb6\xdd\x85\x2a\x98\xb5\xdd\x12\x26\xfe\x99\x3d\x82\x28\x27"
+	"\x8c\xeb\xa2\x1f\x80\xb8\xfc\x95\x98\x6a\x70\xd7\x1e\xdf\x3f\xaf",
+	.m_size = 64,
+	.c =
+	"\x92\xa0\x09\xa9\xf0\xd4\xca\xb8\x72\x0e\x82\x0b\x5f\x64\x25\x40"
+	"\xa2\xb2\x7b\x54\x16\x50\x3f\x8f\xb3\x76\x22\x23\xeb\xdb\x69\xda"
+	"\x08\x5a\xc1\xe4\x3e\x15\x99\x6e\x45\x8f\x36\x13\xd0\xf1\x1d\x8c"
+	"\x38\x7b\x2e\xae\xb4\x30\x2a\xee\xb0\x0d\x29\x16\x12\xbb\x0c\x00",
+	.c_size = 64,
+	.algo = OID_ed25519,
+	.public_key_vec = true,
+	.siggen_sigver_test = true,
+	}
+};
+
+/*
  * PKCS#1 RSA test vectors. Obtained from CAVS testing.
  */
 static const struct akcipher_testvec pkcs1pad_rsa_tv_template[] = {
-- 
1.8.3.1

