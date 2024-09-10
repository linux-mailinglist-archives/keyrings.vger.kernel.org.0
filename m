Return-Path: <keyrings+bounces-1972-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE0C973C17
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACE4F1F26EC9
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C12E199935;
	Tue, 10 Sep 2024 15:35:07 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [83.223.78.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE472195F22;
	Tue, 10 Sep 2024 15:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725982507; cv=none; b=FEvzhuvaa2qTqsVeVwkyt3HJSZRcjb59k3g8J+gE6WuhfrOpWlKru6tkNSGPtx0H0dmD82xi3jdeiN2XpS5L5ADcVKxIXoJWpV4Lm2tXfjnLMmqq2rA8xWLgrGTBJOWlCfKB2DJ9hM0RO07jNpgxbmdsqS5722enj2LhM6d/Qk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725982507; c=relaxed/simple;
	bh=eZgtMdv1E6YANDrs+KDmIkrxBja+PSfHQUsMgKoVjFg=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=JgKBhLViuK230ES6a+mq/U1Fqq7lRIrFEZnMy5Nqo3kS43xCd+5xm0dUpREfThTWYCG2146yqr4ixqEEnF9WpSlUGJhFON7V9MubdSTlkaag9AuUME9+TkGS7pPB4JlYQpe1tcX3Ba0L33JxslHtwmsfxrrsD/RzAlKCPxr4tY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.78.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 8B1FB10323575;
	Tue, 10 Sep 2024 17:35:03 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 6B5F760A8B01;
	Tue, 10 Sep 2024 17:35:03 +0200 (CEST)
X-Mailbox-Line: From b74f4875ae056ff8aa20b7530fe4f41592581c63 Mon Sep 17 00:00:00 2001
Message-ID: <b74f4875ae056ff8aa20b7530fe4f41592581c63.1725972335.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:29 +0200
Subject: [PATCH v2 19/19] crypto: ecrdsa - Fix signature size calculation
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

software_key_query() returns the curve size as maximum signature size
for ecrdsa.  However it should return twice as much.

It's only the maximum signature size that seems to be off.  The maximum
digest size is likewise set to the curve size, but that's correct as it
matches the checks in ecrdsa_set_pub_key() and ecrdsa_verify().

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 crypto/ecrdsa.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/crypto/ecrdsa.c b/crypto/ecrdsa.c
index f981b31f4249..b3dd8a3ddeb7 100644
--- a/crypto/ecrdsa.c
+++ b/crypto/ecrdsa.c
@@ -252,6 +252,13 @@ static unsigned int ecrdsa_key_size(struct crypto_sig *tfm)
 	return ctx->pub_key.ndigits * sizeof(u64);
 }
 
+static unsigned int ecrdsa_max_size(struct crypto_sig *tfm)
+{
+	struct ecrdsa_ctx *ctx = crypto_sig_ctx(tfm);
+
+	return 2 * ctx->pub_key.ndigits * sizeof(u64);
+}
+
 static void ecrdsa_exit_tfm(struct crypto_sig *tfm)
 {
 }
@@ -260,6 +267,7 @@ static struct sig_alg ecrdsa_alg = {
 	.verify		= ecrdsa_verify,
 	.set_pub_key	= ecrdsa_set_pub_key,
 	.key_size	= ecrdsa_key_size,
+	.max_size	= ecrdsa_max_size,
 	.exit		= ecrdsa_exit_tfm,
 	.base = {
 		.cra_name	 = "ecrdsa",
-- 
2.43.0


