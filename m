Return-Path: <keyrings+bounces-3441-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8767EC8BDFE
	for <lists+keyrings@lfdr.de>; Wed, 26 Nov 2025 21:35:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E7A3A358FAB
	for <lists+keyrings@lfdr.de>; Wed, 26 Nov 2025 20:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 266B134026B;
	Wed, 26 Nov 2025 20:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8mUqEse"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F2A16DEB0;
	Wed, 26 Nov 2025 20:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764189330; cv=none; b=n9mCM1dD5+TNV+FoRQFfQGgeZzIlYcPY45LLVVkcKjfQ+G3Y56EXzmxFYE71qtbWLMm0ItVCVrkBnIA7VPrIsErnZ0JVYYkjxl2mnmBYHwkCW3DH18IteOqTtcc77EZHQUR0jKrvA/MQCIlvFA43okneDhzLInRz2cZVQ3QGP3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764189330; c=relaxed/simple;
	bh=XJXE66Wg9ac+X/iLhsiFW1rK34eqy0iauMDUWn+fmr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JfOfKmIe86qeBel9X9yPRrOVAB0ATCf75yYI9hi0H+eZQPNudypC5qCDFg7QasA4FadKWEd5P0lTRD+v8SBOZWabbHqrfQ3o0h8oTnfLXjlTgNrrPgdmuQqTrdET6lb6eQ9pEz3O3pPzG0GMkpk+xcGSF6Ouq3mHJBotIurgkPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8mUqEse; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5362C113D0;
	Wed, 26 Nov 2025 20:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764189329;
	bh=XJXE66Wg9ac+X/iLhsiFW1rK34eqy0iauMDUWn+fmr8=;
	h=From:To:Cc:Subject:Date:From;
	b=b8mUqEse8DnSdJrOMofRe119XsNSgQIUnpxUvNUAOTUFo6y934EIL5ZRqpaMdvn8/
	 dfcMdLewSY+8JQcFKMDpURiI4V2vSYM4rr4kYcyeO3bCOA/ki//hp94jauZ0kuY8uE
	 i7ugGJENvuIdrMnTFAiLK5HpFzykIcdIVQAipJKKEpJQ/nhJ+JSRYDjmSCgQNOA4sI
	 9fHiZxZPzfW742asHo2qKcT+yRa7QILKQIVy777Ec5K1ibXS0T0iphaecP9IrjURsp
	 x9UVujD7c3FOGSDRtHBoSEW0w5KHGHl/ZtzVq06E25Wwkj31PpAWsiILfmdtWd5Odu
	 zvGLNlgFHH0Hw==
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
Subject: [PATCH v2 0/2] lib/crypto: ML-DSA verification support
Date: Wed, 26 Nov 2025 12:35:15 -0800
Message-ID: <20251126203517.167040-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is targeting libcrypto-next.  It can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git mldsa-v2

This series adds support for verifying ML-DSA signatures to lib/crypto/.
Patch 1 is the ML-DSA implementation itself.  See that for full details.
Patch 2 adds the KUnit test suite.

The initial use case for this will be kernel module signature
verification.  For more details, see David Howells' patchset
https://lore.kernel.org/linux-crypto/20251120104439.2620205-1-dhowells@redhat.com/

Changed in v2:
- Reworked the KUnit test suite
- Improved commit messages and comments
- Added missing MODULE_DESCRIPTION() and MODULE_LICENSE()
- Made the return values of mldsa_verify() differentiate between an
  input being malformed and the "real" signature check failing
- Refactored w1 encoding into a helper function
- Used kfree() instead of kfree_sensitive()
- Avoided unusal C syntax by accessing the hint vector via 'u8 *'
- Reworked use_hint() to be better optimized and documented

Eric Biggers (2):
  lib/crypto: Add ML-DSA verification support
  lib/crypto: tests: Add KUnit tests for ML-DSA verification

 include/crypto/mldsa.h            |   53 +
 lib/crypto/Kconfig                |    7 +
 lib/crypto/Makefile               |    5 +
 lib/crypto/mldsa.c                |  651 ++++++++++
 lib/crypto/tests/Kconfig          |    9 +
 lib/crypto/tests/Makefile         |    1 +
 lib/crypto/tests/mldsa-testvecs.h | 1877 +++++++++++++++++++++++++++++
 lib/crypto/tests/mldsa_kunit.c    |  381 ++++++
 8 files changed, 2984 insertions(+)
 create mode 100644 include/crypto/mldsa.h
 create mode 100644 lib/crypto/mldsa.c
 create mode 100644 lib/crypto/tests/mldsa-testvecs.h
 create mode 100644 lib/crypto/tests/mldsa_kunit.c


base-commit: c0127f3ad65e8b21752f7b4d7dbe7e4ab5b5c62d
-- 
2.52.0


