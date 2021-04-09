Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C73D3359225
	for <lists+keyrings@lfdr.de>; Fri,  9 Apr 2021 04:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232913AbhDICra (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 22:47:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232839AbhDICr3 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 22:47:29 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6DBC061760;
        Thu,  8 Apr 2021 19:47:17 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id u7so219658plr.6;
        Thu, 08 Apr 2021 19:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7xtegNsLq1BrppoFpeV19FwALB/ET7XzOcPVqqrlNjU=;
        b=E0Cr7TG1DlW1FReCIix6qHtZ7Q7tghjCDLvvAURlH8YnUcORzAPFLQtLebhef5wRn7
         lV070Kmv8VAi+eyEqT9blpD4LdBr0IDf2sbV8e9QU89+3bu7hwMD6a9FVNj7OC7cfIt5
         mNrAG9/TbG2V3N/EC4bAC5wuLMrZW8qhVOzqKxs7TOmk0pXPrjxYVzLIEqDxvnwNLbZt
         AxsKHtxbeU33Exzgk7yZr4S2lf427w4PnVhsqfHQ+ZmYr3ZOTfw5F57oyo3Uu9eYLrgM
         oPEg8k8He33mFfrDrGXrtX691HEKOz1oUeKOaXUF2f57MjMnU3rNAXI05ac2v89r4xuT
         UCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7xtegNsLq1BrppoFpeV19FwALB/ET7XzOcPVqqrlNjU=;
        b=dTBcCTm+Z9aeHCJzIcvIRWKOfqJ57EQ0IRYExgvR2GNpnPvZoJOt813d+nIM+35GHQ
         jmhmbwX4d4eFKof65QwCIgFi2S37yr86OdP5S8EiCRTt21wVEQ89qHkkLCZQUA+o3p9J
         OYl6UEr7qQphlGxT5RaPM8CR+Js3ArsQwBnZG3x1b7S5rM3znHbKh4U57eVXrIQhCRT1
         HgC9reBEmSGrWonHvZ+ybwtv7NooPb6cLYt3LrRSd8SNbdj+xUswKXXlY0oV0yzEGsFM
         jhHe7+cMHcvNugWXobM51Jh+A3+UEeb1CzpQD2m7YbYhkshCS4DUrKXBYpqz3PDaQigv
         Hptw==
X-Gm-Message-State: AOAM532u4ztj4iVkcKWeSmw/R9SvfjnsLBqDwEvo6/xjdy4KplG8cjpW
        du1nJFSDrLbNgCjaequvedI=
X-Google-Smtp-Source: ABdhPJxqGr+l7wLQ6Vxxe1xxCf72EMnFm7ikMfbF++g9cIFP8E/OmUtnS3LrlsziJiowRViu32g92w==
X-Received: by 2002:a17:90a:8b07:: with SMTP id y7mr11203304pjn.78.1617936436641;
        Thu, 08 Apr 2021 19:47:16 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id d26sm665525pfo.162.2021.04.08.19.47.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Apr 2021 19:47:16 -0700 (PDT)
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
Date:   Fri,  9 Apr 2021 10:46:53 +0800
Message-Id: <20210409024656.8083-2-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210409024656.8083-1-jlee@suse.com>
References: <20210409024656.8083-1-jlee@suse.com>
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

