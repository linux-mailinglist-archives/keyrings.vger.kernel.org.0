Return-Path: <keyrings+bounces-3356-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD67C64BCB
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 15:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B9294E02E9
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 14:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79732337BBF;
	Mon, 17 Nov 2025 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Po+IyWM8"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6558C3376A2
	for <keyrings@vger.kernel.org>; Mon, 17 Nov 2025 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763391389; cv=none; b=FBTWZfhd0HbCufVzgJuAdZpMpBjpKup8hFaxilhETEpdTdzymRnRtggENRNyH3/GEqu2KneaBj0FOB/BNAXHU2akV8hr3x2/i7B7FzavR3YRUZTEHdWe4Jxxjm8AzXsHozXcgMAlfNiSnI2poOmS/1irOSQE11TMPx+WNdt0vX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763391389; c=relaxed/simple;
	bh=IaVoMWXBWx0iN+jwWz/bDtekEZLkdrt+aTil3/se1q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PWC4Edml4HSO6lSyhgJD8WG2RzIvmJdPH+Ddm9wMHuiaSMxwlbKta38UQaf48hQUwFdFyp6Nz03KheiqFGyTok9QfWzKU8rVSAqoecNhTLb05/qZssKFh9yBXEhoCbdmgr1/4Oinuxxjfx8c47vI6Tr0ObFSDtCMN5I24s+Wpfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Po+IyWM8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763391386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rq6kgQQJDMkSs+DOgYrF2o++rTLEO5wLK+oFcls39m0=;
	b=Po+IyWM88PlifFUEwCtpV/dIMCWZk0p8Oq516RNv88S4XTQIjyd9kuw5G7/iGTO2ygPq2c
	BoNhLKk+hjZqs9kqD+PvGbsqD9iIjKD0Ap3tYKgBevb3h/HyjdtOBGluU3+p5EZ6F0GVbL
	vISjuOVJ0aJKJA9xU+1Y/raAYkSDbWM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-461-zV-4IoaUM8GOvqCJZ0ZLiQ-1; Mon,
 17 Nov 2025 09:56:19 -0500
X-MC-Unique: zV-4IoaUM8GOvqCJZ0ZLiQ-1
X-Mimecast-MFC-AGG-ID: zV-4IoaUM8GOvqCJZ0ZLiQ_1763391375
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 229341800561;
	Mon, 17 Nov 2025 14:56:15 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7899B3003754;
	Mon, 17 Nov 2025 14:56:10 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David Howells <dhowells@redhat.com>,
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
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 0/9] lib/crypto: Add ML-DSA signing
Date: Mon, 17 Nov 2025 14:55:49 +0000
Message-ID: <20251117145606.2155773-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi Herbert, Eric, et al.,

Building on the SHA-3 lib-crypto patches now in Eric's tree, here's a set of
patches does the following:

 (1) Add SHAKE-256 crypto_sig support, generating 32-byte fixed output.  The
     XOF features aren't available through this.  SHAKE-128 crypto_sig support
     isn't required for ML-DSA, so I haven't implemented that at this time.

 (2) Add ML-DSA signature verification code, extracted from Stephan
     Mueller's Leancrypto project.  The primary interface is intended to be
     through crypto_sig.

 (3) Add a simplified ML-DSA API for direct lib-crypto access.  Possibly
     this should be conditional as the main access (from PKCS#7/X.509) is
     going to be through crypto_sig.

 (4) Add a kunit test in three instalments (due to size) to add some
     testing for the three different levels of ML-DSA (44, 65 and 87).

 (5) Modify PKCS#7 support to allow kernel module signatures to carry
     authenticatedAttributes as OpenSSL refuses to let them be opted out of
     for ML-DSA (CMS_NOATTR).  This adds an extra digest calculation to the
     process.

 (6) Modify PKCS#7 to pass the authenticatedAttributes directly to the
     ML-DSA algorithm rather than passing over a digest as is done with RSA
     as ML-DSA wants to do its own hashing and will add other stuff into
     the hash.  We could use hashML-DSA or an external mu instead, but they
     aren't standardised for CMS yet.

 (7) Add support to the PKCS#7 and X.509 parsers for ML-DSA.

 (8) Modify sign-file to handle OpenSSL not permitting CMS_NOATTR with
     ML-DSA.

 (9) Allow SHA-3 algorithms, including SHAKE256, to be used for the message
     digest and add ML-DSA to the choice of algorithm with which to sign.

With that, ML-DSA signing appears to work.

This is based on Eric's libcrypto-next branch.

The patches can also be found here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-pqc

David

Changes
=======
ver #9)
 - ML-DSA changes:
   - Separate output into four modules (1 common, 3 strength-specific).
     - Solves Kconfig issue with needing to select at least one strength.
   - Separate the strength-specific crypto-lib APIs.
     - This is now generated by preprocessor-templating.
   - Remove the multiplexor code.
   - Multiplex the crypto-lib APIs by C type.
 - Fix the PKCS#7/X.509 code to have the correct algo names.

ver #8)
 - Moved the ML-DSA code to lib/crypto/mldsa/.
 - Renamed some bits from ml-dsa to mldsa.
 - Created a simplified API and placed that in include/crypto/mldsa.h.
 - Made the testing code use the simplified API.
 - Fixed a warning about implicitly casting between uint16_t and __le16.

ver #7)
 - Rebased on Eric's tree as that now contains all the necessary SHA-3
   infrastructure and drop the SHA-3 patches from here.
 - Added a minimal patch to provide shake256 support for crypto_sig.
 - Got rid of the memory allocation wrappers.
 - Removed the ML-DSA keypair generation code and the signing code, leaving
   only the signature verification code.
 - Removed the secret key handling code.
 - Removed the secret keys from the kunit tests and the signing testing.
 - Removed some unused bits from the ML-DSA code.
 - Downgraded the kdoc comments to ordinary comments, but keep the markup
   for easier comparison to Leancrypto.

ver #6)
 - Added a patch to make the jitterentropy RNG use lib/sha3.
 - Added back the crypto/sha3_generic changes.
 - Added ML-DSA implementation (still needs more cleanup).
 - Added kunit test for ML-DSA.
 - Modified PKCS#7 to accommodate ML-DSA.
 - Modified PKCS#7 and X.509 to allow ML-DSA to be specified and used.
 - Modified sign-file to not use CMS_NOATTR with ML-DSA.
 - Allowed SHA3 and SHAKE* algorithms for module signing default.
 - Allowed ML-DSA-{44,65,87} to be selected as the module signing default.

ver #5)
 - Fix gen-hash-testvecs.py to correctly handle algo names that contain a
   dash.
 - Fix gen-hash-testvecs.py to not generate HMAC for SHA3-* or SHAKE* as
   these don't currently have HMAC variants implemented.
 - Fix algo names to be correct.
 - Fix kunit module description as it now tests all SHA3 variants.

ver #4)
 - Fix a couple of arm64 build problems.
 - Doc fixes:
   - Fix the description of the algorithm to be closer to the NIST spec's
     terminology.
   - Don't talk of finialising the context for XOFs.
   - Don't say "Return: None".
   - Declare the "Context" to be "Any context" and make no mention of the
     fact that it might use the FPU.
   - Change "initialise" to "initialize".
   - Don't warn that the context is relatively large for stack use.
 - Use size_t for size parameters/variables.
 - Make the module_exit unconditional.
 - Dropped the crypto/ dir-affecting patches for the moment.

ver #3)
 - Renamed conflicting arm64 functions.
 - Made a separate wrapper API for each algorithm in the family.
 - Removed sha3_init(), sha3_reinit() and sha3_final().
 - Removed sha3_ctx::digest_size.
 - Renamed sha3_ctx::partial to sha3_ctx::absorb_offset.
 - Refer to the output of SHAKE* as "output" not "digest".
 - Moved the Iota transform into the one-round function.
 - Made sha3_update() warn if called after sha3_squeeze().
 - Simplified the module-load test to not do update after squeeze.
 - Added Return: and Context: kdoc statements and expanded the kdoc
   headers.
 - Added an API description document.
 - Overhauled the kunit tests.
   - Only have one kunit test.
   - Only call the general hash tester on one algo.
   - Add separate simple cursory checks for the other algos.
   - Add resqueezing tests.
   - Add some NIST example tests.
 - Changed crypto/sha3_generic to use this
 - Added SHAKE128/256 to crypto/sha3_generic and crypto/testmgr
 - Folded struct sha3_state into struct sha3_ctx.

ver #2)
  - Simplify the endianness handling.
  - Rename sha3_final() to sha3_squeeze() and don't clear the context at the
    end as it's permitted to continue calling sha3_final() to extract
    continuations of the digest (needed by ML-DSA).
  - Don't reapply the end marker to the hash state in continuation
    sha3_squeeze() unless sha3_update() gets called again (needed by
    ML-DSA).
  - Give sha3_squeeze() the amount of digest to produce as a parameter
    rather than using ctx->digest_size and don't return the amount digested.
  - Reimplement sha3_final() as a wrapper around sha3_squeeze() that
    extracts ctx->digest_size amount of digest and then zeroes out the
    context.  The latter is necessary to avoid upsetting
    hash-test-template.h.
  - Provide a sha3_reinit() function to clear the state, but to leave the
    parameters that indicate the hash properties unaffected, allowing for
    reuse.
  - Provide a sha3_set_digestsize() function to change the size of the
    digest to be extracted by sha3_final().  sha3_squeeze() takes a
    parameter for this instead.
  - Don't pass the digest size as a parameter to shake128/256_init() but
    rather default to 128/256 bits as per the function name.
  - Provide a sha3_clear() function to zero out the context.

David Howells (9):
  crypto: Add support for shake256 through crypto_shash
  crypto: Add ML-DSA/Dilithium verify support
  mldsa: Add a simpler API
  crypto: Add ML-DSA-44 pure rejection test vectors as a kunit test
  crypto: Add ML-DSA-65 pure rejection test vectors as a kunit test
  crypto: Add ML-DSA-87 pure rejection test vectors as a kunit test
  pkcs7: Allow the signing algo to calculate the digest itself
  pkcs7, x509: Add ML-DSA support
  modsign: Enable ML-DSA module signing

 Documentation/admin-guide/module-signing.rst  |   15 +-
 Documentation/crypto/index.rst                |    1 +
 Documentation/crypto/mldsa.rst                |  143 +
 certs/Kconfig                                 |   27 +
 certs/Makefile                                |    3 +
 crypto/asymmetric_keys/pkcs7_parser.c         |   19 +-
 crypto/asymmetric_keys/pkcs7_verify.c         |   52 +-
 crypto/asymmetric_keys/public_key.c           |    7 +
 crypto/asymmetric_keys/x509_cert_parser.c     |   24 +
 crypto/sha3.c                                 |   42 +
 include/crypto/mldsa.h                        |   50 +
 include/crypto/public_key.h                   |    1 +
 include/linux/oid_registry.h                  |    5 +
 kernel/module/Kconfig                         |    5 +
 lib/crypto/Kconfig                            |    1 +
 lib/crypto/Makefile                           |    2 +
 lib/crypto/mldsa/Kconfig                      |   29 +
 lib/crypto/mldsa/Makefile                     |   20 +
 lib/crypto/mldsa/crypto_mldsa_44.c            |  166 +
 lib/crypto/mldsa/crypto_mldsa_65.c            |  166 +
 lib/crypto/mldsa/crypto_mldsa_87.c            |  166 +
 lib/crypto/mldsa/dilithium.h                  |  304 +
 lib/crypto/mldsa/dilithium_44.c               |   34 +
 lib/crypto/mldsa/dilithium_44.h               |  291 +
 lib/crypto/mldsa/dilithium_65.c               |   34 +
 lib/crypto/mldsa/dilithium_65.h               |  291 +
 lib/crypto/mldsa/dilithium_87.c               |   34 +
 lib/crypto/mldsa/dilithium_87.h               |  291 +
 lib/crypto/mldsa/dilithium_common.c           |  117 +
 lib/crypto/mldsa/dilithium_debug.h            |   49 +
 lib/crypto/mldsa/dilithium_ntt.c              |   89 +
 lib/crypto/mldsa/dilithium_ntt.h              |   35 +
 lib/crypto/mldsa/dilithium_pack.h             |  119 +
 lib/crypto/mldsa/dilithium_poly.c             |  377 +
 lib/crypto/mldsa/dilithium_poly.h             |  181 +
 lib/crypto/mldsa/dilithium_poly_c.h           |  141 +
 lib/crypto/mldsa/dilithium_poly_common.h      |   35 +
 lib/crypto/mldsa/dilithium_polyvec.h          |  343 +
 lib/crypto/mldsa/dilithium_polyvec_c.h        |   81 +
 lib/crypto/mldsa/dilithium_reduce.h           |   85 +
 lib/crypto/mldsa/dilithium_rounding.c         |  128 +
 lib/crypto/mldsa/dilithium_service_helpers.h  |   99 +
 lib/crypto/mldsa/dilithium_signature_c.c      |  279 +
 lib/crypto/mldsa/dilithium_signature_c.h      |   37 +
 lib/crypto/mldsa/dilithium_signature_impl.h   |  370 +
 lib/crypto/mldsa/dilithium_type.h             |  121 +
 lib/crypto/mldsa/dilithium_zetas.c            |   68 +
 lib/crypto/mldsa/mldsa_api.c                  |  168 +
 .../mldsa/signature_domain_separation.c       |  204 +
 .../mldsa/signature_domain_separation.h       |   30 +
 lib/crypto/tests/Kconfig                      |   10 +
 lib/crypto/tests/Makefile                     |    1 +
 lib/crypto/tests/mldsa_kunit.c                |  105 +
 .../tests/mldsa_pure_rejection_vectors_44.h   |  489 ++
 .../tests/mldsa_pure_rejection_vectors_65.h   | 4741 ++++++++++++
 .../tests/mldsa_pure_rejection_vectors_87.h   | 6456 +++++++++++++++++
 scripts/sign-file.c                           |   26 +-
 57 files changed, 17171 insertions(+), 36 deletions(-)
 create mode 100644 Documentation/crypto/mldsa.rst
 create mode 100644 include/crypto/mldsa.h
 create mode 100644 lib/crypto/mldsa/Kconfig
 create mode 100644 lib/crypto/mldsa/Makefile
 create mode 100644 lib/crypto/mldsa/crypto_mldsa_44.c
 create mode 100644 lib/crypto/mldsa/crypto_mldsa_65.c
 create mode 100644 lib/crypto/mldsa/crypto_mldsa_87.c
 create mode 100644 lib/crypto/mldsa/dilithium.h
 create mode 100644 lib/crypto/mldsa/dilithium_44.c
 create mode 100644 lib/crypto/mldsa/dilithium_44.h
 create mode 100644 lib/crypto/mldsa/dilithium_65.c
 create mode 100644 lib/crypto/mldsa/dilithium_65.h
 create mode 100644 lib/crypto/mldsa/dilithium_87.c
 create mode 100644 lib/crypto/mldsa/dilithium_87.h
 create mode 100644 lib/crypto/mldsa/dilithium_common.c
 create mode 100644 lib/crypto/mldsa/dilithium_debug.h
 create mode 100644 lib/crypto/mldsa/dilithium_ntt.c
 create mode 100644 lib/crypto/mldsa/dilithium_ntt.h
 create mode 100644 lib/crypto/mldsa/dilithium_pack.h
 create mode 100644 lib/crypto/mldsa/dilithium_poly.c
 create mode 100644 lib/crypto/mldsa/dilithium_poly.h
 create mode 100644 lib/crypto/mldsa/dilithium_poly_c.h
 create mode 100644 lib/crypto/mldsa/dilithium_poly_common.h
 create mode 100644 lib/crypto/mldsa/dilithium_polyvec.h
 create mode 100644 lib/crypto/mldsa/dilithium_polyvec_c.h
 create mode 100644 lib/crypto/mldsa/dilithium_reduce.h
 create mode 100644 lib/crypto/mldsa/dilithium_rounding.c
 create mode 100644 lib/crypto/mldsa/dilithium_service_helpers.h
 create mode 100644 lib/crypto/mldsa/dilithium_signature_c.c
 create mode 100644 lib/crypto/mldsa/dilithium_signature_c.h
 create mode 100644 lib/crypto/mldsa/dilithium_signature_impl.h
 create mode 100644 lib/crypto/mldsa/dilithium_type.h
 create mode 100644 lib/crypto/mldsa/dilithium_zetas.c
 create mode 100644 lib/crypto/mldsa/mldsa_api.c
 create mode 100644 lib/crypto/mldsa/signature_domain_separation.c
 create mode 100644 lib/crypto/mldsa/signature_domain_separation.h
 create mode 100644 lib/crypto/tests/mldsa_kunit.c
 create mode 100644 lib/crypto/tests/mldsa_pure_rejection_vectors_44.h
 create mode 100644 lib/crypto/tests/mldsa_pure_rejection_vectors_65.h
 create mode 100644 lib/crypto/tests/mldsa_pure_rejection_vectors_87.h


