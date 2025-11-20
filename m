Return-Path: <keyrings+bounces-3404-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB4AC738A9
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 11:48:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 265323556A6
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 10:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF2532E153;
	Thu, 20 Nov 2025 10:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XiQa5DO/"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEF3330311
	for <keyrings@vger.kernel.org>; Thu, 20 Nov 2025 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635542; cv=none; b=oB8Km5W0JKm1Vqvr7YeusfZbKEFUkZL/hyKj/A/objXZVOW0+DJC1Qe31o0Vj1PIHVej2n812IFI3J2kFmCJZwZYM2fCVLTI4HoQbDOXGLd/bR+JCtSg0f4ilEFNpE1R4fZuj+tsttzNAgxWiIj0/X0p8DEYTiZVZ6ncvvcNjMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635542; c=relaxed/simple;
	bh=G0jblK+IJlne+fEoSFxvc42mNaO9eL7zru181fO5a/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ikc06jchnqfVPfzTH6vVSzJC9lsEGz4kMyEbUgqorRT5Zrvpnk24YzyeGf+K2FTX9QhWJno1MIm4SkIyg8i+1cwsaltHqcWf6nqx3WqlEUr1vq2A7vgagKESU6qBiDkjiBf7NUM/vQqehyTEEej/95VhKjBSUTjt74MEHknyNGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XiQa5DO/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763635538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpvBgHZrvzdFBd1yH1Fy4oCgJ0BEjj+474Jwv8vdQk8=;
	b=XiQa5DO/AFfXyIdNEwJHwfgeCyGT7foHeWmBio9Q3V1V94WkQ3ylNorISr0xO4d581Ac6U
	Aqv4+FWE12/eQ3v/Odr31F0XofC1WQ+d1SwjIp3YrYvELhYpTGVri5IffjbhJ/DWTNECow
	CxCAGzCLKxVRqIgFd5tpXccVCi4U+Q4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-320-cxwV09nsNR-1YIxm8NFGgQ-1; Thu,
 20 Nov 2025 05:45:33 -0500
X-MC-Unique: cxwV09nsNR-1YIxm8NFGgQ-1
X-Mimecast-MFC-AGG-ID: cxwV09nsNR-1YIxm8NFGgQ_1763635531
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4981C195607C;
	Thu, 20 Nov 2025 10:45:31 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.5])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 93DB11940E82;
	Thu, 20 Nov 2025 10:45:27 +0000 (UTC)
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
Subject: [PATCH v10 8/8] modsign: Enable ML-DSA module signing
Date: Thu, 20 Nov 2025 10:44:35 +0000
Message-ID: <20251120104439.2620205-9-dhowells@redhat.com>
In-Reply-To: <20251120104439.2620205-1-dhowells@redhat.com>
References: <20251120104439.2620205-1-dhowells@redhat.com>
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
authenticatedAttributes with module signing has to be removed.  The
selected digest then applies only to the algorithm used to calculate the
digest stored in the messageDigest attribute.

The ML-DSA algorithm uses its own internal choice of digest (SHAKE256)
without regard to what's specified in the CMS message.  This is, in theory,
configurable, but there's currently no hook in the crypto_sig API to do
that, though possibly it could be done by parameterising the name of the
algorithm, e.g. ("mldsa87(sha512)").

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 Documentation/admin-guide/module-signing.rst | 15 +++++------
 certs/Kconfig                                | 21 ++++++++++++++++
 certs/Makefile                               |  3 +++
 crypto/asymmetric_keys/pkcs7_verify.c        |  4 ---
 scripts/sign-file.c                          | 26 ++++++++++++++------
 5 files changed, 50 insertions(+), 19 deletions(-)

diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
index a8667a777490..1a055c0b3356 100644
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
+(``MODULE_SIG_KEY_TYPE_ECDSA``) and ML-DSA (``MODULE_SIG_KEY_TYPE_MLDSA_*``) to
+generate an RSA 4k, a NIST P-384 keypair or an ML-DSA 44, 65 or 87 keypair.
 
 It is strongly recommended that you provide your own x509.genkey file.
 
diff --git a/certs/Kconfig b/certs/Kconfig
index 78307dc25559..94b086684d07 100644
--- a/certs/Kconfig
+++ b/certs/Kconfig
@@ -39,6 +39,27 @@ config MODULE_SIG_KEY_TYPE_ECDSA
 	 Note: Remove all ECDSA signing keys, e.g. certs/signing_key.pem,
 	 when falling back to building Linux 5.14 and older kernels.
 
+config MODULE_SIG_KEY_TYPE_MLDSA_44
+	bool "ML-DSA (Dilithium) 44"
+	select CRYPTO_MLDSA
+	help
+	  Use an ML-DSA (Dilithium) 44 key (NIST FIPS 204) for module signing
+	  with a SHAKE256 'hash' of the authenticatedAttributes.
+
+config MODULE_SIG_KEY_TYPE_MLDSA_65
+	bool "ML-DSA (Dilithium) 65"
+	select CRYPTO_MLDSA
+	help
+	  Use an ML-DSA (Dilithium) 65 key (NIST FIPS 204) for module signing
+	  with a SHAKE256 'hash' of the authenticatedAttributes.
+
+config MODULE_SIG_KEY_TYPE_MLDSA_87
+	bool "ML-DSA (Dilithium) 87"
+	select CRYPTO_MLDSA
+	help
+	  Use an ML-DSA (Dilithium) 87 key (NIST FIPS 204) for module signing
+	  with a SHAKE256 'hash' of the authenticatedAttributes.
+
 endchoice
 
 config SYSTEM_TRUSTED_KEYRING
diff --git a/certs/Makefile b/certs/Makefile
index f6fa4d8d75e0..3ee1960f9f4a 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -43,6 +43,9 @@ targets += x509_certificate_list
 ifeq ($(CONFIG_MODULE_SIG_KEY),certs/signing_key.pem)
 
 keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_ECDSA) := -newkey ec -pkeyopt ec_paramgen_curve:secp384r1
+keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_44) := -newkey ml-dsa-44
+keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_65) := -newkey ml-dsa-65
+keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_MLDSA_87) := -newkey ml-dsa-87
 
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


