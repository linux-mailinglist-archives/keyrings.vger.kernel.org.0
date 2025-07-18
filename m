Return-Path: <keyrings+bounces-2925-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8309B0AC9E
	for <lists+keyrings@lfdr.de>; Sat, 19 Jul 2025 01:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B8E61C4768E
	for <lists+keyrings@lfdr.de>; Fri, 18 Jul 2025 23:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF3E4222594;
	Fri, 18 Jul 2025 23:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="Wdl7fQ+j"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAD649641
	for <keyrings@vger.kernel.org>; Fri, 18 Jul 2025 23:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752882370; cv=none; b=DkZbhlaHRIA7baqX+ZH6ehfncelibP9Km97gltL4/Z9WXONZypRDWlvX4AZdC6uIcZylGg2xY0qk/eswrYhuh6tXpHaKOXTdcdPci+Ww8d4I1KE+v4fzqKTBsI5Gir0shBj6c3YBRxIPg7XfKsgjLttYFPDD9mhke6Gf2UHxVyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752882370; c=relaxed/simple;
	bh=GfWZmNOG0hq/W/Iv1YiUdhYkj4ETxUFCrPZ1sR3oDxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g+vVfnTn6PDOcZdSaw/XiS7asU8QK25NHYyG1pkJejNf9kzYgp+NaYfRB2n2xK18FOVn7tMByq951VVjOxbV9mZIVXkxlJMdZNi9w09GcHtDmGzRB+ShYsq6zVoIIwGtQNS9TBi1McXwoTJyu6y8ELN4KmoMAoXpxC5d3UQlzJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=Wdl7fQ+j; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-748d982e92cso1915619b3a.1
        for <keyrings@vger.kernel.org>; Fri, 18 Jul 2025 16:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1752882368; x=1753487168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rlp+2sot0Gt0xLa5r44LUEA4W9NMp3e7LlnvL0KJIX8=;
        b=Wdl7fQ+jiA663d3mNeYWTeaNF0nUoO7siTLrNPR1X2L8Wl9wDWeXvTzuqNho4jimZV
         38TDpShugaLe+upVwD3ZBsQmgPGdGfUA/wDH0OtvIKxU5QgBsge31Yu7oP+w0V52R/Q9
         gVKCLGKo5JXBU1o7I0jwgIia9xFv8lChs5uGTtT8KIeoaFL3TdXUTtFhqJVc7HpY28F4
         DgjPnUsc7viVix1UEBSpfx+EAHEaHCHGSruBfRn+DEEWN3cNUj/Waqt5xibIl+mGBFg6
         b9pauesJarfVxUrDPChngIcwMzW/6f8kKF1nq2qbGPEqGgNNU8XgAUiA9EODA9yM0CPg
         TOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752882368; x=1753487168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rlp+2sot0Gt0xLa5r44LUEA4W9NMp3e7LlnvL0KJIX8=;
        b=SG7WKUvDIPQK0iGJYjq8n0Es4KmD/yeRjLuu+bMEZ2qFW/qLzV9rxQgIigy/VYKdK2
         SrKOWzlENXBHG/LH7CFVl3bNJiRIgf2xwxIlHC0zqvcfwPJqo96Bg3T6nf6N5u9O8oeO
         qRp7sjoCJZFlZ+G4FTa4Q8HMWG+sJq2x0beAr8/72GU3a+15SsDg1ftdX5xI3nhKZTaH
         sE32GEcUQwd57HDYOCiytYEH/sxprWa4cwaBE1LP43yKb3ZRJ+D+IUoShaCfApFUTrYV
         e0F03Uh47djffdjdSo1/UF0TvB0f8bW3C0XRyVtnV9IXRUyZWBLhEfUFsYISvipLiqez
         9qSg==
X-Gm-Message-State: AOJu0YyaPx17C5nLlFUvtmXUkc2EOCJJHEkp3OLvWv2Dk8Amx75uBNCM
	FF4EcX2/Z1fvBAhWBVjio+Yvsv1FsANNOVthM0LOs5k+pMVs8iiLjivqVoIcVAqdksj2mXzn2We
	8/xpRr72N
X-Gm-Gg: ASbGncvymLq1V4xHx6wAuz/iEqjOmpSwU7prOHyLCYdRv61fl+GpBf3V5gbLZeFPupX
	luDD+5A+3/Ub+BhKxwe2YQ77IdSLwtEo1cNga2OxcKgRndkQR8zLMXbnIK6wH7FSzoHIaWKFdtF
	P43KIaolXlh5fJ5ZjNhiS/cr3ISqHLNt6+qiD0/DQQSJlXFpuoXfARM7UNm9BlP/7LDHIkXpw8r
	ssSkFj+lGgY7IsBbrOS6MfQaZ8Uk6qhMObERR8IXVFXM8xn1xyhgF0mdrtb0A7eCjOFYKCGYjSY
	Le9jz9map0A6M2VScX5GfS7JHtv9QqmcRt6FLrP+BiiAsaYoBHhKE74Wth32+uZO9z6d4YTBGBs
	7uVia1Wn9JTiCSXJbl5k7um/wFf7jPbTvc7j8PRibHXtIng1AHssDsKXXstd2r+aGJr36mobmUB
	WnlA==
X-Google-Smtp-Source: AGHT+IEcUSDakr1jp7cGp+obGP/DlgXvMwutg05P8yTQ3n1EHnvpYslwPXbbRBdow5qYz4ouOJHPEQ==
X-Received: by 2002:a05:6a00:230b:b0:748:3964:6177 with SMTP id d2e1a72fcca58-756ea7bf77cmr18627685b3a.19.1752882367571;
        Fri, 18 Jul 2025 16:46:07 -0700 (PDT)
Received: from dannyhu-keyringsMachineTpm.sjc.aristanetworks.com ([74.123.28.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e26fbsm1861635b3a.27.2025.07.18.16.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 16:46:07 -0700 (PDT)
From: Danny Hu <dannyhu@arista.com>
To: keyrings@vger.kernel.org
Cc: dhowells@redhat.com,
	dwmw2@infradead.org,
	Danny Hu <dannyhu@arista.com>
Subject: [PATCH 1/2] sign-file: Fix memory leaks in the sign-file tool
Date: Fri, 18 Jul 2025 16:45:40 -0700
Message-ID: <20250718234541.3087-1-dannyhu@arista.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix memory leaks in the sign-file tool by:
1. Freeing the strings that have been allocated via asprintf.
This includes sig_file_name and dest_name.

2. Initialize X509 and EVP_PKEY pointers with NULL to avoid
compiler warnings about uninitalized variables.

3. Ensuring that any structs which have been allocated are freed
with their respective free functions.

Signed-off-by: Danny Hu <dannyhu@arista.com>
---
 scripts/sign-file.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 7070245edfc1..0fa9b75f1c77 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -230,14 +230,14 @@ int main(int argc, char **argv)
 	unsigned long module_size, sig_size;
 	unsigned int use_signed_attrs;
 	const EVP_MD *digest_algo;
-	EVP_PKEY *private_key;
+	EVP_PKEY *private_key = NULL;
 #ifndef USE_PKCS7
 	CMS_ContentInfo *cms = NULL;
 	unsigned int use_keyid = 0;
 #else
 	PKCS7 *pkcs7 = NULL;
 #endif
-	X509 *x509;
+	X509 *x509 = NULL;
 	BIO *bd, *bm;
 	int opt, n;
 	OpenSSL_add_all_algorithms();
@@ -351,6 +351,7 @@ int main(int argc, char **argv)
 			ERR(i2d_PKCS7_bio(b, pkcs7) != 1,
 			    "%s", sig_file_name);
 #endif
+			free(sig_file_name);
 			BIO_free(b);
 		}
 
@@ -377,10 +378,14 @@ int main(int argc, char **argv)
 	module_size = BIO_number_written(bd);
 
 	if (!raw_sig) {
+		EVP_PKEY_free(private_key);
+		X509_free(x509);
 #ifndef USE_PKCS7
 		ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) != 1, "%s", dest_name);
+		CMS_ContentInfo_free(cms);
 #else
 		ERR(i2d_PKCS7_bio(bd, pkcs7) != 1, "%s", dest_name);
+		PKCS7_free(pkcs7);
 #endif
 	} else {
 		BIO *b;
@@ -406,5 +411,6 @@ int main(int argc, char **argv)
 	if (replace_orig)
 		ERR(rename(dest_name, module_name) < 0, "%s", dest_name);
 
+	free(dest_name);
 	return 0;
 }
-- 
2.47.0


