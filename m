Return-Path: <keyrings+bounces-1961-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B56973B4D
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 17:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AFE91F25CAA
	for <lists+keyrings@lfdr.de>; Tue, 10 Sep 2024 15:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A7B9199920;
	Tue, 10 Sep 2024 15:17:30 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [83.223.78.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CB519148A;
	Tue, 10 Sep 2024 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725981450; cv=none; b=jLPD/CEecFOIcPUve85iFp1eLHQY/XagBAuFR10+oBzhckAeYNw4+ZkKXrijUeI23GwjklamlQUaeX9d2SonjDeVJGePxOnNOt0qYaKiQb9p6VBqaBgC58sJvhWVnCZwJyvz+c3f5zBrvBlFTiGNuxQ2Pw4Tex9spKU6GVHF3BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725981450; c=relaxed/simple;
	bh=Gi+Q/AV1v5Y/ztmHc2sJbwehokd/kp0j1jeKqkqp4Jk=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=hccKY+WhH2pZpF4CTCriPhJv2GvBSTdbLgOqPn4RCiP8Tof5BdWDCW5RUwJo/8XlI493JLA3kzOI+obw1xxVvgy4kzoCK0TbmTtzGBcqj6wr8ohzVrydnIyIo9qd1ZKueT9xUctFaTKeCZSZEmX2TuMCZ7fXhDHhwswadPX0Tbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.78.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 37B5A103228DC;
	Tue, 10 Sep 2024 17:17:26 +0200 (CEST)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 0A4B760A8B01;
	Tue, 10 Sep 2024 17:17:26 +0200 (CEST)
X-Mailbox-Line: From 6335b292d716bad2ebfe5947f95723c3cfb1e040 Mon Sep 17 00:00:00 2001
Message-ID: <6335b292d716bad2ebfe5947f95723c3cfb1e040.1725972335.git.lukas@wunner.de>
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Tue, 10 Sep 2024 16:30:19 +0200
Subject: [PATCH v2 09/19] crypto: virtio - Drop sign/verify operations
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@google.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, Tadeusz Struk <tstruk@gigaio.com>
Cc: David Howells <dhowells@redhat.com>, Andrew Zaborowski <andrew.zaborowski@intel.com>, Saulo Alessandre <saulo.alessandre@tse.jus.br>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Ignat Korchagin <ignat@cloudflare.com>, Marek Behun <kabel@kernel.org>, Varad Gautam <varadgautam@google.com>, Stephan Mueller <smueller@chronox.de>, Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org, Gonglei <arei.gonglei@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Eugenio Perez <eperezma@redhat.com>, virtualization@lists.linux.dev, zhenwei pi <pizhenwei@bytedance.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

The virtio crypto driver exposes akcipher sign/verify operations in a
user space ABI.  This blocks removal of sign/verify from akcipher_alg.

Herbert opines:

   "I would say that this is something that we can break.  Breaking it
    is no different to running virtio on a host that does not support
    these algorithms.  After all, a software implementation must always
    be present.

    I deliberately left akcipher out of crypto_user because the API
    is still in flux.  We should not let virtio constrain ourselves."
    https://lore.kernel.org/all/ZtqoNAgcnXnrYhZZ@gondor.apana.org.au/

   "I would remove virtio akcipher support in its entirety.  This API
    was never meant to be exposed outside of the kernel."
    https://lore.kernel.org/all/Ztqql_gqgZiMW8zz@gondor.apana.org.au/

Drop sign/verify support from virtio crypto.  There's no strong reason
to also remove encrypt/decrypt support, so keep it.

A key selling point of virtio crypto is to allow guest access to crypto
accelerators on the host.  So far the only akcipher algorithm supported
by virtio crypto is RSA.  Dropping sign/verify merely means that the
PKCS#1 padding is now always generated or verified inside the guest,
but the actual signature generation/verification (which is an RSA
decrypt/encrypt operation) may still use an accelerator on the host.

Generating or verifying the PKCS#1 padding is cheap, so a hardware
accelerator won't be of much help there.  Which begs the question
whether virtio crypto support for sign/verify makes sense at all.

It would make sense for the sign operation if the host has a security
chip to store asymmetric private keys.  But the kernel doesn't even
have an asymmetric_key_subtype yet for hardware-based private keys.
There's at least one rudimentary driver for such chips (atmel-ecc.c for
ATECC508A), but it doesn't implement the sign operation.  The kernel
would first have to grow support for a hardware asymmetric_key_subtype
and at least one driver implementing the sign operation before exposure
to guests via virtio makes sense.

Signed-off-by: Lukas Wunner <lukas@wunner.de>
---
 .../virtio/virtio_crypto_akcipher_algs.c      | 65 ++++++-------------
 include/uapi/linux/virtio_crypto.h            |  1 +
 2 files changed, 22 insertions(+), 44 deletions(-)

diff --git a/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c b/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
index cb92b7fa99c6..48fee07b7e51 100644
--- a/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
+++ b/drivers/crypto/virtio/virtio_crypto_akcipher_algs.c
@@ -83,23 +83,16 @@ static void virtio_crypto_dataq_akcipher_callback(struct virtio_crypto_request *
 	case VIRTIO_CRYPTO_BADMSG:
 		error = -EBADMSG;
 		break;
-
-	case VIRTIO_CRYPTO_KEY_REJECTED:
-		error = -EKEYREJECTED;
-		break;
-
 	default:
 		error = -EIO;
 		break;
 	}
 
 	akcipher_req = vc_akcipher_req->akcipher_req;
-	if (vc_akcipher_req->opcode != VIRTIO_CRYPTO_AKCIPHER_VERIFY) {
-		/* actuall length maybe less than dst buffer */
-		akcipher_req->dst_len = len - sizeof(vc_req->status);
-		sg_copy_from_buffer(akcipher_req->dst, sg_nents(akcipher_req->dst),
-				    vc_akcipher_req->dst_buf, akcipher_req->dst_len);
-	}
+	/* actual length maybe less than dst buffer */
+	akcipher_req->dst_len = len - sizeof(vc_req->status);
+	sg_copy_from_buffer(akcipher_req->dst, sg_nents(akcipher_req->dst),
+			    vc_akcipher_req->dst_buf, akcipher_req->dst_len);
 	virtio_crypto_akcipher_finalize_req(vc_akcipher_req, akcipher_req, error);
 }
 
@@ -230,36 +223,27 @@ static int __virtio_crypto_akcipher_do_req(struct virtio_crypto_akcipher_request
 	int node = dev_to_node(&vcrypto->vdev->dev);
 	unsigned long flags;
 	int ret;
-	bool verify = vc_akcipher_req->opcode == VIRTIO_CRYPTO_AKCIPHER_VERIFY;
-	unsigned int src_len = verify ? req->src_len + req->dst_len : req->src_len;
 
 	/* out header */
 	sg_init_one(&outhdr_sg, req_data, sizeof(*req_data));
 	sgs[num_out++] = &outhdr_sg;
 
 	/* src data */
-	src_buf = kcalloc_node(src_len, 1, GFP_KERNEL, node);
+	src_buf = kcalloc_node(req->src_len, 1, GFP_KERNEL, node);
 	if (!src_buf)
 		return -ENOMEM;
 
-	if (verify) {
-		/* for verify operation, both src and dst data work as OUT direction */
-		sg_copy_to_buffer(req->src, sg_nents(req->src), src_buf, src_len);
-		sg_init_one(&srcdata_sg, src_buf, src_len);
-		sgs[num_out++] = &srcdata_sg;
-	} else {
-		sg_copy_to_buffer(req->src, sg_nents(req->src), src_buf, src_len);
-		sg_init_one(&srcdata_sg, src_buf, src_len);
-		sgs[num_out++] = &srcdata_sg;
+	sg_copy_to_buffer(req->src, sg_nents(req->src), src_buf, req->src_len);
+	sg_init_one(&srcdata_sg, src_buf, req->src_len);
+	sgs[num_out++] = &srcdata_sg;
 
-		/* dst data */
-		dst_buf = kcalloc_node(req->dst_len, 1, GFP_KERNEL, node);
-		if (!dst_buf)
-			goto free_src;
+	/* dst data */
+	dst_buf = kcalloc_node(req->dst_len, 1, GFP_KERNEL, node);
+	if (!dst_buf)
+		goto free_src;
 
-		sg_init_one(&dstdata_sg, dst_buf, req->dst_len);
-		sgs[num_out + num_in++] = &dstdata_sg;
-	}
+	sg_init_one(&dstdata_sg, dst_buf, req->dst_len);
+	sgs[num_out + num_in++] = &dstdata_sg;
 
 	vc_akcipher_req->src_buf = src_buf;
 	vc_akcipher_req->dst_buf = dst_buf;
@@ -352,16 +336,6 @@ static int virtio_crypto_rsa_decrypt(struct akcipher_request *req)
 	return virtio_crypto_rsa_req(req, VIRTIO_CRYPTO_AKCIPHER_DECRYPT);
 }
 
-static int virtio_crypto_rsa_sign(struct akcipher_request *req)
-{
-	return virtio_crypto_rsa_req(req, VIRTIO_CRYPTO_AKCIPHER_SIGN);
-}
-
-static int virtio_crypto_rsa_verify(struct akcipher_request *req)
-{
-	return virtio_crypto_rsa_req(req, VIRTIO_CRYPTO_AKCIPHER_VERIFY);
-}
-
 static int virtio_crypto_rsa_set_key(struct crypto_akcipher *tfm,
 				     const void *key,
 				     unsigned int keylen,
@@ -524,16 +498,19 @@ static struct virtio_crypto_akcipher_algo virtio_crypto_akcipher_algs[] = {
 		.algo.base = {
 			.encrypt = virtio_crypto_rsa_encrypt,
 			.decrypt = virtio_crypto_rsa_decrypt,
-			.sign = virtio_crypto_rsa_sign,
-			.verify = virtio_crypto_rsa_verify,
+			/*
+			 * Must specify an arbitrary hash algorithm upon
+			 * set_{pub,priv}_key (even though it's not used
+			 * by encrypt/decrypt) because qemu checks for it.
+			 */
 			.set_pub_key = virtio_crypto_p1pad_rsa_sha1_set_pub_key,
 			.set_priv_key = virtio_crypto_p1pad_rsa_sha1_set_priv_key,
 			.max_size = virtio_crypto_rsa_max_size,
 			.init = virtio_crypto_rsa_init_tfm,
 			.exit = virtio_crypto_rsa_exit_tfm,
 			.base = {
-				.cra_name = "pkcs1pad(rsa,sha1)",
-				.cra_driver_name = "virtio-pkcs1-rsa-with-sha1",
+				.cra_name = "pkcs1pad(rsa)",
+				.cra_driver_name = "virtio-pkcs1-rsa",
 				.cra_priority = 150,
 				.cra_module = THIS_MODULE,
 				.cra_ctxsize = sizeof(struct virtio_crypto_akcipher_ctx),
diff --git a/include/uapi/linux/virtio_crypto.h b/include/uapi/linux/virtio_crypto.h
index 71a54a6849ca..2fccb64c9d6b 100644
--- a/include/uapi/linux/virtio_crypto.h
+++ b/include/uapi/linux/virtio_crypto.h
@@ -329,6 +329,7 @@ struct virtio_crypto_op_header {
 	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x00)
 #define VIRTIO_CRYPTO_AKCIPHER_DECRYPT \
 	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x01)
+	/* akcipher sign/verify opcodes are deprecated */
 #define VIRTIO_CRYPTO_AKCIPHER_SIGN \
 	VIRTIO_CRYPTO_OPCODE(VIRTIO_CRYPTO_SERVICE_AKCIPHER, 0x02)
 #define VIRTIO_CRYPTO_AKCIPHER_VERIFY \
-- 
2.43.0


