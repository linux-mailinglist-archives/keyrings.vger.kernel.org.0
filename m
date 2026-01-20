Return-Path: <keyrings+bounces-3832-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wD2rFTKyb2nMKgAAu9opvQ
	(envelope-from <keyrings+bounces-3832-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 17:49:54 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BEF47F29
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 17:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1B77560C55D
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 15:04:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E90E944A72E;
	Tue, 20 Jan 2026 14:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SKw9claS"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF1E426EA0
	for <keyrings@vger.kernel.org>; Tue, 20 Jan 2026 14:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920694; cv=none; b=XXR3v6SAc5Kpb0ipf2p5KsmDuwZ2ZV+ZQEhdN47UY+dsKt0WE6QTY6B1ld8K4NVq7yvyHrQT+70Fxv4z9/kQBRLdwgSGdK13GVSOX7IiITk76iXGS9pJXzYuyYPnYK1nlc9nSCbGReaWGjT9hgISuk2n4ZMr9CaH5Pu9ROFyp8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920694; c=relaxed/simple;
	bh=UJ0JNuAjO4bhNUyDJJTmWDirBsmcCcvUnyXrgyxFwC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pv6sf9y9ThR8rxRTXvF+WmlpCA7eCEemuYgJGfJZbXqhv72jzSDfprf2hMYexa+e78ToPs7pTGncm3XGlHlRG0tSxYiCh0qft4QEjJU7FGyQRBt+L6XlKudGYfYdXRviY67DYRbfywfMZh9I8JwNI303IveYd4Q0qnz6NDh1kMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SKw9claS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768920692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LPY+GhOJq5nNgZrUBrGTmZ1jrCpWP/ToTTWyLrp7aIg=;
	b=SKw9claS3bjOKebEdkcLPzd13gPup+qFj4t/ag5tYSkc0eUS7cUXv2IWVq7e35Q+qLGL+s
	XiTmMXNNI8z45V2zT6xAAvdgBe1epykFu16NJ5yAjRJERHvsoLced1tllQ6POi8RAK1QIm
	R0Ll38NlgWj6YtQsj42S11YyHBI147U=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-551-MYas2Sv0PYCP7ywNgsb4hA-1; Tue,
 20 Jan 2026 09:51:26 -0500
X-MC-Unique: MYas2Sv0PYCP7ywNgsb4hA-1
X-Mimecast-MFC-AGG-ID: MYas2Sv0PYCP7ywNgsb4hA_1768920683
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B54EE18003FD;
	Tue, 20 Jan 2026 14:51:22 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 876681800993;
	Tue, 20 Jan 2026 14:51:18 +0000 (UTC)
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
Subject: [PATCH v13 02/12] pkcs7: Allow the signing algo to calculate the digest itself
Date: Tue, 20 Jan 2026 14:50:48 +0000
Message-ID: <20260120145103.1176337-3-dhowells@redhat.com>
In-Reply-To: <20260120145103.1176337-1-dhowells@redhat.com>
References: <20260120145103.1176337-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3832-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[keyrings];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,chronox.de:email,wunner.de:email,apana.org.au:email,cloudflare.com:email]
X-Rspamd-Queue-Id: E6BEF47F29
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


