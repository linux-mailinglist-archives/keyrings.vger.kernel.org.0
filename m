Return-Path: <keyrings+bounces-3347-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E32C5D3EF
	for <lists+keyrings@lfdr.de>; Fri, 14 Nov 2025 14:07:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EB2E54E24D8
	for <lists+keyrings@lfdr.de>; Fri, 14 Nov 2025 13:05:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8120A313533;
	Fri, 14 Nov 2025 13:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A2J4TkyL"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3B53054C8
	for <keyrings@vger.kernel.org>; Fri, 14 Nov 2025 13:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763125489; cv=none; b=bBla3BWodcHjJU565Gu2AmjMP5GjT2DOAi0eK4atHxycFH4Wy05TMk9sQ491a9nTB2HVVcy61ikxw0gLI9Md6RkiLY9RIvA3ibs1CkN6CXs5ZlOP1hbVgn8MIu3rjoxEP746tf02Tl56xMgol7+HIwpyxbIWDPVWAKpmXSDwHm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763125489; c=relaxed/simple;
	bh=k61MYFMMaFNORE143WuR8u8TMnZTQTMl3pAPZVZYr3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TEq7BZDN5cdxRZ+DzyYYoooVsucOk8A7PzlMlq8carTjZSjwOxwzncOHYt4puxs9/PkIqeDfKXGFROa0CUUWLke53dx2xkqyqX716ak0QALoQwbHZhSQneMN4hdzft1GP6+lxj48s0+1wUz5BvqTR3UQH1GKO6pgR7EpCqkhlWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A2J4TkyL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763125486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OUQdQwyIqZTzeJrYIiFd0wR4yxjGopoVQGhDss0o5hs=;
	b=A2J4TkyLNCjYG9nU3Ytw7We5zUIZPWYijngFIA+0GlSeOm5X4kw/b5tWlNfeLOBveIsk82
	vfWn6y/Gp0d1EZTnyTHxDPCvYegP8vEX6YbuLlqRorI70Ueh0Q5aQu+w6Gt/yixZM4+prY
	qGbFaVWfxaj9LAvVGGUEg8aAZ64BmCg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-445--rPSOWjpPJeNyJV1Xdy5YQ-1; Fri,
 14 Nov 2025 08:04:39 -0500
X-MC-Unique: -rPSOWjpPJeNyJV1Xdy5YQ-1
X-Mimecast-MFC-AGG-ID: -rPSOWjpPJeNyJV1Xdy5YQ_1763125474
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ADFBF19560B7;
	Fri, 14 Nov 2025 13:04:33 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.87])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 56A0C1955F1B;
	Fri, 14 Nov 2025 13:04:28 +0000 (UTC)
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
Subject: [PATCH v8 1/9] crypto: Add support for shake256 through crypto_shash
Date: Fri, 14 Nov 2025 13:04:04 +0000
Message-ID: <20251114130417.1756230-2-dhowells@redhat.com>
In-Reply-To: <20251114130417.1756230-1-dhowells@redhat.com>
References: <20251114130417.1756230-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

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


