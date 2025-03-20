Return-Path: <keyrings+bounces-2502-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8647EA6AD4C
	for <lists+keyrings@lfdr.de>; Thu, 20 Mar 2025 19:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A49FA3B958B
	for <lists+keyrings@lfdr.de>; Thu, 20 Mar 2025 18:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93E2E22540F;
	Thu, 20 Mar 2025 18:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WSlt0R2Q"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648031953A1;
	Thu, 20 Mar 2025 18:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742496498; cv=none; b=bzUAbt68LdVzUud7GA4LDLi7A82BZAqjcE//c5uoAUz0fUMFlAHxSyp3mYnkixSv2iC9m+COj8uqxhHmsl3LqV0c+yqiPMWlHILyap14kYodL5mtpu0r5splC+8Axv6t41PAEEssmWIFOiWzh/ghJoSiSsNX5YuaLVS6vTdp6sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742496498; c=relaxed/simple;
	bh=QFQpQje8ZelBq+T6lJq/Z1PWpBMxlE4Rm+MCu8Kw4cU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnWBA5zKU4BhP1TTY/t4q69Y6loD+tuvveamWmCLwajk6ITv4BD6cVeYQ9Se5WMOxIaR+NILYBLsTJ01m+TevxHQOFX4aSzjpTMyXNKRSNQEbKtHmBnMFMeJ4hAY+bKrCbvwb52loZu2HeAzKmi8LSmVFO5XoyBTKg9mrhy8xso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WSlt0R2Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8D3C4CEDD;
	Thu, 20 Mar 2025 18:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742496497;
	bh=QFQpQje8ZelBq+T6lJq/Z1PWpBMxlE4Rm+MCu8Kw4cU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSlt0R2Q7ZN9sddDgsTdR2g7X+9k9JXxmOY5wjJzGuS35WIA05znGIqylEwOAKW5k
	 ypnM4mgEFLyfiKx1PlTrgyokmGNoDohKVuujPaDH3cjxSZiRF8n20R5zjLoCIPjwqV
	 rehXI8F917GDufiuFc3cfodLp7k2pZMEvXncuUMJM1xPeucJ+1HVd4luCEuidYek7T
	 sSi5i41Umjv6/DprhPIHe/YMmyZuxGGVhWE9d6o+/NnVLi6ufxoYtEFhvZkdJf9Cr4
	 Yx5gIxy2HjUauwjkPEQVRo/8moT5aHU2FIdl03ak6UKxTPYGbSe7ZvrE+58MrsU9+v
	 3Jf17asM7kJzg==
Date: Thu, 20 Mar 2025 20:48:13 +0200
From: Jarkko Sakkinen <jarkko@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Kees Cook <kees@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Josh Drake <josh@delphoslabs.com>,
	Suraj Sonawane <surajsonawane0215@gmail.com>,
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
	security@kernel.org, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] keys: Fix UAF in key_put()
Message-ID: <Z9xi7ZD27-TKJp7u@kernel.org>
References: <Z9w-10St-WYpSnKC@kernel.org>
 <2874581.1742399866@warthog.procyon.org.uk>
 <3176471.1742488751@warthog.procyon.org.uk>
 <Z9xQP0uhBEr3B890@kernel.org>
 <Z9xijTBHY93HCsLW@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9xijTBHY93HCsLW@kernel.org>

On Thu, Mar 20, 2025 at 08:46:41PM +0200, Jarkko Sakkinen wrote:
> On Thu, Mar 20, 2025 at 07:28:36PM +0200, Jarkko Sakkinen wrote:
> > On Thu, Mar 20, 2025 at 04:39:11PM +0000, David Howells wrote:
> > > Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > > 
> > > > > +		if (test_bit(KEY_FLAG_FINAL_PUT, &key->flags)) {
> > > > > +			smp_mb(); /* Clobber key->user after FINAL_PUT seen. */
> > > > 
> > > > test_bit() is already atomic.
> > > 
> > > Atomiticity doesn't apply to test_bit() - it only matters when it does two (or
> > > more) accesses that must be perceptually indivisible (e.g. set_bit doing RMW).
> > > 
> > > But atomiticity isn't the issue here, hence the barrier.  You need to be
> > > looking at memory-barriers.txt, not atomic_bitops.txt.
> > > 
> > > We have two things to correctly order and set_bit() does not imply sufficient
> > > barriering; test_and_set_bit() does, but not set_bit(), hence Linus's comment
> > > about really wanting a set_bit_release().
> > 
> > Oops, I was hallucinating here. And yeah, test_and_set_bit() does
> > imply full mb as you said.
> > 
> > I was somehow remembering what I did in SGX driver incorrectly and
> > that led me into misconclusions, sorry.
> > 
> > if (test_and_set_bit(SGX_ENCL_IOCTL, &encl->flags))
> > 	return -EBUSY;
> > 
> > > 
> > > > > +			smp_mb(); /* key->user before FINAL_PUT set. */
> > > > > +			set_bit(KEY_FLAG_FINAL_PUT, &key->flags);
> > > > 
> > > > Ditto.
> > > 
> > > Ditto. ;-)
> > 
> > Duh, no need poke with the stick further (or deeper) ;-)
> > 
> > > 
> > > > Nit: I'm just thinking should the name imply more like that "now
> > > > key_put() is actually done". E.g., even something like KEY_FLAG_PUT_DONE
> > > > would be more self-descriptive.
> > > 
> > > KEY_FLAG_PUT_DONE isn't right.  There can be lots of puts on a single key -
> > > only the one that reduces it to 0 matters for this.  You could call it
> > > KEY_FLAG_CAN_NOW_GC or KEY_FLAG_GC_ABLE.
> > 
> > Well all alternatives are fine but my thinking was that one that finally
> > zeros the refcount, "finalizes put" (pick whatever you want anyway).
> 
> I'll pick this one up tomorrow and put a PR out within this week.

I can try get this done tomorrow fully (with only one patch in the PR)
so that we would get it still to the ongoing release...

BR, Jarkko

