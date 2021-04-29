Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5862636E5F4
	for <lists+keyrings@lfdr.de>; Thu, 29 Apr 2021 09:29:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239628AbhD2Hae (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 29 Apr 2021 03:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237215AbhD2Hac (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 29 Apr 2021 03:30:32 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A899C06138C;
        Thu, 29 Apr 2021 00:29:11 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id k3-20020a17090ad083b0290155b934a295so4051169pju.2;
        Thu, 29 Apr 2021 00:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yT6CAnQjd1D49HHgiYY1r24DT674aBCTUWawwoMceAU=;
        b=lVVmp50YHTqP3jnmZi5GfxODR+y/fN+on8hWFumzvIiCjC6+xMuFVclf9/eZmlhMAY
         2YZFBXMizmSsREcsL5OcQRZCSsBbC3MNfskVkGWNlm73s+PMjzFdae0MlR9HfgoBbk3P
         OLFyDfF1n/HT6qYJBIy9dhN6V0kPfQukmoDqfBO19F8NOp/lbCkUt77X6OJNKszz62Jm
         xspueFJyBo5QdthxWLrirC+gr23bWIseQRbS/sM1IMcL3Upsr9SL+Ofh1j1ibTvFt6OX
         /7+MHyHxjgKxdMVuyVoW6bZ7QNZrlkUmBa6nlSr68fc1eTBbL6M9tT8FF3u9IVoRHwsb
         I3Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yT6CAnQjd1D49HHgiYY1r24DT674aBCTUWawwoMceAU=;
        b=SxAfbcAgfML75a9j2HH1TmGhfYnV1oxB2+4QYKxeZJJbm7WD0pCOVVcaLstSe6bQxS
         unKWOEOFvEDbUfgmy+I9EfsSVXrBNal9R7opPflN0YSwbUghPRtJKd/kTjQPi9rNYsLp
         +4nxYz1g9HHhZAfBb4nl8TzjRFeLlx+A+6aeZk/RJvYQYFTA8zP/4Niuvd60lX9L8Ww3
         R5sKyJa1kBQ2t8W+V5x1KvU7AHtwsdn1ITlqCKLYkT8+8i3MyhbewWp9GHv+ySHuZtlx
         xahJGSHe0eFgIMa6mXpOVoKnAPwecPVSsD4/RxAWwR3ZY93mhaSZItEKYrlbGvH2q8dC
         cKJQ==
X-Gm-Message-State: AOAM5312VT/adnBCbzmvyfL/k6KOTkOG/sQdCPXH4WOFrYWfFzH1PEN4
        HkaCe7YJKG5/UMMW+C6kD0Q=
X-Google-Smtp-Source: ABdhPJyzIo47grRUhuizSy9cBwlOcpNxZttaaHTeoe1mWto5ut64cA15PmrmIk9E/7GKPhN2/g9S8A==
X-Received: by 2002:a17:902:8486:b029:ec:8b6c:f998 with SMTP id c6-20020a1709028486b02900ec8b6cf998mr33972860plo.33.1619681351050;
        Thu, 29 Apr 2021 00:29:11 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id z29sm1632085pga.52.2021.04.29.00.29.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Apr 2021 00:29:10 -0700 (PDT)
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
Subject: [PATCH v6,1/4] X.509: Add CodeSigning extended key usage parsing
Date:   Thu, 29 Apr 2021 15:28:48 +0800
Message-Id: <20210429072851.24057-2-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210429072851.24057-1-jlee@suse.com>
References: <20210429072851.24057-1-jlee@suse.com>
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

