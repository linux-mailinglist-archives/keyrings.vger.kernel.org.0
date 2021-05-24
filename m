Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87ACF38DF20
	for <lists+keyrings@lfdr.de>; Mon, 24 May 2021 04:16:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232200AbhEXCR4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sun, 23 May 2021 22:17:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232181AbhEXCRz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Sun, 23 May 2021 22:17:55 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9776C061574;
        Sun, 23 May 2021 19:16:26 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id e15so7228434plh.1;
        Sun, 23 May 2021 19:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yT6CAnQjd1D49HHgiYY1r24DT674aBCTUWawwoMceAU=;
        b=e/Q/uFQU9E2sCnd5rs2wvbkMmgo9ak8GOQQySy8NchYMzNtJkJnSEm8iZkCf/5KWh7
         FbHSQjGeCjk1HxLBeCixsdnTkp4SvJNSXjzR/aN91S5T8DTmj2+4EJ/E/pDUk60JgIYb
         3zCB2qG07DBgMRkJOFOxGk/Q+L1GtvqHBp0rv87wsfMchhprFBVYPwUri1pH3k17GRcH
         tmLfmw+RaBmUQxzcGG2XxbUQqgPSDW7WlPJhdpPqQPJdBPhZoW1V4HM6OD2DH1JH15zC
         F53RNmaVVmiMaxQLI2cSFuhjLaaZjeU4pXGQSYk4QFLBK/V+Jkh2BQcVKlM7LTKFsDlu
         dfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yT6CAnQjd1D49HHgiYY1r24DT674aBCTUWawwoMceAU=;
        b=iuib8wb4JUGDScQcuDoYWd98cCzBWjZa2j+L3Wxz59KEEJ6Xc/TFMSzIAAsiFwuvli
         37w2LWNF1ZIdd3e6s3u0z9LRzNacn1d8vVnTBv/qK+QN7ee2zi1MZRsT4mRbN4tTsDIc
         87eSSTkgFavDz10e5jOHWL+VSQzJE+2QDNFMQAVGTyCoV1K2u37tZSJW7csP/YJaHhxS
         5KPcD7FdPkfSOlPAfJdGoSQiGi/hlmxEJH9ZBV2YM2+Mec5Q61i0gYZm34C3nFN8E+cN
         UqquxHEx3w98ULb2f8a885WJgHeyFpJ4Yj/sMfrgzOmir1WwvZ2p11mkYfvh/0b+p5LM
         009w==
X-Gm-Message-State: AOAM53259OCgsrFdehckno6YG4cGm1098C5pNHAZ1jBrlwoAjkDZpS+q
        gkuffhjx+bcF0FPkzwrKfHnEYV7Byjo=
X-Google-Smtp-Source: ABdhPJwnRgxNX8wM3Zf9NW0OJ3HR1hczibMQ69jXQF/gRFMfjUxLCCBuge+blklLtDr+MHDdrvPS7g==
X-Received: by 2002:a17:902:9342:b029:f0:cc10:3f with SMTP id g2-20020a1709029342b02900f0cc10003fmr23571228plp.72.1621822586321;
        Sun, 23 May 2021 19:16:26 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id h1sm9474960pfh.72.2021.05.23.19.16.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 May 2021 19:16:25 -0700 (PDT)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>,
        Varad Gautam <varad.gautam@suse.com>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: [PATCH v8,1/4] X.509: Add CodeSigning extended key usage parsing
Date:   Mon, 24 May 2021 10:15:37 +0800
Message-Id: <20210524021540.18736-2-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210524021540.18736-1-jlee@suse.com>
References: <20210524021540.18736-1-jlee@suse.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This patch adds the logic for parsing the CodeSign extended key usage
extension in X.509. The parsing result will be set to the eku flag
which is carried by public key. It can be used in the PKCS#7
verification.

Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 25 +++++++++++++++++++++++++
 include/crypto/public_key.h               |  1 +
 include/linux/oid_registry.h              |  5 +++++
 3 files changed, 31 insertions(+)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 6d003096b5bc..996db9419474 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -542,6 +542,8 @@ int x509_process_extension(void *context, size_t hdrlen,
 	struct x509_parse_context *ctx = context;
 	struct asymmetric_key_id *kid;
 	const unsigned char *v = value;
+	int i = 0;
+	enum OID oid;
 
 	pr_debug("Extension: %u\n", ctx->last_oid);
 
@@ -571,6 +573,29 @@ int x509_process_extension(void *context, size_t hdrlen,
 		return 0;
 	}
 
+	if (ctx->last_oid == OID_extKeyUsage) {
+		if (vlen < 2 ||
+		    v[0] != ((ASN1_UNIV << 6) | ASN1_CONS_BIT | ASN1_SEQ) ||
+		    v[1] != vlen - 2)
+			return -EBADMSG;
+		i += 2;
+
+		while (i < vlen) {
+			/* A 10 bytes EKU OID Octet blob =
+			 * ASN1_OID + size byte + 8 bytes OID */
+			if ((i + 10) > vlen || v[i] != ASN1_OID || v[i + 1] != 8)
+				return -EBADMSG;
+
+			oid = look_up_OID(v + i + 2, v[i + 1]);
+			if (oid == OID_codeSigning) {
+				ctx->cert->pub->eku |= EKU_codeSigning;
+			}
+			i += 10;
+		}
+		pr_debug("extKeyUsage: %d\n", ctx->cert->pub->eku);
+		return 0;
+	}
+
 	return 0;
 }
 
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index 47accec68cb0..1ccaebe2a28b 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -28,6 +28,7 @@ struct public_key {
 	bool key_is_private;
 	const char *id_type;
 	const char *pkey_algo;
+	unsigned int eku : 9;      /* Extended Key Usage (9-bit) */
 };
 
 extern void public_key_free(struct public_key *key);
diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index 461b7aa587ba..8c8935f0eb73 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -125,9 +125,14 @@ enum OID {
 	OID_TPMImportableKey,		/* 2.23.133.10.1.4 */
 	OID_TPMSealedData,		/* 2.23.133.10.1.5 */
 
+	/* Extended key purpose OIDs [RFC 5280] */
+	OID_codeSigning,		/* 1.3.6.1.5.5.7.3.3 */
+
 	OID__NR
 };
 
+#define EKU_codeSigning	(1 << 2)
+
 extern enum OID look_up_OID(const void *data, size_t datasize);
 extern int parse_OID(const void *data, size_t datasize, enum OID *oid);
 extern int sprint_oid(const void *, size_t, char *, size_t);
-- 
2.16.4

