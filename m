Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAB322CDE71
	for <lists+keyrings@lfdr.de>; Thu,  3 Dec 2020 20:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729124AbgLCTFZ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 3 Dec 2020 14:05:25 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47]:35678 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726142AbgLCTFZ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 3 Dec 2020 14:05:25 -0500
Received: by mail-wr1-f47.google.com with SMTP id r3so2991217wrt.2
        for <keyrings@vger.kernel.org>; Thu, 03 Dec 2020 11:05:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5YadX0VnVdpMz++TTCsuhYT1LU32Pp6dnNCMT2ZiJZU=;
        b=LISi1OHyzFRtChj3elxE0yCOzFKbCtTuRuJV0KJilMiQzaOJPqs3VOmMsFBafN38xa
         USjYP6AYb2/J98/T6hlM5nbvZrivnpsqAa8lwcIrsFnUTtLu5ixHFufZlHRUOLwGKa8h
         y2HEBP+8eKi8hfULbMuRJxqt7ok8u3p//sz3cv253fba5PR9CTZv7F65/OZ3tF4yyXJ0
         hz+ZmckQ2zf6mUHKiqVOYGKxk8Dq7W9nVxVTQC9FSoR9NqEfOaHHWNDjCM0falNN6p97
         In5rx1cMo0dr6gkC4g0F6ByptYBtYtRN7kCGRYqiFEWDx00pk2rlMzktiSBy7xk4Ys8d
         wJUA==
X-Gm-Message-State: AOAM530O8DWX02ioIo+2CtaU5jWwKQjlKEFBWdjVJ0TAwWoMU5EzrbG4
        +yRgQB+5DyUESe92OO+0g2UzlF9v2MiiRw==
X-Google-Smtp-Source: ABdhPJy3kcL0rypxLuOgbO1hPp3yZUN+qvPq8NT8EZ2lDO5ScQfHJvcdBI/9PofeyZAi0ePwvoXQog==
X-Received: by 2002:adf:8143:: with SMTP id 61mr679298wrm.318.1607022277112;
        Thu, 03 Dec 2020 11:04:37 -0800 (PST)
Received: from localhost.localdomain ([82.213.215.165])
        by smtp.gmail.com with ESMTPSA id x25sm327540wmc.3.2020.12.03.11.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 11:04:36 -0800 (PST)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>
Subject: [PATCH][RESEND] keys: Handle missing Authority Key Identifier X509 extension
Date:   Thu,  3 Dec 2020 20:04:19 +0100
Message-Id: <20201203190420.105681-1-andrew.zaborowski@intel.com>
X-Mailer: git-send-email 2.27.0
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
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
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

