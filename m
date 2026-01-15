Return-Path: <keyrings+bounces-3780-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5EED28E82
	for <lists+keyrings@lfdr.de>; Thu, 15 Jan 2026 22:57:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58C2130EBC53
	for <lists+keyrings@lfdr.de>; Thu, 15 Jan 2026 21:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8487032ED5C;
	Thu, 15 Jan 2026 21:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FVml89hH"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD27832D7F7
	for <keyrings@vger.kernel.org>; Thu, 15 Jan 2026 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768513941; cv=none; b=ux5VLt1TWzMGQdK9YPOkJbmsARuNe3tttbDXJwcFRC6vtzTdXypkcij/fgHe7B0kqc1NaN98UPUoJP0/BfOS2gAvBA0nkayo3i7zzoqsJCOnr/8OVMnFAPm4iXCdKmaKLGgjx7Yxb3knWvCHHhYRYTmG0S/sjCHPWeJt6mNyRVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768513941; c=relaxed/simple;
	bh=26Ku/3MAM9rlhlUV9gJjcK/jLqBAxHcARq/ODpqghxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCNqoLcVbgsXonnKfX7XhC/PDVGIWE0iipyf+XIbX3e/txquo11eG1YMHgGkJpTDK07vIbwWjX8cwIyQ8BB+CeGnU+2DulEmbszpvfbW1ZPCOpGFXAN9TEfVIG8bzuMulLLszogeCEmcV36zlwV7VHoc3fUKLzAE/7RqdQZXMzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FVml89hH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768513930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T28k94VpOQSmmR3GIa8Y/1zMVZOhRHqV17VLDzYabDY=;
	b=FVml89hHWQmhLd7uxnvRwcCSK6QnJ5Ka7OaspbNz1KcDjktbAtqybQ9GKP9eKDpj+R0QRY
	jJeUiWrql9lo8jsvBBCX1WmthnJq7OitpGIhLB+NqbCbrKyh4jkgOJO5jdrV1MMIY9N0Rh
	lWteIcrKg+sJuLENPcHrwX3OXcVKol0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-204-hfKDrujmNxW5NtyNIV1yaw-1; Thu,
 15 Jan 2026 16:52:05 -0500
X-MC-Unique: hfKDrujmNxW5NtyNIV1yaw-1
X-Mimecast-MFC-AGG-ID: hfKDrujmNxW5NtyNIV1yaw_1768513923
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D0CF1956052;
	Thu, 15 Jan 2026 21:52:03 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.4])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 82F00180049F;
	Thu, 15 Jan 2026 21:51:59 +0000 (UTC)
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
Subject: [PATCH v12 10/10] x509, pkcs7: Limit crypto combinations that may be used for module signing
Date: Thu, 15 Jan 2026 21:50:52 +0000
Message-ID: <20260115215100.312611-11-dhowells@redhat.com>
In-Reply-To: <20260115215100.312611-1-dhowells@redhat.com>
References: <20260115215100.312611-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Limit the set of crypto combinations that may be used for module signing as
no indication of hash algorithm used for signing is added to the hash of
the data, so in theory a data blob hashed with a different algorithm can be
substituted provided it has the same hash output.

This also rejects the use of less secure algorithms.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Lukas Wunner <lukas@wunner.de>
cc: Ignat Korchagin <ignat@cloudflare.com>
cc: Stephan Mueller <smueller@chronox.de>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: keyrings@vger.kernel.org
cc: linux-crypto@vger.kernel.org
---
 crypto/asymmetric_keys/public_key.c | 51 +++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index 13a5616becaa..78e1194de71c 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -24,6 +24,48 @@ MODULE_DESCRIPTION("In-software asymmetric public-key subtype");
 MODULE_AUTHOR("Red Hat, Inc.");
 MODULE_LICENSE("GPL");
 
+struct public_key_restriction {
+	const char	*pkey_algo;	/* Signing algorithm (e.g. "rsa") */
+	const char	*pkey_enc;	/* Signature encoding (e.g. "pkcs1") */
+	const char	*hash_algo;	/* Content hash algorithm (e.g. "sha256") */
+};
+
+static const struct public_key_restriction public_key_restrictions[] = {
+	/* algo			encoding	hash */
+	{ "rsa",		"pkcs1",	"sha256" },
+	{ "rsa",		"pkcs1",	"sha384" },
+	{ "rsa",		"pkcs1",	"sha512" },
+	{ "rsa",		"emsa-pss",	"sha512" },
+	{ "ecdsa",		"x962",		"sha512" },
+	{ "ecrdsa",		"raw",		"sha512" },
+	{ "mldsa44",		"raw",		"sha512" },
+	{ "mldsa65",		"raw",		"sha512" },
+	{ "mldsa87",		"raw",		"sha512" },
+	/* ML-DSA may also do its own hashing over the entire message. */
+	{ "mldsa44",		"raw",		"-" },
+	{ "mldsa65",		"raw",		"-" },
+	{ "mldsa87",		"raw",		"-" },
+};
+
+/*
+ * Determine if a particular key/hash combination is allowed.
+ */
+static int is_public_key_sig_allowed(const struct public_key_signature *sig)
+{
+	for (int i = 0; i < ARRAY_SIZE(public_key_restrictions); i++) {
+		if (strcmp(public_key_restrictions[i].pkey_algo, sig->pkey_algo) != 0)
+			continue;
+		if (strcmp(public_key_restrictions[i].pkey_enc, sig->encoding) != 0)
+			continue;
+		if (strcmp(public_key_restrictions[i].hash_algo, sig->hash_algo) != 0)
+			continue;
+		return 0;
+	}
+	pr_warn_once("Public key signature combo (%s,%s,%s) rejected\n",
+		     sig->pkey_algo, sig->encoding, sig->hash_algo);
+	return -EKEYREJECTED;
+}
+
 /*
  * Provide a part of a description of the key for /proc/keys.
  */
@@ -391,12 +433,17 @@ int public_key_verify_signature(const struct public_key *pkey,
 	bool issig;
 	int ret;
 
-	pr_devel("==>%s()\n", __func__);
-
 	BUG_ON(!pkey);
 	BUG_ON(!sig);
 	BUG_ON(!sig->s);
 
+	ret = is_public_key_sig_allowed(sig);
+	if (ret < 0)
+		return ret;
+
+	pr_devel("==>%s(%s,%s,%s)\n",
+		 __func__, sig->pkey_algo, sig->encoding, sig->hash_algo);
+
 	/*
 	 * If the signature specifies a public key algorithm, it *must* match
 	 * the key's actual public key algorithm.


