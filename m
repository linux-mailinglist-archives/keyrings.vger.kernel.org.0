Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A46CB1C34F3
	for <lists+keyrings@lfdr.de>; Mon,  4 May 2020 10:52:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgEDIwd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 4 May 2020 04:52:33 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:43739 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbgEDIwd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 4 May 2020 04:52:33 -0400
Received: by mail-wr1-f65.google.com with SMTP id i10so19894050wrv.10
        for <keyrings@vger.kernel.org>; Mon, 04 May 2020 01:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ggDDYKqZEVjP47BfqE04dYFHPS0oX31wLempv+/K9N8=;
        b=RGOgg7VobfR9ti01Nk6xK48FTRGd6Gby1Hb3UcM2CiWZ0tAREZUoFAiHQ2sq8NUh/M
         sGajDTR+OqHN+9Yq/eOz/17Q4biaGKGodevtmpb8RHVjYd7jKTckZBrjDXyVuIVCy8D8
         vTN2emgI435g90ZIgknJGeAqUrpToB3eNQWo0QM7IH6xrLSU9vWR06p7GoA1UnbvNZhb
         oco4q5jODmx930IMzBmYOhOlcjCavwJ9UQ/JwWQ4pNv29/0XFh2kvKDUjyf1ubjbAMOZ
         J8d6fqPM3TBOLEL/UVK3tZRxSKz4nZ3hKvBDH868Q3kxl0DLcdB659TDWqc6MS88iacg
         CTMA==
X-Gm-Message-State: AGi0PubW+w1IWarwU77drWnKrqOMvgBghTa5g3fRyH+/bDrwqBmDBInP
        MyH6dgUOlDvzRwWboSJ76SR9Jrds26M=
X-Google-Smtp-Source: APiQypLjdNKQMF7VWIIXCyo66+zWdvjLQoKWDjWvabA8YMHyeUdj0YlgRgKhoYG/U24XgUJ7aE82Og==
X-Received: by 2002:adf:f48a:: with SMTP id l10mr17213207wro.231.1588582320894;
        Mon, 04 May 2020 01:52:00 -0700 (PDT)
Received: from localhost.localdomain ([46.6.4.150])
        by smtp.gmail.com with ESMTPSA id i1sm17058550wrx.22.2020.05.04.01.51.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2020 01:52:00 -0700 (PDT)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>
Subject: [RESEND][PATCH] keys: Handle missing Authority Key Identifier X509 extension
Date:   Mon,  4 May 2020 10:51:53 +0200
Message-Id: <20200504085153.127903-1-andrew.zaborowski@intel.com>
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

