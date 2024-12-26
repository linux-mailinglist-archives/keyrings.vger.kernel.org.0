Return-Path: <keyrings+bounces-2321-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A24499FCC96
	for <lists+keyrings@lfdr.de>; Thu, 26 Dec 2024 19:16:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46CEE161050
	for <lists+keyrings@lfdr.de>; Thu, 26 Dec 2024 18:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43EF24E1CA;
	Thu, 26 Dec 2024 18:16:48 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mailout3.hostsharing.net (mailout3.hostsharing.net [176.9.242.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3F423DE;
	Thu, 26 Dec 2024 18:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237008; cv=none; b=TC1jiMJfee4FJ7QpXvwSScT4prf3omPAt1icG8eVT5j9WCvK2529NX7w/+XxeUoVx2ixHqkOim8zat1wmqgx7BcN/Vr6sZnnYc+blfab4F7d1fhghPFi8Mn0eNCgCnvLvcdXgouICJv8Gk8hbPeZR/gaH5Z5pFKD6UM5GviRjys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237008; c=relaxed/simple;
	bh=9QTPw52L00sba8VuJf4k+L/K3GzV4Sm0yf6NFDz6Vb4=;
	h=Message-ID:From:Date:Subject:To:Cc; b=MGL60kiKmnFFNIoVQ5m0mdE45Zf0WHEgSESh3GkTsiobLfQVaIwd2j4dilx4UqfZBAHF14MCZBsPccLSn1sChsnlC2DypiomGRDy/WNqHNpai2LvkQnJoJ3Z8BmVjlUI6UhuzocfQnSRE9ZzABvBAwjMk+ZGdopKju2okGhz4nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=176.9.242.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id BCF6B1003D08A;
	Thu, 26 Dec 2024 19:08:32 +0100 (CET)
Received: from localhost (unknown [89.246.108.87])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by h08.hostsharing.net (Postfix) with ESMTPSA id 60C786188CD9;
	Thu, 26 Dec 2024 19:08:32 +0100 (CET)
X-Mailbox-Line: From a0e1aa407de754e03a7012049e45e25d7af10e08 Mon Sep 17 00:00:00 2001
Message-ID: <cover.1735236227.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Thu, 26 Dec 2024 19:08:00 +0100
Subject: [PATCH 0/3] ecdsa KEYCTL_PKEY_QUERY fixes
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>
Cc: David Howells <dhowells@redhat.com>, Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

For ecdsa, KEYCTL_PKEY_QUERY reports nonsensical values for
enc/dec size and (for P521 keys) also the key size.

Since these are mostly just cosmetic issues, I recommend
not applying for v6.13, but rather let the patches soak
in linux-next.

Thanks!

Lukas Wunner (3):
  crypto: sig - Prepare for algorithms with variable signature size
  crypto: ecdsa - Fix enc/dec size reported by KEYCTL_PKEY_QUERY
  crypto: ecdsa - Fix NIST P521 key size reported by KEYCTL_PKEY_QUERY

 crypto/asymmetric_keys/public_key.c | 22 +++++++++++-----------
 crypto/ecdsa-p1363.c                |  4 ++--
 crypto/ecdsa-x962.c                 |  4 ++--
 crypto/ecdsa.c                      |  2 +-
 crypto/ecrdsa.c                     |  2 +-
 crypto/rsassa-pkcs1.c               |  4 ++--
 crypto/sig.c                        |  9 +++++++--
 crypto/testmgr.c                    |  7 ++++---
 include/crypto/sig.h                |  7 ++++---
 9 files changed, 34 insertions(+), 27 deletions(-)

-- 
2.43.0


