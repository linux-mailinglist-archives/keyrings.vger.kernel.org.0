Return-Path: <keyrings+bounces-3299-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65496C3CF33
	for <lists+keyrings@lfdr.de>; Thu, 06 Nov 2025 18:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E1813B304B
	for <lists+keyrings@lfdr.de>; Thu,  6 Nov 2025 17:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 381143502BD;
	Thu,  6 Nov 2025 17:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ybq4C9MF"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944D9280329
	for <keyrings@vger.kernel.org>; Thu,  6 Nov 2025 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762451149; cv=none; b=e3UEdrUAFw+X6oapvrJww99lcR5qBpyVmh+66qtKneABa23OtdAnnH5z0rFMsSkT0fMfXR8z7XSBpJlt534xnzNmhhmEeSzJcotSr0gdsTZqslsh+EZc1sfdyRrA1YNm+X+hq8+eA08CWqm8S3ydJyYLO31rgELf+CRMXH/UYro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762451149; c=relaxed/simple;
	bh=UJ0JNuAjO4bhNUyDJJTmWDirBsmcCcvUnyXrgyxFwC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBXmGluftx/gK7eMcolrkufUU+uUxO4u1SJg6KIR7N6XYLCrRj9KY+tyUhxQaL+hsempJGI812kCac4JoxbJ0M3YAEMjqOKm5NOTUUBZaSqQIfDhoxJOFu7PYpXgBlg0GTynOpN8RFmVtI8pm0hZBVIeqY8A9uuAn5oFNLCIWuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ybq4C9MF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762451145;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LPY+GhOJq5nNgZrUBrGTmZ1jrCpWP/ToTTWyLrp7aIg=;
	b=Ybq4C9MF7NdmHK9k0mcs5nYUlVKtWwfgbIqlcAsEvNS0cZRR+1xWq0sqGu5osQJ7anET5n
	GJZ++1xmhy+YmQxg2YmCY0paOQlGmtLRYQ+xSjBmFo9at0XA61E6W/031Opl9QqMki0n30
	oiTM3zP95eihsnREPHGq2jWQ8lhDMC4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-l8k5WjleOD2XX0xn47llEA-1; Thu,
 06 Nov 2025 12:45:40 -0500
X-MC-Unique: l8k5WjleOD2XX0xn47llEA-1
X-Mimecast-MFC-AGG-ID: l8k5WjleOD2XX0xn47llEA_1762451137
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7AC5E19560AE;
	Thu,  6 Nov 2025 17:45:37 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.6])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DFAC8180049F;
	Thu,  6 Nov 2025 17:45:33 +0000 (UTC)
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
Subject: [PATCH v7 6/8] pkcs7: Allow the signing algo to calculate the digest itself
Date: Thu,  6 Nov 2025 17:44:50 +0000
Message-ID: <20251106174456.31818-7-dhowells@redhat.com>
In-Reply-To: <20251106174456.31818-1-dhowells@redhat.com>
References: <20251106174456.31818-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

The ML-DSA public key algorithm really wants to calculate the message
digest itself, rather than having the digest precalculated and fed to it
separately as RSA does[*].  The kernel's PKCS#7 parser, however, is
designed around the latter approach.

  [*] ML-DSA does allow for an "external mu", but CMS doesn't yet have that
  standardised.

Fix this by noting in the public_key_signature struct when the signing
algorithm is going to want this and then, rather than doing the digest of
the authenticatedAttributes ourselves and overwriting the sig->digest with
that, replace sig->digest with a copy of the contents of the
authenticatedAttributes section and adjust the digest length to match.

This will then be fed to the public key algorithm as normal which can do
what it wants with the data.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/asymmetric_keys/pkcs7_parser.c |  4 +--
 crypto/asymmetric_keys/pkcs7_verify.c | 48 ++++++++++++++++++---------
 include/crypto/public_key.h           |  1 +
 3 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/crypto/asymmetric_keys/pkcs7_parser.c b/crypto/asymmetric_keys/pkcs7_parser.c
index 423d13c47545..3cdbab3b9f50 100644
--- a/crypto/asymmetric_keys/pkcs7_parser.c
+++ b/crypto/asymmetric_keys/pkcs7_parser.c
@@ -599,8 +599,8 @@ int pkcs7_sig_note_set_of_authattrs(void *context, size_t hdrlen,
 	}
 
 	/* We need to switch the 'CONT 0' to a 'SET OF' when we digest */
-	sinfo->authattrs = value - (hdrlen - 1);
-	sinfo->authattrs_len = vlen + (hdrlen - 1);
+	sinfo->authattrs = value - hdrlen;
+	sinfo->authattrs_len = vlen + hdrlen;
 	return 0;
 }
 
diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
index 6d6475e3a9bf..0f9f515b784d 100644
--- a/crypto/asymmetric_keys/pkcs7_verify.c
+++ b/crypto/asymmetric_keys/pkcs7_verify.c
@@ -70,8 +70,6 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 	 * digest we just calculated.
 	 */
 	if (sinfo->authattrs) {
-		u8 tag;
-
 		if (!sinfo->msgdigest) {
 			pr_warn("Sig %u: No messageDigest\n", sinfo->index);
 			ret = -EKEYREJECTED;
@@ -97,20 +95,40 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 		 * as the contents of the digest instead.  Note that we need to
 		 * convert the attributes from a CONT.0 into a SET before we
 		 * hash it.
+		 *
+		 * However, for certain algorithms, such as ML-DSA, the digest
+		 * is integrated into the signing algorithm.  In such a case,
+		 * we copy the authattrs, modifying the tag type, and set that
+		 * as the digest.
 		 */
-		memset(sig->digest, 0, sig->digest_size);
-
-		ret = crypto_shash_init(desc);
-		if (ret < 0)
-			goto error;
-		tag = ASN1_CONS_BIT | ASN1_SET;
-		ret = crypto_shash_update(desc, &tag, 1);
-		if (ret < 0)
-			goto error;
-		ret = crypto_shash_finup(desc, sinfo->authattrs,
-					 sinfo->authattrs_len, sig->digest);
-		if (ret < 0)
-			goto error;
+		if (sig->algo_does_hash) {
+			kfree(sig->digest);
+
+			ret = -ENOMEM;
+			sig->digest = kmalloc(umax(sinfo->authattrs_len, sig->digest_size),
+					      GFP_KERNEL);
+			if (!sig->digest)
+				goto error_no_desc;
+
+			sig->digest_size = sinfo->authattrs_len;
+			memcpy(sig->digest, sinfo->authattrs, sinfo->authattrs_len);
+			((u8 *)sig->digest)[0] = ASN1_CONS_BIT | ASN1_SET;
+			ret = 0;
+		} else {
+			u8 tag = ASN1_CONS_BIT | ASN1_SET;
+
+			ret = crypto_shash_init(desc);
+			if (ret < 0)
+				goto error;
+			ret = crypto_shash_update(desc, &tag, 1);
+			if (ret < 0)
+				goto error;
+			ret = crypto_shash_finup(desc, sinfo->authattrs + 1,
+						 sinfo->authattrs_len - 1,
+						 sig->digest);
+			if (ret < 0)
+				goto error;
+		}
 		pr_devel("AADigest = [%*ph]\n", 8, sig->digest);
 	}
 
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index 81098e00c08f..e4ec8003a3a4 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -46,6 +46,7 @@ struct public_key_signature {
 	u8 *digest;
 	u32 s_size;		/* Number of bytes in signature */
 	u32 digest_size;	/* Number of bytes in digest */
+	bool algo_does_hash;	/* Public key algo does its own hashing */
 	const char *pkey_algo;
 	const char *hash_algo;
 	const char *encoding;


