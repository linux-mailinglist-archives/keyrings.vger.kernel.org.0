Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3623D1A8BE2
	for <lists+keyrings@lfdr.de>; Tue, 14 Apr 2020 22:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505471AbgDNUDP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 14 Apr 2020 16:03:15 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:26182 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2505444AbgDNUCv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 14 Apr 2020 16:02:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586894569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=55O3NEeOmFMu2pI5z7Txh645s57BVO3ScH0+97Mu2jE=;
        b=drZVtAqGtA22psCAfcnEKXj5DW5QIypeQMu8yXsScRxOBHBY4ezEs+IZMjt50Pv3sJcIAM
        uGuBpDT+7aSGCGlZDs4RRx1gU9qoFvQN8vw/KlBlWncJ8Lh/eoHv3BxugS/ba/SNnunnSk
        yNB/uNo2Nby0A+ntCiafyy7svaSr1sA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-9yYcqMz-OTCLtF2LTf-VbA-1; Tue, 14 Apr 2020 16:02:45 -0400
X-MC-Unique: 9yYcqMz-OTCLtF2LTf-VbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D33A1005509;
        Tue, 14 Apr 2020 20:02:42 +0000 (UTC)
Received: from llong.com (ovpn-118-173.rdu2.redhat.com [10.10.118.173])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 89A065C1A2;
        Tue, 14 Apr 2020 20:02:35 +0000 (UTC)
From:   Waiman Long <longman@redhat.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        James Morris <jmorris@namei.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Rientjes <rientjes@google.com>,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Chen-Yu Tsai <wens@csie.org>
Cc:     linux-mm@kvack.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, Waiman Long <longman@redhat.com>
Subject: [PATCH v3 2/3] crypto: Remove unnecessary memzero_explicit()
Date:   Tue, 14 Apr 2020 16:02:14 -0400
Message-Id: <20200414200214.1873-1-longman@redhat.com>
In-Reply-To: <20200413211550.8307-1-longman@redhat.com>
References: <20200413211550.8307-1-longman@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Since kfree_sensitive() will do an implicit memzero_explicit(),
there is no need to call memzero_explicit() before it. Eliminate those
memzero_explicit() and simplify the call sites. For better correctness,
keylen is cleared if key memory allocation fails.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 23 +++++++-----------
 .../allwinner/sun8i-ss/sun8i-ss-cipher.c      | 24 +++++++------------
 drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 14 ++++-------
 drivers/crypto/inside-secure/safexcel_hash.c  |  3 +--
 4 files changed, 24 insertions(+), 40 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index aa4e8fdc2b32..a2bac10d2876 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -366,10 +366,7 @@ void sun8i_ce_cipher_exit(struct crypto_tfm *tfm)
 {
 	struct sun8i_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
 
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
+	kfree_sensitive(op->key);
 	crypto_free_sync_skcipher(op->fallback_tfm);
 	pm_runtime_put_sync_suspend(op->ce->dev);
 }
@@ -391,14 +388,13 @@ int sun8i_ce_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		dev_dbg(ce->dev, "ERROR: Invalid keylen %u\n", keylen);
 		return -EINVAL;
 	}
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
+	kfree_sensitive(op->key);
 	op->keylen = keylen;
 	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
-	if (!op->key)
+	if (unlikely(!op->key)) {
+		op->keylen = 0;
 		return -ENOMEM;
+	}
 
 	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
 	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
@@ -416,14 +412,13 @@ int sun8i_ce_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	if (err)
 		return err;
 
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
+	kfree_sensitive(op->key);
 	op->keylen = keylen;
 	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
-	if (!op->key)
+	if (unlikely(!op->key)) {
+		op->keylen = 0;
 		return -ENOMEM;
+	}
 
 	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
 	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index 5246ef4f5430..a24d567a6c36 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -249,7 +249,6 @@ static int sun8i_ss_cipher(struct skcipher_request *areq)
 			offset = areq->cryptlen - ivsize;
 			if (rctx->op_dir & SS_DECRYPTION) {
 				memcpy(areq->iv, backup_iv, ivsize);
-				memzero_explicit(backup_iv, ivsize);
 				kfree_sensitive(backup_iv);
 			} else {
 				scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
@@ -367,10 +366,7 @@ void sun8i_ss_cipher_exit(struct crypto_tfm *tfm)
 {
 	struct sun8i_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
 
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
+	kfree_sensitive(op->key);
 	crypto_free_sync_skcipher(op->fallback_tfm);
 	pm_runtime_put_sync(op->ss->dev);
 }
@@ -392,14 +388,13 @@ int sun8i_ss_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		dev_dbg(ss->dev, "ERROR: Invalid keylen %u\n", keylen);
 		return -EINVAL;
 	}
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
+	kfree_sensitive(op->key);
 	op->keylen = keylen;
 	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
-	if (!op->key)
+	if (unlikely(!op->key))
+		op->keylen = 0;
 		return -ENOMEM;
+	}
 
 	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
 	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
@@ -418,14 +413,13 @@ int sun8i_ss_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		return -EINVAL;
 	}
 
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
+	kfree_sensitive(op->key);
 	op->keylen = keylen;
 	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
-	if (!op->key)
+	if (unlikely(!op->key))
+		op->keylen = 0;
 		return -ENOMEM;
+	}
 
 	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
 	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
index fd1269900d67..5312bad7534e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
@@ -341,10 +341,7 @@ void meson_cipher_exit(struct crypto_tfm *tfm)
 {
 	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
 
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
+	kfree_sensitive(op->key);
 	crypto_free_sync_skcipher(op->fallback_tfm);
 }
 
@@ -368,14 +365,13 @@ int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 		dev_dbg(mc->dev, "ERROR: Invalid keylen %u\n", keylen);
 		return -EINVAL;
 	}
-	if (op->key) {
-		memzero_explicit(op->key, op->keylen);
-		kfree(op->key);
-	}
+	kfree_sensitive(op->key);
 	op->keylen = keylen;
 	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
-	if (!op->key)
+	if (unlikely(!op->key))
+		op->keylen = 0;
 		return -ENOMEM;
+	}
 
 	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
 }
diff --git a/drivers/crypto/inside-secure/safexcel_hash.c b/drivers/crypto/inside-secure/safexcel_hash.c
index 43962bc709c6..4a2d162914de 100644
--- a/drivers/crypto/inside-secure/safexcel_hash.c
+++ b/drivers/crypto/inside-secure/safexcel_hash.c
@@ -1081,8 +1081,7 @@ static int safexcel_hmac_init_pad(struct ahash_request *areq,
 		}
 
 		/* Avoid leaking */
-		memzero_explicit(keydup, keylen);
-		kfree(keydup);
+		kfree_sensitive(keydup);
 
 		if (ret)
 			return ret;
-- 
2.18.1

