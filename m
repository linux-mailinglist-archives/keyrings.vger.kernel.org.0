Return-Path: <keyrings+bounces-174-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3827FAA24
	for <lists+keyrings@lfdr.de>; Mon, 27 Nov 2023 20:21:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 90C92B20B8E
	for <lists+keyrings@lfdr.de>; Mon, 27 Nov 2023 19:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2D63EA71;
	Mon, 27 Nov 2023 19:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="BXw1Dxwy"
X-Original-To: keyrings@vger.kernel.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2C5D6D;
	Mon, 27 Nov 2023 11:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1701112853;
	bh=KmhSFY8imv6p6T8huPvomy9EBANjw8a2mOEbtWpQpDY=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:From;
	b=BXw1DxwyOu4COHKZ3o/ChtkV/vJgIzk76fOFYNlJJR2Oe4PcQd/oTzx0eMrpVjmOF
	 eVAoxgcZdysrlzviof2id34MglK4HQ6NakHbILke8cTC6DAvTo2rVtGunxUTEOss1y
	 tctnbdAR2r2UXSVSC/QHilXvmaSemMDnYY0++B/A=
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id C28E71286989;
	Mon, 27 Nov 2023 14:20:53 -0500 (EST)
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavis, port 10024)
 with ESMTP id W5YxuMxsXbm1; Mon, 27 Nov 2023 14:20:53 -0500 (EST)
Received: from lingrow.int.hansenpartnership.com (unknown [153.66.160.227])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 29A9B1286954;
	Mon, 27 Nov 2023 14:20:53 -0500 (EST)
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: linux-integrity@vger.kernel.org
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
	keyrings@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v5 16/17] tpm: add the null key name as a sysfs export
Date: Mon, 27 Nov 2023 14:08:53 -0500
Message-Id: <20231127190854.13310-17-James.Bottomley@HansenPartnership.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20231127190854.13310-1-James.Bottomley@HansenPartnership.com>
References: <20231127190854.13310-1-James.Bottomley@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 drivers/char/tpm/tpm-sysfs.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/char/tpm/tpm-sysfs.c b/drivers/char/tpm/tpm-sysfs.c
index 54c71473aa29..403dffea4ea6 100644
--- a/drivers/char/tpm/tpm-sysfs.c
+++ b/drivers/char/tpm/tpm-sysfs.c
@@ -309,6 +309,21 @@ static ssize_t tpm_version_major_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(tpm_version_major);
 
+#ifdef CONFIG_TPM_BUS_SECURITY
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
+#endif
+
 static struct attribute *tpm1_dev_attrs[] = {
 	&dev_attr_pubek.attr,
 	&dev_attr_pcrs.attr,
@@ -326,6 +341,9 @@ static struct attribute *tpm1_dev_attrs[] = {
 
 static struct attribute *tpm2_dev_attrs[] = {
 	&dev_attr_tpm_version_major.attr,
+#ifdef CONFIG_TPM_BUS_SECURITY
+	&dev_attr_null_name.attr,
+#endif
 	NULL
 };
 
-- 
2.35.3


