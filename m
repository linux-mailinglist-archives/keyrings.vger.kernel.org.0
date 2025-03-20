Return-Path: <keyrings+bounces-2500-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C465A6ABF9
	for <lists+keyrings@lfdr.de>; Thu, 20 Mar 2025 18:29:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BB79164DBD
	for <lists+keyrings@lfdr.de>; Thu, 20 Mar 2025 17:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25DE224B01;
	Thu, 20 Mar 2025 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acUcRz1C"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16122236E8;
	Thu, 20 Mar 2025 17:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742491716; cv=none; b=TlbWDyN8vFR20isVg+EZDgJIIbBtJpWPj+nx4kcHUJ2L+5yRFSO3MmMX4t5mV9dmPp2kNXiIwR1HzevdHT5JaqFqnYYVtezlY1EmEtBvFuUiFxiykMHWIPxYi7yUMVuN4yb0wOksgtB3a5LXPQOQXHt0gZIW15NQrAxHkP1BVxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742491716; c=relaxed/simple;
	bh=SGrjwEq8xUBBDRvvgwPMVgb8VYt0hcOcLINiSoq/eZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7pHSUoCx54DQe0we64NbJgaZNQo7/zwAKPdiLa7/GtmIEYgCYHZtiJIK7FM0abnW5EI778KcDSpq8/LvcSjaBtLeF+mhC+oJh0WiocJa3n1yWnB0Da0jOlLrgoZtuvKSdWVSK3UDSChYanNjkRXl8vD2FhocaDAUMPqnXzxsQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acUcRz1C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7718C4CEDD;
	Thu, 20 Mar 2025 17:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742491716;
	bh=SGrjwEq8xUBBDRvvgwPMVgb8VYt0hcOcLINiSoq/eZw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=acUcRz1CXQPmHCX5pwQp80/X9vLbF5xx90NY4l3EWy3OFw6yTQQLb2ZsMCg4j4ngg
	 dVVY9hupflkEdFvuNd6HON+zLYszSyr9BBAojLMRarn585OD2VSrvy8MSf7HCW3yWa
	 zHbHy6PolwD6VloFV3JWhtYvmMJn8DTqtU7qh4IGQ25IVQQ8yxUiisnpebHkDr35l+
	 EwcNglQXrzZ/pfOVqxYZYffPM8vqmoMnP6XPWIdfaOTgIRWxhm5hj19AzlZexEcxgw
	 WFdn5l5KWPMM+3Wi4Fr3Ylj3OygDNeKQi1RbTuq8rO2dWXDdwQw9fzb6w3nWwCY9zj
	 twpxf+Du7L6Pw==
Date: Thu, 20 Mar 2025 19:28:31 +0200
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
Message-ID: <Z9xQP0uhBEr3B890@kernel.org>
References: <Z9w-10St-WYpSnKC@kernel.org>
 <2874581.1742399866@warthog.procyon.org.uk>
 <3176471.1742488751@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3176471.1742488751@warthog.procyon.org.uk>

On Thu, Mar 20, 2025 at 04:39:11PM +0000, David Howells wrote:
> Jarkko Sakkinen <jarkko@kernel.org> wrote:
> 
> > > +		if (test_bit(KEY_FLAG_FINAL_PUT, &key->flags)) {
> > > +			smp_mb(); /* Clobber key->user after FINAL_PUT seen. */
> > 
> > test_bit() is already atomic.
> 
> Atomiticity doesn't apply to test_bit() - it only matters when it does two (or
> more) accesses that must be perceptually indivisible (e.g. set_bit doing RMW).
> 
> But atomiticity isn't the issue here, hence the barrier.  You need to be
> looking at memory-barriers.txt, not atomic_bitops.txt.
> 
> We have two things to correctly order and set_bit() does not imply sufficient
> barriering; test_and_set_bit() does, but not set_bit(), hence Linus's comment
> about really wanting a set_bit_release().

Oops, I was hallucinating here. And yeah, test_and_set_bit() does
imply full mb as you said.

I was somehow remembering what I did in SGX driver incorrectly and
that led me into misconclusions, sorry.

if (test_and_set_bit(SGX_ENCL_IOCTL, &encl->flags))
	return -EBUSY;

> 
> > > +			smp_mb(); /* key->user before FINAL_PUT set. */
> > > +			set_bit(KEY_FLAG_FINAL_PUT, &key->flags);
> > 
> > Ditto.
> 
> Ditto. ;-)

Duh, no need poke with the stick further (or deeper) ;-)

> 
> > Nit: I'm just thinking should the name imply more like that "now
> > key_put() is actually done". E.g., even something like KEY_FLAG_PUT_DONE
> > would be more self-descriptive.
> 
> KEY_FLAG_PUT_DONE isn't right.  There can be lots of puts on a single key -
> only the one that reduces it to 0 matters for this.  You could call it
> KEY_FLAG_CAN_NOW_GC or KEY_FLAG_GC_ABLE.

Well all alternatives are fine but my thinking was that one that finally
zeros the refcount, "finalizes put" (pick whatever you want anyway).

> 
> David

BR, Jarkko

