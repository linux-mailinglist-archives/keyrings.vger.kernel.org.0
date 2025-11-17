Return-Path: <keyrings+bounces-3370-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D178C656F6
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 18:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 027E24F3E48
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 17:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 970472BE048;
	Mon, 17 Nov 2025 17:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPjWa2Ht"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6466F3016F9;
	Mon, 17 Nov 2025 17:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763399506; cv=none; b=RlOrYTaWhuaT/SVt+CJZv+OwNT6EEw7ig4z1AlS6xM16GMmd7OZyJhpU4b87VnD/9lo8QOx0yKigjX6RZOoODOv6y1qz8di+iG3ru6nOwMI9Qgw99rt4rI92nGFFijSide/LEBwtyIUbFuQUwUFrQJZKYS8JgCz72HCoW+pNM5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763399506; c=relaxed/simple;
	bh=/Y3+1dKHu7yjiuYg0oBzqMfoqYzUgVX0AwmKa4jjvbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=un8f8gYI81N7jVlcfynU6qGmGqqDQ1v9z/ZiL0Dn6MLxGb/b1H8ygd+t9FyA2+hnPlV1vWG3GYuxx+7J6CLKmkkh6fk0GcPUBrVuym2EMykQzTw08zI6nbF1i1q5LrsfGM7WrYgtg6sZfVzBL4Z5e1BgGyzsKzGBJKByqAKCP2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TPjWa2Ht; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69567C4CEF1;
	Mon, 17 Nov 2025 17:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763399505;
	bh=/Y3+1dKHu7yjiuYg0oBzqMfoqYzUgVX0AwmKa4jjvbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TPjWa2HthMfBlauk1FITdsEJz98Rzzum8AxgICGcKFukzxYyuBPDdjnsFQPBy69WH
	 7/yS1/5oDv9Gl+Mj7TxicdSAJqj6tIAAXED2Vqj4BlJAj9fA+6i4bXx5afTJBlBUIT
	 t7J2qoAYtqu3iz+i3js+3ql1zpqg5TN8aj0WUs7G92bXIV40i25BKFi51EEIx2/quP
	 qX4kKtGqQPzpuEHbcttKXhaHrkM91Rux2WlDW7DYpQD2x3X/SdfsDiRu09jXFRfHjt
	 SN9TDi+8ZB9eIBZBa7j/D7HmciOUKlXAIP/DuHMM6rKEJkkN2B1esZhURnymNOqkPF
	 ytLPjEDJvr8GA==
Date: Mon, 17 Nov 2025 09:10:03 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/9] crypto: Add ML-DSA/Dilithium verify support
Message-ID: <20251117171003.GC1584@sol>
References: <20251117145606.2155773-1-dhowells@redhat.com>
 <20251117145606.2155773-3-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117145606.2155773-3-dhowells@redhat.com>

On Mon, Nov 17, 2025 at 02:55:51PM +0000, David Howells wrote:
>  lib/crypto/Kconfig                            |   1 +
>  lib/crypto/Makefile                           |   2 +
>  lib/crypto/mldsa/Kconfig                      |  29 ++
>  lib/crypto/mldsa/Makefile                     |  20 +
>  lib/crypto/mldsa/crypto_mldsa_44.c            | 166 ++++++++
>  lib/crypto/mldsa/crypto_mldsa_65.c            | 166 ++++++++
>  lib/crypto/mldsa/crypto_mldsa_87.c            | 166 ++++++++
>  lib/crypto/mldsa/dilithium.h                  | 304 ++++++++++++++
>  lib/crypto/mldsa/dilithium_44.c               |  33 ++
>  lib/crypto/mldsa/dilithium_44.h               | 291 ++++++++++++++
>  lib/crypto/mldsa/dilithium_65.c               |  33 ++
>  lib/crypto/mldsa/dilithium_65.h               | 291 ++++++++++++++
>  lib/crypto/mldsa/dilithium_87.c               |  33 ++
>  lib/crypto/mldsa/dilithium_87.h               | 291 ++++++++++++++
>  lib/crypto/mldsa/dilithium_common.c           | 117 ++++++
>  lib/crypto/mldsa/dilithium_debug.h            |  49 +++
>  lib/crypto/mldsa/dilithium_ntt.c              |  89 +++++
>  lib/crypto/mldsa/dilithium_ntt.h              |  35 ++
>  lib/crypto/mldsa/dilithium_pack.h             | 119 ++++++
>  lib/crypto/mldsa/dilithium_poly.c             | 377 ++++++++++++++++++
>  lib/crypto/mldsa/dilithium_poly.h             | 181 +++++++++
>  lib/crypto/mldsa/dilithium_poly_c.h           | 141 +++++++
>  lib/crypto/mldsa/dilithium_poly_common.h      |  35 ++
>  lib/crypto/mldsa/dilithium_polyvec.h          | 343 ++++++++++++++++
>  lib/crypto/mldsa/dilithium_polyvec_c.h        |  81 ++++
>  lib/crypto/mldsa/dilithium_reduce.h           |  85 ++++
>  lib/crypto/mldsa/dilithium_rounding.c         | 128 ++++++
>  lib/crypto/mldsa/dilithium_service_helpers.h  |  99 +++++
>  lib/crypto/mldsa/dilithium_signature_c.c      | 279 +++++++++++++
>  lib/crypto/mldsa/dilithium_signature_c.h      |  37 ++
>  lib/crypto/mldsa/dilithium_signature_impl.h   | 370 +++++++++++++++++
>  lib/crypto/mldsa/dilithium_type.h             | 108 +++++
>  lib/crypto/mldsa/dilithium_zetas.c            |  68 ++++
>  .../mldsa/signature_domain_separation.c       | 204 ++++++++++
>  .../mldsa/signature_domain_separation.h       |  30 ++
>  35 files changed, 4801 insertions(+)

Over the past week I've been starting to review this massive addition.

I don't think this is on the right track.  This implementation is really
messy, with lots of unused functionality and unnecessary abstractions,
and code that doesn't follow kernel conventions.

In comparison, BoringSSL has an entire implementation of ML-DSA,
*including key generation and signing*, in a bit over 3000 lines in one
file.  But about half of that code is specific to key generation or
signing, which the kernel doesn't need, so in principle
verification-only shouldn't be much more than a thousand.  I find it to
be much easier to understand than leancrypto as well.

Historically we've had a lot of problems with people integrating code
from external sources into the kernel, like mpi, with properly "owning"
it because they feel like it's not their code and someone else is
responsible.  I feel like that's going to be a big problem here.

I think we can do better here and put together a smaller implementation
for the kernel that we'll actually be able to maintain.

- Eric

