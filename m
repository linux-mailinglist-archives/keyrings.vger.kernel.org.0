Return-Path: <keyrings+bounces-3354-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C339C5D429
	for <lists+keyrings@lfdr.de>; Fri, 14 Nov 2025 14:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 601C235C076
	for <lists+keyrings@lfdr.de>; Fri, 14 Nov 2025 13:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493D4314D04;
	Fri, 14 Nov 2025 13:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JZjQelxq"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B004314B96
	for <keyrings@vger.kernel.org>; Fri, 14 Nov 2025 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763125537; cv=none; b=tsgmYQetBVARfM43Z+wIkF4y898JdLrrWLGSMUep5V5tFQ6hJk4cSsOmbnxB6G6JebV0qzTaPNb4Nz0dL0CHgyRto1r4D4oVCdeKMeblR/pm4XRO3/IIRNeeSQkDwtPyibcG44vV/qqi+rgeYbfYC/K1rA4HrmUyZwcYQKcj37w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763125537; c=relaxed/simple;
	bh=w9vCmj0JrZAuFyG9f2Jibv1+CsFmXja4a9ukZXYQTVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/q+9mjkenzfzCEhXX/iPxxuYhLjOOKO9E079R+Y9wAU0UnRKXXkCHkumS6Xq6caZWPEIuvv2Xu8y9YSS/IKpSYfAAqGRY5b30UinSE2LTuo8bd5uhGVDFTYkyo8Po5l93uFHzhi7ulP4sHIXctf7FhvSenJ6VgOxQxfNK4qhng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JZjQelxq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763125534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mJJGmtWxIDYAA/jEt/ZHyNkNSPJoyjN8NhEYTOalQdM=;
	b=JZjQelxqldkXU8OOuCNIdpySvnkA/YDEDi8L1PLwYaEyDQPQP6ZTT/9S5ybhhbHSvKQFI7
	ZZ5m1xORID9h9OJwxaYwSAO0eqMyNRNHWbjUyLyQrlZqHrlo1Vy2uHgW6dG7ZozwDR8n7o
	1MP6QURus4sSaMbi2XzQOTv0HoGNJkY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-210-PSpXj_KCODKM9y5cc9nHjg-1; Fri,
 14 Nov 2025 08:05:30 -0500
X-MC-Unique: PSpXj_KCODKM9y5cc9nHjg-1
X-Mimecast-MFC-AGG-ID: PSpXj_KCODKM9y5cc9nHjg_1763125527
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B1F3C180047F;
	Fri, 14 Nov 2025 13:05:27 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.87])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 504E91955F1B;
	Fri, 14 Nov 2025 13:05:22 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David Howells <dhowells@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 9/9] modsign: Enable ML-DSA module signing
Date: Fri, 14 Nov 2025 13:04:12 +0000
Message-ID: <20251114130417.1756230-10-dhowells@redhat.com>
In-Reply-To: <20251114130417.1756230-1-dhowells@redhat.com>
References: <20251114130417.1756230-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Allow ML-DSA module signing to be enabled.

Note that openssl's CMS_*() function suite does not, as of openssl-3.5.1,
support the use of CMS_NOATTR with ML-DSA, so the prohibition against using
authenticatedAttributes with module signing has to be removed.  The selected
digest then applies only to the algorithm used to calculate the digest
stored in the messageDigest attribute.

The ML-DSA algorithm uses its own internal choice of digest (SHAKE256)
without regard to what's specified in the CMS message.  This is, in theory,
configurable, but there's currently no hook in the crypto_sig API to do
that, though possibly it could be done by parameterising the name of the
algorithm, e.g. ("ml-dsa87(sha512)").

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 Documentation/admin-guide/module-signing.rst | 15 +++++------
 certs/Kconfig                                | 24 ++++++++++++++++++
 certs/Makefile                               |  3 +++
 crypto/asymmetric_keys/pkcs7_verify.c        |  4 ---
 kernel/module/Kconfig                        |  5 ++++
 scripts/sign-file.c                          | 26 ++++++++++++++------
 6 files changed, 58 insertions(+), 19 deletions(-)

diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
index a8667a777490..6daff80c277b 100644
--- a/Documentation/admin-guide/module-signing.rst
+++ b/Documentation/admin-guide/module-signing.rst
@@ -28,10 +28,11 @@ trusted userspace bits.
 
 This facility uses X.509 ITU-T standard certificates to encode the public keys
 involved.  The signatures are not themselves encoded in any industrial standard
-type.  The built-in facility currently only supports the RSA & NIST P-384 ECDSA
-public key signing standard (though it is pluggable and permits others to be
-used).  The possible hash algorithms that can be used are SHA-2 and SHA-3 of
-sizes 256, 384, and 512 (the algorithm is selected by data in the signature).
+type.  The built-in facility currently only supports the RSA, NIST P-384 ECDSA
+and NIST FIPS-204 ML-DSA (Dilithium) public key signing standards (though it is
+pluggable and permits others to be used).  For RSA and ECDSA, the possible hash
+algorithms that can be used are SHA-2 and SHA-3 of sizes 256, 384, and 512 (the
+algorithm is selected by data in the signature); ML-DSA uses SHAKE256.
 
 
 ==========================
@@ -146,9 +147,9 @@ into vmlinux) using parameters in the::
 
 file (which is also generated if it does not already exist).
 
-One can select between RSA (``MODULE_SIG_KEY_TYPE_RSA``) and ECDSA
-(``MODULE_SIG_KEY_TYPE_ECDSA``) to generate either RSA 4k or NIST
-P-384 keypair.
+One can select between RSA (``MODULE_SIG_KEY_TYPE_RSA``), ECDSA
+(``MODULE_SIG_KEY_TYPE_ECDSA``) and ML-DSA (``MODULE_SIG_KEY_TYPE_ML_DSA``) to
+generate an RSA 4k, a NIST P-384 keypair or an ML-DSA keypair.
 
 It is strongly recommended that you provide your own x509.genkey file.
 
diff --git a/certs/Kconfig b/certs/Kconfig
index 78307dc25559..f647b944f5da 100644
--- a/certs/Kconfig
+++ b/certs/Kconfig
@@ -39,6 +39,30 @@ config MODULE_SIG_KEY_TYPE_ECDSA
 	 Note: Remove all ECDSA signing keys, e.g. certs/signing_key.pem,
 	 when falling back to building Linux 5.14 and older kernels.
 
+config MODULE_SIG_KEY_TYPE_ML_DSA_44
+	bool "ML-DSA (Dilithium) 44"
+	select CRYPTO_ML_DSA
+	select LIB_SHA3
+	help
+	  Use an ML-DSA (Dilithium) 44 key (NIST FIPS 204) for module signing
+	  with a SHAKE256 'hash' of the message.
+
+config MODULE_SIG_KEY_TYPE_ML_DSA_65
+	bool "ML-DSA (Dilithium) 65"
+	select CRYPTO_ML_DSA
+	select LIB_SHA3
+	help
+	  Use an ML-DSA (Dilithium) 65 key (NIST FIPS 204) for module signing
+	  with a SHAKE256 'hash' of the message.
+
+config MODULE_SIG_KEY_TYPE_ML_DSA_87
+	bool "ML-DSA (Dilithium) 87"
+	select CRYPTO_ML_DSA
+	select LIB_SHA3
+	help
+	  Use an ML-DSA (Dilithium) 87 key (NIST FIPS 204) for module signing
+	  with a SHAKE256 'hash' of the message.
+
 endchoice
 
 config SYSTEM_TRUSTED_KEYRING
diff --git a/certs/Makefile b/certs/Makefile
index f6fa4d8d75e0..231379c91b86 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -43,6 +43,9 @@ targets += x509_certificate_list
 ifeq ($(CONFIG_MODULE_SIG_KEY),certs/signing_key.pem)
 
 keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_ECDSA) := -newkey ec -pkeyopt ec_paramgen_curve:secp384r1
+keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_ML_DSA_44) := -newkey ml-dsa-44
+keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_ML_DSA_65) := -newkey ml-dsa-65
+keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_ML_DSA_87) := -newkey ml-dsa-87
 
 quiet_cmd_gen_key = GENKEY  $@
       cmd_gen_key = openssl req -new -nodes -utf8 -$(CONFIG_MODULE_SIG_HASH) -days 36500 \
diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
index 0f9f515b784d..f7ea1d41771d 100644
--- a/crypto/asymmetric_keys/pkcs7_verify.c
+++ b/crypto/asymmetric_keys/pkcs7_verify.c
@@ -424,10 +424,6 @@ int pkcs7_verify(struct pkcs7_message *pkcs7,
 			pr_warn("Invalid module sig (not pkcs7-data)\n");
 			return -EKEYREJECTED;
 		}
-		if (pkcs7->have_authattrs) {
-			pr_warn("Invalid module sig (has authattrs)\n");
-			return -EKEYREJECTED;
-		}
 		break;
 	case VERIFYING_FIRMWARE_SIGNATURE:
 		if (pkcs7->data_type != OID_data) {
diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 2a1beebf1d37..4b5d1601d537 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -327,6 +327,10 @@ config MODULE_SIG_SHA3_512
 	bool "SHA3-512"
 	select CRYPTO_SHA3
 
+config MODULE_SIG_SHAKE256
+	bool "SHAKE256"
+	select CRYPTO_SHA3
+
 endchoice
 
 config MODULE_SIG_HASH
@@ -339,6 +343,7 @@ config MODULE_SIG_HASH
 	default "sha3-256" if MODULE_SIG_SHA3_256
 	default "sha3-384" if MODULE_SIG_SHA3_384
 	default "sha3-512" if MODULE_SIG_SHA3_512
+	default "shake256" if MODULE_SIG_SHAKE256
 
 config MODULE_COMPRESS
 	bool "Module compression"
diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 7070245edfc1..b726581075f9 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -315,18 +315,28 @@ int main(int argc, char **argv)
 		ERR(!digest_algo, "EVP_get_digestbyname");
 
 #ifndef USE_PKCS7
+
+		unsigned int flags =
+			CMS_NOCERTS |
+			CMS_PARTIAL |
+			CMS_BINARY |
+			CMS_DETACHED |
+			CMS_STREAM  |
+			CMS_NOSMIMECAP |
+			CMS_NO_SIGNING_TIME |
+			use_keyid;
+		if (!EVP_PKEY_is_a(private_key, "ML-DSA-44") &&
+		    !EVP_PKEY_is_a(private_key, "ML-DSA-65") &&
+		    !EVP_PKEY_is_a(private_key, "ML-DSA-87"))
+			flags |= use_signed_attrs;
+
 		/* Load the signature message from the digest buffer. */
-		cms = CMS_sign(NULL, NULL, NULL, NULL,
-			       CMS_NOCERTS | CMS_PARTIAL | CMS_BINARY |
-			       CMS_DETACHED | CMS_STREAM);
+		cms = CMS_sign(NULL, NULL, NULL, NULL, flags);
 		ERR(!cms, "CMS_sign");
 
-		ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo,
-				     CMS_NOCERTS | CMS_BINARY |
-				     CMS_NOSMIMECAP | use_keyid |
-				     use_signed_attrs),
+		ERR(!CMS_add1_signer(cms, x509, private_key, digest_algo, flags),
 		    "CMS_add1_signer");
-		ERR(CMS_final(cms, bm, NULL, CMS_NOCERTS | CMS_BINARY) != 1,
+		ERR(CMS_final(cms, bm, NULL, flags) != 1,
 		    "CMS_final");
 
 #else


