Return-Path: <keyrings+bounces-1738-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FB192F5FD
	for <lists+keyrings@lfdr.de>; Fri, 12 Jul 2024 09:12:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EAB2282237
	for <lists+keyrings@lfdr.de>; Fri, 12 Jul 2024 07:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5A3140E58;
	Fri, 12 Jul 2024 07:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UpIM3PGY"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E7213D88E
	for <keyrings@vger.kernel.org>; Fri, 12 Jul 2024 07:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720768316; cv=none; b=EKaI0eMe3Jz2khIE/QQGN93HsG1y/C8Co/Qkb1snNwUUQtfRrhm5uCTxmBJci4RYA9iLs+4lDjg15u/1ZbJFH2eK61g9GwwOhS2NnqGjvir2hA5bQk0NWn6Hjg/hyt8ha9ljZjzCcUnE+fgPo2uix8UlSrX4CwV3ndvT7R9XlfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720768316; c=relaxed/simple;
	bh=mzAmyiCVl/Eb2Usg3sbGJiUODPCpANjwq2dqAWF9hKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-type; b=LVl2H4EJAFL+m/BMRji4m5mts3vLwDQ1GwWFDxEbEY/FvTpSpjEN+3qmeNuIu9l6R7hypV4WsOBE77wRBKBsnws5G8HVsdX3JHSqo5RkCmqpIaFHMTbZ46DshD4JiL+3tppShz+V3TiLkib4eacj6RhksS0wMwVIoFfc1f9DswY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UpIM3PGY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720768313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zxmn1JzRzbyL1id+5CUgnSN3ngYAiw9UET/0TbvNIbs=;
	b=UpIM3PGY5IGsCBjWHSXPNm1FFp8Axgc4uteRoWGTZTAVwZW6qbKWpjfSTrgTrzqCUDB/NY
	CDl6n4VWHitrnPxVYwRdp+l4x0773gWHZb29vJ1ymPCUq0gA+MJQhY2R/XCmlok10/KwR4
	hy6b0ohqdzZGIbfopLK/k3YI5lsrGEQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-537-hHo7pEFTPUemTWc8DnTbVA-1; Fri,
 12 Jul 2024 03:11:50 -0400
X-MC-Unique: hHo7pEFTPUemTWc8DnTbVA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1AAE2196CE02;
	Fri, 12 Jul 2024 07:11:49 +0000 (UTC)
Received: from t14s.redhat.com (unknown [10.45.224.7])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9D03C1955F3B;
	Fri, 12 Jul 2024 07:11:46 +0000 (UTC)
From: Jan Stancek <jstancek@redhat.com>
To: dhowells@redhat.com,
	dwmw2@infradead.org,
	zxu@redhat.com,
	keyrings@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	jstancek@redhat.com
Subject: [PATCH 2/3] sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
Date: Fri, 12 Jul 2024 09:11:15 +0200
Message-Id: <6b7f84efe01b89a8a6cd35108a721224c22de8e1.1720728319.git.jstancek@redhat.com>
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

ERR_get_error_line() is deprecated since OpenSSL 3.0.

Use ERR_peek_error_line() instead, and combine display_openssl_errors()
and drain_openssl_errors() to a single function where parameter decides
if it should consume errors silently.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
---
 certs/extract-cert.c |  4 ++--
 scripts/sign-file.c  |  6 +++---
 scripts/ssl-common.h | 23 ++++++++---------------
 3 files changed, 13 insertions(+), 20 deletions(-)

diff --git a/certs/extract-cert.c b/certs/extract-cert.c
index 8e7ba9974a1f..61bbe0085671 100644
--- a/certs/extract-cert.c
+++ b/certs/extract-cert.c
@@ -99,11 +99,11 @@ int main(int argc, char **argv)
 		parms.cert = NULL;
 
 		ENGINE_load_builtin_engines();
-		drain_openssl_errors();
+		drain_openssl_errors(__LINE__, 1);
 		e = ENGINE_by_id("pkcs11");
 		ERR(!e, "Load PKCS#11 ENGINE");
 		if (ENGINE_init(e))
-			drain_openssl_errors();
+			drain_openssl_errors(__LINE__, 1);
 		else
 			ERR(1, "ENGINE_init");
 		if (key_pass)
diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 39ba58db5d4e..bb3fdf1a617c 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -114,11 +114,11 @@ static EVP_PKEY *read_private_key(const char *private_key_name)
 		ENGINE *e;
 
 		ENGINE_load_builtin_engines();
-		drain_openssl_errors();
+		drain_openssl_errors(__LINE__, 1);
 		e = ENGINE_by_id("pkcs11");
 		ERR(!e, "Load PKCS#11 ENGINE");
 		if (ENGINE_init(e))
-			drain_openssl_errors();
+			drain_openssl_errors(__LINE__, 1);
 		else
 			ERR(1, "ENGINE_init");
 		if (key_pass)
@@ -273,7 +273,7 @@ int main(int argc, char **argv)
 
 		/* Digest the module data. */
 		OpenSSL_add_all_digests();
-		display_openssl_errors(__LINE__);
+		drain_openssl_errors(__LINE__, 0);
 		digest_algo = EVP_get_digestbyname(hash_algo);
 		ERR(!digest_algo, "EVP_get_digestbyname");
 
diff --git a/scripts/ssl-common.h b/scripts/ssl-common.h
index e6711c75ed91..2db0e181143c 100644
--- a/scripts/ssl-common.h
+++ b/scripts/ssl-common.h
@@ -3,7 +3,7 @@
  * SSL helper functions shared by sign-file and extract-cert.
  */
 
-static void display_openssl_errors(int l)
+static void drain_openssl_errors(int l, int silent)
 {
 	const char *file;
 	char buf[120];
@@ -11,28 +11,21 @@ static void display_openssl_errors(int l)
 
 	if (ERR_peek_error() == 0)
 		return;
-	fprintf(stderr, "At main.c:%d:\n", l);
+	if (!silent)
+		fprintf(stderr, "At main.c:%d:\n", l);
 
-	while ((e = ERR_get_error_line(&file, &line))) {
+	while ((e = ERR_peek_error_line(&file, &line))) {
 		ERR_error_string(e, buf);
-		fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
+		if (!silent)
+			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
+		ERR_get_error();
 	}
 }
 
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
 #define ERR(cond, fmt, ...)				\
 	do {						\
 		bool __cond = (cond);			\
-		display_openssl_errors(__LINE__);	\
+		drain_openssl_errors(__LINE__, 0);	\
 		if (__cond) {				\
 			errx(1, fmt, ## __VA_ARGS__);	\
 		}					\
-- 
2.39.3


