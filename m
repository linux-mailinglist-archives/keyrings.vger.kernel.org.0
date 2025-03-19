Return-Path: <keyrings+bounces-2479-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B03A6852B
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 07:41:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4869D7A95E6
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 06:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFBEF24EA92;
	Wed, 19 Mar 2025 06:41:16 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC20211A37;
	Wed, 19 Mar 2025 06:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742366476; cv=none; b=Pmbc2gf6DVZnG+20Pu474OIgijXfrrNCCcT2cTaSsXVTptb4RZwt50GOdZMDjnlMir46i8EZgncXf/cbt70WBZUpr+zJYEhdYNN86VoeNNHqdcWMZm0ZP7JIR/ppT4yOITAPL3d94HsS7C+BCzplAgSE/AXLx9adSLUjPho7fyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742366476; c=relaxed/simple;
	bh=UzWZkEsEI9HQUR1U3KgL+aNDmYBpAorw9AaWD1lA9mY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aw1joH+qOu4DDt0iv99wOaH0IZxgslMMxruCX/sGLe0HebfLkBco+Cr0h47P3H3Hwa9LeIg7kfKdOWy/GDs7HUHPehGoByu8HCmqskrWS1zztPKTuT+3e0uLEU+ck8/yaa1xnl5gJjYa2jEu9963R+dBPoWstEJ88M5g5uTXJc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.198])
	by gateway (Coremail) with SMTP id _____8CxNHAGZ9pn3L2cAA--.2572S3;
	Wed, 19 Mar 2025 14:41:10 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
	by front1 (Coremail) with SMTP id qMiowMAxHsfoZtpnCTFTAA--.22672S3;
	Wed, 19 Mar 2025 14:41:06 +0800 (CST)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>,
	stable@vger.kernel.org,
	David Howells <dhowells@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Jan Stancek <jstancek@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	R Nageswara Sastry <rnsastry@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 6.1&6.6 V3 1/3] sign-file,extract-cert: move common SSL helper functions to a header
Date: Wed, 19 Mar 2025 14:40:29 +0800
Message-ID: <20250319064031.2971073-2-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250319064031.2971073-1-chenhuacai@loongson.cn>
References: <20250319064031.2971073-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxHsfoZtpnCTFTAA--.22672S3
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW3Jw15ur1kKw1Utr47JFWDAwc_yoW7GrW7pa
	1fAw1ftr93JF9rG3srCFyYg3Wj9rWkKr15ZrZrKw1xAFn5A34xZa92kw1Fg348XFyDC3W3
	urW5XFyjkr48J3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUB0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5
	McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_
	Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67
	AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8I
	cVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4YLvDUUUU

From: Jan Stancek <jstancek@redhat.com>

commit 300e6d4116f956b035281ec94297dc4dc8d4e1d3 upstream.

Couple error handling helpers are repeated in both tools, so
move them to a common header.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 MAINTAINERS          |  1 +
 certs/Makefile       |  2 +-
 certs/extract-cert.c | 37 ++-----------------------------------
 scripts/sign-file.c  | 37 ++-----------------------------------
 scripts/ssl-common.h | 39 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 45 insertions(+), 71 deletions(-)
 create mode 100644 scripts/ssl-common.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ae4c0cec5073..294d2ce29b73 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4784,6 +4784,7 @@ S:	Maintained
 F:	Documentation/admin-guide/module-signing.rst
 F:	certs/
 F:	scripts/sign-file.c
+F:	scripts/ssl-common.h
 F:	tools/certs/
 
 CFAG12864B LCD DRIVER
diff --git a/certs/Makefile b/certs/Makefile
index 799ad7b9e68a..67e1f2707c2f 100644
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
2.47.1


