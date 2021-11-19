Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD707456A95
	for <lists+keyrings@lfdr.de>; Fri, 19 Nov 2021 07:59:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233041AbhKSHCb (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 19 Nov 2021 02:02:31 -0500
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.82]:14448 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbhKSHC2 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 19 Nov 2021 02:02:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1637305165;
    s=strato-dkim-0002; d=chronox.de;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=kZAaIDsfZBiixiGkfImYztcXIyeoEl1um0RYkvsN28E=;
    b=jH1xxBdj9ZM0qcOLfFO7UlL40qy+oSQRZe6bWFjqt98WPXCSybgL3xD5Nfz1L7wNYu
    HQII0SQxAps0I67U6G2uC9uxZUz8YZZvQP86DuWisySHCUnwQQJnceChD3YTHwJ1YBgv
    hXhulpt1T6yY83yX6yohfQ0bbs7nby0aldZagNuDglF8V8v2prCrzc8mbH5F4xMQivl9
    pxbEorQr/2vBme8pvafeltkT10xzA+u1VpYo0CFPMmSIQvqWCgsf2KI3BZlXU/sxTM7x
    TMRKt/hOWdmO/njJxz6EoZgkHfNN5ps4Ru3P2qM6PAvW+pdx+bt51eyevGWIZHMmuZXJ
    chqQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXPZJ/SWpaI="
X-RZG-CLASS-ID: mo00
Received: from positron.chronox.de
    by smtp.strato.de (RZmta 47.34.5 DYNA|AUTH)
    with ESMTPSA id U02dfbxAJ6xOu44
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 19 Nov 2021 07:59:24 +0100 (CET)
From:   Stephan =?ISO-8859-1?Q?M=FCller?= <smueller@chronox.de>
To:     herbert@gondor.apana.org.au
Cc:     ebiggers@kernel.org, jarkko@kernel.org,
        Mat Martineau <mathew.j.martineau@linux.intel.com>,
        dhowells@redhat.com, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
        simo@redhat.com
Subject: [PATCH v4 0/4] Add SP800-108 KDF implementation to crypto API
Date:   Fri, 19 Nov 2021 07:55:03 +0100
Message-ID: <4642773.OV4Wx5bFTl@positron.chronox.de>
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

Changes v3 to v4:
* SP800-108 KDF kernel configuration parameter is not user selectable
  as suggested by Eric Biggers
* update the error code path for the self test handling to mirror
  testmgr.c as suggested by Eric Biggers
* further cleanup in kdf_alloc as suggested by Mat Martineau

Changes v2 to v3:

* port to kernel 5.16-rc1
* remove the HKDF patch to only leave the SP800-108 patch

Stephan Mueller (4):
  crypto: Add key derivation self-test support code
  crypto: add SP800-108 counter key derivation function
  security: DH - remove dead code for zero padding
  security: DH - use KDF implementation from crypto API

 crypto/Kconfig                         |   4 +
 crypto/Makefile                        |   5 +
 crypto/kdf_sp800108.c                  | 153 +++++++++++++++++++++++++
 include/crypto/internal/kdf_selftest.h |  71 ++++++++++++
 include/crypto/kdf_sp800108.h          |  61 ++++++++++
 security/keys/Kconfig                  |   2 +-
 security/keys/dh.c                     | 130 ++++-----------------
 7 files changed, 315 insertions(+), 111 deletions(-)
 create mode 100644 crypto/kdf_sp800108.c
 create mode 100644 include/crypto/internal/kdf_selftest.h
 create mode 100644 include/crypto/kdf_sp800108.h

-- 
2.33.1




