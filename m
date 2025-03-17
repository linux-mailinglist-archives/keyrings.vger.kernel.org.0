Return-Path: <keyrings+bounces-2460-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1251BA64ACB
	for <lists+keyrings@lfdr.de>; Mon, 17 Mar 2025 11:51:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13C70164A47
	for <lists+keyrings@lfdr.de>; Mon, 17 Mar 2025 10:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE098236A6B;
	Mon, 17 Mar 2025 10:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BZU7zoAf"
X-Original-To: keyrings@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711DF236426
	for <keyrings@vger.kernel.org>; Mon, 17 Mar 2025 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742208553; cv=none; b=m+bKQd/owFE58dK4t9rA/qTu3TlLhzbTPlUDBttmtNEDZVfOEMt+qIuKvx8c9VViypjVS3nLZaQVzs7Tus6cx5y64PCxMz2/Gs+cxMuM0QGSXkNXLqKqCHCX9CIMX1K1/5qOdZLS2E9pfcJ1i/dJPaE+vxQf2iqKAJQY/5hXQtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742208553; c=relaxed/simple;
	bh=Kp18ekQ3AfM4qDIYttsL+4agfm89UIpbN5I4b9i+xME=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ceOOsMXpTglelE/Dk//rPpZWq2kwnfDc1+d4KN+b2gxhE2Oaw1g9mypkoylj8rjNVvTxPrKxEDhxOoyrCGkrB5iEOW8A4mRiJQDi1jHeb4yfChfwHi2YnXqRAjICXcYC1hN1bz6LNpeWsoCfDsRAt7Q8OggOIosds5TbDSD++NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BZU7zoAf; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742208538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EIOtecTr1V7gaL+HzDR3DlZXqtP21yGqlv128Jc8x58=;
	b=BZU7zoAfU6RK+MPW7YLHc7etIt6k9f7fHRaHe6saXSWWtlxWvOwLP/bi3TSTrelDLcs816
	oqwq+LOvDmYx9iYyEndZHoyEFCMSK6nZDOiZ3IuKnuNKam9CRaNdE1c2WPLEfs4YHpZARH
	SRMKSFQryMHtP4bAhzH3bQAWU600Tv0=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: x509 - Replace kmalloc() + NUL-termination with kzalloc()
Date: Mon, 17 Mar 2025 11:48:41 +0100
Message-ID: <20250317104841.54336-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use kzalloc() to zero out the one-element array instead of using
kmalloc() followed by a manual NUL-termination.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index ee2fdab42334..2ffe4ae90bea 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -372,10 +372,9 @@ static int x509_fabricate_name(struct x509_parse_context *ctx, size_t hdrlen,
 
 	/* Empty name string if no material */
 	if (!ctx->cn_size && !ctx->o_size && !ctx->email_size) {
-		buffer = kmalloc(1, GFP_KERNEL);
+		buffer = kzalloc(1, GFP_KERNEL);
 		if (!buffer)
 			return -ENOMEM;
-		buffer[0] = 0;
 		goto done;
 	}
 
-- 
2.48.1


