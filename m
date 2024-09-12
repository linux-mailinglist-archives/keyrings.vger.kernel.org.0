Return-Path: <keyrings+bounces-2016-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 503969763E9
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 10:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D507BB20F3E
	for <lists+keyrings@lfdr.de>; Thu, 12 Sep 2024 08:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44404189BA5;
	Thu, 12 Sep 2024 08:05:27 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6C51A28D;
	Thu, 12 Sep 2024 08:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.95.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726128327; cv=none; b=Q7//6EOWrFFdCoTfXNoyHRnbF5HREsPuYRr6G50e0Syo8sgmL8+d3htSHjLkTdaCY97AmHeBJ6FOAemvYcZaifJVAlIW8yPAqrG2vjIO8Zx4d5oQgbch387zVRMdQgfcMD6mFkwfq16U7LuvCpi7jWPTw4LKJmJ8u1tL7bRfENI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726128327; c=relaxed/simple;
	bh=Hd2tgksVtqJPWA8GE5K81oYFp3xiYMV2aJa8RMwDjrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qz30Y6xVZVWhOt+ajovTTPBpLGyZ7vJVlVADvixD+fH89GoOyEkvZofttIBdCcFGfsu1VIok737w/LQfK6CDRVCbn0/OSi5EPb7F36htapbk8hVKyRTb2a/YJGwS0r85T0CuK1GLjSlFpkL3kQhC7WhfcfAanV64uUpZIHCTQx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.95.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 7407C30003C9C;
	Thu, 12 Sep 2024 10:05:22 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 51D341252AE; Thu, 12 Sep 2024 10:05:22 +0200 (CEST)
Date: Thu, 12 Sep 2024 10:05:22 +0200
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
Subject: Re: [PATCH v2 04/19] crypto: ecrdsa - Migrate to sig_alg backend
Message-ID: <ZuKgwrocKlI5Qk8t@wunner.de>
References: <cover.1725972333.git.lukas@wunner.de>
 <45acc8db555f80408c8b975771da34c569da45da.1725972334.git.lukas@wunner.de>
 <D43GTXWLMJ2E.258ZI34E5JRK6@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D43GTXWLMJ2E.258ZI34E5JRK6@kernel.org>

On Wed, Sep 11, 2024 at 03:49:07PM +0300, Jarkko Sakkinen wrote:
> On Tue Sep 10, 2024 at 5:30 PM EEST, Lukas Wunner wrote:
> > A sig_alg backend has just been introduced with the intent of moving all
> > asymmetric sign/verify algorithms to it one by one.
> >
> > Migrate ecrdsa.c to the new backend.
[...]
> >  	if (!ctx->curve ||
> >  	    !ctx->digest ||
> > -	    !req->src ||
> > +	    !src ||
> > +	    !digest ||
> >  	    !ctx->pub_key.x ||
> > -	    req->dst_len != ctx->digest_len ||
> > -	    req->dst_len != ctx->curve->g.ndigits * sizeof(u64) ||
> > +	    dlen != ctx->digest_len ||
> > +	    dlen != ctx->curve->g.ndigits * sizeof(u64) ||
> >  	    ctx->pub_key.ndigits != ctx->curve->g.ndigits ||
> > -	    req->dst_len * 2 != req->src_len ||
> > -	    WARN_ON(req->src_len > sizeof(sig)) ||
> > -	    WARN_ON(req->dst_len > sizeof(digest)))
> > +	    dlen * 2 != slen ||
> > +	    WARN_ON(slen > ECRDSA_MAX_SIG_SIZE) ||
> > +	    WARN_ON(dlen > STREEBOG512_DIGEST_SIZE))
> 
> Despite being migration I don't see no point recycling use of WARN_ON()
> here, given panic_on_warn kernel command-line flag.
> 
> If you want to print to something, please do separate checks and use
> pr_warn() instead at most.

The object of the patch is to migrate ecrdsa.c to sig_alg with no
behavioral change.

If you feel the WARN_ON() is uncalled for, please submit a cleanup
patch.

Thanks,

Lukas

