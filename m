Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 201774931AC
	for <lists+keyrings@lfdr.de>; Wed, 19 Jan 2022 01:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350360AbiASAPA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 18 Jan 2022 19:15:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346916AbiASAO6 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 18 Jan 2022 19:14:58 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6027C061574;
        Tue, 18 Jan 2022 16:14:57 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 74DAE6149D;
        Wed, 19 Jan 2022 00:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA452C340E0;
        Wed, 19 Jan 2022 00:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642551296;
        bh=QtK9vZtfEtGk5fagKyEwFJSB/y/naDXkPKnDDSOiCPo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j2ZPqEz1n4HUm2aAfyLvThBNUnF8JoL0A18xK2EoX2tEFXbL3bgkCqHMi8FZAEg0d
         sCYQsVlQNc0bl7OsDACdDuV4hxjX724OZogqTf7oIMK+MMgxtrfSZWEnz88vWJD3vm
         eZTJ+K4l4KetygupUjVm4JM4z/Swv9y3PZD4ylgyPtm1MgZG1JOxn+RSzpiQQrAZtc
         ngFLCdhuKQA6K9tsvrg+fUxFxHt8mUtINumzCO9HIhJzVRuiQv6A+79SGrou0uhzFy
         D6Nh9P63lPzebUADuTAxZIzlDSz7PGQfkofoXRUUENvcogQnRuo5eqfEwvYReruQG4
         tONbr/Mw/9MRg==
From:   Eric Biggers <ebiggers@kernel.org>
To:     linux-crypto@vger.kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc:     keyrings@vger.kernel.org, Vitaly Chikunov <vt@altlinux.org>,
        Denis Kenzior <denkenz@gmail.com>
Subject: [PATCH v2 5/5] crypto: rsa-pkcs1pad - use clearer variable names
Date:   Tue, 18 Jan 2022 16:13:06 -0800
Message-Id: <20220119001306.85355-6-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220119001306.85355-1-ebiggers@kernel.org>
References: <20220119001306.85355-1-ebiggers@kernel.org>
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
index 9d804831c8b3f..3285e3af43e14 100644
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
-	    !ctx->key_size || req->src_len != ctx->key_size)
+	if (WARN_ON(req->dst) || WARN_ON(!digest_size) ||
+	    !ctx->key_size || sig_size != ctx->key_size)
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

