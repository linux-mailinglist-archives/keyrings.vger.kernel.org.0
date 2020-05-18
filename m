Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE6E1D8010
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbgERR1Q (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727942AbgERR1P (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:15 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 773CCC061A0C
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:15 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id x10so4498040plr.4
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IWRS7emRXYf9qWcwlkWmHmKvw+QoHIBpaRQNYzd6eIk=;
        b=Vp3U5JfNzQg8WqwZvczMy+zStTaDZvZz5/Nwj5rlWs0CrqzNlXKM3Ly0gX2jQbYT1u
         c0zIFc95MSZNjhTRikVGTu0IbdvpE7Z9bXg6TpCBIJ7oNMYqWsRODMObEEVcZdsCtCeD
         RDDWnCVyP3vMxjIOyJC/0UJSJzYaL05SAyV7P5zP1BeOA9YZWykTD/wPm8Q0gcfN8ii+
         Ux286lHRtYwM92sjI4IuUMfNfNv5gjef6CjajI0dCvUR97fnIcRi8m3yTguVsvXp/600
         KErFqgBHtVJe3up53IMLS0lFLYsGjuo152UaPPO73B096JLXvp2P87w21njsBvagp7aQ
         ETzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IWRS7emRXYf9qWcwlkWmHmKvw+QoHIBpaRQNYzd6eIk=;
        b=ecO9J6/kOp69qRM3CZpayCYvrRrWP7PK6/kGCnjQTAeM8NvZUFKvqT3fqLhKSK0Cn3
         XpB76K4M0EkYOkkXQc0Y/591B7hn+yrNDiEGb73poZ6khQ+r40NzvYi+rqmEiEyB1ngV
         GLusbuH0UIUy4BY61o90OVZIZrUUR+tAvH7FUKA+5xI/XPydqen+FqfTuYqcthD8kZXB
         1Ez1RFmcFxVd4/TeSLtANw/rIQPWa4KYV3bchoVfVtEG9dRsrFV8Z0gWHM7TQmBt70Of
         a3ChC4vFE4P7SgtWTM0eopdCGasEA8nRLDAU3bxfPax1YExW5WyW4OWoMuw/sOkuoCra
         ZuUA==
X-Gm-Message-State: AOAM533ZFJu1I4WAjpR6BC/UnCjgXxbFQxsEfwPbenVMMcuZua0m+zQ4
        vTKK2rS8obwmkUT/Nyd0BwJHhZjuLsU=
X-Google-Smtp-Source: ABdhPJyIA/tYn/LrGzy6b/qFeFvGBOos+MiXyn4Rhypg4QH24kbKo5SS/L2D6wdVi3cBwPGsTYR19Q==
X-Received: by 2002:a17:90b:19d2:: with SMTP id nm18mr491944pjb.71.1589822834817;
        Mon, 18 May 2020 10:27:14 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:14 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com
Subject: [PATCH 03/17] tpm-buf: add cursor based functions for response parsing
Date:   Mon, 18 May 2020 10:26:50 -0700
Message-Id: <20200518172704.29608-4-prestwoj@gmail.com>
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

It's very convenient when parsing responses to have a cursor you
simply move over the response extracting the data.  Add such cursor
functions for the TPM unsigned integer types.

Signed-off-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 drivers/char/tpm/tpm-buf.c | 26 ++++++++++++++++++++++++++
 drivers/char/tpm/tpm.h     |  4 ++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/char/tpm/tpm-buf.c b/drivers/char/tpm/tpm-buf.c
index 8c1ed8a14e01..553adb84b0ac 100644
--- a/drivers/char/tpm/tpm-buf.c
+++ b/drivers/char/tpm/tpm-buf.c
@@ -163,3 +163,29 @@ void tpm_buf_append_2b(struct tpm_buf *buf, struct tpm_buf *tpm2b)
 }
 EXPORT_SYMBOL_GPL(tpm_buf_append_2b);
 
+/* functions for unmarshalling data and moving the cursor */
+u8 tpm_get_inc_u8(const u8 **ptr)
+{
+	return *((*ptr)++);
+}
+EXPORT_SYMBOL_GPL(tpm_get_inc_u8);
+
+u16 tpm_get_inc_u16(const u8 **ptr)
+{
+	u16 val;
+
+	val = get_unaligned_be16(*ptr);
+	*ptr += sizeof(val);
+	return val;
+}
+EXPORT_SYMBOL_GPL(tpm_get_inc_u16);
+
+u32 tpm_get_inc_u32(const u8 **ptr)
+{
+	u32 val;
+
+	val = get_unaligned_be32(*ptr);
+	*ptr += sizeof(val);
+	return val;
+}
+EXPORT_SYMBOL_GPL(tpm_get_inc_u32);
diff --git a/drivers/char/tpm/tpm.h b/drivers/char/tpm/tpm.h
index dfa03b63d8ee..c75340dc3bce 100644
--- a/drivers/char/tpm/tpm.h
+++ b/drivers/char/tpm/tpm.h
@@ -165,6 +165,10 @@ void tpm_buf_append_u16(struct tpm_buf *buf, const u16 value);
 void tpm_buf_append_u32(struct tpm_buf *buf, const u32 value);
 void tpm_buf_append_2b(struct tpm_buf *buf, struct tpm_buf *tpm2b);
 
+u8 tpm_get_inc_u8(const u8 **ptr);
+u16 tpm_get_inc_u16(const u8 **ptr);
+u32 tpm_get_inc_u32(const u8 **ptr);
+
 extern struct class *tpm_class;
 extern struct class *tpmrm_class;
 extern dev_t tpm_devt;
-- 
2.21.1

