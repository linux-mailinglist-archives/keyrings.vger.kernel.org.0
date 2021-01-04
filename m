Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C3032E9B34
	for <lists+keyrings@lfdr.de>; Mon,  4 Jan 2021 17:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727535AbhADQlh (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 4 Jan 2021 11:41:37 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:33540 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727623AbhADQlh (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 4 Jan 2021 11:41:37 -0500
Received: by mail-wr1-f43.google.com with SMTP id t30so32858117wrb.0
        for <keyrings@vger.kernel.org>; Mon, 04 Jan 2021 08:41:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yo2De2Pk0T/ha9hsXodD8WV8ytF7ugRHa6ZAnUm2dXY=;
        b=VJ/ahTIADEwbwdaws/mnCi1MPuvjUMqrrc2b+WVBdpweLQ9upwDX9RGkqStjQWdeV4
         3ezuErwRhHllNM8DMN9TjbHqjVlG/nUHYHLouKMntIIXkhFUvtBMFEoemfAFZkFwjJX9
         uQeTIjG0XllTev6kzMh+3Yfde/6Su6RaYwc3lEoHqSsHfKAZ1zL+x9AEgk/U1yAcLtOq
         RhXxJyJffiVRNfKK7CTpFNof9q+hMZbiCGG/xzRolfAl0WQUg4yn3e7MkXXsF2HyKvlJ
         /3GnSEQjZYW1ek7oE1GFI7k5fn5HSi5qSUtbXQAobHzpLLMYVCiGBwWhmcU4Tn9y85M0
         CObg==
X-Gm-Message-State: AOAM533mbtjdBnMMpB7mrDtmFGaIAM1Uybc27+V6vC1HpPuWtkiaC0db
        q4qmb9H+M8onI/Vtd9X4aRl+eAdIMoQE3A==
X-Google-Smtp-Source: ABdhPJwmmCvwagcjQKxC/eweuhQUUVaqgg/xPfvOHK4m5YI0tWvw2EeQ/o46niwceXrWkjyHAbuO9w==
X-Received: by 2002:adf:80ae:: with SMTP id 43mr81324758wrl.50.1609778454798;
        Mon, 04 Jan 2021 08:40:54 -0800 (PST)
Received: from localhost.localdomain ([82.213.213.214])
        by smtp.gmail.com with ESMTPSA id s20sm33810524wmj.46.2021.01.04.08.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 08:40:54 -0800 (PST)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>
Subject: [PATCH][RESEND] keys: Update comment for restrict_link_by_key_or_keyring_chain
Date:   Mon,  4 Jan 2021 17:40:48 +0100
Message-Id: <20210104164048.1378237-2-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210104164048.1378237-1-andrew.zaborowski@intel.com>
References: <20210104164048.1378237-1-andrew.zaborowski@intel.com>
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

