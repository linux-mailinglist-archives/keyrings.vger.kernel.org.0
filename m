Return-Path: <keyrings+bounces-3043-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E82AB8B370
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 22:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70F821CC31B8
	for <lists+keyrings@lfdr.de>; Fri, 19 Sep 2025 20:48:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9A9C286D40;
	Fri, 19 Sep 2025 20:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsEu5tP0"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2232206AC;
	Fri, 19 Sep 2025 20:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758314875; cv=none; b=l5+TJl3A5uIcITRfcYtGFJtyL1O1YEy1VKr7/6T0Hc2t7AGg/HkuFp/JXlINy5z4gAtzlAZLIk6Fc2+GZtosmL8XoxpKl4IuJZEooWKsXXOBZ2b6msillDi29XyQ5SO8iVu0fc6uS8bnpY7aFwRMOe8N8A0zGoTL8KPbDPWwbyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758314875; c=relaxed/simple;
	bh=jDC8h7t5c8O6Q8IkBOy7nxDb1kTMRuXzYJroSv/Rvqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deV1f5hg7BDBEi/OzN9VPBS9Pj1P0SpzL0VMqjUDbzVgfBKjZF+gKNXIOb0BfOrZYYCcP/vs6olZxkAQcUyAp/deccQXU42aT8r/BXrAp43KhaTGE7hj6XzONp1ZnMIuLXsX/hGKVmTUqVSdPb9maMJ9UZWQF45T2IBZd0Fq76Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsEu5tP0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077B2C4CEF0;
	Fri, 19 Sep 2025 20:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758314875;
	bh=jDC8h7t5c8O6Q8IkBOy7nxDb1kTMRuXzYJroSv/Rvqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EsEu5tP0qMTUshyVmneAm4wpkV/Tr/raDmQXlY0X8BwsNa4IyPJ5nCORa2WpEEqmt
	 1Uf3Ch+DOw3dPiv+vmzQ7rwoDv8GA+kZVyyJ/gga1Br8yopDyUpOlNuOODiz5MFCVU
	 OCG2RioV2tTDBlmReDVFCH8/l7tnlrciITVw6jDS2PvIZgDDWMUlX8E6Bgy9BRQjQ1
	 qxXZwpOIISYRql8CXy/56IhzgGlb7CgsbDRX6ghIE2aLvPXlpN9BE1tXA0wEAuw2Hl
	 BLbpMgUGJLLrV92o7kRDOFb+aaTQQqmiwUIG37IyYAI4GDrelFUtmgjtUl1P3mxsHi
	 LzstBPNehYgUw==
Date: Fri, 19 Sep 2025 15:47:49 -0500
From: Eric Biggers <ebiggers@kernel.org>
To: Stephan Mueller <smueller@chronox.de>
Cc: David Howells <dhowells@redhat.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Holger Dengler <dengler@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Simo Sorce <simo@redhat.com>, linux-crypto@vger.kernel.org,
	linux-s390@vger.kernel.org, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] lib/crypto: Add SHA3-224, SHA3-256, SHA3-384,
 SHA-512, SHAKE128, SHAKE256
Message-ID: <20250919204749.GB8350@quark>
References: <20250919190413.GA2249@quark>
 <3936580.1758299519@warthog.procyon.org.uk>
 <3975735.1758311280@warthog.procyon.org.uk>
 <5078839.1IzOArtZ34@tauon>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5078839.1IzOArtZ34@tauon>

On Fri, Sep 19, 2025 at 09:53:17PM +0200, Stephan Mueller wrote:
> Am Freitag, 19. September 2025, 21:48:00 Mitteleuropäische Sommerzeit 
> schrieb David Howells:
> 
> Hi David,
> 
> > > I see you also have a test in sha3_mod_init(), which doesn't make 
> sense.
> > > The tests should be in the KUnit test suite(s).  If you intended for 
> the
> > > sha3_mod_init() test to be a FIPS pre-operational self-test, then (1) 
> it
> > > would first need to be confirmed with the people doing FIPS
> > > certifications that a FIPS pre-operational self-test is actually
> > > necessary here, (2) it would need to be fixed to actually fulfill the
> > > requirements for that type of test such as panicing the kernel on
> > > failure, and (3) it would need to come in its own patch with its own
> > > explanation.  But, unless you are sure you actually need the FIPS test,
> > > just omit it out for now and focus on the real tests.
> > 
> > I disagree.  It should have at least a single self-test.  If we fail to 
> load
> > any modules because the hash is broken on a particular CPU, it would be
> > useful to have a note in dmesg.  Loading kunit test modules becomes 
> tricky
> > in such a case.

Well, testing is supposed to be done before the kernel is released, not
on every end user's computer.

If you insist, at least keep it lightweight and make sure it doesn't
detract from the real tests.

> Just for clarifications of the FIPS requirements: One test of any of the 
> SHA3/SHAKE algorithms during startup is sufficient for *one* Keccak 
> implementation. FIPS wants the actual Keccak sponge being tested, it does 
> not care for the miniscule differences between the different SHA/SHAKE 
> definitions.

Yes.  But I'm still a bit puzzled why there suddenly seems to be
interest in a FIPS pre-operational self-test for SHA-3 specifically.
lib/ has had SHA-1 for two decades without a FIPS pre-operational
self-test.  If someone actually needs this, surely they would also need
it, and have already needed it, for other algorithms?

> Yet, if we have multiple Keccak sponge implementations, then each needs its 
> own self test.

While lib/crypto/ often has multiple implementations of the algorithms,
only one implementation is used on a given system.

- Eric

