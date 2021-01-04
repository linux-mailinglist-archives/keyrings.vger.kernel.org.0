Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEEB2E9B33
	for <lists+keyrings@lfdr.de>; Mon,  4 Jan 2021 17:41:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbhADQlg (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 4 Jan 2021 11:41:36 -0500
Received: from mail-wm1-f50.google.com ([209.85.128.50]:52879 "EHLO
        mail-wm1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727535AbhADQlg (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 4 Jan 2021 11:41:36 -0500
Received: by mail-wm1-f50.google.com with SMTP id a6so19044801wmc.2
        for <keyrings@vger.kernel.org>; Mon, 04 Jan 2021 08:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5YadX0VnVdpMz++TTCsuhYT1LU32Pp6dnNCMT2ZiJZU=;
        b=mIQNGonEWmrPUU1+GSplLGA+V0Vtzr6zIC80Yufxi8NxEAFy7xaEbqLRpPknBxKZ+M
         0HfR3gPvaGMjk91vGcAluPfmVXzrWhaYFgo4+Co/2kx/SsU0waFSUygdkkZzsQFWqQLI
         DyMgnv/fAYkXCOxFuFEQwFnIUtq5Z31baJ6Hm8D135DZFaxE7DhzzOtH6zqnGsjQ23hq
         xG9BGr6oiQc/w7x+SIpQO3+iKwroYAcCIvWJf6FlYBbgR0VqY3ex1dVycLAlmXPeGMH4
         Ke6h3ii/nC1TUt/sOo2gbcu3orwAFVoGCifVV/mENl2q7KVt6MKD2xRgupnyetA7gAOU
         vSog==
X-Gm-Message-State: AOAM530wEWfBOyHoWA5DSGDc2MafiLKQoyUr+1S+PCPJop65PRHKAaY6
        eYbGsVROjnxW1o+x1I97cSeKvADawrZJ8w==
X-Google-Smtp-Source: ABdhPJyQwAblGuohHWNM+tO0uAsoMFbj01FNFs+y080MIwllx65jo2F4KC69bFFIRCelKrsK4j6ThA==
X-Received: by 2002:a7b:cd91:: with SMTP id y17mr27813446wmj.5.1609778453921;
        Mon, 04 Jan 2021 08:40:53 -0800 (PST)
Received: from localhost.localdomain ([82.213.213.214])
        by smtp.gmail.com with ESMTPSA id s20sm33810524wmj.46.2021.01.04.08.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 08:40:53 -0800 (PST)
From:   Andrew Zaborowski <andrew.zaborowski@intel.com>
To:     keyrings@vger.kernel.org
Cc:     David Howells <dhowells@redhat.com>
Subject: [PATCH][RESEND#15] keys: Handle missing Authority Key Identifier X509 extension
Date:   Mon,  4 Jan 2021 17:40:47 +0100
Message-Id: <20210104164048.1378237-1-andrew.zaborowski@intel.com>
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

