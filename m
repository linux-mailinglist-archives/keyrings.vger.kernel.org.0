Return-Path: <keyrings+bounces-1100-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C978AD652
	for <lists+keyrings@lfdr.de>; Mon, 22 Apr 2024 23:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A83C51C20C6F
	for <lists+keyrings@lfdr.de>; Mon, 22 Apr 2024 21:09:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DDC71C69A;
	Mon, 22 Apr 2024 21:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bb2nR47d"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E521C286;
	Mon, 22 Apr 2024 21:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713820159; cv=none; b=kZ/dp9ZK48e5yEphP9AsGtNiUAiEww1S6T89puhqUxudM4Wz/bQIpuIWzpMCH8/eC8avUTuO2yCKtGeYkcTheV8zoLUer2nToRfgw1kN5f4V98ZLjL2pYnLhcm1UOLVIsGQOzHl3aaXUkaGgpgey6O5hDlVAGGN5Z9vbjLm6ozM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713820159; c=relaxed/simple;
	bh=EZ/4suVJKVlwC7dAC9OkDw5dwBWhF1JTgJot7xAMDGw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HsWWosKufpOQqtxGpOMquyhFdhAi5BdWF1kkARl2G9YtGPoolX88tvB9XAyTHy79hgljY+WggL/j+RuIa6hzCVwiT8lAQq+DUjhS3kF4VmzsNFUHPHwnKKo/D1PKmEGgjzXJDs+B2482g+IEv4kPjH9LubGlrVCM//gqS1DQ2WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bb2nR47d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63A7BC113CC;
	Mon, 22 Apr 2024 21:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713820158;
	bh=EZ/4suVJKVlwC7dAC9OkDw5dwBWhF1JTgJot7xAMDGw=;
	h=From:To:Cc:Subject:Date:From;
	b=bb2nR47d3zVmLp2Hd6zkL9rJi06DjrFGC0d5wW3I+YsaHf1Nh+yHIg+r+4nFkoqpr
	 2nTmGn/dyhjhnRBHKO2xnWqIi2GSX8JOSErtJtQhqpRTjgFNExWzivu1nZqpMHpP+e
	 OR0isIqXkBxPDPC0EndceaLlQs2O2ItoXFd7r/VejgEttA8QxqPciftk4NBpQE2Mts
	 UUtK2Zp+Z+Kjheom2hAILcgoPjsKu7H0TOIbKM1gsrRxTPOtrvJYfrA6t6TBlaoIIG
	 2nAWQPis5Z53d5x1Kv/GkLYBaUkCkQWI5qy6npKuiGV3os/l0lfnw10Sag3o9pjqVV
	 lOAOzH5L89/oA==
From: Eric Biggers <ebiggers@kernel.org>
To: keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] KEYS: asymmetric: Add missing dependency on CRYPTO_SIG
Date: Mon, 22 Apr 2024 14:08:45 -0700
Message-ID: <20240422210845.319819-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

Make ASYMMETRIC_PUBLIC_KEY_SUBTYPE select CRYPTO_SIG to avoid build
errors like the following, which were possible with
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y && CONFIG_CRYPTO_SIG=n:

    ld: vmlinux.o: in function `public_key_verify_signature':
    (.text+0x306280): undefined reference to `crypto_alloc_sig'
    ld: (.text+0x306300): undefined reference to `crypto_sig_set_pubkey'
    ld: (.text+0x306324): undefined reference to `crypto_sig_verify'
    ld: (.text+0x30636c): undefined reference to `crypto_sig_set_privkey'

Fixes: 63ba4d67594a ("KEYS: asymmetric: Use new crypto interface without scatterlists")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 crypto/asymmetric_keys/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kconfig
index 59ec726b7c77..3f089abd6fc9 100644
--- a/crypto/asymmetric_keys/Kconfig
+++ b/crypto/asymmetric_keys/Kconfig
@@ -13,10 +13,11 @@ if ASYMMETRIC_KEY_TYPE
 config ASYMMETRIC_PUBLIC_KEY_SUBTYPE
 	tristate "Asymmetric public-key crypto algorithm subtype"
 	select MPILIB
 	select CRYPTO_HASH_INFO
 	select CRYPTO_AKCIPHER
+	select CRYPTO_SIG
 	select CRYPTO_HASH
 	help
 	  This option provides support for asymmetric public key type handling.
 	  If signature generation and/or verification are to be used,
 	  appropriate hash algorithms (such as SHA-1) must be available.

base-commit: ed30a4a51bb196781c8058073ea720133a65596f
-- 
2.44.0


