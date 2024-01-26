Return-Path: <keyrings+bounces-503-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5EC83D3FA
	for <lists+keyrings@lfdr.de>; Fri, 26 Jan 2024 06:37:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B64451C22247
	for <lists+keyrings@lfdr.de>; Fri, 26 Jan 2024 05:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75819BA56;
	Fri, 26 Jan 2024 05:37:55 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FE8BA33;
	Fri, 26 Jan 2024 05:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706247475; cv=none; b=iU1Mh5OnUw2YADF6+1ER8fKhSQK13V3XBFQElddn8zN4gFK2zejq+YVT5F/QwOrlhLqsSFOMjhhdO9WhwprqtV+azw6eI9g8a09p/P6Ti0SSX5CoFtl5+Dw+UJ5+JeB/Q7PIbYt77obPcjLWScylpSSeqSQ0I5CBLLigMs2NDIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706247475; c=relaxed/simple;
	bh=S0K5VFn4XkEj6LucTmHHkt4xJ4B4YZkO2Nf6C4KQQ8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKhyTrOWaG6tJvfXKGYKbDId2ZaypOMbu27Bq3cRDOMMrbhmFnTZtgyk22bUe5xTEsoQm3OGoFfuv+/8Uat0Y1lYPZ/bd/qbtyNm74abL558FgZne2CSz7e2VcdmuC7bUIKbGuwJEsBLdrii3DvRHi1hpPV35tMIUN1wXan+O9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rTEtv-006Chw-FO; Fri, 26 Jan 2024 13:37:16 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 26 Jan 2024 13:37:28 +0800
Date: Fri, 26 Jan 2024 13:37:28 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: David Howells <dhowells@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] X.509: Introduce scope-based x509_certificate allocation
Message-ID: <ZbNFGC4q0Yy6RPNe@gondor.apana.org.au>
References: <70ecd3904a70d2b92f8f1e04365a2b9ce66fac25.1705857475.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70ecd3904a70d2b92f8f1e04365a2b9ce66fac25.1705857475.git.lukas@wunner.de>

On Sun, Jan 21, 2024 at 06:50:39PM +0100, Lukas Wunner wrote:
>
> * x509_cert_parse() now checks that "cert" is not an ERR_PTR() before
>   calling x509_free_certificate() at end of scope.  The compiler doesn't
>   know that kzalloc() never returns an ERR_PTR().

How about moving the IS_ERR_OR_NULL check into x509_free_certificate
itself so that you can always call it?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

