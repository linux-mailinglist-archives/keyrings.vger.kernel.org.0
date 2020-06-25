Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1581F20A802
	for <lists+keyrings@lfdr.de>; Fri, 26 Jun 2020 00:11:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbgFYWLU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 25 Jun 2020 18:11:20 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:35427 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406185AbgFYWLU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 25 Jun 2020 18:11:20 -0400
Received: by mail-wr1-f67.google.com with SMTP id g18so7507068wrm.2
        for <keyrings@vger.kernel.org>; Thu, 25 Jun 2020 15:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YsZNBDHt502uQNfqBAPLlhPWF3Q26FjHG7KwkPDxKY4=;
        b=Ag4ulPIDEj1UDXtzyFh9ylRFmdB9eLOt3lC+0w9ruATECsOkEeqa0IbGWShcb4nGlK
         BsE67hsJa7fRnTeUv/s5KsMzfcbCkfcufhffp2w+pa0f2sZyV+xJ83jzpwTkxniFsgcz
         K8HTS5/p3z38IyLIXOuwQRdJXpYcJBCj/64nztvze7ZT5ZKx0QiSbsaGtsVV7hkIlaZS
         vgrjJpa5UEAo1Q9flQKMrXZ0y+wxTk1vp0QiBRp7SPWXl0vjTBORjXKLWJBEjLLrdzhJ
         B5AudQZEYpq/pGImhF1G0vfmUXVqBJd9v7x0pPMK3OC50TTbsbC/78Rq2NgtOf4XmsPn
         Kwqw==
X-Gm-Message-State: AOAM533bJnQfCNmal09d48U7D3Qa969RoMwHFsPYUNLUgqFj1ONGSxn5
        nQSQEIDazTx6I6wqywnh4DtpQy+9hiM=
X-Google-Smtp-Source: ABdhPJx+Ffvu5GsEfgcgbFPYP886ZLfuMbely31TrRH0ccrONgyhbYgdzUd+xQzGZpQrmITKDZ1B7w==
X-Received: by 2002:adf:eec8:: with SMTP id a8mr326583wrp.421.1593123078302;
        Thu, 25 Jun 2020 15:11:18 -0700 (PDT)
Received: from localhost.localdomain ([82.213.205.53])
        by smtp.gmail.com with ESMTPSA id b184sm8161173wmc.20.2020.06.25.15.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 15:11:17 -0700 (PDT)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>
Subject: [RESEND][PATCH] keys: Update comment for restrict_link_by_key_or_keyring_chain
Date:   Fri, 26 Jun 2020 00:10:53 +0200
Message-Id: <20200625221053.165938-2-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200625221053.165938-1-andrew.zaborowski@intel.com>
References: <20200625221053.165938-1-andrew.zaborowski@intel.com>
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

