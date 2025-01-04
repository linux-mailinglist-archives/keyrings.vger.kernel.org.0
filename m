Return-Path: <keyrings+bounces-2337-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2E2A01420
	for <lists+keyrings@lfdr.de>; Sat,  4 Jan 2025 12:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B0A43A05C7
	for <lists+keyrings@lfdr.de>; Sat,  4 Jan 2025 11:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DE441922E6;
	Sat,  4 Jan 2025 11:31:32 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CB01917ED;
	Sat,  4 Jan 2025 11:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=176.9.242.62
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735990292; cv=none; b=PVe+5UO/0sOpQgJxH4RQJuGSqO0csWue2b0R2PCWeIRj0kb8SxwSDAHgfxhKgHM5o4ccwrYPFVv9behgEPMaQxv46bSRLINc1UyrcRfQ7/yMclJ2AFFKwtOjGNRPphMzmHF3xKwQ0mzkfoSGyyRalIz8oVGnWBJl12b1RDTt9AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735990292; c=relaxed/simple;
	bh=o29PTPzE685m3P5uDLzDbdJoc0zSugA1YPoIaIqc1dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPpJEloYuItTuSjDs5m/U9X3WGuTFlp6azr2BFPFLEQ84kciw6Q3hTLPpTboIr0Ho8V6uFzkkBiXHPX7wvO+tSn8sMBQb2X+lanmY9ReNt7u7pICKEZFHMXtTtAObWGIr2Opyagi6KB4TWlVHYORgCuBMk0Nqi0KWyzH2VteT24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=176.9.242.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id AC7F2100DE9C3;
	Sat,  4 Jan 2025 12:31:19 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 8CD5A5A0CE7; Sat,  4 Jan 2025 12:31:19 +0100 (CET)
Date: Sat, 4 Jan 2025 12:31:19 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH 3/3] crypto: ecdsa - Fix NIST P521 key size reported by
 KEYCTL_PKEY_QUERY
Message-ID: <Z3kcB6ouES8RzOwf@wunner.de>
References: <cover.1735236227.git.lukas@wunner.de>
 <a0e1aa407de754e03a7012049e45e25d7af10e08.1735236227.git.lukas@wunner.de>
 <Z3iElsILmoSu6FuC@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3iElsILmoSu6FuC@gondor.apana.org.au>

On Sat, Jan 04, 2025 at 08:45:10AM +0800, Herbert Xu wrote:
> On Thu, Dec 26, 2024 at 07:08:03PM +0100, Lukas Wunner wrote:
> >
> > diff --git a/crypto/ecdsa-p1363.c b/crypto/ecdsa-p1363.c
> > index eaae7214d69b..c4f458df18ed 100644
> > --- a/crypto/ecdsa-p1363.c
> > +++ b/crypto/ecdsa-p1363.c
> > @@ -21,7 +21,7 @@ static int ecdsa_p1363_verify(struct crypto_sig *tfm,
> >  			      const void *digest, unsigned int dlen)
> >  {
> >  	struct ecdsa_p1363_ctx *ctx = crypto_sig_ctx(tfm);
> > -	unsigned int keylen = crypto_sig_keysize(ctx->child);
> > +	unsigned int keylen = DIV_ROUND_UP(crypto_sig_keysize(ctx->child), 8);
> 
> This may overflow unnecessarily, please rewrite these as:
> 
> 	X / 8 + !!(X & 7)

Interesting.  Wouldn't it make sense to have a DIV_ROUND_UP_SAFE() macro
for cases like this?

I'd expect this version to actually be faster than DIV_ROUND_UP():
There's the extra logical AND, as well as the negation.
But the "n / d" and "!!(n & (d - 1))" can be computed in parallel.

Thanks,

Lukas

