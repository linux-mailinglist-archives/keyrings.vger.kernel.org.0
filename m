Return-Path: <keyrings+bounces-1851-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 814FB945E5B
	for <lists+keyrings@lfdr.de>; Fri,  2 Aug 2024 15:10:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AFCC81C21401
	for <lists+keyrings@lfdr.de>; Fri,  2 Aug 2024 13:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849EC1E3CD3;
	Fri,  2 Aug 2024 13:10:17 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from abb.hmeau.com (abb.hmeau.com [144.6.53.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D014514B09F;
	Fri,  2 Aug 2024 13:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=144.6.53.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722604217; cv=none; b=aPjfEqwU8BcgbAd+TUN6RGSBXeydWXJLtGo3st88u4VppY3KYXiMKYf+pegxqNbvfune8KIMskCTDhz/f9wJTe6xAlIecSdPR1zC2Q6jxe6pKENQoOXqAZAKt5hwqaybMeKPg3eDgSF13cvusG3idjDrEn3VvSfzT+CMqv1kCnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722604217; c=relaxed/simple;
	bh=lNmMTIAQ/HDewwgGO2ovUpr7LYJ2OiCvYDOBC6ZuQDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6tffz6MR/kHNZKx0pTU5Y/SwqE+f7TKroW//olhp5fuol5lHllj4f8W1YNLK2cBEMdj2xnKAF5coET4beIxA6STv7zNs3+WUd2gSVpIJKKOA9afN1RH615h9nQ2Oq6PvTJ3PonAyNnVGPI/db8RjK4Da7+IIjmfAa88+YZ+bBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au; spf=pass smtp.mailfrom=gondor.apana.org.au; arc=none smtp.client-ip=144.6.53.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gondor.apana.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gondor.apana.org.au
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1sZruL-002004-09;
	Fri, 02 Aug 2024 21:10:07 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 02 Aug 2024 21:10:06 +0800
Date: Fri, 2 Aug 2024 21:10:06 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jan Stancek <jstancek@redhat.com>
Cc: dhowells@redhat.com, dwmw2@infradead.org, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: [PATCH 0/3] sign-file,extract-cert: switch to PROVIDER API for
 OpenSSL >= 3.0
Message-ID: <Zqzarrjxrt8A5QE2@gondor.apana.org.au>
References: <cover.1720728319.git.jstancek@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1720728319.git.jstancek@redhat.com>

On Fri, Jul 12, 2024 at 09:11:13AM +0200, Jan Stancek wrote:
> The ENGINE interface has its limitations and it has been superseded
> by the PROVIDER API, it is deprecated in OpenSSL version 3.0.
> Some distros have started removing it from header files.
> 
> Update sign-file and extract-cert to use PROVIDER API for OpenSSL Major >= 3.
> 
> Tested on F39 with openssl-3.1.1, pkcs11-provider-0.5-2, openssl-pkcs11-0.4.12-4
> and softhsm-2.6.1-5 by using same key/cert as PEM and PKCS11 and comparing that
> the result is identical.
> 
> Jan Stancek (3):
>   sign-file,extract-cert: move common SSL helper functions to a header
>   sign-file,extract-cert: avoid using deprecated ERR_get_error_line()
>   sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
> 
>  MAINTAINERS          |   1 +
>  certs/Makefile       |   2 +-
>  certs/extract-cert.c | 138 +++++++++++++++++++++++--------------------
>  scripts/sign-file.c  | 134 +++++++++++++++++++++--------------------
>  scripts/ssl-common.h |  32 ++++++++++
>  5 files changed, 178 insertions(+), 129 deletions(-)
>  create mode 100644 scripts/ssl-common.h

Adding Cc to Jarkko Sakkinen <jarkko@kernel.org>.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

