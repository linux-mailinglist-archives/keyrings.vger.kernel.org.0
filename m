Return-Path: <keyrings+bounces-1253-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FD58C8516
	for <lists+keyrings@lfdr.de>; Fri, 17 May 2024 12:47:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7C1CB22017
	for <lists+keyrings@lfdr.de>; Fri, 17 May 2024 10:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BAD3A1C5;
	Fri, 17 May 2024 10:47:12 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA1539AC3;
	Fri, 17 May 2024 10:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715942832; cv=none; b=tyruvWAei41nXoa4Etus5X/IWDp4iF6FDCZyMWXVyx4zcrrG/XMvNUJxhl2xrtsT5ifXnmGXt31Mo0YmaMOZafBDvHVakqEEGBImXKZ8VlqwndDA5ldetRw6rVaZEIVz5dhYvonPVI+MVNojyoGBXj0x2rP+Mrjmi3UJB5wL8Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715942832; c=relaxed/simple;
	bh=rD/v+f8v5eg7rQmb3M5gIl2CMN2FhP35lP1M4MpdElA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qf0a0aoa+T6OdY2z9kpkmcEuJXpqcZ3UJ2MbnY9P/wQlP2LRb8W0+9xBtnt2iCGltvR/Au+4TmtMdU2tXx3LFTTiSldnnFNTZecjzs+zjAs65h8sOyoLB8DuPqVU9bGatQJWhnjLtdisuIckfWlcamNryjXEzTBcwZ6b1O4BUfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1s7v6z-00GjEm-1M;
	Fri, 17 May 2024 18:46:54 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 17 May 2024 18:46:54 +0800
Date: Fri, 17 May 2024 18:46:54 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Huaxin Lu <luhuaxin1@huawei.com>
Cc: David Howells <dhowells@redhat.com>,
	"David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, xiujianfeng@huawei.com,
	wangweiyang2@huawei.com, yiyang13@huawei.com,
	zhujianwei7@huawei.com, shenyining@huawei.com,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [PATCH] Move SM2 digest calculation to signature verification
Message-ID: <Zkc1nsG9H1ajhCl_@gondor.apana.org.au>
References: <20240513230718.447895-1-luhuaxin1@huawei.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240513230718.447895-1-luhuaxin1@huawei.com>

On Tue, May 14, 2024 at 07:07:18AM +0800, Huaxin Lu wrote:
> In the commit of e5221fa6a355 ("KEYS: asymmetric: Move sm2 code into
> x509_public_key"), the SM2 digest hashing is moved to the process of
> certificate loading. It cause the SM2 certificate chain validation
> failure. For example, when importing a SM2 IMA certificate (x509_ima.der)
> verified by the trusted kering. The import fails due to the wrong Z value
> calculating. Because he Z value should be calculated from the public key
> of the signing certificate, not from the public key of the certificate
> itself (reference: datatracker.ietf.org/doc/html/draft-shen-sm2-ecdsa-02).
> 
> This commit partially revert the previous commit. Restore SM2 digest value
> calculating into the signature verification process, and use the right
> information to calculate Z value and SM2 digest.
> 
> Fixes: e5221fa6a355 ("KEYS: asymmetric: Move sm2 code into x509_public_key")
> Signed-off-by: Huaxin Lu <luhuaxin1@huawei.com>
> ---
>  crypto/asymmetric_keys/public_key.c      | 57 ++++++++++++++++++++++++
>  crypto/asymmetric_keys/x509_public_key.c | 20 +++------
>  include/crypto/public_key.h              |  2 +
>  3 files changed, 64 insertions(+), 15 deletions(-)

Sorry about this.

> diff --git a/crypto/asymmetric_keys/x509_public_key.c b/crypto/asymmetric_keys/x509_public_key.c
> index 6a4f00be2..54738af7d 100644
> --- a/crypto/asymmetric_keys/x509_public_key.c
> +++ b/crypto/asymmetric_keys/x509_public_key.c
> @@ -32,6 +32,9 @@ int x509_get_sig_params(struct x509_certificate *cert)
>  
>  	pr_devel("==>%s()\n", __func__);
>  
> +	sig->data = cert->tbs;
> +	sig->data_size = cert->tbs_size;
> +
>  	sig->s = kmemdup(cert->raw_sig, cert->raw_sig_size, GFP_KERNEL);
>  	if (!sig->s)
>  		return -ENOMEM;
> @@ -64,21 +67,8 @@ int x509_get_sig_params(struct x509_certificate *cert)
>  
>  	desc->tfm = tfm;
>  
> -	if (strcmp(cert->pub->pkey_algo, "sm2") == 0) {
> -		ret = strcmp(sig->hash_algo, "sm3") != 0 ? -EINVAL :
> -		      crypto_shash_init(desc) ?:
> -		      sm2_compute_z_digest(desc, cert->pub->key,
> -					   cert->pub->keylen, sig->digest) ?:
> -		      crypto_shash_init(desc) ?:
> -		      crypto_shash_update(desc, sig->digest,
> -					  sig->digest_size) ?:
> -		      crypto_shash_finup(desc, cert->tbs, cert->tbs_size,
> -					 sig->digest);
> -	} else {
> -		ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
> -					  sig->digest);
> -	}
> -
> +	ret = crypto_shash_digest(desc, cert->tbs, cert->tbs_size,
> +				  sig->digest);

This (and the original code) breaks the blacklisting calculations
since those were dependent on the calculated hash.

There's also the issue of PKCS7 digests which probably should also
be modified for SM2.

I think we should probably just remove SM2 unless someone can
rearchitect this properly to support these digests.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

