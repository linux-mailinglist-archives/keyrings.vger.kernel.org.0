Return-Path: <keyrings+bounces-2183-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E499092E
	for <lists+keyrings@lfdr.de>; Fri,  4 Oct 2024 18:30:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5353B224A7
	for <lists+keyrings@lfdr.de>; Fri,  4 Oct 2024 16:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17011AA79D;
	Fri,  4 Oct 2024 16:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="JEK5rV9l"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6169C1C303B
	for <keyrings@vger.kernel.org>; Fri,  4 Oct 2024 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728058926; cv=none; b=dQ8u5XzagHboqBibr4eO6UOxfUrpEgcSVj3cO2rmieGFRuvNlsP5uXlr9g3jmzjCAVZbQtLmaxyYszLmiNkg/Y9Z/bA5EU9Qx7Bwv07ZstWMd++OCoRMcjUb1XLT8yZNurY8eGI+M4RQZgyracp/m+m70iK8E6njHzQHOGsmrZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728058926; c=relaxed/simple;
	bh=je74LtNxmIzOZi3SCp6WVDFwZ30KNMZ8HgUYDImMZcM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uHlANzPocZRVeoOUa5Lm7BbdOODKGPS893HilrTx3ujroG6SK93qGzYBgnLNsQ/gC98MZHKQ0gw/aCPqTrNnPBR7roJ+ogeAECjUasicwXv1qzbKvg0MH7mh4n4Ox/AXnB/0IHcssMsqerF9e02sqaJM1iC3TFTGVdZwCtOXBO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=JEK5rV9l; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6cb3bbb9cf5so17838706d6.1
        for <keyrings@vger.kernel.org>; Fri, 04 Oct 2024 09:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1728058923; x=1728663723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZwzCUJjE0AU6B0ciHwXhgBjpmcX6LzSknC7CVqPG54=;
        b=JEK5rV9lP8C6YvZS8/kZ8VHNnS4yDKpbqP+nHfYZK6/Fv1vVnttFptAKNz2ejKYa9D
         +wFyWD1SEef1zd8iaAm3c1MFWCZJrO6fU2ixHrHiTIyZ3/I8kknkllQUQPVFBGem3ybt
         MFiwxSAE8CV6pi5IIuyxTGVLvZAMYi87Is6MJ1KVqX6ojvdTwsJSJ9z4WoJN3ueeRy4W
         CMqmgjVc9XpKzt/U85IBubjHkC8FbqX4L+zRYKWCoTX+ZHc9btqNqhP1i+ghcbMTzWlN
         +KFLEuM1dzujRuKpKCcVxwy9CeHk8K1pgtXHtJjFvski9/iws5CQyBAEQuiwGZUUyvzn
         KZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728058923; x=1728663723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZwzCUJjE0AU6B0ciHwXhgBjpmcX6LzSknC7CVqPG54=;
        b=ORc4wRAp3hEYFDjsC2BCSSlz3bQtJsdok3WPWkm6M4qtnoKh00dRCsMLe6ywwwhtcV
         Qsp0Ac3P6zN3zOB1msxHpQPyykLOlkqn0I2yWarJoL70hadnM6j4cE69yWW90kM57ukx
         zWPuoDiQqeMe/T0oet7/ExUVD+nEI9S4foIpEue5dY8etuIxhAR/7du4DKDlXpxYRZE4
         /leW3N97CSxODHGcB6oqoM/dpVM0XwF4wmdGM+kt0UQEdIQt90nrTBGUv22Y/CEFgZ52
         VY2OrUVPwLNPLRX7tyf7CP6gHDyWIY8ZmUqTCNy1ZqG/2ZSLMjI+1OfcMNPrIFBKqkgn
         kZDA==
X-Forwarded-Encrypted: i=1; AJvYcCVkexAt/HHLtlcG94Da+EUI797GdeOIyzdEsQMRZpvrXjq+PhTp4SSZGtUndfBUbaNQdYNQtRm7QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaxhrmSsqBozuHRrCF72ABo50Jmgjby2tZbofsrO8A/YNsLeKD
	WLL2XTfMew+Pi6umrL06iKVa0jmPO3XLKgLd600VhEk8AAj2jNVzy/X78g17q84=
X-Google-Smtp-Source: AGHT+IEPbaivzjppHiMsKskxqT3v6ZYnQUxrOb8G5Kg3/5pvc+BpKPzpYmrhfb9zRrSFpzV+wqUgcQ==
X-Received: by 2002:a05:6214:5413:b0:6cb:50c8:b5f7 with SMTP id 6a1803df08f44-6cb9a4bd5f1mr37659856d6.52.1728058923199;
        Fri, 04 Oct 2024 09:22:03 -0700 (PDT)
Received: from localhost ([93.115.195.2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cba46efcd1sm564236d6.60.2024.10.04.09.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 09:22:01 -0700 (PDT)
From: Fam Zheng <fam.zheng@bytedance.com>
To: linux-kernel@vger.kernel.org
Cc: fam@euphon.net,
	keyrings@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>,
	David Howells <dhowells@redhat.com>,
	fam.zheng@bytedance.com
Subject: [PATCH v2] sign-file: Add -D "digest mode"
Date: Fri,  4 Oct 2024 17:21:59 +0100
Message-Id: <20241004162159.675136-1-fam.zheng@bytedance.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows the command to sign by a binary digest file, instead of the
original ko file.

Combined with the -p (save_sig), we can now split module building (e.g.
dkms) and module signing into different steps and environments, while
_not_ requiring copying the whole module file back and forth.

Example usage:

1. On host side:
    mod=ip6_gre.ko
    openssl dgst -binary -sha256 $mod > $mod.digest

2. Send $mod.digest over to a signing service

3. On the server side, sign the digest using new mode:

    ./sign-file -dpD sha256 private_key.pem cert.pem $mod.digest

4. Server returns the signature (it will be named $mod.digest.p7s) in
binary

5. Client uses the returned signature to sign the ko locally:

    ./sign-file -s signature sha256 cert.pem $mod

Signed-off-by: Fam Zheng <fam.zheng@bytedance.com>

---

v2: Guard the call to CMS_final_digest with #ifdef
---
 scripts/sign-file.c | 48 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 7070245edfc1..edbee3d9162e 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -56,6 +56,9 @@
 	defined(OPENSSL_NO_CMS)
 #define USE_PKCS7
 #endif
+#if OPENSSL_VERSION_NUMBER > 0x30200000L
+#define HAS_CMS_final_digest 1
+#endif
 #ifndef USE_PKCS7
 #include <openssl/cms.h>
 #else
@@ -80,9 +83,9 @@ static __attribute__((noreturn))
 void format(void)
 {
 	fprintf(stderr,
-		"Usage: scripts/sign-file [-dp] <hash algo> <key> <x509> <module> [<dest>]\n");
+		"Usage: scripts/sign-file [-dpD] <hash algo> <key> <x509> <file> [<dest>]\n");
 	fprintf(stderr,
-		"       scripts/sign-file -s <raw sig> <hash algo> <x509> <module> [<dest>]\n");
+		"       scripts/sign-file -s <raw sig> <hash algo> <x509> <file> [<dest>]\n");
 	exit(2);
 }
 
@@ -229,6 +232,11 @@ int main(int argc, char **argv)
 	unsigned char buf[4096];
 	unsigned long module_size, sig_size;
 	unsigned int use_signed_attrs;
+	bool digest_mode = false;
+#ifdef HAS_CMS_final_digest
+	unsigned char digest_bin[4096];
+	long digest_len;
+#endif
 	const EVP_MD *digest_algo;
 	EVP_PKEY *private_key;
 #ifndef USE_PKCS7
@@ -253,11 +261,20 @@ int main(int argc, char **argv)
 #endif
 
 	do {
-		opt = getopt(argc, argv, "sdpk");
+		opt = getopt(argc, argv, "sdpkD");
 		switch (opt) {
 		case 's': raw_sig = true; break;
 		case 'p': save_sig = true; break;
 		case 'd': sign_only = true; save_sig = true; break;
+		case 'D':
+#ifdef HAS_CMS_final_digest
+			digest_mode = true;
+			break;
+#else
+			fprintf(stderr, "digest signing is not supported by the openssl version in use\n");
+			exit(3);
+			break;
+#endif
 #ifndef USE_PKCS7
 		case 'k': use_keyid = CMS_USE_KEYID; break;
 #endif
@@ -301,6 +318,17 @@ int main(int argc, char **argv)
 	bm = BIO_new_file(module_name, "rb");
 	ERR(!bm, "%s", module_name);
 
+#ifdef HAS_CMS_final_digest
+	if (digest_mode) {
+		digest_len = BIO_read(bm, digest_bin, sizeof(digest_bin));
+		if (digest_len >= sizeof(digest_bin)) {
+			fprintf(stderr, "sign-file: Digest file too large (max %ld)\n", sizeof(digest_bin));
+			exit(3);
+		}
+		ERR(BIO_reset(bm) < 0, "%s", module_name);
+	}
+#endif
+
 	if (!raw_sig) {
 		/* Read the private key and the X.509 cert the PKCS#7 message
 		 * will point to.
@@ -324,10 +352,20 @@ int main(int argc, char **argv)
 		ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo,
 				     CMS_NOCERTS | CMS_BINARY |
 				     CMS_NOSMIMECAP | use_keyid |
+				     (digest_mode ? CMS_KEY_PARAM : 0) |
 				     use_signed_attrs),
 		    "CMS_add1_signer");
-		ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) != 1,
-		    "CMS_final");
+		if (digest_mode) {
+#if HAS_CMS_final_digest
+			ERR(CMS_final_digest(cms, digest_bin, digest_len, NULL, CMS_NOCERTS | CMS_BINARY) != 1,
+			    "CMS_final_digest");
+#else
+			fprintf(stderr, "digest mode is not supported by the openssl library\n");
+			exit(3);
+#endif
+		} else
+			ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) != 1,
+			    "CMS_final");
 
 #else
 		pkcs7 = PKCS7_sign(x509, private_key, NULL, bm,
-- 
2.20.1


