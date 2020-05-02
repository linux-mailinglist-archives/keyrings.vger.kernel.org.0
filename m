Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA87D1C234F
	for <lists+keyrings@lfdr.de>; Sat,  2 May 2020 07:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgEBFdt (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Sat, 2 May 2020 01:33:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:39220 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727832AbgEBFdq (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Sat, 2 May 2020 01:33:46 -0400
Received: from sol.hsd1.ca.comcast.net (c-107-3-166-239.hsd1.ca.comcast.net [107.3.166.239])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2451C2495B;
        Sat,  2 May 2020 05:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588397626;
        bh=m9tJRaC/xdkq2x9xEKERQDzme5WlAEgGO8kez0ERpKg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SElL3uHFWuIiPX2XYV1j5cAPwHYTomeoDZNdTWNxvO1T6CViwnDRIzlHoC8yYzrKo
         9vTCU8q8hXm55jXssqRx3kGe3C557tQ6glI3+mdiHo7/f+SYT+yNj5rfM8n+knD9qE
         F2U+IrJH3LqLvKMPwfctO6NrzAGdULBWAaXsY69s=
From:   Eric Biggers <ebiggers@kernel.org>
To:     linux-crypto@vger.kernel.org
Cc:     keyrings@vger.kernel.org
Subject: [PATCH 19/20] KEYS: encrypted: use crypto_shash_tfm_digest()
Date:   Fri,  1 May 2020 22:31:21 -0700
Message-Id: <20200502053122.995648-20-ebiggers@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200502053122.995648-1-ebiggers@kernel.org>
References: <20200502053122.995648-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

Instead of manually allocating a 'struct shash_desc' on the stack and
calling crypto_shash_digest(), switch to using the new helper function
crypto_shash_tfm_digest() which does this for us.

Cc: keyrings@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 security/keys/encrypted-keys/encrypted.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/security/keys/encrypted-keys/encrypted.c b/security/keys/encrypted-keys/encrypted.c
index f6797ba44bf716..14cf81d1a30b14 100644
--- a/security/keys/encrypted-keys/encrypted.c
+++ b/security/keys/encrypted-keys/encrypted.c
@@ -323,19 +323,6 @@ static struct key *request_user_key(const char *master_desc, const u8 **master_k
 	return ukey;
 }
 
-static int calc_hash(struct crypto_shash *tfm, u8 *digest,
-		     const u8 *buf, unsigned int buflen)
-{
-	SHASH_DESC_ON_STACK(desc, tfm);
-	int err;
-
-	desc->tfm = tfm;
-
-	err = crypto_shash_digest(desc, buf, buflen, digest);
-	shash_desc_zero(desc);
-	return err;
-}
-
 static int calc_hmac(u8 *digest, const u8 *key, unsigned int keylen,
 		     const u8 *buf, unsigned int buflen)
 {
@@ -351,7 +338,7 @@ static int calc_hmac(u8 *digest, const u8 *key, unsigned int keylen,
 
 	err = crypto_shash_setkey(tfm, key, keylen);
 	if (!err)
-		err = calc_hash(tfm, digest, buf, buflen);
+		err = crypto_shash_tfm_digest(tfm, buf, buflen, digest);
 	crypto_free_shash(tfm);
 	return err;
 }
@@ -381,7 +368,8 @@ static int get_derived_key(u8 *derived_key, enum derived_key_type key_type,
 
 	memcpy(derived_buf + strlen(derived_buf) + 1, master_key,
 	       master_keylen);
-	ret = calc_hash(hash_tfm, derived_key, derived_buf, derived_buf_len);
+	ret = crypto_shash_tfm_digest(hash_tfm, derived_buf, derived_buf_len,
+				      derived_key);
 	kzfree(derived_buf);
 	return ret;
 }
-- 
2.26.2

