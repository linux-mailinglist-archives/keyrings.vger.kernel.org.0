Return-Path: <keyrings+bounces-1737-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EBC92F5FA
	for <lists+keyrings@lfdr.de>; Fri, 12 Jul 2024 09:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA2DA1F23019
	for <lists+keyrings@lfdr.de>; Fri, 12 Jul 2024 07:12:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCC5A13DDD5;
	Fri, 12 Jul 2024 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L7jkfz0b"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC26513D8A4
	for <keyrings@vger.kernel.org>; Fri, 12 Jul 2024 07:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720768311; cv=none; b=HiRLTvvq1rvhztbBbCFc2DfdJGqJqt4TtNFJidoVp9gkdp6QWd7fJ1cC+OpXAit9iqTnAVdtNIRBjKIj/BvK+6ru3FMPS2aENkOmAnWeLr9iLVurAHzGqXvSRMS5quSDSGSGyR0DoTJvETypYnKa7E0LfwKH7Vang+wIiIdbjBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720768311; c=relaxed/simple;
	bh=BU/gkjqzkGVGYYbHpP2sp9aCLZt/uOjL7d+e+H1X4+s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=MsWLFSdh40E0xrvr16pUBOh0idFki0aX7PabZ2zDYn4OlUso/KXU+10cl0EF+zJpD+Sw4nhm4OatjjbX0e/jTcqSQ6/7S6iej/tp4QJDX1pgoRaPrN357t6VF7bIZOcgVFDVMMNt10Va4IqM3FVCNRzAD96GiRDcXygCMy1SVFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L7jkfz0b; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720768308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sb9RRtPi8eggZ6Yo00cLPCMSYt+M7ddKPnZpXNeyUAs=;
	b=L7jkfz0bkqfflhbrMQlFUAMW0aBk8g6p6YZeGJK+U2flPeq3/wCf1q/GxrFCZ98zJMzvKA
	+kzFtnmkGdvCg2XUgV4GOyIAivdw69utw1djZTKRJ2ge8WbKF8ya2udqtol/Hx0GZe5+ry
	FplofCkJKcTMmjiefFFyTNIb8q35lSs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-N1YxYzBtN4WuEty6m2Cnaw-1; Fri,
 12 Jul 2024 03:11:47 -0400
X-MC-Unique: N1YxYzBtN4WuEty6m2Cnaw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 44EFE196CE02;
	Fri, 12 Jul 2024 07:11:46 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.45.224.7])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CA5591955E85;
	Fri, 12 Jul 2024 07:11:43 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: dhowells@redhat.com,
	dwmw2@infradead.org,
	zxu@redhat.com,
	keyrings@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	jstancek@redhat.com
Subject: [PATCH 1/3] sign-file,extract-cert: move common SSL helper functions to a header
Date: Fri, 12 Jul 2024 09:11:14 +0200
Message-Id: <ca929c72f815643f58d348f1023d4cd185bfc905.1720728319.git.jstancek@redhat.com>
In-Reply-To: <cover.1720728319.git.jstancek@redhat.com>
References: <cover.1720728319.git.jstancek@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Couple error handling helpers are repeated in both tools, so
move them to a common header.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 MAINTAINERS          |  1 +
 certs/Makefile       |  2 +-
 certs/extract-cert.c | 37 ++-----------------------------------
 scripts/sign-file.c  | 37 ++-----------------------------------
 scripts/ssl-common.h | 39 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 45 insertions(+), 71 deletions(-)
 create mode 100644 scripts/ssl-common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 2a4d4b3a9b40..4681e3cd0d20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5042,6 +5042,7 @@ S:	Maintained
 F:	Documentation/admin-guide/module-signing.rst
 F:	certs/
 F:	scripts/sign-file.c
+F:	scripts/ssl-common.h
 F:	tools/certs/
 
 CFAG12864B LCD DRIVER
diff --git a/certs/Makefile b/certs/Makefile
index 1094e3860c2a..f6fa4d8d75e0 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -84,5 +84,5 @@ targets += x509_revocation_list
 
 hostprogs := extract-cert
 
-HOSTCFLAGS_extract-cert.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null)
+HOSTCFLAGS_extract-cert.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/null) -I$(srctree)/scripts
 HOSTLDLIBS_extract-cert = $(shell $(HOSTPKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
diff --git a/certs/extract-cert.c b/certs/extract-cert.c
index 70e9ec89d87d..8e7ba9974a1f 100644
--- a/certs/extract-cert.c
+++ b/certs/extract-cert.c
@@ -23,6 +23,8 @@
 #include <openssl/err.h>
 #include <openssl/engine.h>
 
+#include "ssl-common.h"
+
 /*
  * OpenSSL 3.0 deprecates the OpenSSL's ENGINE API.
  *
@@ -40,41 +42,6 @@ void format(void)
 	exit(2);
 }
 
-static void display_openssl_errors(int l)
-{
-	const char *file;
-	char buf[120];
-	int e, line;
-
-	if (ERR_peek_error() == 0)
-		return;
-	fprintf(stderr, "At main.c:%d:\n", l);
-
-	while ((e = ERR_get_error_line(&file, &line))) {
-		ERR_error_string(e, buf);
-		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
-	}
-}
-
-static void drain_openssl_errors(void)
-{
-	const char *file;
-	int line;
-
-	if (ERR_peek_error() == 0)
-		return;
-	while (ERR_get_error_line(&file, &line)) {}
-}
-
-#define ERR(cond, fmt, ...)				\
-	do {						\
-		bool __cond = (cond);			\
-		display_openssl_errors(__LINE__);	\
-		if (__cond) {				\
-			err(1, fmt, ## __VA_ARGS__);	\
-		}					\
-	} while(0)
-
 static const char *key_pass;
 static BIO *wb;
 static char *cert_dst;
diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 3edb156ae52c..39ba58db5d4e 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -29,6 +29,8 @@
 #include <openssl/err.h>
 #include <openssl/engine.h>
 
+#include "ssl-common.h"
+
 /*
  * OpenSSL 3.0 deprecates the OpenSSL's ENGINE API.
  *
@@ -83,41 +85,6 @@ void format(void)
 	exit(2);
 }
 
-static void display_openssl_errors(int l)
-{
-	const char *file;
-	char buf[120];
-	int e, line;
-
-	if (ERR_peek_error() == 0)
-		return;
-	fprintf(stderr, "At main.c:%d:\n", l);
-
-	while ((e = ERR_get_error_line(&file, &line))) {
-		ERR_error_string(e, buf);
-		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
-	}
-}
-
-static void drain_openssl_errors(void)
-{
-	const char *file;
-	int line;
-
-	if (ERR_peek_error() == 0)
-		return;
-	while (ERR_get_error_line(&file, &line)) {}
-}
-
-#define ERR(cond, fmt, ...)				\
-	do {						\
-		bool __cond = (cond);			\
-		display_openssl_errors(__LINE__);	\
-		if (__cond) {				\
-			errx(1, fmt, ## __VA_ARGS__);	\
-		}					\
-	} while(0)
-
 static const char *key_pass;
 
 static int pem_pw_cb(char *buf, int len, int w, void *v)
diff --git a/scripts/ssl-common.h b/scripts/ssl-common.h
new file mode 100644
index 000000000000..e6711c75ed91
--- /dev/null
+++ b/scripts/ssl-common.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: LGPL-2.1+ */
+/*
+ * SSL helper functions shared by sign-file and extract-cert.
+ */
+
+static void display_openssl_errors(int l)
+{
+	const char *file;
+	char buf[120];
+	int e, line;
+
+	if (ERR_peek_error() == 0)
+		return;
+	fprintf(stderr, "At main.c:%d:\n", l);
+
+	while ((e = ERR_get_error_line(&file, &line))) {
+		ERR_error_string(e, buf);
+		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
+	}
+}
+
+static void drain_openssl_errors(void)
+{
+	const char *file;
+	int line;
+
+	if (ERR_peek_error() == 0)
+		return;
+	while (ERR_get_error_line(&file, &line)) {}
+}
+
+#define ERR(cond, fmt, ...)				\
+	do {						\
+		bool __cond = (cond);			\
+		display_openssl_errors(__LINE__);	\
+		if (__cond) {				\
+			errx(1, fmt, ## __VA_ARGS__);	\
+		}					\
+	} while (0)
-- 
2.39.3


