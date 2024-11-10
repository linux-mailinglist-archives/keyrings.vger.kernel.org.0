Return-Path: <keyrings+bounces-2292-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E47C9C30CE
	for <lists+keyrings@lfdr.de>; Sun, 10 Nov 2024 04:55:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D40161F213FB
	for <lists+keyrings@lfdr.de>; Sun, 10 Nov 2024 03:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BC181465AC;
	Sun, 10 Nov 2024 03:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="XT9UlygI"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719B313B7BC;
	Sun, 10 Nov 2024 03:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731210905; cv=none; b=HZ5YCCeoWLPsHN+nSuHPMW5jZ+YCbQE++E9ZVY7tgXeyf/++RpXOqK4SkGcEMuQa6vF/Jb6U5LHaJHEYS5omYliOGmcxBExoNcopQRdnp3qqmU97KKJ4MwPk6QWbQjmXezUl0piBRPmzb/oCxZoIITr/kukv4umfeOzUIodxeFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731210905; c=relaxed/simple;
	bh=PqQcnyg8V33auMLQwEe0FV6Icgntu0K7aMCbM8f/YFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZNYILDl6t790xZymfiBObAr18I9qjmmo1R52nIP3l7bmcK5YIrstnQhr3Skt02FPMK/zE4wwdJX+htBCPNPBLZxeUE9jvwLU5LxrUKXcttGr/oHjeHGZvFjc8cICEy8Fb5NtkOScS6gFomCGd5ejbj8M0rVyBFytuoji9hURfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=XT9UlygI; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vAeXaCJobgMRM5NV9ES7aAhcrkrC2PYPgXPWsXX2FJQ=; b=XT9UlygI+7N2kfSkx4IbqGvTW3
	c4dU8cWT2um9LbjA9iCVzAC8DapKkB2thqooqq8wyHdDS6D4WHty6Z89Ll/9G+LA+ruyWCYEi2oUK
	tghAWei4p6f4bf4a58QSKmvxZZ9Z2rzQrHPTkYORRvyYQUTWF3I2eBRYbGAcczXVnlYDNXN353C7D
	vbCjP9aqVUyi4w2wOhCnJG+W3OgOAS2qR96N+dOpygnKgQ3zjRsb5JlDMlE1vt499aysJ7cRU5dKs
	yuwiZxoLR5VR6Gi6Ek5ZAsRiCFVkHsFYb4j9QtY+C+kvDF/JciEcvR/2SBofJgn3JyD2wEHrHRJ5b
	wgKderzA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1t9z1o-00FkE1-24;
	Sun, 10 Nov 2024 11:54:21 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 10 Nov 2024 11:54:20 +0800
Date: Sun, 10 Nov 2024 11:54:20 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Klara Modin <klarasmodin@gmail.com>, klara@kasm.eu,
	Denis Kenzior <denkenz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Andrew Zaborowski <andrew.zaborowski@intel.com>,
	Zoltan Kelemen <zoltan@kelemen.se>,
	Kevin Jones <vcsjones@github.com>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, iwd@lists.linux.dev,
	Eric Biggers <ebiggers@google.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Tadeusz Struk <tstruk@gigaio.com>,
	David Howells <dhowells@redhat.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Stephan Mueller <smueller@chronox.de>,
	Varad Gautam <varadgautam@google.com>,
	Saulo Alessandre <saulo.alessandre@tse.jus.br>
Subject: Re: [PATCH cryptodev-2.6] crypto: rsassa-pkcs1 - Reinstate support
 for legacy protocols
Message-ID: <ZzAubO_g5rKQy8Fv@gondor.apana.org.au>
References: <6dc2b6afd9c4c5e9577acf2448cdcba41378e859.1730193800.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dc2b6afd9c4c5e9577acf2448cdcba41378e859.1730193800.git.lukas@wunner.de>

On Tue, Oct 29, 2024 at 11:24:57AM +0100, Lukas Wunner wrote:
> Commit 1e562deacecc ("crypto: rsassa-pkcs1 - Migrate to sig_alg backend")
> enforced that rsassa-pkcs1 sign/verify operations specify a hash
> algorithm.  That is necessary because per RFC 8017 sec 8.2, a hash
> algorithm identifier must be prepended to the hash before generating or
> verifying the signature ("Full Hash Prefix").
> 
> However the commit went too far in that it changed user space behavior:
> KEYCTL_PKEY_QUERY system calls now return -EINVAL unless they specify a
> hash algorithm.  Intel Wireless Daemon (iwd) is one application issuing
> such system calls (for EAP-TLS).
> 
> Closer analysis of the Embedded Linux Library (ell) used by iwd reveals
> that the problem runs even deeper:  When iwd uses TLS 1.1 or earlier, it
> not only queries for keys, but performs sign/verify operations without
> specifying a hash algorithm.  These legacy TLS versions concatenate an
> MD5 to a SHA-1 hash and omit the Full Hash Prefix:
> 
> https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ell/tls-suites.c#n97
> 
> TLS 1.1 was deprecated in 2021 by RFC 8996, but removal of support was
> inadvertent in this case.  It probably should be coordinated with iwd
> maintainers first.
> 
> So reinstate support for such legacy protocols by defaulting to hash
> algorithm "none" which uses an empty Full Hash Prefix.
> 
> If it is later on decided to remove TLS 1.1 support but still allow
> KEYCTL_PKEY_QUERY without a hash algorithm, that can be achieved by
> reverting the present commit and replacing it with the following patch:
> 
> https://lore.kernel.org/r/ZxalYZwH5UiGX5uj@wunner.de/
> 
> It's worth noting that Python's cryptography library gained support for
> such legacy use cases very recently, so they do seem to still be a thing.
> The Python developers identified IKE version 1 as another protocol
> omitting the Full Hash Prefix:
> 
> https://github.com/pyca/cryptography/issues/10226
> https://github.com/pyca/cryptography/issues/5495
> 
> The author of those issues, Zoltan Kelemen, spent considerable effort
> searching for test vectors but only found one in a 2019 blog post by
> Kevin Jones.  Add it to testmgr.h to verify correctness of this feature.
> 
> Examination of wpa_supplicant as well as various IKE daemons (libreswan,
> strongswan, isakmpd, raccoon) has determined that none of them seems to
> use the kernel's Key Retention Service, so iwd is the only affected user
> space application known so far.
> 
> Fixes: 1e562deacecc ("crypto: rsassa-pkcs1 - Migrate to sig_alg backend")
> Reported-by: Klara Modin <klarasmodin@gmail.com>
> Tested-by: Klara Modin <klarasmodin@gmail.com>
> Closes: https://lore.kernel.org/r/2ed09a22-86c0-4cf0-8bda-ef804ccb3413@gmail.com/
> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  crypto/asymmetric_keys/public_key.c |  2 +-
>  crypto/rsassa-pkcs1.c               | 20 +++++++++++---
>  crypto/testmgr.c                    |  6 ++++
>  crypto/testmgr.h                    | 55 +++++++++++++++++++++++++++++++++++++
>  4 files changed, 78 insertions(+), 5 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

