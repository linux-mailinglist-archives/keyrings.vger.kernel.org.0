Return-Path: <keyrings+bounces-2378-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 039B8A24FAF
	for <lists+keyrings@lfdr.de>; Sun,  2 Feb 2025 20:09:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 891F316253D
	for <lists+keyrings@lfdr.de>; Sun,  2 Feb 2025 19:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCA81F791E;
	Sun,  2 Feb 2025 19:09:44 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout2.hostsharing.net (mailout2.hostsharing.net [83.223.78.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023A01FDA99;
	Sun,  2 Feb 2025 19:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738523383; cv=none; b=tdysff0UNBMwkj2r/FzCCJ4N+RX5W2DuwEnMMr8VCC1hDJi2P4X7H8LQCHaQhkztlmg3PI9HDfzHhWHeqBR+ia29k7DrKpb3uAu+1dTu/tBwBx5hI9wUmb8X8W3Z3hKY/Y6UGYzCWv6YGQJ1zSBHu6pUcCj74bWPYzMss8Cqk+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738523383; c=relaxed/simple;
	bh=BtAS3rJIBAFX83/EjKyLeFj5BF8z6WvGzA8pzCPQKf4=;
	h=Message-ID:From:Date:Subject:To:Cc; b=E2v2lNvAOku72nYYGtDETjKS8rR2azqlCTeHyyDyUTPmFwEL6zsjsgyaf40lKKNfKbauOkwL18Lhyl/RGc75FMiE0hMhwHDg2UNGXYFKFXAFpYlhO8QiyDt7xx650gpWxbVwyj1XdsBozEmMjnCw58D/+L9PIXX37n2P5EQ7FJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.78.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout2.hostsharing.net (Postfix) with ESMTPS id 5996210189C03;
	Sun,  2 Feb 2025 20:02:23 +0100 (CET)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 2331F61024FA;
	Sun,  2 Feb 2025 20:02:23 +0100 (CET)
X-Mailbox-Line: From c9d465b449b6ba2e4a59b3480119076ba1138ded Mon Sep 17 00:00:00 2001
Message-ID: <cover.1738521533.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Sun, 2 Feb 2025 20:00:50 +0100
Subject: [PATCH v2 0/4] ecdsa KEYCTL_PKEY_QUERY fixes
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>
Cc: David Howells <dhowells@redhat.com>, Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

For ecdsa, KEYCTL_PKEY_QUERY reports nonsensical values for
enc/dec size and (for P521 keys) also the key size.
Second attempt at fixing them.

Changes v1 -> v2:

* New patch [2/4] to introduce DIV_ROUND_UP_POW2(), which avoids
  integer overflows that may occur with DIV_ROUND_UP() (Herbert)

* Amend patch [4/4] to use DIV_ROUND_UP_POW2() (Herbert)

* Amend patch [4/4] to use BITS_PER_BYTE for clarity

Link to v1:

  https://lore.kernel.org/r/cover.1735236227.git.lukas@wunner.de

Lukas Wunner (4):
  crypto: sig - Prepare for algorithms with variable signature size
  crypto: ecdsa - Harden against integer overflows in DIV_ROUND_UP()
  crypto: ecdsa - Fix enc/dec size reported by KEYCTL_PKEY_QUERY
  crypto: ecdsa - Fix NIST P521 key size reported by KEYCTL_PKEY_QUERY

 crypto/asymmetric_keys/public_key.c | 22 +++++++++++-----------
 crypto/ecc.c                        |  2 +-
 crypto/ecdsa-p1363.c                |  8 +++++---
 crypto/ecdsa-x962.c                 |  7 ++++---
 crypto/ecdsa.c                      |  2 +-
 crypto/ecrdsa.c                     |  2 +-
 crypto/rsassa-pkcs1.c               |  4 ++--
 crypto/sig.c                        |  9 +++++++--
 crypto/testmgr.c                    |  7 ++++---
 include/crypto/sig.h                |  7 ++++---
 include/linux/math.h                | 12 ++++++++++++
 11 files changed, 52 insertions(+), 30 deletions(-)

-- 
2.43.0


