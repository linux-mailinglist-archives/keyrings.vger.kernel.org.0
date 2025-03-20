Return-Path: <keyrings+bounces-2501-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D50A6AD3F
	for <lists+keyrings@lfdr.de>; Thu, 20 Mar 2025 19:46:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75DA4883403
	for <lists+keyrings@lfdr.de>; Thu, 20 Mar 2025 18:46:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 964C2226533;
	Thu, 20 Mar 2025 18:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUi9HQt8"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681E61E47C5;
	Thu, 20 Mar 2025 18:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742496401; cv=none; b=EU1SbbiGQrptgUBiJwm9I85fN96pS+mORBKRLYY3hjNdXxe/C1+ihlXkxw9wXMjNQHnbe3bGz8esa2vmh4MZ9fhq39kSJmke8fixivZdL7qimSgcpmFOeY5vhq1bBzKDZoui6xOJSEBFOnw2MX80OhKt2+yavz4e/WRxn1DD9MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742496401; c=relaxed/simple;
	bh=ZRmVkviGr2SMUpx3X9P264GBbzsua9ORauvN0D6d+8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCkziyP1kRRvkZbGL5gPb0lpKxM1fmh1JjLXdWxpXGS+Zg48c4tBJ+tN7Li1FTXJfs2PL5NYAHDd9o9Qk/Gh1RKbgGHhumP/LoTNA0M0hsKleqPaUP1xEJvejVlX8pBVzC5MB6fS30NrHYQ7AvgPW29cB9MXF357JqlJsPtmPoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUi9HQt8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BB5C4CEDD;
	Thu, 20 Mar 2025 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742496401;
	bh=ZRmVkviGr2SMUpx3X9P264GBbzsua9ORauvN0D6d+8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUi9HQt82htf0+Go+nOSGUoK3TFvNWzMRETLul/r89c1w4SQVyAD0iNA6CoYZ5t+t
	 cEwdc9NJZsiEXj+6LBKpAADTNBJdyZFxZjvh69KFZKE3Sl1GrEaNIcb37hNoHIZY5p
	 Fc6S4a11G9UTKFMF6kWmEGclPLOi2I27zh+ZkvXc3rgwkfRJ4BkORLK9Q1n1qb8Z/l
	 Vq6aJuWuw3BgknUbNAIIJFypXC6YrAhuuR+fnGRLYkf3GMQHbhR9w5Sbabq7LenNSR
	 De+jzqOYGdM/ssOKs7v0AF0vdeScftNv1mdt4GzuNrkW5g9DLrhgq4ym8psCPFP8ZN
	 c8IGuVjPRHmOA==
Date: Thu, 20 Mar 2025 20:46:37 +0200
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
Message-ID: <Z9xijTBHY93HCsLW@kernel.org>
References: <Z9w-10St-WYpSnKC@kernel.org>
 <2874581.1742399866@warthog.procyon.org.uk>
 <3176471.1742488751@warthog.procyon.org.uk>
 <Z9xQP0uhBEr3B890@kernel.org>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z9xQP0uhBEr3B890@kernel.org>

On Thu, Mar 20, 2025 at 07:28:36PM +0200, Jarkko Sakkinen wrote:
> On Thu, Mar 20, 2025 at 04:39:11PM +0000, David Howells wrote:
> > Jarkko Sakkinen <jarkko@kernel.org> wrote:
> > 
> > > > +		if (test_bit(KEY_FLAG_FINAL_PUT, &key->flags)) {
> > > > +			smp_mb(); /* Clobber key->user after FINAL_PUT seen. */
> > > 
> > > test_bit() is already atomic.
> > 
> > Atomiticity doesn't apply to test_bit() - it only matters when it does two (or
> > more) accesses that must be perceptually indivisible (e.g. set_bit doing RMW).
> > 
> > But atomiticity isn't the issue here, hence the barrier.  You need to be
> > looking at memory-barriers.txt, not atomic_bitops.txt.
> > 
> > We have two things to correctly order and set_bit() does not imply sufficient
> > barriering; test_and_set_bit() does, but not set_bit(), hence Linus's comment
> > about really wanting a set_bit_release().
> 
> Oops, I was hallucinating here. And yeah, test_and_set_bit() does
> imply full mb as you said.
> 
> I was somehow remembering what I did in SGX driver incorrectly and
> that led me into misconclusions, sorry.
> 
> if (test_and_set_bit(SGX_ENCL_IOCTL, &encl->flags))
> 	return -EBUSY;
> 
> > 
> > > > +			smp_mb(); /* key->user before FINAL_PUT set. */
> > > > +			set_bit(KEY_FLAG_FINAL_PUT, &key->flags);
> > > 
> > > Ditto.
> > 
> > Ditto. ;-)
> 
> Duh, no need poke with the stick further (or deeper) ;-)
> 
> > 
> > > Nit: I'm just thinking should the name imply more like that "now
> > > key_put() is actually done". E.g., even something like KEY_FLAG_PUT_DONE
> > > would be more self-descriptive.
> > 
> > KEY_FLAG_PUT_DONE isn't right.  There can be lots of puts on a single key -
> > only the one that reduces it to 0 matters for this.  You could call it
> > KEY_FLAG_CAN_NOW_GC or KEY_FLAG_GC_ABLE.
> 
> Well all alternatives are fine but my thinking was that one that finally
> zeros the refcount, "finalizes put" (pick whatever you want anyway).

I'll pick this one up tomorrow and put a PR out within this week.

BR, Jarkko

