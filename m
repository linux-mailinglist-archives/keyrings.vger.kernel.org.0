Return-Path: <keyrings+bounces-3841-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP0nNEOjb2l7DgAAu9opvQ
	(envelope-from <keyrings+bounces-3841-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 16:46:11 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 764684698E
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 16:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 04CA17A73D6
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 15:08:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6905246AF0E;
	Tue, 20 Jan 2026 14:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P2qjpFCW"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1646B46AF03
	for <keyrings@vger.kernel.org>; Tue, 20 Jan 2026 14:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768920743; cv=none; b=sqsi0YWufj+IJvRtXs9f0857Mv4cbXThGnEmvP/whL4gsg+/SFTyihBh42DFabAa2g7MnRQb5CMlH7OCvRLQ5JFF8XFTfRaGljnKRNSuCJIQL2AF4Ewyn6KtqQyQEVE7KAoBbgIFTcKjlb2gxFBvzTiHcaMdFIovrp7knsyyZck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768920743; c=relaxed/simple;
	bh=h7knfspR3Ir1UVvoWpg+bi9rqNy2bB9eq2BYBUvGfGs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S61iBj3vMcGDTWPep03f3bMDitKraxcOvqsE06jzg+s3Tilkdt+/9gBFokkCVTbuKrxgYZou3/gjcl9lbqiZxJURSqOJ72j3XVoKrwS3sV5o4RzKUtl9KnVJi/8tCl0V/5673e1wB+lNEXWm/D8OsMXdSBy+ldIDKiuzcvRWmE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P2qjpFCW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768920740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9qZO8xa9s9Et02ra1tPoQRn1/avY/YJzUAJ+C3oYdYM=;
	b=P2qjpFCWWQ/+fu9YRw7z1RVn/BYkgFDLEsqbcETUcwEdrQ+nE6bISNyiZt2goL2FJWv/I/
	EAw6UdIojLnGUkohjqlJE+eCDoWf6RX2D1dWA+/BTf7u83C+wnP3pXIRtjVVnMTSQL03/2
	++OQ1JgVq4/2ALXlw4p0oHij/V6ZlB4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-281-bCDKbSl1PfC7z-icvcOssA-1; Tue,
 20 Jan 2026 09:52:14 -0500
X-MC-Unique: bCDKbSl1PfC7z-icvcOssA-1
X-Mimecast-MFC-AGG-ID: bCDKbSl1PfC7z-icvcOssA_1768920732
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 89ACE1956058;
	Tue, 20 Jan 2026 14:52:12 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.2])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 46F5219560AB;
	Tue, 20 Jan 2026 14:52:07 +0000 (UTC)
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
Subject: [PATCH v13 11/12] x509, pkcs7: Limit crypto combinations that may be used for module signing
Date: Tue, 20 Jan 2026 14:50:57 +0000
Message-ID: <20260120145103.1176337-12-dhowells@redhat.com>
In-Reply-To: <20260120145103.1176337-1-dhowells@redhat.com>
References: <20260120145103.1176337-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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
	TAGGED_FROM(0.00)[bounces-3841-lists,keyrings=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[cloudflare.com:email,chronox.de:email,apana.org.au:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,wunner.de:email]
X-Rspamd-Queue-Id: 764684698E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 crypto/asymmetric_keys/public_key.c | 55 +++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index 13a5616becaa..90b98e1a952d 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -24,6 +24,52 @@ MODULE_DESCRIPTION("In-software asymmetric public-key subtype");
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
+	{ "ecdsa",		"x962",		"sha256" },
+	{ "ecdsa",		"x962",		"sha384" },
+	{ "ecdsa",		"x962",		"sha512" },
+	{ "ecrdsa",		"raw",		"sha256" },
+	{ "ecrdsa",		"raw",		"sha384" },
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
@@ -391,12 +437,17 @@ int public_key_verify_signature(const struct public_key *pkey,
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


