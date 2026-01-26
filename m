Return-Path: <keyrings+bounces-3950-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sL6aKAp7d2n7ggEAu9opvQ
	(envelope-from <keyrings+bounces-3950-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 15:32:42 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 581C089864
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 15:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E15843047BF3
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 14:30:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFB2C252900;
	Mon, 26 Jan 2026 14:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bRlN/M3I"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7602236FD
	for <keyrings@vger.kernel.org>; Mon, 26 Jan 2026 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437831; cv=none; b=N6zJil57dAUnQdEXu8S4VnWJve8u9veExCcIcaliusFlGnoUiRVZBdFEk8G9g9Ojh2xreHEP6ud+2+WqoOD64N21i2/T1qWrpIFnZKKUQ0ulo65bJRLtTjyajP77X6vUtteUQ7w5KNK3wNNjlVn8G/6lFA6LY9UToloqOqeEVy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437831; c=relaxed/simple;
	bh=ZKqV4jdfUAWA5T+vgn8F9FloZgvwNgzM9afWi0tnKSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fplvCU3UoRwMRd9Ol8of0zOtNqMBSnJ/UTpez+bqeXEqa9E2nNjZ7HXodyLk9pvVvek7/SSJ/nIt7KN5fGImrQ6Jm3OJoy+E2f6WB1bqQhavwCimcPApxbwzO7FSsh3mL0lp5LO0mzgzZ79p65IAK6NK0Rq+7p4yqNmaGYCgHDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bRlN/M3I; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769437829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UTvzySqwRBAB/UJpm0FXsBqjnOHhxCKseoxuTP/uJ7A=;
	b=bRlN/M3IUSKZMu1uODg6cWaCX6NPcS7sV1Xzgr+dsfKdXHwgfNKe7LWo9KBbSqwWSaLnKp
	dwCVcoi9xWIKL005CTZ+fwNK55b5/w4ZMKcNLcAwpdy6OjOIiD5MX9k3vvaWICLqUZn+pQ
	yQs60EvXHzt9Crw2VaZBCEYi1W0HMng=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-382-brTXolUjOO-x8Ob9AaXbaQ-1; Mon,
 26 Jan 2026 09:30:25 -0500
X-MC-Unique: brTXolUjOO-x8Ob9AaXbaQ-1
X-Mimecast-MFC-AGG-ID: brTXolUjOO-x8Ob9AaXbaQ_1769437822
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 46BBF180034F;
	Mon, 26 Jan 2026 14:30:22 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.44.33.164])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 81DF730001A8;
	Mon, 26 Jan 2026 14:30:17 +0000 (UTC)
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
Subject: [PATCH v15 6/7] modsign: Enable ML-DSA module signing
Date: Mon, 26 Jan 2026 14:29:27 +0000
Message-ID: <20260126142931.1940586-7-dhowells@redhat.com>
In-Reply-To: <20260126142931.1940586-1-dhowells@redhat.com>
References: <20260126142931.1940586-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3950-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[keyrings];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wunner.de:email,chronox.de:email,cloudflare.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,apana.org.au:email]
X-Rspamd-Queue-Id: 581C089864
X-Rspamd-Action: no action

Allow ML-DSA module signing to be enabled.

Note that OpenSSL's CMS_*() function suite does not, as of OpenSSL-3.6,
support the use of CMS_NOATTR with ML-DSA, so the prohibition against using
signedAttrs with module signing has to be removed.  The selected digest
then applies only to the algorithm used to calculate the digest stored in
the messageDigest attribute.  The OpenSSL development branch has patches
applied that fix this[1], but it appears that that will only be available
in OpenSSL-4.

[1] https://github.com/openssl/openssl/pull/28923

sign-file won't set CMS_NOATTR if openssl is earlier than v4, resulting in
the use of signed attributes.

The ML-DSA algorithm takes the raw data to be signed without regard to what
digest algorithm is specified in the CMS message.  The CMS specified digest
algorithm is ignored unless signedAttrs are used; in such a case, only
SHA512 is permitted.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 Documentation/admin-guide/module-signing.rst | 16 +++++----
 certs/Kconfig                                | 30 +++++++++++++++++
 certs/Makefile                               |  3 ++
 scripts/sign-file.c                          | 34 +++++++++++++++-----
 4 files changed, 68 insertions(+), 15 deletions(-)

diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
index a8667a777490..7f2f127dc76f 100644
--- a/Documentation/admin-guide/module-signing.rst
+++ b/Documentation/admin-guide/module-signing.rst
@@ -28,10 +28,12 @@ trusted userspace bits.
 
 This facility uses X.509 ITU-T standard certificates to encode the public keys
 involved.  The signatures are not themselves encoded in any industrial standard
-type.  The built-in facility currently only supports the RSA & NIST P-384 ECDSA
-public key signing standard (though it is pluggable and permits others to be
-used).  The possible hash algorithms that can be used are SHA-2 and SHA-3 of
-sizes 256, 384, and 512 (the algorithm is selected by data in the signature).
+type.  The built-in facility currently only supports the RSA, NIST P-384 ECDSA
+and NIST FIPS-204 ML-DSA public key signing standards (though it is pluggable
+and permits others to be used).  For RSA and ECDSA, the possible hash
+algorithms that can be used are SHA-2 and SHA-3 of sizes 256, 384, and 512 (the
+algorithm is selected by data in the signature); ML-DSA does its own hashing,
+but is allowed to be used with a SHA512 hash for signed attributes.
 
 
 ==========================
@@ -146,9 +148,9 @@ into vmlinux) using parameters in the::
 
 file (which is also generated if it does not already exist).
 
-One can select between RSA (``MODULE_SIG_KEY_TYPE_RSA``) and ECDSA
-(``MODULE_SIG_KEY_TYPE_ECDSA``) to generate either RSA 4k or NIST
-P-384 keypair.
+One can select between RSA (``MODULE_SIG_KEY_TYPE_RSA``), ECDSA
+(``MODULE_SIG_KEY_TYPE_ECDSA``) and ML-DSA (``MODULE_SIG_KEY_TYPE_MLDSA_*``) to
+generate an RSA 4k, a NIST P-384 keypair or an ML-DSA 44, 65 or 87 keypair.
 
 It is strongly recommended that you provide your own x509.genkey file.
 
diff --git a/certs/Kconfig b/certs/Kconfig
index 78307dc25559..2b088ef58373 100644
--- a/certs/Kconfig
+++ b/certs/Kconfig
@@ -39,6 +39,36 @@ config MODULE_SIG_KEY_TYPE_ECDSA
 	 Note: Remove all ECDSA signing keys, e.g. certs/signing_key.pem,
 	 when falling back to building Linux 5.14 and older kernels.
 
+config MODULE_SIG_KEY_TYPE_MLDSA_44
+	bool "ML-DSA-44"
+	select CRYPTO_MLDSA
+	help
+	  Use an ML-DSA-44 key (NIST FIPS 204) for module signing.  ML-DSA
+	  support requires OpenSSL-3.5 minimum; preferably OpenSSL-4+.  With
+	  the latter, the entire module body will be signed; with the former,
+	  signedAttrs will be used as it lacks support for CMS_NOATTR with
+	  ML-DSA.
+
+config MODULE_SIG_KEY_TYPE_MLDSA_65
+	bool "ML-DSA-65"
+	select CRYPTO_MLDSA
+	help
+	  Use an ML-DSA-65 key (NIST FIPS 204) for module signing.  ML-DSA
+	  support requires OpenSSL-3.5 minimum; preferably OpenSSL-4+.  With
+	  the latter, the entire module body will be signed; with the former,
+	  signedAttrs will be used as it lacks support for CMS_NOATTR with
+	  ML-DSA.
+
+config MODULE_SIG_KEY_TYPE_MLDSA_87
+	bool "ML-DSA-87"
+	select CRYPTO_MLDSA
+	help
+	  Use an ML-DSA-87 key (NIST FIPS 204) for module signing.  ML-DSA
+	  support requires OpenSSL-3.5 minimum; preferably OpenSSL-4+.  With
+	  the latter, the entire module body will be signed; with the former,
+	  signedAttrs will be used as it lacks support for CMS_NOATTR with
+	  ML-DSA.
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
diff --git a/scripts/sign-file.c b/scripts/sign-file.c
index 7070245edfc1..547b97097230 100644
--- a/scripts/sign-file.c
+++ b/scripts/sign-file.c
@@ -315,18 +315,36 @@ int main(int argc, char **argv)
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
+
+		if ((EVP_PKEY_is_a(private_key, "ML-DSA-44") ||
+		     EVP_PKEY_is_a(private_key, "ML-DSA-65") ||
+		     EVP_PKEY_is_a(private_key, "ML-DSA-87")) &&
+		    OPENSSL_VERSION_MAJOR < 4) {
+			 /* ML-DSA + CMS_NOATTR is not supported in openssl-3.5
+			  * and before.
+			  */
+			use_signed_attrs = 0;
+		}
+
+		flags |= use_signed_attrs;
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


