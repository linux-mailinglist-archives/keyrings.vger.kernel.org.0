Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF70125231F
	for <lists+keyrings@lfdr.de>; Tue, 25 Aug 2020 23:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgHYVur (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 25 Aug 2020 17:50:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbgHYVur (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 25 Aug 2020 17:50:47 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B65C061574
        for <keyrings@vger.kernel.org>; Tue, 25 Aug 2020 14:50:46 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x143so288257pfc.4
        for <keyrings@vger.kernel.org>; Tue, 25 Aug 2020 14:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FryoKgP6rPdYyYwvpbGQmS+G8+hYYCxYYspoVM7JhZg=;
        b=qTvJmd6RTrGMgAY4peOo+E5m3fvBayGatBUIwHCceGB8AW0B2ICdlxklQLdb55bhmS
         GrlhvyJ+dgJvV01lIIkUFClOhOjxeubBUpgFUfsRl3/CeknNI0muiU+xkUyPDgA2SQjM
         kzfgRJ3SyZvwEJ3akMD/pV38PbWFgI6UdBSw2G+tYoIqB+fjsQ+C2zMSEYZsOia8DY1I
         6DEHS0k7JM1HjaIEtiFxmUp32LcOqElz+dB1SZetCUFx78LeDSFdTq0C7MhepL85FL6Q
         KIaXTkvEaBItHGHaC2uERxVDpp5QzUsjvHGFuZu9jwsPeesKsOYi3eAauxKLC6Y45wwv
         AK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FryoKgP6rPdYyYwvpbGQmS+G8+hYYCxYYspoVM7JhZg=;
        b=HieSgOv6UIE5WIf0Y0LWRnnioUqhOxrH3n2stc3e8IoYX4uVft/4tN53l8A9eRjU3r
         R3qhA6VLbKEvDR3evZTL622frOavolsRtaOnwxFC8C1RqgCi1XS2tyFVYJfH2xJTTfh2
         dShv1jS2kBOfZVPUqxHU7ivqy0GYR8R4rRD8NpWIFcQlnF7Dr+fgNSKyvAA+44+WbcnO
         JIZipvAmNxfFqpjqJ20PxHUKU7yMyHYUk6mfzB5shM3obqsr4ta2w/EGDJ/ZKLeI8psH
         CoylWeVHJVVwWtIncda47UxVXsKruGlPf551SlYjUWR7RUlIDKJbupLWydjoJmktt7Pz
         sj2g==
X-Gm-Message-State: AOAM532Y4QoeReAsPZiRDPHD3A2Sq4HDnfs7zHLT8IMKxXi6mf6qt+Sk
        d5plTSAoy2V3yiKYQcEbUkFPxgR7tq+Vkg==
X-Google-Smtp-Source: ABdhPJx/HswI2Qj949AZrOrFszQknx7agwAyfi9gL2MNqiaVWr5wF3K+sbGABM2IzC9CIYycgjj+Xg==
X-Received: by 2002:a17:902:b405:: with SMTP id x5mr2815737plr.267.1598392246117;
        Tue, 25 Aug 2020 14:50:46 -0700 (PDT)
Received: from wolf.lan ([8.25.195.25])
        by smtp.gmail.com with ESMTPSA id t63sm88130pgt.50.2020.08.25.14.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 14:50:45 -0700 (PDT)
From:   Anatol Pomozov <anatol.pomozov@gmail.com>
To:     zohar@linux.ibm.com, keyrings@vger.kernel.org
Cc:     Anatol Pomozov <anatol.pomozov@gmail.com>
Subject: [PATCH] keys: Print more useful debug info if encryption algo is not available
Date:   Tue, 25 Aug 2020 14:50:40 -0700
Message-Id: <20200825215040.307947-1-anatol.pomozov@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Signed-off-by: Anatol Pomozov <anatol.pomozov@gmail.com>
---
 security/keys/encrypted-keys/encrypted.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/keys/encrypted-keys/encrypted.c b/security/keys/encrypted-keys/encrypted.c
index 192e531c146f..c09d48f53682 100644
--- a/security/keys/encrypted-keys/encrypted.c
+++ b/security/keys/encrypted-keys/encrypted.c
@@ -84,8 +84,8 @@ static int aes_get_sizes(void)
 
 	tfm = crypto_alloc_skcipher(blkcipher_alg, 0, CRYPTO_ALG_ASYNC);
 	if (IS_ERR(tfm)) {
-		pr_err("encrypted_key: failed to alloc_cipher (%ld)\n",
-		       PTR_ERR(tfm));
+		pr_err("encrypted_key: failed to alloc_cipher for %s (%ld)\n",
+		       blkcipher_alg, PTR_ERR(tfm));
 		return PTR_ERR(tfm);
 	}
 	ivsize = crypto_skcipher_ivsize(tfm);
-- 
2.28.0

