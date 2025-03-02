Return-Path: <keyrings+bounces-2426-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D60A4B0D5
	for <lists+keyrings@lfdr.de>; Sun,  2 Mar 2025 10:25:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA7C3189268A
	for <lists+keyrings@lfdr.de>; Sun,  2 Mar 2025 09:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B0A1C695;
	Sun,  2 Mar 2025 09:25:41 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B961A944;
	Sun,  2 Mar 2025 09:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740907540; cv=none; b=E/akrsqGX5PoUwYr6CcWfKDiqhHKlVKbAbbisyq4rjnJmt8N89eAvSEriEui5uneisMWDKgy2CN93doQpxCWDcAON16VUgwGwu7Nam8QtT2GcUP2vVveGIld6gBUA7e3aXhqA5E8lPmRCsjwNlt2Hzuh8EEbzb6rtBZ9khBR+Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740907540; c=relaxed/simple;
	bh=Xhh6ntpRaGnGUlSwaOsLqobSpUI47ZSIwrqNw6aIjcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fdroNIWleVo0EpEjww4iqf8SiFwSjWpoXtwKFEsT7tff8TMbqelyl5qSIVe16OXIiAXDXGAJYNww5I1LmAmI96Hae6VujRrOC1M3PFRxP/e1cKH8oVfYoAKIb4sD+/89E4z7DTZ47q7bZi3mT9UvcWnnh6mEhT0JtWxiLoT2HwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id C742F2807048D;
	Sun,  2 Mar 2025 10:25:34 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id B20406FAE7A; Sun,  2 Mar 2025 10:25:34 +0100 (CET)
Date: Sun, 2 Mar 2025 10:25:34 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Stefan Berger <stefanb@linux.ibm.com>,
	Vitaly Chikunov <vt@altlinux.org>,
	David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
	Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH v2 3/4] crypto: ecdsa - Fix enc/dec size reported by
 KEYCTL_PKEY_QUERY
Message-ID: <Z8QkDi79zO-PIaVV@wunner.de>
References: <cover.1738521533.git.lukas@wunner.de>
 <3d74d6134f4f87a90ebe0a37cb06c6ec144ceef7.1738521533.git.lukas@wunner.de>
 <Z6h8L0D-CBhZUiVR@gondor.apana.org.au>
 <Z6iRssS26IOjWbfx@wunner.de>
 <Z6mwxUaS33EastB3@gondor.apana.org.au>
 <Z6pLRRJFOml8w61S@wunner.de>
 <Z7FnYEN-OnR_-7sP@gondor.apana.org.au>
 <Z7HBsONxj_q0BkJU@wunner.de>
 <Z8QNJqQKhyyft_gz@gondor.apana.org.au>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8QNJqQKhyyft_gz@gondor.apana.org.au>

On Sun, Mar 02, 2025 at 03:47:50PM +0800, Herbert Xu wrote:
> On Sun, Feb 16, 2025 at 11:45:04AM +0100, Lukas Wunner wrote:
> > I think the best option at this point isn't to aim for removal
> > but to wait for Cloudflare to beat their out-of-tree implementation
> > (which apparently isn't susceptible to side channel attacks)
> > into shape so that it can be upstreamed.
> 
> I don't think having a one-off fix is sufficient.  We need someone
> who can maintain this for the long term.  Are you willing to do this?

In principle, yes.

Which files are we talking about exactly?

Thanks,

Lukas

