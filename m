Return-Path: <keyrings+bounces-3282-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB358C11543
	for <lists+keyrings@lfdr.de>; Mon, 27 Oct 2025 21:11:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7C9DF352757
	for <lists+keyrings@lfdr.de>; Mon, 27 Oct 2025 20:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C222DF13E;
	Mon, 27 Oct 2025 20:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dn4MF+s4"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED9331CA7E;
	Mon, 27 Oct 2025 20:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761595871; cv=none; b=DSbV6kVrsEXMkIkvjeofS9JuXoFlcDDtzWmJtM/Tds9CLaMcBtqRUQGY/kBVedELijkUEYTIXyd9ZmbZ0G5RcL3KxwXwsF7NcBznOxQFLIpWig1NYwm/4wpTlTrWvT8jajYNbcqEKx5ef+a6pGX1tzX/Nr3YLz2wtlmXR2kjQag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761595871; c=relaxed/simple;
	bh=Rwk3W2FOk8TExlKpUy98fBN2da/O2sc56hzYXbPAcRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9TfyYNOXZvIBW+51usZruPeKYIO9puJihN6m0Lcr022J6o+01A5pkpNKpI2EDfED28QH+BA13R9j3g7DDrMoAw4DnJ3sKkLKPJMwqRBlngKcEnbrUQl8ENAGvM4FeMwWhdJRLUhC0ySx5tM/VH2ItbX5dJWvt7kglYwN9tQ8W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dn4MF+s4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D1DC4CEF1;
	Mon, 27 Oct 2025 20:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761595870;
	bh=Rwk3W2FOk8TExlKpUy98fBN2da/O2sc56hzYXbPAcRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dn4MF+s4ZAdzKC4vx01C9ZTyZ49Z1qX1mL05gU5xSm1goYlVFCR+SWxCSmCLdaHe7
	 /L2VTY0cBUZMWEEBwTKlhKTByI4fEsEOOCZw/sgPdp1pdnddxahot7A9egesQAalT1
	 cbBJCLHNfw/y++sOfP2NLKz/Uf9DahFM9R8Bgt7PYxwfZH3000uI+z4VYpEQM1bvyM
	 wgu146QagAAAfItMzFCtmhVSb+l6FrtkMntQcI6IoIXcRKHYqTWVHySbxp41UNN3do
	 xQD1/WG+zDuOBEYI2dEtcFtI3yyBgL0NjvzpyZe03wdhNDvWYo0GqmSI0dT1FOi7Yh
	 FmJqeZmlOAjGw==
Date: Mon, 27 Oct 2025 22:11:07 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] keys: Fix typos in 'struct key_type' function pointer
 comments
Message-ID: <aP_R2ycWjzRWEV8V@kernel.org>
References: <20251016123619.98728-2-thorsten.blum@linux.dev>
 <aPvNqCRlMN5c8GaR@kernel.org>
 <E9856573-8D4D-4392-9AE5-5D40D1FC13F9@linux.dev>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E9856573-8D4D-4392-9AE5-5D40D1FC13F9@linux.dev>

On Fri, Oct 24, 2025 at 10:29:57PM +0200, Thorsten Blum wrote:
> On 24. Oct 2025, at 21:04, Jarkko Sakkinen wrote:
> > On Thu, Oct 16, 2025 at 02:36:19PM +0200, Thorsten Blum wrote:
> >> s/it/if/ and s/revokation/revocation/
> >> ...
> > 
> > The comment is also formatted incorrectly. It should be:
> > 
> > 	/* 
> > 	 * Free preparsed match data (optional).  This should be supplied if
> > 	 * ->match_preparse() is supplied. 
> > 	 */
> 
> The other struct fields are all commented with the first sentence
> starting after the '/*'.
> 
> I can fix this one trailing '*/' in v2, but the others should probably
> be fixed in a separate patch?

We don't want to batch update to all comments in this file as that e.g.
has more drawbacks than benefits because it increases the probability
of merge conflicts during backports.

I.e.

1. Refine the patch to address the remark that were anyhow modified.
2. Don't update any other comments just for the remark I did.
> 
> Thanks,
> Thorsten
> 


BR, Jarkko

