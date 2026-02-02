Return-Path: <keyrings+bounces-4004-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJUYF4/ZgGnMBwMAu9opvQ
	(envelope-from <keyrings+bounces-4004-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 18:06:23 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 108F7CF5DF
	for <lists+keyrings@lfdr.de>; Mon, 02 Feb 2026 18:06:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 11FF6303B4F9
	for <lists+keyrings@lfdr.de>; Mon,  2 Feb 2026 17:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797C83816E0;
	Mon,  2 Feb 2026 17:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b87FShxw"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1990279DAF
	for <keyrings@vger.kernel.org>; Mon,  2 Feb 2026 17:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051753; cv=none; b=kVoYk8nHrj5yh3QfSCKdcOomocvF4lUfuzqih770CCYp2pIO+Y7UeJKmkhzbAzXfL/x8PGvGyFZTj6i6HaKhuRsgKXy/H0eygZuPpoE/brgZCIC/oWj4Z0v3gU9+3YW5uI+bdyyYtddFh5jYZhena2csyFOoj9HIA/+/hPppZ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051753; c=relaxed/simple;
	bh=HJNI+/ukjAPKsCplQcvlstT5Rinp/Iiw/ZSffFN/Z7c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OSS3msodjzxcrB0YS/jgtkmPmHFbMOQqFVatO75gJd7ZZq6pYR15Nr1WDMZ+wG5RfsNQ/7ASixi+bzTZrByJ4Ge0mdU2hr4g6YC5iKnFR2KPN5CmPXTIGOMOuyemS22RrI2gw8m6qGVafp1qiaZJP4uwcU1wwzwg/JUcyDornS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b87FShxw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770051750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oET/gB+SB3Rm7CLBmvgEP1WX3LxcVAaP73+8Ws0b93g=;
	b=b87FShxwd8OPMf4vXHQRbSbIQS4BmDZ31jspqzEn8XZTlvyKKwwnvbdONe+Qs6novX1Lcj
	2MDhh3sSi054g57d/dtPoVXTvXHc4mZSj/39PFvSrAkwJ6oKSh6rYf2NBfzxDI3WkU6Ajd
	ENMJTS6WOuKbk+rLsoTLN/Czp9AHAtU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-427-u8_5FDENN4GBi_nhX-O19Q-1; Mon,
 02 Feb 2026 12:02:27 -0500
X-MC-Unique: u8_5FDENN4GBi_nhX-O19Q-1
X-Mimecast-MFC-AGG-ID: u8_5FDENN4GBi_nhX-O19Q_1770051745
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 94A8D18005B4;
	Mon,  2 Feb 2026 17:02:24 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.44.33.164])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4C1981800577;
	Mon,  2 Feb 2026 17:02:19 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>
Cc: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v16 0/7] x509, pkcs7, crypto: Add ML-DSA signing
Date: Mon,  2 Feb 2026 17:02:05 +0000
Message-ID: <20260202170216.2467036-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4004-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[keyrings];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,gen-hash-testvecs.py:url]
X-Rspamd-Queue-Id: 108F7CF5DF
X-Rspamd-Action: no action

Hi Lukas, Ignat,

[Note this is based on Eric Bigger's libcrypto-next branch].

These patches add ML-DSA module signing signing:

 (1) Add a crypto_sig interface for ML-DSA, verification only.

 (2) Generate a SHA256 hash of the X.509 TBSCertificate and check that in
     the blacklist.  Direct-sign ML-DSA doesn't generate an easily
     accessible hash.  Note that this changes behaviour as we no longer use
     whatever hash is specified in the certificate for this.

 (3) Rename the public_key_signature struct's "digest" and "digest_size"
     members to "m" and "m_size" to reflect that it's not necessarily a
     digest, but it is an input to the public key algorithm.

 (4) Modify PKCS#7 support to allow kernel module signatures to carry
     authenticatedAttributes as OpenSSL refuses to let them be opted out of
     for ML-DSA (CMS_NOATTR).  This adds an extra digest calculation to the
     process.

     Modify PKCS#7 to pass the authenticatedAttributes directly to the
     ML-DSA algorithm rather than passing over a digest as is done with RSA
     as ML-DSA wants to do its own hashing and will add other stuff into
     the hash.  We could use hashML-DSA or an external mu instead, but they
     aren't standardised for CMS yet.

 (5) Add support to the PKCS#7 and X.509 parsers for ML-DSA.

 (6) Modify sign-file to handle OpenSSL not permitting CMS_NOATTR with
     ML-DSA and add ML-DSA to the choice of algorithm with which to sign
     modules.  Note that this might need some more 'select' lines in the
     Kconfig to select the lib stuff as well.

 (7) Add a config option to allow authenticatedAttributes to be used with
     ML-DSA for module signing.  Ordinarily, authenticatedAttributes are
     not permitted for this purpose, however direct signing with ML-DSA
     will not be supported by OpenSSL until v4 is released.

The patches can also be found here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-pqc

David

Changes
=======
ver #16)
 - Make the selection of ML-DSA for module signing when configuring
   contingent on openssl saying it supports ML-DSA (fix from Arnd
   Bergmann).
 - Make ML-DSA-related bits of sign-file contingent on openssl >= 3.0.0.

ver #15)
 - Undo a removed blank line to simplify the X.509 patch.
 - Split the rename of ->digest to ->m into its own patch.
 - In pkcs7_digest(), always copy the signedAttrs and modify rather than
   passing the replacement tag byte in a separate shash update call to the
   rest of the data.  That way the ->m buffer is very likely to be
   optimally aligned for the crypto.
 - Only allow authenticatedAttributes with ML-DSA for module signing and
   only if permission is given in the kernel config.

ver #14)
 - public_key:
   - Rename public_key::digest to public_key::m.
 - X.509:
   - Independently calculate the SHA256 hash for the blacklist check as
     an ML-DSA-signed X.509 cert doesn't generate a digest we can use.
   - Point public_key::m at the TBS data for ML-DSA.
 - PKCS#7:
   - Allocate a big enough digest buffer rather than reallocating in order
     to store the authattrs/signedattrs instead.
   - Merge the two patches that add direct signing support.
 - ML-DSA:
   - Use bool instead of u8.
   - Remove references to SHAKE in Kconfig and mention OpenSSL requirements
     there.
   - Limit ML-DSA with an intermediate hash (e.g. signedAttrs) to using
     SHA512 only.
   - Don't select CRYPTO_LIB_SHA3 for CRYPTO_MLDSA.
 - RSASSA-PSS:
   - Allow use with SHA256 and SHA384.
   - Fix calculation of emBits to be number of bits in the RSA modulus 'n'.
   - Use strncmp() not memcmp() to avoid reading beyond end of string.
   - Use correct destructor in rsassa_params_parse().
   - Drop this algo for the moment.
 - Drop the pefile_context::digest_free for now - it's only set to true and
   is unrelated to public_key::digest_free.

ver #13)
 - Allow a zero-length salt in RSASSA-PSS.
 - Don't reject ECDSA/ECRDSA with SHA256 and SHA384 otherwise the FIPS
   selftest panics when used.
 - Add a FIPS test for RSASSA-PSS (from NIST's SigVerPSS_186-3.rsp).
 - Add a FIPS test for ML-DSA (from NIST's FIPS204 JSON set).

ver #12)
 - Rebased on Eric's libcrypto-next branch.
 - Delete references to Dilithium (ML-DSA derived from this).
 - Made sign-file supply CMS_NOATTR for ML-DSA if openssl >= v4.
 - Made it possible to do ML-DSA over the data without signedAttrs.
 - Made RSASSA-PSS info parser use strsep() and match_token().
 - Cleaned the RSASSA-PSS param parsing.
 - Added limitation on what hashes can be used with what algos.
 - Moved __free()-marked variables to the point of setting.

ver #11)
 - Rebased on Eric's libcrypto-next branch.
 - Added RSASSA-PSS support patches.

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

David Howells (7):
  crypto: Add ML-DSA crypto_sig support
  x509: Separately calculate sha256 for blacklist
  pkcs7, x509: Rename ->digest to ->m
  pkcs7: Allow the signing algo to do whatever digestion it wants itself
  pkcs7, x509: Add ML-DSA support
  modsign: Enable ML-DSA module signing
  pkcs7: Allow authenticatedAttributes for ML-DSA

 Documentation/admin-guide/module-signing.rst |  16 +-
 certs/Kconfig                                |  40 ++++
 certs/Makefile                               |   3 +
 crypto/Kconfig                               |   9 +
 crypto/Makefile                              |   2 +
 crypto/asymmetric_keys/Kconfig               |  11 +
 crypto/asymmetric_keys/asymmetric_type.c     |   4 +-
 crypto/asymmetric_keys/pkcs7_parser.c        |  36 +++-
 crypto/asymmetric_keys/pkcs7_parser.h        |   3 +
 crypto/asymmetric_keys/pkcs7_verify.c        |  78 ++++---
 crypto/asymmetric_keys/public_key.c          |  13 +-
 crypto/asymmetric_keys/signature.c           |   3 +-
 crypto/asymmetric_keys/x509_cert_parser.c    |  27 ++-
 crypto/asymmetric_keys/x509_parser.h         |   2 +
 crypto/asymmetric_keys/x509_public_key.c     |  42 ++--
 crypto/mldsa.c                               | 201 +++++++++++++++++++
 include/crypto/public_key.h                  |   6 +-
 include/linux/oid_registry.h                 |   5 +
 scripts/sign-file.c                          |  39 +++-
 security/integrity/digsig_asymmetric.c       |   4 +-
 20 files changed, 473 insertions(+), 71 deletions(-)
 create mode 100644 crypto/mldsa.c


