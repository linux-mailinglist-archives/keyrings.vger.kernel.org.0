Return-Path: <keyrings+bounces-3234-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 595D1BE9486
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 16:46:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 37E754EFF01
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 14:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B5C336EF7;
	Fri, 17 Oct 2025 14:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LrjYRtlt"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 752F3336EFB
	for <keyrings@vger.kernel.org>; Fri, 17 Oct 2025 14:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712251; cv=none; b=Q89Sy1W03GEafKJEkjI+jJPfinvLufPYmleq5EwoNRmR1E2OJT6Uya7GRXMyPVEiGrBoG5vMzRJcAqrYBQ0SudM554INTd0rHM3NMrXJBe70uoxuNaMFp1FdnvFR577KtVLl7aS6Wmh4udF+O+fPcXo9FLYY5jt0pM0p4+ObbQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712251; c=relaxed/simple;
	bh=mxZiytA0fhzkcEU1IPyWr23Otj1SZM1ahds7LATzZ2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQ38e2doKYVTc7YuUDqHfPfPBzmmplFG3dvGWSQ5b7wbWS7YJFPRKdUzoqQb1wlHaunNI+QWNUpriTzSi1hNb2MTTaVNDoerSthBoqcKZM6qFYiciFfOKwFycvNK3y9M1xXtSPHi7UAOJBjhTYIYPEMaEoKVEGA2OpU52UbNFgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LrjYRtlt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760712248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gnPAmkkIWM6osVX+7zHkY0kCyF/wmhh+xOgxoQZr76U=;
	b=LrjYRtltieL0qQjHPDK7gJO+F5Hg+F7qd93/q0pFnwiBf5EmGSarmOFnb/NtTj14ugms/Z
	Gqrm44cUbGAq0ARyFwHNfdr5tbLa61xrgKZXcnya4t3tuAOhog3OzSftn8HG8YipR47Mvw
	0SSIut2UCQ6tJN9O/TpNXaXfwz+DDRc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-41-NiUHjly8NCyyJZu58zxBJA-1; Fri,
 17 Oct 2025 10:44:06 -0400
X-MC-Unique: NiUHjly8NCyyJZu58zxBJA-1
X-Mimecast-MFC-AGG-ID: NiUHjly8NCyyJZu58zxBJA_1760712244
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9EB8D1956094;
	Fri, 17 Oct 2025 14:44:04 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.57])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8D105180044F;
	Fri, 17 Oct 2025 14:44:00 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 08/17] crypto/sha3: Add SHAKE128/256 support
Date: Fri, 17 Oct 2025 15:42:52 +0100
Message-ID: <20251017144311.817771-9-dhowells@redhat.com>
In-Reply-To: <20251017144311.817771-1-dhowells@redhat.com>
References: <20251017144311.817771-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

SHAKE128/256 'digest' algos need to be available for the ML-DSA pre-digest,
which is a selectable algorithm and need to be available through the same
API as, say, SHA3-512 and SHA512 both.  Resqueezability (probably) isn't
required for this and they'll produce the default number of bytes as the
digest size.

Also, increase MAX_ALGAPI_BLOCKSIZE to accommodate SHAKE128.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Jason A. Donenfeld <Jason@zx2c4.com>
cc: Ard Biesheuvel <ardb@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: Stephan Mueller <smueller@chronox.de>
cc: linux-crypto@vger.kernel.org
---
 crypto/sha3_generic.c   | 26 ++++++++++++++++++++++++++
 include/crypto/algapi.h |  2 +-
 2 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/crypto/sha3_generic.c b/crypto/sha3_generic.c
index 7b16e4c27fc8..3e5a23022596 100644
--- a/crypto/sha3_generic.c
+++ b/crypto/sha3_generic.c
@@ -95,6 +95,28 @@ static struct shash_alg algs[] = { {
 	.base.cra_flags		= 0,
 	.base.cra_blocksize	= SHA3_512_BLOCK_SIZE,
 	.base.cra_module	= THIS_MODULE,
+}, {
+	.digestsize		= SHAKE128_DEFAULT_SIZE,
+	.init			= crypto_sha3_init,
+	.update			= crypto_sha3_update,
+	.finup			= crypto_sha3_finup,
+	.descsize		= sizeof(struct sha3_ctx),
+	.base.cra_name		= "shake128",
+	.base.cra_driver_name	= "shake128-generic",
+	.base.cra_flags		= 0,
+	.base.cra_blocksize	= SHAKE128_BLOCK_SIZE,
+	.base.cra_module	= THIS_MODULE,
+}, {
+	.digestsize		= SHAKE256_DEFAULT_SIZE,
+	.init			= crypto_sha3_init,
+	.update			= crypto_sha3_update,
+	.finup			= crypto_sha3_finup,
+	.descsize		= sizeof(struct sha3_ctx),
+	.base.cra_name		= "shake256",
+	.base.cra_driver_name	= "shake256-generic",
+	.base.cra_flags		= 0,
+	.base.cra_blocksize	= SHAKE256_BLOCK_SIZE,
+	.base.cra_module	= THIS_MODULE,
 } };
 
 static int __init sha3_generic_mod_init(void)
@@ -121,3 +143,7 @@ MODULE_ALIAS_CRYPTO("sha3-384");
 MODULE_ALIAS_CRYPTO("sha3-384-generic");
 MODULE_ALIAS_CRYPTO("sha3-512");
 MODULE_ALIAS_CRYPTO("sha3-512-generic");
+MODULE_ALIAS_CRYPTO("shake128");
+MODULE_ALIAS_CRYPTO("shake128-generic");
+MODULE_ALIAS_CRYPTO("shake256");
+MODULE_ALIAS_CRYPTO("shake256-generic");
diff --git a/include/crypto/algapi.h b/include/crypto/algapi.h
index fc4574940636..6209762736c4 100644
--- a/include/crypto/algapi.h
+++ b/include/crypto/algapi.h
@@ -20,7 +20,7 @@
  * static buffers that are big enough for any combination of
  * algs and architectures. Ciphers have a lower maximum size.
  */
-#define MAX_ALGAPI_BLOCKSIZE		160
+#define MAX_ALGAPI_BLOCKSIZE		168
 #define MAX_ALGAPI_ALIGNMASK		127
 #define MAX_CIPHER_BLOCKSIZE		16
 #define MAX_CIPHER_ALIGNMASK		15


