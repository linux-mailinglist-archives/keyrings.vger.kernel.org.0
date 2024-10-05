Return-Path: <keyrings+bounces-2184-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 670AE991471
	for <lists+keyrings@lfdr.de>; Sat,  5 Oct 2024 07:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D22391F24364
	for <lists+keyrings@lfdr.de>; Sat,  5 Oct 2024 05:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51034381BA;
	Sat,  5 Oct 2024 05:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="MsaDtPNn"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897B5322B;
	Sat,  5 Oct 2024 05:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728106136; cv=none; b=lGF9ZBOT4NiAL3HwMdUuaLiMEgNJWiFSol0BgcmfJQzqxmypKR1pMEcJrB/yHdOHhq3BonXij7qDOmPBrKYKEPvl01nE6pDeJWSx0pcM4b0sz3LbqkBe845gnGBam1cIkpeJUNM610Hl6r6iTjC0olxuvXmbmmmdhVXrl28iWHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728106136; c=relaxed/simple;
	bh=nhqyXnvozrvv4wCwtUDg4CHp3pEbJRBfxM8mSshaJro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+sXFgJj3nQE2zWfYr8pJzruNpsfZXNXq1PzKOeu4fiTHc13yUdIpLlGSsZran3PPeDGgpG6BWbWaiLCRB0Bm7VUzlTlVWAfBhOlY0XemDehLo7Hxy+RTzTTACGWkrYooWv0pxFQOqjBMuVmW846lOtJdNqVbjv0aX1jN+5PfPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=MsaDtPNn; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FmDrERpeXqDIAqQ+D2TzT1nK31RfU5C95/VpOEG/MvU=; b=MsaDtPNnV6e7iHZj7T4/TqgZNP
	HKb6uydoPZIqxinyigHsVKzChFG2gkzZp7UxBVtr/F2JTf9bufZAr+vNNdPoFfq1xMbu1VCzr0OAL
	xzpM/Pu3hlzZt+pVNFuLpB1gHix+6USYir6DLBXZNWOJDPQoTESvkhQGSW7AfrUkCiHQY4TTmaK2q
	AxSjQSGLYv+SfLVh/bSZAulR4L6HoyWiW5MDheDY4aUt1S/IuIeRGxWv4+w0CDMyvf51Y1epO9nfV
	DksEF/GqaZEGOMO7q0t92UO4wbYEJf9HiyKMl9aS4qusghl0JLrQ9xsRrNQv6737S4KxQEpJNs2fB
	B8N56wVQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1swxAl-0071S6-08;
	Sat, 05 Oct 2024 13:27:57 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 05 Oct 2024 13:27:56 +0800
Date: Sat, 5 Oct 2024 13:27:56 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Biggers <ebiggers@google.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	Tadeusz Struk <tstruk@gigaio.com>,
	Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
	David Howells <dhowells@redhat.com>,
	Andrew Zaborowski <andrew.zaborowski@intel.com>,
	Saulo Alessandre <saulo.alessandre@tse.jus.br>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Marek Behun <kabel@kernel.org>,
	Varad Gautam <varadgautam@google.com>,
	Stephan Mueller <smueller@chronox.de>,
	Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
	Roberto Sassu <roberto.sassu@huawei.com>,
	Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
	Eric Snowberg <eric.snowberg@oracle.com>,
	linux-security-module@vger.kernel.org,
	Gonglei <arei.gonglei@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio Perez <eperezma@redhat.com>, virtualization@lists.linux.dev,
	zhenwei pi <pizhenwei@bytedance.com>,
	lei he <helei.sig11@bytedance.com>,
	Neal Liu <neal_liu@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeff ery <andrew@codeconstruct.com.au>,
	linux-aspeed@lists.ozlabs.org, Zhiqi Song <songzhiqi1@huawei.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Jia Jie Ho <jiajie.ho@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>
Subject: Re: [PATCH v2 00/19] Migrate to sig_alg and templatize ecdsa
Message-ID: <ZwDOXKZ8QrOvpGAW@gondor.apana.org.au>
References: <cover.1725972333.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1725972333.git.lukas@wunner.de>

On Tue, Sep 10, 2024 at 04:30:10PM +0200, Lukas Wunner wrote:
> The original impetus of this series is to introduce P1363 signature
> decoding for ecdsa (patch [18/19]), which is needed by the upcoming
> SPDM library (Security Protocol and Data Model) for PCI device
> authentication.
> 
> To facilitate that, move X9.62 signature decoding out of ecdsa.c and
> into a template (patch [15/19]).
> 
> New in v2:  Move the maximum signature size calculations for ecdsa
> out of software_key_query() and into the X9.62 template so that
> corresponding calculations can be added for P1363 without further
> cluttering up software_key_query() (patch [16/19] - [17/19]).
> 
> New in v2:  Avoid inefficient copying from kernel buffers to sglists
> in the new templates by introducing a sig_alg backend and migrating
> all algorithms to it, per Herbert's advice (patch [02/19] - [12/19]).
> 
> Clean up various smaller issues that caught my eye in ecdsa
> (patch [01/19] and [14/19]), ecrdsa (patch [19/19]) and
> ASN.1 headers (patch [13/19]).
> 
> I've also accumulated various cleanups for crypto virtio on my
> development branch but will leave them for another day as this
> series is already nearing the "too big to review" threshold. ;)
> 
> I've run selftests on every single commit, but further testing
> would be appreciated to raise the confidence.
> 
> 
> Link to v1:
> 
> https://lore.kernel.org/all/cover.1722260176.git.lukas@wunner.de/
> 
> Changes v1 -> v2:
> 
> * [PATCH 13/19] ASN.1: Clean up include statements in public headers
>   * Drop "#include <linux/bug.h>" from <linux/asn1_encoder.h> (Jonathan)
> 
> * [PATCH 14/19] crypto: ecdsa - Avoid signed integer overflow on signature
>   decoding
>   * Add code comment explaining why vlen may be larger than bufsize (Stefan)
> 
> * [PATCH 15/19] crypto: ecdsa - Move X9.62 signature decoding into template
>   * Drop unnecessary "params", "param_len" and "algo" definitions from
>     ecdsa_nist_p{192,256,384,521}_tv_template[].
>   * Introduce and use struct ecdsa_raw_sig in <crypto/internal/ecc.h>.
> 
> * [PATCH 18/19] crypto: ecdsa - Support P1363 signature decoding
>   * Drop unnecessary "params", "param_len" and "algo" definitions from
>     p1363_ecdsa_nist_p256_tv_template[].
> 
> 
> Lukas Wunner (19):
>   crypto: ecdsa - Drop unused test vector elements
>   crypto: sig - Introduce sig_alg backend
>   crypto: ecdsa - Migrate to sig_alg backend
>   crypto: ecrdsa - Migrate to sig_alg backend
>   crypto: rsa-pkcs1pad - Deduplicate set_{pub,priv}_key callbacks
>   crypto: rsassa-pkcs1 - Migrate to sig_alg backend
>   crypto: rsassa-pkcs1 - Harden digest length verification
>   crypto: rsassa-pkcs1 - Avoid copying hash prefix
>   crypto: virtio - Drop sign/verify operations
>   crypto: drivers - Drop sign/verify operations
>   crypto: akcipher - Drop sign/verify operations
>   crypto: sig - Move crypto_sig_*() API calls to include file
>   ASN.1: Clean up include statements in public headers
>   crypto: ecdsa - Avoid signed integer overflow on signature decoding
>   crypto: ecdsa - Move X9.62 signature decoding into template
>   crypto: sig - Rename crypto_sig_maxsize() to crypto_sig_keysize()
>   crypto: ecdsa - Move X9.62 signature size calculation into template
>   crypto: ecdsa - Support P1363 signature decoding
>   crypto: ecrdsa - Fix signature size calculation
> 
>  Documentation/crypto/api-akcipher.rst         |   2 +-
>  Documentation/crypto/api-sig.rst              |  15 +
>  Documentation/crypto/api.rst                  |   1 +
>  Documentation/crypto/architecture.rst         |   2 +
>  crypto/Kconfig                                |   5 +-
>  crypto/Makefile                               |   5 +-
>  crypto/akcipher.c                             |  64 +-
>  crypto/asymmetric_keys/public_key.c           |  58 +-
>  crypto/ecdsa-p1363.c                          | 159 ++++
>  crypto/ecdsa-x962.c                           | 237 +++++
>  crypto/ecdsa.c                                | 209 ++---
>  crypto/ecrdsa.c                               |  64 +-
>  crypto/internal.h                             |  19 -
>  crypto/rsa-pkcs1pad.c                         | 371 +-------
>  crypto/rsa.c                                  |  17 +-
>  crypto/rsassa-pkcs1.c                         | 442 +++++++++
>  crypto/sig.c                                  | 143 +--
>  crypto/testmgr.c                              | 320 +++++--
>  crypto/testmgr.h                              | 884 +++++++++++++++---
>  drivers/crypto/aspeed/aspeed-acry.c           |   2 -
>  drivers/crypto/hisilicon/hpre/hpre_crypto.c   |   2 -
>  drivers/crypto/starfive/jh7110-rsa.c          |   2 -
>  .../virtio/virtio_crypto_akcipher_algs.c      |  65 +-
>  include/crypto/akcipher.h                     |  69 +-
>  include/crypto/internal/akcipher.h            |   4 +-
>  include/crypto/internal/ecc.h                 |  14 +
>  include/crypto/internal/rsa.h                 |  29 +
>  include/crypto/internal/sig.h                 |  80 ++
>  include/crypto/sig.h                          | 152 ++-
>  include/linux/asn1_decoder.h                  |   1 +
>  include/linux/asn1_encoder.h                  |   1 -
>  include/linux/slab.h                          |   1 +
>  include/uapi/linux/cryptouser.h               |   5 +
>  include/uapi/linux/virtio_crypto.h            |   1 +
>  security/integrity/ima/ima_main.c             |   6 +-
>  35 files changed, 2398 insertions(+), 1053 deletions(-)
>  create mode 100644 Documentation/crypto/api-sig.rst
>  create mode 100644 crypto/ecdsa-p1363.c
>  create mode 100644 crypto/ecdsa-x962.c
>  create mode 100644 crypto/rsassa-pkcs1.c
> 
> -- 
> 2.43.0

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

