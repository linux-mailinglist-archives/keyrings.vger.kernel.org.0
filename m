Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44DE1423A3B
	for <lists+keyrings@lfdr.de>; Wed,  6 Oct 2021 11:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237825AbhJFJLS (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 6 Oct 2021 05:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237802AbhJFJLR (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 6 Oct 2021 05:11:17 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D22DFC061753
        for <keyrings@vger.kernel.org>; Wed,  6 Oct 2021 02:09:25 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id e12so6657190wra.4
        for <keyrings@vger.kernel.org>; Wed, 06 Oct 2021 02:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=csR6A8vW7LAM5xuIRFxEwV04L/3/J9wibUdHzd6JNRQ=;
        b=ysO329v1nIklUPSztGKWRUD3su0uWJlFNrRv/HreKcKUl2CNLoOXY48uq7r1dEtx2y
         /wrupIjwmigyrTvXcVgLK2/3qgw7k76SVE/paYfQEWHBHVlbSLQ3NuGhQSaEMcsYmGrk
         cDUgHSk94386abxEmoAxYTOIftfOAC7X5efx2P6JOoGM0g1nI1L3BpXy3j1rsCJ2Afjh
         UkmKFsDw1b6hDke2h7kL/YBX1hhBG91lclxYXE4HwEJc60SKIrc5Lxg/kNhr8GkZFopM
         czlURaozcMRfcmcLVWMIjuCMSZao+3OXV2yJwV0WC+OdLx0a8x3HZJbzouI+nstHRY+E
         NINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=csR6A8vW7LAM5xuIRFxEwV04L/3/J9wibUdHzd6JNRQ=;
        b=pxerD59vIaYtJ1lOuzqXvU2g6XtYz5dKxLoGcs4df6TLOcR207GIZkrnOvKrh8DG8U
         jvp/ZvHa33RVrakRqsgVJ4Qz2G63VZD1hAPWdH0BAvlh84+i7OlpfQmHkVdGrmHWiPXC
         0ZwYtZXwhNClUwOW+IT39WgngYWTzC3j2ag2oHjHN7vfMcvsICsCueT1/xiv8ON3qdq5
         y6pdp4Az01Xxur1Es6gV5iq7/ZPF/z5sTTntclmx5ujuwvIfB1rVn5SOuoXUZZvS+0lv
         BzIUdqNVO7blpZkl6t9QDvWuTrs8uKUPc862ywPzNi+sUqhClwxvaEPE+2he9kG8Zp2k
         beCA==
X-Gm-Message-State: AOAM530Snys5Pru0VrBNSgRMZLE5NoLodV2QxEeHYACO+p9OPFqy/Reh
        GCAFRVGNVavqjp5AD4RKvZe0dQ==
X-Google-Smtp-Source: ABdhPJzk8JFep9qIeZS6xhfaqIfPBSlaL7jX8al+dZUSJpI9WrY8h7BnlwSbXDxXkGY7pEdJYR5VKg==
X-Received: by 2002:a05:600c:3588:: with SMTP id p8mr8262210wmq.168.1633511364142;
        Wed, 06 Oct 2021 02:09:24 -0700 (PDT)
Received: from localhost.localdomain ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id f1sm22429341wri.43.2021.10.06.02.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 02:09:23 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Eric Biggers <ebiggers@kernel.org>, keyrings@vger.kernel.org,
        Adam Langley <agl@google.com>
Subject: [PATCH v2 1/1] sign-file: Use OpenSSL provided define to compile out missing (deprecated) APIs
Date:   Wed,  6 Oct 2021 10:09:20 +0100
Message-Id: <20211006090920.1662056-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

OpenSSL's ENGINE API is deprecated in OpenSSL v3.0.

Use OPENSSL_NO_ENGINE to ensure the ENGINE API is only used if it is
present.  This will safeguard against compile errors when using SSL
implementations which lack support for this deprecated API.

>>> referenced by sign-file.c
>>>               /tmp/sign-file-370a2f.o:(main)

error: undefined symbol: ENGINE_init
>>> referenced by sign-file.c
>>>               /tmp/sign-file-370a2f.o:(main)

ld.lld: error: undefined symbol: ENGINE_ctrl_cmd_string
>>> referenced by sign-file.c
>>>               /tmp/sign-file-370a2f.o:(main)

ld.lld: error: undefined symbol: ENGINE_load_private_key
>>> referenced by sign-file.c
>>>               /tmp/sign-file-370a2f.o:(main)
  HDRINST usr/include/linux/virtio_i2c.h
make[1]: *** [/src/kernel/scripts/Makefile.host:95: scripts/sign-file] Error 1

Cc: David Howells <dhowells@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Eric Biggers <ebiggers@kernel.org>
Cc: keyrings@vger.kernel.org
Co-developed-by: Adam Langley <agl@google.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---

v1 => v2:
 - Update commit message, as suggested-by Eric Biggers

 scripts/sign-file.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index fbd34b8e8f578..fa3fa59db6669 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -135,7 +135,9 @@ static int pem_pw_cb(char *buf, int len, int w, void *v)
 static EVP_PKEY *read_private_key(const char *private_key_name)
 {
 	EVP_PKEY *private_key;
+	BIO *b;
 
+#ifndef OPENSSL_NO_ENGINE
 	if (!strncmp(private_key_name, "pkcs11:", 7)) {
 		ENGINE *e;
 
@@ -153,17 +155,16 @@ static EVP_PKEY *read_private_key(const char *private_key_name)
 		private_key = ENGINE_load_private_key(e, private_key_name,
 						      NULL, NULL);
 		ERR(!private_key, "%s", private_key_name);
-	} else {
-		BIO *b;
-
-		b = BIO_new_file(private_key_name, "rb");
-		ERR(!b, "%s", private_key_name);
-		private_key = PEM_read_bio_PrivateKey(b, NULL, pem_pw_cb,
-						      NULL);
-		ERR(!private_key, "%s", private_key_name);
-		BIO_free(b);
+		return private_key;
 	}
+#endif
 
+	b = BIO_new_file(private_key_name, "rb");
+	ERR(!b, "%s", private_key_name);
+	private_key = PEM_read_bio_PrivateKey(b, NULL, pem_pw_cb,
+					      NULL);
+	ERR(!private_key, "%s", private_key_name);
+	BIO_free(b);
 	return private_key;
 }
 
-- 
2.33.0.800.g4c38ced690-goog

