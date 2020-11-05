Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAE92A765A
	for <lists+keyrings@lfdr.de>; Thu,  5 Nov 2020 05:24:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731124AbgKEEYe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 4 Nov 2020 23:24:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731123AbgKEEYc (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 4 Nov 2020 23:24:32 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DCE7C0613CF;
        Wed,  4 Nov 2020 20:24:32 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id x13so352940pfa.9;
        Wed, 04 Nov 2020 20:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fk1XjhsIVpehEyUHjISdm6QYmnqvAVbB3cg/2P5Gk18=;
        b=fsdDrj9ulrPJymyx5BMLxNn/9u3dFjjW3GuKGSis2ZqEO+5vgwbnLLa6DwGBp2Mo1F
         6oNXLNPYHrASASdw/N9mIaGJHDOoK+SafQXeEC7Y+HS3Eos9u8QT4RtRBbZqau5rLpV8
         siPoWc1Aam1/XLWeSftRSleELG0MD7xEGPFBkcb0mADRrHjzi2cJVmhnmBD6lCgDhxyx
         vY1KYea19IXOUQgG7EBo/26D4nMjcgh5VbJvzzLpoFz5mRAvoB4FcEMouIXQCcELO2SN
         TFPZqM5eFzbRKN2CNI4tITgg5M6U74vuny+khO8L4hhA+iimBQF0+lGvC7S9IM022O/t
         LRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fk1XjhsIVpehEyUHjISdm6QYmnqvAVbB3cg/2P5Gk18=;
        b=HPAao61VQEblQuGGoGGeMyzNMAsIX8iRLCOAtAA+Z8OrvriuacctZZs6FzkWe6DTdd
         efvX1BFbMdlHpBTPpkHHa+KBPA3E5vonjnLQiHr/V1hcbu4E8NBHaiEd9uGugbTNFpxx
         u4njpsJB3cC7Ok0LcA3EsdZtiikL5weXQHxd/9o/taGjcwjcCT/3E2C+gS0PDzOlYl1z
         Vvf9HtCGb5fdJ/OxIu2NGMQhyyWuyGY+65cOvxPC66uLHqIXke4h1e7DJtklcGTIl+pv
         W6KdOXHT36082xFHiKu8ABU3zcQ+wVH/2yzYNXayA4f6KApfr525+L0Skg3WTolYR89z
         9+QQ==
X-Gm-Message-State: AOAM532R70TZk49egSsMcO8ALDdA8B3cnjmQs/ooSmLbk6EXPhsTfSZ/
        lLQCKMODaAphX5qLknp8rM2YSsGp8Bs=
X-Google-Smtp-Source: ABdhPJwYYSxIsD0L45wrkYlchreKYoRYL2ClZqiXC3s448F8zN8aaIH/bi2tvRIgr3i1LEht9iXkwA==
X-Received: by 2002:a05:6a00:22c6:b029:18b:3bb8:8b6d with SMTP id f6-20020a056a0022c6b029018b3bb88b6dmr607779pfj.31.1604550272199;
        Wed, 04 Nov 2020 20:24:32 -0800 (PST)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id z22sm472782pfa.220.2020.11.04.20.24.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Nov 2020 20:24:31 -0800 (PST)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Ben Boeckel <me@benboeckel.net>,
        Randy Dunlap <rdunlap@infradead.org>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: [PATCH v2 1/2] X.509: Add CodeSigning extended key usage parsing
Date:   Thu,  5 Nov 2020 12:24:05 +0800
Message-Id: <20201105042406.5783-2-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20201105042406.5783-1-jlee@suse.com>
References: <20201105042406.5783-1-jlee@suse.com>
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

