Return-Path: <keyrings+bounces-2014-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78285976386
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 09:54:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AF7A1F22A6F
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 07:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1018C188A00;
	Thu, 12 Sep 2024 07:54:14 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6D41552E1;
	Thu, 12 Sep 2024 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726127654; cv=none; b=Oyf5w+ks+5e7J6ACCkjzwBcjWGp/KAuWsn3g7M3x2SCCMrriFGBw21fIzIgOtfthpgj6n7K/qW1Z3btzrD8I/lhbphb5RNBnLzoNnvfMAdaQblyg7pRueRRgPsaepZVk5kT2PCHCLHBu03/Cx9MDo81B75kbJ30GIIpbtUqVAqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726127654; c=relaxed/simple;
	bh=r71T/CXhTbDb0+b0A3QqRAws5X6TEZjZPKCpaLnDh9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rBjDXhZWCYpAAWMp6BAa4IBQ8HOV9wq3thcjsLD//4EtsAdq42S1i2AHhw/vqEC3dq2Bzt8KqnL6it30Ddlw4cOR+SsEY6UaXRvkP+GQz7eSJW1n2n79xFneZsrigzdiyLQ0d1ZDEIEU6JnEqmp8n11PEk7CgByCVILHAESUoxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id CCBEE300002D2;
	Thu, 12 Sep 2024 09:54:06 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id B7B2C1252A6; Thu, 12 Sep 2024 09:54:06 +0200 (CEST)
Date: Thu, 12 Sep 2024 09:54:06 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Biggers <ebiggers@google.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	Tadeusz Struk <tstruk@gigaio.com>,
	David Howells <dhowells@redhat.com>,
	Andrew Zaborowski <andrew.zaborowski@intel.com>,
	Saulo Alessandre <saulo.alessandre@tse.jus.br>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Marek Behun <kabel@kernel.org>,
	Varad Gautam <varadgautam@google.com>,
	Stephan Mueller <smueller@chronox.de>,
	Denis Kenzior <denkenz@gmail.com>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org
Subject: Re: [PATCH v2 02/19] crypto: sig - Introduce sig_alg backend
Message-ID: <ZuKeHmeMRyXZHyTK@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
 <688e92e7db6f2de1778691bb7cdafe3bb39e73c6.1725972334.git.lukas@wunner.de>
 <D43G1XSAWTQF.OG1Z8K18DUVF@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D43G1XSAWTQF.OG1Z8K18DUVF@kernel.org>

On Wed, Sep 11, 2024 at 03:12:33PM +0300, Jarkko Sakkinen wrote:
> >  static int crypto_sig_init_tfm(struct crypto_tfm *tfm)
> >  {
> >  	if (tfm->__crt_alg->cra_type != &crypto_sig_type)
> >  		return crypto_init_akcipher_ops_sig(tfm);
> >  
> > +	struct crypto_sig *sig = __crypto_sig_tfm(tfm);
> > +	struct sig_alg *alg = crypto_sig_alg(sig);
> > +
> > +	if (alg->exit)
> > +		sig->base.exit = crypto_sig_exit_tfm;
> > +
> > +	if (alg->init)
> > +		return alg->init(sig);
> 
> 1. alg->exit == NULL, alg->init == NULL
> 2. alg->exit != NULL, alg->init == NULL
> 3. alg->exit == NULL, alg->init != NULL
> 
> Which of the three are legit use of the API and which are not?

All three are possible.  Same as crypto_akcipher_init_tfm().

Thanks,

Lukas

