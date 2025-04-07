Return-Path: <keyrings+bounces-2606-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFEDA7EDBC
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 21:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B5733A5682
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 19:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3EF4215767;
	Mon,  7 Apr 2025 19:42:16 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD56B20FAB3;
	Mon,  7 Apr 2025 19:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744054936; cv=none; b=iqf2Kc/GTlyI0cPZAh8mTOxeDSH1pIth9CtHCmkN05YdNz6adi5kvSl4jYhx+pumoFVLLHn1IIFKOD0/JLQ8AXDb2Jf0jQvV+924n9h9qdREmu9+MEX7apRRdqVf7F4H4kjln/MFTzhuE54VAG2vZ/2dulnr4HNDopmhPxfq9r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744054936; c=relaxed/simple;
	bh=C9vruh3Rlek9AoBYYbF9G4l/rIzgZBBHHg1YF9Zd84Y=;
	h=Message-Id:In-Reply-To:References:From:Date:Subject:To:Cc; b=MOody/83QenbRrFJ2j3liLQS5cXq3S67ljUjwAFxug4FyFOqfvNGAC7ZTip1wX3bBL6novircxosOseBjYNCDa6jYRMECDFqYDuBxWJyl3H/NfA5tt9NhqGDRUnbDE+cHZiJ41Roz6pqGieEjHVS1NGzRI/3YE+zdF3bSLhJyAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id DBCE9200B075;
	Mon,  7 Apr 2025 21:41:44 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 9A1343278A; Mon,  7 Apr 2025 21:42:04 +0200 (CEST)
Message-Id: <831608e465078cdcd3a8e74d6dfd85e77b2083a8.1744052920.git.lukas@wunner.de>
In-Reply-To: <cover.1744052920.git.lukas@wunner.de>
References: <cover.1744052920.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 7 Apr 2025 21:32:41 +0200
Subject: [PATCH RESEND v2 1/2] crypto: ecdsa - Fix enc/dec size reported by
 KEYCTL_PKEY_QUERY
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Cc: David Howells <dhowells@redhat.com>, Ignat Korchagin <ignat@cloudflare.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
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
index bf165d3..dd44a96 100644
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


