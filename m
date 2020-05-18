Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6061D8011
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgERR1S (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727942AbgERR1R (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:17 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6355DC061A0C
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:16 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id n15so132311pjt.4
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4x/3TSpmMIdn//ZEVT/ngeetbkRV8X2ObeYCcuramf8=;
        b=Spz5aj7RpEbHHE30eKPxdyyGUHFeDddR+lq7fw41ra9VbtmNxyPwbmquFjS7InSspl
         knjtxS+TDipwag/LYRdi+I271NQ17BvAjac5MZXnnA/2yWOVuEn7FE32tP1SIsA3Ijqq
         qAr4iQ+5YYAlCNik7VyJKZKnDkwGE7rJG0CG2+FT6DN7nWM6LxLA2ggWc3WySQs2XWgW
         Vt70guWqSAevXz47LHampkilgjwDT2TfD+OWsIW7M6YQHc7bl9LlzMgqRFymPffxhjXS
         dl0KrmCCk61W/kotSQAiHie2kN7Fsegw7dWDlB/KTchpIaoNhm6ETG9ZBr3IE4ZKodNM
         RrmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4x/3TSpmMIdn//ZEVT/ngeetbkRV8X2ObeYCcuramf8=;
        b=afClJOzg+nKMzdG4EybcLgkB1L/9TRh8Up5XR6j6fqHgApjAJloJTgwNbU/hLDbOPa
         vUZr+Jt0SmXyVUftH0bILWQe2zFNwIQPHHKgyAMkSLbMwCOrNYxvQumFdAjqABTSOl1P
         dKozNoCYKUeSiuTox3oi2SZdRH+ETm3/N7+rk6MQBYkfeKYKqmQMlSJHceUa2Ftls1Gd
         uXm96/YEGA1GHNDXVZ4JFc0dzIpmKpJWuMvEx5z95KI8uqAQOD11BY5Aqc1honhAMMv6
         xVOLew06bOrGzQBgw5kUkgEokVV64xd3//v78kkgc1xkiYoCxKbvowRyzT1/Jam8n+aA
         Rh+Q==
X-Gm-Message-State: AOAM533l1KIkossfNcfJsLTgv4XD+z6L0EZbmNb+Waj+7Tw5nzMnDjUn
        kDRqPG7Z71JG0XAUVyZi/o+tskD/lW0=
X-Google-Smtp-Source: ABdhPJwMSYQ5JaRnZm7kGxQqyvdjcaiIQkaUpPfsp9jYe8UJq5QK+R+ROgwrJPDhokBAljf4SAW2SQ==
X-Received: by 2002:a17:90b:1994:: with SMTP id mv20mr471459pjb.41.1589822835678;
        Mon, 18 May 2020 10:27:15 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:15 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com
Subject: [PATCH 04/17] tpm2-space: export the context save and load commands
Date:   Mon, 18 May 2020 10:26:51 -0700
Message-Id: <20200518172704.29608-5-prestwoj@gmail.com>
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

The TPM2 session handling code needs to save and restore a single
volatile context for the elliptic curve version of the NULL seed, so
export the APIs which do this for internal use.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 drivers/char/tpm/tpm.h        | 4 ++++
 drivers/char/tpm/tpm2-space.c | 8 ++++----
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/char/tpm/tpm.h b/drivers/char/tpm/tpm.h
index c75340dc3bce..ba76bec04ca4 100644
--- a/drivers/char/tpm/tpm.h
+++ b/drivers/char/tpm/tpm.h
@@ -250,6 +250,10 @@ int tpm2_prepare_space(struct tpm_chip *chip, struct tpm_space *space, u8 *cmd,
 		       size_t cmdsiz);
 int tpm2_commit_space(struct tpm_chip *chip, struct tpm_space *space, void *buf,
 		      size_t *bufsiz);
+int tpm2_save_context(struct tpm_chip *chip, u32 handle, u8 *buf,
+		      unsigned int buf_size, unsigned int *offset);
+int tpm2_load_context(struct tpm_chip *chip, u8 *buf,
+		      unsigned int *offset, u32 *handle);
 
 int tpm_bios_log_setup(struct tpm_chip *chip);
 void tpm_bios_log_teardown(struct tpm_chip *chip);
diff --git a/drivers/char/tpm/tpm2-space.c b/drivers/char/tpm/tpm2-space.c
index 982d341d8837..ca1cb56ccc51 100644
--- a/drivers/char/tpm/tpm2-space.c
+++ b/drivers/char/tpm/tpm2-space.c
@@ -65,8 +65,8 @@ void tpm2_del_space(struct tpm_chip *chip, struct tpm_space *space)
 	kfree(space->session_buf);
 }
 
-static int tpm2_load_context(struct tpm_chip *chip, u8 *buf,
-			     unsigned int *offset, u32 *handle)
+int tpm2_load_context(struct tpm_chip *chip, u8 *buf,
+		      unsigned int *offset, u32 *handle)
 {
 	struct tpm_buf tbuf;
 	struct tpm2_context *ctx;
@@ -116,8 +116,8 @@ static int tpm2_load_context(struct tpm_chip *chip, u8 *buf,
 	return 0;
 }
 
-static int tpm2_save_context(struct tpm_chip *chip, u32 handle, u8 *buf,
-			     unsigned int buf_size, unsigned int *offset)
+int tpm2_save_context(struct tpm_chip *chip, u32 handle, u8 *buf,
+		      unsigned int buf_size, unsigned int *offset)
 {
 	struct tpm_buf tbuf;
 	unsigned int body_size;
-- 
2.21.1

