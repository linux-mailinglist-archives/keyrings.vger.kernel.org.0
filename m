Return-Path: <keyrings+bounces-3308-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 332CDC414B0
	for <lists+keyrings@lfdr.de>; Fri, 07 Nov 2025 19:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A54524E3A11
	for <lists+keyrings@lfdr.de>; Fri,  7 Nov 2025 18:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F49332EAE;
	Fri,  7 Nov 2025 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="JR2vxmRA"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0DDA324B3B;
	Fri,  7 Nov 2025 18:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762540392; cv=none; b=XqhTQHySiA6i1IqCBa4hCjD8fDImuDTKS+q7op160bkBPm/R0YnIsQMabLNLj0BNPR9rHw0k64v80Gi/RY0R4UXlPD3Qkol35qFsGCyVugODezRo9jLtc/SPPaQr68GJEFsqwnnivryUwfADQeI/v1nbEcxkbE/Xjih9tbqQ+rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762540392; c=relaxed/simple;
	bh=5lGjanlwX7NUxIGHIf8/HZoprAcOr26JX7GbBooYSbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4aUdb3Va4BrUcSDGyrbEYiAQYr0H+xC4t9Jeyf/mHBjt5sBMCb8Ax5WKHfHyZXRVxX1APMlvVoaWV3xmcQHozR6gnYiCAMCcX50t9SMxpFPMt4IBCEqp3Fv5GgNRUbcDqMHOc9IvkvKpQmC3AF0x4IwinZHUP3ZrO8nC/niqrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=JR2vxmRA; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7HsvTm026723;
	Fri, 7 Nov 2025 18:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=g2MT83
	RsUGq3MDb70m7r4uO8EpQv3DhlNJizpmSHRTM=; b=JR2vxmRAbFmVQQXR9hdNBO
	hh0Y6NEgJrbFRVvOvaXc1FmxD98c9vpt7lxAvfzhWjnQJBcwKsmXtibfRDWHjmwe
	w7Hx0I9N2e7gBZtRCr7ZhNyyORgf2QKqly328sKzTtbeWv2FPbQwT3HNDJL3h3sw
	DnN2u64ACf2ENCFLwRAF2oaxOLaJA8tDNT4gKd62jW55gNkk/ZZ4gSjPEgS+K7CJ
	k11kzJVG66oCX0k3rqqedlHICmbWap229fOOxp3gVpmAUbv/+MIl39MHkF/eF/++
	bUb+AN+0bIDk3ttDo06qSple6XMz3GVkD87E9npKMTil4atltNCIBG4Mmgrmplcg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9nk5g6gq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 18:32:56 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A7IUFO3009838;
	Fri, 7 Nov 2025 18:32:56 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9nk5g6gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 18:32:56 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7IHrsX018738;
	Fri, 7 Nov 2025 18:32:55 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5whnv9fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 18:32:55 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A7IWsgY30278176
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Nov 2025 18:32:55 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DAD875803F;
	Fri,  7 Nov 2025 18:32:54 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CA2558054;
	Fri,  7 Nov 2025 18:32:53 +0000 (GMT)
Received: from [9.47.158.152] (unknown [9.47.158.152])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Nov 2025 18:32:53 +0000 (GMT)
Message-ID: <9ffd806d-1a90-46da-b9c6-3a5914ef1ba6@linux.ibm.com>
Date: Fri, 7 Nov 2025 13:32:52 -0500
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/8] lib/crypto: Add ML-DSA signing
To: David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
        Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Stephan Mueller <smueller@chronox.de>, Lukas Wunner <lukas@wunner.de>,
        Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org,
        keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251106174456.31818-1-dhowells@redhat.com>
Content-Language: en-US
From: Stefan Berger <stefanb@linux.ibm.com>
In-Reply-To: <20251106174456.31818-1-dhowells@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE0OCBTYWx0ZWRfXxV3pOyMu0T2W
 CKeqLxJ10yBWpg3AvARlKwyfFz6/kQRwMngItCtki5s1aLN0e+cbkotJ6E17N+zSyUsEVnaqKG2
 ghuiXm1mBcjtsu5tpab8xhO1S03C1s7wb/a6HN0bYXV48w+sbxqzjK2pXGWu9i48E7voaP6PxFz
 C3rHGnluw3XsVs6VQLjDOpUNIXWmC17CwgjDBXnp6jLcK3MFDfhk+533p9XunlqZvGVe+zSDdZJ
 j2C/t8pP+hXsKY4whACwpS00f8iJ52Om4zJdJ4x9YdNgn273D0xUkMZ6hs3GzLJPAghN8bfoWiv
 cRQYN1fFov5YVgREw4RhmttKKsv6Ckqlz7m6Zf6BTRfvLTM3FZGJj5bFNryUhAD6zr8SaJM0ob4
 MJ0hmxfht5w9a/a/7RxMv3XHzoKQiQ==
X-Proofpoint-GUID: bN-RPCJr7eAHBUlUnP9hGvrRIaKdqmrp
X-Authority-Analysis: v=2.4 cv=epnSD4pX c=1 sm=1 tr=0 ts=690e3b58 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=w4sDDSwb_dBvIumLC4MA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: TfbrkoKnMI4Y-DnMpXkzodB4w47Y-Y7r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 malwarescore=0 clxscore=1011 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511070148

On 11/6/25 12:44 PM, David Howells wrote:
> Hi Herbert, Eric, et al.,
> 
> Building on the SHA-3 lib-crypto patches now in Eric's tree, here's a set of
> patches does the following:
> 
>   (1) Add SHAKE-256 crypto_sig support, generating 32-byte fixed output.  The
>       XOF features aren't available through this.  SHAKE-128 crypto_sig support
>       isn't required for ML-DSA, so I haven't implemented that at this time.
> 
>   (2) Add ML-DSA signature verification code, extracted from Stephan Mueller's
>       Leancrypto project.  It is accessed through crypto_sig.
> 
>   (3) Add a kunit test in three installments (due to size) to add some
>       testing for the three different levels of ML-DSA (44, 65 and 87).
> 
>   (4) Modify PKCS#7 support to allow kernel module signatures to carry
>       authenticatedAttributes as OpenSSL refuses to let them be opted out of
>       for ML-DSA (CMS_NOATTR).  This adds an extra digest calculation to the
>       process.
> 
>   (5) Modify PKCS#7 to pass the authenticatedAttributes directly to the
>       ML-DSA algorithm rather than passing over a digest as is done with RSA
>       as ML-DSA wants to do its own hashing and will add other stuff into
>       the hash.  We could use hashML-DSA or an external mu instead, but they
>       aren't standardised for CMS yet.
> 
>   (6) Add support to the PKCS#7 and X.509 parsers for ML-DSA.
> 
>   (7) Modify sign-file to handle OpenSSL not permitting CMS_NOATTR with
>       ML-DSA.
 > >   (8) Allow SHA-3 algorithms, including SHAKE256, to be used for 
the message
>       digest and add ML-DSA to the choice of algorithm with which to sign.

Hi David,

if you are interested in picking patches from my effort in this 
direction, let me know. I have a test suite in user space at

https://github.com/stefanberger/mldsa-testing

User space patches interfacing with the kernel (prefix 'keyctl:') are in 
this series here:

https://github.com/stefanberger/linux-ima-namespaces/commits/mldsa.10312025/

Either way, great work!

> 
> With that, ML-DSA signing appears to work.
> 
> This is based on Eric's libcrypto-next branch.
> 
> The patches can also be found here:
> 
> 	https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/log/?h=keys-pqc
> 
> David
> 
> Changes
> =======
> ver #7)
>   - Rebased on Eric's tree as that now contains all the necessary SHA-3
>     infrastructure and drop the SHA-3 patches from here.
>   - Added a minimal patch to provide shake256 support for crypto_sig.
>   - Got rid of the memory allocation wrappers.
>   - Removed the ML-DSA keypair generation code and the signing code, leaving
>     only the signature verification code.
>   - Removed the secret key handling code.
>   - Removed the secret keys from the kunit tests and the signing testing.
>   - Removed some unused bits from the ML-DSA code.
>   - Downgraded the kdoc comments to ordinary comments, but keep the markup
>     for easier comparison to Leancrypto.
> 
> ver #6)
>   - Added a patch to make the jitterentropy RNG use lib/sha3.
>   - Added back the crypto/sha3_generic changes.
>   - Added ML-DSA implementation (still needs more cleanup).
>   - Added kunit test for ML-DSA.
>   - Modified PKCS#7 to accommodate ML-DSA.
>   - Modified PKCS#7 and X.509 to allow ML-DSA to be specified and used.
>   - Modified sign-file to not use CMS_NOATTR with ML-DSA.
>   - Allowed SHA3 and SHAKE* algorithms for module signing default.
>   - Allowed ML-DSA-{44,65,87} to be selected as the module signing default.
> 
> ver #5)
>   - Fix gen-hash-testvecs.py to correctly handle algo names that contain a
>     dash.
>   - Fix gen-hash-testvecs.py to not generate HMAC for SHA3-* or SHAKE* as
>     these don't currently have HMAC variants implemented.
>   - Fix algo names to be correct.
>   - Fix kunit module description as it now tests all SHA3 variants.
> 
> ver #4)
>   - Fix a couple of arm64 build problems.
>   - Doc fixes:
>     - Fix the description of the algorithm to be closer to the NIST spec's
>       terminology.
>     - Don't talk of finialising the context for XOFs.
>     - Don't say "Return: None".
>     - Declare the "Context" to be "Any context" and make no mention of the
>       fact that it might use the FPU.
>     - Change "initialise" to "initialize".
>     - Don't warn that the context is relatively large for stack use.
>   - Use size_t for size parameters/variables.
>   - Make the module_exit unconditional.
>   - Dropped the crypto/ dir-affecting patches for the moment.
> 
> ver #3)
>   - Renamed conflicting arm64 functions.
>   - Made a separate wrapper API for each algorithm in the family.
>   - Removed sha3_init(), sha3_reinit() and sha3_final().
>   - Removed sha3_ctx::digest_size.
>   - Renamed sha3_ctx::partial to sha3_ctx::absorb_offset.
>   - Refer to the output of SHAKE* as "output" not "digest".
>   - Moved the Iota transform into the one-round function.
>   - Made sha3_update() warn if called after sha3_squeeze().
>   - Simplified the module-load test to not do update after squeeze.
>   - Added Return: and Context: kdoc statements and expanded the kdoc
>     headers.
>   - Added an API description document.
>   - Overhauled the kunit tests.
>     - Only have one kunit test.
>     - Only call the general hash tester on one algo.
>     - Add separate simple cursory checks for the other algos.
>     - Add resqueezing tests.
>     - Add some NIST example tests.
>   - Changed crypto/sha3_generic to use this
>   - Added SHAKE128/256 to crypto/sha3_generic and crypto/testmgr
>   - Folded struct sha3_state into struct sha3_ctx.
> 
> ver #2)
>    - Simplify the endianness handling.
>    - Rename sha3_final() to sha3_squeeze() and don't clear the context at the
>      end as it's permitted to continue calling sha3_final() to extract
>      continuations of the digest (needed by ML-DSA).
>    - Don't reapply the end marker to the hash state in continuation
>      sha3_squeeze() unless sha3_update() gets called again (needed by
>      ML-DSA).
>    - Give sha3_squeeze() the amount of digest to produce as a parameter
>      rather than using ctx->digest_size and don't return the amount digested.
>    - Reimplement sha3_final() as a wrapper around sha3_squeeze() that
>      extracts ctx->digest_size amount of digest and then zeroes out the
>      context.  The latter is necessary to avoid upsetting
>      hash-test-template.h.
>    - Provide a sha3_reinit() function to clear the state, but to leave the
>      parameters that indicate the hash properties unaffected, allowing for
>      reuse.
>    - Provide a sha3_set_digestsize() function to change the size of the
>      digest to be extracted by sha3_final().  sha3_squeeze() takes a
>      parameter for this instead.
>    - Don't pass the digest size as a parameter to shake128/256_init() but
>      rather default to 128/256 bits as per the function name.
>    - Provide a sha3_clear() function to zero out the context.
> 
> David Howells (8):
>    crypto: Add support for shake256 through crypto_shash
>    crypto: Add ML-DSA/Dilithium verify support
>    crypto: Add ML-DSA-44 pure rejection test vectors as a kunit test
>    crypto: Add ML-DSA-65 pure rejection test vectors as a kunit test
>    crypto: Add ML-DSA-87 pure rejection test vectors as a kunit test
>    pkcs7: Allow the signing algo to calculate the digest itself
>    pkcs7, x509: Add ML-DSA support
>    modsign: Enable ML-DSA module signing
> 
>   Documentation/admin-guide/module-signing.rst  |   15 +-
>   certs/Kconfig                                 |   24 +
>   certs/Makefile                                |    3 +
>   crypto/Kconfig                                |    1 +
>   crypto/Makefile                               |    1 +
>   crypto/asymmetric_keys/pkcs7_parser.c         |   19 +-
>   crypto/asymmetric_keys/pkcs7_verify.c         |   52 +-
>   crypto/asymmetric_keys/public_key.c           |    7 +
>   crypto/asymmetric_keys/x509_cert_parser.c     |   24 +
>   crypto/ml_dsa/Kconfig                         |   32 +
>   crypto/ml_dsa/Makefile                        |   20 +
>   crypto/ml_dsa/dilithium.h                     |  547 ++
>   crypto/ml_dsa/dilithium_44.c                  |   33 +
>   crypto/ml_dsa/dilithium_44.h                  |  282 +
>   crypto/ml_dsa/dilithium_65.c                  |   33 +
>   crypto/ml_dsa/dilithium_65.h                  |  282 +
>   crypto/ml_dsa/dilithium_87.c                  |   33 +
>   crypto/ml_dsa/dilithium_87.h                  |  282 +
>   crypto/ml_dsa/dilithium_api.c                 |  429 ++
>   crypto/ml_dsa/dilithium_debug.h               |   49 +
>   crypto/ml_dsa/dilithium_ntt.c                 |   89 +
>   crypto/ml_dsa/dilithium_ntt.h                 |   35 +
>   crypto/ml_dsa/dilithium_pack.h                |  119 +
>   crypto/ml_dsa/dilithium_poly.c                |  377 +
>   crypto/ml_dsa/dilithium_poly.h                |  181 +
>   crypto/ml_dsa/dilithium_poly_c.h              |  141 +
>   crypto/ml_dsa/dilithium_poly_common.h         |   35 +
>   crypto/ml_dsa/dilithium_polyvec.h             |  343 +
>   crypto/ml_dsa/dilithium_polyvec_c.h           |   81 +
>   .../dilithium_pure_rejection_vectors_44.h     |  489 ++
>   .../dilithium_pure_rejection_vectors_65.h     | 4741 ++++++++++++
>   .../dilithium_pure_rejection_vectors_87.h     | 6456 +++++++++++++++++
>   crypto/ml_dsa/dilithium_reduce.h              |   85 +
>   crypto/ml_dsa/dilithium_rounding.c            |  128 +
>   crypto/ml_dsa/dilithium_selftest.c            |  142 +
>   crypto/ml_dsa/dilithium_service_helpers.h     |   99 +
>   crypto/ml_dsa/dilithium_sig.c                 |  334 +
>   crypto/ml_dsa/dilithium_signature_c.c         |  102 +
>   crypto/ml_dsa/dilithium_signature_c.h         |   37 +
>   crypto/ml_dsa/dilithium_signature_helper.c    |   97 +
>   crypto/ml_dsa/dilithium_signature_impl.h      |  370 +
>   crypto/ml_dsa/dilithium_type.h                |  102 +
>   crypto/ml_dsa/dilithium_zetas.c               |   67 +
>   crypto/ml_dsa/signature_domain_separation.c   |  203 +
>   crypto/ml_dsa/signature_domain_separation.h   |   30 +
>   crypto/sha3.c                                 |   42 +
>   include/crypto/public_key.h                   |    1 +
>   include/linux/oid_registry.h                  |    5 +
>   kernel/module/Kconfig                         |    5 +
>   scripts/sign-file.c                           |   26 +-
>   50 files changed, 17094 insertions(+), 36 deletions(-)
>   create mode 100644 crypto/ml_dsa/Kconfig
>   create mode 100644 crypto/ml_dsa/Makefile
>   create mode 100644 crypto/ml_dsa/dilithium.h
>   create mode 100644 crypto/ml_dsa/dilithium_44.c
>   create mode 100644 crypto/ml_dsa/dilithium_44.h
>   create mode 100644 crypto/ml_dsa/dilithium_65.c
>   create mode 100644 crypto/ml_dsa/dilithium_65.h
>   create mode 100644 crypto/ml_dsa/dilithium_87.c
>   create mode 100644 crypto/ml_dsa/dilithium_87.h
>   create mode 100644 crypto/ml_dsa/dilithium_api.c
>   create mode 100644 crypto/ml_dsa/dilithium_debug.h
>   create mode 100644 crypto/ml_dsa/dilithium_ntt.c
>   create mode 100644 crypto/ml_dsa/dilithium_ntt.h
>   create mode 100644 crypto/ml_dsa/dilithium_pack.h
>   create mode 100644 crypto/ml_dsa/dilithium_poly.c
>   create mode 100644 crypto/ml_dsa/dilithium_poly.h
>   create mode 100644 crypto/ml_dsa/dilithium_poly_c.h
>   create mode 100644 crypto/ml_dsa/dilithium_poly_common.h
>   create mode 100644 crypto/ml_dsa/dilithium_polyvec.h
>   create mode 100644 crypto/ml_dsa/dilithium_polyvec_c.h
>   create mode 100644 crypto/ml_dsa/dilithium_pure_rejection_vectors_44.h
>   create mode 100644 crypto/ml_dsa/dilithium_pure_rejection_vectors_65.h
>   create mode 100644 crypto/ml_dsa/dilithium_pure_rejection_vectors_87.h
>   create mode 100644 crypto/ml_dsa/dilithium_reduce.h
>   create mode 100644 crypto/ml_dsa/dilithium_rounding.c
>   create mode 100644 crypto/ml_dsa/dilithium_selftest.c
>   create mode 100644 crypto/ml_dsa/dilithium_service_helpers.h
>   create mode 100644 crypto/ml_dsa/dilithium_sig.c
>   create mode 100644 crypto/ml_dsa/dilithium_signature_c.c
>   create mode 100644 crypto/ml_dsa/dilithium_signature_c.h
>   create mode 100644 crypto/ml_dsa/dilithium_signature_helper.c
>   create mode 100644 crypto/ml_dsa/dilithium_signature_impl.h
>   create mode 100644 crypto/ml_dsa/dilithium_type.h
>   create mode 100644 crypto/ml_dsa/dilithium_zetas.c
>   create mode 100644 crypto/ml_dsa/signature_domain_separation.c
>   create mode 100644 crypto/ml_dsa/signature_domain_separation.h
> 
> 



