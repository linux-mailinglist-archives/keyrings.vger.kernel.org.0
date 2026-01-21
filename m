Return-Path: <keyrings+bounces-3883-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIF/LSxVcWkNEwAAu9opvQ
	(envelope-from <keyrings+bounces-3883-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 23:37:32 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D855EE9E
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 23:37:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BD9FB80637A
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 22:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EF99449EA1;
	Wed, 21 Jan 2026 22:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fLYzgaZA"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73E143E9EE
	for <keyrings@vger.kernel.org>; Wed, 21 Jan 2026 22:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769034995; cv=none; b=nGvnZc8DYZ0DS1RLcnoZQSYFd91BS+NjgBamu3l8u8uB8hdIc7IT8S3lgh1IUxWH6UCh2C33BRXr42bcmh22U3T0pFXQKn30EOTjOp5xI9juMgavGNmVoapOu8n7xrAl/WvmHZzqztlF/OmEDBr+nA+b4tnmHj+OcHPoBQaAKpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769034995; c=relaxed/simple;
	bh=pdLHwp+AM7G9cgOJyic5O/rASJPQnCOzMS4jYvo7/e4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jeKPYkHjdgR1Vn3Tva2lGpYd5tg1rlWdcz2Ufe4ixM0rV5qrcfVNw4aGtBvcctAzWjkrYn0XJeobS1dqlAU6YlA0dh/RlvT+rM5va4Ns5s/tOyb3fo/gvfKUDJJxXEevFinSmZcQleCveL8LWbyFO5XnYmFcHkNl6pQzMip5v7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fLYzgaZA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769034992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aF5PUHy8KBpOlcEh/C5gwfugw+qLv3KlBU19uO3kK8o=;
	b=fLYzgaZAMp+KBtbSM1FdGlLgN204R+l2rR7bY/4CBjdYISusDrudy74uzvJy+hEKCrv7ch
	Wi7S7EE0iiAdYNI+kpzGwNubeuubx4XMfezJwRRIXxYvuVCcnvpIzFYZkv7rlU+liDgvlG
	LNUpMtqtYgEWRIWgSW0cyNJzv42Ef9o=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-141-f1Sgb9CBOSmQqs2vW8-n3A-1; Wed,
 21 Jan 2026 17:36:29 -0500
X-MC-Unique: f1Sgb9CBOSmQqs2vW8-n3A-1
X-Mimecast-MFC-AGG-ID: f1Sgb9CBOSmQqs2vW8-n3A_1769034987
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C8C301956050;
	Wed, 21 Jan 2026 22:36:26 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.2])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1EB723000218;
	Wed, 21 Jan 2026 22:36:22 +0000 (UTC)
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
Subject: [PATCH v14 2/5] x509: Separately calculate sha256 for blacklist
Date: Wed, 21 Jan 2026 22:36:04 +0000
Message-ID: <20260121223609.1650735-3-dhowells@redhat.com>
In-Reply-To: <20260121223609.1650735-1-dhowells@redhat.com>
References: <20260121223609.1650735-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
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
	TAGGED_FROM(0.00)[bounces-3883-lists,keyrings=lfdr.de];
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
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wunner.de:email,cloudflare.com:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,apana.org.au:email]
X-Rspamd-Queue-Id: 63D855EE9E
X-Rspamd-Action: no action

Calculate the SHA256 hash for blacklisting purposes independently of the
signature hash (which may be something other than SHA256).

This is necessary because when ML-DSA is used, no digest is calculated.

Note that this represents a change of behaviour in that the hash used for
the blacklist check would previously have been whatever digest was used
for, say, RSA-based signatures.  It may be that this is inadvisable.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/asymmetric_keys/x509_parser.h     |  2 ++
 crypto/asymmetric_keys/x509_public_key.c | 23 +++++++++++++----------
 2 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_parser.h b/crypto/asymmetric_keys/x509_parser.h
index 0688c222806b..b7aeebdddb36 100644
--- a/crypto/asymmetric_keys/x509_parser.h
+++ b/crypto/asymmetric_keys/x509_parser.h
@@ -9,12 +9,14 @@
 #include <linux/time.h>
 #include <crypto/public_key.h>
 #include <keys/asymmetric-type.h>
+#include <crypto/sha2.h>
 
 struct x509_certificate {
 	struct x509_certificate *next;
 	struct x509_certificate *signer;	/* Certificate that signed this one */
 	struct public_key *pub;			/* Public key details */
 	struct public_key_signature *sig;	/* Signature parameters */
+	u8		sha256[SHA256_DIGEST_SIZE]; /* Hash for blacklist purposes */
 	char		*issuer;		/* Name of certificate issuer */
 	char		*subject;		/* Name of certificate subject */
 	struct asymmetric_key_id *id;		/* Issuer + Serial number */
diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
index 12e3341e806b..6d002e3b20c5 100644
--- a/crypto/asymmetric_keys/x509_public_key.c
+++ b/crypto/asymmetric_keys/x509_public_key.c
@@ -31,6 +31,19 @@ int x509_get_sig_params(struct x509_certificate *cert)
 
 	pr_devel("==>%s()\n", __func__);
 
+	/* Calculate a SHA256 hash of the TBS and check it against the
+	 * blacklist.
+	 */
+	sha256(cert->tbs, cert->tbs_size, cert->sha256);
+	ret = is_hash_blacklisted(cert->sha256, sizeof(cert->sha256),
+				  BLACKLIST_HASH_X509_TBS);
+	if (ret == -EKEYREJECTED) {
+		pr_err("Cert %*phN is blacklisted\n",
+		       (int)sizeof(cert->sha256), cert->sha256);
+		cert->blacklisted = true;
+		ret = 0;
+	}
+
 	sig->s = kmemdup(cert->raw_sig, cert->raw_sig_size, GFP_KERNEL);
 	if (!sig->s)
 		return -ENOMEM;
@@ -65,19 +78,9 @@ int x509_get_sig_params(struct x509_certificate *cert)
 
 	ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
 				  sig->digest);
-
 	if (ret < 0)
 		goto error_2;
 
-	ret = is_hash_blacklisted(sig->digest, sig->digest_size,
-				  BLACKLIST_HASH_X509_TBS);
-	if (ret == -EKEYREJECTED) {
-		pr_err("Cert %*phN is blacklisted\n",
-		       sig->digest_size, sig->digest);
-		cert->blacklisted = true;
-		ret = 0;
-	}
-
 error_2:
 	kfree(desc);
 error:


