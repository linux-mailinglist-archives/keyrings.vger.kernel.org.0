Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF3F8293533
	for <lists+keyrings@lfdr.de>; Tue, 20 Oct 2020 08:50:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404583AbgJTGui (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Oct 2020 02:50:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404573AbgJTGue (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Oct 2020 02:50:34 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46E6C061755;
        Mon, 19 Oct 2020 23:50:34 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id t14so514735pgg.1;
        Mon, 19 Oct 2020 23:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rdi/GoI58EnhZ0GLU72FNABm05yuN4bTDD+d3Vy1Or4=;
        b=hq4mAnGqps5S3xSFsGE7TB1x6Bma849GbSPCS0P3bK8sJERLtGrNxEQW5V+QFsWvML
         i7iY1zOsHXLHmg3VKF/vdWjvf0AjaA3K7ZrZZcODKg9GaykyMo2HkYXS+JKt7fD3OReC
         N0Vss9nHokpvR8gES6Mn+dzSrTRK2P+C/ZVp/de0JPHrJUFnBZu9dBxg6GLaxqWkZxcP
         kTxR4W4InXWPEQg2vpTjZLo3qxS/XYJBA3mdmxF0GYaJqSdzwfYqF5nReP8Q2oAMFO7y
         z3+gw5c5o6mCaazuZiuFg0jXd15fI25nB/nmm4bngpV+P9TU0rl7SZcM5t1jT7KW6Ush
         VykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rdi/GoI58EnhZ0GLU72FNABm05yuN4bTDD+d3Vy1Or4=;
        b=BvLXpRRJqcQ/fhz1uuUrxKrwzuNlDNARRr/HvlstlHs6zMspFxDYkfhP1KxP+TlTOj
         MpawIi74XtmeoHn0US+yruP8My7CLr7posr5aGNYQhfmUy9E+lt+wbW7WCBxKcUiBHsM
         pGsdIsmYkGNAAqt+SJiQbWTcRS++nvHpJa83YOGEqNfel0SaybfsqUtatnnT5xfYj+zQ
         BaqpObW+z8bz+pGyiD+/pj2nfe0tgiC1QTsx/IaSgBADJaHnWBXQrWCXJwpYtHVmvylK
         SNHaYPt7X0NldkyJkiZD3S2tP1E9aT5eg7ckT9bZiIu/8aI2jLv/T8ie2ap9uq9LQ2ny
         jCog==
X-Gm-Message-State: AOAM530h1zsvdorNnUVOn6b7nPnggQqsQWMQWnFwzK9p2TLHW+nyADS7
        0Ivm8qn2GMhpUKVN6EPxrP7Pd2tUdZug7g==
X-Google-Smtp-Source: ABdhPJwciTU0o4AMCqZ801SkgO9WVaEzdG/mobBhotplHBkO6eFMpCNWG8Cx5TKDVRti87HtA8a85Q==
X-Received: by 2002:a63:f053:: with SMTP id s19mr1466743pgj.56.1603176634339;
        Mon, 19 Oct 2020 23:50:34 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id c203sm1026346pfb.96.2020.10.19.23.50.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Oct 2020 23:50:33 -0700 (PDT)
From:   "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
X-Google-Original-From: "Lee, Chun-Yi" <jlee@suse.com>
To:     David Howells <dhowells@redhat.com>
Cc:     Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Lee, Chun-Yi" <jlee@suse.com>
Subject: [RFC PATCH 1/2] X.509: Add CodeSigning extended key usage parsing
Date:   Tue, 20 Oct 2020 14:50:00 +0800
Message-Id: <20201020065001.13836-2-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20201020065001.13836-1-jlee@suse.com>
References: <20201020065001.13836-1-jlee@suse.com>
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
index 26ec20ef4899..5179da8b7cd9 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -480,6 +480,8 @@ int x509_process_extension(void *context, size_t hdrlen,
 	struct x509_parse_context *ctx = context;
 	struct asymmetric_key_id *kid;
 	const unsigned char *v = value;
+	int i = 0;
+	enum OID oid;
 
 	pr_debug("Extension: %u\n", ctx->last_oid);
 
@@ -509,6 +511,28 @@ int x509_process_extension(void *context, size_t hdrlen,
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
index 11f535cfb810..7c7342648260 100644
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
index 657d6bf2c064..cd448e9b02fc 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -107,9 +107,14 @@ enum OID {
 	OID_gostTC26Sign512B,		/* 1.2.643.7.1.2.1.2.2 */
 	OID_gostTC26Sign512C,		/* 1.2.643.7.1.2.1.2.3 */
 
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

