Return-Path: <keyrings+bounces-3502-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4B4CA0BE6
	for <lists+keyrings@lfdr.de>; Wed, 03 Dec 2025 19:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6ACA33001C3C
	for <lists+keyrings@lfdr.de>; Wed,  3 Dec 2025 18:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AABB398FBE;
	Wed,  3 Dec 2025 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XovomSOO"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2742A398F9F;
	Wed,  3 Dec 2025 17:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764783898; cv=none; b=YYRX94kztAxPaqubfniNoYS3qfim4ELKCrCdaPuU5KUFO3gAwA0qfXWKloNX+WdqwFgYK0B+psaU/BeGQ3Q8iMEmHC1nWI41NZBksVM3lz6UU20njDxomV31sTWLFLmPqWuZ7t6qtOby8MhzmMO/vBYeoes+X7UkSMZQ7avPUvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764783898; c=relaxed/simple;
	bh=4p/SI+ShTQRiPFExquXJgH9YsWAkr+Ngsjf4U9lX+C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G09DyR9gw2ymsrPP+gcDxlXlQ/m0zctXyp1JOXdohcjGiPtalEObZ120+pSNFareBIirtIqa+FI0WC30N8kM8WnDojQhU1Ycs17++cHUCcLlyAPU9HOtJDZqYaB6XZ16dV4TCpi7dLY3LYW8ucFpvIQnI2hsrS+pEaSfAO3sdpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XovomSOO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CC9C4CEF5;
	Wed,  3 Dec 2025 17:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764783897;
	bh=4p/SI+ShTQRiPFExquXJgH9YsWAkr+Ngsjf4U9lX+C4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XovomSOOnOJUYIjPZ6/iCgUFKijuO/DFDBCu7nFWkOuvgFoVN9VzYe1iitQ6zaZ76
	 ygKDIICk3LUnBZyd3PiAXB8MDRP7+IzeBvmkhlbP36gzfjG10oFQMpNZfetKzH9uv0
	 /+oKSgIzOE/q056Xgz6wy9IoYR6G24LYUhw9JDOtnsDhcJ5ZfDlMYW0zZM1kiJoWbL
	 Ra1gzn5QjR9I2mHc55b0d+9Tt8LgguZi0XQ0o1LX4Co3QKgTlzLZ5gMrRp0HtEDm5I
	 AdKymhB1PttmX8psvJftKLEzX/FX21ALvRwZPh8xvrrPt29CCkUEeKi1cqC3Fyc2tw
	 rUguIcEI2R0uQ==
Date: Wed, 3 Dec 2025 09:43:03 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] lib/crypto: tests: Add KUnit tests for ML-DSA
 verification
Message-ID: <20251203174303.GA1417@sol>
References: <20251203072844.484893-3-ebiggers@kernel.org>
 <20251203072844.484893-1-ebiggers@kernel.org>
 <1682768.1764752475@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1682768.1764752475@warthog.procyon.org.uk>

On Wed, Dec 03, 2025 at 09:01:15AM +0000, David Howells wrote:
> I'm seeing:
> 
> 	ERROR: modpost: module mldsa_kunit uses symbol mldsa_use_hint from namespace EXPORTED_FOR_KUNIT_TESTING, but does not import it.
> 

Yep, sorry for the trouble.  mldsa_kunit.c needs:

    MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");

Would be nice if the kunit_test_suite() macro did that so that test
authors don't have to remember to add the namespace import separately.
But maybe there's a reason why they need to be separate.

- Eric

