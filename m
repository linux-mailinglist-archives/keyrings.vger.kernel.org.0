Return-Path: <keyrings+bounces-2456-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01807A645BF
	for <lists+keyrings@lfdr.de>; Mon, 17 Mar 2025 09:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2AB5718895F1
	for <lists+keyrings@lfdr.de>; Mon, 17 Mar 2025 08:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 460CA21D3E4;
	Mon, 17 Mar 2025 08:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="O2FV0QQp"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 218A7191499;
	Mon, 17 Mar 2025 08:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742200697; cv=none; b=SFQR4ll12xlo2PWtEb5jo8bJ4TAm4NauU6y992h3MtyozDIA8nDAc9ni7JBlAcnU7we5C9HYIPTTsvWgZnMfG4vbzRI0jlJdITSiafiSHivLhaCoWituHqtnBXVKwjHmMZ+JPWKQjEdh1bhpl6+0FhQeZcQ7XpJCtUzEJSRXdYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742200697; c=relaxed/simple;
	bh=dMzg72mEZDLFiIPXdcTBs7j1MpK5PLCIGj6NmCPAtqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hF8WdwdqIsvr1UJOwvTbkSWWH2c415MSmMMrbp4ikI6gukGlvO8iyzDfOVB77TJ31aYthok45gkrY8OpI2nd3t1qupZi+f+AM7sPZSCcgVvgg/+hBDVre8FOSfCKCE1pwPYUYFQIFidZ5mxu+fFrfIQL542zMk5ZTnhgO0HLCj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=O2FV0QQp; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VVEFn4AmBFVNIX018FJKpX39wiUCm2VR+K5QazM5gIg=; b=O2FV0QQpQfGXqFvK0HJCcdatDq
	ZAVxkgqyDlnpZeBs+8wF1TeQD1AyjhWoeokuyrnatlDLOBLT+dbuhMYFI5nf54zaAm+vvCWn9BACd
	tgFJm8SJNjWzC53E+GfHoBiFxipeYwdzB5L0C7+SDTvPnZ9Zf2t+hmdotnlJIP0Vxhfh8fH4aLJDG
	yi/96ONWeXJ1w37BtzJATRb6DjZim/BSfn5ReE1PdhwrkvYnK9dSEOL6Asr0mydep6KkEVpvliBcg
	AMAyIw3wNVyhpCiAVhGSclpmf2BBXR6iPUs3xsZz/HFgBv0URVq00ZfaT0b3V0dDK/35KLIKNcTAG
	w61H+ALg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tu5yb-007UcZ-2O;
	Mon, 17 Mar 2025 16:37:38 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 17 Mar 2025 16:37:37 +0800
Date: Mon, 17 Mar 2025 16:37:37 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: David Howells <dhowells@redhat.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Arnaud Ebalard <arno@natisbad.org>,
	Srujana Challa <schalla@marvell.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"Justin M. Forbes" <jforbes@fedoraproject.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH] [v2] crypto: lib/Kconfig: hide library options
Message-ID: <Z9ffUVmGlpXdh4jO@gondor.apana.org.au>
References: <20250314160543.605055-1-arnd@kernel.org>
 <2106120.1742200585@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2106120.1742200585@warthog.procyon.org.uk>

On Mon, Mar 17, 2025 at 08:36:25AM +0000, David Howells wrote:
> Arnd Bergmann <arnd@kernel.org> wrote:
> 
> > -	depends on CRYPTO_LIB_CHACHA20POLY1305 = y
> > +	select CRYPTO_LIB_CHACHA20POLY1305
> 
> Doesn't that allow CRYPTO_LIB_CHACHA20POLY1305=m?

Not unless BIG_KEYS is tristate or under a tristate.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

