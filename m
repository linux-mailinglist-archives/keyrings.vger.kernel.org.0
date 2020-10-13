Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B7A428CF4A
	for <lists+keyrings@lfdr.de>; Tue, 13 Oct 2020 15:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728905AbgJMNjz (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 13 Oct 2020 09:39:55 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36215 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728812AbgJMNjz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 13 Oct 2020 09:39:55 -0400
Received: by mail-wr1-f66.google.com with SMTP id x7so15495297wrl.3
        for <keyrings@vger.kernel.org>; Tue, 13 Oct 2020 06:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ggDDYKqZEVjP47BfqE04dYFHPS0oX31wLempv+/K9N8=;
        b=NBz5wocp2lm81i+ENmi+zbRcK1DuBHbNTEgNWi2G0yoQ86giyLai+JRVeCaNoHA/qv
         MlnqlWQWB55imwCilSOARwLolxM9SZUmB4x+ovgKZE4ad2Y3lvofiWtkFXbfwAUdfgnF
         Q3ZmEAI55AvCcDUssledyZ9J1KvSQ4SaFI0867Ll9XwCr5gTC2zNfg2KwnaYRj7cdLeG
         hfFdBk1iohETC8xIg94LDqLjJLrxFk6E4tVkRGZnRo7gBS3vF0kNxxm40Rvr81BH2My4
         zuh1qV/rIRst5U6/EXQrzS0P0j6zFDLO68ffPI07A40uvSvUh55Lr2123gnt2pRTlJNM
         NR+w==
X-Gm-Message-State: AOAM533YaX1iCp9Uea13u2SEG/ecYWcRHp85bRncbioR1p70cV/0zHoT
        3UTbYCUoP3lKl6cQab/L2N3w/gw9yaW+Dg==
X-Google-Smtp-Source: ABdhPJwS5NZ+rSqQqY5KKFgDOobbz2CDUfPylAXjCnN+umck5eVSNJqAKcWorsweXYKmxgMdZXLlwA==
X-Received: by 2002:adf:c00b:: with SMTP id z11mr23277800wre.320.1602596393255;
        Tue, 13 Oct 2020 06:39:53 -0700 (PDT)
Received: from localhost.localdomain ([82.213.198.222])
        by smtp.gmail.com with ESMTPSA id n2sm28861767wrt.82.2020.10.13.06.39.52
        for <keyrings@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 06:39:52 -0700 (PDT)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Subject: [RESEND][PATCH] keys: Handle missing Authority Key Identifier X509 extension
Date:   Tue, 13 Oct 2020 15:39:38 +0200
Message-Id: <20201013133939.1182462-1-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

