Return-Path: <keyrings+bounces-5-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B40627DC78C
	for <lists+keyrings@lfdr.de>; Tue, 31 Oct 2023 08:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67AE0281684
	for <lists+keyrings@lfdr.de>; Tue, 31 Oct 2023 07:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E306910A10;
	Tue, 31 Oct 2023 07:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="jiPJS0IG"
X-Original-To: keyrings@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F093E20E6
	for <keyrings@vger.kernel.org>; Tue, 31 Oct 2023 07:45:58 +0000 (UTC)
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
	by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9261FF1;
	Tue, 31 Oct 2023 00:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=EteBa
	//SMZcb/2FTv07A9wc8ZWg6lHHk08GTm5LnHF8=; b=jiPJS0IGr7o3hxanmw0nD
	wuyPuzruCbrlHPsSwSz2gkzsD56wYRf8u/PM2NR4HbvuuRHiD8pI3LIEwYzKd9os
	AOauRQx+Jy+MVql/QU+j7AmbrSCForGyak7gR+Tl8MMA7E+13jThWDImwXbE/aoy
	+xRNBwvKRbkuD8pqKtdUxc=
Received: from localhost.localdomain (unknown [106.13.245.201])
	by zwqz-smtp-mta-g2-1 (Coremail) with SMTP id _____wD3_1yXsEBlr83VBw--.26819S2;
	Tue, 31 Oct 2023 15:45:34 +0800 (CST)
From: Yusong Gao <a869920004@163.com>
To: dhowells@redhat.com,
	dwmw2@infradead.org
Cc: keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yusong Gao <a869920004@163.com>
Subject: [PATCH] sign-file: Correct return value check for sign-file
Date: Tue, 31 Oct 2023 07:45:17 +0000
Message-Id: <20231031074517.858183-1-a869920004@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3_1yXsEBlr83VBw--.26819S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF48Zw4kCr1UXFW8ur4rXwb_yoW8Kr47pr
	4Fk3WSyFWxJrWqyay7K3W0kF45Kr4kt3Wru3Z8Jw1YyFyYq3yIgr4v9a4rXr95XF45ur15
	XF97Jay5Aa45JFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zReOJrUUUUU=
X-Originating-IP: [106.13.245.201]
X-CM-SenderInfo: zdywmmasqqiki6rwjhhfrp/xtbB0wYa6VXl18I-LgAAsS

There are some wrong return value check in sign-file when call OpenSSL
API. For example the CMS_final() return 1 for success or 0 for failure
The ERR() check cond is wrong because of the program only check the
return value is < 0 instead of <= 0, so correct it.

Reference:
https://www.openssl.org/docs/manmaster/man3/CMS_final.html
https://www.openssl.org/docs/manmaster/man3/i2d_CMS_bio_stream.html
https://www.openssl.org/docs/manmaster/man3/i2d_PKCS7_bio.html
https://www.openssl.org/docs/manmaster/man3/BIO_free.html

Signed-off-by: Yusong Gao <a869920004@163.com>
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


