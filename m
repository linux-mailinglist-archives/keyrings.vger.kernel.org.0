Return-Path: <keyrings+bounces-3357-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B03E3C64BF2
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 15:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 258C828FBE
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 14:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70192337B9F;
	Mon, 17 Nov 2025 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T1DXUPV2"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BCC337BBC
	for <keyrings@vger.kernel.org>; Mon, 17 Nov 2025 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391391; cv=none; b=NGYAwa+eVM5nB4Q/rcxlTUvDCXi6c/5A6cAYFiP213GzKl9z/VRR7L79LWKf5FDezIOW1WGOZOC8dXTg1Tzmkgo0F2bMQQjvkjKUY1rA60i++kIY3mcLqVTCboyD/PGhDNohwPXZKi35/8wq+ET/KIpGiSuP8hEvDpD+3cpjr6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391391; c=relaxed/simple;
	bh=k61MYFMMaFNORE143WuR8u8TMnZTQTMl3pAPZVZYr3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HPvxG+NbWd3C0nBJaEQJuWUq2CzOlroiXMt94BfIbkJZd5pPMDB7j9ekjD+JEI9Z2xd/pSBnijafkSxqZf1KdocbTHKpdbZswWnFliciZAPh1uoZrGBWdwBOXD7ufBBhbGiWkIvqQWIJufe3HhKv/nw8liO3D8KtrA690fZgo+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T1DXUPV2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763391388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OUQdQwyIqZTzeJrYIiFd0wR4yxjGopoVQGhDss0o5hs=;
	b=T1DXUPV29TEsxfp+OE+kIir76mLUwGNAQUSUL+2zsUfkT/gMNn5q64n0uhPbb5X0ARHYL7
	Du+4xsQLUpWZmTihriJ9ZO7J4lID/XbbVQd/m0JJvQkDOfl/d/3BuT4qzT+gNwNJPH3zkt
	+iFmVDmtDGNaRqgi7vWnlF1tlN/unHg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-522-dmttwAIEM2S1r564706Xfg-1; Mon,
 17 Nov 2025 09:56:24 -0500
X-MC-Unique: dmttwAIEM2S1r564706Xfg-1
X-Mimecast-MFC-AGG-ID: dmttwAIEM2S1r564706Xfg_1763391382
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB7C218AB425;
	Mon, 17 Nov 2025 14:56:21 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.5])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DD7A819560A7;
	Mon, 17 Nov 2025 14:56:16 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David Howells <dhowells@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 1/9] crypto: Add support for shake256 through crypto_shash
Date: Mon, 17 Nov 2025 14:55:50 +0000
Message-ID: <20251117145606.2155773-2-dhowells@redhat.com>
In-Reply-To: <20251117145606.2155773-1-dhowells@redhat.com>
References: <20251117145606.2155773-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add shake256 support to the SHA-3 crypto_sig module so that ML-DSA can use
it.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Jason A. Donenfeld <Jason@zx2c4.com>
cc: Ard Biesheuvel <ardb@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: linux-crypto@vger.kernel.org
---
 crypto/sha3.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/crypto/sha3.c b/crypto/sha3.c
index 8f364979ec89..be1d18baee8d 100644
--- a/crypto/sha3.c
+++ b/crypto/sha3.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 
 #define SHA3_CTX(desc) ((struct sha3_ctx *)shash_desc_ctx(desc))
+#define SHAKE_CTX(desc) ((struct shake_ctx *)shash_desc_ctx(desc))
 
 static int crypto_sha3_224_init(struct shash_desc *desc)
 {
@@ -87,6 +88,36 @@ static int crypto_sha3_import_core(struct shash_desc *desc, const void *in)
 	return 0;
 }
 
+static int crypto_shake256_init(struct shash_desc *desc)
+{
+	shake256_init(SHAKE_CTX(desc));
+	return 0;
+}
+
+static int crypto_shake_update(struct shash_desc *desc, const u8 *data,
+			      unsigned int len)
+{
+	shake_update(SHAKE_CTX(desc), data, len);
+	return 0;
+}
+
+static int crypto_shake_final(struct shash_desc *desc, u8 *out)
+{
+	const struct shash_alg *alg = crypto_shash_alg(desc->tfm);
+
+	shake_squeeze(SHAKE_CTX(desc), out, alg->digestsize);
+	return 0;
+}
+
+static int crypto_shake256_digest(struct shash_desc *desc,
+				  const u8 *data, unsigned int len, u8 *out)
+{
+	const struct shash_alg *alg = crypto_shash_alg(desc->tfm);
+
+	shake256(data, len, out, alg->digestsize);
+	return 0;
+}
+
 static struct shash_alg algs[] = { {
 	.digestsize		= SHA3_224_DIGEST_SIZE,
 	.init			= crypto_sha3_224_init,
@@ -139,6 +170,17 @@ static struct shash_alg algs[] = { {
 	.base.cra_driver_name	= "sha3-512-lib",
 	.base.cra_blocksize	= SHA3_512_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
+}, {
+	.digestsize		= SHAKE256_DEFAULT_SIZE,
+	.init			= crypto_shake256_init,
+	.update			= crypto_shake_update,
+	.final			= crypto_shake_final,
+	.digest			= crypto_shake256_digest,
+	.descsize		= sizeof(struct shake_ctx),
+	.base.cra_name		= "shake256",
+	.base.cra_driver_name	= "shake256-lib",
+	.base.cra_blocksize	= SHAKE256_BLOCK_SIZE,
+	.base.cra_module	= THIS_MODULE,
 } };
 
 static int __init crypto_sha3_mod_init(void)


