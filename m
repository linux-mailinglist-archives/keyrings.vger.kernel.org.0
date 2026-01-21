Return-Path: <keyrings+bounces-3881-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOTJCARVcWkNEwAAu9opvQ
	(envelope-from <keyrings+bounces-3881-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 23:36:52 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5415EE63
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 23:36:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 37F675638CE
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 22:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C7C83D5245;
	Wed, 21 Jan 2026 22:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U98F4t3E"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F5C43DA4B
	for <keyrings@vger.kernel.org>; Wed, 21 Jan 2026 22:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769034985; cv=none; b=uYNZCvWtnUmj2eEW5GktT+RR2LwKVzdq6tnUQBuotRgH/PUIDhnMREnpLtKBzSkfst04SWyJe8l3Dvuc2elqe/zHMcBJ3ZVl9vGmIYkMQUru7eklWA9VnZnj3TWPan1lW10xQbpk2Ku+X+wXWG0OfoMEFH8iYE1cq/OgRrekNIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769034985; c=relaxed/simple;
	bh=me9m+0dJ9oPfjpig03DU0rnpncdZFahuk+lj+0A1rYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IN19xWJ6MLGfDcPr1ckBeU2XaB5XLkhXBzlWSZmdjJ7Ctc5jhB7B9/R/9JTACwg+FZcFrWV0+mov2+166pEgw+R1H/saVjG+T8k2Z/Am0PyYqufBuPDu3+Q6R1zAk2rEvUinZAurrGQtrNFNhrwcnt/hxk2s3VdZbkIsbE/76TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U98F4t3E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769034982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=modYtiA0MJDhvp/xfmsCXxdPjWq41pNdftXRNlEPoi0=;
	b=U98F4t3EH7UvOcVDBCfDlDW5SZKgf856qbFc9nrOATLtF5hn0JCTjq8gZd38exO5DwEkDK
	ejBHRR0vEN9IN+ICGkg+8JnmOUlVv3qfs5f3j2ju3g3RVJgd6Xw67O5fMOmizPSZaXDu9B
	/DOOziBvRYLVaTfYUuP2xSQfbUN+q3s=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-KKSxy_s6MD6ipWDNG5O3HA-1; Wed,
 21 Jan 2026 17:36:18 -0500
X-MC-Unique: KKSxy_s6MD6ipWDNG5O3HA-1
X-Mimecast-MFC-AGG-ID: KKSxy_s6MD6ipWDNG5O3HA_1769034976
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2576D1800473;
	Wed, 21 Jan 2026 22:36:16 +0000 (UTC)
Received: from warthog.procyon.org.uk.com (unknown [10.42.28.2])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D4E519560A2;
	Wed, 21 Jan 2026 22:36:11 +0000 (UTC)
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
Subject: [PATCH v14 0/5] x509, pkcs7, crypto: Add ML-DSA and RSASSA-PSS signing
Date: Wed, 21 Jan 2026 22:36:02 +0000
Message-ID: <20260121223609.1650735-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a01:60a::1994:3:14:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3881-lists,keyrings=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[170.10.129.124:received,10.42.28.2:received,35.165.154.97:received,52.25.139.140:received];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gen-hash-testvecs.py:url,ams.mirrors.kernel.org:helo,ams.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: BD5415EE63
X-Rspamd-Action: no action

Hi Lukas, Ignat,

[Note this is based on Eric Bigger's libcrypto-next branch].

These patches add ML-DSA module signing and RSASSA-PSS module signing.  The
first half of the set adds ML-DSA signing:

 (1) Add a crypto_sig interface for ML-DSA, verification only.

 (2) Modify PKCS#7 support to allow kernel module signatures to carry
     authenticatedAttributes as OpenSSL refuses to let them be opted out of
     for ML-DSA (CMS_NOATTR).  This adds an extra digest calculation to the
     process.

     Modify PKCS#7 to pass the authenticatedAttributes directly to the
     ML-DSA algorithm rather than passing over a digest as is done with RSA
     as ML-DSA wants to do its own hashing and will add other stuff into
     the hash.  We could use hashML-DSA or an external mu instead, but they
     aren't standardised for CMS yet.

 (3) Add support to the PKCS#7 and X.509 parsers for ML-DSA.

 (4) Modify sign-file to handle OpenSSL not permitting CMS_NOATTR with
     ML-DSA and add ML-DSA to the choice of algorithm with which to sign
     modules.  Note that this might need some more 'select' lines in the
     Kconfig to select the lib stuff as well.

This is based on Eric's libcrypto-next branch which has the core
implementation of ML-DSA.

The second half of the set adds RSASSA-PSS signing:

 (5) Add an info string parameter to the internal signature verification
     routines where that does not already exist.  This is necessary to pass
     extra parameters and is already supported in the KEYCTL_PKEY_VERIFY
     keyctl.

     Both X.509 and PKCS#7 provide for these parameters to be supplied, but
     it is tricky to pass the parameters in a blob with the signature or
     key data as there are checks on these sizes that are then violated;
     further, the way the parameters are laid out in the ASN.1 doesn't lend
     itself easily to simply extracting out a larger blob.

 (6) Add RSASSA-PSS support to the RSA driver in crypto/.  This parses the
     info string to get the verification parameters.

 (7) Add support to the PKCS#7 and X.509 parsers for RSASSA-PSS.

 (8) Modify sign-file to pass the extra parameters necessary to be able
     generate RSASSA-PSS.  For the moment, only select MGF1 with the same
     hash algorithm as for the data for the mask function.  Add RSASSA-PSS
     to the choice of algorithm with which to sign modules.

Note that I do still need to add some FIPS tests for ML-DSA in the form of
X.509 certs, data and detached PKCS#7 signatures.  I'm not sure if I can
use FIPS-standard tests for that.

The patches can also be found here:

	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-pqc

David

Changes
=======
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

David Howells (5):
  crypto: Add ML-DSA crypto_sig support
  x509: Separately calculate sha256 for blacklist
  pkcs7: Allow the signing algo to do whatever digestion it wants itself
  pkcs7, x509: Add ML-DSA support
  modsign: Enable ML-DSA module signing

 Documentation/admin-guide/module-signing.rst |  16 +-
 certs/Kconfig                                |  30 +++
 certs/Makefile                               |   3 +
 crypto/Kconfig                               |   9 +
 crypto/Makefile                              |   2 +
 crypto/asymmetric_keys/asymmetric_type.c     |   4 +-
 crypto/asymmetric_keys/pkcs7_parser.c        |  28 ++-
 crypto/asymmetric_keys/pkcs7_verify.c        |  83 +++++---
 crypto/asymmetric_keys/public_key.c          |  13 +-
 crypto/asymmetric_keys/signature.c           |   3 +-
 crypto/asymmetric_keys/x509_cert_parser.c    |  27 ++-
 crypto/asymmetric_keys/x509_parser.h         |   2 +
 crypto/asymmetric_keys/x509_public_key.c     |  42 ++--
 crypto/mldsa.c                               | 201 +++++++++++++++++++
 include/crypto/public_key.h                  |   6 +-
 include/linux/oid_registry.h                 |   5 +
 scripts/sign-file.c                          |  34 +++-
 security/integrity/digsig_asymmetric.c       |   4 +-
 18 files changed, 438 insertions(+), 74 deletions(-)
 create mode 100644 crypto/mldsa.c


