Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B90C01C3541
	for <lists+keyrings@lfdr.de>; Mon,  4 May 2020 11:08:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727108AbgEDJIL (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 4 May 2020 05:08:11 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53625 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726625AbgEDJIL (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 4 May 2020 05:08:11 -0400
Received: by mail-wm1-f66.google.com with SMTP id k12so7534224wmj.3
        for <keyrings@vger.kernel.org>; Mon, 04 May 2020 02:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YsZNBDHt502uQNfqBAPLlhPWF3Q26FjHG7KwkPDxKY4=;
        b=EeCW2lpN2j36EPMk78CcIwixiXy35g3gpSW5aYGpm/BMuht18G08Zr8UFlKhySbECI
         VRmPY0tpZl5GwsgczdZxS/0BD2DN9lrUzUUmGE72b/b9NEiKkWaAt0RPRbiV3vsRASeE
         VvnMI389atlNjrdy4HzBEY8dq2OWuOo89GxizcgFZd41axUyhqDyszIz7e9Di+4L7kgS
         6B5k7ZcXhIToiw9M8Q8PVVF4Z7vjDgtWE7aDAG/dqLBYXxKVOlQknQZ5KRh5T9LWrBhY
         4wHWdMmig/x9noK+ukzN/IF5LR4PqpSDhojdjrl4o3Tk8CdlYgNQZvXorgzea6zDvg3a
         JF6g==
X-Gm-Message-State: AGi0Pua3A8JVx0otruDVsX7VOwzX5lPBe6nFYmg+zBfnUnUW7/zK9G8m
        W1hJyoiEJce7pqKixvjbiDBwyePQhmg=
X-Google-Smtp-Source: APiQypK1n0kwvZsEy/x3nB6aArtBoJtIRVv91xsYrSPHRmI/7IVhVQQhf1jPlUTUCjhcopfyFo2/ow==
X-Received: by 2002:a1c:668a:: with SMTP id a132mr14251605wmc.46.1588583289504;
        Mon, 04 May 2020 02:08:09 -0700 (PDT)
Received: from localhost.localdomain ([46.6.4.150])
        by smtp.gmail.com with ESMTPSA id t20sm10733071wmi.2.2020.05.04.02.08.08
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 02:08:08 -0700 (PDT)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Subject: [RESEND][PATCH] keys: Update comment for restrict_link_by_key_or_keyring_chain
Date:   Mon,  4 May 2020 11:08:00 +0200
Message-Id: <20200504090800.129593-1-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.25.1
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

