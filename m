Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5D1F62411A
	for <lists+keyrings@lfdr.de>; Thu, 10 Nov 2022 12:12:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbiKJLMI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 10 Nov 2022 06:12:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbiKJLME (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 10 Nov 2022 06:12:04 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D816DCFA
        for <keyrings@vger.kernel.org>; Thu, 10 Nov 2022 03:12:03 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id y4so1166109plb.2
        for <keyrings@vger.kernel.org>; Thu, 10 Nov 2022 03:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yaq+SFAP5kTf9oPrYPpMvzkjalgNUTHY8MYqzihNGbY=;
        b=W1ZC/0/jOj62exU1NlwqP2F21YthQH/vEaLHLYXraLCvXwC+bo1E8ztCFTZSqVUMLi
         teaoHcLCkiHS1We6wJTp7SRCvPogWQwMqUIdF/ea6ipIvDfWSIxPr19PSuVpammjU9D4
         VKI0tHLgSTEZSP5uWlz3VHI0wyzs3Ax0wz38L0nGoJt/Ar2V2RXtM62VhHepMJ6iHIo1
         cwPW383kcyvjkZUZrJ6GAd+oihi1xiGQLrL8LrgTxU2nS7Ty80AN5mm1xPbqO+8wZfxD
         BW9v/m/wl5WwFeL4TAEiSuI9r3B37Sx9TR40gqlzSVIZfdAPdENEHC4IVmHdxPUD/YfM
         M4qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yaq+SFAP5kTf9oPrYPpMvzkjalgNUTHY8MYqzihNGbY=;
        b=WijantUA6hOBPpJPUZPL6bsGKaFj+RcvjMKRdZ0VCKFoXgclRBgL/TZyw3sRNHvQCW
         LrTNZF/WVy2ljuRAtqSickLzYjzHRXTXvtBG68QrM8xbMktJAId0twIse2RYBc/VVBa7
         5nQT3xJjFcFIqKJY0veG5gKb+O/lAfX1BZvjv57CqFvcUA76tudNkWEFHdHIywVHbg7e
         t3EKc+yAFYQDgaNvgrMxoF0/Gbd0NIkJQ2MPCgWjHXdBYab4/+rBnICkrohAhXOS3Ojx
         DhHf/2cd1ZiQ7bezrjNZtjBHNrwqRJaIECrvRX3rNPPNhmMSOBDbHrCX9q+D0it5TLQb
         AOEQ==
X-Gm-Message-State: ACrzQf0lrZsMKgTKcElrj5qhaElsNkOuKrcEDPS54JiH2G7tQC3gO5TG
        o6/xLMkuPrnp/EQHXbCpQoMC/+F3S9jr5A==
X-Google-Smtp-Source: AMsMyM4ofpvuMY+7nXoyvVA9/VE8N84lCP9lqiryxNbGE3ShZFhtkHDbxVs+jGAa+XPX1Osm81MDGQ==
X-Received: by 2002:a17:90a:1097:b0:213:d7d3:ab8 with SMTP id c23-20020a17090a109700b00213d7d30ab8mr58405678pja.91.1668078722103;
        Thu, 10 Nov 2022 03:12:02 -0800 (PST)
Received: from sumit-X1.. ([223.178.212.236])
        by smtp.gmail.com with ESMTPSA id 68-20020a621647000000b0056bd1bf4243sm9903435pfw.53.2022.11.10.03.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 03:12:01 -0800 (PST)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     keyrings@vger.kernel.org
Cc:     jejb@linux.ibm.com, zohar@linux.ibm.com,
        linux-integrity@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org, Sumit Garg <sumit.garg@linaro.org>,
        Jerome Forissier <jerome.forissier@linaro.org>
Subject: [PATCH] KEYS: trusted: tee: Make registered shm dependency explicit
Date:   Thu, 10 Nov 2022 16:41:40 +0530
Message-Id: <20221110111140.1999538-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

TEE trusted keys support depends on registered shared memory support
since the key buffers are needed to be registered with OP-TEE. So make
that dependency explicit to not register trusted keys support if
underlying implementation doesn't support registered shared memory.

Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Tested-by: Jerome Forissier <jerome.forissier@linaro.org>
---
 security/keys/trusted-keys/trusted_tee.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/security/keys/trusted-keys/trusted_tee.c b/security/keys/trusted-keys/trusted_tee.c
index c8626686ee1b..ac3e270ade69 100644
--- a/security/keys/trusted-keys/trusted_tee.c
+++ b/security/keys/trusted-keys/trusted_tee.c
@@ -219,7 +219,8 @@ static int trusted_tee_get_random(unsigned char *key, size_t key_len)
 
 static int optee_ctx_match(struct tee_ioctl_version_data *ver, const void *data)
 {
-	if (ver->impl_id == TEE_IMPL_ID_OPTEE)
+	if (ver->impl_id == TEE_IMPL_ID_OPTEE &&
+	    ver->gen_caps & TEE_GEN_CAP_REG_MEM)
 		return 1;
 	else
 		return 0;
-- 
2.34.1

