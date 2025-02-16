Return-Path: <keyrings+bounces-2402-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF83A37201
	for <lists+keyrings@lfdr.de>; Sun, 16 Feb 2025 05:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06A2916DCD6
	for <lists+keyrings@lfdr.de>; Sun, 16 Feb 2025 04:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67AC6199BC;
	Sun, 16 Feb 2025 04:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="NqyAZEBt"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBBA33C5;
	Sun, 16 Feb 2025 04:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739679607; cv=none; b=edE80+glctxLledS/grKbzqGJJX9+TmnBfTnTVRmQVXWufJqQ/6E7lFbpq7PcGqM2F0qHSaawaTDNYYlmIHCa1Qfd3g1MAr2gnMEd7j6eZ5ojBZD8GnOXy9L5Q6Uyg0N5dHwHZmFFtih0n0BiXC3YFFe8NTJZYtFoiql7e+JKjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739679607; c=relaxed/simple;
	bh=DsqDrNEtdjcTxfYRE6f7SWktdGL4KQtG4Im5+8xemL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYQLWswtLExZJgeoYVgF51SufJ86M6q+UgBtnt9oqI0oJhPj6O1eFGa8z5wRy6bN6tpOYjGgATxuXfFl47hH13zDRUQOK1YGSEDqdw5iMQn8adxBFdY4kz7dVjugAbSxiKSnzOCSqQzjlGIvLCU4cyAoXEyjznHvC3zct3VQOcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=NqyAZEBt; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=XhmDuuowFYAuW6k3dKrYQB8MedipeC1QmikJZqeF7wE=; b=NqyAZEBtEm1mbJGJwOnWw2lS46
	1B2ROWQuxpwArr2V01aSnH2tvbV/0TS4/2sKGMynAehc4745KPVtCi62nM31vmfwE7CxPWzNEOjWz
	UGU+PHBt+gDop/OE6Lq+vlouZy5L1R1rM/vovbC7ttTWJec+XB2hljW4clysYHeifQWznbZu75aL7
	tnXUM2L98ZjxSLHtV0vM+F63XxIbjGJhlWJCpg2DBD4zVR5mhioKo2H0bN5sO4e+h/ct6PCMbDe5a
	ttsyroy7OgFahQ69d0jxxYF5Ap0IpGrijACZxB6hGKybDdMfMExJ12TuYjgutp2QWd2Q/+PUP62Dj
	uj59VV/A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tjVvE-000gzK-0Y;
	Sun, 16 Feb 2025 12:19:46 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 16 Feb 2025 12:19:44 +0800
Date: Sun, 16 Feb 2025 12:19:44 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH v2 3/4] crypto: ecdsa - Fix enc/dec size reported by
 KEYCTL_PKEY_QUERY
Message-ID: <Z7FnYEN-OnR_-7sP@gondor.apana.org.au>
References: <cover.1738521533.git.lukas@wunner.de>
 <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
 <Z6h8L0D-CBhZUiVR@gondor.apana.org.au>
 <Z6iRssS26IOjWbfx@wunner.de>
 <Z6mwxUaS33EastB3@gondor.apana.org.au>
 <Z6pLRRJFOml8w61S@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6pLRRJFOml8w61S@wunner.de>

On Mon, Feb 10, 2025 at 07:53:57PM +0100, Lukas Wunner wrote:
>
> > > https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ell/key.c
> > > https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/src/eap-tls.c
> > 
> > Surely this doesn't use the private key part of the API, does it?
> 
> It does use the private key part:
> 
> It takes advantage of the kernel's Key Retention Service for EAP-TLS,
> which generally uses mutual authentication.  E.g. clients authenticate
> against a wireless hotspot.  Hence it does invoke KEYCTL_PKEY_SIGN and
> KEYCTL_PKEY_ENCRYPT (with private keys, obviously).

Does it really? I grepped the whole iwd git tree and the only
use of private key functionality is to check that it matches
the public key, IOW it encrypts a piece of text and then decrypts
it again to check whether they match.

It doesn't make use of any other private key functionality AFAICS.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

