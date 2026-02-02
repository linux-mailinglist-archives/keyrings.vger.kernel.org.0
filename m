Return-Path: <keyrings+bounces-4008-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI3vCB/ZgGnMBwMAu9opvQ
	(envelope-from <keyrings+bounces-4008-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 18:04:31 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5985CF561
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 18:04:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5610A302B7C1
	for <lists+keyrings@lfdr.de>; Mon,  2 Feb 2026 17:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79001385500;
	Mon,  2 Feb 2026 17:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CPqP5Zel"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1CB3815D3
	for <keyrings@vger.kernel.org>; Mon,  2 Feb 2026 17:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051780; cv=none; b=F/ipKdCc8+grxeyXQCL7J4FG4nyIYE98bNpMwcZzcu0BhDjeFVp8mtGE3BtEjr4a2rTjPmeXV9ZhEnd97BTmcUSxlSjs1lNrqSDWC0t2aC6oAC3qttW2D02nqnCQcBR0eaCfKHj2jNrb2fubJD51SYnNEww5apoWB8vxfvD/nmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051780; c=relaxed/simple;
	bh=DFb76c+PUi4IziO0qvjEAggO+1DAEB4SYumgeLR5/uw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cNrnprAm6e5Iq7ri5YsQAfotfSCsZj8HKeKrkw0OBETwzrpvBKfXINCC+nAgHBv76I6EBnLOj7Noa1O9yYS5HtTr1eg+0za2x1iLCzUuNZdZVzyGuLqLlkkQbWHGJKH6w8jqn9uEmsta+u6L/Vl4nVUNzHV24luVXY2fivdgUDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CPqP5Zel; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770051778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZqciBHgX80r/eitlB1B79Iv3FzWXlKpKclGh0VAs2lk=;
	b=CPqP5Zel0og2oVfWqorbMnX7YHFUS7yesUsCnP7OuZGKnHxLgyn7Fsev5d81bdsGauXZAE
	gKG30KJiWyvCT/L+2LId/QCef5Y8GxewkgaD8qUNFqk2ggGWSfn6BkAhFkq1+CWrwKs36a
	QuWkGeChxJnOpWM1XKLp2atK/C9lfpU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-27-Mx5qgQ3wP0u9cNmCTZcxpQ-1; Mon,
 02 Feb 2026 12:02:54 -0500
X-MC-Unique: Mx5qgQ3wP0u9cNmCTZcxpQ-1
X-Mimecast-MFC-AGG-ID: Mx5qgQ3wP0u9cNmCTZcxpQ_1770051772
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 713DF19540EA;
	Mon,  2 Feb 2026 17:02:52 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.44.33.164])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4EA3630001A7;
	Mon,  2 Feb 2026 17:02:46 +0000 (UTC)
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
Subject: [PATCH v16 4/7] pkcs7: Allow the signing algo to do whatever digestion it wants itself
Date: Mon,  2 Feb 2026 17:02:09 +0000
Message-ID: <20260202170216.2467036-5-dhowells@redhat.com>
In-Reply-To: <20260202170216.2467036-1-dhowells@redhat.com>
References: <20260202170216.2467036-1-dhowells@redhat.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4008-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[keyrings];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wunner.de:email,cloudflare.com:email,chronox.de:email,apana.org.au:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B5985CF561
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

 (1) Make ->m and ->m_size point to the data to be verified rather than
     making public_key_verify_signature() access the data directly.  This
     is so that keyctl(KEYCTL_PKEY_VERIFY) will still work.

 (2) Add a flag, ->algo_takes_data, to indicate that the verification
     algorithm wants to access the data to be verified directly rather than
     having it digested first.

 (3) If the PKCS#7 message has authenticatedAttributes (or CMS
     signedAttrs), then the digest contained therein will be validated as
     now, and the modified attrs blob will either be digested or assigned
     to ->m as appropriate.

 (4) If present, always copy and modify the authenticatedAttributes (or
     signedAttrs) then digest that in one go rather than calling the shash
     update twice (once for the tag and once for the rest).

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
 crypto/asymmetric_keys/pkcs7_parser.c    |  4 +-
 crypto/asymmetric_keys/pkcs7_verify.c    | 52 ++++++++++++++++--------
 crypto/asymmetric_keys/signature.c       |  3 +-
 crypto/asymmetric_keys/x509_public_key.c | 10 +++++
 include/crypto/public_key.h              |  2 +
 5 files changed, 51 insertions(+), 20 deletions(-)

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
index aa085ec6fb1c..06abb9838f95 100644
--- a/crypto/asymmetric_keys/pkcs7_verify.c
+++ b/crypto/asymmetric_keys/pkcs7_verify.c
@@ -30,6 +30,16 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 
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
 	if (sig->m)
 		return 0;
@@ -48,9 +58,10 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 	sig->m_size = crypto_shash_digestsize(tfm);
 
 	ret = -ENOMEM;
-	sig->m = kmalloc(sig->m_size, GFP_KERNEL);
+	sig->m = kmalloc(umax(sinfo->authattrs_len, sig->m_size), GFP_KERNEL);
 	if (!sig->m)
 		goto error_no_desc;
+	sig->m_free = true;
 
 	desc = kzalloc(desc_size, GFP_KERNEL);
 	if (!desc)
@@ -69,8 +80,6 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 	 * digest we just calculated.
 	 */
 	if (sinfo->authattrs) {
-		u8 tag;
-
 		if (!sinfo->msgdigest) {
 			pr_warn("Sig %u: No messageDigest\n", sinfo->index);
 			ret = -EKEYREJECTED;
@@ -96,21 +105,25 @@ static int pkcs7_digest(struct pkcs7_message *pkcs7,
 		 * as the contents of the digest instead.  Note that we need to
 		 * convert the attributes from a CONT.0 into a SET before we
 		 * hash it.
+		 *
+		 * However, for certain algorithms, such as ML-DSA, the digest
+		 * is integrated into the signing algorithm.  In such a case,
+		 * we copy the authattrs, modifying the tag type, and set that
+		 * as the digest.
 		 */
-		memset(sig->m, 0, sig->m_size);
-
-
-		ret = crypto_shash_init(desc);
-		if (ret < 0)
-			goto error;
-		tag = ASN1_CONS_BIT | ASN1_SET;
-		ret = crypto_shash_update(desc, &tag, 1);
-		if (ret < 0)
-			goto error;
-		ret = crypto_shash_finup(desc, sinfo->authattrs,
-					 sinfo->authattrs_len, sig->m);
-		if (ret < 0)
-			goto error;
+		memcpy(sig->m, sinfo->authattrs, sinfo->authattrs_len);
+		sig->m[0] = ASN1_CONS_BIT | ASN1_SET;
+
+		if (sig->algo_takes_data) {
+			sig->m_size = sinfo->authattrs_len;
+			ret = 0;
+		} else {
+			ret = crypto_shash_digest(desc, sig->m,
+						  sinfo->authattrs_len,
+						  sig->m);
+			if (ret < 0)
+				goto error;
+		}
 		pr_devel("AADigest = [%*ph]\n", 8, sig->m);
 	}
 
@@ -137,6 +150,11 @@ int pkcs7_get_digest(struct pkcs7_message *pkcs7, const u8 **buf, u32 *len,
 	ret = pkcs7_digest(pkcs7, sinfo);
 	if (ret)
 		return ret;
+	if (!sinfo->sig->m_free) {
+		pr_notice_once("%s: No digest available\n", __func__);
+		return -EINVAL; /* TODO: MLDSA doesn't necessarily calculate an
+				 * intermediate digest. */
+	}
 
 	*buf = sinfo->sig->m;
 	*len = sinfo->sig->m_size;
diff --git a/crypto/asymmetric_keys/signature.c b/crypto/asymmetric_keys/signature.c
index f4ec126121b3..a5ac7a53b670 100644
--- a/crypto/asymmetric_keys/signature.c
+++ b/crypto/asymmetric_keys/signature.c
@@ -28,7 +28,8 @@ void public_key_signature_free(struct public_key_signature *sig)
 		for (i = 0; i < ARRAY_SIZE(sig->auth_ids); i++)
 			kfree(sig->auth_ids[i]);
 		kfree(sig->s);
-		kfree(sig->m);
+		if (sig->m_free)
+			kfree(sig->m);
 		kfree(sig);
 	}
 }
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 3854f7ae4ed0..27b4fea37845 100644
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
@@ -69,6 +77,7 @@ int x509_get_sig_params(struct x509_certificate *cert)
 	sig->m = kmalloc(sig->m_size, GFP_KERNEL);
 	if (!sig->m)
 		goto error;
+	sig->m_free = true;
 
 	desc = kzalloc(desc_size, GFP_KERNEL);
 	if (!desc)
@@ -84,6 +93,7 @@ int x509_get_sig_params(struct x509_certificate *cert)
 	kfree(desc);
 error:
 	crypto_free_shash(tfm);
+out:
 	pr_devel("<==%s() = %d\n", __func__, ret);
 	return ret;
 }
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index bd38ba4d217d..4c5199b20338 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -46,6 +46,8 @@ struct public_key_signature {
 	u8 *m;			/* Message data to pass to verifier */
 	u32 s_size;		/* Number of bytes in signature */
 	u32 m_size;		/* Number of bytes in ->m */
+	bool m_free;		/* T if ->m needs freeing */
+	bool algo_takes_data;	/* T if public key algo operates on data, not a hash */
 	const char *pkey_algo;
 	const char *hash_algo;
 	const char *encoding;


