Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5151D801D
	for <lists+keyrings@lfdr.de>; Mon, 18 May 2020 19:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgERR11 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 May 2020 13:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728304AbgERR11 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 May 2020 13:27:27 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1893FC061A0C
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:27 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q24so140136pjd.1
        for <keyrings@vger.kernel.org>; Mon, 18 May 2020 10:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1BU+0TAFPcTkM0eFuwloyuTiUJdwFdkK3Vk17qlbQrI=;
        b=EQ7j2Fs3v9jpLfyjLs7fw4e6sCTdeJ2Qv5CqTNpZEbyW9MFzzaopiUjeTKXvewRk3V
         r1WvGS+YH/qLpW1Czp5IL5kVrVTmAUxboiOHzP1xExXFYoZrAUJTlWzf8N0Q4WbXxM5z
         mlHpwUDlurLL0A1QiEuKLvAuGtUTlvrVOzxy50FFhzkrIrSKPje9SUuFWb+dJYbYt59c
         oRxzyIS0anFJVE8pCyOxXwSHfPEvFGHaeNvRatoj2xfqftWfi4uhv2V0Zt5bdjSJpi7B
         ICSstUeOFloNLuGnMjA2WGFoeEdrYS5NSFm0hgRA5HbaKJKOOueqNjG34/OUP00D1JBs
         nkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1BU+0TAFPcTkM0eFuwloyuTiUJdwFdkK3Vk17qlbQrI=;
        b=FF9CVl3Lh8F9YOzmgrJ3Ne73cMJKSyg5E+K4ooI00bjTw5dfs4todfZ8Jy3lrKNgHG
         QBy61ZdjuHvtnLKBBrH8IXCcUVxTXgJPm9Pm+r8+KGrsrHOzGo0IvkzNLgELx1rgZRuH
         IAIrQ7YI5vHpFJ4gbd2fpb6j6hHHpxsBOnggzt+dwiz4uU1Ir9Of4EsajAB+TyzQ4Jyu
         Nfnq1x4XKBy9YJYG9y+3TPHlGxBhJ9eT4vPYIPHeE97Q4NnOK82ywJtiI+7H4kstTElQ
         Jms8VnlFO3pu3GyDUWQs0CafYUf0P7f4f92WYRDNiIzWW5yMmVPSIhFVKkiN0BWw27iY
         ZJ/Q==
X-Gm-Message-State: AOAM531C+VLqKSEHnmWBJqY+fv03afccJEjf/fSmXzzc/LY2UnA5wBpL
        FXnXXTGkOzFhj5pn8n7D8tcT3q6EAgo=
X-Google-Smtp-Source: ABdhPJzki2/776jLP3bYP1w90+nBKIzK7MQiENosl0vph9Lm8LJDahh3DrVX99v56kG0pywXr4hSpg==
X-Received: by 2002:a17:90a:5895:: with SMTP id j21mr521819pji.92.1589822846269;
        Mon, 18 May 2020 10:27:26 -0700 (PDT)
Received: from host-29.home (50-39-160-111.bvtn.or.frontiernet.net. [50.39.160.111])
        by smtp.gmail.com with ESMTPSA id o14sm4092448pfp.89.2020.05.18.10.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 10:27:25 -0700 (PDT)
From:   James Prestwood <prestwoj@gmail.com>
To:     keyrings@vger.kernel.org
Cc:     James.Bottomley@HansenPartnership.com,
        James Prestwood <prestwoj@gmail.com>
Subject: [PATCH 14/17] include: linux: tpm: expose tpm2_rsa_decrypt
Date:   Mon, 18 May 2020 10:27:01 -0700
Message-Id: <20200518172704.29608-15-prestwoj@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200518172704.29608-1-prestwoj@gmail.com>
References: <20200518172704.29608-1-prestwoj@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Expose these APIs so other modules can use them.
---
 include/linux/tpm.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/tpm.h b/include/linux/tpm.h
index b1c96ee7b672..7dd33f144bce 100644
--- a/include/linux/tpm.h
+++ b/include/linux/tpm.h
@@ -387,6 +387,9 @@ static inline u32 tpm2_rc_value(u32 rc)
        return (rc & BIT(7)) ? rc & 0xff : rc;
 }
 
+extern int tpm2_rsa_decrypt(struct tpm_chip *chip, u32 parent,
+			    const unsigned char *keyblob, size_t bloblen,
+			    const void *data, size_t len, void *out);
 #else
 static inline int tpm_is_tpm2(struct tpm_chip *chip)
 {
@@ -418,5 +421,11 @@ static inline struct tpm_chip *tpm_default_chip(void)
 {
 	return NULL;
 }
+static inline int tpm2_rsa_decrypt(struct tpm_chip *chip, u32 parent,
+				   const unsigned char *keyblob, size_t bloblen,
+				   const void *data, size_t len, void *out)
+{
+	return -ENODEV;
+}
 #endif
 #endif
-- 
2.21.1

