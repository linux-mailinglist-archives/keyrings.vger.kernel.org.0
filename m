Return-Path: <keyrings+bounces-2992-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C87AB53ED7
	for <lists+keyrings@lfdr.de>; Fri, 12 Sep 2025 00:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 043DA488073
	for <lists+keyrings@lfdr.de>; Thu, 11 Sep 2025 22:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 201B92F3C0E;
	Thu, 11 Sep 2025 22:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKDtBd3z"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8ED2C11EA;
	Thu, 11 Sep 2025 22:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757631251; cv=none; b=OwGMNW8Xzb5Vsny6ciWKRaajYXCVU9t+HDHyH7s9PyS2/zqqjrUoFVPdL6SswgBYW91xEJULlrmILsiI7MSueDmWKQRF6eMNBz+7g8Y/pCQ9z/1qCWpOnA4W8nlNQaNdZkn2TnloLwldF1GpyZrKNpr8lWcIJKVuwMKZm2tse9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757631251; c=relaxed/simple;
	bh=U3h0O2i61tvDjj4VQGMRnquB/fjYMhC1XaAwU6/Z438=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iydbjk4WDccYNvNMRw/W5MbTQFXxzvVBc6L0QAi33Tr1cp3kj+s6FW5V+jZPz5EGeXi9LL6Q0KgzD8QNCKckaB+ZzFAmsBg5DYpGB0d5bW6nUvS29SBwGy6YHnKfkuO54AdY4P7at/HPtomh4KkdV5NdjIpeL+xrlRhdRli3jI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKDtBd3z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D7DBC4CEF0;
	Thu, 11 Sep 2025 22:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757631250;
	bh=U3h0O2i61tvDjj4VQGMRnquB/fjYMhC1XaAwU6/Z438=;
	h=From:To:Cc:Subject:Date:From;
	b=JKDtBd3zvXgFQOknyAhJRxvsSkDCdAvScV04XB08tJgKwai0vWhT5P9JaU3+0TOdh
	 MJFJs+N0cOv9dvkQ0zYIVGO+RUIB0v9OJoMX6z7Zd9slCM5CBikRRD9l4k6N4Ntn2E
	 WPLkWFysyB8u5mbKC0Er4+KQ0+X/0H+Pel8LuZwMB88ipU7ZKOVyhgtOOqVhz/T0IB
	 RPWzFDaCCw0Aldm73XFtf6sZzfLJeZB3Eke2c1RPOWOBtaPCGdCUGQ6kY7sdDDaHKX
	 Okjej8yRCxcEDZGCv5Woo6HgePcuwr1HgaDEJDHKULatFsGmukTsv0x0TUhVtluWlc
	 ejtZSKf8HEH0w==
From: wufan@kernel.org
To: dhowells@redhat.com,
	lukas@wunner.de,
	ignat@cloudflare.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	jarkko@kernel.org,
	zohar@linux.ibm.com,
	eric.snowberg@oracle.com
Cc: keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fan Wu <wufan@kernel.org>
Subject: [PATCH] KEYS: X.509: Fix Basic Constraints CA flag parsing
Date: Thu, 11 Sep 2025 22:53:56 +0000
Message-Id: <20250911225356.2678-1-wufan@kernel.org>
X-Mailer: git-send-email 2.34.1
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

According to ITU-T X.690 section 8.2, a BOOLEAN is encoded as:

Tag (0x01), Length (0x01), Value (0x00 for FALSE, non-zero for TRUE)

The basicConstraints extension with CA:TRUE is encoded as:

  SEQUENCE (0x30) | Length | BOOLEAN (0x01) | Length (0x01) | Value (0xFF)
                             ^-- v[2]         ^-- v[3]        ^-- v[4]

The parser was checking v[3] (the length field, always 0x01) instead
of v[4] (the actual boolean value, 0xFF for TRUE).

Per ITU-T X.690-02/2021 section 8.2.2:
"If the boolean value is TRUE, the octet shall have any non-zero
value, as a sender's option."

Most implementations, including OpenSSL, encode TRUE as 0xFF.

Link: https://www.itu.int/ITU-T/studygroups/com17/languages/X.690-0207.pdf
Fixes: 30eae2b037af ("KEYS: X.509: Parse Basic Constraints for CA")
Signed-off-by: Fan Wu <wufan@kernel.org>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 2ffe4ae90bea..4dfec6c45772 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -613,8 +613,10 @@ int x509_process_extension(void *context, size_t hdrlen,
 		 *	(Expect 0x2 or greater, making it 1 or more bytes)
 		 * v[2] is the encoding type
 		 *	(Expect an ASN1_BOOL for the CA)
-		 * v[3] is the contents of the ASN1_BOOL
-		 *      (Expect 1 if the CA is TRUE)
+		 * v[3] is the length of the ASN1_BOOL
+		 *	(Expect 1 for a single byte boolean)
+		 * v[4] is the contents of the ASN1_BOOL
+		 *	(Expect non-zero if the CA is TRUE, typically 0xFF)
 		 * vlen should match the entire extension size
 		 */
 		if (v[0] != (ASN1_CONS_BIT | ASN1_SEQ))
@@ -623,7 +625,7 @@ int x509_process_extension(void *context, size_t hdrlen,
 			return -EBADMSG;
 		if (v[1] != vlen - 2)
 			return -EBADMSG;
-		if (vlen >= 4 && v[1] != 0 && v[2] == ASN1_BOOL && v[3] == 1)
+		if (vlen >= 5 && v[1] != 0 && v[2] == ASN1_BOOL && v[3] == 1 && v[4] != 0)
 			ctx->cert->pub->key_eflags |= 1 << KEY_EFLAG_CA;
 		return 0;
 	}
-- 
2.50.1


