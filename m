Return-Path: <keyrings+bounces-3227-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02AA5BE9419
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 16:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB6443B0D62
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 14:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F6632E137;
	Fri, 17 Oct 2025 14:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hFEx4Ylr"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8FD330314
	for <keyrings@vger.kernel.org>; Fri, 17 Oct 2025 14:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712217; cv=none; b=eaT0J88LAcdsZtOvosS89j6GEQiTlWpe4Vw+Dutcr5z3xnizoAIPcVFYEHPp122y+TawJqe1nxelxFVJDnwJs3LR4ADUWDkieb5z4fA6TrH696VW7hQDVyPPfUZzD2FwKrAntkF+tV6/EGs4cscH9FhlEk+kP3SJz1tlXZK+V/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712217; c=relaxed/simple;
	bh=pu/Wq7yaIyvBO3zNXz8Gt3QQ0JYmGbu8ebJVzjfJJbM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HZKfRAUb5YbUcnSwJZaGDOjhaiFfYscPa4qWio82PcdmISu5R8lbDDYHPjjh1usHY0w8vqY5MLET0Yu9tFQlBl4TwGVBBwkVAFWxbHshrFWbMz4gzuKDX06W31gChkFNA3Fd3FdHIqDa2KfX2iUTHSLXeWi3dQz4P9s3m8NCiR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hFEx4Ylr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760712214;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IzFlPAZDLxRFUBTmQm4fHS0TbV7GeZRfH8gzkTO+hL0=;
	b=hFEx4YlrSgrymblndURVCw4yRuLTeLS4Cv11PD4RXNuQESz144aSU8trwfyMVFf9+74Epn
	BfEuBYgnXNnMHKs5RXBmDNDBev6ihJf/7F0JvBgeXhHO22AT+urNE3xDovj5OtSjrjOo7+
	pJgNCRRyjWshCB69195K6CwY1kwwZYs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-561-5yz03QCFPCaqz-93CL7dsg-1; Fri,
 17 Oct 2025 10:43:29 -0400
X-MC-Unique: 5yz03QCFPCaqz-93CL7dsg-1
X-Mimecast-MFC-AGG-ID: 5yz03QCFPCaqz-93CL7dsg_1760712206
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09A9919560AF;
	Fri, 17 Oct 2025 14:43:26 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.57])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 036A219560B2;
	Fri, 17 Oct 2025 14:43:20 +0000 (UTC)
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
	linux-kernel@vger.kernel.org,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	linux-s390@vger.kernel.org
Subject: [PATCH v6 01/17] s390/sha3: Rename conflicting functions
Date: Fri, 17 Oct 2025 15:42:45 +0100
Message-ID: <20251017144311.817771-2-dhowells@redhat.com>
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

Rename the s390 sha3_* functions to have an "s390_" prefix to avoid
conflict with generic code.

Signed-off-by: David Howells <dhowells@redhat.com>
Acked-By: Harald Freudenberger <freude@linux.ibm.com>
cc: Eric Biggers <ebiggers@kernel.org>
cc: Jason A. Donenfeld <Jason@zx2c4.com>
cc: Ard Biesheuvel <ardb@kernel.org>
cc: Holger Dengler <dengler@linux.ibm.com>
cc: Herbert Xu <herbert@gondor.apana.org.au>
cc: Stephan Mueller <smueller@chronox.de>
cc: linux-crypto@vger.kernel.org
cc: linux-s390@vger.kernel.org
---
 arch/s390/crypto/sha3_256_s390.c | 26 +++++++++++++-------------
 arch/s390/crypto/sha3_512_s390.c | 26 +++++++++++++-------------
 2 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/s390/crypto/sha3_256_s390.c b/arch/s390/crypto/sha3_256_s390.c
index 03bb4f4bab70..fd5ecae60a57 100644
--- a/arch/s390/crypto/sha3_256_s390.c
+++ b/arch/s390/crypto/sha3_256_s390.c
@@ -19,7 +19,7 @@
 
 #include "sha.h"
 
-static int sha3_256_init(struct shash_desc *desc)
+static int s390_sha3_256_init(struct shash_desc *desc)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 
@@ -32,7 +32,7 @@ static int sha3_256_init(struct shash_desc *desc)
 	return 0;
 }
 
-static int sha3_256_export(struct shash_desc *desc, void *out)
+static int s390_sha3_256_export(struct shash_desc *desc, void *out)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 	union {
@@ -50,7 +50,7 @@ static int sha3_256_export(struct shash_desc *desc, void *out)
 	return 0;
 }
 
-static int sha3_256_import(struct shash_desc *desc, const void *in)
+static int s390_sha3_256_import(struct shash_desc *desc, const void *in)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 	union {
@@ -68,22 +68,22 @@ static int sha3_256_import(struct shash_desc *desc, const void *in)
 	return 0;
 }
 
-static int sha3_224_import(struct shash_desc *desc, const void *in)
+static int s390_sha3_224_import(struct shash_desc *desc, const void *in)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 
-	sha3_256_import(desc, in);
+	s390_sha3_256_import(desc, in);
 	sctx->func = CPACF_KIMD_SHA3_224;
 	return 0;
 }
 
 static struct shash_alg sha3_256_alg = {
 	.digestsize	=	SHA3_256_DIGEST_SIZE,	   /* = 32 */
-	.init		=	sha3_256_init,
+	.init		=	s390_sha3_256_init,
 	.update		=	s390_sha_update_blocks,
 	.finup		=	s390_sha_finup,
-	.export		=	sha3_256_export,
-	.import		=	sha3_256_import,
+	.export		=	s390_sha3_256_export,
+	.import		=	s390_sha3_256_import,
 	.descsize	=	S390_SHA_CTX_SIZE,
 	.statesize	=	SHA3_STATE_SIZE,
 	.base		=	{
@@ -96,22 +96,22 @@ static struct shash_alg sha3_256_alg = {
 	}
 };
 
-static int sha3_224_init(struct shash_desc *desc)
+static int s390_sha3_224_init(struct shash_desc *desc)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 
-	sha3_256_init(desc);
+	s390_sha3_256_init(desc);
 	sctx->func = CPACF_KIMD_SHA3_224;
 	return 0;
 }
 
 static struct shash_alg sha3_224_alg = {
 	.digestsize	=	SHA3_224_DIGEST_SIZE,
-	.init		=	sha3_224_init,
+	.init		=	s390_sha3_224_init,
 	.update		=	s390_sha_update_blocks,
 	.finup		=	s390_sha_finup,
-	.export		=	sha3_256_export, /* same as for 256 */
-	.import		=	sha3_224_import, /* function code different! */
+	.export		=	s390_sha3_256_export, /* same as for 256 */
+	.import		=	s390_sha3_224_import, /* function code different! */
 	.descsize	=	S390_SHA_CTX_SIZE,
 	.statesize	=	SHA3_STATE_SIZE,
 	.base		=	{
diff --git a/arch/s390/crypto/sha3_512_s390.c b/arch/s390/crypto/sha3_512_s390.c
index a5c9690eecb1..f4b52a3a0433 100644
--- a/arch/s390/crypto/sha3_512_s390.c
+++ b/arch/s390/crypto/sha3_512_s390.c
@@ -18,7 +18,7 @@
 
 #include "sha.h"
 
-static int sha3_512_init(struct shash_desc *desc)
+static int s390_sha3_512_init(struct shash_desc *desc)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 
@@ -31,7 +31,7 @@ static int sha3_512_init(struct shash_desc *desc)
 	return 0;
 }
 
-static int sha3_512_export(struct shash_desc *desc, void *out)
+static int s390_sha3_512_export(struct shash_desc *desc, void *out)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 	union {
@@ -49,7 +49,7 @@ static int sha3_512_export(struct shash_desc *desc, void *out)
 	return 0;
 }
 
-static int sha3_512_import(struct shash_desc *desc, const void *in)
+static int s390_sha3_512_import(struct shash_desc *desc, const void *in)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 	union {
@@ -67,22 +67,22 @@ static int sha3_512_import(struct shash_desc *desc, const void *in)
 	return 0;
 }
 
-static int sha3_384_import(struct shash_desc *desc, const void *in)
+static int s390_sha3_384_import(struct shash_desc *desc, const void *in)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 
-	sha3_512_import(desc, in);
+	s390_sha3_512_import(desc, in);
 	sctx->func = CPACF_KIMD_SHA3_384;
 	return 0;
 }
 
 static struct shash_alg sha3_512_alg = {
 	.digestsize	=	SHA3_512_DIGEST_SIZE,
-	.init		=	sha3_512_init,
+	.init		=	s390_sha3_512_init,
 	.update		=	s390_sha_update_blocks,
 	.finup		=	s390_sha_finup,
-	.export		=	sha3_512_export,
-	.import		=	sha3_512_import,
+	.export		=	s390_sha3_512_export,
+	.import		=	s390_sha3_512_import,
 	.descsize	=	S390_SHA_CTX_SIZE,
 	.statesize	=	SHA3_STATE_SIZE,
 	.base		=	{
@@ -97,22 +97,22 @@ static struct shash_alg sha3_512_alg = {
 
 MODULE_ALIAS_CRYPTO("sha3-512");
 
-static int sha3_384_init(struct shash_desc *desc)
+static int s390_sha3_384_init(struct shash_desc *desc)
 {
 	struct s390_sha_ctx *sctx = shash_desc_ctx(desc);
 
-	sha3_512_init(desc);
+	s390_sha3_512_init(desc);
 	sctx->func = CPACF_KIMD_SHA3_384;
 	return 0;
 }
 
 static struct shash_alg sha3_384_alg = {
 	.digestsize	=	SHA3_384_DIGEST_SIZE,
-	.init		=	sha3_384_init,
+	.init		=	s390_sha3_384_init,
 	.update		=	s390_sha_update_blocks,
 	.finup		=	s390_sha_finup,
-	.export		=	sha3_512_export, /* same as for 512 */
-	.import		=	sha3_384_import, /* function code different! */
+	.export		=	s390_sha3_512_export, /* same as for 512 */
+	.import		=	s390_sha3_384_import, /* function code different! */
 	.descsize	=	S390_SHA_CTX_SIZE,
 	.statesize	=	SHA3_STATE_SIZE,
 	.base		=	{


