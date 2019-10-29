Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D74DE8465
	for <lists+keyrings@lfdr.de>; Tue, 29 Oct 2019 10:26:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732625AbfJ2J0V (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 29 Oct 2019 05:26:21 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5207 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732481AbfJ2J0V (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Tue, 29 Oct 2019 05:26:21 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id DF5AD3D3843357D1C3CE;
        Tue, 29 Oct 2019 17:26:17 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.439.0; Tue, 29 Oct 2019
 17:26:07 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <dhowells@redhat.com>, <jmorris@namei.org>, <serge@hallyn.com>,
        <sumit.garg@linaro.org>, <jarkko.sakkinen@linux.intel.com>,
        <keyrings@vger.kernel.org>, <linux-security-module@vger.kernel.org>
CC:     <yi.zhang@huawei.com>, <zhengbin13@huawei.com>
Subject: [PATCH] KEYS: trusted: Remove set but not used variable 'keyhndl'
Date:   Tue, 29 Oct 2019 17:33:32 +0800
Message-ID: <1572341612-31893-1-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

security/keys/trusted-keys/trusted_tpm1.c: In function tpm_unseal:
security/keys/trusted-keys/trusted_tpm1.c:588:11: warning: variable keyhndl set but not used [-Wunused-but-set-variable]

It is introduced by commit 00aa975bd031 ("KEYS: trusted:
Create trusted keys subsystem"), but never used, so remove it.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 security/keys/trusted-keys/trusted_tpm1.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/security/keys/trusted-keys/trusted_tpm1.c b/security/keys/trusted-keys/trusted_tpm1.c
index eb5074e..d2c5ec1 100644
--- a/security/keys/trusted-keys/trusted_tpm1.c
+++ b/security/keys/trusted-keys/trusted_tpm1.c
@@ -585,7 +585,6 @@ static int tpm_unseal(struct tpm_buf *tb,
 	uint32_t authhandle2 = 0;
 	unsigned char cont = 0;
 	uint32_t ordinal;
-	uint32_t keyhndl;
 	int ret;

 	/* sessions for unsealing key and data */
@@ -601,7 +600,6 @@ static int tpm_unseal(struct tpm_buf *tb,
 	}

 	ordinal = htonl(TPM_ORD_UNSEAL);
-	keyhndl = htonl(SRKHANDLE);
 	ret = tpm_get_random(chip, nonceodd, TPM_NONCE_SIZE);
 	if (ret != TPM_NONCE_SIZE) {
 		pr_info("trusted_key: tpm_get_random failed (%d)\n", ret);
--
2.7.4

