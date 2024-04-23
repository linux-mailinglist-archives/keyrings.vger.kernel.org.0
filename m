Return-Path: <keyrings+bounces-1106-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3FC8AFB26
	for <lists+keyrings@lfdr.de>; Tue, 23 Apr 2024 23:54:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE1232826F9
	for <lists+keyrings@lfdr.de>; Tue, 23 Apr 2024 21:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5518A143882;
	Tue, 23 Apr 2024 21:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFoSEQnX"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25840143891;
	Tue, 23 Apr 2024 21:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713909072; cv=none; b=iU7a0qfpOLr9xvqdU+DJ002j4ROoXbBYwSh4GVmVVS6csN+Kj9EYzDjRJHgFR5s61qnaiie72YGXLjj83uKU8PGf5RLFZ3RsPit6cVFtaMaJIn3GsG7gP8zeVda04prXet46+H9sPeYxZEVwOo2WwrXQrVMYxV1tDWJ3Dgo/UAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713909072; c=relaxed/simple;
	bh=emWLwb5jdCnlsGspcphS/8oJQo447KDb+Hn14uzpT1c=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=f3hVLZFSKl7U6pU6rpa7OZW4kya+7OZ05vcxBXcqccxPOzdgsxQSztaBd+f6c+EH6FD/+ZWCuKKDaefpuvq7Y8kN0cEQdydhB/4gv4hNkqsBR/texGRDTdu9aLo4+YMa7aBwEBC+FAuEH8xK3PC1Q9t3PTbRI+VxCL/ZT930W2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFoSEQnX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4AF7C116B1;
	Tue, 23 Apr 2024 21:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713909071;
	bh=emWLwb5jdCnlsGspcphS/8oJQo447KDb+Hn14uzpT1c=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=BFoSEQnXfaQGzX/SGhWsYxxlIKdZ590t5fVGBG5muRsp31n/C+SMH73ufcCRcyhOe
	 Jm8YOTtdgix1Vmq8kzu5NDfLHX1w6VhrgVbWza2/BuqqHul9FW0lkhJNkCX4dFRdcS
	 aM5obkGhL3nHZ2JaPj2N4LhyDmvX1qri22G9WWxewlqbM3vc5fmkDh9lnCYyr4ri5X
	 i2S0qOqQmdEOZCu2hn/qkhffW4lO4UxCMEQhpqqx0o+DlwcrEVz9VhhEapvA5/7aTM
	 XlcqP6h/gaHQ+oGghosRvwceXu5XjAGew9EYHoYyBhoZq0GpUq2lXUmfi+F8pMkz1F
	 gdW2quN9W1x6w==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Apr 2024 00:51:09 +0300
Message-Id: <D0RU24TWLNT0.2HVLT6RMIU5YT@kernel.org>
Cc: <stable@vger.kernel.org>
Subject: Re: [PATCH] KEYS: asymmetric: Add missing dependency on CRYPTO_SIG
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Eric Biggers"
 <ebiggers@kernel.org>, <keyrings@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <20240422210845.319819-1-ebiggers@kernel.org>
 <D0RU10Q41UA3.XC5J8UBJUEM4@kernel.org>
In-Reply-To: <D0RU10Q41UA3.XC5J8UBJUEM4@kernel.org>

On Wed Apr 24, 2024 at 12:49 AM EEST, Jarkko Sakkinen wrote:
> On Tue Apr 23, 2024 at 12:08 AM EEST, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> >
> > Make ASYMMETRIC_PUBLIC_KEY_SUBTYPE select CRYPTO_SIG to avoid build
> > errors like the following, which were possible with
> > CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy && CONFIG_CRYPTO_SIG=3Dn:
> >
> >     ld: vmlinux.o: in function `public_key_verify_signature':
> >     (.text+0x306280): undefined reference to `crypto_alloc_sig'
> >     ld: (.text+0x306300): undefined reference to `crypto_sig_set_pubkey=
'
> >     ld: (.text+0x306324): undefined reference to `crypto_sig_verify'
> >     ld: (.text+0x30636c): undefined reference to `crypto_sig_set_privke=
y'
> >
> > Fixes: 63ba4d67594a ("KEYS: asymmetric: Use new crypto interface withou=
t scatterlists")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  crypto/asymmetric_keys/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kc=
onfig
> > index 59ec726b7c77..3f089abd6fc9 100644
> > --- a/crypto/asymmetric_keys/Kconfig
> > +++ b/crypto/asymmetric_keys/Kconfig
> > @@ -13,10 +13,11 @@ if ASYMMETRIC_KEY_TYPE
> >  config ASYMMETRIC_PUBLIC_KEY_SUBTYPE
> >  	tristate "Asymmetric public-key crypto algorithm subtype"
> >  	select MPILIB
> >  	select CRYPTO_HASH_INFO
> >  	select CRYPTO_AKCIPHER
> > +	select CRYPTO_SIG
> >  	select CRYPTO_HASH
> >  	help
> >  	  This option provides support for asymmetric public key type handlin=
g.
> >  	  If signature generation and/or verification are to be used,
> >  	  appropriate hash algorithms (such as SHA-1) must be available.
> >
> > base-commit: ed30a4a51bb196781c8058073ea720133a65596f
>
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
>
> BR, Jarkko

Picked.

BR, Jarkko

