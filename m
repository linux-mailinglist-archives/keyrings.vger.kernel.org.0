Return-Path: <keyrings+bounces-1103-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A25648ADC8E
	for <lists+keyrings@lfdr.de>; Tue, 23 Apr 2024 06:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 588E1281970
	for <lists+keyrings@lfdr.de>; Tue, 23 Apr 2024 04:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EBF71CA9C;
	Tue, 23 Apr 2024 04:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jvdsn.com header.i=@jvdsn.com header.b="NeVqRsmq"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.jvdsn.com (smtp.jvdsn.com [129.153.194.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B621946B;
	Tue, 23 Apr 2024 04:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.153.194.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713844968; cv=none; b=OqNjiC4JT/H00TKolkgVKOBTKa8qpZxEJq79kyvGrD7YhUhv1hvaf0wRUTncyzvaTLSNvu9byX5DmjZXrUPdWeLHrqXDrfpl95NNcn0naAYcWYOv524ASpmOTu/qxTPb7OXlrRamppXhBLiNS8wvEe6LYkPAX8pr4dE/8UvpWVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713844968; c=relaxed/simple;
	bh=vhzq0N45gGQV1PgabGARl3LmJh7oOAEKzl/9R6dIHj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jImKVjGxlVK1ro2P853qCNpDTPijPPrPftgTzDqgwxNRUcb97KsilLc5fqT5DkhvNK6/noLyJIQfmn4yti4YJZna3nnG+cOEhiO8612ybfHhO3mpm1zghScVGpo41I/B+P7gfmkHgVKBDvgplSrGey+ul7EVBFkofTmNAph1SB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jvdsn.com; spf=pass smtp.mailfrom=jvdsn.com; dkim=pass (2048-bit key) header.d=jvdsn.com header.i=@jvdsn.com header.b=NeVqRsmq; arc=none smtp.client-ip=129.153.194.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jvdsn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jvdsn.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=jvdsn.com; s=mail;
	t=1713844960; bh=vhzq0N45gGQV1PgabGARl3LmJh7oOAEKzl/9R6dIHj4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=NeVqRsmqAo4YjlmHAr8CFyo8V3qZ5HYT2nuCPv4h+1WHrz0wzEMgFzDYmVvhGSXOm
	 QPWtyvNBgygbzfwN+9q8rxcusGmPc6oJ6OdHm0tflfHqvhxlPNYDs2G8JAgXYRYivR
	 NreF0xCg3WRWITVJgXRo48MSC/b24MCIFuewfQBsfniyWAHo5+IG4cuBT45dKiFeA8
	 eZnlZ5Tjy21FU+TNqN5M+NZE+JxyZbWrkUY63ftOndka0a5NZyq+0Xpd+pDeqOj6ct
	 pLVUpY95DvDq2jHUI1c1/TvGCGi8rXpRBDJBaRNrbM2yMZWeoy2mvsWAS+CeUfIjh7
	 G55dnRhV4otmg==
Message-ID: <908bc808-f8bd-4cc2-8644-c6c84e8cd4ea@jvdsn.com>
Date: Mon, 22 Apr 2024 23:02:38 -0500
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] KEYS: asymmetric: Add missing dependencies of
 FIPS_SIGNATURE_SELFTEST
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 stable@vger.kernel.org, Simo Sorce <simo@redhat.com>,
 David Howells <dhowells@redhat.com>,
 kernel test robot <oliver.sang@intel.com>
References: <20240422211041.322370-1-ebiggers@kernel.org>
Content-Language: en-US
From: Joachim Vandersmissen <git@jvdsn.com>
Autocrypt: addr=joachim@jvdsn.com; keydata=
 xjMEYFm2zhYJKwYBBAHaRw8BAQdAa0ToltLs88MRtcZT3AnfaX4y9z7tNuQumkFnraoacSrN
 KUpvYWNoaW0gVmFuZGVyc21pc3NlbiA8am9hY2hpbUBqdmRzbi5jb20+wosEExYIADMWIQTl
 ppuIImvmYHZckHHNOH6x9cuKxQUCYFm2zgIbAwULCQgHAgYVCAkKCwIFFgIDAQAACgkQzTh+
 sfXLisVD7wEAufvtZXIMlofHV5P3O4Cj+J/npvpmxnNPBqd+2AdJ8GAA+wS1j7TvvtPhTccG
 DYXZbrGlvTrCrGyGdTRdK0ZcTgQLzjgEYFm2zhIKKwYBBAGXVQEFAQEHQHUI004BPYxgvmBd
 PTzZYgyko/t3ZlPeWcSQen0JEOZ2AwEIB8J4BBgWCAAgFiEE5aabiCJr5mB2XJBxzTh+sfXL
 isUFAmBZts4CGwwACgkQzTh+sfXLisVlRQD/XXtpe2kyEJ4rkRHNxS/0yHi4B26uyyutGaZN
 t/aaUDQA/RweY9tHblOuDvCCMnRSI+HDambm+2OgKwe45MXNdssK
In-Reply-To: <20240422211041.322370-1-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Eric,

On 4/22/24 4:10 PM, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> Since the signature self-test uses RSA and SHA-256, it must only be
> enabled when those algorithms are enabled.  Otherwise it fails and
> panics the kernel on boot-up.

I actually submitted two related patch recently which change the 
structure of the PKCS#7 self-tests and add an ECDSA self-test. See 
"[PATCH v2 1/2] certs: Move RSA self-test data to separate file" and 
"[PATCH v2 2/2] certs: Add ECDSA signature verification self-test" on 
2024-04-20. The explicit dependency on CRYPTO_RSA shouldn't be necessary 
with those patches (I think).

However, I didn't consider CRYPTO_SHA256 there. I think it can remain 
since both the RSA and proposed ECDSA self-tests use SHA-256.

>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202404221528.51d75177-lkp@intel.com
> Fixes: 3cde3174eb91 ("certs: Add FIPS selftests")
> Cc: stable@vger.kernel.org
> Cc: Simo Sorce <simo@redhat.com>
> Cc: David Howells <dhowells@redhat.com>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>   crypto/asymmetric_keys/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/crypto/asymmetric_keys/Kconfig b/crypto/asymmetric_keys/Kconfig
> index 59ec726b7c77..4abc58c55efa 100644
> --- a/crypto/asymmetric_keys/Kconfig
> +++ b/crypto/asymmetric_keys/Kconfig
> @@ -83,7 +83,9 @@ config FIPS_SIGNATURE_SELFTEST
>   	  for FIPS.
>   	depends on KEYS
>   	depends on ASYMMETRIC_KEY_TYPE
>   	depends on PKCS7_MESSAGE_PARSER=X509_CERTIFICATE_PARSER
>   	depends on X509_CERTIFICATE_PARSER
> +	depends on CRYPTO_RSA
> +	depends on CRYPTO_SHA256
>   
>   endif # ASYMMETRIC_KEY_TYPE
>
> base-commit: ed30a4a51bb196781c8058073ea720133a65596f

