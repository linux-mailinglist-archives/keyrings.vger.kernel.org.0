Return-Path: <keyrings+bounces-4006-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAN+KDzagGnMBwMAu9opvQ
	(envelope-from <keyrings+bounces-4006-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 18:09:16 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC25CF64D
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 18:09:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 53BA63091EE1
	for <lists+keyrings@lfdr.de>; Mon,  2 Feb 2026 17:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C072385510;
	Mon,  2 Feb 2026 17:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FLVMZIbL"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB615385522
	for <keyrings@vger.kernel.org>; Mon,  2 Feb 2026 17:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051770; cv=none; b=HNTRB9OVjFdxxwf4RML4xdrT5BMiLK7lVa2sEE7+NeoRLpSM6cNNqtbhJBCHdif0Gjb4zt72zljaC18jIINnVshq21T+xRUo7WHlS6qRMTA13Rot4yODgjnj0rlDAncRpMEcrHCb+/17PtXTLmSWokMKPeeiTPS9aHEJB5zTltM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051770; c=relaxed/simple;
	bh=2e9SH7J4BWQiTO5bhBJRbINXA5Y+RUH8hrW83p9106E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GYzgoU8iDg9RZX9n2WOhvctxVmn0xjA2lmuY3TrA/Cr5KSailCp7/SnuI76s19XIfrQD9iYuhw0LOgsEjrE0HAXnJv1agEH6gGuhBkvaiYdvctipX6tSKG4hs4nB7rV910/l4Tx4q0paWAMB97rZuSFNV3NVYl5hbfzVgbpqeEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FLVMZIbL; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770051767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/2GlCgZLrpUqq5D1yRzHDnrzr+MKF5Tesne7omct6g=;
	b=FLVMZIbLvQM05ZsNuAw1pDUK6qUdPvx2PbQOppjFpw0xbXk/lSEoYLg1hOjgzOyIT1BJCF
	hZF8vrnOP+DtytiMv8+lBiwsfnRzVr7w4AC+SSgdSsU61MuolQFyMrtLh8tJ0CnHXEZAuv
	fkf9VAhdlcLgVrBp32h8MbmcFf0S9eg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-19-URFNfZZXOeSd8jiflZS4Vg-1; Mon,
 02 Feb 2026 12:02:41 -0500
X-MC-Unique: URFNfZZXOeSd8jiflZS4Vg-1
X-Mimecast-MFC-AGG-ID: URFNfZZXOeSd8jiflZS4Vg_1770051759
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A620A18002F1;
	Mon,  2 Feb 2026 17:02:38 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.44.33.164])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5B8A418008FF;
	Mon,  2 Feb 2026 17:02:33 +0000 (UTC)
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
Subject: [PATCH v16 2/7] x509: Separately calculate sha256 for blacklist
Date: Mon,  2 Feb 2026 17:02:07 +0000
Message-ID: <20260202170216.2467036-3-dhowells@redhat.com>
In-Reply-To: <20260202170216.2467036-1-dhowells@redhat.com>
References: <20260202170216.2467036-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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
	TAGGED_FROM(0.00)[bounces-4006-lists,keyrings=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[chronox.de:email,wunner.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,apana.org.au:email,cloudflare.com:email]
X-Rspamd-Queue-Id: 1CC25CF64D
X-Rspamd-Action: no action

Calculate the SHA256 hash for blacklisting purposes independently of the
signature hash (which may be something other than SHA256).

This is necessary because when ML-DSA is used, no digest is calculated.

Note that this represents a change of behaviour in that the hash used for
the blacklist check would previously have been whatever digest was used
for, say, RSA-based signatures.  It may be that this is inadvisable.

Signed-off-by: David Howells <dhowells@redhat.com>
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/asymmetric_keys/x509_parser.h     |  2 ++
 crypto/asymmetric_keys/x509_public_key.c | 22 +++++++++++++---------
 2 files changed, 15 insertions(+), 9 deletions(-)

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
index 12e3341e806b..79cc7b7a0630 100644
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
@@ -69,15 +82,6 @@ int x509_get_sig_params(struct x509_certificate *cert)
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


