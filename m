Return-Path: <keyrings+bounces-3722-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 94065CF73AF
	for <lists+keyrings@lfdr.de>; Tue, 06 Jan 2026 09:10:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5F28B3018CBA
	for <lists+keyrings@lfdr.de>; Tue,  6 Jan 2026 08:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD6D3242C2;
	Tue,  6 Jan 2026 08:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QRqINOPs"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470ED3242AC;
	Tue,  6 Jan 2026 08:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767687050; cv=none; b=pt8VKEPTuCrD/R/C2YIx1YdDCdiaNqqyf4QdyUVdZhluZrHSO2yOydjdu+fvTqU4J/RnN4L33keZyyNc5TMYSp8Vlz4x42iqgP2O4eKuwJayU9x9VFYsA92DNQqNR0sO8veYcwvXDR36EjSMpjR4XQWpgjpa2yOS8A7LCYZoYJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767687050; c=relaxed/simple;
	bh=WiYMdCQXi3VqscW8Q/H9KAqs3tTOc9DxspmZ/2XjccI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6AL53wfeknKySUUuippdKALiWF/EJqrYr6D+OlXsb0f8o/f+gpMJb2b7bAieIYAwFWxMziVqY1E9T+p6NQsIacvpeMKos0oAI0ChFXpATmFjlkfz7YHgHxCLNp88gBn3sm/z88g27tmNzsEZ5O4D1ZBnjL81uXmHgxBkb8+Tww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QRqINOPs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F0FC116C6;
	Tue,  6 Jan 2026 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767687048;
	bh=WiYMdCQXi3VqscW8Q/H9KAqs3tTOc9DxspmZ/2XjccI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QRqINOPsteCuDqbypX3fjYmdhN8pNi1drciBygANbM6Qq+cliWIKmkGkoFz/Ym3rV
	 Dg3kUZryk8RFQzNYPq1dqpBrkTUtWsrXr4gcqEzZvkbwNtNXSb4h7K+DHiLQTx88CO
	 JNLT6C/6GlM3Y1VlbbPmURRG0j1fSgwRndrxZA5iGKv0ttvjcBysX0+Jo22MhNteOh
	 WdYJq8Y4rQnK5kxslIaASGo8Rz9f+vKwxk9Bu0qVAHpVMELEEs6yxGe7AmcUYAb5TX
	 gbakHDc/yKyr3d9ngfJxrVgWqCsnhkIcIfA5X6t27y6yFh8dz6PCPpfCzX79S9hLaP
	 Kw92g2OxhNUbQ==
Date: Tue, 6 Jan 2026 00:10:29 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Lukas Wunner <lukas@wunner.de>, Ignat Korchagin <ignat@cloudflare.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
	keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/8] modsign: Enable ML-DSA module signing
Message-ID: <20260106081029.GE2630@sol>
References: <20260105152145.1801972-1-dhowells@redhat.com>
 <20260105152145.1801972-5-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105152145.1801972-5-dhowells@redhat.com>

On Mon, Jan 05, 2026 at 03:21:29PM +0000, David Howells wrote:
> The ML-DSA algorithm uses its own internal choice of digest (SHAKE256)
> without regard to what's specified in the CMS message.  This is, in theory,
> configurable, but there's currently no hook in the crypto_sig API to do
> that, though possibly it could be done by parameterising the name of the
> algorithm, e.g. ("mldsa87(sha512)").

The ML-DSA specification specifies the XOFs used.  This has nothing to
do with the API.

> +config MODULE_SIG_KEY_TYPE_MLDSA_44
> +	bool "ML-DSA (Dilithium) 44"
> +	select CRYPTO_MLDSA
> +	help
> +	  Use an ML-DSA (Dilithium) 44 key (NIST FIPS 204) for module signing
> +	  with a SHAKE256 'hash' of the authenticatedAttributes.
> +
> +config MODULE_SIG_KEY_TYPE_MLDSA_65
> +	bool "ML-DSA (Dilithium) 65"
> +	select CRYPTO_MLDSA
> +	help
> +	  Use an ML-DSA (Dilithium) 65 key (NIST FIPS 204) for module signing
> +	  with a SHAKE256 'hash' of the authenticatedAttributes.
> +
> +config MODULE_SIG_KEY_TYPE_MLDSA_87
> +	bool "ML-DSA (Dilithium) 87"
> +	select CRYPTO_MLDSA
> +	help
> +	  Use an ML-DSA (Dilithium) 87 key (NIST FIPS 204) for module signing
> +	  with a SHAKE256 'hash' of the authenticatedAttributes.

Kind of weird naming here.  We don't have "AES (Rijndael) 256" and
"SHA-3 (Keccak) 512".  We have AES-256 and SHA3-256.

Similarly, these should be ML-DSA-44, etc.

Yes, NIST went with boring names instead of the original cool names.
That's just how it is.

Also unclear why the above help text mentions anything about SHAKE256 or
the authenticatedAttributes.  That's an implementation detail.  (And the
CMS specification calls them signed attributes anyway.)

- Eric

