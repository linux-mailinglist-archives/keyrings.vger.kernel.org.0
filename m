Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA0023210F1
	for <lists+keyrings@lfdr.de>; Mon, 22 Feb 2021 07:44:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhBVGoA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 22 Feb 2021 01:44:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhBVGn6 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 22 Feb 2021 01:43:58 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46EAEC061786;
        Sun, 21 Feb 2021 22:43:18 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id m2so9657279pgq.5;
        Sun, 21 Feb 2021 22:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fk1XjhsIVpehEyUHjISdm6QYmnqvAVbB3cg/2P5Gk18=;
        b=TnR9u2+aykQXhdo9+dW3P6LSbs8rvYWZQ/wVW/56L8JCWVL8xCw22mArldeX9EcUiE
         hEDUYlWlb1Q10frj13VVCQZqYM06Ki1CahB5y4qC0U3fP9Sxu/gRXEFNTI8uOjrzd6aX
         akaghn8BHcNn4PbXdeH81AkkzPstemPkgZBMyPdFSQO8xQEMVf0Pq36ffq/fJme3QUJO
         Ta0qcCsr2bzJbcNpDmWnxApg8R+KbDYDglDSjpkfTeS6/mOpbTvwCxzZFBwef2gEinH3
         R0f9AqM0/3jdBaYKJ+8hjW9xezkGrdQrqJ7PIS92reC+KMe41sGg3itp9swQaRn+9QWF
         LK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fk1XjhsIVpehEyUHjISdm6QYmnqvAVbB3cg/2P5Gk18=;
        b=JLsqJB/tH6lECQyiddOzr0TygB0Q+a7PxjMtVFcjC0wwTsO+HAG0TEV/Ug+YXsbrOW
         tp50+1d4X/dx+KhCuexM8GYRhuVxIV0zks/BTtyNX/PGaSQDI47lmAOHPaXrksJo972B
         H48Hr4LT2DlDNYHW35OIHvNr0FFiCIiL96UP1zcylcUgl9bMt5dUXeGF9n4v4X4+7Hka
         tOGbe2q1lOLab2qhQR03X9ZU5ASPHKYCsRgZYYRS5QLghscUdCpBQr5dnv5plG6rNndh
         htPKokddUkBeNIDlr5JSZRWA0cS6De0mLfHlE6bAzFP0oqOXDFK3z8bsnnSetUqZOo82
         VThQ==
X-Gm-Message-State: AOAM5323YqtzlU2Egbmyly3uI/1xQqh5uKU7TorWaFH8igVTOzcngeXS
        cjoho5Lf5VE3XiA3/z7u+fg=
X-Google-Smtp-Source: ABdhPJzl1RLoPaURcKQslgBIISE2/2jNdVWWv9RaoTDJxb0lBPN57ogXFj8niz+4LWzCyJGOdtBvZA==
X-Received: by 2002:a63:c4a:: with SMTP id 10mr18893205pgm.397.1613976197900;
        Sun, 21 Feb 2021 22:43:17 -0800 (PST)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id 188sm8688195pfz.119.2021.02.21.22.43.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 21 Feb 2021 22:43:17 -0800 (PST)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Malte Gell <malte.gell@gmx.de>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: [PATCH 1/4] X.509: Add CodeSigning extended key usage parsing
Date:   Mon, 22 Feb 2021 14:42:48 +0800
Message-Id: <20210222064251.13374-2-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210222064251.13374-1-jlee@suse.com>
References: <20210222064251.13374-1-jlee@suse.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This patch adds the logic for parsing the CodeSign extended key usage
extension in X.509. The parsing result will be set to the eku flag
which is carried by public key. It can be used in the PKCS#7
verification.

Signed-off-by: "Lee, Chun-Yi" <jlee@suse.com>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 24 ++++++++++++++++++++++++
 include/crypto/public_key.h               |  1 +
 include/linux/oid_registry.h              |  5 +++++
 3 files changed, 30 insertions(+)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 52c9b455fc7d..65721313b265 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -497,6 +497,8 @@ int x509_process_extension(void *context, size_t hdrlen,
 	struct x509_parse_context *ctx = context;
 	struct asymmetric_key_id *kid;
 	const unsigned char *v = value;
+	int i = 0;
+	enum OID oid;
 
 	pr_debug("Extension: %u\n", ctx->last_oid);
 
@@ -526,6 +528,28 @@ int x509_process_extension(void *context, size_t hdrlen,
 		return 0;
 	}
 
+	if (ctx->last_oid == OID_extKeyUsage) {
+		if (v[0] != ((ASN1_UNIV << 6) | ASN1_CONS_BIT | ASN1_SEQ) ||
+		    v[1] != vlen - 2)
+			return -EBADMSG;
+		i += 2;
+
+		while (i < vlen) {
+			/* A 10 bytes EKU OID Octet blob =
+			 * ASN1_OID + size byte + 8 bytes OID */
+			if (v[i] != ASN1_OID || v[i + 1] != 8 || (i + 10) > vlen)
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
index 948c5203ca9c..07a1b28460a2 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -29,6 +29,7 @@ struct public_key {
 	bool key_is_private;
 	const char *id_type;
 	const char *pkey_algo;
+	unsigned int eku : 9;      /* Extended Key Usage (9-bit) */
 };
 
 extern void public_key_free(struct public_key *key);
diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index 4462ed2c18cd..e20e8eb53b21 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -113,9 +113,14 @@ enum OID {
 	OID_SM2_with_SM3,		/* 1.2.156.10197.1.501 */
 	OID_sm3WithRSAEncryption,	/* 1.2.156.10197.1.504 */
 
+	/* Extended key purpose OIDs [RFC 5280] */
+	OID_codeSigning,		/* 1.3.6.1.5.5.7.3.3 */
+
 	OID__NR
 };
 
+#define EKU_codeSigning	(1 << 2)
+
 extern enum OID look_up_OID(const void *data, size_t datasize);
 extern int sprint_oid(const void *, size_t, char *, size_t);
 extern int sprint_OID(enum OID, char *, size_t);
-- 
2.16.4

