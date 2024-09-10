Return-Path: <keyrings+bounces-1960-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F1A973B3A
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:15:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A98E71C20F0C
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70664EEC9;
	Tue, 10 Sep 2024 15:15:25 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542D26F307;
	Tue, 10 Sep 2024 15:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981325; cv=none; b=W27qlW5DHlN+SF0wld87iq0XotUwEY2AIk6aXxUOwICdu8BvPbeapknjRhDs3TtKK+8/MyEfxBAGa4tHuk22Gn6tzlK99YI5VuQuZJ+MJHCoDLTQVVr7J6acF3NmliOjTud94cKDFpLLJGjVpp6Xy0naFtxSuPL4E/c8d6EdrcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981325; c=relaxed/simple;
	bh=k5I+/1a3cMQ6FleFgAJt4EQF8lMkSmudNgJzu+8bJF4=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=jZMnCSzi1olaohE37SApDwo0Tnb6Aih3P3ZMMXVkDSSCafET7+yPQ4eczqxoA83Z5EXmj+XDQ7ujc7gRBOfNqj0H+BIDi9Co9xISZBgehWkp9lPhlrG/QLg5u7XXJieoeSbxNfutaoclRq/e4g0JM5bjacZcWKhIblIq/BR3qhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=176.9.242.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 35FCC1028D5E8;
	Tue, 10 Sep 2024 17:15:21 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id DA84F60A8B01;
	Tue, 10 Sep 2024 17:15:20 +0200 (CEST)
X-Mailbox-Line: From 819ed9cd21975ad4d6683d46f4147659ca043f8b Mon Sep 17 00:00:00 2001
Message-ID: <819ed9cd21975ad4d6683d46f4147659ca043f8b.1725972335.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:18 +0200
Subject: [PATCH v2 08/19] crypto: rsassa-pkcs1 - Avoid copying hash prefix
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

When constructing the EMSA-PKCS1-v1_5 padding for the sign operation,
a buffer for the padding is allocated and the Full Hash Prefix is copied
into it.  The padding is then passed to the RSA decrypt operation as an
sglist entry which is succeeded by a second sglist entry for the hash.

Actually copying the hash prefix around is completely unnecessary.
It can simply be referenced from a third sglist entry which sits
in-between the padding and the digest.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 crypto/rsassa-pkcs1.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
index 8f42a5712806..b291ec0944a2 100644
--- a/crypto/rsassa-pkcs1.c
+++ b/crypto/rsassa-pkcs1.c
@@ -153,7 +153,7 @@ static int rsassa_pkcs1_sign(struct crypto_sig *tfm,
 	struct rsassa_pkcs1_ctx *ctx = crypto_sig_ctx(tfm);
 	unsigned int child_reqsize = crypto_akcipher_reqsize(ctx->child);
 	struct akcipher_request *child_req __free(kfree_sensitive) = NULL;
-	struct scatterlist in_sg[2], out_sg;
+	struct scatterlist in_sg[3], out_sg;
 	struct crypto_wait cwait;
 	unsigned int pad_len;
 	unsigned int ps_end;
@@ -173,24 +173,26 @@ static int rsassa_pkcs1_sign(struct crypto_sig *tfm,
 	if (slen + hash_prefix->size > ctx->key_size - 11)
 		return -EOVERFLOW;
 
-	child_req = kmalloc(sizeof(*child_req) + child_reqsize +
-			    ctx->key_size - 1 - slen, GFP_KERNEL);
+	pad_len = ctx->key_size - slen - hash_prefix->size - 1;
+
+	child_req = kmalloc(sizeof(*child_req) + child_reqsize + pad_len,
+			    GFP_KERNEL);
 	if (!child_req)
 		return -ENOMEM;
 
 	/* RFC 8017 sec 8.2.1 step 1 - EMSA-PKCS1-v1_5 encoding generation */
 	in_buf = (u8 *)(child_req + 1) + child_reqsize;
-	ps_end = ctx->key_size - hash_prefix->size - slen - 2;
+	ps_end = pad_len - 1;
 	in_buf[0] = 0x01;
 	memset(in_buf + 1, 0xff, ps_end - 1);
 	in_buf[ps_end] = 0x00;
-	memcpy(in_buf + ps_end + 1, hash_prefix->data, hash_prefix->size);
 
 	/* RFC 8017 sec 8.2.1 step 2 - RSA signature */
 	crypto_init_wait(&cwait);
-	sg_init_table(in_sg, 2);
-	sg_set_buf(&in_sg[0], in_buf, ctx->key_size - 1 - slen);
-	sg_set_buf(&in_sg[1], src, slen);
+	sg_init_table(in_sg, 3);
+	sg_set_buf(&in_sg[0], in_buf, pad_len);
+	sg_set_buf(&in_sg[1], hash_prefix->data, hash_prefix->size);
+	sg_set_buf(&in_sg[2], src, slen);
 	sg_init_one(&out_sg, dst, dlen);
 	akcipher_request_set_tfm(child_req, ctx->child);
 	akcipher_request_set_crypt(child_req, in_sg, &out_sg,
-- 
2.43.0


