Return-Path: <keyrings+bounces-2931-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1557EB0C856
	for <lists+keyrings@lfdr.de>; Mon, 21 Jul 2025 17:59:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9229188D502
	for <lists+keyrings@lfdr.de>; Mon, 21 Jul 2025 15:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40C72D63F9;
	Mon, 21 Jul 2025 15:59:17 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4182289804
	for <keyrings@vger.kernel.org>; Mon, 21 Jul 2025 15:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753113557; cv=none; b=SpD1Nxf0HqYloauTyNH6wT8Fa9ogLVXLdLELN4clybA4ruO9PMJP0Es9MFmLDQOYmZipWfmMgZmcosB98k1tGbImdsO4p86sMBbK/6eOgC/ZyBPmPPCZzxSMKndYdD84Yvhx8fyguBCcTkj/djLgEvvFGB1eT6B2+jBCxdEaaBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753113557; c=relaxed/simple;
	bh=yz9Hg7sl8hl+M3XUs7Vt7KjyFnttOk+FajY8UnpJqPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYamyY+ow0IIIv51NjZXzgTzlTyK6Cp8KlHS+pFiX5qi7zXg8P2GvIcx6sTb+8c/j/E6iWpXxI66SJRy4EzqMMxS/NIoDD3Sk9gpRKrHI8JGFah8/d16Wxi5YHhCOPhyfsqW6G880w5ZuATtjyx9Pz0gxFkJ47Yv9fupmm9Lhic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from equinox by eidolon.nox.tf with local (Exim 4.97.1)
	(envelope-from <equinox@diac24.net>)
	id 1udsu6-00000001GH1-0PKV;
	Mon, 21 Jul 2025 17:58:14 +0200
Date: Mon, 21 Jul 2025 17:58:14 +0200
From: David 'equinox' Lamparter <equinox@diac24.net>
To: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
	Steve French <sfrench@samba.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Paulo Alcantara <pc@manguebit.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jeffrey Altman <jaltman@auristor.com>, hch@infradead.org
Subject: Re: [RFC] Keyrings: How to make them more useful
Message-ID: <aH5jlkyhlnoHF102@eidolon.nox.tf>
References: <aGKZUfjsj6kGs726@eidolon.nox.tf>
 <462886.1749731810@warthog.procyon.org.uk>
 <4120270.1753109744@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4120270.1753109744@warthog.procyon.org.uk>

On Mon, Jul 21, 2025 at 03:55:44PM +0100, David Howells wrote:
> David 'equinox' Lamparter <equinox@diac24.net> wrote:
[...]
> > As someone who has recently tried to use keyrings from userspace (in
> > order to bind key material to a TPM, and have it never enter user
> > memory), I would note two things here:
> > 
> > * the request_key() syscall seems to be blocking.  Of course you can
> >   work around that by creating a thread, but is it not possible to
> >   create a better API?
> 
> Depends what you mean by a "better API".  Unfortunately, we're somewhat stuck
> with this API - it has to go on working pretty much as-is.  However, some
> things can be changed.

I'm painfully aware of the no breaking userspace rule, and it certainly
applies here :(.

> request_key() can block, yes - that's part of the design.  It can upcall to
> userspace to go and get the content for a key - and this might involve, say,
> network calls to a KDC.  Now, the exact upcalling mechanism can be done better
> - and that's one of the things I included in my list - but it should not block
> forever and, ideally, if someone presses Ctrl-C, it should perhaps terminate
> the upcall.

Well, I'm a networking person, so my immediate association is netlink.
As in, request_key() is a KEYCTL_REQUEST_KEY message that you get a
KEYCTL_RESULT_KEY response to -- at some point later.  (With request
abort if the socket gets closed for whatever reason.)

To be entirely honest I was also surprised to see the keyring monitoring
bits have this WATCH_QUEUE thing (that nobody else seems to be using?)
rather than just throwing up netlink multicast.  There's probably some
backstory to this that I'm unaware of.

> > * the trusted key / TPM bits are incredibly poorly documented.  It's
> >   basically "cobble together things from old patch descriptions", e.g.
> >   https://marc.info/?l=linux-keyrings&m=160074197025246
> >   (I still have not figured out how to do this correctly.  Some of that
> >   is to blame on the TPM bits, but not all.)
> 
> Note that the trusted key/TPM bits aren't part of the core keyrings code.
> Trusted and encrypted keys are examples of key types.

I know -- maybe I should make another comment here:  the trusted/TPM
bits, through the keyring API, are *actually quite useful* for
userspace, especially combined with AF_ALG's ALG_SET_KEY_BY_KEY_SERIAL.
Doing crypto with a key that never enters userspace - amazing!

So maybe let me replace my message here with "please don't forget about
userspace".  Which does include documenting things ;).

> > I guess the kernel itself doesn't care about the blocking API, but for
> > trusted keys...  you'll have to tie things together from user space, and
> > I don't see how anyone can do that, especially with any level of
> > confidence that they didn't accidentally leave some wide-open hole (as
> > in - you might well get something to work, but without docs you can't
> > check you actually did it *right*.)  This is really improving keyctl
> > itself (i.e. how its commands are invoked) and also its documentation.
> 
> Are you talking about keyctl() the syscall or keyctl the program?

Sorry, keyctl the program.  I haven't tried using the syscall directly,
libkeyutils is reasonable (easier to understand than the program, maybe.)

Cheers,


equi

