Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4F9A45E770
	for <lists+keyrings@lfdr.de>; Fri, 26 Nov 2021 06:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345081AbhKZFh1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 26 Nov 2021 00:37:27 -0500
Received: from helcar.hmeau.com ([216.24.177.18]:57154 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233784AbhKZFf1 (ORCPT <rfc822;keyrings@vger.kernel.org>);
        Fri, 26 Nov 2021 00:35:27 -0500
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
        id 1mqTq7-0008RK-KJ; Fri, 26 Nov 2021 13:32:03 +0800
Received: from herbert by gondobar with local (Exim 4.92)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1mqTq5-0004ZR-KH; Fri, 26 Nov 2021 13:32:01 +0800
Date:   Fri, 26 Nov 2021 13:32:01 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Stephan =?iso-8859-1?Q?M=FCller?= <smueller@chronox.de>
Cc:     ebiggers@kernel.org, jarkko@kernel.org,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        dhowells@redhat.com, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
        simo@redhat.com
Subject: Re: [PATCH v4 0/4] Add SP800-108 KDF implementation to crypto API
Message-ID: <20211126053201.GD17477@gondor.apana.org.au>
References: <4642773.OV4Wx5bFTl@positron.chronox.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4642773.OV4Wx5bFTl@positron.chronox.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

On Fri, Nov 19, 2021 at 07:55:03AM +0100, Stephan Müller wrote:
> Hi,
> 
> The key derviation functions are considered to be a cryptographic
> operation. As cryptographic operations are provided via the kernel
> crypto API, this patch set consolidates the SP800-108 KDF
> implementation into the crypto API.
> 
> If this patch is accepted, another patch set will be published attempting
> to move the HKDF implementation from the crypto file system code base
> to the kernel crypto API.
> 
> The KDF implementation is provided as service functions. Yet, the
> interface to the the provided KDF is modeled such, that additional
> KDF implementation can use the same API style. The goal is to allow
> the transformation from a service function into a crypto API template
> eventually.
> 
> The KDF executes a power-on self test with test vectors from commonly
> known sources.
> 
> Tbe SP800-108 KDF implementation is used to replace the implementation
> in the keys subsystem. The implementation was verified using the
> keyutils command line test code provided in
> tests/keyctl/dh_compute/valid. All tests show that the expected values
> are calculated with the new code.
> 
> Changes v3 to v4:
> * SP800-108 KDF kernel configuration parameter is not user selectable
>   as suggested by Eric Biggers
> * update the error code path for the self test handling to mirror
>   testmgr.c as suggested by Eric Biggers
> * further cleanup in kdf_alloc as suggested by Mat Martineau
> 
> Changes v2 to v3:
> 
> * port to kernel 5.16-rc1
> * remove the HKDF patch to only leave the SP800-108 patch
> 
> Stephan Mueller (4):
>   crypto: Add key derivation self-test support code
>   crypto: add SP800-108 counter key derivation function
>   security: DH - remove dead code for zero padding
>   security: DH - use KDF implementation from crypto API
> 
>  crypto/Kconfig                         |   4 +
>  crypto/Makefile                        |   5 +
>  crypto/kdf_sp800108.c                  | 153 +++++++++++++++++++++++++
>  include/crypto/internal/kdf_selftest.h |  71 ++++++++++++
>  include/crypto/kdf_sp800108.h          |  61 ++++++++++
>  security/keys/Kconfig                  |   2 +-
>  security/keys/dh.c                     | 130 ++++-----------------
>  7 files changed, 315 insertions(+), 111 deletions(-)
>  create mode 100644 crypto/kdf_sp800108.c
>  create mode 100644 include/crypto/internal/kdf_selftest.h
>  create mode 100644 include/crypto/kdf_sp800108.h

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
