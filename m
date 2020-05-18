Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9EC1D8014
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727782AbgERR1U (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727942AbgERR1T (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:19 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEDC4C05BD0A
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:19 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f4so5134888pgi.10
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4i0uveCBnjeaPDKYn8Io6J23oMvZPVtv6Zah/nzES1c=;
        b=X9Bea00QsDEBP3ZK9YxM0YuiRMQFSKJg8+Sb8gg05P/Tnmu9vU5sOLxfTCvBKJMu6R
         0AnIv40M/aO/DWkIYCLtkxcbD+eGxJis3Lo9+QmcZzvL4VavYDqDZlz9GkVizknAVxkd
         B0JxzPZLehEukv3/STQzdycl9MHqCzmwtlCN0k27jxeU/nY7eFB/6Yhi8aXB+ncuctpK
         3ZYF5GhTUQQrxuXVIHhHqqGS8uxUukQ9Rk26emaA5no0g8gq3ePB39c65ANGrHJ1KV1s
         Bu1pWoQ+vSlBmZfXVL18R6GdlIDE6/lkf1TNwxvfHyJADXnrzU2PQ4m5fAJ2UCa5VRLk
         9cXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4i0uveCBnjeaPDKYn8Io6J23oMvZPVtv6Zah/nzES1c=;
        b=E/s3L7MTH6lGWIGoEOwUZLGnWioBSZBj/8a+q+crrnLE4IawWl6YVjD/7DlU3PyWfZ
         yvO5L1AOCyTogW7nn5ECpsuxRyD4kV9GTFiH/+9Hraf7KYCFYYTjEFmsOcWw9YD8AWGH
         haboj2OiRd1bDf8YtjkxMjvc3KKeqjwlxJf/hHigEjuT3qZNbBPvBEzVcWs+xH+sZk3R
         DOIaQK6ixFgqm6KP0A4PGzOteO530s/0/NALWgYD2YVk9gdld5IJ8hJI8mbNJiSV1Mfk
         ik84FBKmCw/uRn91xngvPyhCBgdJHUxNjIxhMvrCc/PFuQTss7uDJPIjCLp9QskpQ3ai
         u5YA==
X-Gm-Message-State: AOAM531ppdgXJj9M/H+z9Ew28ItIxVPg4BLNVWBA4y6oTIBoLjS+gV/m
        e0EnMrtnwjhiV3ermOH24b3f7GphCps=
X-Google-Smtp-Source: ABdhPJwAodeSciIDbXJogkgPb5O+ayBTb1w5qrjI6v3q65j278rtKNgR8Dg+/rdxFaZPB+aynOxT+A==
X-Received: by 2002:a63:b649:: with SMTP id v9mr14426139pgt.402.1589822838909;
        Mon, 18 May 2020 10:27:18 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:18 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com
Subject: [PATCH 07/17] tpm2: add hmac checks to tpm2_pcr_extend()
Date:   Mon, 18 May 2020 10:26:54 -0700
Message-Id: <20200518172704.29608-8-prestwoj@gmail.com>
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

We use tpm2_pcr_extend() in trusted keys to extend a PCR to prevent a
key from being re-loaded until the next reboot.  To use this
functionality securely, that extend must be protected by a session
hmac.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 drivers/char/tpm/tpm2-cmd.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/drivers/char/tpm/tpm2-cmd.c b/drivers/char/tpm/tpm2-cmd.c
index 8d076c6752eb..b29824ae237c 100644
--- a/drivers/char/tpm/tpm2-cmd.c
+++ b/drivers/char/tpm/tpm2-cmd.c
@@ -218,13 +218,6 @@ int tpm2_pcr_read(struct tpm_chip *chip, u32 pcr_idx,
 	return rc;
 }
 
-struct tpm2_null_auth_area {
-	__be32  handle;
-	__be16  nonce_size;
-	u8  attributes;
-	__be16  auth_size;
-} __packed;
-
 /**
  * tpm2_pcr_extend() - extend a PCR value
  *
@@ -238,24 +231,23 @@ int tpm2_pcr_extend(struct tpm_chip *chip, u32 pcr_idx,
 		    struct tpm_digest *digests)
 {
 	struct tpm_buf buf;
-	struct tpm2_null_auth_area auth_area;
+	struct tpm2_auth *auth;
 	int rc;
 	int i;
 
-	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_PCR_EXTEND);
+	rc = tpm2_start_auth_session(chip, &auth);
 	if (rc)
 		return rc;
 
-	tpm_buf_append_u32(&buf, pcr_idx);
+	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_PCR_EXTEND);
+	if (rc) {
+		tpm2_end_auth_session(auth);
+		return rc;
+	}
 
-	auth_area.handle = cpu_to_be32(TPM2_RS_PW);
-	auth_area.nonce_size = 0;
-	auth_area.attributes = 0;
-	auth_area.auth_size = 0;
+	tpm_buf_append_name(&buf, auth, pcr_idx, NULL);
+	tpm_buf_append_hmac_session(&buf, auth, 0, NULL, 0);
 
-	tpm_buf_append_u32(&buf, sizeof(struct tpm2_null_auth_area));
-	tpm_buf_append(&buf, (const unsigned char *)&auth_area,
-		       sizeof(auth_area));
 	tpm_buf_append_u32(&buf, chip->nr_allocated_banks);
 
 	for (i = 0; i < chip->nr_allocated_banks; i++) {
@@ -264,7 +256,9 @@ int tpm2_pcr_extend(struct tpm_chip *chip, u32 pcr_idx,
 			       chip->allocated_banks[i].digest_size);
 	}
 
+	tpm_buf_fill_hmac_session(&buf, auth);
 	rc = tpm_transmit_cmd(chip, &buf, 0, "attempting extend a PCR value");
+	rc = tpm_buf_check_hmac_response(&buf, auth, rc);
 
 	tpm_buf_destroy(&buf);
 
-- 
2.21.1

