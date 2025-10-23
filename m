Return-Path: <keyrings+bounces-3266-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C13C01CEC
	for <lists+keyrings@lfdr.de>; Thu, 23 Oct 2025 16:35:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6F86050913F
	for <lists+keyrings@lfdr.de>; Thu, 23 Oct 2025 14:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A14CA324B39;
	Thu, 23 Oct 2025 14:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LQOOn0pK"
X-Original-To: keyrings@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D14B315D20
	for <keyrings@vger.kernel.org>; Thu, 23 Oct 2025 14:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761230011; cv=none; b=kfp0oqPlKAStp+kkS1j1rb13Feu5Xk/N+8QFz6RgtzyBPT2KYY9x/ztaT5NhrD6X+8usWeHJ8vHCfvi2B75yQNBjmn46qJ/SGFOJtV4lsOA0vy4LuM5vwSPXTozIsYz3ov+uRsfdcgQ2Xo+Qx3GwZVoNuBmcLiXmhb2Q65/ZdtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761230011; c=relaxed/simple;
	bh=8NgwQweyZuDJ8/KcYC5Hfn23aZHcjwuD1uknqfrLQwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AywCctJ+1q0Hy0zxqiSon/6l9R/z6sZl7uJq4eahFAk1zM4u6EOLq4u1MvERj+qqFrXUEVrgl9p+l0YbvoZB9UJc49oINAy7rqwGZAxxASyiP04iUGQvu/egy8qCAJrS9sIa+400qUFzW1/EPIpXLJkc/VHxidp5nLXw8gztL4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LQOOn0pK; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761229995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=15GFw2QBhjZqG65uQkH32rydnUNCMz9Y1CRyt3oylXs=;
	b=LQOOn0pKCqvLAPAzE+RHedfGPfEU3lyrAoKa+Sq8XPCKClSqq1mOIu/Go7Y869h5sqvzdN
	PQznvWadajfcl4ZWgbr2QTXLDNjPuXSvDxN+MYdh8yhh856/QSQDvlVTpDOFMKU2ttMmo/
	Sm3qrtubDAv5qdkutncbFTJi9qjEjzc=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: David Howells <dhowells@redhat.com>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] keys: Remove unnecessary local variable from ca_keys_setup
Date: Thu, 23 Oct 2025 16:32:31 +0200
Message-ID: <20251023143231.2086-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

The variable 'ret', whose name implies a return variable, is only used
to temporarily store the result of __asymmetric_key_hex_to_key_id().
Use the result directly and remove the local variable.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 crypto/asymmetric_keys/restrict.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/restrict.c
index afcd4d101ac5..57ee2021fef7 100644
--- a/crypto/asymmetric_keys/restrict.c
+++ b/crypto/asymmetric_keys/restrict.c
@@ -29,15 +29,13 @@ static int __init ca_keys_setup(char *str)
 	if (strncmp(str, "id:", 3) == 0) {
 		struct asymmetric_key_id *p = &cakey.id;
 		size_t hexlen = (strlen(str) - 3) / 2;
-		int ret;
 
 		if (hexlen == 0 || hexlen > sizeof(cakey.data)) {
 			pr_err("Missing or invalid ca_keys id\n");
 			return 1;
 		}
 
-		ret = __asymmetric_key_hex_to_key_id(str + 3, p, hexlen);
-		if (ret < 0)
+		if (__asymmetric_key_hex_to_key_id(str + 3, p, hexlen) < 0)
 			pr_err("Unparsable ca_keys id hex string\n");
 		else
 			ca_keyid = p;	/* owner key 'id:xxxxxx' */
-- 
2.51.0


