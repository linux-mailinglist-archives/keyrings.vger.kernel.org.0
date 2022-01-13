Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E02848E14C
	for <lists+keyrings@lfdr.de>; Fri, 14 Jan 2022 00:56:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238303AbiAMX4d (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 13 Jan 2022 18:56:33 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:50072 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238256AbiAMX4c (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 13 Jan 2022 18:56:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 70BDE61D0E;
        Thu, 13 Jan 2022 23:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C32C36AF3;
        Thu, 13 Jan 2022 23:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642118191;
        bh=OYwT1/oic13UOKNCipi3UaLYBkRKybjJlJF3WtRhuG4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RvWoRghf90qh2LA7WNHy1/8tcMzHX8zcw/Gmsa/qP/q8lePpPoEW9GtFkmjQW9bd5
         JFAotM4xGK02KKcpmZAJ0fKSUm5hMcoAEvNtILJJbvljTSXpZ6yk1i0CZ3ctTiygpu
         tP2mzFLJdsViO3WAQhkfl6bckXDCDLpM72JAa1EdwgBKX42bI4WznUgtSlcMUBzKa8
         xtOh0FXxUQrp2KC0m2VfNWN5Nauo9v1U4fzanbtNrTQmuHfgHD5Fezy+tUAhu5ubFa
         NuxucdotQX2gwrucH5fRRPepv27AY5ta6rRX18OYpb4ke5KGKRDUFuNX4F4/x/DW3F
         7vuiOnsp1SN9A==
From:   Eric Biggers <ebiggers@kernel.org>
To:     keyrings@vger.kernel.org, David Howells <dhowells@redhat.com>,
        Jarkko Sakkinen <jarkko@kernel.org>
Cc:     Denis Kenzior <denkenz@gmail.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        James Morris <james.morris@microsoft.com>,
        linux-crypto@vger.kernel.org
Subject: [PATCH 3/3] KEYS: asym_tpm: rename derive_pub_key()
Date:   Thu, 13 Jan 2022 15:54:40 -0800
Message-Id: <20220113235440.90439-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113235440.90439-1-ebiggers@kernel.org>
References: <20220113235440.90439-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Eric Biggers <ebiggers@google.com>

derive_pub_key() doesn't actually derive a key; it just formats one.
Rename it accordingly.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/asymmetric_keys/asym_tpm.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/crypto/asymmetric_keys/asym_tpm.c b/crypto/asymmetric_keys/asym_tpm.c
index 2e365a221fbe..d2e0036d34a5 100644
--- a/crypto/asymmetric_keys/asym_tpm.c
+++ b/crypto/asymmetric_keys/asym_tpm.c
@@ -336,7 +336,7 @@ static inline uint8_t *encode_tag_length(uint8_t *buf, uint8_t tag,
 	return buf + 3;
 }
 
-static uint32_t derive_pub_key(const void *pub_key, uint32_t len, uint8_t *buf)
+static uint32_t format_pub_key(const void *pub_key, uint32_t len, uint8_t *buf)
 {
 	uint8_t *cur = buf;
 	uint32_t n_len = definite_length(len) + 1 + len + 1;
@@ -409,7 +409,7 @@ static int tpm_key_query(const struct kernel_pkey_params *params,
 	if (IS_ERR(tfm))
 		return PTR_ERR(tfm);
 
-	der_pub_key_len = derive_pub_key(tk->pub_key, tk->pub_key_len,
+	der_pub_key_len = format_pub_key(tk->pub_key, tk->pub_key_len,
 					 der_pub_key);
 
 	ret = crypto_akcipher_set_pub_key(tfm, der_pub_key, der_pub_key_len);
@@ -463,7 +463,7 @@ static int tpm_key_encrypt(struct tpm_key *tk,
 	if (IS_ERR(tfm))
 		return PTR_ERR(tfm);
 
-	der_pub_key_len = derive_pub_key(tk->pub_key, tk->pub_key_len,
+	der_pub_key_len = format_pub_key(tk->pub_key, tk->pub_key_len,
 					 der_pub_key);
 
 	ret = crypto_akcipher_set_pub_key(tfm, der_pub_key, der_pub_key_len);
@@ -758,7 +758,7 @@ static int tpm_key_verify_signature(const struct key *key,
 	if (IS_ERR(tfm))
 		return PTR_ERR(tfm);
 
-	der_pub_key_len = derive_pub_key(tk->pub_key, tk->pub_key_len,
+	der_pub_key_len = format_pub_key(tk->pub_key, tk->pub_key_len,
 					 der_pub_key);
 
 	ret = crypto_akcipher_set_pub_key(tfm, der_pub_key, der_pub_key_len);
-- 
2.34.1

