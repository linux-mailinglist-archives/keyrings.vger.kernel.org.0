Return-Path: <keyrings+bounces-3862-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APyaCfUKcGlyUwAAu9opvQ
	(envelope-from <keyrings+bounces-3862-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 00:08:37 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 835074D84B
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 00:08:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 29D51B0B3AD
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 21:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D481444A702;
	Tue, 20 Jan 2026 21:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIQf9k79"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A01643636B;
	Tue, 20 Jan 2026 21:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768945434; cv=none; b=S3zZLfYb29F80lEf4b+bm4legyYBkGWP2Np5InwsP4EKm6RUlYYmvCr9DdmvSYiVQdV9dKsBiynm2fZ3yABjhz4Nb0pTsqIJEM2D1MFpKjTf6uzp795yJkrdpI3HMMAX3KGNSNZLn3Bw1roIVlCfMgqXGs8rwu8qER2BYvwkbMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768945434; c=relaxed/simple;
	bh=Ir7edGXEgKm2ZpAr9WbdO/l8YBWCcWGJe7+b7X82x8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WlExLMKt2kKXCgsq5Ff61s9X3VD9k13UrG4YfpjF95mz2r0vGQkRFKGGqbxlpWDsolRhq4AEU1iBUV/gjSJpcX9KPCGLk8KYqFsfWPB6W665/ZjCWFFiUoLmyQKA9ryokaXvj+uLYM7pnQGHM9tS3iHYOSB2Cqi6lrAfuJYKZH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIQf9k79; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF6EC16AAE;
	Tue, 20 Jan 2026 21:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768945433;
	bh=Ir7edGXEgKm2ZpAr9WbdO/l8YBWCcWGJe7+b7X82x8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CIQf9k79/i4ovqRQm3Yvgl4oqgHDyHc1oscBJe42/WT2Xo0UDZeohZ8K7/AMRYAod
	 8zJn1WCx1IDMIaTVzgzQubSBBQuTdnYF5XQGxvfQocHnb3HUJ8B8JgV9AvSR3GtVjA
	 qiyqiV5CLr/G1zqFJN8uvSFA+oMjV9U7y/uHQVFy27n3Wu2UCgIaIL9WVSFqSN4kqN
	 +c0qqFlykaa9rhhSrDvnUDNANlBjlSaD0ZIAyoVsX8keJPDuI+hWzi9QJ36qFqFyFD
	 jR7tPqcOaDHwOgLx3bkye3HAHqNhgxgzLqn5ujxA6ZR/qa5gOXZ2iJaI3gCCR9ixZv
	 t9JjXDgioa4qg==
Date: Tue, 20 Jan 2026 13:43:50 -0800
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
Subject: Re: [PATCH v13 12/12] pkcs7: Add ML-DSA FIPS selftest
Message-ID: <20260120214350.GE2657@quark>
References: <20260120145103.1176337-1-dhowells@redhat.com>
 <20260120145103.1176337-13-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120145103.1176337-13-dhowells@redhat.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3862-lists,keyrings=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 835074D84B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:50:58PM +0000, David Howells wrote:
> Add a FIPS selftest for ML-DSA.

I already did that.  See mldsa_mod_init() in lib/crypto/mldsa.c.

You may be misunderstanding what FIPS 140 requires.  It requires a
self-test for the underlying algorithm, i.e. ML-DSA in this case.  It
doesn't require a self-test for code that uses the algorithm, i.e. the
CMS and X.509 code in this case.

The CMS and X.509 code needs to be tested of course, but that's just
standard software development.  Nothing to do with FIPS 140.  The test
should just be a standard KUnit test.

- Eric

