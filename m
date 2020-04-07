Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12F2E1A03B0
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 02:25:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726393AbgDGAZQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 20:25:16 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42673 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgDGAZQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 20:25:16 -0400
Received: by mail-wr1-f65.google.com with SMTP id h15so1789700wrx.9
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 17:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YsZNBDHt502uQNfqBAPLlhPWF3Q26FjHG7KwkPDxKY4=;
        b=VJumbGfi2XTfepzrTCF6YHWbLRwIdYn0Wx2Rxh1qECwE0AMG4/DP27nDV/bIrEJnB9
         iBxLA9NkOTVtSgqZkN0FTqg1IWtA1TT3Sqm3cLehc1AeqlDTx3F3HzgQuXmUk31p1vuS
         R2ABV/T09tyJTyof0Y5NmwpcYERksBs4b8swkZnnYgAOgXn9LhTYFDZhkZTNXTri7MN7
         CEucpbokG2PdlszJjxQ920DL2fu+vj9B2qPVCJDyjeTjWHr78V+qEa65DoBVSm29W7j7
         h36gbB7LJdqcKRTSyKVFXJQdU7A2oq9eVJG6ZMFpQf+5D4jS5GKPM4nQFvPZvOFTTiqx
         gTSg==
X-Gm-Message-State: AGi0PubgvsV7NPK0yrHdDHT0dyk33Swzbp5+wrpLfiXePxfiogIWSfQG
        eaJ6CqJLFF54dbAAYwj7pCyEEfWc
X-Google-Smtp-Source: APiQypIcUir7HQoIqRqGBeeDFwkhpQDAusZi7fMftoojYI4m5BIfkDoxpRR/zlxUxBJ6UvtrLV+Aiw==
X-Received: by 2002:adf:f08b:: with SMTP id n11mr1751492wro.323.1586219114579;
        Mon, 06 Apr 2020 17:25:14 -0700 (PDT)
Received: from localhost.localdomain ([185.79.22.180])
        by smtp.gmail.com with ESMTPSA id s66sm1557497wme.40.2020.04.06.17.25.13
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 17:25:14 -0700 (PDT)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Subject: [PATCH] keys: Update comment for restrict_link_by_key_or_keyring_chain
Date:   Tue,  7 Apr 2020 02:25:53 +0200
Message-Id: <20200407002553.25187-1-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.20.1
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

