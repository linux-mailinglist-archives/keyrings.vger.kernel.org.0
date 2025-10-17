Return-Path: <keyrings+bounces-3241-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFF7BE94C1
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 16:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43E73581C90
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 14:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B50D2F12C5;
	Fri, 17 Oct 2025 14:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GS4VuOY1"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF3E336EC9
	for <keyrings@vger.kernel.org>; Fri, 17 Oct 2025 14:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712301; cv=none; b=kUHibWnP/aOLoduVV3mZXGChvio8ofRD6g+5t/dfaKHBEIKhyREgFB0sMNbruIL7C3pvhetmrWiOjG5Vk7/WwYYq0VPYgVzEGM/lOlKcHqrb06IP7oQ5L2iFNh+HQqup2xtgRWajr9uTuF5zKg+1+LB0avDK7HflBwdfAZkCUMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712301; c=relaxed/simple;
	bh=zdhUsYsNuD5UVZ5sdV6O5KnrH9qTzwzetvx3pp2yM4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBfJsKWSFixfwP9VNZEKasBbxx1Z+FyztfpYFwKmBh+UrWnH55vMTtCUM9i92Maol81JurwS/vfRACYFge8ChS83tOuDvMHCrefYQUozGgtJ43R2+apHqgis0SfpFNKVa90Xy2Q8SGdIHsjO6mTPMZJdXVzuE1baK5qtgW6HrfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GS4VuOY1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760712296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xuF1zI/X45JtGhKorM1SQByR7PQAM32rNvbgQYcWujw=;
	b=GS4VuOY1J7RxIFtm8XBss7txT+BR1pPXoDyRGq97X0qrC7ZWKwJtA2usATEBWCEGerZtYa
	e9QW6FLbUPgLu7lqjgLqiIyLCFWiJMv2xGVabG6gEyhraedtNwe8Q9dH9fqbLZJ02gK/Sp
	iLyRXhw7eqvlgJlYhmMWvybMHUqP0cg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-RzTApwSQPB6rBUQSwUbHaQ-1; Fri,
 17 Oct 2025 10:44:55 -0400
X-MC-Unique: RzTApwSQPB6rBUQSwUbHaQ-1
X-Mimecast-MFC-AGG-ID: RzTApwSQPB6rBUQSwUbHaQ_1760712293
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6FC271800592;
	Fri, 17 Oct 2025 14:44:53 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.57])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E098F1800452;
	Fri, 17 Oct 2025 14:44:49 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 17/17] modsign: Enable ML-DSA module signing
Date: Fri, 17 Oct 2025 15:43:01 +0100
Message-ID: <20251017144311.817771-18-dhowells@redhat.com>
In-Reply-To: <20251017144311.817771-1-dhowells@redhat.com>
References: <20251017144311.817771-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

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
index 78307dc25559..a09db4b2c87c 100644
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
+	  Use an ML-DSA (Dilithium) 87 key (NIST FIPS 204) for module signing
+	  with a SHAKE256 'hash' of the message.
+
+config MODULE_SIG_KEY_TYPE_ML_DSA_65
+	bool "ML-DSA (Dilithium) 65"
+	select CRYPTO_ML_DSA
+	select LIB_SHA3
+	help
+	  Use an ML-DSA (Dilithium) 87 key (NIST FIPS 204) for module signing
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


