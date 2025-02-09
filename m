Return-Path: <keyrings+bounces-2388-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC69A2DC79
	for <lists+keyrings@lfdr.de>; Sun,  9 Feb 2025 11:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BB5E3A631D
	for <lists+keyrings@lfdr.de>; Sun,  9 Feb 2025 10:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693EF18871F;
	Sun,  9 Feb 2025 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="VqAqzxxQ"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B79F18BB8E;
	Sun,  9 Feb 2025 10:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739096770; cv=none; b=JRuYySyrxNUFj2y9bQMLrTmXLG0V2fw93A9N9UOPHgG4R4+pMl2ZwB3FHEfhWKi9UC4VDzQJqZyPTL8EJJplTY+DBx6n3I4iDGbEdqejk8UQFIl527FYPXCmWL0h6RigqGYgErHPNEtC5iDoCaDy6DjbnEv1pj2eVl4/drepRo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739096770; c=relaxed/simple;
	bh=zvqt/cYk5BU9Wpk4t2tHo9LnhRcwGXrXij9RQfQE5rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ohxw3b5P4Mite54vxpruyz9IPYBowt/gWb3yfRkHNWSk8OWPZx64n/1xA4xNinRP2DEzdOUAKu21hvRdrV/CurrEIrpkvlxRCvdCleRy6eU3S3UxYQPHBAM5A22HX4NOYWZyvCOTkWLLkHFfkYzpqXwTSl9R7Mr3RLRaIiknPqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=VqAqzxxQ; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=QXJOXsjVXN+SAQ9ua9eZ+nl7a67YZj7BQtE76NrXEeU=; b=VqAqzxxQURbIquuXmFxDwr9vqO
	gBEirxG/uosjxc1VmxuyG2JalO6QnuVsWEMY7SXcPqyrKdn9wp0WpEZo9lwOZToZolkhC/EqiHgU7
	JtI/4pHBVdxFMaFKOrB3EhVL/3FvwcfHQruZESzzcVdKzIZpk39505KyI6s0wdGpFE8Sv3YfDjODM
	FXfEevabhHOXj1As/MG4OgSBDMpG9Z18K28xUgedF/Q0bp0eolYAS1bpQ1S4B9BhoU/5R3Ro6wjM3
	KBFjpPIqni/dhyCwoH/iCzVx8FVhduI4d1BfpJbW9DmndlVWoiIL4jPkCg+K75+5MXjhbrMblwK9m
	v/0oYM0g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1th4Ii-00GIsN-38;
	Sun, 09 Feb 2025 18:25:54 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sun, 09 Feb 2025 18:25:53 +0800
Date: Sun, 9 Feb 2025 18:25:53 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH v2 0/4] ecdsa KEYCTL_PKEY_QUERY fixes
Message-ID: <Z6iCsdOefphsb9bu@gondor.apana.org.au>
References: <cover.1738521533.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1738521533.git.lukas@wunner.de>

On Sun, Feb 02, 2025 at 08:00:50PM +0100, Lukas Wunner wrote:
> For ecdsa, KEYCTL_PKEY_QUERY reports nonsensical values for
> enc/dec size and (for P521 keys) also the key size.
> Second attempt at fixing them.
> 
> Changes v1 -> v2:
> 
> * New patch [2/4] to introduce DIV_ROUND_UP_POW2(), which avoids
>   integer overflows that may occur with DIV_ROUND_UP() (Herbert)
> 
> * Amend patch [4/4] to use DIV_ROUND_UP_POW2() (Herbert)
> 
> * Amend patch [4/4] to use BITS_PER_BYTE for clarity
> 
> Link to v1:
> 
>   https://lore.kernel.org/r/cover.1735236227.git.lukas@wunner.de
> 
> Lukas Wunner (4):
>   crypto: sig - Prepare for algorithms with variable signature size
>   crypto: ecdsa - Harden against integer overflows in DIV_ROUND_UP()
>   crypto: ecdsa - Fix enc/dec size reported by KEYCTL_PKEY_QUERY
>   crypto: ecdsa - Fix NIST P521 key size reported by KEYCTL_PKEY_QUERY
> 
>  crypto/asymmetric_keys/public_key.c | 22 +++++++++++-----------
>  crypto/ecc.c                        |  2 +-
>  crypto/ecdsa-p1363.c                |  8 +++++---
>  crypto/ecdsa-x962.c                 |  7 ++++---
>  crypto/ecdsa.c                      |  2 +-
>  crypto/ecrdsa.c                     |  2 +-
>  crypto/rsassa-pkcs1.c               |  4 ++--
>  crypto/sig.c                        |  9 +++++++--
>  crypto/testmgr.c                    |  7 ++++---
>  include/crypto/sig.h                |  7 ++++---
>  include/linux/math.h                | 12 ++++++++++++
>  11 files changed, 52 insertions(+), 30 deletions(-)
> 
> -- 
> 2.43.0

Patches 1-2 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

