Return-Path: <keyrings+bounces-4089-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKpWAR+foGlVlAQAu9opvQ
	(envelope-from <keyrings+bounces-4089-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Thu, 26 Feb 2026 20:29:35 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 242501AE582
	for <lists+keyrings@lfdr.de>; Thu, 26 Feb 2026 20:29:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31E16300845B
	for <lists+keyrings@lfdr.de>; Thu, 26 Feb 2026 19:22:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0537144D037;
	Thu, 26 Feb 2026 19:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HAsCIvfl"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718AC44A706;
	Thu, 26 Feb 2026 19:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772133722; cv=none; b=li97VXvaFMoX9LIh59zhPXOS5fnSJsA3IvWI50daA22rRZsYYyHWUC5SUIBtKyhuV7K6yinvjCL7Qx1W+6XDnvUdLYXERRxjax7oor+uLL1yWP8LuNypwevR+buy6FHLd8nWi4mXid2AnTXfFOc7pjTtsZHhDFQ/+pWFQsY/ttc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772133722; c=relaxed/simple;
	bh=Jy0IVwxlMXu50HaRVFORi447FTZdzMyp5RoTp8ZnaIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSa/1E78rr7ctyHLeh1NxQkjZUx6RL3oTqo3nnkCwk/9iqsHHjur4MFVReEnTjWwqbu+5yfMpA0FVCDxH/Dtzak5pa39lzM1gX+XhLym8pRErK8ChnJhc9WJEUEMQxQD9PuPgeF+buT7aJrggY4UB4yMpHE8olhfn/0LaM1BctM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HAsCIvfl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2D2C116C6;
	Thu, 26 Feb 2026 19:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772133721;
	bh=Jy0IVwxlMXu50HaRVFORi447FTZdzMyp5RoTp8ZnaIc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HAsCIvfl4MyGNvbbgcdxx4UClCdM8+sDHsnnUM3XSnxIMaIM4ICC/ZRldFFuS/54i
	 laoRiRdVoylSeKimqwxAVMDKITUMFKvZj6hGu0LtIgPqI0tXy1yBXX43kS1rZ1y1cA
	 WS+6wQP8VpWcQLOei2t1qBoNrXga1jLn6lomTai8g+l29vvcF2DHBHLZ8hXCsAIFdP
	 xdKCkOcKN1ZLbM8n2ipOea9gYcyHV8BCXgEAEvH/UHj5VKoO+VFbV7yUvvb17gTcZ8
	 xprtHG/cI7TfuVNB7JPIyGAjwxr3suY4wxtmGJkMZj9IN/knVRZZiGarFFFczTe2+8
	 Cayu0P1d5c82Q==
Date: Thu, 26 Feb 2026 11:21:10 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <davidgow@google.com>
Cc: linux-crypto@vger.kernel.org, David Howells <dhowells@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Stephan Mueller <smueller@chronox.de>,
	Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	KUnit Development <kunit-dev@googlegroups.com>
Subject: Re: [PATCH v4 2/2] lib/crypto: tests: Add KUnit tests for ML-DSA
 verification
Message-ID: <20260226192110.GF2251@sol>
References: <20251214181712.29132-1-ebiggers@kernel.org>
 <20251214181712.29132-3-ebiggers@kernel.org>
 <CAMuHMdULzMdxuTVfg8_4jdgzbzjfx-PHkcgbGSthcUx_sHRNMg@mail.gmail.com>
 <20260226180538.GC2251@sol>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226180538.GC2251@sol>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4089-lists,keyrings=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,keyrings@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[keyrings];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 242501AE582
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:05:38AM -0800, Eric Biggers wrote:
> On Thu, Feb 26, 2026 at 02:09:47PM +0100, Geert Uytterhoeven wrote:
> > On Sun, 14 Dec 2025 at 19:18, Eric Biggers <ebiggers@kernel.org> wrote:
> > > Add a KUnit test suite for ML-DSA verification, including the following
> > > for each ML-DSA parameter set (ML-DSA-44, ML-DSA-65, and ML-DSA-87):
> > >
> > > - Positive test (valid signature), using vector imported from leancrypto
> > > - Various negative tests:
> > >     - Wrong length for signature, message, or public key
> > >     - Out-of-range coefficients in z vector
> > >     - Invalid encoded hint vector
> > >     - Any bit flipped in signature, message, or public key
> > > - Unit test for the internal function use_hint()
> > > - A benchmark
> > >
> > > ML-DSA inputs and outputs are very large.  To keep the size of the tests
> > > down, use just one valid test vector per parameter set, and generate the
> > > negative tests at runtime by mutating the valid test vector.
> > >
> > > I also considered importing the test vectors from Wycheproof.  I've
> > > tested that mldsa_verify() indeed passes all of Wycheproof's ML-DSA test
> > > vectors that use an empty context string.  However, importing these
> > > permanently would add over 6 MB of source.  That's too much to be a
> > > reasonable addition to the Linux kernel tree for one algorithm.  It also
> > > wouldn't actually provide much better test coverage than this commit.
> > > Another potential issue is that Wycheproof uses the Apache license.
> > >
> > > Similarly, this also differs from the earlier proposal to import a long
> > > list of test vectors from leancrypto.  I retained only one valid
> > > signature for each algorithm, and I also added (runtime-generated)
> > > negative tests which were missing.  I think this is a better tradeoff.
> > >
> > > Reviewed-by: David Howells <dhowells@redhat.com>
> > > Tested-by: David Howells <dhowells@redhat.com>
> > > Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> > 
> > Thanks for your patch, which is now commit ed894faccb8de55c
> > ("lib/crypto: tests: Add KUnit tests for ML-DSA verification")
> > in v7.0-rc1.
> > 
> > > --- a/lib/crypto/tests/Kconfig
> > > +++ b/lib/crypto/tests/Kconfig
> > > @@ -36,10 +36,19 @@ config CRYPTO_LIB_MD5_KUNIT_TEST
> > >         select CRYPTO_LIB_MD5
> > >         help
> > >           KUnit tests for the MD5 cryptographic hash function and its
> > >           corresponding HMAC.
> > >
> > > +config CRYPTO_LIB_MLDSA_KUNIT_TEST
> > > +       tristate "KUnit tests for ML-DSA" if !KUNIT_ALL_TESTS
> > > +       depends on KUNIT
> > > +       default KUNIT_ALL_TESTS || CRYPTO_SELFTESTS
> > > +       select CRYPTO_LIB_BENCHMARK_VISIBLE
> > > +       select CRYPTO_LIB_MLDSA
> > 
> > These two selects mean that enabling KUNIT_ALL_TESTS also enables
> > extra functionality, which may not be desirable in a production system.
> > Fortunately CRYPTO_LIB_MLDSA is tristate, so in the modular case
> > the extra functionality is a module, too, and not part of the running system
> > by default.  Unfortunately CRYPTO_LIB_MLDSA is invisible, so this cannot
> > just be changed from "select" to "depends on". But as CRYPTO_MLDSA
> > also selects it, perhaps the test can be made dependent on CRYPTO_MLDSA?
> 
> "depends on CRYPTO_MLDSA" doesn't make sense, since the test is for the
> code in CRYPTO_LIB_MLDSA, not CRYPTO_MLDSA.  CRYPTO_MLDSA just happens
> to be one of the users of CRYPTO_LIB_MLDSA.  In this case the names
> happen to be similar, but consider e.g. CRYPTO_LIB_AESGCM which is
> selected by AMD_MEM_ENCRYPT.  If we added a test for CRYPTO_LIB_AESGCM,
> it clearly shouldn't use "depends on AMD_MEM_ENCRYPT".
> 
> So, "depends on CRYPTO_LIB_MLDSA" would be the correct way to switch it
> from a selection to a dependency.
> 
> It's just a bit annoying to do this for hidden symbols, given that it
> makes it so that anyone who wants to unconditionally enable the test,
> like what I do to test all the crypto library code, has to find and
> enable some other random kconfig symbol that enables the code.
> 
> Also, the series that originally added CRYPTO_LIB_MLDSA and its test
> (https://lore.kernel.org/linux-crypto/20251214181712.29132-1-ebiggers@kernel.org/)
> didn't add any user of CRYPTO_LIB_MLDSA besides the test, as the real
> user came a bit later.  So if I had used "depends on CRYPTO_LIB_MLDSA",
> my series wouldn't have received any build bot coverage, and I'd have
> needed to temporarily carry local patches to build and test the code.
> 
> But if this is really the convention for KUnit, as it seems to be, I
> will follow it and work around it for my own testing.  So I'll plan to
> change the crypto library and CRC tests to use "depends on".
> 
> But any thoughts from the KUnit maintainers would also be appreciated.
> Is it indeed intended that the tests for library modules depend on those
> modules rather than selecting them, despite their symbols being hidden?

I sent the following patch to consider:
https://lore.kernel.org/linux-crypto/20260226191749.39397-1-ebiggers@kernel.org/

- Eric

