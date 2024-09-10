Return-Path: <keyrings+bounces-1962-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A17973B67
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ABC132879A6
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7AB519ABC6;
	Tue, 10 Sep 2024 15:19:13 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43231194C85;
	Tue, 10 Sep 2024 15:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981553; cv=none; b=R9P79Onum2Vfl4Kbny1Tri+9IyzQV+fu6lNmBMsHvGaJj1wTWR/KSvw0HhHlGk1u/Ai1+4UTLuwFDjhmWBVM3avb9VR4EZeDtjtmRc+8n7Eyz32uRbQtAIXITeY8OpoBjcYN8bjxNEt6vKwzBqTx2TwFXw6vpRssA0YVVgmJGWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981553; c=relaxed/simple;
	bh=LuBW7yYx7jqSfPK3F6FNxs6NyJdBRCpRIzCrIkuZ3SI=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=Y+JFbeMX6THKIp7t7G+mSTchyxnVty5+mUF1k/Y1XBFLZb+B8YV7Ksrlq13GPX+EpmdwPgHMJjbp/XAB2QvHwvg83U8P45tvDA7Bzsg+kZwG6ZNamF/J9UBr+KGjjo+Jd0EpqWVPcwTz0c7sQAHKV5SppXkzOA910ZerFL7UOMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id EB19510191783;
	Tue, 10 Sep 2024 17:19:09 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id BBD7760A8B01;
	Tue, 10 Sep 2024 17:19:09 +0200 (CEST)
X-Mailbox-Line: From 65b1bb40a042cc73ba486e0ed41d3f6bfd083929 Mon Sep 17 00:00:00 2001
Message-ID: <65b1bb40a042cc73ba486e0ed41d3f6bfd083929.1725972335.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:20 +0200
Subject: [PATCH v2 10/19] crypto: drivers - Drop sign/verify operations
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org, Neal Liu <neal_liu@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, Zhiqi Song <songzhiqi1@huawei.com>, Longfang Liu <liulongfang@huawei.com>, Jia Jie Ho <jiajie.ho@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

The drivers aspeed-acry.c, hpre_crypto.c and jh7110-rsa.c purport to
implement sign/verify operations for raw (unpadded) "rsa".

But there is no such thing as message digests generally need to be
padded according to a predefined scheme (such as PSS or PKCS#1) to
match the size of the usually much larger RSA keys.

The bogus sign/verify operations defined by these drivers are never
called but block removal of sign/verify from akcipher_alg.  Drop them.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 drivers/crypto/aspeed/aspeed-acry.c         | 2 --
 drivers/crypto/hisilicon/hpre/hpre_crypto.c | 2 --
 drivers/crypto/starfive/jh7110-rsa.c        | 2 --
 3 files changed, 6 deletions(-)

diff --git a/drivers/crypto/aspeed/aspeed-acry.c b/drivers/crypto/aspeed/aspeed-acry.c
index b4613bd4ad96..7a1e153733e1 100644
--- a/drivers/crypto/aspeed/aspeed-acry.c
+++ b/drivers/crypto/aspeed/aspeed-acry.c
@@ -601,8 +601,6 @@ static struct aspeed_acry_alg aspeed_acry_akcipher_algs[] = {
 		.akcipher.base = {
 			.encrypt = aspeed_acry_rsa_enc,
 			.decrypt = aspeed_acry_rsa_dec,
-			.sign = aspeed_acry_rsa_dec,
-			.verify = aspeed_acry_rsa_enc,
 			.set_pub_key = aspeed_acry_rsa_set_pub_key,
 			.set_priv_key = aspeed_acry_rsa_set_priv_key,
 			.max_size = aspeed_acry_rsa_max_size,
diff --git a/drivers/crypto/hisilicon/hpre/hpre_crypto.c b/drivers/crypto/hisilicon/hpre/hpre_crypto.c
index 764532a6ca82..bdd7e1df8a06 100644
--- a/drivers/crypto/hisilicon/hpre/hpre_crypto.c
+++ b/drivers/crypto/hisilicon/hpre/hpre_crypto.c
@@ -2004,8 +2004,6 @@ static void hpre_curve25519_exit_tfm(struct crypto_kpp *tfm)
 }
 
 static struct akcipher_alg rsa = {
-	.sign = hpre_rsa_dec,
-	.verify = hpre_rsa_enc,
 	.encrypt = hpre_rsa_enc,
 	.decrypt = hpre_rsa_dec,
 	.set_pub_key = hpre_rsa_setpubkey,
diff --git a/drivers/crypto/starfive/jh7110-rsa.c b/drivers/crypto/starfive/jh7110-rsa.c
index a778c4846025..d109c743f076 100644
--- a/drivers/crypto/starfive/jh7110-rsa.c
+++ b/drivers/crypto/starfive/jh7110-rsa.c
@@ -565,8 +565,6 @@ static void starfive_rsa_exit_tfm(struct crypto_akcipher *tfm)
 static struct akcipher_alg starfive_rsa = {
 	.encrypt = starfive_rsa_enc,
 	.decrypt = starfive_rsa_dec,
-	.sign = starfive_rsa_dec,
-	.verify = starfive_rsa_enc,
 	.set_pub_key = starfive_rsa_set_pub_key,
 	.set_priv_key = starfive_rsa_set_priv_key,
 	.max_size = starfive_rsa_max_size,
-- 
2.43.0


