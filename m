Return-Path: <keyrings+bounces-2247-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF449A94F0
	for <lists+keyrings@lfdr.de>; Tue, 22 Oct 2024 02:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 622F11F23A5D
	for <lists+keyrings@lfdr.de>; Tue, 22 Oct 2024 00:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7563D14659B;
	Tue, 22 Oct 2024 00:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="Ot4Y5SBU"
X-Original-To: keyrings@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C2013AD03;
	Tue, 22 Oct 2024 00:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729556691; cv=none; b=RZimLw4E5SLUh6iXYOkoYsk13WpxmHAxf4QgbzmThJjzBvuzjU4QVaPOjjMaCZkeJ/hw9Uk03Eeq6383sFnbwL2Mk3GFbCq8ITS4cE29aMSpHc0EdHZzDbxWqlnVZqdsV0e27zA/Hbyst3WvoTFSwc6beATxh7hKxjmcnnwJZUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729556691; c=relaxed/simple;
	bh=vMH9VCwQtrLI7UDdx5ib7nbtDgkV2HtKvwzw7bSnPDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RR6FYeVThrxhMoYX0TH9xcLzXynNkJg/b0QcvWou3NsfUV613I9P9HtclHitIxka2tFgx+MCBJjSI3zEFDjXMIQkdGjd/CxrL/Cm3i1BpwUurVcEACohXRzTywN69p2xrbGXAbcSClyNux99u/u0PsyOr8dZz6L8AmHHoAgqSkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=Ot4Y5SBU; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=Tk6oAAwPJntEXIhuJYYHoX1PvnM7rp6COgmhCQKFqkU=; b=Ot4Y5SBUvCERv13Y
	NGUcjKkMmK70E7OkfC2v+1P3e1974wNzqtqHbSJRr13jMSahjNn9qT9nA/L02EMjKZagwXQuR934m
	DtP+1IztCs0HszLChQR8i2xrfwnnPI72Z+TOE/Y+MAJOihIgjcI7w8FXCLO5zXQifxzvahsl22SUo
	mx4+L6CDVGqmHxCr6y1GmAKaRVOV2j1BYplvHAKcYtpQSStKLuHVlv/QbolGp3BC1twamaLCkOknw
	3w9IU1X9awZ08QXtRGCrSQTQhvAet0emeron3Ct15NEoSzJkVE8GMvStLAxfHC6XpE5qzRSwrYKLD
	2BszGgy/BZy6hu8AVQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1t32hP-00CeFL-2h;
	Tue, 22 Oct 2024 00:24:35 +0000
From: linux@treblig.org
To: dhowells@redhat.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net
Cc: keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] crypto: Remove unused asymmetric_keys functions
Date: Tue, 22 Oct 2024 01:24:34 +0100
Message-ID: <20241022002434.302518-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

encrypt_blob(), decrypt_blob() and create_signature() were some of the
functions added in 2018 by
commit 5a30771832aa ("KEYS: Provide missing asymmetric key subops for new
key type ops [ver #2]")
however, they've not been used.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 crypto/asymmetric_keys/signature.c | 63 ------------------------------
 include/crypto/public_key.h        |  3 --
 2 files changed, 66 deletions(-)

diff --git a/crypto/asymmetric_keys/signature.c b/crypto/asymmetric_keys/signature.c
index 2deff81f8af5..041d04b5c953 100644
--- a/crypto/asymmetric_keys/signature.c
+++ b/crypto/asymmetric_keys/signature.c
@@ -64,69 +64,6 @@ int query_asymmetric_key(const struct kernel_pkey_params *params,
 }
 EXPORT_SYMBOL_GPL(query_asymmetric_key);
 
-/**
- * encrypt_blob - Encrypt data using an asymmetric key
- * @params: Various parameters
- * @data: Data blob to be encrypted, length params->data_len
- * @enc: Encrypted data buffer, length params->enc_len
- *
- * Encrypt the specified data blob using the private key specified by
- * params->key.  The encrypted data is wrapped in an encoding if
- * params->encoding is specified (eg. "pkcs1").
- *
- * Returns the length of the data placed in the encrypted data buffer or an
- * error.
- */
-int encrypt_blob(struct kernel_pkey_params *params,
-		 const void *data, void *enc)
-{
-	params->op = kernel_pkey_encrypt;
-	return asymmetric_key_eds_op(params, data, enc);
-}
-EXPORT_SYMBOL_GPL(encrypt_blob);
-
-/**
- * decrypt_blob - Decrypt data using an asymmetric key
- * @params: Various parameters
- * @enc: Encrypted data to be decrypted, length params->enc_len
- * @data: Decrypted data buffer, length params->data_len
- *
- * Decrypt the specified data blob using the private key specified by
- * params->key.  The decrypted data is wrapped in an encoding if
- * params->encoding is specified (eg. "pkcs1").
- *
- * Returns the length of the data placed in the decrypted data buffer or an
- * error.
- */
-int decrypt_blob(struct kernel_pkey_params *params,
-		 const void *enc, void *data)
-{
-	params->op = kernel_pkey_decrypt;
-	return asymmetric_key_eds_op(params, enc, data);
-}
-EXPORT_SYMBOL_GPL(decrypt_blob);
-
-/**
- * create_signature - Sign some data using an asymmetric key
- * @params: Various parameters
- * @data: Data blob to be signed, length params->data_len
- * @enc: Signature buffer, length params->enc_len
- *
- * Sign the specified data blob using the private key specified by params->key.
- * The signature is wrapped in an encoding if params->encoding is specified
- * (eg. "pkcs1").  If the encoding needs to know the digest type, this can be
- * passed through params->hash_algo (eg. "sha1").
- *
- * Returns the length of the data placed in the signature buffer or an error.
- */
-int create_signature(struct kernel_pkey_params *params,
-		     const void *data, void *enc)
-{
-	params->op = kernel_pkey_sign;
-	return asymmetric_key_eds_op(params, data, enc);
-}
-EXPORT_SYMBOL_GPL(create_signature);
-
 /**
  * verify_signature - Initiate the use of an asymmetric key to verify a signature
  * @key: The asymmetric key to verify against
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index b7f308977c84..81098e00c08f 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -104,9 +104,6 @@ static inline int restrict_link_by_digsig(struct key *dest_keyring,
 extern int query_asymmetric_key(const struct kernel_pkey_params *,
 				struct kernel_pkey_query *);
 
-extern int encrypt_blob(struct kernel_pkey_params *, const void *, void *);
-extern int decrypt_blob(struct kernel_pkey_params *, const void *, void *);
-extern int create_signature(struct kernel_pkey_params *, const void *, void *);
 extern int verify_signature(const struct key *,
 			    const struct public_key_signature *);
 
-- 
2.47.0


