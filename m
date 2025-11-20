Return-Path: <keyrings+bounces-3398-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D77DC73851
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 11:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 03D1C4E50F1
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 10:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6620832E6A0;
	Thu, 20 Nov 2025 10:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I6Sn5Y/O"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B87732D45E
	for <keyrings@vger.kernel.org>; Thu, 20 Nov 2025 10:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763635513; cv=none; b=HD+y4xKgp6lCLklOoYS8vvYYhIA1BQVN9IgWsFhQjES93aN07ilpRksFTZEVKLJW1sSo/AsdcRCA0Jxkhqe9PFP16wqAN9SZTkhwslv2bKOx/1v3H91oOVUyd6hT9tmgOXNsCbj8hF5JEnuQyvCLmNOH/0b+FvPio8SjCK+30SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763635513; c=relaxed/simple;
	bh=iO3j63Q04963H50ER6ufFZy7vToJgWplML5BO4Q8EVM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DeStsnsDjyFa9USwwaryHNgFAtYIUkDZM5m4PljJqt2uhT0vuOm5qFjVIEVaAqXGJBAz7l6zo4ju0qbQXbGQ3e9YiVtJyU5CO3GX4ZtYzYtJ5tQUV4D/oXUq+ZsrGgzaHYq3sZlCV6AUztKuvrkiNzw/x6PQsHWGbihMYpRnFtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I6Sn5Y/O; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763635509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PRi132PdUVH2mK8reqiJtqqEnRFImISlD/8XU5fbDto=;
	b=I6Sn5Y/OFzQEkvxKoZD5YfGQLkaMvIuq9LadzxTnFklZTUt0+00mfNWAdVdI9tITJil/FN
	YFioN4wvBcCEy+U3g9pc0XKRfTHNJIgON6VHU8F+KFXR8oxkn6ug6Vu+mN6G4H+oZ1z6Kr
	/rvmqDWDaEHjIjd/OZ60vhvTh5bY9nI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-10-rp6cI-7JNA2YhZqEcVhk0w-1; Thu,
 20 Nov 2025 05:44:50 -0500
X-MC-Unique: rp6cI-7JNA2YhZqEcVhk0w-1
X-Mimecast-MFC-AGG-ID: rp6cI-7JNA2YhZqEcVhk0w_1763635488
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 35A5918007F2;
	Thu, 20 Nov 2025 10:44:48 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.5])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 51F3C1940E82;
	Thu, 20 Nov 2025 10:44:44 +0000 (UTC)
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
Subject: [PATCH v10 0/8] lib/crypto: Add ML-DSA signing [WIP]
Date: Thu, 20 Nov 2025 10:44:27 +0000
Message-ID: <20251120104439.2620205-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi Herbert, Eric, et al.,

[Note this should be considered a work in progress as it's based on Eric's
new implementation of ML-DSA].

Building on the SHA-3 lib-crypto patches now in Eric's tree, here's a set of
patches does the following:

 (1) Add ML-DSA signature verification code, as written by Eric.

 (2) Add a kunit test in three instalments (due to size) to add some
     testing for the three different levels of ML-DSA (44, 65 and 87).

 (3) Add a crypto_sig interface.

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

 (8) Add ML-DSA to the choice of algorithm with which to sign modules.
     Note that this might need some more 'select' lines in the Kconfig to
     select the lib stuff as well.

This is based on Eric's libcrypto-next branch with patches added from his
mldsa-v1 branch.  Note that I've fixed his mldsa driver to have the missing
MODULE_* info.

The patches can also be found here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-pqc

David

Changes
=======
ver #10)
 - Replaced the Leancrypto ML-DSA implementation with Eric's.
 - Fixed Eric's implementation to have MODULE_* info.
 - Added a patch to drive Eric's ML-DSA implementation from crypto_sig.
 - Removed SHAKE256 from the list of available module hash algorithms.
 - Changed a some more ML_DSA to MLDSA in config symbols.

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

David Howells (5):
  lib/crypto: tests: Add KUnit tests for ML-DSA
  crypto: Add ML-DSA crypto_sig support
  pkcs7: Allow the signing algo to calculate the digest itself
  pkcs7, x509: Add ML-DSA support
  modsign: Enable ML-DSA module signing

Eric Biggers (3):
  lib/crypto: Add ML-DSA verification support
  lib/crypto: tests: Add ML-DSA-65 test cases
  lib/crypto: tests: Add ML-DSA-87 test cases

 Documentation/admin-guide/module-signing.rst  |   15 +-
 certs/Kconfig                                 |   21 +
 certs/Makefile                                |    3 +
 crypto/Kconfig                                |   10 +
 crypto/Makefile                               |    2 +
 crypto/asymmetric_keys/pkcs7_parser.c         |   19 +-
 crypto/asymmetric_keys/pkcs7_verify.c         |   52 +-
 crypto/asymmetric_keys/public_key.c           |    7 +
 crypto/asymmetric_keys/x509_cert_parser.c     |   24 +
 include/crypto/mldsa.h                        |   51 +
 include/crypto/public_key.h                   |    1 +
 include/linux/oid_registry.h                  |    5 +
 lib/crypto/Kconfig                            |    7 +
 lib/crypto/Makefile                           |    5 +
 lib/crypto/mldsa.c                            |  570 ++
 lib/crypto/tests/Kconfig                      |   10 +
 lib/crypto/tests/Makefile                     |    1 +
 lib/crypto/tests/mldsa_kunit.c                |  124 +
 .../tests/mldsa_pure_rejection_vectors_44.h   |  489 ++
 .../tests/mldsa_pure_rejection_vectors_65.h   | 4702 ++++++++++++
 .../tests/mldsa_pure_rejection_vectors_87.h   | 6390 +++++++++++++++++
 scripts/sign-file.c                           |   26 +-
 22 files changed, 12498 insertions(+), 36 deletions(-)
 create mode 100644 include/crypto/mldsa.h
 create mode 100644 lib/crypto/mldsa.c
 create mode 100644 lib/crypto/tests/mldsa_kunit.c
 create mode 100644 lib/crypto/tests/mldsa_pure_rejection_vectors_44.h
 create mode 100644 lib/crypto/tests/mldsa_pure_rejection_vectors_65.h
 create mode 100644 lib/crypto/tests/mldsa_pure_rejection_vectors_87.h


