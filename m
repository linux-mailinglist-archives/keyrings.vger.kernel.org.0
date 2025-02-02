Return-Path: <keyrings+bounces-2381-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DF0A24FCB
	for <lists+keyrings@lfdr.de>; Sun,  2 Feb 2025 20:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C04D162AFA
	for <lists+keyrings@lfdr.de>; Sun,  2 Feb 2025 19:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C075D1FE470;
	Sun,  2 Feb 2025 19:29:35 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E271FE45E;
	Sun,  2 Feb 2025 19:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738524575; cv=none; b=rrErzmj3WyrxGa9XDr61pYzO9PeBcaTSx2HfySb0UZEB8MD2IGT80MSYZ8Tg0dldTmrxO7Bzt4WcO1UWXzpuJrmAvzOdEAOCcahJkHyBoG48TzmdvJTUXuwSOyFfou03XF1khnbX+edwFpV4BcTwV6l3fApdVfLvvDmHvjJ6KNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738524575; c=relaxed/simple;
	bh=TSj89ljt1rb/GZ73lKsCqaH1NuS5wqb1N5eKBYeBmvM=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=Cw0Ud58Q1AHwiuR8bHuld7DniaFEGfsND4+oACmTpvbedgmZdbU3BNc+gYVG4v2yKex7JTkKh4m19ALWD39DLrWfDpUMhgfmOFfa+Eer2R6PnDLUWDLk1YcNLt+gdhlET18a+g87inbiYqqd5b5lBos01B8mljhWTPhR7JLtRts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 4EE5C10192097;
	Sun,  2 Feb 2025 20:29:29 +0100 (CET)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 20BCC61024FA;
	Sun,  2 Feb 2025 20:29:29 +0100 (CET)
X-Mailbox-Line: From 3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7 Mon Sep 17 00:00:00 2001
Message-ID: <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
In-Reply-To: <cover.1738521533.git.lukas@wunner.de>
References: <cover.1738521533.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sun, 2 Feb 2025 20:00:53 +0100
Subject: [PATCH v2 3/4] crypto: ecdsa - Fix enc/dec size reported by
 KEYCTL_PKEY_QUERY
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>
Cc: David Howells <dhowells@redhat.com>, Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

KEYCTL_PKEY_QUERY system calls for ecdsa keys return the key size as
max_enc_size and max_dec_size, even though such keys cannot be used for
encryption/decryption.  They're exclusively for signature generation or
verification.

Only rsa keys with pkcs1 encoding can also be used for encryption or
decryption.

Return 0 instead for ecdsa keys (as well as ecrdsa keys).

Signed-off-by: Lukas Wunner <lukas@wunner.de>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---
 crypto/asymmetric_keys/public_key.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index bf165d321440..dd44a966947f 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -188,6 +188,8 @@ static int software_key_query(const struct kernel_pkey_params *params,
 	ptr = pkey_pack_u32(ptr, pkey->paramlen);
 	memcpy(ptr, pkey->params, pkey->paramlen);
 
+	memset(info, 0, sizeof(*info));
+
 	if (issig) {
 		sig = crypto_alloc_sig(alg_name, 0, 0);
 		if (IS_ERR(sig)) {
@@ -211,6 +213,9 @@ static int software_key_query(const struct kernel_pkey_params *params,
 			info->supported_ops |= KEYCTL_SUPPORTS_SIGN;
 
 		if (strcmp(params->encoding, "pkcs1") == 0) {
+			info->max_enc_size = len;
+			info->max_dec_size = len;
+
 			info->supported_ops |= KEYCTL_SUPPORTS_ENCRYPT;
 			if (pkey->key_is_private)
 				info->supported_ops |= KEYCTL_SUPPORTS_DECRYPT;
@@ -232,6 +237,8 @@ static int software_key_query(const struct kernel_pkey_params *params,
 		len = crypto_akcipher_maxsize(tfm);
 		info->max_sig_size = len;
 		info->max_data_size = len;
+		info->max_enc_size = len;
+		info->max_dec_size = len;
 
 		info->supported_ops = KEYCTL_SUPPORTS_ENCRYPT;
 		if (pkey->key_is_private)
@@ -239,8 +246,6 @@ static int software_key_query(const struct kernel_pkey_params *params,
 	}
 
 	info->key_size = len * 8;
-	info->max_enc_size = len;
-	info->max_dec_size = len;
 
 	ret = 0;
 
-- 
2.43.0


