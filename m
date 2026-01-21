Return-Path: <keyrings+bounces-3884-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMNZFElVcWkNEwAAu9opvQ
	(envelope-from <keyrings+bounces-3884-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 23:38:01 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1E15EEC7
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 23:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 62F96588B6F
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 22:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D82244CAF8;
	Wed, 21 Jan 2026 22:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GYB98zvr"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2DA44CAF6
	for <keyrings@vger.kernel.org>; Wed, 21 Jan 2026 22:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769035002; cv=none; b=J5qeRudkD36DH1rGPpb1wzf7EOi1ksSsJz50ClAx7K8VHywjYfXwVcO89T9S/VWccYYCTjUDhIFn0PiyXslJRAD8qAwGelUyLXG7hCANlfv6BZyE/ZcAsOIdn99ztKxOuYVqLsQASE/+HLwG9R5P2C+eZmtPdvap4QpUJgwcrxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769035002; c=relaxed/simple;
	bh=OKI6BSVaGfcl+CxBN/rpukjmC043zkiyqle/0lONOgU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oZMOlTFlUDOftX5/xI/HHGuf/kr4k879ZXdWJaEFsWDFM7oIQjOlWNUyxzM+8BqysXbidufOACD/ueypgwMkLuUkGpQzKoakjXhFcuIbG1NtTKhT/Hw5l4I5ZZ6DQ1jB1ohtiuRYoVCpUpPSLBG3qdaWJRPkK7IHYBOLdoNyvlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GYB98zvr; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769034999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jF5kwnwiR2/lb/mlnw1XFj/OGuBNHU6V+p5Xr8xTMgM=;
	b=GYB98zvr/14rVinMGybWSGfs3q7w2VqGzZfOlcTe/qB346+IyZYGuhPDvdBXvtRuMwp2fZ
	lx1LpYFbfStA7U9pnS3kQhlLFrofhHGmviUTnk0rlohmpPSw/yXXDk3yjbp1pfHpzulbB4
	sEk6wguT/sA0ZTU9FnosgxZgJvDFtpE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-196-vysiwh1AN4-BUb0icI9qyw-1; Wed,
 21 Jan 2026 17:36:35 -0500
X-MC-Unique: vysiwh1AN4-BUb0icI9qyw-1
X-Mimecast-MFC-AGG-ID: vysiwh1AN4-BUb0icI9qyw_1769034992
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1380E19560BB;
	Wed, 21 Jan 2026 22:36:32 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.2])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 324A11800109;
	Wed, 21 Jan 2026 22:36:28 +0000 (UTC)
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
Subject: [PATCH v14 3/5] pkcs7: Allow the signing algo to do whatever digestion it wants itself
Date: Wed, 21 Jan 2026 22:36:05 +0000
Message-ID: <20260121223609.1650735-4-dhowells@redhat.com>
In-Reply-To: <20260121223609.1650735-1-dhowells@redhat.com>
References: <20260121223609.1650735-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-3884-lists,keyrings=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apana.org.au:email,cloudflare.com:email,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns,chronox.de:email,wunner.de:email]
X-Rspamd-Queue-Id: EA1E15EEC7
X-Rspamd-Action: no action

Allow the data to be verified in a PKCS#7 or CMS message to be passed
directly to an asymmetric cipher algorithm (e.g. ML-DSA) if it wants to do
whatever passes for hashing/digestion itself.  The normal digestion of the
data is then skipped as that would be ignored unless another signed info in
the message has some other algorithm that needs it.

The 'data to be verified' may be the content of the PKCS#7 message or it
will be the authenticatedAttributes (signedAttrs if CMS), modified, if
those are present.

This is done by:

 (1) Rename ->digest and ->digest_len to ->m and ->m_size to represent the
     input to the signature verification algorithm, reflecting that
     ->digest may no longer actually *be* a digest.

 (2) Make ->m and ->m_size point to the data to be verified rather than
     making public_key_verify_signature() access the data directly.  This
     is so that keyctl(KEYCTL_PKEY_VERIFY) will still work.

 (3) Add a flag, ->algo_takes_data, to indicate that the verification
     algorithm wants to access the data to be verified directly rather than
     having it digested first.

 (4) If the PKCS#7 message has authenticatedAttributes (or CMS signedAtts),
     then the digest contained therein will be validated as now, and the
     modified attrs blob will either be digested or assigned to ->m as
     appropriate.

 (5) For ML-DSA, point ->m to the TBSCertificate instead of digesting it
     and using the digest.

Note that whilst ML-DSA does allow for an "external mu", CMS doesn't yet
have that standardised.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/asymmetric_keys/asymmetric_type.c |  4 +-
 crypto/asymmetric_keys/pkcs7_parser.c    |  4 +-
 crypto/asymmetric_keys/pkcs7_verify.c    | 79 ++++++++++++++++--------
 crypto/asymmetric_keys/public_key.c      |  3 +-
 crypto/asymmetric_keys/signature.c       |  3 +-
 crypto/asymmetric_keys/x509_public_key.c | 19 ++++--
 include/crypto/public_key.h              |  6 +-
 security/integrity/digsig_asymmetric.c   |  4 +-
 8 files changed, 79 insertions(+), 43 deletions(-)

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
index 6d6475e3a9bf..a5b2ed4d53fd 100644
--- a/crypto/asymmetric_keys/pkcs7_verify.c
+++ b/crypto/asymmetric_keys/pkcs7_verify.c
@@ -30,8 +30,18 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 
 	kenter(",%u,%s", sinfo->index, sinfo->sig->hash_algo);
 
+	if (!sinfo->authattrs && sig->algo_takes_data) {
+		/* There's no intermediate digest and the signature algo
+		 * doesn't want the data prehashing.
+		 */
+		sig->m = (void *)pkcs7->data;
+		sig->m_size = pkcs7->data_len;
+		sig->m_free = false;
+		return 0;
+	}
+
 	/* The digest was calculated already. */
-	if (sig->digest)
+	if (sig->m)
 		return 0;
 
 	if (!sinfo->sig->hash_algo)
@@ -45,12 +55,13 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 		return (PTR_ERR(tfm) == -ENOENT) ? -ENOPKG : PTR_ERR(tfm);
 
 	desc_size = crypto_shash_descsize(tfm) + sizeof(*desc);
-	sig->digest_size = crypto_shash_digestsize(tfm);
+	sig->m_size = crypto_shash_digestsize(tfm);
 
 	ret = -ENOMEM;
-	sig->digest = kmalloc(sig->digest_size, GFP_KERNEL);
-	if (!sig->digest)
+	sig->m = kmalloc(umax(sinfo->authattrs_len, sig->m_size), GFP_KERNEL);
+	if (!sig->m)
 		goto error_no_desc;
+	sig->m_free = true;
 
 	desc = kzalloc(desc_size, GFP_KERNEL);
 	if (!desc)
@@ -59,33 +70,30 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
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
 	 * digest we just calculated.
 	 */
 	if (sinfo->authattrs) {
-		u8 tag;
-
 		if (!sinfo->msgdigest) {
 			pr_warn("Sig %u: No messageDigest\n", sinfo->index);
 			ret = -EKEYREJECTED;
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
@@ -97,21 +105,33 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
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
-		pr_devel("AADigest = [%*ph]\n", 8, sig->digest);
+		if (sig->algo_takes_data) {
+			sig->m_size = sinfo->authattrs_len;
+			memcpy(sig->m, sinfo->authattrs, sinfo->authattrs_len);
+			sig->m[0] = ASN1_CONS_BIT | ASN1_SET;
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
+						 sig->m);
+			if (ret < 0)
+				goto error;
+		}
+		pr_devel("AADigest = [%*ph]\n", 8, sig->m);
 	}
 
 error:
@@ -137,9 +157,14 @@ int pkcs7_get_digest(struct pkcs7_message *pkcs7, const u8 **buf, u32 *len,
 	ret = pkcs7_digest(pkcs7, sinfo);
 	if (ret)
 		return ret;
+	if (!sinfo->sig->m_free) {
+		pr_notice_once("%s: No digest available\n", __func__);
+		return -EINVAL; /* TODO: MLDSA doesn't necessarily calculate an
+				 * intermediate digest. */
+	}
 
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
index 041d04b5c953..a5ac7a53b670 100644
--- a/crypto/asymmetric_keys/signature.c
+++ b/crypto/asymmetric_keys/signature.c
@@ -28,7 +28,8 @@ void public_key_signature_free(struct public_key_signature *sig)
 		for (i = 0; i < ARRAY_SIZE(sig->auth_ids); i++)
 			kfree(sig->auth_ids[i]);
 		kfree(sig->s);
-		kfree(sig->digest);
+		if (sig->m_free)
+			kfree(sig->m);
 		kfree(sig);
 	}
 }
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 6d002e3b20c5..27b4fea37845 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -50,6 +50,14 @@ int x509_get_sig_params(struct x509_certificate *cert)
 
 	sig->s_size = cert->raw_sig_size;
 
+	if (sig->algo_takes_data) {
+		/* The signature algorithm does whatever passes for hashing. */
+		sig->m = (u8 *)cert->tbs;
+		sig->m_size = cert->tbs_size;
+		sig->m_free = false;
+		goto out;
+	}
+
 	/* Allocate the hashing algorithm we're going to need and find out how
 	 * big the hash operational data will be.
 	 */
@@ -63,12 +71,13 @@ int x509_get_sig_params(struct x509_certificate *cert)
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
+	sig->m_free = true;
 
 	desc = kzalloc(desc_size, GFP_KERNEL);
 	if (!desc)
@@ -76,8 +85,7 @@ int x509_get_sig_params(struct x509_certificate *cert)
 
 	desc->tfm = tfm;
 
-	ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
-				  sig->digest);
+	ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size, sig->m);
 	if (ret < 0)
 		goto error_2;
 
@@ -85,6 +93,7 @@ int x509_get_sig_params(struct x509_certificate *cert)
 	kfree(desc);
 error:
 	crypto_free_shash(tfm);
+out:
 	pr_devel("<==%s() = %d\n", __func__, ret);
 	return ret;
 }
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index 81098e00c08f..4c5199b20338 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -43,9 +43,11 @@ extern void public_key_free(struct public_key *key);
 struct public_key_signature {
 	struct asymmetric_key_id *auth_ids[3];
 	u8 *s;			/* Signature */
-	u8 *digest;
+	u8 *m;			/* Message data to pass to verifier */
 	u32 s_size;		/* Number of bytes in signature */
-	u32 digest_size;	/* Number of bytes in digest */
+	u32 m_size;		/* Number of bytes in ->m */
+	bool m_free;		/* T if ->m needs freeing */
+	bool algo_takes_data;	/* T if public key algo operates on data, not a hash */
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


