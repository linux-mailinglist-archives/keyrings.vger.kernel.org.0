Return-Path: <keyrings+bounces-3833-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKzhD/arb2miEwAAu9opvQ
	(envelope-from <keyrings+bounces-3833-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 17:23:18 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BA73C47694
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 17:23:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1010F60CD17
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 15:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 338D144D6A1;
	Tue, 20 Jan 2026 14:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QTJAENW0"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F088C44A727
	for <keyrings@vger.kernel.org>; Tue, 20 Jan 2026 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920699; cv=none; b=k4nwc6z527orabtcX3civrinI3vtiGhL9aGNQmHyV6b3ktDlbEcejazMJXf9a5zWax0NsOK+7ZlMfzvtgQ3QR6cKqLS7rS/8oiWkZr7VE51YTE3JdGD5PBemE1P+72PQIei4Zk/4gqEmxFu8iP6AKv2mlUNc1FKcbmt4NTwTSFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920699; c=relaxed/simple;
	bh=nEUVE4lPaWMhgtTg+if4fgi14Fj6AL4hj0BAyzkMbFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T45P9nW7FYmfM94gUBzF8/hZzhnLh7yYUSJ1Iejw7eumcjdAwpohEVUc7YGSQ/9hTHbmxpFhDCWVCbFf8iPQptKHbxMiir3GY9LFoqViWv8VasKQ58wcvTWmfY7mSfI/LX1z4nPy2D+2SChgBZTDde8wDVrZ2AjdpucyEjwhIEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QTJAENW0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768920695;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PuQhGJKPGqzqhoHtMa/bMYgLGosbNaX8zOBoi3O57Cs=;
	b=QTJAENW0LX8gRVGXmroMLsQMRl4YF5EGWY830i5+mjFrZqNiY1Bufoix3CMlGruNyX6Hy7
	L54B4FrtQMrRvqdBPWALxgDx6Wu0NygTKs8ulbVVSUxUyw8/dTz/XK8oeNMEw43BxonANt
	vBYCo6TZyMTzvoKWpBtvNnNSKhNkn5I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-78lJFojDNG25Jj1b0eSilA-1; Tue,
 20 Jan 2026 09:51:30 -0500
X-MC-Unique: 78lJFojDNG25Jj1b0eSilA-1
X-Mimecast-MFC-AGG-ID: 78lJFojDNG25Jj1b0eSilA_1768920688
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 050ED1956058;
	Tue, 20 Jan 2026 14:51:28 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1A6331800993;
	Tue, 20 Jan 2026 14:51:23 +0000 (UTC)
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
Subject: [PATCH v13 03/12] pkcs7: Allow direct signing of data with ML-DSA
Date: Tue, 20 Jan 2026 14:50:49 +0000
Message-ID: <20260120145103.1176337-4-dhowells@redhat.com>
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
	TAGGED_FROM(0.00)[bounces-3833-lists,keyrings=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[chronox.de:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,wunner.de:email,apana.org.au:email,cloudflare.com:email]
X-Rspamd-Queue-Id: BA73C47694
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Allow the data part of a PKCS#7 or CMS messge to be passed directly to an
asymmetric cipher algorithm (e.g. ML-DSA) if it wants to do the digestion
itself.  The normal digestion of the data is then skipped as that would be
ignored unless another signed info in the message has some other algorithm
that needs it.

This is done by setting the digest parameters to point to the data to be
verified rather than making public_key_verify_signature() access the data
directly.  This is so that keyctl(KEYCTL_PKEY_VERIFY) will still work.

To test this with ML-DSA, sign-file must be built with openssl > v3.5 and
must include the following fix:

	https://github.com/openssl/openssl/pull/28923

which will allow CMS_NOATTR to be used with CMS_sign() for an ML-DSA key.

sign-file will remove CMS_NOATTR if openssl is earlier than v4 and signed
attributes will be used.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/asymmetric_keys/mscode_parser.c   |  2 +-
 crypto/asymmetric_keys/pkcs7_verify.c    | 18 ++++++++++++++++++
 crypto/asymmetric_keys/signature.c       |  3 ++-
 crypto/asymmetric_keys/verify_pefile.c   |  3 ++-
 crypto/asymmetric_keys/verify_pefile.h   |  1 +
 crypto/asymmetric_keys/x509_public_key.c |  1 +
 include/crypto/public_key.h              |  1 +
 7 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/crypto/asymmetric_keys/mscode_parser.c b/crypto/asymmetric_keys/mscode_parser.c
index 8aecbe4637f3..54dac17f19e2 100644
--- a/crypto/asymmetric_keys/mscode_parser.c
+++ b/crypto/asymmetric_keys/mscode_parser.c
@@ -124,6 +124,6 @@ int mscode_note_digest(void *context, size_t hdrlen,
 		return -ENOMEM;
 
 	ctx->digest_len = vlen;
-
+	ctx->digest_free = true;
 	return 0;
 }
diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
index 0f9f515b784d..46eee9811023 100644
--- a/crypto/asymmetric_keys/pkcs7_verify.c
+++ b/crypto/asymmetric_keys/pkcs7_verify.c
@@ -30,6 +30,16 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 
 	kenter(",%u,%s", sinfo->index, sinfo->sig->hash_algo);
 
+	if (!sinfo->authattrs && sig->algo_does_hash) {
+		/* There's no intermediate digest and the signature algo
+		 * doesn't want the data prehashing.
+		 */
+		sig->digest = (void *)pkcs7->data;
+		sig->digest_size = pkcs7->data_len;
+		sig->digest_free = false;
+		return 0;
+	}
+
 	/* The digest was calculated already. */
 	if (sig->digest)
 		return 0;
@@ -51,6 +61,7 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 	sig->digest = kmalloc(sig->digest_size, GFP_KERNEL);
 	if (!sig->digest)
 		goto error_no_desc;
+	sig->digest_free = true;
 
 	desc = kzalloc(desc_size, GFP_KERNEL);
 	if (!desc)
@@ -103,6 +114,7 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 		 */
 		if (sig->algo_does_hash) {
 			kfree(sig->digest);
+			sig->digest_free = false;
 
 			ret = -ENOMEM;
 			sig->digest = kmalloc(umax(sinfo->authattrs_len, sig->digest_size),
@@ -110,6 +122,7 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 			if (!sig->digest)
 				goto error_no_desc;
 
+			sig->digest_free = true;
 			sig->digest_size = sinfo->authattrs_len;
 			memcpy(sig->digest, sinfo->authattrs, sinfo->authattrs_len);
 			((u8 *)sig->digest)[0] = ASN1_CONS_BIT | ASN1_SET;
@@ -155,6 +168,11 @@ int pkcs7_get_digest(struct pkcs7_message *pkcs7, const u8 **buf, u32 *len,
 	ret = pkcs7_digest(pkcs7, sinfo);
 	if (ret)
 		return ret;
+	if (!sinfo->sig->digest_free) {
+		pr_notice_once("%s: No digest available\n", __func__);
+		return -EINVAL; /* TODO: MLDSA doesn't necessarily calculate an
+				 * intermediate digest. */
+	}
 
 	*buf = sinfo->sig->digest;
 	*len = sinfo->sig->digest_size;
diff --git a/crypto/asymmetric_keys/signature.c b/crypto/asymmetric_keys/signature.c
index 041d04b5c953..bea01cf27d0a 100644
--- a/crypto/asymmetric_keys/signature.c
+++ b/crypto/asymmetric_keys/signature.c
@@ -28,7 +28,8 @@ void public_key_signature_free(struct public_key_signature *sig)
 		for (i = 0; i < ARRAY_SIZE(sig->auth_ids); i++)
 			kfree(sig->auth_ids[i]);
 		kfree(sig->s);
-		kfree(sig->digest);
+		if (sig->digest_free)
+			kfree(sig->digest);
 		kfree(sig);
 	}
 }
diff --git a/crypto/asymmetric_keys/verify_pefile.c b/crypto/asymmetric_keys/verify_pefile.c
index 1f3b227ba7f2..30c23aea3b25 100644
--- a/crypto/asymmetric_keys/verify_pefile.c
+++ b/crypto/asymmetric_keys/verify_pefile.c
@@ -451,6 +451,7 @@ int verify_pefile_signature(const void *pebuf, unsigned pelen,
 	ret = pefile_digest_pe(pebuf, pelen, &ctx);
 
 error:
-	kfree_sensitive(ctx.digest);
+	if (ctx.digest_free)
+		kfree_sensitive(ctx.digest);
 	return ret;
 }
diff --git a/crypto/asymmetric_keys/verify_pefile.h b/crypto/asymmetric_keys/verify_pefile.h
index e1628e100cde..f641437264b4 100644
--- a/crypto/asymmetric_keys/verify_pefile.h
+++ b/crypto/asymmetric_keys/verify_pefile.h
@@ -22,6 +22,7 @@ struct pefile_context {
 	/* PKCS#7 MS Individual Code Signing content */
 	const void	*digest;		/* Digest */
 	unsigned	digest_len;		/* Digest length */
+	bool		digest_free;		/* T if digest should be freed */
 	const char	*digest_algo;		/* Digest algorithm */
 };
 
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 12e3341e806b..2243add11d48 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -56,6 +56,7 @@ int x509_get_sig_params(struct x509_certificate *cert)
 	sig->digest = kmalloc(sig->digest_size, GFP_KERNEL);
 	if (!sig->digest)
 		goto error;
+	sig->digest_free = true;
 
 	desc = kzalloc(desc_size, GFP_KERNEL);
 	if (!desc)
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index e4ec8003a3a4..68899a49cd0d 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -46,6 +46,7 @@ struct public_key_signature {
 	u8 *digest;
 	u32 s_size;		/* Number of bytes in signature */
 	u32 digest_size;	/* Number of bytes in digest */
+	bool digest_free;	/* T if digest needs freeing */
 	bool algo_does_hash;	/* Public key algo does its own hashing */
 	const char *pkey_algo;
 	const char *hash_algo;


