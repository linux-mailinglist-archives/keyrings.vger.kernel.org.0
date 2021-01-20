Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 005592FCD2B
	for <lists+keyrings@lfdr.de>; Wed, 20 Jan 2021 10:11:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730025AbhATJKR (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 20 Jan 2021 04:10:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbhATJGh (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 20 Jan 2021 04:06:37 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB0EC061757;
        Wed, 20 Jan 2021 01:05:55 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id q20so14102334pfu.8;
        Wed, 20 Jan 2021 01:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Fk1XjhsIVpehEyUHjISdm6QYmnqvAVbB3cg/2P5Gk18=;
        b=izM2+iRUl2skyG50FPHidJyx0thFwCOakDW/tHdUbcuQKuNlixfk3rh/s5i7zXvNQi
         tR+8LIpzYMENOAKjg3IzdoO34tNeq2qIA1EI3uN0BZdzFwYFZNJlyqJeR3hBdS4sxPwi
         P9mjeteI/DXwe3yWFCoVJooeZxg8+aLgf2tZlfK0moaG6z9x7Y1QaDk4vraXXVcDn6ay
         TUmUlVfIVpTZGTRbcapvpCqCOiDYaENtpoWj2ssVAlaWzEmMsquhWfbcctGssixhi80J
         h5nZQiuq3Waemp9aolNU44zLjkuBUk3zO+sc3IdgF0Nu6Sa5AuFc/KHHK4fDHudvWC7/
         kHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Fk1XjhsIVpehEyUHjISdm6QYmnqvAVbB3cg/2P5Gk18=;
        b=BzNXM7YE1AWdxfN9DMQcjr9U4dISpftMTdT3xqBD0IvGWSf1Zxv1BANsUspdq2YIDs
         dYt22UL2Ug4ue5c3MWwunV8Vx6g4z/1JsgxtwNtLtTuGAsvFnkEK67PUKmLtYAGulSFf
         CX05jSrzKOBGig3nHpqZnK9YjWrsrk4dPACj2PMNvz+te/j8OtRTxb/bzMTKYSdoVJIK
         3R/sXf5kqTA06vZkDcAWwDS/mdi0TlxUO4PMKtqZRGn9Ibjiw9kJY3cOy/2gtfzTAumL
         oL0fmn4oOB19VHYKM6x5rARbAWOwGgH7dx3Vz7MW57HQCtfPTS7cytqbY9rBOoO/vwFv
         hkmA==
X-Gm-Message-State: AOAM530XdzxPUV8WzdHsac7uu9jpMP8qux1KlR5a1Y9Lb0zhwFdTgm90
        eV/HrF/ozqwMEeDjKJGOZI6IY0FmjMw=
X-Google-Smtp-Source: ABdhPJzymenlXLQUh4txhzCtmPWXasuMZ3bSstpHmgMnTKuEn39YiKspDCKNQ5jQiyTlyNspd17IQQ==
X-Received: by 2002:a65:5bc8:: with SMTP id o8mr8374442pgr.100.1611133555321;
        Wed, 20 Jan 2021 01:05:55 -0800 (PST)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id z2sm1585226pgl.49.2021.01.20.01.05.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Jan 2021 01:05:54 -0800 (PST)
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
Date:   Wed, 20 Jan 2021 17:05:14 +0800
Message-Id: <20210120090517.23851-2-jlee@suse.com>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <20210120090517.23851-1-jlee@suse.com>
References: <20210120090517.23851-1-jlee@suse.com>
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

