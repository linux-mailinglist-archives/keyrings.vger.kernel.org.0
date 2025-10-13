Return-Path: <keyrings+bounces-3212-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E66BD1B8D
	for <lists+keyrings@lfdr.de>; Mon, 13 Oct 2025 09:00:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 819604E2B6E
	for <lists+keyrings@lfdr.de>; Mon, 13 Oct 2025 07:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993BF2BE64F;
	Mon, 13 Oct 2025 07:00:26 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018F27F4CA;
	Mon, 13 Oct 2025 07:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.223.78.240
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760338826; cv=none; b=t81ws2cMQYMHN3nHWVRcRv9LtIIfCv3coH4ZZafVzqLQr/3U5xtg0d5K9LWdry2NlQvzcEzuZ6DfmC+5lh0ghheAomgN/x1wgy9w6U0P8UFoQ/767tFZRaxNY66cts6spobTtfGLjFx9RlYENtqMPjr+ucmSxIkfjYMHKYXaUDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760338826; c=relaxed/simple;
	bh=jQG9srPe4yk5Y3eIy1NcdBh1eIeb2f/lUN+bdksvR+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCYYc1m2Wv/JxycdlwlM2CxHNin0xkBkFc+pqHjV3ujaCPcj2EKnpg45vKmj+OwsF9Ybm8CMw7nFfHoRTSyqVx5wCHFQvGJNvf449sdgDz+u0i7kaYCigpyZPliI3tpRiHT54ZSC0ic9d9NOBjS9p/yyEpECISrG3j3FSoC6dbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=none smtp.mailfrom=h08.hostsharing.net; arc=none smtp.client-ip=83.223.78.240
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=h08.hostsharing.net
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id 7598820083C0;
	Mon, 13 Oct 2025 09:00:20 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 628684A12; Mon, 13 Oct 2025 09:00:20 +0200 (CEST)
Date: Mon, 13 Oct 2025 09:00:20 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] crypto: asymmetric_keys - simplify
 asymmetric_key_hex_to_key_id
Message-ID: <aOyjhBVI1osybEGb@wunner.de>
References: <20251007185220.234611-2-thorsten.blum@linux.dev>
 <20251007185220.234611-3-thorsten.blum@linux.dev>
 <aOuavtSpoNLWHoMS@wunner.de>
 <A0C349D1-C7FA-40C6-971B-910122B1AAE1@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A0C349D1-C7FA-40C6-971B-910122B1AAE1@linux.dev>

On Sun, Oct 12, 2025 at 03:23:02PM +0200, Thorsten Blum wrote:
> On 12. Oct 2025, at 14:10, Lukas Wunner wrote:
> > On Tue, Oct 07, 2025 at 08:52:21PM +0200, Thorsten Blum wrote:
> > > Use struct_size() to calculate the number of bytes to allocate for the
> > > asymmetric key id.
> > 
> > Why?  To what end?  To guard against an overflow?
> 
> I find struct_size() to be more readable because it explicitly
> communicates the relationship between the flexible array member 'data'
> and 'asciihexlen / 2', which the open-coded version doesn't.
> 
> 'sizeof(struct asymmetric_key_id) + asciihexlen / 2' works because the
> flexible array 'data' is an unsigned char (1 byte). This will probably
> never change, but struct_size() would still work even if it did change
> to a data type that isn't exactly 1 byte.
> 
> Additionally, struct_size() has some extra compile-time checks (e.g.,
> __must_be_array()).

My view is that mere readability improvements (which are subjective)
and theoretical safety gains are not sufficient to justify a change.

In general submission of many small treewide refactoring changes in a
shotgun fashion is problematic because they occupy reviewers' and
maintainers' time (which is a scarce resource) and they mess up the
git history (complicating git blame), often for little to no gain.
I've heard one x86 maintainer say he considers them "more harm than good
nowadays".

In this particular case, the struct size calculation can never overflow
because even if asciihexlen has SIZE_MAX, the division by 2 ensures that
adding sizeof(struct asymmetric_key_id) doesn't cause an overflow.
So this patch doesn't seem to solve an actual problem.

Thanks,

Lukas

