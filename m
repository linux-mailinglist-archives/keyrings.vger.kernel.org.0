Return-Path: <keyrings+bounces-1437-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8A88CDC00
	for <lists+keyrings@lfdr.de>; Thu, 23 May 2024 23:26:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFC27286870
	for <lists+keyrings@lfdr.de>; Thu, 23 May 2024 21:26:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18865127E28;
	Thu, 23 May 2024 21:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BumYdKQn"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63AE129A7E;
	Thu, 23 May 2024 21:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716499532; cv=none; b=jSF0zYuA44M2pfm0CTmwN04r5UJxgEJ5eGMfPCAwKoE9g+YOIA2Jf3dxxhTjtIIq4hGQ0iGAPUnQ/JLk9xCix9qOP6ZDLSKgob9u0pfX0ygGr/fvUyXHfri4LRnbGeJ05EampQ7ZUbOh89pOvcqIIWhhV0IMI8X6eAlIQPgAoIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716499532; c=relaxed/simple;
	bh=mZRcz9OSsK8uHOdUCIoBp+dhRpamjTsxuYIFBW19txc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bE0vCS0p9YgY/XpXEj4bKr2K4D6NS5reaohvUtUIuXRPwVojyk/qWoV4NqW0GATYD+tG7U/aGlvZh7UoVvlKSN3F54nRUJjOXI7YGxzwbco0x3AaIAWg/QWPi2MEej2nCa7j9NlJ+h2DloHoRA7GBgdbcUBes58fndsL+vjarHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BumYdKQn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D3A8C2BD10;
	Thu, 23 May 2024 21:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716499531;
	bh=mZRcz9OSsK8uHOdUCIoBp+dhRpamjTsxuYIFBW19txc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BumYdKQnELuTPRp0l7eqQTH5Yufjq43sYVnyjnY7W9gEpJV/gnPl18raTcrnNtlzj
	 LOGzW8xC6DTWvfUbRR2ILmN8/59LHkq9bmmJ9Vl+l9CE7TxzgSdzVsNht4+Pgr94a1
	 P7hFYB3HahWk4ALeyFLpxMt+9ng2XV+rluqRvDTjhOK+6jsZk18YpX5E2fL+Jy8PUu
	 QoRnlNBQmh29lBQTyeXu8QfURqSPxBSyJFIei/kvmZRM8NAAYC5yxDCNdDC2OWOQ1m
	 QBMcuqcLB6KJv+1eBKpVyuyXsweGpHDmB6h/0XdYg5OBdbsswF1o/XSmDXcK3XXj6F
	 4b4JvdlchD3aQ==
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	Andreas.Fuchs@infineon.com,
	James Prestwood <prestwoj@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Biggers <ebiggers@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-crypto@vger.kernel.org,
	Jarkko Sakkinen <jarkko@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	linux-kernel@vger.kernel.org (open list),
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	linux-security-module@vger.kernel.org (open list:SECURITY SUBSYSTEM)
Subject: [PATCH v5 2/5] KEYS: trusted: Change -EINVAL to -E2BIG
Date: Fri, 24 May 2024 00:25:03 +0300
Message-ID: <20240523212515.4875-3-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240523212515.4875-1-jarkko@kernel.org>
References: <20240523212515.4875-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Report -E2BIG instead of -EINVAL when too large size for the key blob is
requested.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 security/keys/trusted-keys/trusted_tpm2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
index d478096cb5c1..7317e07440c3 100644
--- a/security/keys/trusted-keys/trusted_tpm2.c
+++ b/security/keys/trusted-keys/trusted_tpm2.c
@@ -122,7 +122,7 @@ static int tpm2_key_decode(struct trusted_key_payload *payload,
 		return ret;
 
 	if (ctx.priv_len + ctx.pub_len > MAX_BLOB_SIZE)
-		return -EINVAL;
+		return -E2BIG;
 
 	blob = kmalloc(ctx.priv_len + ctx.pub_len + 4, GFP_KERNEL);
 	if (!blob)
-- 
2.45.1


