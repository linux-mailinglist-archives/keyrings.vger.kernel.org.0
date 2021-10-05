Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B24422DBB
	for <lists+keyrings@lfdr.de>; Tue,  5 Oct 2021 18:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236107AbhJEQUb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 5 Oct 2021 12:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235121AbhJEQUb (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 5 Oct 2021 12:20:31 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F97C06174E
        for <keyrings@vger.kernel.org>; Tue,  5 Oct 2021 09:18:40 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id e12so18076934wra.4
        for <keyrings@vger.kernel.org>; Tue, 05 Oct 2021 09:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OrrCwF+kFDwdSmZPhicXDostoj2EDmJYm/81LXTAGoo=;
        b=YftOWF02yixWsn3Yl1W6mpcPerRe4dd8jeS9FCkxUkNWPrbhB/euRl6FScWNY/dGev
         o1JJ719GC73YAY0DqKgriMkB7oCVW04HMvef2cw3s+ypCFusqgY7AWtb+vfLdoZBXxqK
         qep+P/7D8LbXifiLFatuclXXsj0GDtk/Qa4f7imwP+sHDHhsNiw83v/enwZiWskToBgQ
         tbNxfkpILuapgxwU50MiqwddyJBjfdvY577c6oMmKtdEl6Dr3Vh1lQMqwdm5AOJmDlh7
         NPZLIQTYs+VdcEjUAENpR++AfgCGl5wL5TNIUlIBCH94TtQJAYV+G3FfuL7KTdCziWkG
         Pr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OrrCwF+kFDwdSmZPhicXDostoj2EDmJYm/81LXTAGoo=;
        b=qvIdfqKNYr5bNa2uuNa05vD+vh31yQTE3DX70gHdZ/Mc+H+ppBfTJAKkIxWBU7UAyp
         0VenYbKm5/tMrsvFLYr2iHTE1p3QnHfEb1ZFKK0z0TT5NY/KInAK6O0gdlsG+Ongxa75
         x5+cgDBj0nCL76a9cup2IbEPxTxq0fvvYw0gFSLAlBtfzBwXBDZLEVMCMFeyAd0gB9XV
         GoqQz+yutlxz3/cZJyVvb+geFf6YdfdlwLkxHoBZ+852hVBnkd00J9GrPTULAsAj+S8o
         sQdb0ghbrH0/15iKnsay5U5HLGAzNYVaAQsFwAJxPh3ynaLm0rZOayrn/H3w5NO0QDD6
         gowA==
X-Gm-Message-State: AOAM530xn0hj6HW1e7heCjjTmhpUx+iB16TTAXi2HAe1euRuaTaQ9+Ug
        2RFoJtMuIbSCgGhuS974we3M5g==
X-Google-Smtp-Source: ABdhPJxA8BzIyDtOmWl4mpjPd6cuGv3bvxOhIM2mTMdx+M2wrXsEa/gha5ZRsdZ/5E8C6F4x9bfw9A==
X-Received: by 2002:adf:f789:: with SMTP id q9mr22714087wrp.367.1633450718739;
        Tue, 05 Oct 2021 09:18:38 -0700 (PDT)
Received: from localhost.localdomain ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id x17sm18188856wrc.51.2021.10.05.09.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 09:18:38 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>,
        keyrings@vger.kernel.org, Adam Langley <agl@google.com>
Subject: [PATCH 1/1] sign-file: Use OpenSSL provided define to compile out deprecated APIs
Date:   Tue,  5 Oct 2021 17:18:33 +0100
Message-Id: <20211005161833.1522737-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

OpenSSL's ENGINE API is deprecated in OpenSSL v3.0.

Use OPENSSL_NO_ENGINE to disallow its use and fall back on the BIO API.

Cc: David Howells <dhowells@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: keyrings@vger.kernel.org
Co-developed-by: Adam Langley <agl@google.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
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

