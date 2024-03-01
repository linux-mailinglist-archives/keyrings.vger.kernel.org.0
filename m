Return-Path: <keyrings+bounces-755-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA6586DF05
	for <lists+keyrings@lfdr.de>; Fri,  1 Mar 2024 11:11:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBD821C2084D
	for <lists+keyrings@lfdr.de>; Fri,  1 Mar 2024 10:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E5D6A8BC;
	Fri,  1 Mar 2024 10:11:00 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424DB69D0B;
	Fri,  1 Mar 2024 10:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709287859; cv=none; b=eotGCurQFMTnwkqfjTpWdgUz+ceTGi3/UKeSA8Lt7S1GRi4SD1hLQaMWrONgE7z0horBU34WxvI1p9ZNoKy9Ywj1eOoxwZlF5Z41/lKbl2Je6h8hk7ek1h35Uy8xVQJnt9hy32EukbBuPDAEBFsiblp1WwKfca3s28+NKoutR6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709287859; c=relaxed/simple;
	bh=EzcF9ZQTKezu3ctCnmIcVfuJobPV12/FVjM3b5XLDeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAbXqBj9/nOVH0mn4T3TOjrFKAOCRQeuQBRt8OAY3vBR54Y0eO8biE3quGgtlnazjNyTpPcodcqE37ik2ZDMe085WOSFCi1Q2rg7yy/L/HkmKQYvMt2bJH+/whtW4Khl6D2kWnEtcXVjjYEghx/4sy8CRl8MOB2XlNPWWQu3xDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rfzqM-002Gfn-7x; Fri, 01 Mar 2024 18:10:19 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 01 Mar 2024 18:10:33 +0800
Date: Fri, 1 Mar 2024 18:10:33 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Lukas Wunner <lukas@wunner.de>
Cc: David Howells <dhowells@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v3] X.509: Introduce scope-based x509_certificate
 allocation
Message-ID: <ZeGpmbawHkLNcwFy@gondor.apana.org.au>
References: <63cc7ab17a5064756e26e50bc605e3ff8914f05a.1708439875.git.lukas@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63cc7ab17a5064756e26e50bc605e3ff8914f05a.1708439875.git.lukas@wunner.de>

On Tue, Feb 20, 2024 at 04:10:39PM +0100, Lukas Wunner wrote:
>
> In x509_cert_parse(), add a hint for the compiler that kzalloc() never
> returns an ERR_PTR().  Otherwise the compiler adds a gratuitous IS_ERR()
> check on return.  Introduce a handy assume() macro for this which can be
> re-used elsewhere in the kernel to provide hints for the compiler.

Would it be possible to move the use of assume into the kzalloc
declaration instead? Perhaps by turning it into a static inline
wrapper that does the "assume"?

Otherwise as time goes on we'll have a proliferation of these
"assume"s all over the place.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

