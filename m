Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED21C3321AA
	for <lists+keyrings@lfdr.de>; Tue,  9 Mar 2021 10:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhCIJLx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Mar 2021 04:11:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhCIJLV (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 9 Mar 2021 04:11:21 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70620C06174A;
        Tue,  9 Mar 2021 01:11:21 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id kx1so556394pjb.3;
        Tue, 09 Mar 2021 01:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7xtegNsLq1BrppoFpeV19FwALB/ET7XzOcPVqqrlNjU=;
        b=edDsIgGGJzTETG5MBhlGenarTsbp6v55Ik8a6T3Utl3BDh5aF9FFvIVTodD1WUcNUc
         v0rtGy5FhpIiuIjcHTL4CR9Pb9HkEpTHAKRY3j7l/Tytrpga3W7qOqqgoKjaTcyMxcHF
         8q34HXMg9nkLEWllH15TURJvWG2/N8kHvoCkr7HboMb9NDcOhiUFHz5cKl9/Uhm8CWwz
         cmP52D+iccP0+BJAHwiYSWAGIdq4LboV3zRbqQA0wMblG7nkoOKFMLnSke415uCFAShy
         Z/2jXfbchETOYp4MB7gwqZ1aWzXl3YSfU4InKQe2kn/g/viCYYoT1kcOOs2fksPhZ90L
         fQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7xtegNsLq1BrppoFpeV19FwALB/ET7XzOcPVqqrlNjU=;
        b=UuT9MWw8QBGfP+2ateosbEaMIaB9JqGLTPiUJgwE7I49UYRApvAeYyZtwcz5+JPO5u
         EkxoQeNfuI4SNQJrqvGFJ/BqrrLNRaPZovGC3kKyQeZyoy/cW5hvbd6jC9J6UY4TNvWm
         QgJVEgnB+ZNfRM4ST88d7idiDnGJo6lAETUzVQA5MnfcGUcFlGnPP+MslF+ijD/QS4Yx
         l5/iK5xYuRnT1ORFvJr2MyL+/kRruEPp4Ue1t8a0Xe7kr8oV8+KKzHaryJVpynZc6Vju
         n1GD329MgiV9B0CbyYO9blVIBrDNyqLbiRn+yAea9fDeDVDYhvG7Eai+ReN6PhfnNgSo
         Vpxg==
X-Gm-Message-State: AOAM530ABkdaTbkaur1RlW76hR7wtOVmkVSpv3M27wVhF1l8MdvuRe7m
        FTjGCib2VYddzIeDnY4dLPs=
X-Google-Smtp-Source: ABdhPJz5Zk98uMK/QSb8hOiSSb/CJitpngt7KOMr9B6PX7v7JGnKKl/S2Hqi/4nyxmbVn0UWPLXMfA==
X-Received: by 2002:a17:90a:6282:: with SMTP id d2mr3530298pjj.168.1615281081061;
        Tue, 09 Mar 2021 01:11:21 -0800 (PST)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id js16sm2094860pjb.21.2021.03.09.01.11.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Mar 2021 01:11:20 -0800 (PST)
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
Date:   Tue,  9 Mar 2021 17:10:41 +0800
Message-Id: <20210309091044.2298-2-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210309091044.2298-1-jlee@suse.com>
References: <20210309091044.2298-1-jlee@suse.com>
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

