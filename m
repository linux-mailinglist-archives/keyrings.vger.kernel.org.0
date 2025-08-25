Return-Path: <keyrings+bounces-2984-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A82F6B34F34
	for <lists+keyrings@lfdr.de>; Tue, 26 Aug 2025 00:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C83A11A85A16
	for <lists+keyrings@lfdr.de>; Mon, 25 Aug 2025 22:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504272980A8;
	Mon, 25 Aug 2025 22:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyLObBu4"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C1A153BED;
	Mon, 25 Aug 2025 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756162238; cv=none; b=oxPA79Pecbf9WKeoD6hmM68tKsXKp7neualp3qeVKWGYquF+of5amRU9Ih2tMGkIt7pxsNNAjMqbCdqZ2MCJzjrOngJXEA+sSQETNqnuZbtsAjAkqUF8ct2FKki/6KQ0DsCyOdkRKQCflVpq4qc5Kaql7k+jGPGk7f/Ib1xTrys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756162238; c=relaxed/simple;
	bh=qLAILGylpNDxCGNnXDGO6cizwxD+QRteD6rM/sVBaQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFLWYIBT95e2KmR+eHoF7NQxrgr3N+Jqk/bdMVSunZZI1w9z1NyKFtQ1DkCiSY29/HLwxOfOtcp7JNKO6rGUV37VZ3KCRy1QuWgtlQ0wPFeNMyWGqGs+bKJ9jojA7XB1uan/dWY7T/D6Q+8/hVA9Mya6ONjkjsPDs4mi16iBwJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyLObBu4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA55CC4CEED;
	Mon, 25 Aug 2025 22:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756162235;
	bh=qLAILGylpNDxCGNnXDGO6cizwxD+QRteD6rM/sVBaQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FyLObBu4yeae/4I2HhwQ42nY1rjeme9QShssPkYP8kikxHnjai/1d2K8R/KplTRmx
	 hn3niZf58Eug0UdO6tIzkmWfOM3vnJLg3l3QKGplgQ9/0niLNIHNfBu9ctfLJLAR6c
	 d6Nb5vTXX5ZM06XOkj0GcnsMm7ZFiWFw2bXrtDNKISw9qU4248bNplSGjG1/fMCBLB
	 O3kVVBMNgs6jEPqNuXraby7NzXLORT1qtghIYdM4DbNqYibWY0oofzFfvbqFxKNwjW
	 XW6PDanOgpwKU6CLLBBNBxH+zQ43SFYEJkQycbRq18BB/tTfBsVbIb3i1yl2rTD9Zv
	 2qcg0r3YFDKTQ==
Date: Tue, 26 Aug 2025 01:50:31 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>
Subject: Re: [PATCH] security: keys: use menuconfig for KEYS symbol
Message-ID: <aKzot67f7F3wtHs7@kernel.org>
References: <20250824222813.92300-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250824222813.92300-1-rdunlap@infradead.org>

On Sun, Aug 24, 2025 at 03:28:13PM -0700, Randy Dunlap wrote:
> Give the KEYS kconfig symbol and its associated symbols a separate
> menu space under Security options by using "menuconfig" instead of
> "config".
> 
> This also makes it easier to find the security and LSM options.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: David Howells <dhowells@redhat.com>
> Cc: Jarkko Sakkinen <jarkko@kernel.org>
> Cc: keyrings@vger.kernel.org
> Cc: linux-security-module@vger.kernel.org
> Cc: Paul Moore <paul@paul-moore.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: "Serge E. Hallyn" <serge@hallyn.com>
> 
>  security/keys/Kconfig |   14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
> 
> --- linux-next-20250819.orig/security/keys/Kconfig
> +++ linux-next-20250819/security/keys/Kconfig
> @@ -3,7 +3,7 @@
>  # Key management configuration
>  #
>  
> -config KEYS
> +menuconfig KEYS
>  	bool "Enable access key retention support"
>  	select ASSOCIATIVE_ARRAY
>  	help
> @@ -21,9 +21,10 @@ config KEYS
>  
>  	  If you are unsure as to whether this is required, answer N.
>  
> +if KEYS
> +
>  config KEYS_REQUEST_CACHE
>  	bool "Enable temporary caching of the last request_key() result"
> -	depends on KEYS
>  	help
>  	  This option causes the result of the last successful request_key()
>  	  call that didn't upcall to the kernel to be cached temporarily in the
> @@ -41,7 +42,6 @@ config KEYS_REQUEST_CACHE
>  
>  config PERSISTENT_KEYRINGS
>  	bool "Enable register of persistent per-UID keyrings"
> -	depends on KEYS
>  	help
>  	  This option provides a register of persistent per-UID keyrings,
>  	  primarily aimed at Kerberos key storage.  The keyrings are persistent
> @@ -58,7 +58,6 @@ config PERSISTENT_KEYRINGS
>  
>  config BIG_KEYS
>  	bool "Large payload keys"
> -	depends on KEYS
>  	depends on TMPFS
>  	select CRYPTO_LIB_CHACHA20POLY1305
>  	help
> @@ -70,7 +69,6 @@ config BIG_KEYS
>  
>  config TRUSTED_KEYS
>  	tristate "TRUSTED KEYS"
> -	depends on KEYS
>  	help
>  	  This option provides support for creating, sealing, and unsealing
>  	  keys in the kernel. Trusted keys are random number symmetric keys,
> @@ -85,7 +83,6 @@ endif
>  
>  config ENCRYPTED_KEYS
>  	tristate "ENCRYPTED KEYS"
> -	depends on KEYS
>  	select CRYPTO
>  	select CRYPTO_HMAC
>  	select CRYPTO_AES
> @@ -114,7 +111,6 @@ config USER_DECRYPTED_DATA
>  
>  config KEY_DH_OPERATIONS
>         bool "Diffie-Hellman operations on retained keys"
> -       depends on KEYS
>         select CRYPTO
>         select CRYPTO_KDF800108_CTR
>         select CRYPTO_DH
> @@ -127,9 +123,11 @@ config KEY_DH_OPERATIONS
>  
>  config KEY_NOTIFICATIONS
>  	bool "Provide key/keyring change notifications"
> -	depends on KEYS && WATCH_QUEUE
> +	depends on WATCH_QUEUE
>  	help
>  	  This option provides support for getting change notifications
>  	  on keys and keyrings on which the caller has View permission.
>  	  This makes use of pipes to handle the notification buffer and
>  	  provides KEYCTL_WATCH_KEY to enable/disable watches.
> +
> +endif # KEYS

I wote for this at least. Definitely an improvement:

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

