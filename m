Return-Path: <keyrings+bounces-2640-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6667AA8B2C6
	for <lists+keyrings@lfdr.de>; Wed, 16 Apr 2025 09:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C93B44180C
	for <lists+keyrings@lfdr.de>; Wed, 16 Apr 2025 07:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E16A22D794;
	Wed, 16 Apr 2025 07:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b="YarukJTk"
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B9622DFF3;
	Wed, 16 Apr 2025 07:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790216; cv=none; b=pWY6HvUIhIeHyN+DMBTrEOnIWjJUvRuV8CT70AB+LsxPSawTBc3Tmy2I7H4dVpcTnYPcrFSQ73OQD9K55VsYxaUlEZcqOwGheQZsGvDNTaR5ywH+0BQ+kmxHcEOXE2MFW1Bsn5O875S0FilpaBN4ZHGfEBft1GNNQ1pHIgFqhlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790216; c=relaxed/simple;
	bh=i0xdJXOZ8yy3JN3d3zzzimM0riUW2ArgrrAEqg1BwUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YH+O9iHAdngq0nx8SRnB1QciN3avWDiF6sf7aiW+QweEf0Dqs5V63vn4B5udtRBdZdm+/k4YOBhtRTvLxxya3xrTukMmqR9YYfhnkUiCUfqnsc5IDOXDtWg1srBGzHZewEvgsoZlymRKVjBdOLhvz/LwQ73Jz6Pfq66OpZKbYwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; dkim=pass (2048-bit key) header.d=hmeau.com header.i=@hmeau.com header.b=YarukJTk; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Y6lQ12ewHqprPTbUSX5cbh8CXvvU3uLy0vsrn+BVpVM=; b=YarukJTknY5xVZZ3CONlPY/vcV
	Y1JdEpW/bf3dNAifnXW6XqPm1x7Tk+amLLa3trBFqpsAkoZUaCPiZZ4akVe4+40NpZZO9MgofFoqd
	8Q9ToLREvTb6wvX28Gun/RJkfK8ZGqQ3Cu8cnKVxyZItclA5GVSK+AV7K63LNiTbTWmZj6WuQqjjd
	5ivIXgPDsurqVEbnyXu0XzH57VO2cWNI/YtWTcdyEivkRzkkvu+h3PhwVQOohjmJniE99mg3uGd5o
	e9z1Z5ahLNiez15qKjl2utzZN7Bl29yM1B2UQNh9VrLLJ2jyioJnZaZuptQEjqo2b/nTzNHi0tclm
	ZRInC0ag==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u4xdN-00G7rY-21;
	Wed, 16 Apr 2025 15:56:38 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 16 Apr 2025 15:56:37 +0800
Date: Wed, 16 Apr 2025 15:56:37 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: "David S. Miller" <davem@davemloft.net>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org
Subject: Re: [PATCH RESEND v2 0/2] ecdsa KEYCTL_PKEY_QUERY fixes
Message-ID: <Z_9itcDC17b-B9Se@gondor.apana.org.au>
References: <cover.1744052920.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1744052920.git.lukas@wunner.de>

On Mon, Apr 07, 2025 at 09:32:40PM +0200, Lukas Wunner wrote:
> Here are two patches for ecdsa to avoid reporting nonsensical values
> for enc/dec size and -- for P521 keys -- also the key size in response
> to KEYCTL_PKEY_QUERY system calls.
> 
> Resending as requested by Herbert:
> 
>   https://lore.kernel.org/r/Z9fuCTAAOphOvEeH@gondor.apana.org.au/
> 
> Link to the original submission:
> 
>   https://lore.kernel.org/r/cover.1738521533.git.lukas@wunner.de/
> 
> Although these are technically fixes, the issues they address are
> not critical, so I recommend not applying as fixes for v6.15,
> but rather let the patches soak in linux-next for v6.16.
> 
> 
> Lukas Wunner (2):
>   crypto: ecdsa - Fix enc/dec size reported by KEYCTL_PKEY_QUERY
>   crypto: ecdsa - Fix NIST P521 key size reported by KEYCTL_PKEY_QUERY
> 
>  crypto/asymmetric_keys/public_key.c | 13 +++++++++----
>  crypto/ecdsa-p1363.c                |  6 ++++--
>  crypto/ecdsa-x962.c                 |  5 +++--
>  crypto/ecdsa.c                      |  2 +-
>  crypto/ecrdsa.c                     |  2 +-
>  crypto/rsassa-pkcs1.c               |  2 +-
>  crypto/sig.c                        |  9 +++++++--
>  include/crypto/sig.h                |  2 +-
>  8 files changed, 27 insertions(+), 14 deletions(-)
> 
> -- 
> 2.43.0

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

