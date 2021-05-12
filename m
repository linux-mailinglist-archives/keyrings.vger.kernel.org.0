Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D3A37BF4E
	for <lists+keyrings@lfdr.de>; Wed, 12 May 2021 16:06:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbhELOGr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 12 May 2021 10:06:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231409AbhELOGj (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 12 May 2021 10:06:39 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9867CC061574;
        Wed, 12 May 2021 07:05:30 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id s22so18253951pgk.6;
        Wed, 12 May 2021 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=GVqe7G516BPTFzp213Reb/2oGW49RLUnKxvHSNvZwa4=;
        b=stYVQ7zZpDI2r16/19Xbq1hWvNrH46Wm/CbQDx3WZ1IR/ZD68UkARC3mHUjms8jxT+
         FLjNvt1sMKsodQQ4/Fe51BLC5yQ626kHZyZrvC8WVc2gQPEzLa02jJPnPNSXrRAPLXHI
         zJ+eby9s24jhTOnstsAnE31C2iL2PnwsDSu9+VQC0sqzKoZQGJZOBFvO+I/yBlTo61lv
         VB0YUzQrO58Hd9C9hdx2B09sii4+F8Iq3VPca7QrxbRHd9nVaxtsvc7VcFlM4Cl/zcTG
         IMRSiuueWmFX0Gx2C72Wbob6MnZWI1L3RLc5Vw0qZ9NTBrtY2CfX0caboCnQJ/CrRFQ2
         pd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=GVqe7G516BPTFzp213Reb/2oGW49RLUnKxvHSNvZwa4=;
        b=RgzW6rg+CP5C81+pScx+XXmf3MlBMNyiqCyUtF76RDI/agY87Tje+zUws/vVQ8551W
         hJ6t6E7Y/O9dDGTF4j/ZlX8kMB2Ouo+JPvbmf123rPISIWUDObEP7eXg0ZbEWaHoDNAV
         N3JAuczY40Lg0U9/PorwJeI2qfsJVbwKTODW6NPlaRddlHdyX2SqXC5L0Y4M99o5Z+u7
         mAxZnMueX+jr1cis4hNCenfvlE8tr9usxIyS0oq1z0AkumNDRsSKyQK3UhSxPUmADfox
         P7I5edEvQuSHwpij+KMlhLoUBBIJW8YAOp4uBtD8xbdNTszmlQXo1GJtS5FoH0PN1/L4
         F7Uw==
X-Gm-Message-State: AOAM5329VsDsFp5sD1Jt+g9TEq7jcFb0TMSo+qWHz1CwFJ6Xe4WhR0zT
        dZg/Xq7z1Z0JfzxOLWclC4S4VCeX5CQ=
X-Google-Smtp-Source: ABdhPJw334VFLy/y4cDCVZt88myTlE8Qy6O9L2us/6LckAI5XRwQfyNJGuxDqcyNYB7w5/3b7NFhdA==
X-Received: by 2002:a63:ea50:: with SMTP id l16mr37179622pgk.70.1620828329920;
        Wed, 12 May 2021 07:05:29 -0700 (PDT)
Received: from localhost.localdomain ([203.205.141.39])
        by smtp.gmail.com with ESMTPSA id in16sm28546pjb.14.2021.05.12.07.05.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 May 2021 07:05:29 -0700 (PDT)
From:   Hongbo Li <herbert.tencent@gmail.com>
To:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, dhowells@redhat.com,
        jarkko@kernel.org, tianjia.zhang@linux.alibaba.com,
        herberthbli@tencent.com
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] x509: add support for eddsa
Date:   Wed, 12 May 2021 22:04:11 +0800
Message-Id: <1620828254-25545-5-git-send-email-herbert.tencent@gmail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
References: <1620828254-25545-1-git-send-email-herbert.tencent@gmail.com>
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Hongbo Li <herberthbli@tencent.com>

This patch make x509 support eddsa(currently ed25519). According to
RFC8032 section 5.1.7[1], the digest is not on the original message,
but on a special formated message string:
	SHA512(dom2(F, C) || R || A || PH(M))

[1]: https://tools.ietf.org/html/rfc8032#section-5.1.7

Signed-off-by: Hongbo Li <herberthbli@tencent.com>
---
 crypto/asymmetric_keys/public_key.c       | 73 +++++++++++++++++++++++++++----
 crypto/asymmetric_keys/x509_cert_parser.c | 14 +++++-
 crypto/asymmetric_keys/x509_public_key.c  |  4 +-
 include/linux/oid_registry.h              |  1 +
 4 files changed, 82 insertions(+), 10 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index 4fefb21..c1236a8 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -251,8 +251,8 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 }
 
 #if IS_REACHABLE(CONFIG_CRYPTO_SM2)
-static int cert_sig_digest_update(const struct public_key_signature *sig,
-				  struct crypto_akcipher *tfm_pkey)
+static int sm2_cert_sig_digest_update(const struct public_key_signature *sig,
+				      struct crypto_akcipher *tfm_pkey)
 {
 	struct crypto_shash *tfm;
 	struct shash_desc *desc;
@@ -297,7 +297,7 @@ static int cert_sig_digest_update(const struct public_key_signature *sig,
 	return ret;
 }
 #else
-static inline int cert_sig_digest_update(
+static inline int sm2_cert_sig_digest_update(
 	const struct public_key_signature *sig,
 	struct crypto_akcipher *tfm_pkey)
 {
@@ -305,6 +305,58 @@ static inline int cert_sig_digest_update(
 }
 #endif /* ! IS_REACHABLE(CONFIG_CRYPTO_SM2) */
 
+static int eddsa_cert_sig_digest_update(const struct public_key *pub,
+					const struct public_key_signature *sig)
+{
+	struct crypto_shash *tfm = NULL;
+	struct shash_desc *desc = NULL;
+	int key_size, ret = 0;
+
+	if (strcmp(pub->pkey_algo, "eddsa-25519"))
+		return -ENOPKG;
+
+	tfm = crypto_alloc_shash(sig->hash_algo, 0, 0);
+	if (IS_ERR(tfm))
+		return PTR_ERR(tfm);
+
+	desc = kzalloc(sizeof(*desc) + crypto_shash_descsize(tfm), GFP_KERNEL);
+	if (!desc) {
+		ret = -ENOMEM;
+		goto free;
+	}
+
+	desc->tfm = tfm;
+
+	/* RFC8032 section 5.1.7
+	 * step 2. SHA512(dom2(F, C) || R || A || PH(M))
+	 */
+	key_size = 32;
+	if (sig->s_size != key_size * 2 ||
+	    pub->keylen != key_size) {
+		ret = -EINVAL;
+		goto free;
+	}
+
+	ret = crypto_shash_init(desc);
+	if (ret < 0)
+		goto free;
+
+	ret = crypto_shash_update(desc, sig->s, key_size);
+	if (ret < 0)
+		goto free;
+
+	ret = crypto_shash_update(desc, pub->key, key_size);
+	if (ret < 0)
+		goto free;
+
+	ret = crypto_shash_finup(desc, sig->data, sig->data_size, sig->digest);
+
+free:
+	kfree(desc);
+	crypto_free_shash(tfm);
+	return ret;
+}
+
 /*
  * Verify a signature using a public key.
  */
@@ -358,11 +410,16 @@ int public_key_verify_signature(const struct public_key *pkey,
 	if (ret)
 		goto error_free_key;
 
-	if (sig->pkey_algo && strcmp(sig->pkey_algo, "sm2") == 0 &&
-	    sig->data_size) {
-		ret = cert_sig_digest_update(sig, tfm);
-		if (ret)
-			goto error_free_key;
+	if (sig->pkey_algo && sig->data_size) {
+		if (strcmp(sig->pkey_algo, "sm2") == 0) {
+			ret = sm2_cert_sig_digest_update(sig, tfm);
+			if (ret)
+				goto error_free_key;
+		} else if (strcmp(sig->pkey_algo, "eddsa") == 0) {
+			ret = eddsa_cert_sig_digest_update(pkey, sig);
+			if (ret)
+				goto error_free_key;
+		}
 	}
 
 	sg_init_table(src_sg, 2);
diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 6d00309..3f60c57 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -258,6 +258,9 @@ int x509_note_pkey_algo(void *context, size_t hdrlen,
 	case OID_SM2_with_SM3:
 		ctx->cert->sig->hash_algo = "sm3";
 		goto sm2;
+	case OID_ed25519:
+		ctx->cert->sig->hash_algo = "sha512";
+		goto eddsa;
 	}
 
 rsa_pkcs1:
@@ -280,6 +283,11 @@ int x509_note_pkey_algo(void *context, size_t hdrlen,
 	ctx->cert->sig->encoding = "x962";
 	ctx->algo_oid = ctx->last_oid;
 	return 0;
+eddsa:
+	ctx->cert->sig->pkey_algo = "eddsa";
+	ctx->cert->sig->encoding = "raw";
+	ctx->algo_oid = ctx->last_oid;
+	return 0;
 }
 
 /*
@@ -302,7 +310,8 @@ int x509_note_signature(void *context, size_t hdrlen,
 	if (strcmp(ctx->cert->sig->pkey_algo, "rsa") == 0 ||
 	    strcmp(ctx->cert->sig->pkey_algo, "ecrdsa") == 0 ||
 	    strcmp(ctx->cert->sig->pkey_algo, "sm2") == 0 ||
-	    strcmp(ctx->cert->sig->pkey_algo, "ecdsa") == 0) {
+	    strcmp(ctx->cert->sig->pkey_algo, "ecdsa") == 0 ||
+	    strcmp(ctx->cert->sig->pkey_algo, "eddsa") == 0) {
 		/* Discard the BIT STRING metadata */
 		if (vlen < 1 || *(const u8 *)value != 0)
 			return -EBADMSG;
@@ -517,6 +526,9 @@ int x509_extract_key_data(void *context, size_t hdrlen,
 			return -ENOPKG;
 		}
 		break;
+	case OID_ed25519:
+		ctx->cert->pub->pkey_algo = "eddsa-25519";
+		break;
 	default:
 		return -ENOPKG;
 	}
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 3d45161..a8fd368 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -131,7 +131,9 @@ int x509_check_for_self_signed(struct x509_certificate *cert)
 	ret = -EKEYREJECTED;
 	if (strcmp(cert->pub->pkey_algo, cert->sig->pkey_algo) != 0 &&
 	    (strncmp(cert->pub->pkey_algo, "ecdsa-", 6) != 0 ||
-	     strcmp(cert->sig->pkey_algo, "ecdsa") != 0))
+	     strcmp(cert->sig->pkey_algo, "ecdsa") != 0) &&
+	    (strncmp(cert->pub->pkey_algo, "eddsa-", 6) != 0 ||
+	     strcmp(cert->sig->pkey_algo, "eddsa") != 0))
 		goto out;
 
 	ret = public_key_verify_signature(cert->pub, cert->sig);
diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index cc64d94..d84bb86 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -64,6 +64,7 @@ enum OID {
 
 	OID_certAuthInfoAccess,		/* 1.3.6.1.5.5.7.1.1 */
 	OID_sha1,			/* 1.3.14.3.2.26 */
+	OID_ed25519,			/* 1.3.101.112 */
 	OID_id_ansip384r1,		/* 1.3.132.0.34 */
 	OID_sha256,			/* 2.16.840.1.101.3.4.2.1 */
 	OID_sha384,			/* 2.16.840.1.101.3.4.2.2 */
-- 
1.8.3.1

