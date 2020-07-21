Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27812281B5
	for <lists+keyrings@lfdr.de>; Tue, 21 Jul 2020 16:15:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgGUOP1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 21 Jul 2020 10:15:27 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23471 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726359AbgGUOP0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 21 Jul 2020 10:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595340925;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc; bh=p3hi3xrdZQgrcmCmh6VAQFFWaZ++JX8czQmDuqdNFJw=;
        b=E8rxVIvXUjz1pX3hfPcOx2rLyWVHtpwqyeMfxY+kXQ++g9tkaARrx8TxqqKI/EUa5hD8dF
        uyE0C7pDekTnak6o2ZQGcm1liQvWGchYcsHcrcW0hsiRjELsBwm+ZSbDbxJaJAcXu732QD
        qeWo9Id95EGK+QSh8bO2n0KHU1Y6o8c=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-DvyRmA1BOP2qHlvkVvIa6A-1; Tue, 21 Jul 2020 10:15:23 -0400
X-MC-Unique: DvyRmA1BOP2qHlvkVvIa6A-1
Received: by mail-qv1-f71.google.com with SMTP id x37so12417666qvf.4
        for <keyrings@vger.kernel.org>; Tue, 21 Jul 2020 07:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=p3hi3xrdZQgrcmCmh6VAQFFWaZ++JX8czQmDuqdNFJw=;
        b=ZIM8wVIE0IzAl/xJMoyJxGtLdRRoGHAt4OLXW8jjmGLmEXeuYOtGjhkV3D5zM33BCY
         2+TJGNfKVWxbEvwSDht9Zycrzbgk2znyTmqU++Dlv0JgfkPLmlWrLVb4RyKCPOaHR8Fo
         yS7mxGkwCmNgklNc80eERF6zLnuukgx/L+ER9ry8shpUDba/OjypvYofX9S4g2GuftId
         AD36C133hjn1Pa7C0oUsjrcnGz0/wwv7qBa26gWmIyR9DV11phJLqngGBQ91VPUm1vBV
         MA+bAE2ajCX/8wo2MqGFaYUGpbP0B0Pe7NEMbNQeYKENa4RgQiUUL5MIxSNXap5F3V3v
         5KSw==
X-Gm-Message-State: AOAM530iojhCvJTZ2J1mHr/E92MCVIGklDSt3OIDYlpQ18WHidmBCijj
        9igYcq9XWhEmU/PmV4QATlpWBnjpubv/JIsVLc1Hztietj7LDQyMuMLvG+OZSQHk0B5hq0+OF4u
        BxupK2EUrmY946V7Er1M=
X-Received: by 2002:aed:2987:: with SMTP id o7mr29229968qtd.385.1595340923114;
        Tue, 21 Jul 2020 07:15:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpgbcSLCsIUUg/981LoMyBoE6jzlDFr+8f6gGViXBeoV3rMbiH7sCH6UBnDuUx0P9jhTDOgg==
X-Received: by 2002:aed:2987:: with SMTP id o7mr29229939qtd.385.1595340922836;
        Tue, 21 Jul 2020 07:15:22 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id d14sm22474159qti.41.2020.07.21.07.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 07:15:22 -0700 (PDT)
From:   trix@redhat.com
To:     dhowells@redhat.com, jarkko.sakkinen@linux.intel.com,
        jmorris@namei.org, serge@hallyn.com, denkenz@gmail.com,
        marcel@holtmann.org
Cc:     keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] KEYS: remove redundant memsets
Date:   Tue, 21 Jul 2020 07:15:16 -0700
Message-Id: <20200721141516.20335-1-trix@redhat.com>
X-Mailer: git-send-email 2.18.1
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Reviewing use of memset in keyctrl_pkey.c

keyctl_pkey_params_get prologue code to set params up

	memset(params, 0, sizeof(*params));
	params->encoding = "raw";

keyctl_pkey_params_get_2 and keyctl_pkey_query have the same
prologue and they call keyctl_pkey_params_get.

So remove the prologue from the callers.

In keyctl_pkey_params_get_2, reorder the copy_from_user
of uparams to closer to it's use to ensure that
the keyctrl_pkey_params_get is called first.

Fixes: 00d60fd3b932 ("KEYS: Provide keyctls to drive the new key type ops for asymmetric keys [ver #2]")

Signed-off-by: Tom Rix <trix@redhat.com>
---
 security/keys/keyctl_pkey.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/security/keys/keyctl_pkey.c b/security/keys/keyctl_pkey.c
index 931d8dfb4a7f..60b504681388 100644
--- a/security/keys/keyctl_pkey.c
+++ b/security/keys/keyctl_pkey.c
@@ -119,12 +119,6 @@ static int keyctl_pkey_params_get_2(const struct keyctl_pkey_params __user *_par
 	struct kernel_pkey_query info;
 	int ret;
 
-	memset(params, 0, sizeof(*params));
-	params->encoding = "raw";
-
-	if (copy_from_user(&uparams, _params, sizeof(uparams)) != 0)
-		return -EFAULT;
-
 	ret = keyctl_pkey_params_get(uparams.key_id, _info, params);
 	if (ret < 0)
 		return ret;
@@ -133,6 +127,9 @@ static int keyctl_pkey_params_get_2(const struct keyctl_pkey_params __user *_par
 	if (ret < 0)
 		return ret;
 
+	if (copy_from_user(&uparams, _params, sizeof(uparams)) != 0)
+		return -EFAULT;
+
 	switch (op) {
 	case KEYCTL_PKEY_ENCRYPT:
 	case KEYCTL_PKEY_DECRYPT:
@@ -166,8 +163,6 @@ long keyctl_pkey_query(key_serial_t id,
 	struct kernel_pkey_query res;
 	long ret;
 
-	memset(&params, 0, sizeof(params));
-
 	ret = keyctl_pkey_params_get(id, _info, &params);
 	if (ret < 0)
 		goto error;
-- 
2.18.1

