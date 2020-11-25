Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BCA2C3A11
	for <lists+keyrings@lfdr.de>; Wed, 25 Nov 2020 08:29:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbgKYH1Q (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 25 Nov 2020 02:27:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgKYH1O (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 25 Nov 2020 02:27:14 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596BEC0613D4;
        Tue, 24 Nov 2020 23:27:14 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id l17so1652277pgk.1;
        Tue, 24 Nov 2020 23:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fk1XjhsIVpehEyUHjISdm6QYmnqvAVbB3cg/2P5Gk18=;
        b=n0o0SlL1+1PT5jqL4CTl0B8R2UXghHx2/sEr+eFg3Azi7TkDjI5Q/n1pMdYsliN5/B
         cd/8pGi7OnBCj+9iYZBybH+PwIOZRdhftteWXDGHP5s7ZZcIGj3ObueCPNTZQl53FOvy
         aOc+KLsm2dG/dfs8qQgj7QB63VcUrT+MrPJ/ncsqnghVY+0AfMCW+rSc7kb2IpBS8iTT
         pj6nf2+jSvV10xe2O5de9ZvsVb8DS09u+nyXc0Dwekpwuy48X7lHSmg5qm6fXQJlJ6UL
         fO2bcl3NyAw7zBP4RiRP+gqWZQnu9NJ3xIZRPGxMA05lgyH6bPY+eAjByqkEKNiFS6Tr
         N64A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fk1XjhsIVpehEyUHjISdm6QYmnqvAVbB3cg/2P5Gk18=;
        b=JG1Lchi7+2yAUtylCAkiRoO0e4FaNoPEFjtQcjkfFAlKwbq8tI+QpPr10ArhLEPR9k
         fxLCYPIQUCQz09e9UACDtRx8vz3AXhEz3PCCsGKcNCaxjjmVgsZjVoRVWejyQQcB369a
         foV/Qew1jwM0Nw/oH/Sd1fRwyoFNmoXcPwbweEwxhdLIuywp2f3i3Z8XOIeqiF8wcWaE
         S0o5ytADXUFALW7nL2lCwfwxxR1IOEAEoT3VMAWFaXUQs3/TeDZxG0p8wA+Iq1Nm56wq
         lYNksjG+pV+BBkidc4rbMf+Rqep5+b6yRggvoNU5AuVF9bGmMHsE2Dk+8Hw9+bgjkWTv
         Z6fA==
X-Gm-Message-State: AOAM533HUGMSbTfTQfdXEHkAk69dYCxrCuOkoNm8ZVKIW+TmMwzWpx21
        QGyerH242ZHM2mguXtiq4ps=
X-Google-Smtp-Source: ABdhPJyLEF0ODODWWyFtQ+ruhMTpceqSB3vmhY4GPP9pjc1lvT3aRip3Zud/4t8oiD0LIv8JNLiyJw==
X-Received: by 2002:a17:90a:8909:: with SMTP id u9mr2667026pjn.100.1606289233997;
        Tue, 24 Nov 2020 23:27:13 -0800 (PST)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id q7sm1006055pfh.91.2020.11.24.23.27.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2020 23:27:13 -0800 (PST)
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
Subject: [PATCH v2 1/4] X.509: Add CodeSigning extended key usage parsing
Date:   Wed, 25 Nov 2020 15:26:50 +0800
Message-Id: <20201125072653.15657-2-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20201125072653.15657-1-jlee@suse.com>
References: <20201125072653.15657-1-jlee@suse.com>
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

