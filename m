Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDA3950F143
	for <lists+keyrings@lfdr.de>; Tue, 26 Apr 2022 08:42:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245480AbiDZGpI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Apr 2022 02:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245477AbiDZGpI (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 26 Apr 2022 02:45:08 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F1E13F27
        for <keyrings@vger.kernel.org>; Mon, 25 Apr 2022 23:42:01 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id j15so10706032wrb.2
        for <keyrings@vger.kernel.org>; Mon, 25 Apr 2022 23:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1WzZeKjENByENjbHl5ETR6B+MtTKYG2VpY2b2s4rekE=;
        b=3o3JvKO3CBOkr/VRXV8DwgdmNZqfZhZs+rlCpKHixVD7j38qD0xAdTepiG704mz9y8
         v/TT86rai1roca6ewS40D9XVAzP22XtA8HuA/Wblnxa/tQycOmexhKGFk9CDzvUrrNim
         GkuMebBXW+4/FwDlsNi5o0tGZnPOmfNbHm3Hg4XXZt9vYC4CnOLsH7n8IsFNdIgzq6P4
         2pPAX6LbqPfJfXEoIOMDy3cUSPpWqhFHyqqVq4HSYyRtR6Quo32UAgyBPGfohwl9eukd
         MKAgnIl3juAxokWN5XGWpGsw7HNPulCLdG5vRm42jkvQrKBHLFUtZo+vyylQOh6SHqia
         G0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1WzZeKjENByENjbHl5ETR6B+MtTKYG2VpY2b2s4rekE=;
        b=cJ4U13ducOECFE1Ya56nbBZPpk0m6K9JM0qqXFsj2FyUmGdgWKJlkm8q+ilq1ob0u3
         n+GszTeFw4Qp8H8DOUZRvgpq1dN8tfkAphwSxlXR7Z9VNpH2NCTwIIOdwh3YirJQ24rM
         elDjZyh1nAwQu1eSpA4xcXPGEC0tgsYsXb3udRI+xtCiopBh56YCdtOevTC2h/59Ybv9
         sJk2Rf/HHloS5a++65KHwA8JGJIjxUvXq1uWW0UnVE0xHQgSYnOyCcCHYkZgKomXHenw
         CplAJ2+hM1+gXNGajrsfxjPowBRKXKKv4Tvgm/8p0YYoStD7j8FnmVTeLIWQciwp2zr4
         v93g==
X-Gm-Message-State: AOAM53153Vl5a4lHh5xD9h/dx/n978KSfSkOfLxkJddid05Y61MzAel7
        D4fTtVDZWR8V65nFxC6fN7djnw==
X-Google-Smtp-Source: ABdhPJyWgMIjDI/U3F55ScfmL9okND/v4Jw3J30PZR6nFbRMFevT+s/tEuK2hCps4ndGPSOLlVpx/g==
X-Received: by 2002:a05:6000:168d:b0:20a:e3ed:7fde with SMTP id y13-20020a056000168d00b0020ae3ed7fdemr2110384wrd.499.1650955320496;
        Mon, 25 Apr 2022 23:42:00 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id l14-20020a05600c1d0e00b00393ed37f63bsm4020430wms.26.2022.04.25.23.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 23:42:00 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     dhowells@redhat.com, dwmw2@infradead.org
Cc:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] certs: fix a typo on restrict_link_by_builtin_trusted kernel doc comment
Date:   Tue, 26 Apr 2022 06:41:55 +0000
Message-Id: <20220426064155.3788125-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The kernel doc comment use the wrong name for restrict_link_by_builtin_trusted
This fixes the following sparse warnings:
certs/system_keyring.c:46: warning: expecting prototype for restrict_link_to_builtin_trusted(). Prototype was for restrict_link_by_builtin_trusted() instead

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 certs/system_keyring.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index 05b66ce9d1c9..8fb718ef983d 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -34,7 +34,7 @@ extern __initconst const unsigned long system_certificate_list_size;
 extern __initconst const unsigned long module_cert_size;
 
 /**
- * restrict_link_to_builtin_trusted - Restrict keyring addition by built in CA
+ * restrict_link_by_builtin_trusted - Restrict keyring addition by built in CA
  *
  * Restrict the addition of keys into a keyring based on the key-to-be-added
  * being vouched for by a key in the built in system keyring.
-- 
2.35.1

