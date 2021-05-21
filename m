Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C547838C3A1
	for <lists+keyrings@lfdr.de>; Fri, 21 May 2021 11:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237015AbhEUJoq (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 21 May 2021 05:44:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237033AbhEUJoh (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 21 May 2021 05:44:37 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EA0DC061763;
        Fri, 21 May 2021 02:43:13 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id f22so12856458pgb.9;
        Fri, 21 May 2021 02:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yT6CAnQjd1D49HHgiYY1r24DT674aBCTUWawwoMceAU=;
        b=Nu8bsfX+8IcYLqpc3IEVwhRxGZ6nnqLeSoEdq6WpPFyzi3By7rvc9JMGQ0mAjYDBXs
         IaZ+8jDTeXzqK8zdq/4WINzXC3ycE+nxiKtihlPcQoKbGMtvy8N2ljRE2h7nOQd2aIlE
         0OW2vYFYtFJeLADJCM6dQRHP0tnO/3UJ7ZXQ/dIcDZecBBb5tIcobdZhN55j6+pl0Kt+
         fFkLp56SQv2ADRmzArQWrb+CXqLyPAXoTLjnI10hgQzAWe9v/LCeLnLLPteyc1SvSJou
         4xAnPpJCNjhDsTgxQOdbAlieNMvRHraPcNmpJRS96EN2W85exaUypRkeFEczeGdcMcLc
         Y1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yT6CAnQjd1D49HHgiYY1r24DT674aBCTUWawwoMceAU=;
        b=kEjiJICgq5QuHk42ntolEHAFjANESBlYQDEVeyPw2bjeZTICGy0txq0TqfenJKvMDH
         yarC1qfD/70XuG3oTqUMxKNDnXTC6ht1HCZpaOk5goJcwquzTejmGqmKSBSnbysDMC9q
         ZTZ/HHJY40YhvUpGLL24g0j5DEnS0EN3BTs8a1rJBEzFOPhE58OQqIF1rU6QW/hmHL3H
         vr3YQWhzlPx5O485+3LkdMw1//ab432ZjpXxmbPDRHkp2weYsChBs4vt7lNuKGa0s6Bm
         1eqI+Mmc2d+4hYxNkHmoksNSBQaAP8rcDWeStOc8feqdeXqOnqEp3Xj1rBvkBvMTuQWW
         Aqeg==
X-Gm-Message-State: AOAM531uEN+1Y5khZGRWB3CurA+KDTm+fz2jeuz/n9EErzrPaBMAjyfY
        Had1ScF701rYUPNh7AJdiCM=
X-Google-Smtp-Source: ABdhPJywG0rIjFot4aTRs7ECgsHzH2YWw4/t6AWlpnb9oiRW3ZQQsDW9ZzYwYrI75lqIWmpzpGk8XA==
X-Received: by 2002:a05:6a00:1509:b029:2de:6765:276b with SMTP id q9-20020a056a001509b02902de6765276bmr9443966pfu.67.1621590192965;
        Fri, 21 May 2021 02:43:12 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id g202sm4091931pfb.54.2021.05.21.02.43.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 02:43:12 -0700 (PDT)
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
Subject: [PATCH v7,1/4] X.509: Add CodeSigning extended key usage parsing
Date:   Fri, 21 May 2021 17:42:17 +0800
Message-Id: <20210521094220.1238-2-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210521094220.1238-1-jlee@suse.com>
References: <20210521094220.1238-1-jlee@suse.com>
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

