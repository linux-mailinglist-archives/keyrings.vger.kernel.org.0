Return-Path: <keyrings+bounces-1867-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D90F948BCD
	for <lists+keyrings@lfdr.de>; Tue,  6 Aug 2024 10:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45C831C20BF3
	for <lists+keyrings@lfdr.de>; Tue,  6 Aug 2024 08:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DFB31BD505;
	Tue,  6 Aug 2024 08:58:46 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53721BD006;
	Tue,  6 Aug 2024 08:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722934726; cv=none; b=h746gjd0fqT/Cx1RdaZqNNFbpodH9jynoLmzOKoCqu5b9tGd1eWptFEfcvxj5tKd5R1YAPV1RmfrY1dwu7tSJSzB8JaOd+w1lwWekMxNMaH8Jg5ALHIF9jco9IEFxkr9y7u7jY7bDTk0VMqe3o8D7pUTkUGHWjJ5qT7zg/FrGpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722934726; c=relaxed/simple;
	bh=A3jT79yax7B4x+CCo8lOx9zIktZJhYbb2Jpf2FLQKSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGNTfm+KXVDlgNOfUXKIjIXaU6RpSHc6XPxCG5KfbQvuXhMp73phh49cOzywobNfyXJToMV2Xu3tpuH9sl+NnuBuOzC9aXTgp5+kgjyR3ZIf+ZqfzifbuXd3uhpSGN2FYC6/Ce8gq5zb+FoukjlJ5evvsPG/cjI+igeWne3xm2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1sbFso-002k7B-07;
	Tue, 06 Aug 2024 16:58:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 06 Aug 2024 16:58:15 +0800
Date: Tue, 6 Aug 2024 16:58:15 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	Tadeusz Struk <tstruk@gigaio.com>,
	Andrew Zaborowski <andrew.zaborowski@intel.com>,
	Saulo Alessandre <saulo.alessandre@tse.jus.br>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH 2/5] crypto: akcipher - Drop usage of sglists for verify
 op
Message-ID: <ZrHlpz4qnre0zWJO@gondor.apana.org.au>
References: <cover.1722260176.git.lukas@wunner.de>
 <eb13c292f60a61b0af14f0c5afd23719b3cb0bd7.1722260176.git.lukas@wunner.de>
 <ZrG6w9wsb-iiLZIF@gondor.apana.org.au>
 <ZrHft0G-1BTmhF0V@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZrHft0G-1BTmhF0V@wunner.de>

On Tue, Aug 06, 2024 at 10:32:55AM +0200, Lukas Wunner wrote:
>
> I'm looking through the code right now to understand what would be
> necessary to get there.

Great :)

> One issue I see is an algorithm name collision in rsa-pkcs1pad.c:
> I think I'd have to register two instances in pkcs1pad_create(),
> an akcipher_instance and a sig_instance.

Since there is precisely one user -- crypto/asymmetric, we could
simply rename the sig version of pkcs1pad to something else without
causing too much churn.  Perhaps leave the akcipher pkcs1pad as is
and create a new template for sig called pkcs1sig.

So you could do it in a little series without breaking bisection:

1) Add sig type and then create the pkcs1sig template;
2) Switch to pkcs1sig when signing in crypto/asymmetric;
3) Remove now-unused signing code from pkcs1pad.

> The last couple of days I've been contemplating amending
> struct akcipher_alg with additional callbacks to get the
> max_sig_size and max_data_size.  For RSA it's the same as
> the keysize (which is available through the existing ->max_size
> callback), but for ECDSA it's different depending on the
> template.  Adding those new callbacks to a new struct sig_alg
> would be cleaner of course than shoehorning them into struct
> akcipher_alg.

Yes having a separate alg for sig is definitely where we want to
be since there is very little that the two types actually share.

The only place where they currently intersect is pkcs1pad :)

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

