Return-Path: <keyrings+bounces-3983-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGjTBYTZfmmQfgIAu9opvQ
	(envelope-from <keyrings+bounces-3983-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Sun, 01 Feb 2026 05:41:40 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E08C4EC2
	for <lists+keyrings@lfdr.de>; Sun, 01 Feb 2026 05:41:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C98D03013B51
	for <lists+keyrings@lfdr.de>; Sun,  1 Feb 2026 04:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED4782D6E53;
	Sun,  1 Feb 2026 04:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7Sh4Nb6"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AC72798F3;
	Sun,  1 Feb 2026 04:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769920897; cv=none; b=DIJrKgMi43CEfClzNgR2MPQU4k3RKcdAlIk2iEdopqIOIVLOqCNwFIH+kPhOL2h5Kk9fB/yu/Yfh6ulNOMnW+H7jhyy8rxXpUWo1K3StGNGtxg4nuUxbGglKL58bBFQCp0R9fjUvBZiJYIBN4c+agms7JPfV6HAIq0ULW8cESmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769920897; c=relaxed/simple;
	bh=4KOknl6N+EMg91T+4Jdta0Y0/KymmFiMN0hN8qyOIw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swlnIYE37nO7FbWonHHVYohJT09PRgqMFQI6GY1xnD8gZjr+DgGWgJcYjCyE3HjVpnCP7PJd6UbU3Rj5d1zfFTex890+CJ2v8MHWXdDNLFCaoB5xEcuccuQxjqAJCPkkLonmGskpiMqVX7ajEi2eE0vc7IdC3G4Pw7EwEtH/jMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7Sh4Nb6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06ED2C4CEF7;
	Sun,  1 Feb 2026 04:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769920897;
	bh=4KOknl6N+EMg91T+4Jdta0Y0/KymmFiMN0hN8qyOIw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7Sh4Nb6tcAfbCKRvtDS40Gp5TOnZnJkzBJYvyG4zEG5Q7cdSaZex4+jz2kWUaF15
	 0EKZQrhtRfPFSR2Pe6Oi9ho3V1oACRb+hLhirPSBi4gLSGOCbluzqsdv9jBOQxXJ7C
	 UscecSuKR3JpyRyom+X1Ubtz6kPfcUgbsGhKQ2NdUAnOL6eRkK7o8ibuYYFiEQRGYo
	 lug8gIY1ftUnyaouZNJt3X5d1tZwyutCTqDrT1hLeK2DGF0fWDrAzUhYohQUchwdMb
	 NY1WVqGHHir5eOs5e1Z77lq6zdwnzWDHQhttLEgJNJmd0Gy9qzVSifbBTdg7gdmZr3
	 K3bTrAJm7PeIA==
Date: Sat, 31 Jan 2026 20:41:35 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Hodges <hodgesd@meta.com>
Cc: David Howells <dhowells@redhat.com>, Lukas Wunner <lukas@wunner.de>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: pkcs7 - use constant-time digest comparison
Message-ID: <20260201044135.GA71244@quark>
References: <20260201035503.3945067-1-hodgesd@meta.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201035503.3945067-1-hodgesd@meta.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-3983-lists,keyrings=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,keyrings@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[keyrings];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C2E08C4EC2
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 07:55:03PM -0800, Daniel Hodges wrote:
> This creates a timing side-channel that could allow an
> attacker to forge valid signatures by measuring verification time
> and recovering the expected digest value byte-by-byte.

Good luck with that.  The memcmp just checks that the CMS object
includes the hash of the data as a signed attribute.  It's a consistency
check of two attacker-controlled values, which happens before the real
signature check.  You may be confusing it with a MAC comparison.

- Eric

