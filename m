Return-Path: <keyrings+bounces-3864-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLe5LhcEcGmUUgAAu9opvQ
	(envelope-from <keyrings+bounces-3864-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 23:39:19 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 756214D181
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 23:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4F74C90F3F3
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 22:03:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A8633C00B4;
	Tue, 20 Jan 2026 22:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XfzOhhSn"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B7A32BF43;
	Tue, 20 Jan 2026 22:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946606; cv=none; b=szwfubhlTCp3fZppOp8yARRq5pYtOQ8rWy0wya3jOyd98s3cCx6wLzQGfrBAAODvg77zsjQuEtamBLfg4v4ygBggw3RFKgcL5I1ZXbtZh0zInIDyQKgjpfQMREo7TnnijUqm0ULh4LsAluYnm3e/CBMjbDqG6jS+doxvXGShhuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946606; c=relaxed/simple;
	bh=pXeX6+6IzzGCUIZ6OongI+PLe4NHGNNdUP78LQsAv/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=joaQL/TqtQqWkwUOtCquAzFVS3IkC91KCKRc81ioXmd4ftsko6YJpBmzCrSJfQI9q/F7pDp/k2b7CWRpuNss6pTtN7b1/LY2UqmMvfn87IhXSDq2RyMtUakRaR7wpRD1D9fjwToUjRx89znjfbOTyt8t+3nrUkTtP8EE3IcX9DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XfzOhhSn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E1E4C16AAE;
	Tue, 20 Jan 2026 22:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768946605;
	bh=pXeX6+6IzzGCUIZ6OongI+PLe4NHGNNdUP78LQsAv/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XfzOhhSnh4wtPt0axUq2u9Z2svXL3sUAVDOBI2b8/ekHPHWwm9VfAUyt3jNN7kfqL
	 Y4ObIaTRFDJTtZs1B6zeBC61Vui6FeBxIDrnzMWOIi1Uue7TsoZFA4ErwSvIUflteA
	 mZT0o3bgQeFv6WpKZd/EtWIFUg+oZqe8DtdcOwYW9VGHLJVybqmA/EGpaWMQJvds3h
	 RJ494aCLeihHOI0sA35SBTLCS++no9EZnlBC0ewLuMCKgxgtV08v01XCvm4foUpnGr
	 HycAL+wztaiIwzgDawdrbI/bLaZIl953Et8JRGp6XXvs32Zh8+uhDQ6wtA6HT7r4aI
	 vfLUASv088Ohw==
Date: Tue, 20 Jan 2026 14:03:21 -0800
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
	linux-kernel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v12 06/10] crypto: Add supplementary info param to
 asymmetric key signature verification
Message-ID: <20260120220321.GA6191@quark>
References: <20260115215100.312611-1-dhowells@redhat.com>
 <20260115215100.312611-7-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115215100.312611-7-dhowells@redhat.com>
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3864-lists,keyrings=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 756214D181
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Jan 15, 2026 at 09:50:48PM +0000, David Howells wrote:
> Add a supplementary information parameter to the asymmetric key signature
> verification API, in particular crypto_sig_verify() and sig_alg::verify.
> This takes the form of a printable string containing of key=val elements.

As I'm sure you're aware, C has native support for function parameters.
No need to serialize to a string on the caller side and then deserialize
in the callee.

This is yet another example of a case where trying to fit different
algorithms into a generic API doesn't work well.

We should just have a library API for each signature algorithm, with
each algorithm taking the parameters it needs.

- Eric

