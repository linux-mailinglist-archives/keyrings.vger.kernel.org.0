Return-Path: <keyrings+bounces-1964-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F6F973B99
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:23:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF0F61C250F7
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5EC19DF8D;
	Tue, 10 Sep 2024 15:22:30 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [83.223.78.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFFB199E9D;
	Tue, 10 Sep 2024 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981750; cv=none; b=BHBHdknktUBuNObUmTRjN8umyJrF8Wc+FwwXe5BOBiZWLMzWi3UcSeyOrhqYvVdBCKpnMO2kFrQm6wUOGLOoetExUiNJ4ohoYgmhsIKebUA2RqBz761aheAN3xLwbWrnHRXOVD7PU+Vwj6XpfSLmHU2mexKeALsoK98VZmGQm5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981750; c=relaxed/simple;
	bh=cO5s/0DLt1jbe/J22iCO8zLMM4tSH91NnE5jKUAmQ58=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=unco6PJ4Qs9z9K6nBkQyiwHw3PxIv+56UevAYS/RWr7uQUrD0kX2oJk/j7ZTPkp8qJlzOuf2VdVhqMGWcUB2963S2gEU1K5KLtq205X7IiOGFIFYfesUWOLR+oC1hptN7WWqnajHJhVYzPvkIhupoSvT1Dh7I8npNybYupLJVCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.78.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 1100F1032356C;
	Tue, 10 Sep 2024 17:22:27 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id E4C6360A8B01;
	Tue, 10 Sep 2024 17:22:26 +0200 (CEST)
X-Mailbox-Line: From 1f15cfe8b380af55cd1bd0535abfefcbb68f6b1f Mon Sep 17 00:00:00 2001
Message-ID: <1f15cfe8b380af55cd1bd0535abfefcbb68f6b1f.1725972335.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:22 +0200
Subject: [PATCH v2 12/19] crypto: sig - Move crypto_sig_*() API calls to include
 file
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

The crypto_sig_*() API calls lived in sig.c so far because they needed
access to struct crypto_sig_type:  This was necessary to differentiate
between signature algorithms that had already been migrated from
crypto_akcipher to crypto_sig and those that hadn't yet.

Now that all algorithms have been migrated, the API calls can become
static inlines in <crypto/sig.h> to mimic what <crypto/akcipher.h> is
doing.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 crypto/sig.c         | 46 -------------------------------------------
 include/crypto/sig.h | 47 +++++++++++++++++++++++++++++++++-----------
 2 files changed, 36 insertions(+), 57 deletions(-)

diff --git a/crypto/sig.c b/crypto/sig.c
index 1e6b0d677472..84d0ea9fd73b 100644
--- a/crypto/sig.c
+++ b/crypto/sig.c
@@ -84,52 +84,6 @@ struct crypto_sig *crypto_alloc_sig(const char *alg_name, u32 type, u32 mask)
 }
 EXPORT_SYMBOL_GPL(crypto_alloc_sig);
 
-int crypto_sig_maxsize(struct crypto_sig *tfm)
-{
-	struct sig_alg *alg = crypto_sig_alg(tfm);
-
-	return alg->max_size(tfm);
-}
-EXPORT_SYMBOL_GPL(crypto_sig_maxsize);
-
-int crypto_sig_sign(struct crypto_sig *tfm,
-		    const void *src, unsigned int slen,
-		    void *dst, unsigned int dlen)
-{
-	struct sig_alg *alg = crypto_sig_alg(tfm);
-
-	return alg->sign(tfm, src, slen, dst, dlen);
-}
-EXPORT_SYMBOL_GPL(crypto_sig_sign);
-
-int crypto_sig_verify(struct crypto_sig *tfm,
-		      const void *src, unsigned int slen,
-		      const void *digest, unsigned int dlen)
-{
-	struct sig_alg *alg = crypto_sig_alg(tfm);
-
-	return alg->verify(tfm, src, slen, digest, dlen);
-}
-EXPORT_SYMBOL_GPL(crypto_sig_verify);
-
-int crypto_sig_set_pubkey(struct crypto_sig *tfm,
-			  const void *key, unsigned int keylen)
-{
-	struct sig_alg *alg = crypto_sig_alg(tfm);
-
-	return alg->set_pub_key(tfm, key, keylen);
-}
-EXPORT_SYMBOL_GPL(crypto_sig_set_pubkey);
-
-int crypto_sig_set_privkey(struct crypto_sig *tfm,
-			  const void *key, unsigned int keylen)
-{
-	struct sig_alg *alg = crypto_sig_alg(tfm);
-
-	return alg->set_priv_key(tfm, key, keylen);
-}
-EXPORT_SYMBOL_GPL(crypto_sig_set_privkey);
-
 static void sig_prepare_alg(struct sig_alg *alg)
 {
 	struct crypto_alg *base = &alg->base;
diff --git a/include/crypto/sig.h b/include/crypto/sig.h
index f0f52a7c5ae7..bbc902642bf5 100644
--- a/include/crypto/sig.h
+++ b/include/crypto/sig.h
@@ -130,7 +130,12 @@ static inline void crypto_free_sig(struct crypto_sig *tfm)
  *
  * @tfm:	signature tfm handle allocated with crypto_alloc_sig()
  */
-int crypto_sig_maxsize(struct crypto_sig *tfm);
+static inline int crypto_sig_maxsize(struct crypto_sig *tfm)
+{
+	struct sig_alg *alg = crypto_sig_alg(tfm);
+
+	return alg->max_size(tfm);
+}
 
 /**
  * crypto_sig_sign() - Invoke signing operation
@@ -145,9 +150,14 @@ int crypto_sig_maxsize(struct crypto_sig *tfm);
  *
  * Return: zero on success; error code in case of error
  */
-int crypto_sig_sign(struct crypto_sig *tfm,
-		    const void *src, unsigned int slen,
-		    void *dst, unsigned int dlen);
+static inline int crypto_sig_sign(struct crypto_sig *tfm,
+				  const void *src, unsigned int slen,
+				  void *dst, unsigned int dlen)
+{
+	struct sig_alg *alg = crypto_sig_alg(tfm);
+
+	return alg->sign(tfm, src, slen, dst, dlen);
+}
 
 /**
  * crypto_sig_verify() - Invoke signature verification
@@ -163,9 +173,14 @@ int crypto_sig_sign(struct crypto_sig *tfm,
  *
  * Return: zero on verification success; error code in case of error.
  */
-int crypto_sig_verify(struct crypto_sig *tfm,
-		      const void *src, unsigned int slen,
-		      const void *digest, unsigned int dlen);
+static inline int crypto_sig_verify(struct crypto_sig *tfm,
+				    const void *src, unsigned int slen,
+				    const void *digest, unsigned int dlen)
+{
+	struct sig_alg *alg = crypto_sig_alg(tfm);
+
+	return alg->verify(tfm, src, slen, digest, dlen);
+}
 
 /**
  * crypto_sig_set_pubkey() - Invoke set public key operation
@@ -180,8 +195,13 @@ int crypto_sig_verify(struct crypto_sig *tfm,
  *
  * Return: zero on success; error code in case of error
  */
-int crypto_sig_set_pubkey(struct crypto_sig *tfm,
-			  const void *key, unsigned int keylen);
+static inline int crypto_sig_set_pubkey(struct crypto_sig *tfm,
+					const void *key, unsigned int keylen)
+{
+	struct sig_alg *alg = crypto_sig_alg(tfm);
+
+	return alg->set_pub_key(tfm, key, keylen);
+}
 
 /**
  * crypto_sig_set_privkey() - Invoke set private key operation
@@ -196,6 +216,11 @@ int crypto_sig_set_pubkey(struct crypto_sig *tfm,
  *
  * Return: zero on success; error code in case of error
  */
-int crypto_sig_set_privkey(struct crypto_sig *tfm,
-			   const void *key, unsigned int keylen);
+static inline int crypto_sig_set_privkey(struct crypto_sig *tfm,
+					 const void *key, unsigned int keylen)
+{
+	struct sig_alg *alg = crypto_sig_alg(tfm);
+
+	return alg->set_priv_key(tfm, key, keylen);
+}
 #endif
-- 
2.43.0


