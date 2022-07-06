Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16181568652
	for <lists+keyrings@lfdr.de>; Wed,  6 Jul 2022 13:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbiGFLDk (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 6 Jul 2022 07:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbiGFLDj (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 6 Jul 2022 07:03:39 -0400
X-Greylist: delayed 551 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 06 Jul 2022 04:03:36 PDT
Received: from tsukuyomi.43-1.org (tsukuyomi.43-1.org [IPv6:2a01:4f8:c2c:1632::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7BC15FE8
        for <keyrings@vger.kernel.org>; Wed,  6 Jul 2022 04:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=43-1.org;
 i=@43-1.org; q=dns/txt; s=2019; t=1657104862; h=message-id : subject :
 from : to : date : content-type : mime-version : from;
 bh=oIy6sS6nItLbpO3naTuuy+GY+U/DRr+6SIE9qZOmPAI=;
 b=VI4+ke7zjq6bkxERseGesj+X8yOnThgByexHrm86JFk6mvB92P7qA8+uP/f8QcWmfc4sc
 06DWDpgqFqHjEdC2SC9K3bzYmexgxeO3ggASml3mgxd0w48Xtu8F3Pad5FN72OjmWF6Lx77
 wG/k1KAa67XH5HGoPsPblzjLnGfEnGtiRHhnbOyqVrSD0+yUpmpUsHeYxgoa21Jrzx9UVOH
 Ew99V13kv7hs6L7n7opb1UmZHaCGmJ/JOzt8VtLojRBCxoa67LV2uocNNv1iTo2fUYVU5Hn
 9tHo58XHJ753kFbP1rLwtOxaaUUQUjBMsxBN8AfVhQbNI/tjg/GaSMQessAw==
Message-ID: <699243abf0153ccea5476fa51a3681f6028f06aa.camel@43-1.org>
Subject: scripts/sign-file.c: correct error handling
From:   Ansgar Burchardt <ansgar@43-1.org>
To:     keyrings@vger.kernel.org
Date:   Wed, 06 Jul 2022 12:54:21 +0200
Content-Type: multipart/mixed; boundary="=-xHtKphtXbq3LS4SjJ3kP"
User-Agent: Evolution 3.44.2-1 
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

--=-xHtKphtXbq3LS4SjJ3kP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

The functions CMS_final, i2d_CMS_bio_stream, i2d_PKCS7_bio and
BIO_free all return 1 for success or 0 for failure. The old check
for a value less than 0 would never catch an error.

I tried signing a kernel module with the patched sign-file and that
still worked.

Ansgar

PS: Please CC me on replies.


--=-xHtKphtXbq3LS4SjJ3kP
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Disposition: attachment; filename="0001-sign-file-correct-error-handling.patch"
Content-Transfer-Encoding: 7bit

From d11fb170c3ec172ce6707baab03b1499f14e0f20 Mon Sep 17 00:00:00 2001
From: Ansgar Burchardt <ansgar@43-1.org>
Date: Sun, 3 Jul 2022 11:17:50 +0200
Subject: [PATCH] sign-file: correct error handling

The functions CMS_final, i2d_CMS_bio_stream, i2d_PKCS7_bio and
BIO_free all return 1 for success or 0 for failure.

Signed-off-by: Ansgar Burchardt <ansgar@43-1.org>
---
 scripts/sign-file.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 7434e9ea926e..4889f919ff8a 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -322,7 +322,7 @@ int main(int argc, char **argv)
 				     CMS_NOSMIMECAP | use_keyid |
 				     use_signed_attrs),
 		    "CMS_add1_signer");
-		ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) < 0,
+		ERR(!CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY),
 		    "CMS_final");
 
 #else
@@ -341,10 +341,10 @@ int main(int argc, char **argv)
 			b = BIO_new_file(sig_file_name, "wb");
 			ERR(!b, "%s", sig_file_name);
 #ifndef USE_PKCS7
-			ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) < 0,
+			ERR(!i2d_CMS_bio_stream(b, cms, NULL, 0),
 			    "%s", sig_file_name);
 #else
-			ERR(i2d_PKCS7_bio(b, pkcs7) < 0,
+			ERR(!i2d_PKCS7_bio(b, pkcs7),
 			    "%s", sig_file_name);
 #endif
 			BIO_free(b);
@@ -374,9 +374,9 @@ int main(int argc, char **argv)
 
 	if (!raw_sig) {
 #ifndef USE_PKCS7
-		ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) < 0, "%s", dest_name);
+		ERR(!i2d_CMS_bio_stream(bd, cms, NULL, 0), "%s", dest_name);
 #else
-		ERR(i2d_PKCS7_bio(bd, pkcs7) < 0, "%s", dest_name);
+		ERR(!i2d_PKCS7_bio(bd, pkcs7), "%s", dest_name);
 #endif
 	} else {
 		BIO *b;
@@ -396,7 +396,7 @@ int main(int argc, char **argv)
 	ERR(BIO_write(bd, &sig_info, sizeof(sig_info)) < 0, "%s", dest_name);
 	ERR(BIO_write(bd, magic_number, sizeof(magic_number) - 1) < 0, "%s", dest_name);
 
-	ERR(BIO_free(bd) < 0, "%s", dest_name);
+	ERR(!BIO_free(bd), "%s", dest_name);
 
 	/* Finally, if we're signing in place, replace the original. */
 	if (replace_orig)
-- 
2.35.1


--=-xHtKphtXbq3LS4SjJ3kP--
