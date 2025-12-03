Return-Path: <keyrings+bounces-3495-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D821FC9E0CE
	for <lists+keyrings@lfdr.de>; Wed, 03 Dec 2025 08:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BB173A7324
	for <lists+keyrings@lfdr.de>; Wed,  3 Dec 2025 07:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A608029B8EF;
	Wed,  3 Dec 2025 07:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwoXBkBa"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C1C29A9E9;
	Wed,  3 Dec 2025 07:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764747190; cv=none; b=HXTJyQ2Rhd8kiSo20qEVZNagjy7ebTiTUuVQ71fma5DZn9yjhYAP6DnL51/NlGtKVONPO9ovQH4jJDMgaln1VpzIntFuM5Z+s9esWqm3K10ileb+j5YaMaYm5fdhEwYquzD7Oiu1GorU4ztGRjU/bV1TID2alP7mB/HAhuevbD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764747190; c=relaxed/simple;
	bh=SADjuMha2+QSdh94MyX3hDpaB/xpeU0QPDXhfOttIjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qv41ntcX0eUmXnZ+LzSx41R9+Tw+KCbZZ3igGtueyh41EWhYTntROBhH6GuwHwCUhKRfL5jZlycfH4qq9vafXyoVbEjcabEw4XF6F+LGTYkV0X55Q6KG/o6mhM7yX5tznHRS0Nngh62+l+Xl8Jkm04mUxZqe7P01bKjXl8nYIy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwoXBkBa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED58C4CEFB;
	Wed,  3 Dec 2025 07:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764747190;
	bh=SADjuMha2+QSdh94MyX3hDpaB/xpeU0QPDXhfOttIjI=;
	h=From:To:Cc:Subject:Date:From;
	b=iwoXBkBaXV8s8cFIz1cv8nMHOd26SRLY8wt6GB5GJIUhdtDurmsxftzJ6Xgf2ASYw
	 xcoKFMwbrz/2scFqr1IbadtC8p75xgDGmlIbbKGGJLNRAAsQYUoTnrl9YwU0e8bYBF
	 oMJSHfMsAgMN8pANq7BUcER/o4czFEqT3EDtKlK+eOU7YFXKF8yFFXF7K2yIFmFqP3
	 zeZ+xboR2edHtL5DylNQ3XNnMcTnPIjDTwu9O7HOOZ0bRqmK7+SO9XIjPBfNFmqvK3
	 ILLUvm4B15EGIEuLwdFKjfDP3JkkuX3z/xRnIUwWIo6H7jujYuGAcpOT2ZeHt0HwkM
	 r4jPI0AxVxYaw==
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
Subject: [PATCH v3 0/2] lib/crypto: ML-DSA verification support
Date: Tue,  2 Dec 2025 23:28:42 -0800
Message-ID: <20251203072844.484893-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series can also be retrieved from:

    git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git mldsa-v3

This series adds support for verifying ML-DSA signatures to lib/crypto/.
Patch 1 is the ML-DSA implementation itself.  See that for full details.
Patch 2 adds the KUnit test suite.

The initial use case for this will be kernel module signature
verification.  For more details, see David Howells' patchset
https://lore.kernel.org/linux-crypto/20251120104439.2620205-1-dhowells@redhat.com/

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
 lib/crypto/tests/mldsa_kunit.c    |  437 +++++++
 8 files changed, 3058 insertions(+)
 create mode 100644 include/crypto/mldsa.h
 create mode 100644 lib/crypto/mldsa.c
 create mode 100644 lib/crypto/tests/mldsa-testvecs.h
 create mode 100644 lib/crypto/tests/mldsa_kunit.c


base-commit: 3f9f0252130e7dd60d41be0802bf58f6471c691d
-- 
2.52.0


