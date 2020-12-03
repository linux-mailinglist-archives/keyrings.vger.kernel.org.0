Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E7922CDE72
	for <lists+keyrings@lfdr.de>; Thu,  3 Dec 2020 20:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgLCTF0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 3 Dec 2020 14:05:26 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:37324 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728381AbgLCTF0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 3 Dec 2020 14:05:26 -0500
Received: by mail-wr1-f43.google.com with SMTP id i2so2994787wrs.4
        for <keyrings@vger.kernel.org>; Thu, 03 Dec 2020 11:05:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yo2De2Pk0T/ha9hsXodD8WV8ytF7ugRHa6ZAnUm2dXY=;
        b=t2zip4jUIJs4IGrlgWJgm6Gn6HXLeEOhhKuys9tKgvg4f/lIFRM0h9z0f7tpLA1buE
         CHeM8rWDFOtjgJcT9oDlal5YhyVimNpwhItaumTKtfkgXN+9kbM/H163BwYrQyGYaoWr
         ycmTcR+fLNY+K3Y2DqQD8AQE5FaIXZQREmVB1f76L7ED0Gu4Yu16Iz81kDp5LfWhqbdt
         H+D9xL8dOjshCESQcVIXSH5Lp77KDGkgi8G7M6Zytfrr/7Uavsr1f4Jkalgz2jBSvapN
         wBm3OYVf8vy0HE1YJevZI0yz9XYQllZC3E86c5bFNExWQVEH8lvqoUScMfAWbpGyCz93
         tR1Q==
X-Gm-Message-State: AOAM530dffTnDqd6FX56robQcVStS3/QO8rxJd5tC7eraEsFJxJxEDh3
        unUI0hXV8qaLoHezxdnhwBlznqq/qRyPPQ==
X-Google-Smtp-Source: ABdhPJyQo1IAHPhNsS0yhPXttl3q+PMGIpbs9AV1SK8vtNvq6kimqiOq66gE/87nlFb+kKyg3d9sVg==
X-Received: by 2002:a5d:688b:: with SMTP id h11mr640542wru.417.1607022278111;
        Thu, 03 Dec 2020 11:04:38 -0800 (PST)
Received: from localhost.localdomain ([82.213.215.165])
        by smtp.gmail.com with ESMTPSA id x25sm327540wmc.3.2020.12.03.11.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 11:04:37 -0800 (PST)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>
Subject: [PATCH][RESEND] keys: Update comment for restrict_link_by_key_or_keyring_chain
Date:   Thu,  3 Dec 2020 20:04:20 +0100
Message-Id: <20201203190420.105681-2-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201203190420.105681-1-andrew.zaborowski@intel.com>
References: <20201203190420.105681-1-andrew.zaborowski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Add the bit of information that makes
restrict_link_by_key_or_keyring_chain different from
restrict_link_by_key_or_keyring to the inline docs comment.

Signed-off-by: Andrew Zaborowski <andrew.zaborowski@intel.com>
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
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

