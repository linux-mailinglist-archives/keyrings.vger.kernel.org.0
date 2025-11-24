Return-Path: <keyrings+bounces-3427-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 374C9C81AB0
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 17:51:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ADA754E325E
	for <lists+keyrings@lfdr.de>; Mon, 24 Nov 2025 16:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A50A313279;
	Mon, 24 Nov 2025 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzaEoBhI"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F3019644B;
	Mon, 24 Nov 2025 16:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764003062; cv=none; b=mYQIqCSV9ri8MJH4g2TMQFDU3Zf0Nglv+83ByLm7XVPnMVvfIY4Jv5p3H6wzDeI5zIKaBFyAhBZuznDtgnyXOolNWqnwnBvl9iAWa4Kv7Fdh3/HNNp7/Ad+ySKQ7jkPGXB2pRGAQE76fXg5Si2e3Zz7a3A86FuKJCO/ECTvda7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764003062; c=relaxed/simple;
	bh=FHKYXPxVlORV26HnvWqOPkjmdEPtUDYd6L5s5ZMbGsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRSjVEVbaM735cjWi4TlMAYsIwAn6KoSuApGIPt2HMKGH73uLzVSAlXu4zW+3r1b2F7UxblFQoPoG22rjsld+YdRqmg8OSgr9YbpA2h5XOiQMmed5YPmBDl7SHFCRK53uiQP35gSkT7xG6nTuL2B1mtWjBEgB8CSH7bT23bQS10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzaEoBhI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9589AC116C6;
	Mon, 24 Nov 2025 16:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764003062;
	bh=FHKYXPxVlORV26HnvWqOPkjmdEPtUDYd6L5s5ZMbGsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kzaEoBhI7Rub27z+uGMRZ7nHe7g4afZn/jpvwpLCSncqPh52ehObdL0zcn1ME0476
	 8J1GTxPGnmBXbEh6KjKAJSRaBSeoeyHB9ki3ZhXkri9QUR0owj5JVHY4002GU4UF1Y
	 VYfCl3rqAW+FngtSPZcWz/JvQt8rXdJBjduibAaROk/63BXSgyHmsTno1qf5gJNDzE
	 8nCoXp0SKcxPiN+lorOyISilc4L9XYhUn+/GJCUlUroq1Yczwp2nIpmfyrWUiudTqL
	 cKjR7XCt0su2gFDmeV31TAtQdHACsS2WcfATLue6G/8hoYEYC95F8ndxqI2m5bxvrL
	 4JfXveUM6puUQ==
Date: Mon, 24 Nov 2025 08:49:14 -0800
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
Subject: Re: [PATCH v10 5/8] crypto: Add ML-DSA crypto_sig support
Message-ID: <20251124164914.GA6186@sol>
References: <20251120104439.2620205-6-dhowells@redhat.com>
 <20251120104439.2620205-1-dhowells@redhat.com>
 <3374841.1763975577@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3374841.1763975577@warthog.procyon.org.uk>

On Mon, Nov 24, 2025 at 09:12:57AM +0000, David Howells wrote:
> diff --git a/crypto/mldsa.c b/crypto/mldsa.c
> new file mode 100644
> index 000000000000..2146c774b5ca
> --- /dev/null
> +++ b/crypto/mldsa.c
> @@ -0,0 +1,201 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * crypto_sig wrapper around ML-DSA library.
> + */

Still not really sure what the point is.  There's only one user of
crypto_sig, and it could just call the ML-DSA functions directly.

- Eric

