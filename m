Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3BFB345677
	for <lists+keyrings@lfdr.de>; Tue, 23 Mar 2021 04:56:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229866AbhCWD4B (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 22 Mar 2021 23:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbhCWDzz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 22 Mar 2021 23:55:55 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97992C061574;
        Mon, 22 Mar 2021 20:55:55 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id j25so12891424pfe.2;
        Mon, 22 Mar 2021 20:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7xtegNsLq1BrppoFpeV19FwALB/ET7XzOcPVqqrlNjU=;
        b=LAnagOQtR6OSecXobxKo5aH6LIwo34Q5YF2NxFUz/T/ScLdnJPjuaxppHlUhNENQFb
         Zw9agxbeo29qCNWkR71Lx03Gfyu27jpS5DhloCobwGYJ1zAvMQFtV6nxfy9c69ngewYf
         Y8eczQHzb5n/zu3EkdD5A24FKWuDSUvgKOXMFrwCcbI7uZL2dI9xJotBpViiEML4w5h1
         iTcCUXFMDoqdMzvO+7jsnJ13RFix2TH/JsWJKOWNKt0L5WJ6HS/tHaCk66OhtK2qqdvA
         gAoAjbrwepg5WAin/faMScd0RzN84xHJiVZg/hFN/MNTWx7b9fKTK9QJ7uBSe1FFYp80
         u2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7xtegNsLq1BrppoFpeV19FwALB/ET7XzOcPVqqrlNjU=;
        b=Bt/9xilR1PUsD2+dK+FGeW+kjwOqiTk9hh8wrZ49ixpMv/y5Yh9uXwsQ7BkLbCsSWx
         AObzalSbIDVz8CPoLFTBE/rBO8VKLDWP6gdWklq9yVy7EmEDrxXqMST4Y0EC38RU8vXY
         vTBner992lquHEMOhSb024pPkmMf6268gLFxMRNoAt/y2kqnAGFBAI1I7i+XuqdrkY3o
         kmBBYMo1PGaXL7rlblbbEOQjf8cr/W+3mvz6plzWiwN9fRNAUAnk8jrRJhaxheu8osDA
         BYGofIPyq/3p72C/hwDq9y3FHL7wz3imA0yojix98MZPnynXNgwdMLrxeh+ULIArTt4o
         2pnQ==
X-Gm-Message-State: AOAM533rV+kMH+ADbXsJfpMSoU2goH3FGR+r6aKeEi4Ti/dbkNP/pdqy
        rNEaxUaDFGfjDW5R/0KIdxM=
X-Google-Smtp-Source: ABdhPJwLeDHNOHF69RS1K7BEJgVhAn4UKH9nmPvD+PworcdCLSPxmEvvaxFwm+y9ze4cFA/jf49eCg==
X-Received: by 2002:aa7:9431:0:b029:1f1:52fd:5444 with SMTP id y17-20020aa794310000b02901f152fd5444mr2800093pfo.47.1616471755208;
        Mon, 22 Mar 2021 20:55:55 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id z22sm14415630pfa.41.2021.03.22.20.55.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Mar 2021 20:55:54 -0700 (PDT)
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
Date:   Tue, 23 Mar 2021 11:55:18 +0800
Message-Id: <20210323035521.5843-2-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210323035521.5843-1-jlee@suse.com>
References: <20210323035521.5843-1-jlee@suse.com>
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

