Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 492EB1D8013
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbgERR1U (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727782AbgERR1T (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:19 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D58DC061A0C
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:18 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id y198so3679072pfb.4
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XNkq9XCLnKcT4GfqnEEcwE3/rzXf2A2KNTBDzaCFtpU=;
        b=IQc7pV3ng61KdGtLYe6PpKyEPhKT3jX7qIpx4T/PYAreFzClp5obtq52IirIKBdejz
         rG9e7DoYyx3doiaESROvvxGIpzEq+UYSJu06lrN7jPvX3NG5E6Znf7zf9cftB3kA5cQI
         NYjMFP0LlmHejpAnlmVN/oPcMEDtgXH5UWzhybBzqMPTOgNpvbPVt/TUiCDtZ/p9GJhz
         Tx0H2FyXIxrSyxUmp0xmUuULa4YCmJmid7/BcAw6Rfy5wpVKzdWVLE8Z1pdpNZKCf3gO
         sB3M8d25NdkjvWLFfQ3G4UiW5xs0+uxAw9Jgxs60uCpF5lR6m/5A9+mboon0K4z9ZLqC
         UE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XNkq9XCLnKcT4GfqnEEcwE3/rzXf2A2KNTBDzaCFtpU=;
        b=Ae19kbzQMOrKV8pdW/dcPLKxOLA62LmcWl270MfLQ3Y0uqjzaEeUkAWJs3PrUrhg8G
         OVbvNGnvwC5JV9XA4Tst0tOjjiYqBDUBanRlcPGSV3dDEAjb3BZ3uBXieOeayUnTH67G
         Q4uB85/be+C6XNri5cyUJHu0UKFipJUMQcAXdVhgJmQ2alerdqCV6PAANtvGt9WGIv5k
         t2niJ7L8LyfJU3qr4uD1/RPB/hJeMBkoJcPavWWOUhtehQ/g4h9WUdtwHixevZqLCJ9E
         ga6wic4KeYO9k8NLZDcH4kqG8dzIDADs+spY+u5bRDrsIgeKbNX1+yY+3drFXVF4zM80
         67Gw==
X-Gm-Message-State: AOAM532ZAqBwQhXL4QWuJDdtcija5ApaBqy4HG9/4HXyREEYBoEGOOWC
        luOA24d/8JdhcRPc1vSYhLPLt1Vmdj0=
X-Google-Smtp-Source: ABdhPJwSgVC12gsnpA0p/Hr8h1UZKr4zYM+TtQIohpp2wVyDSre7Ku66GsfRg/1BgOCiMrVQR0IVrQ==
X-Received: by 2002:a62:3303:: with SMTP id z3mr16741261pfz.88.1589822837797;
        Mon, 18 May 2020 10:27:17 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:17 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com
Subject: [PATCH 06/17] tpm-buf: add tpm_buf_parameters()
Date:   Mon, 18 May 2020 10:26:53 -0700
Message-Id: <20200518172704.29608-7-prestwoj@gmail.com>
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

Introducing encryption sessions changes where the return parameters
are located in the buffer because if a return session is present
they're 4 bytes beyond the header with those 4 bytes showing the
parameter length.  If there is no return session, then they're in the
usual place immediately after the header.  The tpm_buf_parameters()
encapsulates this calculation and should be used everywhere
&buf.data[TPM_HEADER_SIZE] is used now

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 drivers/char/tpm/tpm-buf.c | 10 ++++++++++
 drivers/char/tpm/tpm.h     |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/drivers/char/tpm/tpm-buf.c b/drivers/char/tpm/tpm-buf.c
index f56350123a08..a5d793d8180d 100644
--- a/drivers/char/tpm/tpm-buf.c
+++ b/drivers/char/tpm/tpm-buf.c
@@ -190,3 +190,13 @@ u32 tpm_get_inc_u32(const u8 **ptr)
 	return val;
 }
 EXPORT_SYMBOL_GPL(tpm_get_inc_u32);
+
+u8 *tpm_buf_parameters(struct tpm_buf *buf)
+{
+	int offset = TPM_HEADER_SIZE;
+
+	if (tpm_buf_tag(buf) == TPM2_ST_SESSIONS)
+		offset += 4;
+
+	return &buf->data[offset];
+}
diff --git a/drivers/char/tpm/tpm.h b/drivers/char/tpm/tpm.h
index a1959675a889..ade4af4d52ca 100644
--- a/drivers/char/tpm/tpm.h
+++ b/drivers/char/tpm/tpm.h
@@ -169,6 +169,8 @@ u8 tpm_get_inc_u8(const u8 **ptr);
 u16 tpm_get_inc_u16(const u8 **ptr);
 u32 tpm_get_inc_u32(const u8 **ptr);
 
+u8 *tpm_buf_parameters(struct tpm_buf *buf);
+
 /* opaque structure, holds auth session parameters like the session key */
 struct tpm2_auth;
 
-- 
2.21.1

