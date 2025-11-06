Return-Path: <keyrings+bounces-3295-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD50C3CE8E
	for <lists+keyrings@lfdr.de>; Thu, 06 Nov 2025 18:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 073FB1898795
	for <lists+keyrings@lfdr.de>; Thu,  6 Nov 2025 17:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 572AE34F246;
	Thu,  6 Nov 2025 17:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fqg/XLcJ"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C36934FF72
	for <keyrings@vger.kernel.org>; Thu,  6 Nov 2025 17:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762451116; cv=none; b=L77oXckc/6kKmzr8m9yOUDerfK6ew5ab7U41MudFongm/FEODLm7kagPyJs8fTg41d8w2Q4iKgcy2zXopcePOcgkU1jpYvg/pOkrhT7kw2cyILkWKhLufMDz1Aygr/2RnbyagR4qxbA0I796X8YUd8fWT8JxxYpFYwMIrItkZS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762451116; c=relaxed/simple;
	bh=ffNg72JjlFH4BvAYZWSxk48ILVTij36r3dT9OUADfoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p+kV5oooihkvl+D2A3EjxkiqZU2Sw6ABToadVI2N4bngNHn3oJpuXfAF2YzpR3ycpXtps7E0zMVVTVReIowbW8qEKVeMe+DTCU5bDrupPJOrVkQgcB39OpBAkKRj3ARFoDM7VUqg5v8bD+vbNI8FXKqAK9GSCHwZUCB7Q5y17p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fqg/XLcJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762451113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BEkNLyO2sIdqTr7tYvIFogiBy7iPJgUOJQEahlHRhPo=;
	b=fqg/XLcJvMCBRQ/7V95YZ2s3VZFrPts2FjtXk/SXuW9Vu3UFFMnP4m7Mgx8bTptHFLf7wi
	rU2OhUbnMUkxgS2VbOSUF7eIzl67tNxPjcUAXqATvOYzJT5oWMR/AAj0GEUaYwBOOEcdxy
	znO81SCDVzSU0Cdd7dzUyZ/yrXWs5/E=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-GNU5-JzNMKyyJ1dXOEPLPA-1; Thu,
 06 Nov 2025 12:45:07 -0500
X-MC-Unique: GNU5-JzNMKyyJ1dXOEPLPA-1
X-Mimecast-MFC-AGG-ID: GNU5-JzNMKyyJ1dXOEPLPA_1762451104
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0FD5918002E7;
	Thu,  6 Nov 2025 17:45:04 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.6])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F35371800361;
	Thu,  6 Nov 2025 17:44:59 +0000 (UTC)
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
Subject: [PATCH v7 0/8] lib/crypto: Add ML-DSA signing
Date: Thu,  6 Nov 2025 17:44:44 +0000
Message-ID: <20251106174456.31818-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

Hi Herbert, Eric, et al.,

Building on the SHA-3 lib-crypto patches now in Eric's tree, here's a set of
patches does the following:

 (1) Add SHAKE-256 crypto_sig support, generating 32-byte fixed output.  The
     XOF features aren't available through this.  SHAKE-128 crypto_sig support
     isn't required for ML-DSA, so I haven't implemented that at this time.

 (2) Add ML-DSA signature verification code, extracted from Stephan Mueller's
     Leancrypto project.  It is accessed through crypto_sig.

 (3) Add a kunit test in three installments (due to size) to add some
     testing for the three different levels of ML-DSA (44, 65 and 87).

 (4) Modify PKCS#7 support to allow kernel module signatures to carry
     authenticatedAttributes as OpenSSL refuses to let them be opted out of
     for ML-DSA (CMS_NOATTR).  This adds an extra digest calculation to the
     process.

 (5) Modify PKCS#7 to pass the authenticatedAttributes directly to the
     ML-DSA algorithm rather than passing over a digest as is done with RSA
     as ML-DSA wants to do its own hashing and will add other stuff into
     the hash.  We could use hashML-DSA or an external mu instead, but they
     aren't standardised for CMS yet.

 (6) Add support to the PKCS#7 and X.509 parsers for ML-DSA.

 (7) Modify sign-file to handle OpenSSL not permitting CMS_NOATTR with
     ML-DSA.

 (8) Allow SHA-3 algorithms, including SHAKE256, to be used for the message
     digest and add ML-DSA to the choice of algorithm with which to sign.

With that, ML-DSA signing appears to work.

This is based on Eric's libcrypto-next branch.

The patches can also be found here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-pqc

David

Changes
=======
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

David Howells (8):
  crypto: Add support for shake256 through crypto_shash
  crypto: Add ML-DSA/Dilithium verify support
  crypto: Add ML-DSA-44 pure rejection test vectors as a kunit test
  crypto: Add ML-DSA-65 pure rejection test vectors as a kunit test
  crypto: Add ML-DSA-87 pure rejection test vectors as a kunit test
  pkcs7: Allow the signing algo to calculate the digest itself
  pkcs7, x509: Add ML-DSA support
  modsign: Enable ML-DSA module signing

 Documentation/admin-guide/module-signing.rst  |   15 +-
 certs/Kconfig                                 |   24 +
 certs/Makefile                                |    3 +
 crypto/Kconfig                                |    1 +
 crypto/Makefile                               |    1 +
 crypto/asymmetric_keys/pkcs7_parser.c         |   19 +-
 crypto/asymmetric_keys/pkcs7_verify.c         |   52 +-
 crypto/asymmetric_keys/public_key.c           |    7 +
 crypto/asymmetric_keys/x509_cert_parser.c     |   24 +
 crypto/ml_dsa/Kconfig                         |   32 +
 crypto/ml_dsa/Makefile                        |   20 +
 crypto/ml_dsa/dilithium.h                     |  547 ++
 crypto/ml_dsa/dilithium_44.c                  |   33 +
 crypto/ml_dsa/dilithium_44.h                  |  282 +
 crypto/ml_dsa/dilithium_65.c                  |   33 +
 crypto/ml_dsa/dilithium_65.h                  |  282 +
 crypto/ml_dsa/dilithium_87.c                  |   33 +
 crypto/ml_dsa/dilithium_87.h                  |  282 +
 crypto/ml_dsa/dilithium_api.c                 |  429 ++
 crypto/ml_dsa/dilithium_debug.h               |   49 +
 crypto/ml_dsa/dilithium_ntt.c                 |   89 +
 crypto/ml_dsa/dilithium_ntt.h                 |   35 +
 crypto/ml_dsa/dilithium_pack.h                |  119 +
 crypto/ml_dsa/dilithium_poly.c                |  377 +
 crypto/ml_dsa/dilithium_poly.h                |  181 +
 crypto/ml_dsa/dilithium_poly_c.h              |  141 +
 crypto/ml_dsa/dilithium_poly_common.h         |   35 +
 crypto/ml_dsa/dilithium_polyvec.h             |  343 +
 crypto/ml_dsa/dilithium_polyvec_c.h           |   81 +
 .../dilithium_pure_rejection_vectors_44.h     |  489 ++
 .../dilithium_pure_rejection_vectors_65.h     | 4741 ++++++++++++
 .../dilithium_pure_rejection_vectors_87.h     | 6456 +++++++++++++++++
 crypto/ml_dsa/dilithium_reduce.h              |   85 +
 crypto/ml_dsa/dilithium_rounding.c            |  128 +
 crypto/ml_dsa/dilithium_selftest.c            |  142 +
 crypto/ml_dsa/dilithium_service_helpers.h     |   99 +
 crypto/ml_dsa/dilithium_sig.c                 |  334 +
 crypto/ml_dsa/dilithium_signature_c.c         |  102 +
 crypto/ml_dsa/dilithium_signature_c.h         |   37 +
 crypto/ml_dsa/dilithium_signature_helper.c    |   97 +
 crypto/ml_dsa/dilithium_signature_impl.h      |  370 +
 crypto/ml_dsa/dilithium_type.h                |  102 +
 crypto/ml_dsa/dilithium_zetas.c               |   67 +
 crypto/ml_dsa/signature_domain_separation.c   |  203 +
 crypto/ml_dsa/signature_domain_separation.h   |   30 +
 crypto/sha3.c                                 |   42 +
 include/crypto/public_key.h                   |    1 +
 include/linux/oid_registry.h                  |    5 +
 kernel/module/Kconfig                         |    5 +
 scripts/sign-file.c                           |   26 +-
 50 files changed, 17094 insertions(+), 36 deletions(-)
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
 create mode 100644 crypto/ml_dsa/dilithium_selftest.c
 create mode 100644 crypto/ml_dsa/dilithium_service_helpers.h
 create mode 100644 crypto/ml_dsa/dilithium_sig.c
 create mode 100644 crypto/ml_dsa/dilithium_signature_c.c
 create mode 100644 crypto/ml_dsa/dilithium_signature_c.h
 create mode 100644 crypto/ml_dsa/dilithium_signature_helper.c
 create mode 100644 crypto/ml_dsa/dilithium_signature_impl.h
 create mode 100644 crypto/ml_dsa/dilithium_type.h
 create mode 100644 crypto/ml_dsa/dilithium_zetas.c
 create mode 100644 crypto/ml_dsa/signature_domain_separation.c
 create mode 100644 crypto/ml_dsa/signature_domain_separation.h


