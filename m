Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6781D800E
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgERR1P (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgERR1O (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:14 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9213BC05BD09
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:14 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id t11so5146590pgg.2
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oHITpSRaDOxHt+OJGpz86kUPCUVylMr0qalk3pgiieM=;
        b=P7kmqkQAoT4XBsco7M4uM7mb2eqPZSRd+E/j87i4sM2T1s7ryg/N3/q6zUZAKvOBdg
         o4Cj9ZMSz0ODpBTehbYy5kpT1o6f4OdgyN7Fe77uIcGm/Dpp0pI+8sU6e284q+8MZuEf
         2T3mBUXml7VQdENuZHBBO6zQ6zzRb4LB2MdfiSN8WXvXu8LHNDMNobVLgEf4lsA8CCDg
         kORF6W3hdatqLud3e81EwamkrqZ1Dy9raJ5ns0a8hUvc5rwroed846B2vvHMPl8B95Xz
         ysvHpjSaQQqtIkNj77Fn/IiQ4QgRCKp4lU/40fDrwrmGN4pxS1TXCZlBO368jv7NIJ5p
         M/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oHITpSRaDOxHt+OJGpz86kUPCUVylMr0qalk3pgiieM=;
        b=oGkHUtvrg5fJzW4guKy+5Iq62QDFzdmLjTzdK1g+mn3xgA95C2CuEhiLqI2rPUohcb
         CN9XGbCwOMePHqPznKzLlEUJubXessFN/hQVKtcp8AYHfoGIO8JhmcyNcSksT2howN3F
         z1fNpAfMeiix0rsFiXpEwPqp5xglcPLJAk4OJvFY56Ld7ohcfS3uBnOjcr9kI9FmA1Gj
         F/X/pW81qeZAWTe4sb8WrsWKyGINE0kcTq3LE9qCr1BmPl5Ikwc9k94sXB/qzEeivngw
         oex17slcuTu0zEKYYiyCfDPyocXlE2rpqT7AR9uB1I3BRn/wuf2uXiLm/xFQHqnQFzJU
         Y1TA==
X-Gm-Message-State: AOAM530veUX+/UmTc87skDTJ1dV7hpo11bZYtmdbRoMq/9MXVbOzADGG
        BLhHaRTaoygzmMGNzDb1/ScWtcDBiog=
X-Google-Smtp-Source: ABdhPJxbm55ZVzhAHx+XD0u5f/gmZYgsdTepmY5VGyq/JnB32ezSNpbR7mZ2xCZlzrbcy7dylfiUdA==
X-Received: by 2002:a63:3c11:: with SMTP id j17mr16368542pga.70.1589822833840;
        Mon, 18 May 2020 10:27:13 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:13 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com
Subject: [PATCH 02/17] tpm-buf: add handling for TPM2B types
Date:   Mon, 18 May 2020 10:26:49 -0700
Message-Id: <20200518172704.29608-3-prestwoj@gmail.com>
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

Most complex TPM commands require appending TPM2B buffers to the
command body.  Since TPM2B types are essentially variable size arrays,
it makes it impossible to represent these complex command arguments as
structures and we simply have to build them up using append primitives
like these.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 drivers/char/tpm/tpm-buf.c | 47 ++++++++++++++++++++++++++++++++++++++
 drivers/char/tpm/tpm.h     |  2 ++
 2 files changed, 49 insertions(+)

diff --git a/drivers/char/tpm/tpm-buf.c b/drivers/char/tpm/tpm-buf.c
index 9fa8a9cb0fdf..8c1ed8a14e01 100644
--- a/drivers/char/tpm/tpm-buf.c
+++ b/drivers/char/tpm/tpm-buf.c
@@ -8,6 +8,8 @@
 
 #include <linux/module.h>
 
+#include <asm/unaligned.h>
+
 static int __tpm_buf_init(struct tpm_buf *buf)
 {
 	buf->data_page = alloc_page(GFP_HIGHUSER);
@@ -46,6 +48,24 @@ int tpm_buf_init(struct tpm_buf *buf, u16 tag, u32 ordinal)
 }
 EXPORT_SYMBOL_GPL(tpm_buf_init);
 
+int tpm_buf_init_2b(struct tpm_buf *buf)
+{
+	struct tpm_header *head;
+	int rc;
+
+	rc = __tpm_buf_init(buf);
+	if (rc)
+		return rc;
+
+	head = (struct tpm_header *) buf->data;
+
+	head->length = cpu_to_be32(sizeof(*head));
+
+	buf->flags = TPM_BUF_2B;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tpm_buf_init_2b);
+
 void tpm_buf_destroy(struct tpm_buf *buf)
 {
 	kunmap(buf->data_page);
@@ -53,6 +73,13 @@ void tpm_buf_destroy(struct tpm_buf *buf)
 }
 EXPORT_SYMBOL_GPL(tpm_buf_destroy);
 
+static void *tpm_buf_data(struct tpm_buf *buf)
+{
+	if (buf->flags & TPM_BUF_2B)
+		return buf->data + TPM_HEADER_SIZE;
+	return buf->data;
+}
+
 u32 tpm_buf_length(struct tpm_buf *buf)
 {
 	struct tpm_header *head = (struct tpm_header *)buf->data;
@@ -116,3 +143,23 @@ void tpm_buf_append_u32(struct tpm_buf *buf, const u32 value)
 	tpm_buf_append(buf, (u8 *) &value2, 4);
 }
 EXPORT_SYMBOL_GPL(tpm_buf_append_u32);
+
+static void tpm_buf_reset_int(struct tpm_buf *buf)
+{
+	struct tpm_header *head;
+
+	head = (struct tpm_header *)buf->data;
+	head->length = cpu_to_be32(sizeof(*head));
+}
+
+void tpm_buf_append_2b(struct tpm_buf *buf, struct tpm_buf *tpm2b)
+{
+	u16 len = tpm_buf_length(tpm2b);
+
+	tpm_buf_append_u16(buf, len);
+	tpm_buf_append(buf, tpm_buf_data(tpm2b), len);
+	/* clear the buf for reuse */
+	tpm_buf_reset_int(tpm2b);
+}
+EXPORT_SYMBOL_GPL(tpm_buf_append_2b);
+
diff --git a/drivers/char/tpm/tpm.h b/drivers/char/tpm/tpm.h
index 379629704522..dfa03b63d8ee 100644
--- a/drivers/char/tpm/tpm.h
+++ b/drivers/char/tpm/tpm.h
@@ -155,6 +155,7 @@ enum tpm_sub_capabilities {
 
 int tpm_buf_init(struct tpm_buf *buf, u16 tag, u32 ordinal);
 void tpm_buf_reset(struct tpm_buf *buf, u16 tag, u32 ordinal);
+int tpm_buf_init_2b(struct tpm_buf *buf);
 void tpm_buf_destroy(struct tpm_buf *buf);
 u32 tpm_buf_length(struct tpm_buf *buf);
 void tpm_buf_append(struct tpm_buf *buf, const unsigned char *new_data,
@@ -162,6 +163,7 @@ void tpm_buf_append(struct tpm_buf *buf, const unsigned char *new_data,
 void tpm_buf_append_u8(struct tpm_buf *buf, const u8 value);
 void tpm_buf_append_u16(struct tpm_buf *buf, const u16 value);
 void tpm_buf_append_u32(struct tpm_buf *buf, const u32 value);
+void tpm_buf_append_2b(struct tpm_buf *buf, struct tpm_buf *tpm2b);
 
 extern struct class *tpm_class;
 extern struct class *tpmrm_class;
-- 
2.21.1

