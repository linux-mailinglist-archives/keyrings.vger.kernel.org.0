Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A6728CF4B
	for <lists+keyrings@lfdr.de>; Tue, 13 Oct 2020 15:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728914AbgJMNj4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 13 Oct 2020 09:39:56 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37733 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728852AbgJMNj4 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 13 Oct 2020 09:39:56 -0400
Received: by mail-wm1-f67.google.com with SMTP id j136so21812024wmj.2
        for <keyrings@vger.kernel.org>; Tue, 13 Oct 2020 06:39:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YsZNBDHt502uQNfqBAPLlhPWF3Q26FjHG7KwkPDxKY4=;
        b=Z7nSX0xAVHCYqwLa3SBG2ZB1tUqehK2MXPwnHUronAJ3/uldWF6vBPT1+5dNbsxuLm
         HLOW79e+3ZXwnKO7FDREHnzZZ60Qek+fGt8lxorHxOQejFQe/eynAmM2yUE3w5otKhp3
         KR9DaQN/v12gbLoxNpAGxEcgOXjRjWmd6Y08SNeldrFUe+m4kWHda12fR3XpL663Wf9c
         KSNJtGJ3WPRDrPTUDSX5eMM0EhAsEd8565uMlzzi9/z4rvBfVeDlxqGn6scNZ7obUvh8
         KfADt2egn6O8f2/Ee/tgZtC5kjiJjzWmizwT5lFa5/DjzLudduc/l0Bdzvh32YHQ/mzr
         nTVw==
X-Gm-Message-State: AOAM533NKG0Z05aFOa/yGAtYF4HfJ2s+3y8t9qF+BfdiGSFCUbMtt9Bd
        GQd/ySF42eBKmGBRA4bdoqZQKZcrk5FasA==
X-Google-Smtp-Source: ABdhPJyKt7QNzfaAYcZqyB/YhIzlcvIdBAHUJwkhTRL7dv7jBjsazb8mhhIG00z6rNXJF8+a9tKH8Q==
X-Received: by 2002:a1c:7f97:: with SMTP id a145mr16412390wmd.160.1602596394516;
        Tue, 13 Oct 2020 06:39:54 -0700 (PDT)
Received: from localhost.localdomain ([82.213.198.222])
        by smtp.gmail.com with ESMTPSA id n2sm28861767wrt.82.2020.10.13.06.39.53
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 06:39:53 -0700 (PDT)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Subject: [RESEND][PATCH] keys: Update comment for restrict_link_by_key_or_keyring_chain
Date:   Tue, 13 Oct 2020 15:39:39 +0200
Message-Id: <20201013133939.1182462-2-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201013133939.1182462-1-andrew.zaborowski@intel.com>
References: <20201013133939.1182462-1-andrew.zaborowski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

