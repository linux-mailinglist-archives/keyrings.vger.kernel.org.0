Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D647D45004D
	for <lists+keyrings@lfdr.de>; Mon, 15 Nov 2021 09:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbhKOIzK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 15 Nov 2021 03:55:10 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:9871 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236941AbhKOIyf (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 15 Nov 2021 03:54:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1636965902;
    s=strato-dkim-0002; d=chronox.de;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=PWMyDsmcKSEWVFLSslzU2PhMOipVs7+UjgDjeCNRvI8=;
    b=pGSb0ZR2p+zjLnmaXAvXLkYtyxo8EzE9SAjrCUCl+PNi8bKkjwB0BinZbWLTtt2B94
    G67EMVZdQgxbP7fWURwopyMPCojPxJMqzWx6vwjTK3B5BNs0FzbLwFW/mswmSVLWmSCD
    BDqHeF9B0p/umzsCpjAFN+z3H+Dm3mfiLJqLI6DUFHf/YDbT0wEkNg8IbnPIWg6s7X4y
    iy+wH4fg0H8vI/g1C3aiAfK41jM1+4KvyI53jlm/f1hkhRuoWmCc9hlC3VbYN0xFUPqu
    C3vCvUr2hl0QoXJbDBQnGzfm2IaSsrHqDRURwIAwwtPJHVspBMKItTMZBNEN/Fg2hWzq
    iejQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXvTOeuXTEc="
X-RZG-CLASS-ID: mo00
Received: from positron.chronox.de
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id U02dfbxAF8j2U8v
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 15 Nov 2021 09:45:02 +0100 (CET)
From:   Stephan =?ISO-8859-1?Q?M=FCller?= <smueller@chronox.de>
To:     herbert@gondor.apana.org.au
Cc:     ebiggers@kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        "dhowells@redhat.com" <dhowells@redhat.com>,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings <keyrings@vger.kernel.org>, simo@redhat.com
Subject: [PATCH v3 0/4] Add SP800-108 KDF implementation to crypto API
Date:   Mon, 15 Nov 2021 09:41:04 +0100
Message-ID: <2589009.vuYhMxLoTh@positron.chronox.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Hi,

The key derviation functions are considered to be a cryptographic
operation. As cryptographic operations are provided via the kernel
crypto API, this patch set consolidates the SP800-108 KDF
implementation into the crypto API.

If this patch is accepted, another patch set will be published attempting
to move the HKDF implementation from the crypto file system code base
to the kernel crypto API.

The KDF implementation is provided as service functions. Yet, the
interface to the the provided KDF is modeled such, that additional
KDF implementation can use the same API style. The goal is to allow
the transformation from a service function into a crypto API template
eventually.

The KDF executes a power-on self test with test vectors from commonly
known sources.

Tbe SP800-108 KDF implementation is used to replace the implementation
in the keys subsystem. The implementation was verified using the
keyutils command line test code provided in
tests/keyctl/dh_compute/valid. All tests show that the expected values
are calculated with the new code.

Changes v3:

* port to kernel 5.16-rc1
* remove the HKDF patch to only leave the SP800-108 patch

Stephan Mueller (4):
  crypto: Add key derivation self-test support code
  crypto: add SP800-108 counter key derivation function
  security: DH - remove dead code for zero padding
  security: DH - use KDF implementation from crypto API

 crypto/Kconfig                         |   7 ++
 crypto/Makefile                        |   5 +
 crypto/kdf_sp800108.c                  | 149 +++++++++++++++++++++++++
 include/crypto/internal/kdf_selftest.h |  71 ++++++++++++
 include/crypto/kdf_sp800108.h          |  61 ++++++++++
 security/keys/Kconfig                  |   2 +-
 security/keys/dh.c                     | 118 +++-----------------
 7 files changed, 310 insertions(+), 103 deletions(-)
 create mode 100644 crypto/kdf_sp800108.c
 create mode 100644 include/crypto/internal/kdf_selftest.h
 create mode 100644 include/crypto/kdf_sp800108.h

-- 
2.33.1




