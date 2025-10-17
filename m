Return-Path: <keyrings+bounces-3226-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F84CBE9413
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 16:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 23A8B35AA0C
	for <lists+keyrings@lfdr.de>; Fri, 17 Oct 2025 14:43:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DF1F32E14B;
	Fri, 17 Oct 2025 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XhRo6Ed5"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4778A32E149
	for <keyrings@vger.kernel.org>; Fri, 17 Oct 2025 14:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712209; cv=none; b=rVBZWQZpTkuvwzWZCRaugeezdLo2+4kGYYcVf90cZcRi4Rux951GmrnKRxJWLiqM0FQCYP3sU2UFm4EUP+s06AcF+CO6CbupsXVtYK/rbQAF7CmlcyZR2QlK/UW9XkofSMMMOTIoeCd1zuRt3CKPiq3obAVDJYosjLf+HZMtC8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712209; c=relaxed/simple;
	bh=f6nD4djMYQgfQ/PcFUuYlUpUunQlgLDJUAOmA87ZgR0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nP00o3sd7BDOyUCdHMJkDSzqEBP1jQh82KoyuFN1Xtln4AMHxmQEGaNyj/bcaUeyHcLGs3AfYEXOOzbLxnaGitovjcIbT+ap15IypC3mvzjnftttjfaYjujrCZ0s68tgtYwpwIZPa4Ra9aPPW8KIEziXvQdKS0yCWNttti2mMK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XhRo6Ed5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760712206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zXwTMHKkWFXxpJLBCwwAHLQwSYGklsh5d/qyVpVH2d8=;
	b=XhRo6Ed5lX/y50WGfe3PPOkGjvKSLSOTVe/lk/CK7roykkhfTaBs5dVLn/jOWatTigzlya
	fU4lG5yjuzWiOIR+UL+TOSNbJUpzWXlxfNoFwObhGRCuoQUaQxQmE4qAatM850YIOaiAZA
	q0DxUMMggOe3OIC+UyzX5IxOnEfrnjE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-119-ferk57nzMCWTLEQ7yG1yNg-1; Fri,
 17 Oct 2025 10:43:22 -0400
X-MC-Unique: ferk57nzMCWTLEQ7yG1yNg-1
X-Mimecast-MFC-AGG-ID: ferk57nzMCWTLEQ7yG1yNg_1760712200
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9184F1954197;
	Fri, 17 Oct 2025 14:43:19 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.57])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 127CC180044F;
	Fri, 17 Oct 2025 14:43:14 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 00/17] lib/crypto: Move SHA3 to lib/crypto, add SHAKE* and add ML-DSA signing
Date: Fri, 17 Oct 2025 15:42:44 +0100
Message-ID: <20251017144311.817771-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hi Eric, Herbert, et al.,

Here's a set of patches does the following:

Firstly, SHA-3 is implemented in lib/crypto and SHAKE* support is added:

 (1) Renames s390 and arm64 sha3_* functions to avoid name collisions.

 (2) Copies the core of SHA3 support from crypto/ to lib/crypto/.

 (3) Simplifies the internal code to maintain the buffer in little endian
     form, thereby simplifying the update and extraction code which don't
     then need to worry about this.  Instead, the state buffer is
     byteswapped before and after.

 (4) Moves the Iota transform into the function with the rest of the
     transforms.

 (5) Adds SHAKE128 and SHAKE256 support (needed for ML-DSA).

 (6) Adds a kunit test for SHA3 in lib/crypto/tests/.

 (7) Adds API documentation for SHA3.

Note that only the generic code is moved across; the asm-optimised stuff is
not touched as I'm not familiar with that.

Secondly, SHA-3 crypto/ support is added, though this turns out not to be
necessary for ML-DSA:

 (8) Make the jitterentropy random number generator use lib/crypto sha-3.
     I can't get it to work with crypto/sha3_generic when that is modified
     to use lib/crypto.  It looks like there's some race that prevents the
     kernel from booting, but I can't tell what and it's really hard to
     debug.  However, it works fine with lib/crypto/sha3 directly.

 (9) Make crypto/sha3_generic use lib/crypto/sha3.

(10) Add SHAKE-128 and SHAKE-256 crypto_sig support, generating 16-byte and
     32-byte fixed output respectively.  The XOF features aren't available
     through this.

Thirdly, add ML-DSA support and allow module signing to use it.  This needs
some more code cleanup, but it does work.  OpenSSL doesn't support
CMS_NOATTR with ML-DSA, unfortunately, so that has to be turned off for
ML-DSA.

(11) Add ML-DSA signing and signature verification code, extracted from
     Stephan Mueller's Leancrypto project.  This needs more code cleanup,
     but I think it's worth posting it now.  I also suspect I should remove
     the in-kernel signature generation side of things and only keep the
     verification side.  It is accessed through crypto_sig.

(12) Add ML-DSA keypair generation code.  I don't think we want this.

(13) Add a kunit test in three installments (due to size) to add some
     testing for the three different levels of ML-DSA (44, 65 and 87).

(14) Modify PKCS#7 support to allow kernel module signatures to carry
     authenticatedAttributes as OpenSSL refuses to let them be opted out of
     for ML-DSA (CMS_NOATTR).  This adds an extra digest calculation to the
     process.

(15) Modify PKCS#7 to pass the authenticatedAttributes directly to the
     ML-DSA algorithm rather than passing over a digest as is done with RSA
     as ML-DSA wants to do its own hashing and will add other stuff into
     the hash.  We could use hashML-DSA or an external mu instead, but they
     aren't standardised for CMS yet.

(16) Add support to the PKCS#7 and X.509 parsers for ML-DSA.

(17) Modify sign-file to handle OpenSSL not permitting CMS_NOATTR with
     ML-DSA.

(18) Allow SHA-3 algorithms, including SHAKE256, to be used for the message
     digest and add ML-DSA to the choice of algorithm with which to sign.

With that, ML-DSA signing appears to work.

This is based on Eric's libcrypto-next branch.

The patches can also be found here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-pqc

David

Changes
=======
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

David Howells (17):
  s390/sha3: Rename conflicting functions
  arm64/sha3: Rename conflicting functions
  lib/crypto: Add SHA3-224, SHA3-256, SHA3-384, SHA3-512, SHAKE128,
    SHAKE256
  lib/crypto: Move the SHA3 Iota transform into the single round
    function
  lib/crypto: Add SHA3 kunit tests
  crypto/jitterentropy: Use lib/crypto/sha3
  crypto/sha3: Use lib/crypto/sha3
  crypto/sha3: Add SHAKE128/256 support
  crypto: SHAKE tests
  crypto: Add ML-DSA/Dilithium support
  crypto: Add ML-DSA/Dilithium keypair generation support
  crypto: Add ML-DSA-44 pure rejection test vectors as a kunit test
  crypto: Add ML-DSA-65 pure rejection test vectors as a kunit test
  crypto: Add ML-DSA-87 pure rejection test vectors as a kunit test
  pkcs7: Allow the signing algo to calculate the digest itself
  pkcs7, x509: Add ML-DSA support
  modsign: Enable ML-DSA module signing

 Documentation/admin-guide/module-signing.rst  |    15 +-
 Documentation/crypto/index.rst                |     1 +
 Documentation/crypto/sha3.rst                 |   237 +
 arch/arm64/crypto/sha3-ce-glue.c              |    47 +-
 arch/s390/crypto/sha3_256_s390.c              |    26 +-
 arch/s390/crypto/sha3_512_s390.c              |    26 +-
 certs/Kconfig                                 |    24 +
 certs/Makefile                                |     3 +
 crypto/Kconfig                                |     1 +
 crypto/Makefile                               |     1 +
 crypto/asymmetric_keys/pkcs7_parser.c         |    19 +-
 crypto/asymmetric_keys/pkcs7_verify.c         |    52 +-
 crypto/asymmetric_keys/public_key.c           |     7 +
 crypto/asymmetric_keys/x509_cert_parser.c     |    24 +
 crypto/jitterentropy-kcapi.c                  |   100 +-
 crypto/jitterentropy.c                        |     7 +-
 crypto/jitterentropy.h                        |     8 +-
 crypto/ml_dsa/Kconfig                         |    32 +
 crypto/ml_dsa/Makefile                        |    20 +
 crypto/ml_dsa/dilithium.h                     |   804 ++
 crypto/ml_dsa/dilithium_44.c                  |    33 +
 crypto/ml_dsa/dilithium_44.h                  |   412 +
 crypto/ml_dsa/dilithium_65.c                  |    33 +
 crypto/ml_dsa/dilithium_65.h                  |   412 +
 crypto/ml_dsa/dilithium_87.c                  |    33 +
 crypto/ml_dsa/dilithium_87.h                  |   412 +
 crypto/ml_dsa/dilithium_api.c                 |   821 ++
 crypto/ml_dsa/dilithium_debug.h               |    80 +
 crypto/ml_dsa/dilithium_ntt.c                 |    89 +
 crypto/ml_dsa/dilithium_ntt.h                 |    35 +
 crypto/ml_dsa/dilithium_pack.h                |   285 +
 crypto/ml_dsa/dilithium_pct.h                 |    53 +
 crypto/ml_dsa/dilithium_poly.c                |   586 +
 crypto/ml_dsa/dilithium_poly.h                |   190 +
 crypto/ml_dsa/dilithium_poly_c.h              |   149 +
 crypto/ml_dsa/dilithium_poly_common.h         |    35 +
 crypto/ml_dsa/dilithium_polyvec.h             |   363 +
 crypto/ml_dsa/dilithium_polyvec_c.h           |   114 +
 .../dilithium_pure_rejection_vectors_44.h     |   812 ++
 .../dilithium_pure_rejection_vectors_65.h     |  8290 ++++++++++++
 .../dilithium_pure_rejection_vectors_87.h     | 10761 ++++++++++++++++
 crypto/ml_dsa/dilithium_reduce.h              |   108 +
 crypto/ml_dsa/dilithium_rounding.c            |   128 +
 crypto/ml_dsa/dilithium_rounding.h            |    45 +
 crypto/ml_dsa/dilithium_selftest.c            |   183 +
 crypto/ml_dsa/dilithium_service_helpers.h     |    99 +
 crypto/ml_dsa/dilithium_sig.c                 |   404 +
 crypto/ml_dsa/dilithium_signature_c.c         |   198 +
 crypto/ml_dsa/dilithium_signature_c.h         |    60 +
 crypto/ml_dsa/dilithium_signature_helper.c    |   110 +
 crypto/ml_dsa/dilithium_signature_impl.h      |  1033 ++
 crypto/ml_dsa/dilithium_type.h                |   281 +
 crypto/ml_dsa/dilithium_zetas.c               |    67 +
 crypto/ml_dsa/fips_mode.h                     |    45 +
 crypto/ml_dsa/signature_domain_separation.c   |   213 +
 crypto/ml_dsa/signature_domain_separation.h   |    33 +
 crypto/ml_dsa/small_stack_support.h           |    40 +
 crypto/sha3_generic.c                         |   241 +-
 crypto/testmgr.c                              |    14 +
 crypto/testmgr.h                              |    59 +
 include/crypto/algapi.h                       |     2 +-
 include/crypto/public_key.h                   |     1 +
 include/crypto/sha3.h                         |   433 +-
 include/linux/oid_registry.h                  |     5 +
 kernel/module/Kconfig                         |     5 +
 lib/crypto/Kconfig                            |     7 +
 lib/crypto/Makefile                           |     6 +
 lib/crypto/sha3.c                             |   511 +
 lib/crypto/tests/Kconfig                      |    11 +
 lib/crypto/tests/Makefile                     |     1 +
 lib/crypto/tests/sha3_kunit.c                 |   342 +
 lib/crypto/tests/sha3_testvecs.h              |   231 +
 scripts/crypto/gen-hash-testvecs.py           |    10 +-
 scripts/sign-file.c                           |    26 +-
 74 files changed, 30050 insertions(+), 354 deletions(-)
 create mode 100644 Documentation/crypto/sha3.rst
 create mode 100644 crypto/ml_dsa/Kconfig
 create mode 100644 crypto/ml_dsa/Makefile
 create mode 100644 crypto/ml_dsa/dilithium.h
 create mode 100644 crypto/ml_dsa/dilithium_44.c
 create mode 100644 crypto/ml_dsa/dilithium_44.h
 create mode 100644 crypto/ml_dsa/dilithium_65.c
 create mode 100644 crypto/ml_dsa/dilithium_65.h
 create mode 100644 crypto/ml_dsa/dilithium_87.c
 create mode 100644 crypto/ml_dsa/dilithium_87.h
 create mode 100644 crypto/ml_dsa/dilithium_api.c
 create mode 100644 crypto/ml_dsa/dilithium_debug.h
 create mode 100644 crypto/ml_dsa/dilithium_ntt.c
 create mode 100644 crypto/ml_dsa/dilithium_ntt.h
 create mode 100644 crypto/ml_dsa/dilithium_pack.h
 create mode 100644 crypto/ml_dsa/dilithium_pct.h
 create mode 100644 crypto/ml_dsa/dilithium_poly.c
 create mode 100644 crypto/ml_dsa/dilithium_poly.h
 create mode 100644 crypto/ml_dsa/dilithium_poly_c.h
 create mode 100644 crypto/ml_dsa/dilithium_poly_common.h
 create mode 100644 crypto/ml_dsa/dilithium_polyvec.h
 create mode 100644 crypto/ml_dsa/dilithium_polyvec_c.h
 create mode 100644 crypto/ml_dsa/dilithium_pure_rejection_vectors_44.h
 create mode 100644 crypto/ml_dsa/dilithium_pure_rejection_vectors_65.h
 create mode 100644 crypto/ml_dsa/dilithium_pure_rejection_vectors_87.h
 create mode 100644 crypto/ml_dsa/dilithium_reduce.h
 create mode 100644 crypto/ml_dsa/dilithium_rounding.c
 create mode 100644 crypto/ml_dsa/dilithium_rounding.h
 create mode 100644 crypto/ml_dsa/dilithium_selftest.c
 create mode 100644 crypto/ml_dsa/dilithium_service_helpers.h
 create mode 100644 crypto/ml_dsa/dilithium_sig.c
 create mode 100644 crypto/ml_dsa/dilithium_signature_c.c
 create mode 100644 crypto/ml_dsa/dilithium_signature_c.h
 create mode 100644 crypto/ml_dsa/dilithium_signature_helper.c
 create mode 100644 crypto/ml_dsa/dilithium_signature_impl.h
 create mode 100644 crypto/ml_dsa/dilithium_type.h
 create mode 100644 crypto/ml_dsa/dilithium_zetas.c
 create mode 100644 crypto/ml_dsa/fips_mode.h
 create mode 100644 crypto/ml_dsa/signature_domain_separation.c
 create mode 100644 crypto/ml_dsa/signature_domain_separation.h
 create mode 100644 crypto/ml_dsa/small_stack_support.h
 create mode 100644 lib/crypto/sha3.c
 create mode 100644 lib/crypto/tests/sha3_kunit.c
 create mode 100644 lib/crypto/tests/sha3_testvecs.h


