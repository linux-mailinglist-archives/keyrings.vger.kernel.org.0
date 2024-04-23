Return-Path: <keyrings+bounces-1105-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A07338AFB22
	for <lists+keyrings@lfdr.de>; Tue, 23 Apr 2024 23:54:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4CDFA1F235F7
	for <lists+keyrings@lfdr.de>; Tue, 23 Apr 2024 21:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 635391420BE;
	Tue, 23 Apr 2024 21:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FKkUIN+z"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C7785274;
	Tue, 23 Apr 2024 21:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713908985; cv=none; b=Xe10WZGq9haEvb6iGgHwb+sa7nMpOQf2JQkTfuy3wxogHy5xszeFkTJ7EB5phQtI6olhu46rf8WMfO3j33tclrvFqQh94qo2BNwH+JoIY5wUmBkRTJrNsvuK+JCRkcTZSPFOHHMewv53j162EfSu1scDHGDL4r5A2c92Vy+P2/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713908985; c=relaxed/simple;
	bh=TmB6hmZXahGX5L+QzR3KbzuOF6UB83VPnFT1MMnTUcM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=J8b6PDm5seLgWxQ/soby1txX6V7PkKD3mCbnO0n3AhXPxlCKPJz8YYyWjrN1LEdcaDxhrPHI8fAB10wjP3du9yDqD+w8GSU/SJHBl/PLoAfCVpxoZIrP3LmXG2zoIcpCfFHzHe3pRJTKivj0f9QS0yCVA8/bQt1c1/TOgKi9FM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FKkUIN+z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6528C116B1;
	Tue, 23 Apr 2024 21:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713908984;
	bh=TmB6hmZXahGX5L+QzR3KbzuOF6UB83VPnFT1MMnTUcM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=FKkUIN+zblMk3Knjt+r5foOCN8t7pGmqmYLI3oCjbIVdlfb2t+ObNOYz0C3TcMRne
	 C9uVKzuwfDtcnjUJFpT8nB0nr8ruiTuXjzi9L32AlP7XLI78uRayI9NBsGN5FI+ttZ
	 xD1rfXqJlyi7bR5BEPf8Mpw9sqJ5RT3mpEftL8vuGhKZfUdL8xznO6fsI96N36NJUC
	 vbUw++07vZtYqvao5gGAF4hXyIq6JnFSdcZtktfSDqV4XNjVWqo6JKt0rzt4CF9SnB
	 L7pq4phSmYDK/ol6j4w+GIBzG2Rw24NFS97qe5U2739uwQc/9+LqgHWcu8F/qFrpgk
	 9NB8sl+QMYzqQ==
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 24 Apr 2024 00:49:42 +0300
Message-Id: <D0RU10Q41UA3.XC5J8UBJUEM4@kernel.org>
Cc: <stable@vger.kernel.org>
Subject: Re: [PATCH] KEYS: asymmetric: Add missing dependency on CRYPTO_SIG
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>, <keyrings@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>
X-Mailer: aerc 0.17.0
References: <20240422210845.319819-1-ebiggers@kernel.org>
In-Reply-To: <20240422210845.319819-1-ebiggers@kernel.org>

On Tue Apr 23, 2024 at 12:08 AM EEST, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> Make ASYMMETRIC_PUBLIC_KEY_SUBTYPE select CRYPTO_SIG to avoid build
> errors like the following, which were possible with
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy && CONFIG_CRYPTO_SIG=3Dn:
>
>     ld: vmlinux.o: in function `public_key_verify_signature':
>     (.text+0x306280): undefined reference to `crypto_alloc_sig'
>     ld: (.text+0x306300): undefined reference to `crypto_sig_set_pubkey'
>     ld: (.text+0x306324): undefined reference to `crypto_sig_verify'
>     ld: (.text+0x30636c): undefined reference to `crypto_sig_set_privkey'
>
> Fixes: 63ba4d67594a ("KEYS: asymmetric: Use new crypto interface without =
scatterlists")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  crypto/asymmetric_keys/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kcon=
fig
> index 59ec726b7c77..3f089abd6fc9 100644
> --- a/crypto/asymmetric_keys/Kconfig
> +++ b/crypto/asymmetric_keys/Kconfig
> @@ -13,10 +13,11 @@ if ASYMMETRIC_KEY_TYPE
>  config ASYMMETRIC_PUBLIC_KEY_SUBTYPE
>  	tristate "Asymmetric public-key crypto algorithm subtype"
>  	select MPILIB
>  	select CRYPTO_HASH_INFO
>  	select CRYPTO_AKCIPHER
> +	select CRYPTO_SIG
>  	select CRYPTO_HASH
>  	help
>  	  This option provides support for asymmetric public key type handling.
>  	  If signature generation and/or verification are to be used,
>  	  appropriate hash algorithms (such as SHA-1) must be available.
>
> base-commit: ed30a4a51bb196781c8058073ea720133a65596f

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

BR, Jarkko

