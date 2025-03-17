Return-Path: <keyrings+bounces-2461-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7DCA64F32
	for <lists+keyrings@lfdr.de>; Mon, 17 Mar 2025 13:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8F437A5283
	for <lists+keyrings@lfdr.de>; Mon, 17 Mar 2025 12:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6870323A566;
	Mon, 17 Mar 2025 12:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3x4cKBH"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3738318BC3D;
	Mon, 17 Mar 2025 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742215095; cv=none; b=pEjwyYJ8FEcAaSTBjxLiD3hZyECOwZurraOexCg2PfBkXcXO9RKAwJsfx4XOZKm5+YargBx0q+S5rjmGrABzpVAg5NXIKc+zlD6eO8sj8SqLhrfBp8ZCm5m6ob271nO4JnXjewDfkWjkDvMe8nmzIiKRnJElBgwrg0eHCk6WAPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742215095; c=relaxed/simple;
	bh=NNOOVTyWPirOiqEpb0K268B1ZkWd7p9GAsy4D2XpjfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhSwliFxyg2U5urXaBPX08Nx4mzJg49ltfc0VyhUe8iY97jhAQaL0xa/F1Fm6o4ZvJomfsYzR1F4NTfmPAk6IljAHjp8YlOgaCTvWJx3I22gLF5KIeTSKXVYrLqIEIogZUW7Fa7IQMRVGYc4gc8PLoGKW5VWlyQC7Smt51qZNlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3x4cKBH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02CDCC4CEE3;
	Mon, 17 Mar 2025 12:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742215094;
	bh=NNOOVTyWPirOiqEpb0K268B1ZkWd7p9GAsy4D2XpjfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V3x4cKBHl3uHHz0Azu5+brr25Bewu/N15j4gUBCyRubmwfKw/5mDHDTACXzC/LF/e
	 wWUF3WIzrpbJV15wFKsPrj4ohKfTRErPmAnTzmq9p8yDsl0MOjb92r4brIeVDfWn5d
	 3BgqWnil8sTtT20qK1pbeJ4lxSbwh3dQ5uwzJ3Nfn4Wk163gEletDvrhvepudSeNxV
	 vT4CliY/umh+JA2LNq/mg+1dA0UbEuPGNPnPZqEz+5bFLR6n80i0aK5gN1toAXIei7
	 IYGmAqqftshQVJ+8wpl1ZbE69pwqjFPvA9L/4P4onyBPGqYlFFR5FGRnmnjWAnly4I
	 TlHA+FKdSGeOw==
Date: Mon, 17 Mar 2025 14:38:10 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>,
	Arnaud Ebalard <arno@natisbad.org>,
	Srujana Challa <schalla@marvell.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	"Justin M. Forbes" <jforbes@fedoraproject.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Arnd Bergmann <arnd@arndb.de>, Rosen Penev <rosenp@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: Re: [PATCH] [v2] crypto: lib/Kconfig: hide library options
Message-ID: <Z9gXsj0D5XmC6G2B@kernel.org>
References: <20250314160543.605055-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250314160543.605055-1-arnd@kernel.org>

On Fri, Mar 14, 2025 at 05:05:32PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Any driver that needs these library functions should already be selecting
> the corresponding Kconfig symbols, so there is no real point in making
> these visible.
> 
> The original patch that made these user selectable described problems
> with drivers failing to select the code they use, but for consistency
> it's better to always use 'select' on a symbol than to mix it with
> 'depends on'.
> 
> Fixes: e56e18985596 ("lib/crypto: add prompts back to crypto libraries")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: add the missing 'select' statements
> ---
>  drivers/crypto/marvell/Kconfig | 4 ++--
>  lib/crypto/Kconfig             | 8 ++++----
>  security/keys/Kconfig          | 2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/crypto/marvell/Kconfig b/drivers/crypto/marvell/Kconfig
> index 4c25a78ab3ed..aa269abb0499 100644
> --- a/drivers/crypto/marvell/Kconfig
> +++ b/drivers/crypto/marvell/Kconfig
> @@ -24,7 +24,7 @@ config CRYPTO_DEV_OCTEONTX_CPT
>  	tristate "Support for Marvell OcteonTX CPT driver"
>  	depends on ARCH_THUNDER || COMPILE_TEST
>  	depends on PCI_MSI && 64BIT
> -	depends on CRYPTO_LIB_AES
> +	select CRYPTO_LIB_AES
>  	select CRYPTO_SKCIPHER
>  	select CRYPTO_HASH
>  	select CRYPTO_AEAD
> @@ -41,10 +41,10 @@ config CRYPTO_DEV_OCTEONTX2_CPT
>  	tristate "Marvell OcteonTX2 CPT driver"
>  	depends on ARCH_THUNDER2 || COMPILE_TEST
>  	depends on PCI_MSI && 64BIT
> -	depends on CRYPTO_LIB_AES
>  	depends on NET_VENDOR_MARVELL
>  	select OCTEONTX2_MBOX
>  	select CRYPTO_DEV_MARVELL
> +	select CRYPTO_LIB_AES
>  	select CRYPTO_SKCIPHER
>  	select CRYPTO_HASH
>  	select CRYPTO_AEAD
> diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
> index 17322f871586..798972b29b68 100644
> --- a/lib/crypto/Kconfig
> +++ b/lib/crypto/Kconfig
> @@ -63,7 +63,7 @@ config CRYPTO_LIB_CHACHA_INTERNAL
>  	select CRYPTO_LIB_CHACHA_GENERIC if CRYPTO_ARCH_HAVE_LIB_CHACHA=n
>  
>  config CRYPTO_LIB_CHACHA
> -	tristate "ChaCha library interface"
> +	tristate
>  	select CRYPTO
>  	select CRYPTO_LIB_CHACHA_INTERNAL
>  	help
> @@ -93,7 +93,7 @@ config CRYPTO_LIB_CURVE25519_INTERNAL
>  	select CRYPTO_LIB_CURVE25519_GENERIC if CRYPTO_ARCH_HAVE_LIB_CURVE25519=n
>  
>  config CRYPTO_LIB_CURVE25519
> -	tristate "Curve25519 scalar multiplication library"
> +	tristate
>  	select CRYPTO
>  	select CRYPTO_LIB_CURVE25519_INTERNAL
>  	help
> @@ -132,7 +132,7 @@ config CRYPTO_LIB_POLY1305_INTERNAL
>  	select CRYPTO_LIB_POLY1305_GENERIC if CRYPTO_ARCH_HAVE_LIB_POLY1305=n
>  
>  config CRYPTO_LIB_POLY1305
> -	tristate "Poly1305 library interface"
> +	tristate
>  	select CRYPTO
>  	select CRYPTO_LIB_POLY1305_INTERNAL
>  	help
> @@ -141,7 +141,7 @@ config CRYPTO_LIB_POLY1305
>  	  is available and enabled.
>  
>  config CRYPTO_LIB_CHACHA20POLY1305
> -	tristate "ChaCha20-Poly1305 AEAD support (8-byte nonce library version)"
> +	tristate
>  	select CRYPTO_LIB_CHACHA
>  	select CRYPTO_LIB_POLY1305
>  	select CRYPTO_LIB_UTILS
> diff --git a/security/keys/Kconfig b/security/keys/Kconfig
> index abb03a1b2a5c..d4f5fc1e7263 100644
> --- a/security/keys/Kconfig
> +++ b/security/keys/Kconfig
> @@ -60,7 +60,7 @@ config BIG_KEYS
>  	bool "Large payload keys"
>  	depends on KEYS
>  	depends on TMPFS
> -	depends on CRYPTO_LIB_CHACHA20POLY1305 = y
> +	select CRYPTO_LIB_CHACHA20POLY1305
>  	help
>  	  This option provides support for holding large keys within the kernel
>  	  (for example Kerberos ticket caches).  The data may be stored out to
> -- 
> 2.39.5
> 
> 

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

