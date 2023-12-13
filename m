Return-Path: <keyrings+bounces-265-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0F9810E99
	for <lists+keyrings@lfdr.de>; Wed, 13 Dec 2023 11:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D4451C20983
	for <lists+keyrings@lfdr.de>; Wed, 13 Dec 2023 10:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C52B222EE2;
	Wed, 13 Dec 2023 10:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DFR6j2eS"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F8ACDB
	for <keyrings@vger.kernel.org>; Wed, 13 Dec 2023 02:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702463941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7rbywSJ96wW9dFZf5YYYGCHOwBB3IiK91ZMT119qoHk=;
	b=DFR6j2eSZRa3bRSeBoUkcot/JsM5ZiJLmDc6ZsYmIuWp/E+QozT3LcdDz/VTuRSz5JQwP7
	Ie8nPZyXXUzHp+rYUuQd23AKjT5WJvBHXWGoGnsj5MYCKFXyzT7yHX+kIXzbE9CRwM68SX
	st5N8dj+1YLgPT/TRCPwHoAHAg6oeT8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-K423LaHkPz29mNRoosG6eQ-1; Wed, 13 Dec 2023 05:39:00 -0500
X-MC-Unique: K423LaHkPz29mNRoosG6eQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A0F785CEA2;
	Wed, 13 Dec 2023 10:38:59 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 901B8C157C0;
	Wed, 13 Dec 2023 10:38:57 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
To: torvalds@linux-foundation.org
cc: dhowells@redhat.com, Yusong Gao <a869920004@gmail.com>,
    Juerg Haefliger <juerg.haefliger@canonical.com>, jarkko@kernel.org,
    davem@davemloft.net, dwmw2@infradead.org, juergh@proton.me,
    zohar@linux.ibm.com, herbert@gondor.apana.org.au, lists@sapience.com,
    dimitri.ledkov@canonical.com, keyrings@vger.kernel.org,
    linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5] sign-file: Fix incorrect return values check
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <308938.1702463908.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
From: David Howells <dhowells@redhat.com>
Date: Wed, 13 Dec 2023 10:38:56 +0000
Message-ID: <308966.1702463936@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Hi Linus,

Could you apply this, please?

David
---

From: Yusong Gao <a869920004@gmail.com>

sign-file: Fix incorrect return values check
    =

There are some wrong return values check in sign-file when call OpenSSL
API. The ERR() check cond is wrong because of the program only check the
return value is < 0 which ignored the return val is 0. For example:
1. CMS_final() return 1 for success or 0 for failure.
2. i2d_CMS_bio_stream() returns 1 for success or 0 for failure.
3. i2d_TYPEbio() return 1 for success and 0 for failure.
4. BIO_free() return 1 for success and 0 for failure.

Link: https://www.openssl.org/docs/manmaster/man3/
Fixes: e5a2e3c84782 ("scripts/sign-file.c: Add support for signing with a =
raw signature")
Signed-off-by: Yusong Gao <a869920004@gmail.com>
Reviewed-by: Juerg Haefliger <juerg.haefliger@canonical.com>
Signed-off-by: David Howells <dhowells@redhat.com>
Link: https://lore.kernel.org/r/20231213024405.624692-1-a869920004@gmail.c=
om/ # v5
---
 scripts/sign-file.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 598ef5465f82..3edb156ae52c 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -322,7 +322,7 @@ int main(int argc, char **argv)
 				     CMS_NOSMIMECAP | use_keyid |
 				     use_signed_attrs),
 		    "CMS_add1_signer");
-		ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) < 0,
+		ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) !=3D 1,
 		    "CMS_final");
 =

 #else
@@ -341,10 +341,10 @@ int main(int argc, char **argv)
 			b =3D BIO_new_file(sig_file_name, "wb");
 			ERR(!b, "%s", sig_file_name);
 #ifndef USE_PKCS7
-			ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) < 0,
+			ERR(i2d_CMS_bio_stream(b, cms, NULL, 0) !=3D 1,
 			    "%s", sig_file_name);
 #else
-			ERR(i2d_PKCS7_bio(b, pkcs7) < 0,
+			ERR(i2d_PKCS7_bio(b, pkcs7) !=3D 1,
 			    "%s", sig_file_name);
 #endif
 			BIO_free(b);
@@ -374,9 +374,9 @@ int main(int argc, char **argv)
 =

 	if (!raw_sig) {
 #ifndef USE_PKCS7
-		ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) < 0, "%s", dest_name);
+		ERR(i2d_CMS_bio_stream(bd, cms, NULL, 0) !=3D 1, "%s", dest_name);
 #else
-		ERR(i2d_PKCS7_bio(bd, pkcs7) < 0, "%s", dest_name);
+		ERR(i2d_PKCS7_bio(bd, pkcs7) !=3D 1, "%s", dest_name);
 #endif
 	} else {
 		BIO *b;
@@ -396,7 +396,7 @@ int main(int argc, char **argv)
 	ERR(BIO_write(bd, &sig_info, sizeof(sig_info)) < 0, "%s", dest_name);
 	ERR(BIO_write(bd, magic_number, sizeof(magic_number) - 1) < 0, "%s", des=
t_name);
 =

-	ERR(BIO_free(bd) < 0, "%s", dest_name);
+	ERR(BIO_free(bd) !=3D 1, "%s", dest_name);
 =

 	/* Finally, if we're signing in place, replace the original. */
 	if (replace_orig)


