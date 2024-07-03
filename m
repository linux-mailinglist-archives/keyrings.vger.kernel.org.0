Return-Path: <keyrings+bounces-1672-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B30419260F5
	for <lists+keyrings@lfdr.de>; Wed,  3 Jul 2024 14:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 406CD1F22EB5
	for <lists+keyrings@lfdr.de>; Wed,  3 Jul 2024 12:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD90179953;
	Wed,  3 Jul 2024 12:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="pzDjb0Bh"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDBB1791EF
	for <keyrings@vger.kernel.org>; Wed,  3 Jul 2024 12:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720011254; cv=none; b=HdaKO7mYCf8Yt8j1X6IHt8ds1vfHW0/YzdAyEBIQ//PXa+rcQ0LhFl9SzjoJoYFBhzbISk1kSObkmxj5ggzkPP+3GQmbR+lD3dF7/ZmqkZ3RPk9ZVbUEuMdl5HCC7xoSGJt8TTbtF8q6Vf/+8QMZCrz5Kko2or9blVnwJG9KxUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720011254; c=relaxed/simple;
	bh=ej4DRPK0/rYZog3eIJb7t75rQM0X53llNTBRXQWgPLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BoBTWS8qNHCo/FJzke/qiek704NxJJBxwQdtyJZsyH0sPggNVZh0HlaifH/cy3OB5zgD2npF5bhp1JZeEDa/tvzIv9RVANtVrAfMpVe2BYwBCSG5YDEQDSWrQibP+g0JrlCPd4Spb2smgY+hlWOtXOh7YuReriqLsWluAJTplU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=pzDjb0Bh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-361785bfa71so3694687f8f.2
        for <keyrings@vger.kernel.org>; Wed, 03 Jul 2024 05:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1720011249; x=1720616049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogZkpiiKmUATBh2P81264pdDXZ4qUG+ZRQsmJgTVO3k=;
        b=pzDjb0BhgBglNJt+nB9q5tIdc5qvg8mBaV5P+q2TbwHDYO2HFZhJS8OHeTQsadQrU9
         S0SoJQZfmbGpl3Pfo2TdyoS1SyUnQ0EBot6yMwFYOdFXX93Xz4xaqTq2wH6y2LDwmyT3
         QQ980iPI5y2ifYorHKQdlMvXTqUtxjKdhwpqvSkW8iiLDS3icpb0YyibWaUYS0gxwcNo
         CAeGgPwh+g1i35I+GxaoruzkoXNAQdDEDV9/vlP7p4XB1jK91TuA57nRmvF/GtmFkA1d
         4XrySlj7z4bEfcKLnaWyTsE2SyESScMU20sYwkL5gIZoDimJDKCGtZTG3aYLEbPNBvg0
         Sg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720011249; x=1720616049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogZkpiiKmUATBh2P81264pdDXZ4qUG+ZRQsmJgTVO3k=;
        b=QbF3pYyVPpMmOuJf4kXYkqBSZuMqVeqXMsWdp/teqPxa8Fh7juhGPH1oEHptLBp2El
         JhZjj1z8A/X14bKsXmjdovsPXFa5Pq3iLKu8zaFX+v4GCzecTD0T3bKMYvkayjX54Ajn
         J/3LvQMsmKHMqOC6qzhG3iCIQ3t8cmrJ+JGVnaN+fSxY+KX1G81CpEbhdEOFf5D3cxgh
         wnsyo0Bg9xB5HxrrXazfN4mNuQSMNiIbSSMy6tg7do/aFDQwZjyY1vTkKBVzTjr2TmjH
         Yczhqwxm/9m51udAU5mflr4N+9ezdf3R8PsMH104L6tKtXyebI1ivbUDqpmyu8Qgq9J4
         itAA==
X-Forwarded-Encrypted: i=1; AJvYcCWD6KUJRW1/2ze6NRklptlFck+5AWzCUTRFOmRKMA57WJRFrOS1jUqfgJP3+FR8d2olDhZQS48wYEBg5D/ZNkPEwOGqU+7pHUE=
X-Gm-Message-State: AOJu0YymM13pW48JNBdYLjP61IRNZosKgJFW+7qSozjPCQh7EKmmyl0f
	IOuuOy4q/6FShm74kWSLJRg4qCbrliocjbxBp+CgTnwljyH0SnOhsdiJnim4qaw=
X-Google-Smtp-Source: AGHT+IF0v/eZhOIu9x1sxCmfokLUMTeBD5wN6QOfncceonScPm4movN63YwShRHYE2qtmSUJ0jf9uw==
X-Received: by 2002:adf:a395:0:b0:367:8383:6305 with SMTP id ffacd0b85a97d-367838364e4mr2581253f8f.55.1720011249184;
        Wed, 03 Jul 2024 05:54:09 -0700 (PDT)
Received: from localhost ([82.150.214.1])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-36792881856sm1791613f8f.6.2024.07.03.05.54.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 05:54:09 -0700 (PDT)
From: David Gstir <david@sigma-star.at>
To: sigma star Kernel Team <upstream+dcp@sigma-star.at>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>,
	Richard Weinberger <richard@nod.at>
Cc: linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Gstir <david@sigma-star.at>
Subject: [PATCH 2/2] KEYS: trusted: dcp: fix leak of blob encryption key
Date: Wed,  3 Jul 2024 14:53:53 +0200
Message-ID: <20240703125353.46115-2-david@sigma-star.at>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703125353.46115-1-david@sigma-star.at>
References: <20240703125353.46115-1-david@sigma-star.at>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trusted keys unseal the key blob on load, but keep the sealed payload in
the blob field so that every subsequent read (export) will simply
convert this field to hex and send it to userspace.

With DCP-based trusted keys, we decrypt the blob encryption key (BEK)
in the Kernel due hardware limitations and then decrypt the blob payload.
BEK decryption is done in-place which means that the trusted key blob
field is modified and it consequently holds the BEK in plain text.
Every subsequent read of that key thus send the plain text BEK instead
of the encrypted BEK to userspace.

This issue only occurs when importing a trusted DCP-based key and
then exporting it again. This should rarely happen as the common use cases
are to either create a new trusted key and export it, or import a key
blob and then just use it without exporting it again.

Fix this by performing BEK decryption and encryption in a dedicated
buffer. Further always wipe the plain text BEK buffer to prevent leaking
the key via uninitialized memory.

Signed-off-by: David Gstir <david@sigma-star.at>
Fixes: 2e8a0f40a39c ("KEYS: trusted: Introduce NXP DCP-backed trusted keys")
---
 security/keys/trusted-keys/trusted_dcp.c | 33 +++++++++++++++---------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/security/keys/trusted-keys/trusted_dcp.c b/security/keys/trusted-keys/trusted_dcp.c
index b0947f072a98..4edc5bbbcda3 100644
--- a/security/keys/trusted-keys/trusted_dcp.c
+++ b/security/keys/trusted-keys/trusted_dcp.c
@@ -186,20 +186,21 @@ static int do_aead_crypto(u8 *in, u8 *out, size_t len, u8 *key, u8 *nonce,
 	return ret;
 }
 
-static int decrypt_blob_key(u8 *key)
+static int decrypt_blob_key(u8 *encrypted_key, u8 *plain_key)
 {
-	return do_dcp_crypto(key, key, false);
+	return do_dcp_crypto(encrypted_key, plain_key, false);
 }
 
-static int encrypt_blob_key(u8 *key)
+static int encrypt_blob_key(u8 *plain_key, u8 *encrypted_key)
 {
-	return do_dcp_crypto(key, key, true);
+	return do_dcp_crypto(plain_key, encrypted_key, true);
 }
 
 static int trusted_dcp_seal(struct trusted_key_payload *p, char *datablob)
 {
 	struct dcp_blob_fmt *b = (struct dcp_blob_fmt *)p->blob;
 	int blen, ret;
+	u8 plain_blob_key[AES_KEYSIZE_128];
 
 	blen = calc_blob_len(p->key_len);
 	if (blen > MAX_BLOB_SIZE)
@@ -207,30 +208,36 @@ static int trusted_dcp_seal(struct trusted_key_payload *p, char *datablob)
 
 	b->fmt_version = DCP_BLOB_VERSION;
 	get_random_bytes(b->nonce, AES_KEYSIZE_128);
-	get_random_bytes(b->blob_key, AES_KEYSIZE_128);
+	get_random_bytes(plain_blob_key, AES_KEYSIZE_128);
 
-	ret = do_aead_crypto(p->key, b->payload, p->key_len, b->blob_key,
+	ret = do_aead_crypto(p->key, b->payload, p->key_len, plain_blob_key,
 			     b->nonce, true);
 	if (ret) {
 		pr_err("Unable to encrypt blob payload: %i\n", ret);
-		return ret;
+		goto out;
 	}
 
-	ret = encrypt_blob_key(b->blob_key);
+	ret = encrypt_blob_key(plain_blob_key, b->blob_key);
 	if (ret) {
 		pr_err("Unable to encrypt blob key: %i\n", ret);
-		return ret;
+		goto out;
 	}
 
 	put_unaligned_le32(p->key_len, &b->payload_len);
 	p->blob_len = blen;
-	return 0;
+	ret = 0;
+
+out:
+	memzero_explicit(plain_blob_key, sizeof(plain_blob_key));
+
+	return ret;
 }
 
 static int trusted_dcp_unseal(struct trusted_key_payload *p, char *datablob)
 {
 	struct dcp_blob_fmt *b = (struct dcp_blob_fmt *)p->blob;
 	int blen, ret;
+	u8 plain_blob_key[AES_KEYSIZE_128];
 
 	if (b->fmt_version != DCP_BLOB_VERSION) {
 		pr_err("DCP blob has bad version: %i, expected %i\n",
@@ -248,14 +255,14 @@ static int trusted_dcp_unseal(struct trusted_key_payload *p, char *datablob)
 		goto out;
 	}
 
-	ret = decrypt_blob_key(b->blob_key);
+	ret = decrypt_blob_key(b->blob_key, plain_blob_key);
 	if (ret) {
 		pr_err("Unable to decrypt blob key: %i\n", ret);
 		goto out;
 	}
 
 	ret = do_aead_crypto(b->payload, p->key, p->key_len + DCP_BLOB_AUTHLEN,
-			     b->blob_key, b->nonce, false);
+			     plain_blob_key, b->nonce, false);
 	if (ret) {
 		pr_err("Unwrap of DCP payload failed: %i\n", ret);
 		goto out;
@@ -263,6 +270,8 @@ static int trusted_dcp_unseal(struct trusted_key_payload *p, char *datablob)
 
 	ret = 0;
 out:
+	memzero_explicit(plain_blob_key, sizeof(plain_blob_key));
+
 	return ret;
 }
 
-- 
2.35.3


