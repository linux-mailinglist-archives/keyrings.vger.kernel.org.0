Return-Path: <keyrings+bounces-3947-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wE52DFF7d2n7ggEAu9opvQ
	(envelope-from <keyrings+bounces-3947-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 15:33:53 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FAA898A2
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 15:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBE95307A971
	for <lists+keyrings@lfdr.de>; Mon, 26 Jan 2026 14:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD61B2367D3;
	Mon, 26 Jan 2026 14:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WsllWSSD"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D726A22D781
	for <keyrings@vger.kernel.org>; Mon, 26 Jan 2026 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437813; cv=none; b=PP5WZ49lXeQGYrlj3JShfb4Dt1P/FcyXq6Mlbp2q+XRpmMUuBtR4Q4oA1iW+TZxMiMZBoKimi2nCo47VdZzai0V3KgsdN/3LWKGSPrHp5Li0Af9tRhdu1BYqW5zmhaAO0O+i7AtyR2jhFM+LRvKq23wToh/At9/NfgiXn5lnXKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437813; c=relaxed/simple;
	bh=BaZwkH+RnIU/w8tcrlS+3/n3/FqQIRDSqJGaDeb2APE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tZTy4objCfFAnl3Iki1aCvR0Wo3vcnN86aooph9lIVLEryXPDGYJ6RcEx4YMe+9TAd5R43L+LFgr1kq/2PGOzclLqczeE+lajip6FEVtQO5A2HCA2Io1ylO4bN5kECgJ9a/FSNXskfNMvyab9g8PqpYiA2RAQ5OX3emJCriIWz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WsllWSSD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769437810;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RcGuaPaMRdnlMQS/hyjV74vU7Y2QsfjgMG98WcB7epo=;
	b=WsllWSSDgo/FonjglCwnKjAUbYlEEeYGilpe/tLMqsQmYv4gbT3KA15nat6RjdKsKu69NA
	F2h6A264ehOIuIcnNg3PLgfUJVdhXFjFBEOB3GZ5nMtVoHIXRef1qYPthTZHzS2EWgqSDn
	m8f1hwQcLdG5wTaPCe9rOHsBzMKIIJ8=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-628-bNllV1vXPpaHTFsYBK0fJw-1; Mon,
 26 Jan 2026 09:30:04 -0500
X-MC-Unique: bNllV1vXPpaHTFsYBK0fJw-1
X-Mimecast-MFC-AGG-ID: bNllV1vXPpaHTFsYBK0fJw_1769437802
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 78BE01944DF2;
	Mon, 26 Jan 2026 14:30:02 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.44.33.164])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2F8661956053;
	Mon, 26 Jan 2026 14:29:56 +0000 (UTC)
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
Subject: [PATCH v15 3/7] pkcs7, x509: Rename ->digest to ->m
Date: Mon, 26 Jan 2026 14:29:24 +0000
Message-ID: <20260126142931.1940586-4-dhowells@redhat.com>
In-Reply-To: <20260126142931.1940586-1-dhowells@redhat.com>
References: <20260126142931.1940586-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3947-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[keyrings];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apana.org.au:email,wunner.de:email,chronox.de:email,cloudflare.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 91FAA898A2
X-Rspamd-Action: no action

Rename ->digest and ->digest_len to ->m and ->m_size to represent the input
to the signature verification algorithm, reflecting that ->digest may no
longer actually *be* a digest.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Jarkko Sakkinen <jarkko@kernel.org>
cc: Stephan Mueller <smueller@chronox.de>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/asymmetric_keys/asymmetric_type.c |  4 ++--
 crypto/asymmetric_keys/pkcs7_verify.c    | 28 ++++++++++++------------
 crypto/asymmetric_keys/public_key.c      |  3 +--
 crypto/asymmetric_keys/signature.c       |  2 +-
 crypto/asymmetric_keys/x509_public_key.c | 10 ++++-----
 include/crypto/public_key.h              |  4 ++--
 security/integrity/digsig_asymmetric.c   |  4 ++--
 7 files changed, 26 insertions(+), 29 deletions(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index 348966ea2175..2326743310b1 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -593,10 +593,10 @@ static int asymmetric_key_verify_signature(struct kernel_pkey_params *params,
 {
 	struct public_key_signature sig = {
 		.s_size		= params->in2_len,
-		.digest_size	= params->in_len,
+		.m_size		= params->in_len,
 		.encoding	= params->encoding,
 		.hash_algo	= params->hash_algo,
-		.digest		= (void *)in,
+		.m		= (void *)in,
 		.s		= (void *)in2,
 	};
 
diff --git a/crypto/asymmetric_keys/pkcs7_verify.c b/crypto/asymmetric_keys/pkcs7_verify.c
index 6d6475e3a9bf..aa085ec6fb1c 100644
--- a/crypto/asymmetric_keys/pkcs7_verify.c
+++ b/crypto/asymmetric_keys/pkcs7_verify.c
@@ -31,7 +31,7 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 	kenter(",%u,%s", sinfo->index, sinfo->sig->hash_algo);
 
 	/* The digest was calculated already. */
-	if (sig->digest)
+	if (sig->m)
 		return 0;
 
 	if (!sinfo->sig->hash_algo)
@@ -45,11 +45,11 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 		return (PTR_ERR(tfm) == -ENOENT) ? -ENOPKG : PTR_ERR(tfm);
 
 	desc_size = crypto_shash_descsize(tfm) + sizeof(*desc);
-	sig->digest_size = crypto_shash_digestsize(tfm);
+	sig->m_size = crypto_shash_digestsize(tfm);
 
 	ret = -ENOMEM;
-	sig->digest = kmalloc(sig->digest_size, GFP_KERNEL);
-	if (!sig->digest)
+	sig->m = kmalloc(sig->m_size, GFP_KERNEL);
+	if (!sig->m)
 		goto error_no_desc;
 
 	desc = kzalloc(desc_size, GFP_KERNEL);
@@ -59,11 +59,10 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 	desc->tfm   = tfm;
 
 	/* Digest the message [RFC2315 9.3] */
-	ret = crypto_shash_digest(desc, pkcs7->data, pkcs7->data_len,
-				  sig->digest);
+	ret = crypto_shash_digest(desc, pkcs7->data, pkcs7->data_len, sig->m);
 	if (ret < 0)
 		goto error;
-	pr_devel("MsgDigest = [%*ph]\n", 8, sig->digest);
+	pr_devel("MsgDigest = [%*ph]\n", 8, sig->m);
 
 	/* However, if there are authenticated attributes, there must be a
 	 * message digest attribute amongst them which corresponds to the
@@ -78,14 +77,14 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 			goto error;
 		}
 
-		if (sinfo->msgdigest_len != sig->digest_size) {
+		if (sinfo->msgdigest_len != sig->m_size) {
 			pr_warn("Sig %u: Invalid digest size (%u)\n",
 				sinfo->index, sinfo->msgdigest_len);
 			ret = -EBADMSG;
 			goto error;
 		}
 
-		if (memcmp(sig->digest, sinfo->msgdigest,
+		if (memcmp(sig->m, sinfo->msgdigest,
 			   sinfo->msgdigest_len) != 0) {
 			pr_warn("Sig %u: Message digest doesn't match\n",
 				sinfo->index);
@@ -98,7 +97,8 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 		 * convert the attributes from a CONT.0 into a SET before we
 		 * hash it.
 		 */
-		memset(sig->digest, 0, sig->digest_size);
+		memset(sig->m, 0, sig->m_size);
+
 
 		ret = crypto_shash_init(desc);
 		if (ret < 0)
@@ -108,10 +108,10 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 		if (ret < 0)
 			goto error;
 		ret = crypto_shash_finup(desc, sinfo->authattrs,
-					 sinfo->authattrs_len, sig->digest);
+					 sinfo->authattrs_len, sig->m);
 		if (ret < 0)
 			goto error;
-		pr_devel("AADigest = [%*ph]\n", 8, sig->digest);
+		pr_devel("AADigest = [%*ph]\n", 8, sig->m);
 	}
 
 error:
@@ -138,8 +138,8 @@ int pkcs7_get_digest(struct pkcs7_message *pkcs7, const u8 **buf, u32 *len,
 	if (ret)
 		return ret;
 
-	*buf = sinfo->sig->digest;
-	*len = sinfo->sig->digest_size;
+	*buf = sinfo->sig->m;
+	*len = sinfo->sig->m_size;
 
 	i = match_string(hash_algo_name, HASH_ALGO__LAST,
 			 sinfo->sig->hash_algo);
diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index e5b177c8e842..a46356e0c08b 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -425,8 +425,7 @@ int public_key_verify_signature(const struct public_key *pkey,
 	if (ret)
 		goto error_free_key;
 
-	ret = crypto_sig_verify(tfm, sig->s, sig->s_size,
-				sig->digest, sig->digest_size);
+	ret = crypto_sig_verify(tfm, sig->s, sig->s_size, sig->m, sig->m_size);
 
 error_free_key:
 	kfree_sensitive(key);
diff --git a/crypto/asymmetric_keys/signature.c b/crypto/asymmetric_keys/signature.c
index 041d04b5c953..f4ec126121b3 100644
--- a/crypto/asymmetric_keys/signature.c
+++ b/crypto/asymmetric_keys/signature.c
@@ -28,7 +28,7 @@ void public_key_signature_free(struct public_key_signature *sig)
 		for (i = 0; i < ARRAY_SIZE(sig->auth_ids); i++)
 			kfree(sig->auth_ids[i]);
 		kfree(sig->s);
-		kfree(sig->digest);
+		kfree(sig->m);
 		kfree(sig);
 	}
 }
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 79cc7b7a0630..3854f7ae4ed0 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -63,11 +63,11 @@ int x509_get_sig_params(struct x509_certificate *cert)
 	}
 
 	desc_size = crypto_shash_descsize(tfm) + sizeof(*desc);
-	sig->digest_size = crypto_shash_digestsize(tfm);
+	sig->m_size = crypto_shash_digestsize(tfm);
 
 	ret = -ENOMEM;
-	sig->digest = kmalloc(sig->digest_size, GFP_KERNEL);
-	if (!sig->digest)
+	sig->m = kmalloc(sig->m_size, GFP_KERNEL);
+	if (!sig->m)
 		goto error;
 
 	desc = kzalloc(desc_size, GFP_KERNEL);
@@ -76,9 +76,7 @@ int x509_get_sig_params(struct x509_certificate *cert)
 
 	desc->tfm = tfm;
 
-	ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
-				  sig->digest);
-
+	ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size, sig->m);
 	if (ret < 0)
 		goto error_2;
 
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index 81098e00c08f..bd38ba4d217d 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -43,9 +43,9 @@ extern void public_key_free(struct public_key *key);
 struct public_key_signature {
 	struct asymmetric_key_id *auth_ids[3];
 	u8 *s;			/* Signature */
-	u8 *digest;
+	u8 *m;			/* Message data to pass to verifier */
 	u32 s_size;		/* Number of bytes in signature */
-	u32 digest_size;	/* Number of bytes in digest */
+	u32 m_size;		/* Number of bytes in ->m */
 	const char *pkey_algo;
 	const char *hash_algo;
 	const char *encoding;
diff --git a/security/integrity/digsig_asymmetric.c b/security/integrity/digsig_asymmetric.c
index 457c0a396caf..87be85f477d1 100644
--- a/security/integrity/digsig_asymmetric.c
+++ b/security/integrity/digsig_asymmetric.c
@@ -121,8 +121,8 @@ int asymmetric_verify(struct key *keyring, const char *sig,
 		goto out;
 	}
 
-	pks.digest = (u8 *)data;
-	pks.digest_size = datalen;
+	pks.m = (u8 *)data;
+	pks.m_size = datalen;
 	pks.s = hdr->sig;
 	pks.s_size = siglen;
 	ret = verify_signature(key, &pks);


