Return-Path: <keyrings+bounces-3779-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8CDD28E76
	for <lists+keyrings@lfdr.de>; Thu, 15 Jan 2026 22:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C72CF30E3FAA
	for <lists+keyrings@lfdr.de>; Thu, 15 Jan 2026 21:52:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833D032D0F3;
	Thu, 15 Jan 2026 21:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U6HuPwMq"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741911D61BC
	for <keyrings@vger.kernel.org>; Thu, 15 Jan 2026 21:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768513934; cv=none; b=mWMPwQvqikyu7mGR2E1D4wyQ+cTyTrmywbp2L524MpeaN8x1o/0gStWwIAm6sApSrMH5W/J6FmQZR73yB6iV1IWbVgA/LEVLZcy6lD8k/7t12Jmd34IEbcVYqR+SLo0pXXBRt47SkVxv3AJBkKmuiET55mzWGP2YZhMaY2nOSXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768513934; c=relaxed/simple;
	bh=Q+uHu4u/Mbi+H9rK60Sh6pfaEXhFj8X2WigDcbk50uM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZ/INpmpHJvYKOYTC/7bZQnqb9jzpHYd/geexyWcUsbi3my+4xdOh79zYaz7kHQiI73t6GA6Soz9UulU5QuFVBzuQk3f+vJyTdl+u7PrPnOpru+4/sdqnvnsGOrkA16P8f2Yzjg2uf68zzRPgYIEUFONU8YOLpFGNfjPyQ2Iqnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U6HuPwMq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768513924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ONdEFTmuicRpc0uh8shFoPeyhLNYTCObn7PLvjP6bE=;
	b=U6HuPwMqbzyoDoYV1vtHqiR/rmMlzZRSSO/UYlNwKTRyBkRK/+3A2AdTLGxEK1LbDJnr9U
	v00nRRQRg7/N8FBwH6Gm4Uu7z7NY6GKuyZL2sm3tc6rV643fIcM8Dp/je9u7KXtK2iteo7
	UO5eIJ5yeVp7zCEgRjmxGMSH5Af64kE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-532-O2QjCR8FOSWhSpKNLcigvg-1; Thu,
 15 Jan 2026 16:52:00 -0500
X-MC-Unique: O2QjCR8FOSWhSpKNLcigvg-1
X-Mimecast-MFC-AGG-ID: O2QjCR8FOSWhSpKNLcigvg_1768513918
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 23ADF195608A;
	Thu, 15 Jan 2026 21:51:58 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.4])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 71EA619560BA;
	Thu, 15 Jan 2026 21:51:54 +0000 (UTC)
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
Subject: [PATCH v12 09/10] modsign: Enable RSASSA-PSS module signing
Date: Thu, 15 Jan 2026 21:50:51 +0000
Message-ID: <20260115215100.312611-10-dhowells@redhat.com>
In-Reply-To: <20260115215100.312611-1-dhowells@redhat.com>
References: <20260115215100.312611-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Add support for RSASSA-PSS signatures (RFC8017) for use with module signing
and other public key cryptography done by the kernel.

Note that only signature verification is supported by the kernel.

Note further that this alters some of the same code as the MLDSA support,
so that needs to be applied first to avoid conflicts.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Ignat Korchagin <ignat@cloudflare.com>
cc: Lukas Wunner <lukas@wunner.de>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 Documentation/admin-guide/module-signing.rst |  5 ++-
 certs/Kconfig                                |  6 +++
 certs/Makefile                               |  1 +
 scripts/sign-file.c                          | 39 +++++++++++++++++++-
 4 files changed, 47 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
index 7f2f127dc76f..aa24715cd2d8 100644
--- a/Documentation/admin-guide/module-signing.rst
+++ b/Documentation/admin-guide/module-signing.rst
@@ -32,8 +32,9 @@ type.  The built-in facility currently only supports the RSA, NIST P-384 ECDSA
 and NIST FIPS-204 ML-DSA public key signing standards (though it is pluggable
 and permits others to be used).  For RSA and ECDSA, the possible hash
 algorithms that can be used are SHA-2 and SHA-3 of sizes 256, 384, and 512 (the
-algorithm is selected by data in the signature); ML-DSA does its own hashing,
-but is allowed to be used with a SHA512 hash for signed attributes.
+algorithm is selected by data in the signature); RSASSA-PSS is allowed to use
+SHA512 only; ML-DSA does its own hashing, but is allowed to be used with a
+SHA512 hash for signed attributes.
 
 
 ==========================
diff --git a/certs/Kconfig b/certs/Kconfig
index 67a5786423b5..524d1747c541 100644
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
index 547b97097230..800e2e2e36c3 100644
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
@@ -338,12 +339,46 @@ int main(int argc, char **argv)
 
 		flags |= use_signed_attrs;
 
+		if (EVP_PKEY_is_a(private_key, "RSASSA-PSS")) {
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
+			flags |= CMS_KEY_PARAM;
+		}
+
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
 


