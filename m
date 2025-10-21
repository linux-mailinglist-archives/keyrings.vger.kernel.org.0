Return-Path: <keyrings+bounces-3261-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 259C2BF6E91
	for <lists+keyrings@lfdr.de>; Tue, 21 Oct 2025 15:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E2A804E6FE8
	for <lists+keyrings@lfdr.de>; Tue, 21 Oct 2025 13:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46745339B36;
	Tue, 21 Oct 2025 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="c3psRs9d"
X-Original-To: keyrings@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4ED626E6F4
	for <keyrings@vger.kernel.org>; Tue, 21 Oct 2025 13:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761054722; cv=none; b=KZ9N+V14dasN3meErMesON3/lZYW/A9YyYB7bBP67gjky92kKQsHeCTa/XLP5ufF+kOs8ZcSpAmYxD6kLCquPHjryxZqWepByflNJ4Z68TV2LlmuzDR/j1VjXhPVl13E7wdij32sRh1NQu3gbbtubR28dy0hURSG6B5WIk9wgws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761054722; c=relaxed/simple;
	bh=cKFEf/mkujNMWCNn288lix+mx7uATbdtwPCr645LzQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TH9XB2d3iuF9oeSzvPVEa5W39QS8m3CHoZcyLAmncJGqM6Wb7JHN6b/OLgg9247urcalDjxvb2gJgXgFgp4Wigdh8ks7MNbar52a721DPYiJ1BbmZxJX/ZzX5VLU4b3GSLV0WEy2YU1hsIENX+H6WxJYTgJNJmm3ar7PZtMghoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=c3psRs9d; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-46e6a689bd0so53393825e9.1
        for <keyrings@vger.kernel.org>; Tue, 21 Oct 2025 06:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761054718; x=1761659518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2DyGAU+rMA/cRZrPzQupQaBzSC5vN1SBLAXdhns1VBg=;
        b=c3psRs9dCxelf/aUOXvb+s91iQFgGtFocu21KJGzmx/OFjdFr+liPSKreuteIapmAu
         RA/9LbcZ5iWEcGese/FGlR6IqlrpXRjvg6LzBb7MAUbLgyJ18pzuF5i29JMvRywT+Cov
         uDW840jYvC17mez5rttoLLHpsvPxqeJAG1/yNveDdQ/8avt3u6wSyiF9cp+My1e1sRGj
         F8vp+ujI4lRUk93yxKLGpDg3aXDRCAwMapKTmnhO+6s1toLzcIxR2yDt01hmZVA5T725
         ayd2WCmdVXKrcafzt5LTtFc9A+aIMEPvxjdCyZfotvY6d9zDqcW1ebRNRlx8Wn1bqLb1
         IsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761054718; x=1761659518;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2DyGAU+rMA/cRZrPzQupQaBzSC5vN1SBLAXdhns1VBg=;
        b=MGW8BaHWmq4crRd3f2tH8Lq/8adfdPl0ghTYhy4Q27HGP2W+aOzLQ1tJa74Oo0NnNm
         gPexcjHiLHmN+f47UI2T2XNscm9RlbC2CjQOqZ+YMh+A3RGyx+Jq+ujZdo0e0hoMcrAV
         6LbVmgjGy3DO32PxKe5/cHyhx4ik/YlRJAce9sZ3GUi/gFHhRh6PTP525yU/oqBohwyd
         apTaXLknaFvIF4YCjKWa2LQMf2dygGBvDJAowQ0bdGuFm5n3avx8H9tjy9LtbjmjLdqP
         EQS2xBMrHMnREOUZJL+2mkZBqmdqKIP+EvGrtOQUBav/J48wQMoF1pXDF2U64JEyaiNl
         VeVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbK/daKXa472/4Zjt2zW7ywu4ErwaqNxTL1wqutnV6OcU+DtKTdjLpPw3eAiGg/Bq5stYx4KbLqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzvoY/88nwmAMlYWhefqhXFjfF3QSXzRgEMuV0NwWSOoDVKCFe
	we7dTJ4a7RIXoedx5NFfjjWSftJGzMCYWYLK4DIG2OxXS1b/PnkfxZRiW9ZO7O/A+K4=
X-Gm-Gg: ASbGncv8G5sTtWbeeJhtMDZUSN3bbBYb4i62ZA/UgWjjSW/POSdg0EhDWFp0++06H6m
	UnV4dEhyrVOJU8hwqcIJcLNi0qq6KI5TUDSGDrSGZxFL31/hzxVw8UgY3AgWXp9tbJHGoe35UL6
	e51m4Su9Ksk9cO8PgBEYZNE0foV+rmKIIoYcZKKlA9YnMkLAsJAn5/bLDe4qMG4yp7d4qr9aLpp
	O75cJtC0xrgQajc6n9EnUHoK9Z16v0ghJx8ZEaIGFgX6UPaH6oshywfsne9CWLWqAFr2RrlZ6od
	uY+8xUJ58mqXT7g2gQ04Mh/Nwoeh+Q1vjpYYE+9NxoO9jzS3JYWi/7BCHnt2R54j9rv2/aHuLw6
	VOLcACaxlDlxaO0eDi3Y0iLjRmc9WYclaFhriCoqB+bzzHAtAjpv6/WxLEzXsY24lnwa/gJKbMw
	UnWm6pV/350th/WU7Ygpu+iFtKpDh6D8Q=
X-Google-Smtp-Source: AGHT+IHWJuVwFzbFlMqm8ao/URm2+K5hiKjfkJF6MOKyAoW5c12azTqzQXI62G8B/tUeCFgJ75QR4A==
X-Received: by 2002:a05:600c:45c9:b0:471:115e:87bd with SMTP id 5b1f17b1804b1-4711791c601mr124597535e9.26.1761054718131;
        Tue, 21 Oct 2025 06:51:58 -0700 (PDT)
Received: from [10.100.51.209] (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d90bsm198104915e9.2.2025.10.21.06.51.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:51:57 -0700 (PDT)
Message-ID: <81080a24-e4a9-4287-8653-9d707e574d95@suse.com>
Date: Tue, 21 Oct 2025 15:51:57 +0200
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 17/17] modsign: Enable ML-DSA module signing
To: David Howells <dhowells@redhat.com>
Cc: Eric Biggers <ebiggers@kernel.org>, "Jason A . Donenfeld"
 <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Stephan Mueller <smueller@chronox.de>, Lukas Wunner <lukas@wunner.de>,
 Ignat Korchagin <ignat@cloudflare.com>, Luis Chamberlain
 <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, linux-crypto@vger.kernel.org,
 keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251017144311.817771-1-dhowells@redhat.com>
 <20251017144311.817771-18-dhowells@redhat.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20251017144311.817771-18-dhowells@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/17/25 4:43 PM, David Howells wrote:
> Allow ML-DSA module signing to be enabled.
> 
> Note that openssl's CMS_*() function suite does not, as of openssl-3.5.1,
> support the use of CMS_NOATTR with ML-DSA, so the prohibition against using
> authenticatedAttributes with module signing has to be removed.  The selected
> digest then applies only to the algorithm used to calculate the digest
> stored in the messageDigest attribute.
> 
> The ML-DSA algorithm uses its own internal choice of digest (SHAKE256)
> without regard to what's specified in the CMS message.  This is, in theory,
> configurable, but there's currently no hook in the crypto_sig API to do
> that, though possibly it could be done by parameterising the name of the
> algorithm, e.g. ("ml-dsa87(sha512)").
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: Lukas Wunner <lukas@wunner.de>
> cc: Ignat Korchagin <ignat@cloudflare.com>
> cc: Stephan Mueller <smueller@chronox.de>
> cc: Eric Biggers <ebiggers@kernel.org>
> cc: Herbert Xu <herbert@gondor.apana.org.au>
> cc: keyrings@vger.kernel.org
> cc: linux-crypto@vger.kernel.org
> ---
>  Documentation/admin-guide/module-signing.rst | 15 +++++------
>  certs/Kconfig                                | 24 ++++++++++++++++++
>  certs/Makefile                               |  3 +++
>  crypto/asymmetric_keys/pkcs7_verify.c        |  4 ---
>  kernel/module/Kconfig                        |  5 ++++
>  scripts/sign-file.c                          | 26 ++++++++++++++------
>  6 files changed, 58 insertions(+), 19 deletions(-)
> 
> diff --git a/Documentation/admin-guide/module-signing.rst b/Documentation/admin-guide/module-signing.rst
> index a8667a777490..6daff80c277b 100644
> --- a/Documentation/admin-guide/module-signing.rst
> +++ b/Documentation/admin-guide/module-signing.rst
> @@ -28,10 +28,11 @@ trusted userspace bits.
>  
>  This facility uses X.509 ITU-T standard certificates to encode the public keys
>  involved.  The signatures are not themselves encoded in any industrial standard
> -type.  The built-in facility currently only supports the RSA & NIST P-384 ECDSA
> -public key signing standard (though it is pluggable and permits others to be
> -used).  The possible hash algorithms that can be used are SHA-2 and SHA-3 of
> -sizes 256, 384, and 512 (the algorithm is selected by data in the signature).
> +type.  The built-in facility currently only supports the RSA, NIST P-384 ECDSA
> +and NIST FIPS-204 ML-DSA (Dilithium) public key signing standards (though it is
> +pluggable and permits others to be used).  For RSA and ECDSA, the possible hash
> +algorithms that can be used are SHA-2 and SHA-3 of sizes 256, 384, and 512 (the
> +algorithm is selected by data in the signature); ML-DSA uses SHAKE256.

This update looks ok to me. However, I'll note some problems that
I noticed in the original text, notably:

The text doesn't match the implementation because kernel/module/Kconfig
still allows selecting SHA-1 for module signing. What happened is that
commit 16ab7cb5825f ("crypto: pkcs7 - remove sha1 support") initially
removed CONFIG_MODULE_SIG_SHA1. Then, commit f2b88bab69c8
("Documentation/module-signing.txt: bring up to date") removed it from
the documentation. However, commit 203a6763ab69 ("Revert "crypto: pkcs7
- remove sha1 support"") brought back CONFIG_MODULE_SIG_SHA1 without
reverting the documentation update.

Another problem is that for MODULE_SIG_KEY_TYPE_ECDSA, certs/Kconfig
contains the line
"depends on !(MODULE_SIG_SHA256 || MODULE_SIG_SHA3_256)",
which intends to allow ECDSA only with MODULE_SIG_SHA384,
MODULE_SIG_SHA512, MODULE_SIG_SHA3_384 and MODULE_SIG_SHA3_512. This
restriction was added in commit d4f5bfe20da9 ("certs: Limit
MODULE_SIG_KEY_TYPE_ECDSA to SHA384 or SHA512") and 446b1e0b7b39
("module: enable automatic module signing with FIPS 202 SHA-3").
However, the documentation suggests that ECDSA can still be used with
SHA-2/3 of size 256.

I'll prepare fixes for these issues. For the first problem, I think we
can drop CONFIG_MODULE_SIG_SHA1 instead of correcting the documentation.

>  
>  
>  ==========================
> @@ -146,9 +147,9 @@ into vmlinux) using parameters in the::
>  
>  file (which is also generated if it does not already exist).
>  
> -One can select between RSA (``MODULE_SIG_KEY_TYPE_RSA``) and ECDSA
> -(``MODULE_SIG_KEY_TYPE_ECDSA``) to generate either RSA 4k or NIST
> -P-384 keypair.
> +One can select between RSA (``MODULE_SIG_KEY_TYPE_RSA``), ECDSA
> +(``MODULE_SIG_KEY_TYPE_ECDSA``) and ML-DSA (``MODULE_SIG_KEY_TYPE_ML_DSA``) to
> +generate an RSA 4k, a NIST P-384 keypair or an ML-DSA keypair.
>  
>  It is strongly recommended that you provide your own x509.genkey file.
>  
> diff --git a/certs/Kconfig b/certs/Kconfig
> index 78307dc25559..a09db4b2c87c 100644
> --- a/certs/Kconfig
> +++ b/certs/Kconfig
> @@ -39,6 +39,30 @@ config MODULE_SIG_KEY_TYPE_ECDSA
>  	 Note: Remove all ECDSA signing keys, e.g. certs/signing_key.pem,
>  	 when falling back to building Linux 5.14 and older kernels.
>  
> +config MODULE_SIG_KEY_TYPE_ML_DSA_44
> +	bool "ML-DSA (Dilithium) 44"
> +	select CRYPTO_ML_DSA
> +	select LIB_SHA3
> +	help
> +	  Use an ML-DSA (Dilithium) 87 key (NIST FIPS 204) for module signing
> +	  with a SHAKE256 'hash' of the message.

Copy-and-paste error in the help message: 87 -> 44.

> +
> +config MODULE_SIG_KEY_TYPE_ML_DSA_65
> +	bool "ML-DSA (Dilithium) 65"
> +	select CRYPTO_ML_DSA
> +	select LIB_SHA3
> +	help
> +	  Use an ML-DSA (Dilithium) 87 key (NIST FIPS 204) for module signing
> +	  with a SHAKE256 'hash' of the message.

Similarly here: 87 -> 65.

> +
> +config MODULE_SIG_KEY_TYPE_ML_DSA_87
> +	bool "ML-DSA (Dilithium) 87"
> +	select CRYPTO_ML_DSA
> +	select LIB_SHA3
> +	help
> +	  Use an ML-DSA (Dilithium) 87 key (NIST FIPS 204) for module signing
> +	  with a SHAKE256 'hash' of the message.
> +

Should all MODULE_SIG_KEY_TYPE_ML_DSA_* options depend on
MODULE_SIG_SHAKE256 to match the updated
Documentation/admin-guide/module-signing.rst?

Similarly, do MODULE_SIG_KEY_TYPE_RSA and MODULE_SIG_KEY_TYPE_ECDSA
require any "depends on" update with respect to the addition of
MODULE_SIG_SHAKE256?

-- 
Thanks,
Petr

