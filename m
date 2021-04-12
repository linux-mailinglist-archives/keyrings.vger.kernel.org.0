Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4CC35B98E
	for <lists+keyrings@lfdr.de>; Mon, 12 Apr 2021 06:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhDLEr6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 12 Apr 2021 00:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbhDLErm (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 12 Apr 2021 00:47:42 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFEFC061574;
        Sun, 11 Apr 2021 21:47:25 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id r13so2199553pjf.2;
        Sun, 11 Apr 2021 21:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=7xtegNsLq1BrppoFpeV19FwALB/ET7XzOcPVqqrlNjU=;
        b=Lfctu7o+A9xqb9II46Z5o+fY0vnGH1zRG5xJCj5yqni311dd5kshP1rMArmpjZASbT
         xRK2LD4ZP8SsXHekWtqqDp63Ppz6mCYqIlscEXQXBwb1bBuMvlF9DfFkLGyf0UDaH1DQ
         sFV0g13zSNZ2ozn8P1L5vZeMSC7aztjA3Rt8mhkkYn9V7Ie0h2OkFbkrkFXCQraWQr3B
         sfKDn6nwO/VnfG219RLdJRdbg+z+Aq78zSUqxRvkWM85/JUMfdc/YHyqHkOW/JnAepDh
         dGfAxlHDKPuCoG7aYwrn1r0anliTJj9SnOGpD5TqFvtIxlDm/iFknFpWptDFJMZbTCWl
         5uog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=7xtegNsLq1BrppoFpeV19FwALB/ET7XzOcPVqqrlNjU=;
        b=kxkYCX1lgozS1wDwwBCbIiuWsQcBm9YClR9lTMorJ8t1HtTEkmNna5CfEOKwxw5uiO
         nxZeGWAgE4NByUiE5VG4HPo/x0kMoPxwT4XznxpuWAx6dMPmkJx9bHeazqIEcIQzwL3Q
         ZbWd4GVqACbYA2cGCBNxuKXSpFTpzAmCIPAYVryDEIZXBkLt/q8i2cLk29+fsloYkXSX
         VamwCaKP7TOt5LKROqe246wvbxO6WSrLwSl/FrS9MjvC87hnNPJhmhCErKUI7foqTQDn
         W8DXmxGH49TbZmxNbssbj+wd3QPKUo2qGPdHwTM3EDOtuchEYVSnfWDt0PpQxm9CzVmC
         2fuw==
X-Gm-Message-State: AOAM532kjrb8W/FuIYwivDNWVBENak67n+yw85vhlP4PPh2m0AfxK20G
        THNuKUt7KHj9QcTqKqQ+TXw=
X-Google-Smtp-Source: ABdhPJxRVbFE3Znfq6T56wikxPzhQRO6SKMSaOYeJGZnHC2C+uhUjTTswuHgzmRHzIVWdF6C8EgjUg==
X-Received: by 2002:a17:902:a70f:b029:ea:d4a8:6a84 with SMTP id w15-20020a170902a70fb02900ead4a86a84mr8134560plq.42.1618202844815;
        Sun, 11 Apr 2021 21:47:24 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id w16sm8514851pfj.87.2021.04.11.21.47.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Apr 2021 21:47:24 -0700 (PDT)
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
Subject: [PATCH v5,1/4] X.509: Add CodeSigning extended key usage parsing
Date:   Mon, 12 Apr 2021 12:46:57 +0800
Message-Id: <20210412044700.31639-2-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210412044700.31639-1-jlee@suse.com>
References: <20210412044700.31639-1-jlee@suse.com>
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

