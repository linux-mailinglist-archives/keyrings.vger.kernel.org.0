Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F8681F48A4
	for <lists+keyrings@lfdr.de>; Tue,  9 Jun 2020 23:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727088AbgFIVIA (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 9 Jun 2020 17:08:00 -0400
Received: from vmicros1.altlinux.org ([194.107.17.57]:35212 "EHLO
        vmicros1.altlinux.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgFIVIA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 9 Jun 2020 17:08:00 -0400
X-Greylist: delayed 559 seconds by postgrey-1.27 at vger.kernel.org; Tue, 09 Jun 2020 17:07:57 EDT
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
        by vmicros1.altlinux.org (Postfix) with ESMTP id 67E6E72CCED;
        Tue,  9 Jun 2020 23:58:37 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
        by imap.altlinux.org (Postfix) with ESMTPSA id 3E0A24A4A16;
        Tue,  9 Jun 2020 23:58:37 +0300 (MSK)
Date:   Tue, 9 Jun 2020 23:58:37 +0300
From:   Vitaly Chikunov <vt@altlinux.org>
To:     Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Cc:     herbert@gondor.apana.org.au, davem@davemloft.net,
        dhowells@redhat.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, jmorris@namei.org, serge@hallyn.com,
        nramas@linux.microsoft.com, tusharsu@linux.microsoft.com,
        zohar@linux.ibm.com, gilad@benyossef.com, pvanleeuwen@rambus.com,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-security-module@vger.kernel.org, zhang.jia@linux.alibaba.com
Subject: Re: [PATCH v3 0/8] crpyto: introduce OSCCA certificate and SM2
 asymmetric algorithm
Message-ID: <20200609205837.osganry2tyzwvanz@altlinux.org>
Mail-Followup-To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        dhowells@redhat.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, jmorris@namei.org, serge@hallyn.com,
        nramas@linux.microsoft.com, tusharsu@linux.microsoft.com,
        zohar@linux.ibm.com, gilad@benyossef.com, pvanleeuwen@rambus.com,
        linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
        keyrings@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        linux-security-module@vger.kernel.org, zhang.jia@linux.alibaba.com
References: <20200609134855.21431-1-tianjia.zhang@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline
In-Reply-To: <20200609134855.21431-1-tianjia.zhang@linux.alibaba.com>
User-Agent: NeoMutt/20171215-106-ac61c7
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Tianjia,

On Tue, Jun 09, 2020 at 09:48:47PM +0800, Tianjia Zhang wrote:
> Hello all,
> 
> This new module implement the OSCCA certificate and SM2 public key
> algorithm. It was published by State Encryption Management Bureau, China.
> List of specifications for OSCCA certificate and SM2 elliptic curve
> public key cryptography:
> 
> * GM/T 0003.1-2012
> * GM/T 0003.2-2012
> * GM/T 0003.3-2012
> * GM/T 0003.4-2012
> * GM/T 0003.5-2012
> * GM/T 0015-2012
> * GM/T 0009-2012 
> 
> IETF: https://tools.ietf.org/html/draft-shen-sm2-ecdsa-02
> oscca: http://www.oscca.gov.cn/sca/xxgk/2010-12/17/content_1002386.shtml
> scctc: http://www.gmbz.org.cn/main/bzlb.html
> 
> These patchs add the OID object identifier defined by OSCCA. The
> x509 certificate supports sm2-with-sm3 type certificate parsing
> and verification.
> 
> The sm2 algorithm is based on libgcrypt's mpi implementation, and has
> made some additions to the kernel's original mpi library, and added the
> implementation of ec to better support elliptic curve-like algorithms.
> 
> sm2 has good support in both openssl and gnupg projects, and sm3 and sm4
> of the OSCCA algorithm family have also been implemented in the kernel.
> 
> Among them, sm3 and sm4 have been well implemented in the kernel.
> This group of patches has newly introduced sm2. In order to implement
> sm2 more perfectly, I expanded the mpi library and introduced the
> ec implementation of the mpi library as the basic algorithm. Compared
> to the kernel's crypto/ecc.c, the implementation of mpi/ec.c is more
> complete and elegant, sm2 is implemented based on these algorithms.

Does it use constant-time algorithms?

Thanks,

> 
> ---
> v3 changes:
>   1. integrity asymmetric digsig support sm2-with-sm3 algorithm.
>   2. remove unused sm2_set_priv_key().
>   3. rebase on mainline.
> 
> v2 changes:
>   1. simplify the sm2 algorithm and only retain the verify function.
>   2. extract the sm2 certificate code into a separate file.
> 
> Tianjia Zhang (8):
>   crypto: sm3 - export crypto_sm3_final function
>   lib/mpi: Extend the MPI library
>   lib/mpi: Introduce ec implementation to MPI library
>   crypto: sm2 - introduce OSCCA SM2 asymmetric cipher algorithm
>   crypto: testmgr - support test with different ciphertext per
>     encryption
>   X.509: support OSCCA certificate parse
>   X.509: support OSCCA sm2-with-sm3 certificate verification
>   integrity: Asymmetric digsig supports SM2-with-SM3 algorithm
> 
>  crypto/Kconfig                            |   17 +
>  crypto/Makefile                           |    8 +
>  crypto/asymmetric_keys/Makefile           |    1 +
>  crypto/asymmetric_keys/public_key.c       |    6 +
>  crypto/asymmetric_keys/public_key_sm2.c   |   59 +
>  crypto/asymmetric_keys/x509_cert_parser.c |   14 +-
>  crypto/asymmetric_keys/x509_public_key.c  |    2 +
>  crypto/sm2.c                              |  473 +++++++
>  crypto/sm2signature.asn1                  |    4 +
>  crypto/sm3_generic.c                      |    7 +-
>  crypto/testmgr.c                          |    7 +-
>  include/crypto/public_key.h               |   14 +
>  include/crypto/sm2.h                      |   25 +
>  include/crypto/sm3.h                      |    2 +
>  include/linux/mpi.h                       |  193 +++
>  include/linux/oid_registry.h              |    6 +
>  lib/mpi/Makefile                          |    6 +
>  lib/mpi/ec.c                              | 1538 +++++++++++++++++++++
>  lib/mpi/mpi-add.c                         |  207 +++
>  lib/mpi/mpi-bit.c                         |  251 ++++
>  lib/mpi/mpi-cmp.c                         |   46 +-
>  lib/mpi/mpi-div.c                         |  259 ++++
>  lib/mpi/mpi-internal.h                    |   53 +
>  lib/mpi/mpi-inv.c                         |  143 ++
>  lib/mpi/mpi-mod.c                         |  155 +++
>  lib/mpi/mpi-mul.c                         |  166 +++
>  lib/mpi/mpicoder.c                        |  336 +++++
>  lib/mpi/mpih-div.c                        |  294 ++++
>  lib/mpi/mpih-mul.c                        |   25 +
>  lib/mpi/mpiutil.c                         |  204 +++
>  security/integrity/digsig_asymmetric.c    |   14 +-
>  31 files changed, 4517 insertions(+), 18 deletions(-)
>  create mode 100644 crypto/asymmetric_keys/public_key_sm2.c
>  create mode 100644 crypto/sm2.c
>  create mode 100644 crypto/sm2signature.asn1
>  create mode 100644 include/crypto/sm2.h
>  create mode 100644 lib/mpi/ec.c
>  create mode 100644 lib/mpi/mpi-add.c
>  create mode 100644 lib/mpi/mpi-div.c
>  create mode 100644 lib/mpi/mpi-inv.c
>  create mode 100644 lib/mpi/mpi-mod.c
>  create mode 100644 lib/mpi/mpi-mul.c
> 
> -- 
> 2.17.1
