Return-Path: <keyrings+bounces-2605-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E03E8A7EDA2
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 21:41:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC9891882D10
	for <lists+keyrings@lfdr.de>; Mon,  7 Apr 2025 19:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBED6257D;
	Mon,  7 Apr 2025 19:36:08 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58A81FC7D2;
	Mon,  7 Apr 2025 19:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744054568; cv=none; b=nAaMmlCnEk+ZNd4hRqIyr1idbf3kSTBAyHgfnf/YViDr7JeNY2FtqomYf4Jc4uSeJyG40BxUviT8SRktAjwdes7fnRwT7nmYqcPo55PE4Ne1nnPYRNyi3KKprzwmHAOxPxe4qXywlgGrPnayr8kZT+SmuRKG4y4NbxEmM33TI4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744054568; c=relaxed/simple;
	bh=KxWHy3JgTWzGoPPKad6LBed8Ji/zR+U0rvQ32UER9f4=;
	h=Message-Id:From:Date:Subject:To:Cc; b=YQjFq6emdnUMzEAlwIUzk9vU1Fhn367pMDxph/BVjo6SrrhnEkWw7voUS+EjLEkjeuvc7rjXW4GZoW+WeIYsTx/38i9kiPpL2230A1lusmf+rmXXDdH9G/YXL3/J9US0ke5c3RMk4UumukZvEl7VqzLFQcC6ok3LxLLSk6x6/Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass smtp.mailfrom=wunner.de; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wunner.de
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id E64242C4C0F1;
	Mon,  7 Apr 2025 21:35:34 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id F0AEA32756; Mon,  7 Apr 2025 21:35:55 +0200 (CEST)
Message-Id: <cover.1744052920.git.lukas@wunner.de>
From: Lukas Wunner <lukas@wunner.de>
Date: Mon, 7 Apr 2025 21:32:40 +0200
Subject: [PATCH RESEND v2 0/2] ecdsa KEYCTL_PKEY_QUERY fixes
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>
Cc: David Howells <dhowells@redhat.com>, Ignat Korchagin <ignat@cloudflare.com>, Stefan Berger <stefanb@linux.ibm.com>, Vitaly Chikunov <vt@altlinux.org>, linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>

Here are two patches for ecdsa to avoid reporting nonsensical values
for enc/dec size and -- for P521 keys -- also the key size in response
to KEYCTL_PKEY_QUERY system calls.

Resending as requested by Herbert:

  https://lore.kernel.org/r/Z9fuCTAAOphOvEeH@gondor.apana.org.au/

Link to the original submission:

  https://lore.kernel.org/r/cover.1738521533.git.lukas@wunner.de/

Although these are technically fixes, the issues they address are
not critical, so I recommend not applying as fixes for v6.15,
but rather let the patches soak in linux-next for v6.16.


Lukas Wunner (2):
  crypto: ecdsa - Fix enc/dec size reported by KEYCTL_PKEY_QUERY
  crypto: ecdsa - Fix NIST P521 key size reported by KEYCTL_PKEY_QUERY

 crypto/asymmetric_keys/public_key.c | 13 +++++++++----
 crypto/ecdsa-p1363.c                |  6 ++++--
 crypto/ecdsa-x962.c                 |  5 +++--
 crypto/ecdsa.c                      |  2 +-
 crypto/ecrdsa.c                     |  2 +-
 crypto/rsassa-pkcs1.c               |  2 +-
 crypto/sig.c                        |  9 +++++++--
 include/crypto/sig.h                |  2 +-
 8 files changed, 27 insertions(+), 14 deletions(-)

-- 
2.43.0


