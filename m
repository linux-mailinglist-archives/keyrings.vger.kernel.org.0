Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1875C25F8A4
	for <lists+keyrings@lfdr.de>; Mon,  7 Sep 2020 12:40:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728706AbgIGKki (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 7 Sep 2020 06:40:38 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34987 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728424AbgIGKjr (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 7 Sep 2020 06:39:47 -0400
Received: by mail-wm1-f67.google.com with SMTP id y15so1092980wmi.0
        for <keyrings@vger.kernel.org>; Mon, 07 Sep 2020 03:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ggDDYKqZEVjP47BfqE04dYFHPS0oX31wLempv+/K9N8=;
        b=XhOv3Y7hRE6WvlPabHJUmuvex0xABEL47OSxutBrYc5nbyTifu46d2nCw9x9xEnF/d
         E/yEBQQPHvpWSfFcP74IUqea9GzcN1otL/p2T5aZ6dIfgrPFtn/swVwJYB2bNVttAbP3
         h+z5JUGGdSNXW+HZ9Z1wJAqSLIZ7kWhYI/gjAUR7732e9rAgitXtY3UCFYpJNCl171O0
         urM24MBuJSNWC8Z22uReXU90lnFDulOezIDySoKcNNKh9oLbhDiJcLfj5HUsU/syBTd+
         zfs1STmd1kNqt6N5c1SrAb3a/LzZjSldkBWMRJiHYSZzpVebr9eIcYfd1GiEtz3WgcOu
         HN4g==
X-Gm-Message-State: AOAM531YwM1NRbRqfBMAWUXCfwqP34yIco8wBRGKMKQo+epm9+Ohll7F
        xzSkn6/UUHf3yGeMR+iybxkpKPu20bPm2g==
X-Google-Smtp-Source: ABdhPJx438KKMIm6shn4TVfgVT+0kuH9k/dxH/1xc/mZqzntlelrsRiC1SFYg7vFWWfQepxVvxwJ8w==
X-Received: by 2002:a1c:9c0b:: with SMTP id f11mr19597587wme.0.1599475185696;
        Mon, 07 Sep 2020 03:39:45 -0700 (PDT)
Received: from localhost.localdomain ([82.213.220.217])
        by smtp.gmail.com with ESMTPSA id 128sm26178030wmz.43.2020.09.07.03.39.44
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 03:39:45 -0700 (PDT)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Subject: [RESEND][PATCH] keys: Handle missing Authority Key Identifier X509 extension
Date:   Mon,  7 Sep 2020 12:39:35 +0200
Message-Id: <20200907103936.263810-1-andrew.zaborowski@intel.com>
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

