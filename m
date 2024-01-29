Return-Path: <keyrings+bounces-509-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D39583FC3E
	for <lists+keyrings@lfdr.de>; Mon, 29 Jan 2024 03:32:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FFCB1C20C9C
	for <lists+keyrings@lfdr.de>; Mon, 29 Jan 2024 02:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48C23F4E2;
	Mon, 29 Jan 2024 02:32:35 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E93DDA1;
	Mon, 29 Jan 2024 02:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706495555; cv=none; b=CnPAQwWATR7DgYQTdGGJDk5N5LjsxWaKRfNQYVe4eWIwjEaKsE+uUAEVundutT8g+OQwQR2kpnjUxALBxVbcOL42AYFVoZFp3pk61b6GH/jk3VFbeM6Wj9DysDAJJusK77y8fg3tIoK2q1g2Gy4sxurK+FJsH3gv8WEe8rRXOF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706495555; c=relaxed/simple;
	bh=qBGpcZPu/3sex15m9xWirKpdLjj/RrctxEN2gU1w3j4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lnIruYF8EJNXn8u8ZNmYq8rHViHwBFvE/IvCyUI2MfiVW3bAjHvJSQo4jyrSKisaviSWnCBQoXGqyXfy5AU1G2drCr+ESg+Zue4DFF6lnU/XXMmNSBzQlPOjkxA/Ib+F6ZEkIxVdHOI/ngK9JoSDe/SUjP09n9badpTBFPgms0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rUHRC-006zi2-4t; Mon, 29 Jan 2024 10:31:55 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 29 Jan 2024 10:32:07 +0800
Date: Mon, 29 Jan 2024 10:32:07 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lukas Wunner <lukas@wunner.de>, David Howells <dhowells@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] X.509: Introduce scope-based x509_certificate allocation
Message-ID: <ZbcOJ1sJMny95CzY@gondor.apana.org.au>
References: <70ecd3904a70d2b92f8f1e04365a2b9ce66fac25.1705857475.git.lukas@wunner.de>
 <ZbNFGC4q0Yy6RPNe@gondor.apana.org.au>
 <ZbZXb7Bu1PrEMHrL@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZbZXb7Bu1PrEMHrL@smile.fi.intel.com>

On Sun, Jan 28, 2024 at 03:32:31PM +0200, Andy Shevchenko wrote:
>
> But why? The cleanup.h insists on having an explicit check, so call will be
> ignored completely on the branches when it's not needed. This is the pattern
> that is currently being used. Why do we need a deviation here?

Well he was talking about eliminating duplicate checks, and one
way of doing that is by moving it into the cleanup function.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

