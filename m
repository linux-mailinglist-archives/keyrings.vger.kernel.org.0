Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E0620A801
	for <lists+keyrings@lfdr.de>; Fri, 26 Jun 2020 00:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406307AbgFYWLU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 25 Jun 2020 18:11:20 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:40417 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728541AbgFYWLT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 25 Jun 2020 18:11:19 -0400
Received: by mail-wr1-f66.google.com with SMTP id h5so7468985wrc.7
        for <keyrings@vger.kernel.org>; Thu, 25 Jun 2020 15:11:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ggDDYKqZEVjP47BfqE04dYFHPS0oX31wLempv+/K9N8=;
        b=WKD1BWGvtHWM82vPxP+8Sd6RrATXfJvIPGY5vCZMvNKe44pCBJooHBB4Pdwpocm8T4
         pUWaUlM08sFv2GWOes68fxpQZtN3uH/XJDvk4xiIFmxkNm7rFaCK8DmdaSHTp9W1wZMa
         G1tAS6iAEWToE1D4T+PRm4YYxGqlrXWZx1+9fK4U4MoBFkk6ja/ekti1HCAAnVDk4uEJ
         8o5TZjw72bWTSbl7gWG6lUZ0ErfX+WcEQp8qdHysaoBS2r9GIg3JAfUE6tBvL63t/8AC
         TiMBi5+x/j6IBG3O6bHMlrxwBSuM+4/45LRwMSrFJT5g8ytXfaTsdjQqfCAFkwlwwEAK
         mqdA==
X-Gm-Message-State: AOAM533gC+l7S+rTAGaK2kGg4uvZQKD92YO9McF3Lyby09dkZL9gtXUm
        TA5Z9WnkejlJlvk9+/CUP3RywHfWNCU=
X-Google-Smtp-Source: ABdhPJxV2TWl7ihLOwKaVXkjDKop86PbFPs9Bu48bNOWHADXp1/3mNGRUTuVzpEesTcDJz6uJP1PKA==
X-Received: by 2002:a5d:6912:: with SMTP id t18mr322157wru.411.1593123077364;
        Thu, 25 Jun 2020 15:11:17 -0700 (PDT)
Received: from localhost.localdomain ([82.213.205.53])
        by smtp.gmail.com with ESMTPSA id b184sm8161173wmc.20.2020.06.25.15.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 15:11:16 -0700 (PDT)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>
Subject: [RESEND][PATCH] keys: Handle missing Authority Key Identifier X509 extension
Date:   Fri, 26 Jun 2020 00:10:52 +0200
Message-Id: <20200625221053.165938-1-andrew.zaborowski@intel.com>
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

