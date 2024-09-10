Return-Path: <keyrings+bounces-1957-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03572973B07
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:09:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7747DB21A9A
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE66A19755E;
	Tue, 10 Sep 2024 15:09:22 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [83.223.78.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581ED194C85;
	Tue, 10 Sep 2024 15:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725980962; cv=none; b=skQFKcuofuldinUTOb8uy5n61rYa+hO/x0LgvzjVI7I6hx+B1hJjuXM4GBEfcIz1jMacxn6OIh8tmzZlWA0cT7LMKhLV8DBT03IZRVxmjvGFja67ZwpCWPQ8N+Djla8bNDZvHCXzXH6FszkbDtTgfj0ciUxdfIbtrXSI4pfF1cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725980962; c=relaxed/simple;
	bh=4JpoEOwWYehYNFt+DQxNr2BZHUUcdEKChYkHu0a6P/I=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=WPJVsEmCBjFTeJcCRKAHWefvng2zKDJI5wMfrOK5Esq/thcQZNvSFVifR7pwTClpeVysvOlbOlFKr8obUn5G6MWspR0rp1c3xXmAx37sB7rvIHiPCLUBiVOAfJ6Hg0md5LcZEKc6l053+TUtA1y3gWQgG3+QlduhPiEjvnhuNDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.78.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 4682910167B70;
	Tue, 10 Sep 2024 17:01:14 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 260C160745C7;
	Tue, 10 Sep 2024 17:01:14 +0200 (CEST)
X-Mailbox-Line: From e1254cbe30eb5bafd841d7ee50ee974bb63dda28 Mon Sep 17 00:00:00 2001
Message-ID: <e1254cbe30eb5bafd841d7ee50ee974bb63dda28.1725972334.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:15 +0200
Subject: [PATCH v2 05/19] crypto: rsa-pkcs1pad - Deduplicate set_{pub,priv}_key
 callbacks
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

pkcs1pad_set_pub_key() and pkcs1pad_set_priv_key() are almost identical.

The upcoming migration of sign/verify operations from rsa-pkcs1pad.c
into a separate crypto_template will require another copy of the exact
same functions.  When RSASSA-PSS and RSAES-OAEP are introduced, each
will need yet another copy.

Deduplicate the functions into a single one which lives in a common
header file for reuse by RSASSA-PKCS1-v1_5, RSASSA-PSS and RSAES-OAEP.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 crypto/rsa-pkcs1pad.c         | 30 ++----------------------------
 include/crypto/internal/rsa.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 28 deletions(-)

diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
index cd501195f34a..3c5fe8c93938 100644
--- a/crypto/rsa-pkcs1pad.c
+++ b/crypto/rsa-pkcs1pad.c
@@ -131,42 +131,16 @@ static int pkcs1pad_set_pub_key(struct crypto_akcipher *tfm, const void *key,
 		unsigned int keylen)
 {
 	struct pkcs1pad_ctx *ctx = akcipher_tfm_ctx(tfm);
-	int err;
-
-	ctx->key_size = 0;
 
-	err = crypto_akcipher_set_pub_key(ctx->child, key, keylen);
-	if (err)
-		return err;
-
-	/* Find out new modulus size from rsa implementation */
-	err = crypto_akcipher_maxsize(ctx->child);
-	if (err > PAGE_SIZE)
-		return -ENOTSUPP;
-
-	ctx->key_size = err;
-	return 0;
+	return rsa_set_key(ctx->child, &ctx->key_size, RSA_PUB, key, keylen);
 }
 
 static int pkcs1pad_set_priv_key(struct crypto_akcipher *tfm, const void *key,
 		unsigned int keylen)
 {
 	struct pkcs1pad_ctx *ctx = akcipher_tfm_ctx(tfm);
-	int err;
-
-	ctx->key_size = 0;
 
-	err = crypto_akcipher_set_priv_key(ctx->child, key, keylen);
-	if (err)
-		return err;
-
-	/* Find out new modulus size from rsa implementation */
-	err = crypto_akcipher_maxsize(ctx->child);
-	if (err > PAGE_SIZE)
-		return -ENOTSUPP;
-
-	ctx->key_size = err;
-	return 0;
+	return rsa_set_key(ctx->child, &ctx->key_size, RSA_PRIV, key, keylen);
 }
 
 static unsigned int pkcs1pad_get_max_size(struct crypto_akcipher *tfm)
diff --git a/include/crypto/internal/rsa.h b/include/crypto/internal/rsa.h
index e870133f4b77..754f687134df 100644
--- a/include/crypto/internal/rsa.h
+++ b/include/crypto/internal/rsa.h
@@ -8,6 +8,7 @@
 #ifndef _RSA_HELPER_
 #define _RSA_HELPER_
 #include <linux/types.h>
+#include <crypto/akcipher.h>
 
 /**
  * rsa_key - RSA key structure
@@ -53,5 +54,32 @@ int rsa_parse_pub_key(struct rsa_key *rsa_key, const void *key,
 int rsa_parse_priv_key(struct rsa_key *rsa_key, const void *key,
 		       unsigned int key_len);
 
+#define RSA_PUB (true)
+#define RSA_PRIV (false)
+
+static inline int rsa_set_key(struct crypto_akcipher *child,
+			      unsigned int *key_size, bool is_pubkey,
+			      const void *key, unsigned int keylen)
+{
+	int err;
+
+	*key_size = 0;
+
+	if (is_pubkey)
+		err = crypto_akcipher_set_pub_key(child, key, keylen);
+	else
+		err = crypto_akcipher_set_priv_key(child, key, keylen);
+	if (err)
+		return err;
+
+	/* Find out new modulus size from rsa implementation */
+	err = crypto_akcipher_maxsize(child);
+	if (err > PAGE_SIZE)
+		return -ENOTSUPP;
+
+	*key_size = err;
+	return 0;
+}
+
 extern struct crypto_template rsa_pkcs1pad_tmpl;
 #endif
-- 
2.43.0


