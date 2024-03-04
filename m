Return-Path: <keyrings+bounces-780-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C34586FB47
	for <lists+keyrings@lfdr.de>; Mon,  4 Mar 2024 09:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CBE21C20E4C
	for <lists+keyrings@lfdr.de>; Mon,  4 Mar 2024 08:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C02D168CE;
	Mon,  4 Mar 2024 08:03:35 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74EB168BC;
	Mon,  4 Mar 2024 08:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709539415; cv=none; b=kkxcAZjAUFPYFmMrnyAu82+3HeHsbrzPwB4q/+8JHcUEIL4ibW2ypEI0crr3LWT2pawGFWYj2i2YHUKX2n6eANfdYhH+LJPJcBKVlxfZXQxoHxI1uM2ofrNSSZS4QSRgaLsw1Hgsp1hAaByusxlUg5+5K6l5yt926fKAVlnG4Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709539415; c=relaxed/simple;
	bh=T5jgrIKz3JGqSsAZKCKSlDW0J8eDWaAzD7RFjIXtMpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgKtbugXfqkm7kQjUIfulKu2ZbVuglSGNfACO2wDxkZF9AMjSSgFeSZ+dz+/Hf58eI+JI3tFdFsMW8bMo7jNcpvlj5qn1VeT0Z1RYkt3EoOgbiUtJSO4wa55BtoQu3MW30pCNHzSm+B93YWSSdDj9aWlsJRACtkgRDW6wVRLKTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rh3Hb-00331l-NU; Mon, 04 Mar 2024 16:02:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 04 Mar 2024 16:03:03 +0800
Date: Mon, 4 Mar 2024 16:03:03 +0800
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
Message-ID: <ZeWAN6+erOmKAnlj@gondor.apana.org.au>
References: <63cc7ab17a5064756e26e50bc605e3ff8914f05a.1708439875.git.lukas@wunner.de>
 <ZeGpmbawHkLNcwFy@gondor.apana.org.au>
 <20240302082751.GA25828@wunner.de>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240302082751.GA25828@wunner.de>

On Sat, Mar 02, 2024 at 09:27:51AM +0100, Lukas Wunner wrote:
>
> I've tried moving the assume(!IS_ERR()) to kmalloc() (which already is
> a static inline), but that increased total vmlinux size by 448 bytes.
> I was expecting pushback due to the size increase, hence kept the
> assume() local to x509_cert_parse().

OK if you've already tried it then I'll take this as it stands.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

