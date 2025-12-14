Return-Path: <keyrings+bounces-3612-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F4DCBBE8D
	for <lists+keyrings@lfdr.de>; Sun, 14 Dec 2025 19:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EEBEA3003F80
	for <lists+keyrings@lfdr.de>; Sun, 14 Dec 2025 18:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1308236437;
	Sun, 14 Dec 2025 18:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBqUcf2E"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D89E1C3C18;
	Sun, 14 Dec 2025 18:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765736261; cv=none; b=hSrn6aYeK4x4Y/P1E6MjZ7G0U5lZux+PvHYp3ho6KuvToPLSzHhebdtosg7PBLu/zDU8rHVfltVgoRML1G8U/D1f0h9P7KGwAqiURo/F57Xjf4R2mL1jPsdsPhoUaTcE8Yi3n92Rfj0vdwJezSIAgmgOSpS+XranNc2MlTvVhWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765736261; c=relaxed/simple;
	bh=eDNg7zn+1BGklyVXvNYnYEFYO1WB7bV7JoPmAT68Cr4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mEfL29gIMiY2p82HjhYQLkAVK8vFb34wQgABk+qfLO9RIxJqnNzQNisa2wMX+ARbVi876xUJ1efBCXKidKduecEzTcYCPdP+231VrV5+NIwLyg2rB7Mmxt/LPIVeAuTrPxJRj+LlLL7WHm/P2W5P8TjSp91GXmaTJHAQBLxXC0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBqUcf2E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6736C4CEF1;
	Sun, 14 Dec 2025 18:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765736261;
	bh=eDNg7zn+1BGklyVXvNYnYEFYO1WB7bV7JoPmAT68Cr4=;
	h=From:To:Cc:Subject:Date:From;
	b=cBqUcf2ElXwfMswJdHM+8JiX0GCJazjz2gxO9K9UHPK8yECKKeFuxIqcxlxCEIXPR
	 rlXGdKesYLt44Rc9z7kYkaH9Td7XUp4VX/avM0epAc65eoa5oBdUDcPgUGDIxUQEh0
	 5RMfj9j1jFT16EBghMZzoYs6KP3tnb3XqrWLLqC8J7tyaaEl0DViat2+zZBN2Joz/4
	 ykZJcQgBt8todzi+JwDnYfYytbo8KrIlx3G7zzqib9NsN7cIX9SKkFqlTtPple1mXI
	 wg5LDzoTgbzUyn6ycNlr70Z7Ng8qhAZrp+Rk9XZmaiEDvw6w9gDgZ43FQkX74c1lYo
	 hl7Z5sfcrA18w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
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
Subject: [PATCH v4 0/2] lib/crypto: ML-DSA verification support
Date: Sun, 14 Dec 2025 10:17:10 -0800
Message-ID: <20251214181712.29132-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git mldsa-v4

This series adds support for verifying ML-DSA signatures to lib/crypto/.
Patch 1 is the ML-DSA implementation itself.  See that for full details.
Patch 2 adds the KUnit test suite.

The initial use case for this will be kernel module signature
verification.  For more details, see David Howells' patchset
https://lore.kernel.org/linux-crypto/20251120104439.2620205-1-dhowells@redhat.com/

Note: I'm planning to apply this to libcrypto-next for 6.20.

Changed in v4:
- Added missing MODULE_IMPORT_NS() to fix build error when building the
  KUnit test suite as a loadable module
- Added David's Reviewed-by and Tested-by
- Clarified a comment slightly
- Rebased onto v6.19-rc1

Changed in v3:
- Moved SHAKE128 block buffer off the stack
- Reworked use_hint() again, simplifying it further
- Added unit test for use_hint()
- Moved some of the reduction logic into invntt_and_mul_2_32() and
  simplified it slightly
- Updated Zq_mult() to not rely on signed integer overflow having
  defined behavior, though this is unnecessary in the kernel
- Formatted the documented return values into a list
- Other minor tweaks

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

 include/crypto/mldsa.h            |   60 +
 lib/crypto/Kconfig                |    7 +
 lib/crypto/Makefile               |    5 +
 lib/crypto/mldsa.c                |  652 ++++++++++
 lib/crypto/tests/Kconfig          |    9 +
 lib/crypto/tests/Makefile         |    1 +
 lib/crypto/tests/mldsa-testvecs.h | 1887 +++++++++++++++++++++++++++++
 lib/crypto/tests/mldsa_kunit.c    |  438 +++++++
 8 files changed, 3059 insertions(+)
 create mode 100644 include/crypto/mldsa.h
 create mode 100644 lib/crypto/mldsa.c
 create mode 100644 lib/crypto/tests/mldsa-testvecs.h
 create mode 100644 lib/crypto/tests/mldsa_kunit.c


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.52.0


