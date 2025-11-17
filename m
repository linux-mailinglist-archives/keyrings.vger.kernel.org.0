Return-Path: <keyrings+bounces-3369-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 80294C654F3
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 18:04:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1358F360D29
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 16:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 701E72FE574;
	Mon, 17 Nov 2025 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pk2r95xi"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3659B2FC890;
	Mon, 17 Nov 2025 16:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763398558; cv=none; b=ltVUD3/Lu4o4rf1S8Otlt7ftfnoZ/YmPiD9MDp+qs49+x+fVDWJnz45uFmVOk/1d6ndJWzW3OhfQ8L+O5xXBpgfmQmIVFf3HBShBnsTEKdGkz0xXUPu+VhBJv27GjU4rP9lqO0VeO6u6Y/R+Yx00SFJy2zu0Uyf/s4Ce2OEfK7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763398558; c=relaxed/simple;
	bh=KSJUzwn36aYmzSijXMS3vLUqgHm17tglwEeTlWVa2s8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHrVo+ap8eMssg+g1fek9B1ErSzoDHz9RGMlpU7nC5LDOUDTO0Z0aejp9Bb/fJjYLLhhoNm6SRP4pxccfEpNApwFVlkqKbJIGMrwM9dqNXBSMaX72Od6Fdf1kH2nI2AHtZpKO1zOGJT6CP5JVOTz691kuylaGUI4IgvF+ZzPWXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pk2r95xi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4253BC4CEF1;
	Mon, 17 Nov 2025 16:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763398557;
	bh=KSJUzwn36aYmzSijXMS3vLUqgHm17tglwEeTlWVa2s8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pk2r95xitwhnTtZK/QeFCcxyvph47vXNblgHgn56yHF/aw1xYSiquSccPw+sIgprZ
	 C4xCvR/XwWzePc4FFxr8M4E4+xIzPkMCOg/lnh4bM5scyDTZmkWVqfWgX4aGwMtgFe
	 hypH4NY/A0D6nCOPt3HJrbaat4oaHfNthMGfnGFwRv+07sTbKjI58w2Lt5csKZvzj1
	 8yWfB6xBatAzbp90TtlbIkCp5dZiyz0hK4hwPrDlVMIOhkl3YwO7qgGgJ6yujxEm7D
	 tyjYF0DpIy8lwdRi7ehp+Jm8I2KET0PDv4zrrLWpSPKZ0X4HVMJRLgyAJOt7N6zWTI
	 MBuCNwylvJK5A==
Date: Mon, 17 Nov 2025 08:54:15 -0800
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
Subject: Re: Where to add FIPS tests
Message-ID: <20251117165415.GB1584@sol>
References: <20251117145606.2155773-1-dhowells@redhat.com>
 <2158596.1763395299@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2158596.1763395299@warthog.procyon.org.uk>

On Mon, Nov 17, 2025 at 04:01:39PM +0000, David Howells wrote:
> Hi Herbert,
> 
> I'm wondering from where I should invoke the FIPS tests for ML-DSA.
> 
> Currently, the asymmetric key type has some FIPS selftests for RSA and ECDSA
> built into it, but I wonder if that's the best way.  The problem is that it
> does the selftest during module init - but that can only test whatever
> algorithms are built into the base kernel image and initialised at the time
> late_initcall() happens.
> 
> It might be better to put the tests into the algorithm modules themselves -
> but that then has a potential circular dependency issue.  However, that might
> not matter as the asymmetric key type won't be built as a module and will be
> built into the kernel (though some of the components such as X.509 and PKCS#7
> can be built as modules).
> 
> If I don't involve X.509/PKCS#7 in the selftest, then doing it from the ML-DSA
> modules during module init would be fine.
> 
> Do you (or anyone else) have any thoughts?

The FIPS self-test should just go in the algorithm module itself and
test ML-DSA directly.  See the other lib/crypto/ FIPS self-tests.
Please check the FIPS Implementation Guidance documentation to see what
is needed; it isn't actually very much.

- Eric

