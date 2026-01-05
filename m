Return-Path: <keyrings+bounces-3716-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CE0CF471F
	for <lists+keyrings@lfdr.de>; Mon, 05 Jan 2026 16:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2880315828C
	for <lists+keyrings@lfdr.de>; Mon,  5 Jan 2026 15:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F472309DD2;
	Mon,  5 Jan 2026 15:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UAu0cj9Q"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECD1332EB7
	for <keyrings@vger.kernel.org>; Mon,  5 Jan 2026 15:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626577; cv=none; b=DBUGG/szUkMnJaYs4kQ6fU64AMnv32y87Rh0dpva55WEWplcDNlDfJDpncSteFEPcv68IaF4e814fCyQN27unWWpaHU2KYUeeDGP0ciC+oRJz6Oi4rx4a1RYixtnD2wfhcn7yr+tslQHcDNTIgy7YXMvvQc6WiENj375enYLav8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626577; c=relaxed/simple;
	bh=dbX9nHJ5REzRp8QaFOHK2ee2n38HwBnQPeTWNbT3JoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YrFTdbasbgv9tUBwq5Kw7mjAa57s3gTPkMFSD7sOudmuSOTpMl/LQs9GVipKqGAVdRLMPlGiOUUm7tMCUKTd8/NQaP41r1CyRjjnnWtIlXlZTHC4Bilz7H/gfLKCD8DHUNQwhcFDsJXjM+YKRt3kevK3yqotoFwtpw350lTuhC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UAu0cj9Q; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767626574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e9kgzsLwkkfNxmetAJNcral3H3dTIGoaCL0v9z96wpg=;
	b=UAu0cj9Q+bXhC3IjapJoUzoh2tqNE6m3EIwpWbFprAYZjMiTw3T8d1k9TlKRH86g5ErD4d
	ZH6Mjy/rR0zwQvVUST7zeiNAeb4RtU41yywr3+r3eOapogxxpQTvuiw4q88e8aDJQAKHq0
	xSahXn7XPpB2zTFrTN8Jx8EyriP5JuQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-26-KQWT_SDsNDmINssT8d_tdA-1; Mon,
 05 Jan 2026 10:22:50 -0500
X-MC-Unique: KQWT_SDsNDmINssT8d_tdA-1
X-Mimecast-MFC-AGG-ID: KQWT_SDsNDmINssT8d_tdA_1767626568
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 90468195609D;
	Mon,  5 Jan 2026 15:22:48 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.4])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AE50419560AB;
	Mon,  5 Jan 2026 15:22:44 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>
Cc: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 8/8] modsign: Enable RSASSA-PSS module signing
Date: Mon,  5 Jan 2026 15:21:33 +0000
Message-ID: <20260105152145.1801972-9-dhowells@redhat.com>
In-Reply-To: <20260105152145.1801972-1-dhowells@redhat.com>
References: <20260105152145.1801972-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add support for RSASSA-PSS signatures (RFC8017) for use with module signing
and other public key cryptography done by the kernel.

Note that only signature verification is supported by the kernel.

Note further that this alters some of the same code as the MLDSA support,
so that needs to be applied first to avoid conflicts.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 certs/Kconfig       |  6 ++++++
 certs/Makefile      |  1 +
 scripts/sign-file.c | 39 +++++++++++++++++++++++++++++++++++++--
 3 files changed, 44 insertions(+), 2 deletions(-)

diff --git a/certs/Kconfig b/certs/Kconfig
index 94b086684d07..beb8991ad761 100644
--- a/certs/Kconfig
+++ b/certs/Kconfig
@@ -27,6 +27,12 @@ config MODULE_SIG_KEY_TYPE_RSA
 	help
 	 Use an RSA key for module signing.
 
+config MODULE_SIG_KEY_TYPE_RSASSA_PSS
+	bool "RSASSA-PSS"
+	select CRYPTO_RSA
+	help
+	 Use an RSASSA-PSS key for module signing.
+
 config MODULE_SIG_KEY_TYPE_ECDSA
 	bool "ECDSA"
 	select CRYPTO_ECDSA
diff --git a/certs/Makefile b/certs/Makefile
index 3ee1960f9f4a..3b5a3a303f4c 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -42,6 +42,7 @@ targets += x509_certificate_list
 # boolean option and we unfortunately can't make it depend on !RANDCONFIG.
 ifeq ($(CONFIG_MODULE_SIG_KEY),certs/signing_key.pem)
 
+keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_RSASSA_PSS) := -newkey rsassa-pss
 keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_ECDSA) := -newkey ec -pkeyopt ec_paramgen_curve:secp384r1
 keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_44) := -newkey ml-dsa-44
 keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_65) := -newkey ml-dsa-65
diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index b726581075f9..ca605095194e 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -233,6 +233,7 @@ int main(int argc, char **argv)
 	EVP_PKEY *private_key;
 #ifndef USE_PKCS7
 	CMS_ContentInfo *cms = NULL;
+	CMS_SignerInfo *signer;
 	unsigned int use_keyid = 0;
 #else
 	PKCS7 *pkcs7 = NULL;
@@ -329,13 +330,47 @@ int main(int argc, char **argv)
 		    !EVP_PKEY_is_a(private_key, "ML-DSA-65") &&
 		    !EVP_PKEY_is_a(private_key, "ML-DSA-87"))
 			flags |= use_signed_attrs;
+		if (EVP_PKEY_is_a(private_key, "RSASSA-PSS"))
+			flags |= CMS_KEY_PARAM;
+	if (EVP_PKEY_is_a(private_key, "RSASSA-PSS")) {
+			EVP_PKEY_CTX *pkctx;
+			char mdname[1024] = {};
+
+			pkctx = EVP_PKEY_CTX_new(private_key, NULL);
+
+			ERR(!EVP_PKEY_sign_init(pkctx), "EVP_PKEY_sign_init");
+			ERR(!EVP_PKEY_CTX_set_rsa_padding(pkctx, RSA_PKCS1_PSS_PADDING),
+			    "EVP_PKEY_CTX_set_rsa_padding");
+			ERR(!EVP_PKEY_CTX_set_rsa_mgf1_md_name(pkctx, hash_algo, NULL),
+			    "EVP_PKEY_CTX_set_rsa_mgf1_md_name");
+
+			ERR(!EVP_PKEY_CTX_get_rsa_mgf1_md_name(pkctx, mdname, sizeof(mdname)),
+			    "EVP_PKEY_CTX_get_rsa_mgf1_md_name");
+			printf("RSASSA-PSS %s\n", mdname);
+		}
 
 		/* Load the signature message from the digest buffer. */
 		cms = CMS_sign(NULL, NULL, NULL, NULL, flags);
 		ERR(!cms, "CMS_sign");
 
-		ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo, flags),
-		    "CMS_add1_signer");
+		signer = CMS_add1_signer(cms, x509, private_key, digest_algo, flags);
+		ERR(!signer, "CMS_add1_signer");
+
+		if (EVP_PKEY_is_a(private_key, "RSASSA-PSS")) {
+			EVP_PKEY_CTX *pkctx;
+			char mdname[1024] = {};
+
+			pkctx = CMS_SignerInfo_get0_pkey_ctx(signer);
+			ERR(!EVP_PKEY_CTX_set_rsa_padding(pkctx, RSA_PKCS1_PSS_PADDING),
+			    "EVP_PKEY_CTX_set_rsa_padding");
+			ERR(!EVP_PKEY_CTX_set_rsa_mgf1_md_name(pkctx, hash_algo, NULL),
+			    "EVP_PKEY_CTX_set_rsa_mgf1_md_name");
+
+			ERR(!EVP_PKEY_CTX_get_rsa_mgf1_md_name(pkctx, mdname, sizeof(mdname)),
+			    "EVP_PKEY_CTX_get_rsa_mgf1_md_name");
+			printf("RSASSA-PSS %s\n", mdname);
+		}
+
 		ERR(CMS_final(cms, bm, NULL, flags) != 1,
 		    "CMS_final");
 


