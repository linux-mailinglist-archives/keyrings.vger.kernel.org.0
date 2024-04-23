Return-Path: <keyrings+bounces-1107-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5590D8AFB43
	for <lists+keyrings@lfdr.de>; Tue, 23 Apr 2024 23:58:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 40CE1B28BEE
	for <lists+keyrings@lfdr.de>; Tue, 23 Apr 2024 21:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36199143890;
	Tue, 23 Apr 2024 21:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gSsGxhlU"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A46B143888;
	Tue, 23 Apr 2024 21:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713909181; cv=none; b=Tc6HAmZf0ouRUYbFtwDp7S9bgywnOp8Vd1Cv87ZJfwxpCiZiWetprJa7x+KHmQ/NHB9IoMalGuEKZfItUgBL49V0jBm1/35g1Qh4xWWvqL6eirRSpcRSJ8Ps1awyLWYYRNhz/cbZvqeiGK8+c/QMkXOyHLtiEkdWKrx0VbW9ZoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713909181; c=relaxed/simple;
	bh=VI9vJ0IRZ6lI+KEsTPb5o3P8cf6HHHdQVQK4wYhZve8=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=OIKLUFrECAAtUbRwGqzQSTdypYnciw+jcXc65+CnE+l/N4EMfRA+eT+OxiDlpsbvusqKgCW7rcJWAO1pT4gbXKDoePTxW+S2JRzFoZ/a9Q98CFU4ONsMWlzxQRokyEFvTapcrF0cYVFUUB7qfDmTT3x4vWBBqLVz7kIc1LD3Axg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gSsGxhlU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11D7BC116B1;
	Tue, 23 Apr 2024 21:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713909180;
	bh=VI9vJ0IRZ6lI+KEsTPb5o3P8cf6HHHdQVQK4wYhZve8=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=gSsGxhlUFVVC7hL1LL3kRyf7tYonLBYSPbowy6Cz82oG4epxTZVRzHCJ7P6w+Jzhl
	 BgDOahHJuyiEq9l1aBDowxRD8aiDZgFp5YnxV+UBNq3h1gyZ3ankrNytFqV7h54axY
	 Ok5LdLbJyrNOB/sbr3BNw/zslfCVmiUiPisJnOYBfgE7yv+x5PvN/7P+HyC4FVw4Eh
	 4bziuBKnCdOcj2zOQzz2NJGtKmar4H3H1WvSA7yxFfx3Ky1UM2qWWfNRq3CaO+I+Yf
	 ciOg79fW5e0ppGHPRb+TNwIvbQhsWOuCdmrlkVBLS1OlI2qqcwvQ/FV/0u+E0+4bwf
	 B+BsG4dbucl7w==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Apr 2024 00:52:57 +0300
Message-Id: <D0RU3IIERGLU.28NAI9TV40GOG@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, <linux-crypto@vger.kernel.org>,
 <keyrings@vger.kernel.org>
Cc: <stable@vger.kernel.org>, "Simo Sorce" <simo@redhat.com>, "David
 Howells" <dhowells@redhat.com>, "kernel test robot" <oliver.sang@intel.com>
Subject: Re: [PATCH] KEYS: asymmetric: Add missing dependencies of
 FIPS_SIGNATURE_SELFTEST
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240422211041.322370-1-ebiggers@kernel.org>
In-Reply-To: <20240422211041.322370-1-ebiggers@kernel.org>

On Tue Apr 23, 2024 at 12:10 AM EEST, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> Since the signature self-test uses RSA and SHA-256, it must only be
> enabled when those algorithms are enabled.  Otherwise it fails and
> panics the kernel on boot-up.
>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202404221528.51d75177-lkp@intel.co=
m
> Fixes: 3cde3174eb91 ("certs: Add FIPS selftests")
> Cc: stable@vger.kernel.org
> Cc: Simo Sorce <simo@redhat.com>
> Cc: David Howells <dhowells@redhat.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  crypto/asymmetric_keys/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kcon=
fig
> index 59ec726b7c77..4abc58c55efa 100644
> --- a/crypto/asymmetric_keys/Kconfig
> +++ b/crypto/asymmetric_keys/Kconfig
> @@ -83,7 +83,9 @@ config FIPS_SIGNATURE_SELFTEST
>  	  for FIPS.
>  	depends on KEYS
>  	depends on ASYMMETRIC_KEY_TYPE
>  	depends on PKCS7_MESSAGE_PARSER=3DX509_CERTIFICATE_PARSER
>  	depends on X509_CERTIFICATE_PARSER
> +	depends on CRYPTO_RSA
> +	depends on CRYPTO_SHA256
> =20
>  endif # ASYMMETRIC_KEY_TYPE
>
> base-commit: ed30a4a51bb196781c8058073ea720133a65596f

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

Also, picked.

BR, Jarkko

