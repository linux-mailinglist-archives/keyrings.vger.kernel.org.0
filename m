Return-Path: <keyrings+bounces-3387-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E45C5C71903
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 01:40:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AD82334C706
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 00:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ED341CEACB;
	Thu, 20 Nov 2025 00:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MjJa6twn"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCF8322A;
	Thu, 20 Nov 2025 00:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763599164; cv=none; b=uQyLdA436v3Sx8LD7ZqOvEcadqDIhxpFET8owT5gyQfdKfGuZIzebn2ReL4O9WpJ80EKY7ZxrnNNaWwX2ZRLhyZcIveJQBa+uCfE32x03U3dKbnJJ2K5kjkhXt8KXJtn6WwD52ade9Gz6WXerbSWErdnKLJuzOhENvs5XGwLtJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763599164; c=relaxed/simple;
	bh=lssvfUxVbhw3PvKV3aW2w1m7cwIJv0Szyc9PyoP8IM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IjY4ot1dicJyWTb8TOnBYJ0W6UwB3TFVsNhHT41tnttQTMZlEGfDcLWFFw9lg4xoEGqY6782kDBeYrx06hYeX2am1Bgp/XawBgG69cYB43Q8GizqW+XVC0lDtgVC4FqWdv8SZ0s5EsYFiWElo1ir44s8kgEomlVJuF75zS73sww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MjJa6twn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E456C4CEF5;
	Thu, 20 Nov 2025 00:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763599163;
	bh=lssvfUxVbhw3PvKV3aW2w1m7cwIJv0Szyc9PyoP8IM4=;
	h=From:To:Cc:Subject:Date:From;
	b=MjJa6twn93daMmVBQKuDCLuz3kNgbg/1xwZpwo0ikcT8jtMlLpMO/xMd80eyGJrKH
	 GPdD1uFMrmF0sUsYiVSqHeVFxF+qlIFWNgG1J/j29CjDDfjINPFascN3U7HaOMIT68
	 2U41aVCMd8IfJxnt7IuUiqpdITDdu+kP0VmDnHYZraRpVyJ7Ikd0Zx5Bxy4maeg+RQ
	 qe6FQu4JUxeSlYzHR1fWo392vMez5mcausrFADWtsvjFNSfe9GPikGHRH+XcE+dxXL
	 TIM+ri1dYilGhW+SMh0zQQvOLYSV5/Fs3et0g1klzGr2OcsjT12lz9CIuzCHMYlhBM
	 V2i1fWao4sKcQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	David Howells <dhowells@redhat.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] lib/crypto: ML-DSA verification support
Date: Wed, 19 Nov 2025 16:36:49 -0800
Message-ID: <20251120003653.335863-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is targeting libcrypto-next.  It can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git mldsa-v1

This series adds support for verifying ML-DSA signatures to lib/crypto/.
Patch 1 is the ML-DSA implementation itself.  See that for full details.

Patches 2-4 are the KUnit tests, which still need some more work.

Sending this out now as requested by David.  I'd like some more time to
work on writing proper tests and making sure that everything is correct.

This is just the lib/crypto/ part.  On top of this, we'll want to make
public_key_verify_signature() call mldsa_verify() to support ML-DSA.
(No need for the redundant crypto_sig abstraction layer.)

David Howells (1):
  lib/crypto: tests: Add KUnit tests for ML-DSA

Eric Biggers (3):
  lib/crypto: Add ML-DSA verification support
  lib/crypto: tests: Add ML-DSA-65 test cases
  lib/crypto: tests: Add ML-DSA-87 test cases

 include/crypto/mldsa.h                        |   51 +
 lib/crypto/Kconfig                            |    7 +
 lib/crypto/Makefile                           |    5 +
 lib/crypto/mldsa.c                            |  566 ++
 lib/crypto/tests/Kconfig                      |   10 +
 lib/crypto/tests/Makefile                     |    1 +
 lib/crypto/tests/mldsa_kunit.c                |  124 +
 .../tests/mldsa_pure_rejection_vectors_44.h   |  489 ++
 .../tests/mldsa_pure_rejection_vectors_65.h   | 4702 ++++++++++++
 .../tests/mldsa_pure_rejection_vectors_87.h   | 6390 +++++++++++++++++
 10 files changed, 12345 insertions(+)
 create mode 100644 include/crypto/mldsa.h
 create mode 100644 lib/crypto/mldsa.c
 create mode 100644 lib/crypto/tests/mldsa_kunit.c
 create mode 100644 lib/crypto/tests/mldsa_pure_rejection_vectors_44.h
 create mode 100644 lib/crypto/tests/mldsa_pure_rejection_vectors_65.h
 create mode 100644 lib/crypto/tests/mldsa_pure_rejection_vectors_87.h


base-commit: 10a1140107e0b98bd67d37ae7af72989dd7df00b
-- 
2.51.2


