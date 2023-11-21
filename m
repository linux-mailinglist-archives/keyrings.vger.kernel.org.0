Return-Path: <keyrings+bounces-135-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A436F7F24AF
	for <lists+keyrings@lfdr.de>; Tue, 21 Nov 2023 04:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64FBD281B8F
	for <lists+keyrings@lfdr.de>; Tue, 21 Nov 2023 03:40:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 759BE1855;
	Tue, 21 Nov 2023 03:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lK9ornm2"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB6ABA7;
	Mon, 20 Nov 2023 19:40:51 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6b87c1edfd5so4119437b3a.1;
        Mon, 20 Nov 2023 19:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700538051; x=1701142851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IZoBJdbZp36CmyvB8Khs+7svIVR+I1y53CDxKBQCWdg=;
        b=lK9ornm2E2bqBCgk5CAwDrZm3TqWQu1sxZkjvApiYfR9o6RmydQ9omDpfVRlhiPm43
         Cf4KmhurMKeQ0TokRCcRpGduSEvn81fkzho75HqS8ph2/K+2kBuruaiZ1RK4if4f99Pj
         j1jJWJJqtshUClOrlB19m1uGnjF8sC6XPHBiADJNtxUtgfd+Co/rMfAnO2QdbTP2X7cG
         +LnPUeXiboMlGywJYrvxFwM0IHmbhC+1WDx3pvd5tGbjf8K61jSqsfYp3Qnej5pOYB+N
         R9297Jbk16Jx7c4RRXdqbxIHjKaaTagO2Vccd4hZJpKHuys+ebtQIhmhPkgHGVuRNHHB
         PRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700538051; x=1701142851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZoBJdbZp36CmyvB8Khs+7svIVR+I1y53CDxKBQCWdg=;
        b=bhnAqL12B/7q4gx0ZbJnzZeF6YL9iKVcpN7DaQQlNbxOyKkF0M/9ycjnGiqE3KIqqE
         1uhQ+67D5B3A04+tq0XsK0dW7JrCjeebg5fe6wgAzwf9vR6cY3PdpeR2cPR74LDyt0Cr
         6RIoN1/eAEtrVnuwvLbDvQvudeqi5wSpMHt2n++Zq0ijA8dYSLRRu18j9g60NJuRLFH0
         OIYf3bOtTrlZAxJWVTR2wtO2VRPVS5K9usJKrx4BjBuWQlZLITkKj/FFIhl5Cw/F++BP
         pOFb/QztCYJpBE/ZmZ4OEq9UTJF6QVju6je0rwHjwxSLTBgbAwWhpwto/EvJxQ6iayDx
         16sw==
X-Gm-Message-State: AOJu0Yxeck4mhTp+jp38mRmRTcW+J54RMdz8CQOJtaN8BfDd2je0i1qr
	iqdDez/WdNE6l3a5d8v6NqgdAetZjRq8kA==
X-Google-Smtp-Source: AGHT+IFa3t8GraPV4UkdOb+JpXKEhE/IcU4J6HGAQT8ZBsEJNgfkoK6EaFNXIxTkbtYjYbsx8mDvQg==
X-Received: by 2002:a05:6a21:1446:b0:17d:f127:d435 with SMTP id oc6-20020a056a21144600b0017df127d435mr5724123pzb.45.1700538051158;
        Mon, 20 Nov 2023 19:40:51 -0800 (PST)
Received: from localhost.localdomain ([154.85.51.139])
        by smtp.gmail.com with ESMTPSA id w16-20020a170902d71000b001c61acd5bd2sm6753152ply.112.2023.11.20.19.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 19:40:50 -0800 (PST)
From: Yusong Gao <a869920004@gmail.com>
To: jarkko@kernel.org,
	davem@davemloft.net,
	dhowells@redhat.com,
	dwmw2@infradead.org,
	juergh@proton.me,
	zohar@linux.ibm.com,
	herbert@gondor.apana.org.au,
	lists@sapience.com,
	dimitri.ledkov@canonical.com
Cc: keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org
Subject: [PATCH v3] sign-file: Fix incorrect return values check
Date: Tue, 21 Nov 2023 03:40:44 +0000
Message-Id: <20231121034044.847642-1-a869920004@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are some wrong return values check in sign-file when call OpenSSL
API. The ERR() check cond is wrong because of the program only check the
return value is < 0 instead of <= 0. For example:
1. CMS_final() return 1 for success or 0 for failure.
2. i2d_CMS_bio_stream() returns 1 for success or 0 for failure.
3. i2d_TYPEbio() return 1 for success and 0 for failure.
4. BIO_free() return 1 for success and 0 for failure.

Link: https://www.openssl.org/docs/manmaster/man3/
Fixes: e5a2e3c84782 ("scripts/sign-file.c: Add support for signing with a raw signature")

Signed-off-by: Yusong Gao <a869920004@gmail.com>
---
V1, V2: Clarify the description of git message.
---
 scripts/sign-file.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 598ef5465f82..dcebbcd6bebd 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -322,7 +322,7 @@ int main(int argc, char **argv)
 				     CMS_NOSMIMECAP | use_keyid |
 				     use_signed_attrs),
 		    "CMS_add1_signer");
-		ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) < 0,
+		ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) <= 0,
 		    "CMS_final");
 
 #else
@@ -341,10 +341,10 @@ int main(int argc, char **argv)
 			b = BIO_new_file(sig_file_name, "wb");
 			ERR(!b, "%s", sig_file_name);
 #ifndef USE_PKCS7
-			ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) < 0,
+			ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) <= 0,
 			    "%s", sig_file_name);
 #else
-			ERR(i2d_PKCS7_bio(b, pkcs7) < 0,
+			ERR(i2d_PKCS7_bio(b, pkcs7) <= 0,
 			    "%s", sig_file_name);
 #endif
 			BIO_free(b);
@@ -374,9 +374,9 @@ int main(int argc, char **argv)
 
 	if (!raw_sig) {
 #ifndef USE_PKCS7
-		ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) < 0, "%s", dest_name);
+		ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) <= 0, "%s", dest_name);
 #else
-		ERR(i2d_PKCS7_bio(bd, pkcs7) < 0, "%s", dest_name);
+		ERR(i2d_PKCS7_bio(bd, pkcs7) <= 0, "%s", dest_name);
 #endif
 	} else {
 		BIO *b;
@@ -396,7 +396,7 @@ int main(int argc, char **argv)
 	ERR(BIO_write(bd, &sig_info, sizeof(sig_info)) < 0, "%s", dest_name);
 	ERR(BIO_write(bd, magic_number, sizeof(magic_number) - 1) < 0, "%s", dest_name);
 
-	ERR(BIO_free(bd) < 0, "%s", dest_name);
+	ERR(BIO_free(bd) <= 0, "%s", dest_name);
 
 	/* Finally, if we're signing in place, replace the original. */
 	if (replace_orig)
-- 
2.34.1


