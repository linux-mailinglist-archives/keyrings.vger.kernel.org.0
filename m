Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16EC11A03AD
	for <lists+keyrings@lfdr.de>; Tue,  7 Apr 2020 02:24:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgDGAYt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 6 Apr 2020 20:24:49 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38189 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbgDGAYt (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 6 Apr 2020 20:24:49 -0400
Received: by mail-wr1-f66.google.com with SMTP id 31so1814090wre.5
        for <keyrings@vger.kernel.org>; Mon, 06 Apr 2020 17:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ggDDYKqZEVjP47BfqE04dYFHPS0oX31wLempv+/K9N8=;
        b=cjSxfwbD27RDWJ9H0CrNw4zcmigjdrQBmVwisU9q7tXF04zNaaRGxWojKJui9wZ/Pj
         7vfmk4HiZ0z463A2u3UhkT0fOsPZq34+WtCsX6f0bkBYLkQ4yikQE9DRO72P1NGOWLuZ
         OMgfMegVhu4KuoUxM4jeLcnka8Whg8s4Rb5rykxGgDQsxSj8lmCa8r81SGjlcpbrygJC
         InXw7DRYsot1JxeYX6viJjEdRBvl3VfQd5EEdp/DRuBEm56NzKclHmZOzyu+YG9R8T8f
         SuPV+9dUMR35Tjq4l0Oy4vr+p/p1nRHAxK08lysB3KlferqOlPbn+S3ILc5vY2z621vb
         ocKw==
X-Gm-Message-State: AGi0PuYPJiY8C30JrEsIs2XWBYbgcn+KWDfwNj9B84JTw7s23ojy/Qf5
        Apm19HfUroO/fw2mCzFB7kP4/2tl
X-Google-Smtp-Source: APiQypJOR+ctMYsEJoAHwP79MmEZ3SXv8WziIkmet9h8CmRfcekTFFx9SruzoTDxLh0uLvdtQKgX+Q==
X-Received: by 2002:adf:a55b:: with SMTP id j27mr1838029wrb.418.1586219087584;
        Mon, 06 Apr 2020 17:24:47 -0700 (PDT)
Received: from localhost.localdomain ([185.79.22.180])
        by smtp.gmail.com with ESMTPSA id j10sm11592851wru.85.2020.04.06.17.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 17:24:46 -0700 (PDT)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>
Subject: [RESEND][PATCH] keys: Handle missing Authority Key Identifier X509 extension
Date:   Tue,  7 Apr 2020 02:25:26 +0200
Message-Id: <20200407002526.25135-1-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

In a self-signed certificate the subject and issuer are the same and so
the Authority Key Identifier X.509 v3 extension is explicitly made
optional in RFC5280 section 4.2.1.1.
crypto/asymmetric_keys/x509_cert_parser.c can't handle this and makes
(at least) the restrict.c functions refuse to work with certificates
that don't include the AKID.  Fix this by filling in the missing
cert->sig->auth_ids with the certificate's own IDs after parsing and
determinig the certificate is self-signed.

The asymmetric_key_generate_id return value is not checked because it's
already succeeded once at this point.

There are root X.509 v3 certificates in use where this is the case,
mostly oldish ones.

Signed-off-by: Andrew Zaborowski <andrew.zaborowski@intel.com>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 26ec20ef489..a5a2f93e242 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -136,6 +136,25 @@ struct x509_certificate *x509_cert_parse(const void *data, size_t datalen)
 	if (ret < 0)
 		goto error_decode;
 
+	if (cert->self_signed) {
+		if (!cert->sig->auth_ids[0]) {
+			/* Duplicate cert->id */
+			kid = asymmetric_key_generate_id(cert->raw_serial,
+							 cert->raw_serial_size,
+							 cert->raw_issuer,
+							 cert->raw_issuer_size);
+			cert->sig->auth_ids[0] = kid;
+		}
+
+		if (!cert->sig->auth_ids[1] && cert->skid) {
+			/* Duplicate cert->skid */
+			kid = asymmetric_key_generate_id(cert->raw_skid,
+							 cert->raw_skid_size,
+							 "", 0);
+			cert->sig->auth_ids[1] = kid;
+		}
+	}
+
 	kfree(ctx);
 	return cert;
 
-- 
2.20.1

