Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4241925F8A1
	for <lists+keyrings@lfdr.de>; Mon,  7 Sep 2020 12:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbgIGKkb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 7 Sep 2020 06:40:31 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:47092 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728932AbgIGKju (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 7 Sep 2020 06:39:50 -0400
Received: by mail-wr1-f65.google.com with SMTP id o5so15229133wrn.13
        for <keyrings@vger.kernel.org>; Mon, 07 Sep 2020 03:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YsZNBDHt502uQNfqBAPLlhPWF3Q26FjHG7KwkPDxKY4=;
        b=XiIf7cWPpZW2W7KkIXRmbn+JfdIuy5f7krTEfh8xCQIImxszDPRsEoU0ifABKDx1vu
         xc4gH4W/STTWBMuLC6M4y+DxmpC1Ns28NGQZTqp5ly6slkoe3rz2D4jXWP3Xen1ITDMT
         0NZsOBpAuL6fmD1OOeu0zQf4OXOJexHOIlyiJ+XCODLu72zyFs6TGP+HHwimCIzSPPDD
         oZVBI721RCqhUShrIZ9pmUpwzPtRUhXYey43ztS00h7ZkmmAI86lnAj90R4+nWQv6RYU
         VXEMJVvoFsk2GVRA5Z+5xg898dzhzM5SPohUWrIBhoUhexfoYxNmabLKcN1Nbi7f/Dfp
         A2Rg==
X-Gm-Message-State: AOAM531ysN+mPE4JW3ZjWmHY2R9Xj2YJjAOqWoGjKQd/j/pM/qM4aO2Q
        ZuR4Gv7zJ+jllzZ3Lv7JxYIJc1PTFBYpBQ==
X-Google-Smtp-Source: ABdhPJyXI1M1qUMzGb9RQDW7aJy7skeNCichUDr/uiGF/JBkkcavk6A4RbzYWxe3HN8KG8iG+T2QJA==
X-Received: by 2002:adf:f207:: with SMTP id p7mr22234510wro.152.1599475186783;
        Mon, 07 Sep 2020 03:39:46 -0700 (PDT)
Received: from localhost.localdomain ([82.213.220.217])
        by smtp.gmail.com with ESMTPSA id 128sm26178030wmz.43.2020.09.07.03.39.45
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 03:39:46 -0700 (PDT)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Subject: [RESEND][PATCH] keys: Update comment for restrict_link_by_key_or_keyring_chain
Date:   Mon,  7 Sep 2020 12:39:36 +0200
Message-Id: <20200907103936.263810-2-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200907103936.263810-1-andrew.zaborowski@intel.com>
References: <20200907103936.263810-1-andrew.zaborowski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Add the bit of information that makes
restrict_link_by_key_or_keyring_chain different from
restrict_link_by_key_or_keyring to the inline docs comment.

Signed-off-by: Andrew Zaborowski <andrew.zaborowski@intel.com>
---
 crypto/asymmetric_keys/restrict.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/restrict.c
index 77ebebada29..84cefe3b358 100644
--- a/crypto/asymmetric_keys/restrict.c
+++ b/crypto/asymmetric_keys/restrict.c
@@ -244,9 +244,10 @@ int restrict_link_by_key_or_keyring(struct key *dest_keyring,
  * @payload: The payload of the new key.
  * @trusted: A key or ring of keys that can be used to vouch for the new cert.
  *
- * Check the new certificate only against the key or keys passed in the data
- * parameter. If one of those is the signing key and validates the new
- * certificate, then mark the new certificate as being ok to link.
+ * Check the new certificate against the key or keys passed in the data
+ * parameter and against the keys already linked to the destination keyring. If
+ * one of those is the signing key and validates the new certificate, then mark
+ * the new certificate as being ok to link.
  *
  * Returns 0 if the new certificate was accepted, -ENOKEY if we
  * couldn't find a matching parent certificate in the trusted list,
-- 
2.20.1

