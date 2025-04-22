Return-Path: <keyrings+bounces-2656-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9B3A96A03
	for <lists+keyrings@lfdr.de>; Tue, 22 Apr 2025 14:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39A16189F2A4
	for <lists+keyrings@lfdr.de>; Tue, 22 Apr 2025 12:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3653327E1C3;
	Tue, 22 Apr 2025 12:32:32 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9133E27E1CF;
	Tue, 22 Apr 2025 12:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745325152; cv=none; b=bs1cPFUXdF1xoWfe7bFzGDisr9d81fsOph2a2RKHC4+UQ3kGQemwn2Au3fne93LhjxDhR1BrdbGJwneJsTNBPFiiZipQXy2BXThGhVdpd6sUsGIwh0DDTNjYcVhhhJSITk/MfiGWeuvjz8ZM9lzGNkD+H43w+NKm4ITsSLtakmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745325152; c=relaxed/simple;
	bh=7ybQb+1fYQ9nDV2w2AqFUb1y78jzKoQw4hSaMH4Zke0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eV90CYJDNYT8Q24qF8HSmuVh1mn7Q2C89zXY3tRPfGW2kO0EiaQ4+0bqlo8pAbjQxj+aNZI2GhtPRhqAt84/BQrWlZIJunR0em+k5DWy38e4gXAeAtg2bUvKxoHfxY0YJ1NdOmRH5nKf21C/DI5YxzXPseTecztfQb2QIC4yrAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.238])
	by gateway (Coremail) with SMTP id _____8Axz3NcjAdo7gbEAA--.61750S3;
	Tue, 22 Apr 2025 20:32:28 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.238])
	by front1 (Coremail) with SMTP id qMiowMAxTRszjAdoEPePAA--.4685S4;
	Tue, 22 Apr 2025 20:32:26 +0800 (CST)
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
Subject: [PATCH 6.1&6.6 V4 2/3] sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
Date: Tue, 22 Apr 2025 20:31:34 +0800
Message-ID: <20250422123135.1784083-3-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250422123135.1784083-1-chenhuacai@loongson.cn>
References: <20250422123135.1784083-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMAxTRszjAdoEPePAA--.4685S4
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGFyDGFW3Ar1kCr15Jw18JFc_yoW5KrWkpa
	1xXwn7trykXFZ8Gr9rAFy0g3Wj9F4vkr4jvFnrG39xZF1DX3yIgw1Sq3Wa9348ZF95J3W3
	AFn8X340kr48C3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYI
	kI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
	XwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI4
	8JMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AK
	xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8pWlPUUUUU==

From: Jan Stancek <jstancek@redhat.com>

commit 467d60eddf55588add232feda325da7215ddaf30 upstream.

ERR_get_error_line() is deprecated since OpenSSL 3.0.

Use ERR_peek_error_line() instead, and combine display_openssl_errors()
and drain_openssl_errors() to a single function where parameter decides
if it should consume errors silently.

Signed-off-by: Jan Stancek <jstancek@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Tested-by: R Nageswara Sastry <rnsastry@linux.ibm.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
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
2.47.1


