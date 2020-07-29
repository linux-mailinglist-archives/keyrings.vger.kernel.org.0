Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7A323285E
	for <lists+keyrings@lfdr.de>; Thu, 30 Jul 2020 01:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgG2XuM (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 29 Jul 2020 19:50:12 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:35014 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726876AbgG2XuM (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 29 Jul 2020 19:50:12 -0400
Received: by mail-ed1-f68.google.com with SMTP id m20so9165488eds.2
        for <keyrings@vger.kernel.org>; Wed, 29 Jul 2020 16:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ggDDYKqZEVjP47BfqE04dYFHPS0oX31wLempv+/K9N8=;
        b=h2qizklgP0ke9JIhQWyxX8aWklPRo1bf2Du6Em8Cvp9xwl26t1CmzhMPAV+kesh+op
         SVOP0qiFLQZY8l7r4fB7tN6RJjtW4HuBAmqi1vH2s3srOHiJcOnoAP+aqTuOaHZQtknk
         ex96XGsPrWwyrw/hkj+XrTF6RmAIbGhY9k6tb00x5dnvhdTMXa1LZgOzLbs7ZyQxvXQX
         EzFufBCbYm0q22HPmDyRdsKcemdMGaj7V1KHJJuJz/7Lftn56IuYEWzKM0WEAG4EUh9r
         bJYSxZMnN05hbRiTVXA96g8VJhbqiguYP3RpmZNn/8zthtAPTBWmVDOLVKw6XIRE+YJu
         n43Q==
X-Gm-Message-State: AOAM531bdqz36s19BHuHWYSMYBwgzzAShM4At4T6o5yMacKehmcK8U94
        HPnUvk5saQ76PbstiuWKXt18IJp62aU=
X-Google-Smtp-Source: ABdhPJxo1yYypPxIxoiYLrFfw1ka1FzKe219gh6FzQmGkvoft8Kjtx2LJUMMP/r1XGc9DJ5ocbhNUg==
X-Received: by 2002:a05:6402:1057:: with SMTP id e23mr199585edu.11.1596066610051;
        Wed, 29 Jul 2020 16:50:10 -0700 (PDT)
Received: from localhost.localdomain (83.5.235.18.ipv4.supernova.orange.pl. [83.5.235.18])
        by smtp.gmail.com with ESMTPSA id v9sm3214767ejd.102.2020.07.29.16.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 16:50:08 -0700 (PDT)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>
Subject: [RESEND][PATCH] keys: Handle missing Authority Key Identifier X509 extension
Date:   Thu, 30 Jul 2020 01:49:59 +0200
Message-Id: <20200729235000.45250-1-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.25.1
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

