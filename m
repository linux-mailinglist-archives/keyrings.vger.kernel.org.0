Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE3C91D801C
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728440AbgERR10 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728416AbgERR10 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:26 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08DE9C061A0C
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:26 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id n15so132465pjt.4
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rjfxPFBqdcT1NNn7odkflr/fepRGqK0ZP4DJCVVOfXk=;
        b=mfJ7rK3Of6UA/8srQgsuJRDncSIQFz2eCJ2zmeK3JGJKUSNfAqnTI4UjSEBqhM26xZ
         PVwBKdlX7ntk295su+o2HraVPzI8Sg6bo6mLfbldesbhQ6LihZd2U9Wy2UId3qmbiKE7
         0rNusvAJTUy3t7YtAWAeZFx5bulOjrXtPCAT8lvAHU99mQuDDjVkvrXdfQLdIoTjQCAU
         0TdKkRygyIgCjkDffRka/VrCLTbhiXceaad0V65+WUhhqL0GUInOJpAQ+aoTfb4fShcN
         ie11vn+26+9nrXZ4ebaqIVL9luAOxHXyQ+9UnbBjLc3pZtW42KSniBOBioFt6fstaIea
         DH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rjfxPFBqdcT1NNn7odkflr/fepRGqK0ZP4DJCVVOfXk=;
        b=D3wbdbF2RnBOxl04JNZq7WzB1w0EOCsD13KMc5gJHBu/1o73T1FKL6c4xuUMRfM1Wo
         gf+iW+I4M6zZQRlbI16DTnzVUqZcfQoSrFeSXC7PAu4ZohkHD/ysxb5Ptn5smzemCRT6
         XyN3jt9ilXckO0AZmFdLcPoC7MtIwxxvUm/E1J1EHpav+n12YxzjQuI7d0tukUqlHcEn
         yxA5rFyBXS1P/na6hM9xPUXMD+/pBk3/ClwLEE8dr9P7Tl52z8/A5DjmgG1Fb9zrhVha
         7gSH1BLaq1d9BxP2KhSQT1/z3fYYMlxz66Y/JZ8mQShl5/4dC7GjQWZzxS+3Tpj4MtqO
         q0CQ==
X-Gm-Message-State: AOAM530KjgGwecKfj/rOZVKNWHgo61qGSXTJ+cKkDGYEvOycbfsl1wjN
        liYG/Q0zLYyMhqYwrdjEabqoda6J9GQ=
X-Google-Smtp-Source: ABdhPJwMqqDVXV+o5UrZG9sii5PooR3P93DyzFsq4LEYpTpLuwez63fTNYmDS2ZkpkyddUcjieMotQ==
X-Received: by 2002:a17:90a:3201:: with SMTP id k1mr478148pjb.202.1589822845224;
        Mon, 18 May 2020 10:27:25 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:24 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com,
        James Prestwood <prestwoj@gmail.com>
Subject: [PATCH 13/17] tpm: tpm2-cmd: add driver API for RSA decryption
Date:   Mon, 18 May 2020 10:27:00 -0700
Message-Id: <20200518172704.29608-14-prestwoj@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200518172704.29608-1-prestwoj@gmail.com>
References: <20200518172704.29608-1-prestwoj@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Added a new TPM driver level API for RSA decryption.

The API parameters take a raw asymmetric key blob rather than depending
on trusted types. This is so it can be easily used across the kernel
rather than only in the trusted module as this will be used by a new
asymmetric key type. The blob does still need to be parsed by the
caller and formatted correctly to be accepted by the TPM.

At the TPM level decrypt and sign use the same operation,
TPM2_CC_RSA_DECRYPT. The difference is that data to be signed is
pre-padded with pkcs1 up to the key size. This effectively makes the call
to decrypt actually an encryption operation suitable for signing.

If the parent handle passed in is TPM2_RH_NULL the null key context is
loaded and that key handle is used. Any other handle will use that parent
for the operations, and its expected that the parent handle exists in
the TPM.
---
 drivers/char/tpm/tpm.h      |   3 +
 drivers/char/tpm/tpm2-cmd.c | 128 ++++++++++++++++++++++++++++++++++++
 include/linux/tpm.h         |   1 +
 3 files changed, 132 insertions(+)

diff --git a/drivers/char/tpm/tpm.h b/drivers/char/tpm/tpm.h
index ade4af4d52ca..f872132f9a68 100644
--- a/drivers/char/tpm/tpm.h
+++ b/drivers/char/tpm/tpm.h
@@ -259,6 +259,9 @@ int tpm2_save_context(struct tpm_chip *chip, u32 handle, u8 *buf,
 		      unsigned int buf_size, unsigned int *offset);
 int tpm2_load_context(struct tpm_chip *chip, u8 *buf,
 		      unsigned int *offset, u32 *handle);
+int tpm2_rsa_decrypt(struct tpm_chip *chip, u32 parent,
+			    const unsigned char *keyblob, size_t bloblen,
+			    const void *data, size_t len, void *out);
 
 int tpm_bios_log_setup(struct tpm_chip *chip);
 void tpm_bios_log_teardown(struct tpm_chip *chip);
diff --git a/drivers/char/tpm/tpm2-cmd.c b/drivers/char/tpm/tpm2-cmd.c
index f11906f95252..f4ebc1e7186a 100644
--- a/drivers/char/tpm/tpm2-cmd.c
+++ b/drivers/char/tpm/tpm2-cmd.c
@@ -1030,6 +1030,134 @@ static int tpm2_get_cc_attrs_tbl(struct tpm_chip *chip)
 	return rc;
 }
 
+/**
+ * tpm2_rsa_decrypt
+ *
+ * @chip: TPM chip to use
+ * @parent: Parent key handle
+ * @keyblob: Private/Public key pair
+ * @bloblen: length of keyblob
+ * @data: encrypted data to decrypt
+ * @len: length of data
+ * @out: buffer for decrypted data
+ */
+int tpm2_rsa_decrypt(struct tpm_chip *chip, u32 parent,
+		     const unsigned char *keyblob, size_t bloblen,
+		     const void *data, size_t len, void *out)
+{
+	struct tpm_buf buf;
+	struct tpm2_auth *auth;
+	int rc;
+	u32 blob_handle = 0;
+	unsigned int private_len;
+	unsigned int public_len;
+	unsigned int parsed_len;
+	u32 key_handle = 0;
+	unsigned int offset = 0; /* dummy offset for null seed context */
+	u8 *pos;
+	u16 decrypted_len;
+
+	private_len = be16_to_cpup((__be16 *) &keyblob[0]);
+	if (private_len > (bloblen - 2))
+		return -E2BIG;
+
+	public_len = be16_to_cpup((__be16 *) &keyblob[2 + private_len]);
+	parsed_len = private_len + public_len + 4;
+	if (parsed_len > bloblen)
+		return -E2BIG;
+
+	chip = tpm_find_get_ops(chip);
+	if (!chip)
+		return -ENODEV;
+
+	rc = tpm2_start_auth_session(chip, &auth);
+	if (rc) {
+		tpm_put_ops(chip);
+		return -EIO;
+	}
+
+	if (parent == TPM2_RH_NULL) {
+		rc = tpm2_load_context(chip, chip->tpmkeycontext, &offset,
+				       &key_handle);
+		if (rc) {
+			rc = -EIO;
+			tpm2_end_auth_session(auth);
+			goto out;
+		}
+	} else
+		key_handle = parent;
+
+	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_LOAD);
+	if (rc < 0) {
+		tpm2_end_auth_session(auth);
+		goto out;
+	}
+
+	tpm_buf_append_name(&buf, auth, key_handle, NULL);
+	tpm_buf_append_hmac_session(&buf, auth, TPM2_SA_CONTINUE_SESSION |
+				    TPM2_SA_ENCRYPT, NULL, 0);
+	tpm_buf_append(&buf, keyblob, bloblen);
+
+	if (buf.flags & TPM_BUF_OVERFLOW) {
+		rc = -E2BIG;
+		tpm2_end_auth_session(auth);
+		goto out;
+	}
+
+	tpm_buf_fill_hmac_session(&buf, auth);
+	rc = tpm_transmit_cmd(chip, &buf, 4, "loading blob");
+	rc = tpm_buf_check_hmac_response(&buf, auth, rc);
+	if (rc) {
+		rc = -EIO;
+		tpm2_end_auth_session(auth);
+		goto out;
+	}
+
+	blob_handle = be32_to_cpup((__be32 *) &buf.data[TPM_HEADER_SIZE]);
+
+	tpm_buf_destroy(&buf);
+
+	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_RSA_DECRYPT);
+	if (rc < 0) {
+		tpm2_end_auth_session(auth);
+		goto out;
+	}
+
+	tpm_buf_append_name(&buf, auth, blob_handle, NULL);
+	tpm_buf_append_hmac_session(&buf, auth, TPM2_SA_DECRYPT, NULL, 0);
+
+	tpm_buf_append_u16(&buf, len);
+	tpm_buf_append(&buf, data, len);
+	tpm_buf_append_u16(&buf, TPM_ALG_NULL);
+	tpm_buf_append_u16(&buf, 0);
+
+	tpm_buf_fill_hmac_session(&buf, auth);
+	rc = tpm_transmit_cmd(chip, &buf, 4, "rsa decrypt");
+	rc = tpm_buf_check_hmac_response(&buf, auth, rc);
+
+	if (rc)
+		goto out;
+
+	pos = buf.data + TPM_HEADER_SIZE + 4;
+	decrypted_len = be16_to_cpup((__be16 *) pos);
+	pos += 2;
+
+	memcpy(out, pos, decrypted_len);
+	rc = decrypted_len;
+
+out:
+	if (parent == TPM2_RH_NULL && key_handle)
+		tpm2_flush_context(chip, key_handle);
+
+	if (blob_handle)
+		tpm2_flush_context(chip, blob_handle);
+
+	tpm_put_ops(chip);
+
+	return rc;
+}
+EXPORT_SYMBOL_GPL(tpm2_rsa_decrypt);
+
 /**
  * tpm2_startup - turn on the TPM
  * @chip: TPM chip to use
diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index 52bfb673ab48..b1c96ee7b672 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -247,6 +247,7 @@ enum tpm2_command_codes {
 	TPM2_CC_NV_READ                 = 0x014E,
 	TPM2_CC_CREATE		        = 0x0153,
 	TPM2_CC_LOAD		        = 0x0157,
+	TPM2_CC_RSA_DECRYPT	        = 0x0159,
 	TPM2_CC_SEQUENCE_UPDATE         = 0x015C,
 	TPM2_CC_UNSEAL		        = 0x015E,
 	TPM2_CC_CONTEXT_LOAD	        = 0x0161,
-- 
2.21.1

