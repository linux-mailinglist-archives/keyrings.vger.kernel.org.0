Return-Path: <keyrings+bounces-3235-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 723E2BE94A2
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 16:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC7531AA674F
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 14:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E82536998F;
	Fri, 17 Oct 2025 14:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QjQZx2Vo"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F58536999B
	for <keyrings@vger.kernel.org>; Fri, 17 Oct 2025 14:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712258; cv=none; b=SUstZykLdhxVQa4HwVl50Sc25NEARVbvfAVZS09ZkEkCNyvyjCmfjyDVR1DDkJ6wLXjbPJIktLvaor6ssOIkT+x8Isjh6AVzx1P1MOHNSTwxxV+Ipmv2Op3x3LWRx8svXDSQZu+FnIJrvMi4lSrwywfqG/6Ofj6HFHBZicQ0c78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712258; c=relaxed/simple;
	bh=mXnxE1KldyKcvhCCZJc0/0qoZmPaRMy9UrALeuJo0KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tG6vxGAC1gcdfzBwdfbVE8qyms7ZD4oOMzlhqE+EQqA9xEnB9K0YeOtj6UJvHG6jknqynCRuc68FeDuuINUMPAXDyf3pTnFys4pf+VUgKZxcQ3dGmXbWDem9JOEGNA3S6mhzwm5hiSMMMdwcKBuzL0BV3rwpwWLk1wXEzHOrHY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QjQZx2Vo; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760712255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AHTrsmHTTJS2rcDKbRhEgjpwAwqBovgsbc5ckkuHzgA=;
	b=QjQZx2Vo9vakjvQyDZtQe3Q/bFymrqiNEVPWz6GEufoMLqVd+WzwmvGAZEHn4HvlDirQNS
	yRZf1b9np29qJqs2n5nHivV376S1SDNba4b9jz9wAGE8OzN9yT96S0drWzlw8IfipcjBgh
	GmGTZIBOrNh8cJ8UW5nWE45HL8xiQi4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-171-K-gS7dkEPy615H8WP1RGeg-1; Fri,
 17 Oct 2025 10:44:11 -0400
X-MC-Unique: K-gS7dkEPy615H8WP1RGeg-1
X-Mimecast-MFC-AGG-ID: K-gS7dkEPy615H8WP1RGeg_1760712249
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 707E7180034C;
	Fri, 17 Oct 2025 14:44:09 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.57])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F23D219560B0;
	Fri, 17 Oct 2025 14:44:05 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/17] crypto: SHAKE tests
Date: Fri, 17 Oct 2025 15:42:53 +0100
Message-ID: <20251017144311.817771-10-dhowells@redhat.com>
In-Reply-To: <20251017144311.817771-1-dhowells@redhat.com>
References: <20251017144311.817771-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

---
 crypto/sha3_generic.c | 14 ++++++++--
 crypto/testmgr.c      | 14 ++++++++++
 crypto/testmgr.h      | 59 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/crypto/sha3_generic.c b/crypto/sha3_generic.c
index 3e5a23022596..3a338fb704c2 100644
--- a/crypto/sha3_generic.c
+++ b/crypto/sha3_generic.c
@@ -30,6 +30,16 @@ int crypto_sha3_init(struct shash_desc *desc)
 }
 EXPORT_SYMBOL(crypto_sha3_init);
 
+static int crypto_shake_init(struct shash_desc *desc)
+{
+	struct sha3_ctx *ctx = crypto_sha3_desc(desc);
+
+	memset(ctx, 0, sizeof(*ctx));
+	ctx->block_size = crypto_shash_blocksize(desc->tfm);
+	ctx->padding = 0x1f;
+	return 0;
+}
+
 static int crypto_sha3_update(struct shash_desc *desc, const u8 *data,
 			      unsigned int len)
 {
@@ -97,7 +107,7 @@ static struct shash_alg algs[] = { {
 	.base.cra_module	= THIS_MODULE,
 }, {
 	.digestsize		= SHAKE128_DEFAULT_SIZE,
-	.init			= crypto_sha3_init,
+	.init			= crypto_shake_init,
 	.update			= crypto_sha3_update,
 	.finup			= crypto_sha3_finup,
 	.descsize		= sizeof(struct sha3_ctx),
@@ -108,7 +118,7 @@ static struct shash_alg algs[] = { {
 	.base.cra_module	= THIS_MODULE,
 }, {
 	.digestsize		= SHAKE256_DEFAULT_SIZE,
-	.init			= crypto_sha3_init,
+	.init			= crypto_shake_init,
 	.update			= crypto_sha3_update,
 	.finup			= crypto_sha3_finup,
 	.descsize		= sizeof(struct sha3_ctx),
diff --git a/crypto/testmgr.c b/crypto/testmgr.c
index 6a490aaa71b9..88d412ceb6f2 100644
--- a/crypto/testmgr.c
+++ b/crypto/testmgr.c
@@ -5516,6 +5516,20 @@ static const struct alg_test_desc alg_test_descs[] = {
 		.suite = {
 			.hash = __VECS(sha512_tv_template)
 		}
+	}, {
+		.alg = "shake128",
+		.test = alg_test_hash,
+		.fips_allowed = 1,
+		.suite = {
+			.hash = __VECS(shake128_tv_template)
+		}
+	}, {
+		.alg = "shake256",
+		.test = alg_test_hash,
+		.fips_allowed = 1,
+		.suite = {
+			.hash = __VECS(shake256_tv_template)
+		}
 	}, {
 		.alg = "sm3",
 		.test = alg_test_hash,
diff --git a/crypto/testmgr.h b/crypto/testmgr.h
index 268231227282..c0eca7f72aa0 100644
--- a/crypto/testmgr.h
+++ b/crypto/testmgr.h
@@ -4690,6 +4690,65 @@ static const struct hash_testvec sha3_512_tv_template[] = {
 };
 
 
+/* From: https://csrc.nist.gov/projects/cryptographic-standards-and-guidelines/example-values */
+static const struct hash_testvec shake128_tv_template[] = {
+	{
+		.plaintext = "",
+		.psize	= 0,
+		.digest	=
+		"\x7f\x9c\x2b\xa4\xe8\x8f\x82\x7d\x61\x60\x45\x50\x76\x05\x85\x3e",
+	}, {
+		.plaintext =
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3",
+		.psize	= 200,
+		.digest	=
+		"\x13\x1a\xb8\xd2\xb5\x94\x94\x6b\x9c\x81\x33\x3f\x9b\xb6\xe0\xce",
+	}
+};
+
+/* From: https://csrc.nist.gov/projects/cryptographic-standards-and-guidelines/example-values */
+static const struct hash_testvec shake256_tv_template[] = {
+	{
+		.plaintext = "",
+		.psize	= 0,
+		.digest	=
+		"\x46\xb9\xdd\x2b\x0b\xa8\x8d\x13\x23\x3b\x3f\xeb\x74\x3e\xeb\x24"
+		"\x3f\xcd\x52\xea\x62\xb8\x1b\x82\xb5\x0c\x27\x64\x6e\xd5\x76\x2f"
+	}, {
+		.plaintext =
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3"
+		"\xa3\xa3\xa3\xa3\xa3\xa3\xa3\xa3",
+		.psize	= 200,
+		.digest	=
+		"\xcd\x8a\x92\x0e\xd1\x41\xaa\x04\x07\xa2\x2d\x59\x28\x86\x52\xe9"
+		"\xd9\xf1\xa7\xee\x0c\x1e\x7c\x1c\xa6\x99\x42\x4d\xa8\x4a\x90\x4d",
+	}
+};
+
+
 /*
  * MD5 test vectors from RFC1321
  */


