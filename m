Return-Path: <keyrings+bounces-3001-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FFBB58679
	for <lists+keyrings@lfdr.de>; Mon, 15 Sep 2025 23:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E713174883
	for <lists+keyrings@lfdr.de>; Mon, 15 Sep 2025 21:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C5319E82A;
	Mon, 15 Sep 2025 21:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VmYh6a6S"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094A426AE4;
	Mon, 15 Sep 2025 21:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757970999; cv=none; b=ckmFlZU2f6VkdxQ6FIyIzFlUXWI5bRbQi22xJq2WZWnVMClt4OCNGOQxguUaBWUFt6ZIWoeEr600SSaDHni0gqGjLln+168n+Vpz5BgPfWn7poq6U44ZDvZu9Z/wgOYENPOBc5GCSzQE1AnJgF6vZMds0HoZNhxhPnwNTBwB+Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757970999; c=relaxed/simple;
	bh=eltE4P4dGi9OeQFvkpIcUPIWX78LRp5Hn4UZH+xTuB4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p6POaRV5KV37Y7emQsppafMbFJ8TbHECsfcIaDPaU2wkUwjrvUrLkXagdAANFfFjYvj1KeRtEkM5CGZ3eyitwevg2M3/FBHfdI5v6IyI35sYa4aWriC5kFAGF8ozfe6HryVwWoFMtfG5MW+gY7JyAXoyNjK+TYaBYHF3tEBtBYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VmYh6a6S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D01AC4CEF1;
	Mon, 15 Sep 2025 21:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757970998;
	bh=eltE4P4dGi9OeQFvkpIcUPIWX78LRp5Hn4UZH+xTuB4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VmYh6a6SLAD437UzaOyJhyQJpHwIcArEnICrIsFykXuoJ/k7UQnMA5WIwb3Okxl7v
	 6Z9P2JKATfY0912taRYgzTjHi848lZA2MXnFAqSm2J8v6v4A4Ee3BUT6Um2Hj/b19F
	 l1g+BKU9KPIFHMAUTZF5Zu1dg8gjRvoT61s1dkP4XVatk5d1IGQRFHtWV6jCUV8XPx
	 x2dN7Wt4wp5BKG2Z9eiKjYg+aeBNEr7GfO4ensalT+mvKKz8Ir6hPf5yztTkWrC4p3
	 EgCbmswmmPA+LPqUjdXRQgXLB7aM/aEHA1hQSeZNvYAGBSdvSuZNswtLwZj/2eykZn
	 dedI3W4XpCxGw==
From: wufan@kernel.org
To: keyrings@vger.kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dhowells@redhat.com,
	lukas@wunner.de,
	ignat@cloudflare.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	jarkko@kernel.org,
	zohar@linux.ibm.com,
	eric.snowberg@oracle.com,
	Fan Wu <wufan@kernel.org>
Subject: [PATCH v2] KEYS: X.509: Fix Basic Constraints CA flag parsing
Date: Mon, 15 Sep 2025 21:15:50 +0000
Message-Id: <20250915211550.2610-1-wufan@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911225356.2678-1-wufan@kernel.org>
References: <20250911225356.2678-1-wufan@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fan Wu <wufan@kernel.org>

Fix the X.509 Basic Constraints CA flag parsing to correctly handle
the ASN.1 DER encoded structure. The parser was incorrectly treating
the length field as the boolean value.

Per RFC 5280 section 4.1, X.509 certificates must use ASN.1 DER encoding.
According to ITU-T X.690, a DER-encoded BOOLEAN is represented as:

Tag (0x01), Length (0x01), Value (0x00 for FALSE, 0xFF for TRUE)

The basicConstraints extension with CA:TRUE is encoded as:

  SEQUENCE (0x30) | Length | BOOLEAN (0x01) | Length (0x01) | Value (0xFF)
                             ^-- v[2]         ^-- v[3]        ^-- v[4]

The parser was checking v[3] (the length field, always 0x01) instead
of v[4] (the actual boolean value, 0xFF for TRUE in DER encoding).

Also handle the case where the extension is an empty SEQUENCE (30 00),
which is valid for CA:FALSE when the default value is omitted as
required by DER encoding rules (X.690 section 11.5).

Per ITU-T X.690-0207:
- Section 11.5: Default values must be omitted in DER
- Section 11.1: DER requires TRUE to be encoded as 0xFF

Link: https://datatracker.ietf.org/doc/html/rfc5280
Link: https://www.itu.int/ITU-T/studygroups/com17/languages/X.690-0207.pdf
Fixes: 30eae2b037af ("KEYS: X.509: Parse Basic Constraints for CA")
Signed-off-by: Fan Wu <wufan@kernel.org>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 2ffe4ae90bea..8df3fa60a44f 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -610,11 +610,14 @@ int x509_process_extension(void *context, size_t hdrlen,
 		/*
 		 * Get hold of the basicConstraints
 		 * v[1] is the encoding size
-		 *	(Expect 0x2 or greater, making it 1 or more bytes)
+		 *	(Expect 0x00 for empty SEQUENCE with CA:FALSE, or
+		 *	0x03 or greater for non-empty SEQUENCE)
 		 * v[2] is the encoding type
 		 *	(Expect an ASN1_BOOL for the CA)
-		 * v[3] is the contents of the ASN1_BOOL
-		 *      (Expect 1 if the CA is TRUE)
+		 * v[3] is the length of the ASN1_BOOL
+		 *	(Expect 1 for a single byte boolean)
+		 * v[4] is the contents of the ASN1_BOOL
+		 *	(Expect 0xFF if the CA is TRUE)
 		 * vlen should match the entire extension size
 		 */
 		if (v[0] != (ASN1_CONS_BIT | ASN1_SEQ))
@@ -623,8 +626,13 @@ int x509_process_extension(void *context, size_t hdrlen,
 			return -EBADMSG;
 		if (v[1] != vlen - 2)
 			return -EBADMSG;
-		if (vlen >= 4 && v[1] != 0 && v[2] == ASN1_BOOL && v[3] == 1)
+		/* Empty SEQUENCE means CA:FALSE (default value omitted per DER) */
+		if (v[1] == 0)
+			return 0;
+		if (vlen >= 5 && v[2] == ASN1_BOOL && v[3] == 1 && v[4] == 0xFF)
 			ctx->cert->pub->key_eflags |= 1 << KEY_EFLAG_CA;
+		else
+			return -EBADMSG;
 		return 0;
 	}
 
-- 
2.51.0


