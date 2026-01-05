Return-Path: <keyrings+bounces-3712-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 909A9CF46D4
	for <lists+keyrings@lfdr.de>; Mon, 05 Jan 2026 16:34:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87A2C319FE41
	for <lists+keyrings@lfdr.de>; Mon,  5 Jan 2026 15:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E590632B996;
	Mon,  5 Jan 2026 15:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RGmMf31s"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E8631DD97
	for <keyrings@vger.kernel.org>; Mon,  5 Jan 2026 15:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767626557; cv=none; b=kNBOFho1r5JQrT8PQguVGUEJvqBzcm01YaXgqNyQWvsklRjQ+cphZCWYhzkWGsIKiT94tlzTlRaIsbzF7fqT+FAdVLNAUOvg5TluheHZjakXsjTEK6iiV7uByJRDruXmkJ4ZpwnhUE3sEJwS7f25xRI2h71iSUS4SaHLaE3E+Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767626557; c=relaxed/simple;
	bh=G0jblK+IJlne+fEoSFxvc42mNaO9eL7zru181fO5a/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o9xpvIzVCHcXmxeKFdJiwZ/+RIrkHjqOpSWKCs09SAgvnAR4YcDGB+Izu1rL7JwK5UZao3Zs1xrPpc5yTnVQsD/PLSRzjz4AElgnoYra+nxJw/gdmOD07UOBmVM198mdKk++3DEVQl3/fc4ipjRWENSIddzPeGrdihlbC4CBy9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RGmMf31s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767626554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpvBgHZrvzdFBd1yH1Fy4oCgJ0BEjj+474Jwv8vdQk8=;
	b=RGmMf31swsMOg4PmDPz9L4qtdl9oand1Stjr8I3QxiaguwQ+R7xRUz0SQ8a+ShnxJwpF0b
	/8YJkAZTJ9qIGan/vwHr557I6Idk+JjUHa7AFZRkyms7FSTUAC/N12vsyBojbl+xcVHUhg
	btqaV9n1wXIHxlE1v1TwQwYynNiGQaQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-527-EWtQLbh9MPm8wKfRhaMxYw-1; Mon,
 05 Jan 2026 10:22:29 -0500
X-MC-Unique: EWtQLbh9MPm8wKfRhaMxYw-1
X-Mimecast-MFC-AGG-ID: EWtQLbh9MPm8wKfRhaMxYw_1767626546
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CBE4B18009C0;
	Mon,  5 Jan 2026 15:22:25 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.4])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id CC390180049F;
	Mon,  5 Jan 2026 15:22:21 +0000 (UTC)
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
Subject: [PATCH v11 4/8] modsign: Enable ML-DSA module signing
Date: Mon,  5 Jan 2026 15:21:29 +0000
Message-ID: <20260105152145.1801972-5-dhowells@redhat.com>
In-Reply-To: <20260105152145.1801972-1-dhowells@redhat.com>
References: <20260105152145.1801972-1-dhowells@redhat.com>
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


