Return-Path: <keyrings+bounces-2480-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB14A6852F
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 07:41:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC2A3424192
	for <lists+keyrings@lfdr.de>; Wed, 19 Mar 2025 06:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C611724EF72;
	Wed, 19 Mar 2025 06:41:27 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512F724EF70;
	Wed, 19 Mar 2025 06:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742366487; cv=none; b=hYjZWaKQbcGSfmkZKnh4DcAHYT9uBeDpE29oYgwakLCXOHHtWNFMg7PN7Imp2DxwF5tB/kBQfly9o74r8SE8G/1fF1r/+UcwgnF3Bl4ecD+uBidmaH3mS7Z7w3a9q7iksTF8C+Tim7wT3ILPEn4mboOl5TmxfJi3yumxazZv3D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742366487; c=relaxed/simple;
	bh=7ybQb+1fYQ9nDV2w2AqFUb1y78jzKoQw4hSaMH4Zke0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JROp9J3T159Jh1UQc/d1V53nsaT+/6E2j/44q1A7H0qrghvpIyPiTHtegxtIYP3oaflZPTooUFvaadqZff+rFYJ+W8dYX+L5OWN6t8527geP2xLrpM26u7X6BUdOMsSqdVNgIWuVYbUgak2CIQiJdEco7Z7yPxxBt7EcHcDRnfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [223.64.68.198])
	by gateway (Coremail) with SMTP id _____8CxqmoSZ9pn_L2cAA--.3584S3;
	Wed, 19 Mar 2025 14:41:22 +0800 (CST)
Received: from localhost.localdomain (unknown [223.64.68.198])
	by front1 (Coremail) with SMTP id qMiowMAxHsfoZtpnCTFTAA--.22672S4;
	Wed, 19 Mar 2025 14:41:20 +0800 (CST)
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
Subject: [PATCH 6.1&6.6 V3 2/3] sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
Date: Wed, 19 Mar 2025 14:40:30 +0800
Message-ID: <20250319064031.2971073-3-chenhuacai@loongson.cn>
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
X-CM-TRANSID:qMiowMAxHsfoZtpnCTFTAA--.22672S4
X-CM-SenderInfo: hfkh0x5xdftxo6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoWxGFyDGFW3Ar1kCr15Jw18JFc_yoW5KrWkpa
	1xXwn7trykXFZ8Gr9rAFy0g3Wj9F4vkr4jvFnrG39xZF1DX3yIgw1Sq3Wa9348ZF95J3W3
	AFn8X340kr48C3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUf529EdanIXcx71UUUUU7KY7ZEXa
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
	cVAFwI0_Xr0_Ar1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI
	8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v2
	6r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4YLvDUUUU

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


