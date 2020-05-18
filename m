Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE2001D8018
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728431AbgERR1Y (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgERR1Y (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:24 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3292C061A0C
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:22 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id a13so2949605pls.8
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uswFJLFE1zvckTnZqmXVEM4z+ZSuyAzwkPaG09V/TTM=;
        b=hE/h8WKOpIGtMZtftznhI8vdM6WtjqRTlka35gGt07UhKS2mVXvTukO4PVWwcgD/Ny
         e7xpMw5xEKmlvCEVcdwAcctkVfO12nvfkfOx/NaL7+DTWPpj2Etgc6bhHNL4z9XCS5lp
         81uHJg2Ei19Oyn3FTIttIGUuv6IoSk0TD8QSufGGpUczOGymjqJ714MZJOVop0w8x3rH
         G5gEknzGWLlgi7uw1S7C0Ld/+bURAzgif/7vzyXX2H7X6RsSiIn3UZ1kp0H2iGXde/7B
         sJKc79zxWZmMPy9zXGSM8MREl1pM9kjGQqo1MqklhEtlrJsnG8s/+kLrwzGLkGbG81e8
         EQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uswFJLFE1zvckTnZqmXVEM4z+ZSuyAzwkPaG09V/TTM=;
        b=spKdjnK62nIUMvckKDf/Hd420uV7tC57IBkcwd5rHuV2p2mhrGZjLvjLqe9BMpMrRe
         Mk/0l5UQuS2osLQeNExa9+KxNmgaSnLupjM4xrWFD4C0ll0Nii4LhvEKP+LJFtmbAuJ2
         U9//iWEvXOeYVub5dK970Cvim8LPuUBV7luRZSorNYIe9wzYENb6oEW0ezYHpZiYF4Nv
         q1QOUbrG6jq+VrXtMcGiPTpRn15agT+PDIdKgexCT4ez0RCtNQQ2CoWh9rRyEy1Y0m0R
         rV+nFmZLmcEroligf5b27NuAm4oivTjRHTkAanp5nFskxCl+7jF4vk0O5LR+A3IxDcw9
         BSbQ==
X-Gm-Message-State: AOAM532lyGpIlugrsqIeM9gZorQZKLyW7Dvn1TFeBFwBu/7YAOBAn3Y1
        Hu7yYkTov86BRVgSJx3sOjLRbHlVarY=
X-Google-Smtp-Source: ABdhPJzlN8vG0frcHn4pRJKBs7HpOr59OGUCO5k8rKg5g//rYJcTtVYHqjahRIMnUDL20pAQDLSHDg==
X-Received: by 2002:a17:90a:264c:: with SMTP id l70mr535551pje.18.1589822842041;
        Mon, 18 May 2020 10:27:22 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:21 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com
Subject: [PATCH 10/17] tpm: add the null key name as a tpm2 sysfs variable
Date:   Mon, 18 May 2020 10:26:57 -0700
Message-Id: <20200518172704.29608-11-prestwoj@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200518172704.29608-1-prestwoj@gmail.com>
References: <20200518172704.29608-1-prestwoj@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: James Bottomley <James.Bottomley@HansenPartnership.com>

This is the last component of encrypted tpm2 session handling that
allows us to verify from userspace that the key derived from the NULL
seed genuinely belongs to the TPM and has not been spoofed.

The procedure for doing this involves creating an attestation identity
key (which requires verification of the TPM EK certificate) and then
using that AIK to sign a certification of the Elliptic Curve key over
the NULL seed.  Userspace must create this EC Key using the parameters
prescribed in TCG TPM v2.0 Provisioning Guidance for the SRK ECC; if
this is done correctly the names will match and the TPM can then run a
TPM2_Certify operation on this derived primary key using the newly
created AIK.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 drivers/char/tpm/tpm-sysfs.c | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/char/tpm/tpm-sysfs.c b/drivers/char/tpm/tpm-sysfs.c
index d52bf4df0bca..c2733252320a 100644
--- a/drivers/char/tpm/tpm-sysfs.c
+++ b/drivers/char/tpm/tpm-sysfs.c
@@ -310,6 +310,19 @@ static ssize_t timeouts_show(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RO(timeouts);
 
+static ssize_t null_name_show(struct device *dev, struct device_attribute *attr,
+			      char *buf)
+{
+	struct tpm_chip *chip = to_tpm_chip(dev);
+	int size = TPM2_NAME_SIZE;
+
+	bin2hex(buf, chip->tpmkeyname, size);
+	size *= 2;
+	buf[size++] = '\n';
+	return size;
+}
+static DEVICE_ATTR_RO(null_name);
+
 static ssize_t tpm_version_major_show(struct device *dev,
 				  struct device_attribute *attr, char *buf)
 {
@@ -336,7 +349,7 @@ static struct attribute *tpm1_dev_attrs[] = {
 };
 
 static struct attribute *tpm2_dev_attrs[] = {
-	&dev_attr_tpm_version_major.attr,
+	&dev_attr_null_name.attr,
 	NULL
 };
 
@@ -346,10 +359,24 @@ static const struct attribute_group tpm1_dev_group = {
 
 static const struct attribute_group tpm2_dev_group = {
 	.attrs = tpm2_dev_attrs,
+
 };
 
 void tpm_sysfs_add_device(struct tpm_chip *chip)
 {
+	/* XXX: If you wish to remove this restriction, you must first update
+	 * tpm_sysfs to explicitly lock chip->ops.
+	 */
+	if (chip->flags & TPM_CHIP_FLAG_TPM2) {
+		WARN_ON(chip->groups_cnt != 0);
+		chip->groups[chip->groups_cnt++] = &tpm2_dev_group;
+		return;
+	}
+
+	/* The sysfs routines rely on an implicit tpm_try_get_ops, device_del
+	 * is called before ops is null'd and the sysfs core synchronizes this
+	 * removal so that no callbacks are running or can run again
+	 */
 	WARN_ON(chip->groups_cnt != 0);
 	if (chip->flags & TPM_CHIP_FLAG_TPM2)
 		chip->groups[chip->groups_cnt++] = &tpm2_dev_group;
-- 
2.21.1

