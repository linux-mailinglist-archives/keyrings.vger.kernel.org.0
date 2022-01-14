Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D46548E609
	for <lists+keyrings@lfdr.de>; Fri, 14 Jan 2022 09:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240197AbiANIW4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 14 Jan 2022 03:22:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240208AbiANIVU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 14 Jan 2022 03:21:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B0D0C0617A9;
        Fri, 14 Jan 2022 00:21:12 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D8F061E30;
        Fri, 14 Jan 2022 08:21:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08F2C36AEA;
        Fri, 14 Jan 2022 08:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642148472;
        bh=Dk3kLypObH2mqW0ZKWU+/2CO0Ao8WaPUXgjLmFLpykk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TqZ7D66vF/3eCKKjWN6fxPaZq/PMrA1ZwxQTIUadcxOdeI/n5kYfPUTLHt67hSjgr
         m1sDzCIYh/A0QHohL+S5tW9bOnRibwSePvphDF0oIwaWXKhEmXLy3/2Gvb4T/hyTSN
         /0w/moE9pVdPBPcj1MMVCKAFR2J2oElmgX/RPge55OJj1lAkr/lixRRpu/IdWwa793
         oexDBmEmKOdmhOSPaa49JKjJXXl8UEbrByZS0/+YKYvC7+YGf4jQVCn47jrmaI2Er1
         Ki5k9bqIMdpecmjn2TZI2us51QlQid1MZNCvmmMEKC7KrYMr5aWiT4O9p3MRETsg+z
         /3AKDtbUJXOdg==
From:   Eric Biggers <ebiggers@kernel.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     keyrings@vger.kernel.org, Vitaly Chikunov <vt@altlinux.org>,
        Denis Kenzior <denkenz@gmail.com>
Subject: [PATCH 3/3] crypto: rsa-pkcs1pad - use clearer variable names
Date:   Fri, 14 Jan 2022 00:19:39 -0800
Message-Id: <20220114081939.218416-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114081939.218416-1-ebiggers@kernel.org>
References: <20220114081939.218416-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

The new convention for akcipher_alg::verify makes it unclear which
values are the lengths of the signature and digest.  Add local variables
to make it clearer what is going on.

Also rename the digest_size variable in pkcs1pad_sign(), as it is
actually the digest *info* size, not the digest size which is different.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/rsa-pkcs1pad.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
index 6cd24b4b9b9e..8a3054a43735 100644
--- a/crypto/rsa-pkcs1pad.c
+++ b/crypto/rsa-pkcs1pad.c
@@ -385,15 +385,15 @@ static int pkcs1pad_sign(struct akcipher_request *req)
 	struct pkcs1pad_inst_ctx *ictx = akcipher_instance_ctx(inst);
 	const struct rsa_asn1_template *digest_info = ictx->digest_info;
 	int err;
-	unsigned int ps_end, digest_size = 0;
+	unsigned int ps_end, digest_info_size = 0;
 
 	if (!ctx->key_size)
 		return -EINVAL;
 
 	if (digest_info)
-		digest_size = digest_info->size;
+		digest_info_size = digest_info->size;
 
-	if (req->src_len + digest_size > ctx->key_size - 11)
+	if (req->src_len + digest_info_size > ctx->key_size - 11)
 		return -EOVERFLOW;
 
 	if (req->dst_len < ctx->key_size) {
@@ -406,7 +406,7 @@ static int pkcs1pad_sign(struct akcipher_request *req)
 	if (!req_ctx->in_buf)
 		return -ENOMEM;
 
-	ps_end = ctx->key_size - digest_size - req->src_len - 2;
+	ps_end = ctx->key_size - digest_info_size - req->src_len - 2;
 	req_ctx->in_buf[0] = 0x01;
 	memset(req_ctx->in_buf + 1, 0xff, ps_end - 1);
 	req_ctx->in_buf[ps_end] = 0x00;
@@ -441,6 +441,8 @@ static int pkcs1pad_verify_complete(struct akcipher_request *req, int err)
 	struct akcipher_instance *inst = akcipher_alg_instance(tfm);
 	struct pkcs1pad_inst_ctx *ictx = akcipher_instance_ctx(inst);
 	const struct rsa_asn1_template *digest_info = ictx->digest_info;
+	const unsigned int sig_size = req->src_len;
+	const unsigned int digest_size = req->dst_len;
 	unsigned int dst_len;
 	unsigned int pos;
 	u8 *out_buf;
@@ -487,20 +489,19 @@ static int pkcs1pad_verify_complete(struct akcipher_request *req, int err)
 
 	err = 0;
 
-	if (req->dst_len != dst_len - pos) {
+	if (digest_size != dst_len - pos) {
 		err = -EKEYREJECTED;
 		req->dst_len = dst_len - pos;
 		goto done;
 	}
 	/* Extract appended digest. */
 	sg_pcopy_to_buffer(req->src,
-			   sg_nents_for_len(req->src,
-					    req->src_len + req->dst_len),
+			   sg_nents_for_len(req->src, sig_size + digest_size),
 			   req_ctx->out_buf + ctx->key_size,
-			   req->dst_len, req->src_len);
+			   digest_size, sig_size);
 	/* Do the actual verification step. */
 	if (memcmp(req_ctx->out_buf + ctx->key_size, out_buf + pos,
-		   req->dst_len) != 0)
+		   digest_size) != 0)
 		err = -EKEYREJECTED;
 done:
 	kfree_sensitive(req_ctx->out_buf);
@@ -536,14 +537,15 @@ static int pkcs1pad_verify(struct akcipher_request *req)
 	struct crypto_akcipher *tfm = crypto_akcipher_reqtfm(req);
 	struct pkcs1pad_ctx *ctx = akcipher_tfm_ctx(tfm);
 	struct pkcs1pad_request *req_ctx = akcipher_request_ctx(req);
+	const unsigned int sig_size = req->src_len;
+	const unsigned int digest_size = req->dst_len;
 	int err;
 
-	if (WARN_ON(req->dst) ||
-	    WARN_ON(!req->dst_len) ||
-	    !ctx->key_size || req->src_len < ctx->key_size)
+	if (WARN_ON(req->dst) || WARN_ON(!digest_size) ||
+	    !ctx->key_size || sig_size < ctx->key_size)
 		return -EINVAL;
 
-	req_ctx->out_buf = kmalloc(ctx->key_size + req->dst_len, GFP_KERNEL);
+	req_ctx->out_buf = kmalloc(ctx->key_size + digest_size, GFP_KERNEL);
 	if (!req_ctx->out_buf)
 		return -ENOMEM;
 
@@ -556,8 +558,7 @@ static int pkcs1pad_verify(struct akcipher_request *req)
 
 	/* Reuse input buffer, output to a new buffer */
 	akcipher_request_set_crypt(&req_ctx->child_req, req->src,
-				   req_ctx->out_sg, req->src_len,
-				   ctx->key_size);
+				   req_ctx->out_sg, sig_size, ctx->key_size);
 
 	err = crypto_akcipher_encrypt(&req_ctx->child_req);
 	if (err != -EINPROGRESS && err != -EBUSY)
-- 
2.34.1

