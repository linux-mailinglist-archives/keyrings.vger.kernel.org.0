Return-Path: <keyrings+bounces-3317-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DECC4607F
	for <lists+keyrings@lfdr.de>; Mon, 10 Nov 2025 11:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D23C23478DD
	for <lists+keyrings@lfdr.de>; Mon, 10 Nov 2025 10:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1830E2FFFA8;
	Mon, 10 Nov 2025 10:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kv0Nf7Ec"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47EC2FDC22;
	Mon, 10 Nov 2025 10:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762771613; cv=none; b=kh2USFcSPxttxswddxXCpU0fI9qLszEODvrmtrmHCV7NS0nCxNNursEC/4IIgM4IiFflWTJoatJEMBVKAgElmMOKtz3W/7bwE0cpxj8CqGBiJJTqFPk00KCdM88gxSGwMxsQRWFNIPt/4to7OASreaZMOPx50GFs3akvQ+oJXpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762771613; c=relaxed/simple;
	bh=hmsOoSU4/NyD8K12tsKeocZRd2jvpEFv35jpWVhC4/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KOnI8CUy2mnk/7V6WoWIgR9znc0OIB38v7RScX4To3iqDV7mkwkldL+okmKAedt7M2mzMPLvLnBfoMXfZT3m8xV2aTBkhb7MdokD6txpK3ivJjEQLxYPL5dAgVvyPoIMhbH+qysMv8n3jdCFFDJE5pbGf8rkYfbMaH7/VJm52hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kv0Nf7Ec; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0383FC116D0;
	Mon, 10 Nov 2025 10:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762771612;
	bh=hmsOoSU4/NyD8K12tsKeocZRd2jvpEFv35jpWVhC4/k=;
	h=Date:From:To:Cc:Subject:From;
	b=Kv0Nf7EcD79x3wAwT3YwErE0roy1KfF7IYXZnNprfg7LHv3pt7kJie0I2JaF3VTG2
	 qN5FCwKjWzJ5hrbPX3nqAyTcOyTmluMK1zyi6fkJ8jm0ksMVtfg8nor/moWKo2xaqy
	 RPC9Pg5uRg8xIi3QUGbcjW6VTGsSJXDjvhWJLJpm8ULfD8g6MSo2Sn1pIuYQcCLcHU
	 kFKHyvfweDVCbiQWdzkv6hcXZbBR2CMlCYecOsz8Ujbzcqj6384k2lrp7moO1CBAb/
	 bgPNM+jSsE1d8axaFIngzShcNThgZZIn3oUqnlyKRZyy2RN0eWhaMfFiQwz2fPaS+X
	 zWL9fdqcP+P2Q==
Date: Mon, 10 Nov 2025 19:46:45 +0900
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: [PATCH][next] KEYS: Avoid -Wflex-array-member-not-at-end warning
Message-ID: <aRHClatB48XT_hap@kspp>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

-Wflex-array-member-not-at-end was introduced in GCC-14, and we are
getting ready to enable it, globally.

Use the new TRAILING_OVERLAP() helper to fix the following warning:

crypto/asymmetric_keys/restrict.c:20:34: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]

This helper creates a union between a flexible-array member (FAM) and a
set of MEMBERS that would otherwise follow it.

This overlays the trailing MEMBER unsigned char data[10]; onto the FAM
struct asymmetric_key_id::data[], while keeping the FAM and the start
of MEMBER aligned.

The static_assert() ensures this alignment remains, and it's
intentionally placed inmediately after the corresponding structures --no
blank line in between.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 crypto/asymmetric_keys/restrict.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/crypto/asymmetric_keys/restrict.c b/crypto/asymmetric_keys/restrict.c
index afcd4d101ac5..86292965f493 100644
--- a/crypto/asymmetric_keys/restrict.c
+++ b/crypto/asymmetric_keys/restrict.c
@@ -17,9 +17,12 @@ static struct asymmetric_key_id *ca_keyid;
 
 #ifndef MODULE
 static struct {
-	struct asymmetric_key_id id;
-	unsigned char data[10];
+	/* Must be last as it ends in a flexible-array member. */
+	TRAILING_OVERLAP(struct asymmetric_key_id, id, data,
+		unsigned char data[10];
+	);
 } cakey;
+static_assert(offsetof(typeof(cakey), id.data) == offsetof(typeof(cakey), data));
 
 static int __init ca_keys_setup(char *str)
 {
-- 
2.43.0


