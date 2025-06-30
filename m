Return-Path: <keyrings+bounces-2872-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A09AAEDF08
	for <lists+keyrings@lfdr.de>; Mon, 30 Jun 2025 15:28:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17DDC161FE7
	for <lists+keyrings@lfdr.de>; Mon, 30 Jun 2025 13:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF0B928B7D0;
	Mon, 30 Jun 2025 13:27:39 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA6E28B3E8;
	Mon, 30 Jun 2025 13:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751290059; cv=none; b=dljtetFcyFCD4FSOA98ii6/Novu/Dfnb8rh5aCCxHU14H4PcYT3y/ES2oQ6081xfR3UZBMZ2/fTvDx3XZ7HXvvUgd32pJg2L1k6TjAHhfIvqV+1SksC+d8NYW1HOyc85k6/4DjTMfefS9NjugBKur13Zdy6rgtWqNS/Vw17WqRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751290059; c=relaxed/simple;
	bh=QWnJbWXPx0iuO3c6M0Re7/89e5BJvtjLRSQgMPj/IsM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dFz0Y1VCrddq5hFoVx8t2ypKuw+SYokxIIJM6jPt7P2JplGRjjnZppagBcK/fnkPv2slohY+epNQ9FUkNq+ZP9EJQxBqKHnvsvZU3RHIUIhvN+BeOWahQg2ZEOEqVJ02F60gM0FAp7ItjKMNkwqjEktYC14ei8E/euOkWy2+JFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4bW6L95Wqlzdb8p;
	Mon, 30 Jun 2025 21:23:29 +0800 (CST)
Received: from kwepemh100007.china.huawei.com (unknown [7.202.181.92])
	by mail.maildlp.com (Postfix) with ESMTPS id D451A140156;
	Mon, 30 Jun 2025 21:27:29 +0800 (CST)
Received: from huawei.com (10.67.174.33) by kwepemh100007.china.huawei.com
 (7.202.181.92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Jun
 2025 21:27:28 +0800
From: Gu Bowen <gubowen5@huawei.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, David Howells
	<dhowells@redhat.com>, David Woodhouse <dwmw2@infradead.org>, Lukas Wunner
	<lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>, "David S . Miller"
	<davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Eric Biggers <ebiggers@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>, Tianjia Zhang
	<tianjia.zhang@linux.alibaba.com>, Dan Carpenter <dan.carpenter@linaro.org>
CC: <keyrings@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, Lu Jialin <lujialin4@huawei.com>,
	GONG Ruiqi <gongruiqi1@huawei.com>, Gu Bowen <gubowen5@huawei.com>
Subject: [PATCH RFC 0/4] Reintroduce the sm2 algorithm
Date: Mon, 30 Jun 2025 21:39:30 +0800
Message-ID: <20250630133934.766646-1-gubowen5@huawei.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemh100007.china.huawei.com (7.202.181.92)

To reintroduce the sm2 algorithm, the patch set did the following:
 - Reintroduce the mpi library based on libgcrypt.
 - Reintroduce ec implementation to MPI library.
 - Rework sm2 algorithm.
 - Support verification of X.509 certificates.

Gu Bowen (4):
  Revert "Revert "lib/mpi: Extend the MPI library""
  Revert "Revert "lib/mpi: Introduce ec implementation to MPI library""
  crypto/sm2: Rework sm2 alg with sig_alg backend
  crypto/sm2: support SM2-with-SM3 verification of X.509 certificates

 certs/system_keyring.c                   |    8 +
 crypto/Kconfig                           |   18 +
 crypto/Makefile                          |    8 +
 crypto/asymmetric_keys/public_key.c      |    7 +
 crypto/asymmetric_keys/x509_public_key.c |   27 +-
 crypto/sm2.c                             |  492 +++++++
 crypto/sm2signature.asn1                 |    4 +
 crypto/testmgr.c                         |    6 +
 crypto/testmgr.h                         |   57 +
 include/crypto/sm2.h                     |   31 +
 include/keys/system_keyring.h            |   13 +
 include/linux/mpi.h                      |  170 +++
 lib/crypto/mpi/Makefile                  |    2 +
 lib/crypto/mpi/ec.c                      | 1507 ++++++++++++++++++++++
 lib/crypto/mpi/mpi-add.c                 |   50 +
 lib/crypto/mpi/mpi-bit.c                 |  143 ++
 lib/crypto/mpi/mpi-cmp.c                 |   46 +-
 lib/crypto/mpi/mpi-div.c                 |   29 +
 lib/crypto/mpi/mpi-internal.h            |   10 +
 lib/crypto/mpi/mpi-inv.c                 |  143 ++
 lib/crypto/mpi/mpi-mod.c                 |  144 +++
 lib/crypto/mpi/mpicoder.c                |  336 +++++
 lib/crypto/mpi/mpih-mul.c                |   25 +
 lib/crypto/mpi/mpiutil.c                 |  182 +++
 24 files changed, 3447 insertions(+), 11 deletions(-)
 create mode 100644 crypto/sm2.c
 create mode 100644 crypto/sm2signature.asn1
 create mode 100644 include/crypto/sm2.h
 create mode 100644 lib/crypto/mpi/ec.c
 create mode 100644 lib/crypto/mpi/mpi-inv.c

-- 
2.25.1


