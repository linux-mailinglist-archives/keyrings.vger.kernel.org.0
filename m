Return-Path: <keyrings+bounces-2323-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 560139FCD21
	for <lists+keyrings@lfdr.de>; Thu, 26 Dec 2024 19:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D76E2163B1A
	for <lists+keyrings@lfdr.de>; Thu, 26 Dec 2024 18:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C16474E1CA;
	Thu, 26 Dec 2024 18:34:58 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout1.hostsharing.net (mailout1.hostsharing.net [83.223.95.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACB014F11E;
	Thu, 26 Dec 2024 18:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735238098; cv=none; b=OSm+MHMd0eWFSznNpkml23ToR2oUnOeg3gKkBQZSOmQQf1PnctLxL3xifEI8pReNj2s46paotNblk42VwuxumxdDkGalvRJ0IXdFtStmOOj/YwAOlgXi4ewpOhaiyOk5JARdZnDomgTObNXsn4BM74xGZ2KRhkDG5Kg2Y1m5QYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735238098; c=relaxed/simple;
	bh=a/AlMC/EGVib7gOoc8eHGK35m/Yf3H4qE1CyU+v7BBA=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=qQvXy8sO3XqzOOOK9KwtnAjk/a6YwhthR31sDAEOalRn/tegtXbtUUBN7dcfDMUipdFPsevf2zUmU0mTzZoBbB4N528GAbsSU0eMaC5+vX0LGLwUve9hDoimPn3NEUsn/YXvfcxCUc9LhpTmuciNdFCCclkUB3s/78zfWuH0ttI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 7DC4610190FCF;
	Thu, 26 Dec 2024 19:29:30 +0100 (CET)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 456696188CD9;
	Thu, 26 Dec 2024 19:29:30 +0100 (CET)
X-Mailbox-Line: From 0de2a7e0c0f35e468486693a7db2f6e0b0092a64 Mon Sep 17 00:00:00 2001
Message-ID: <0de2a7e0c0f35e468486693a7db2f6e0b0092a64.1735236227.git.lukas@wunner.de>
In-Reply-To: <cover.1735236227.git.lukas@wunner.de>
References: <cover.1735236227.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Thu, 26 Dec 2024 19:08:02 +0100
Subject: [PATCH 2/3] crypto: ecdsa - Fix enc/dec size reported by
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


