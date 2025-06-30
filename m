Return-Path: <keyrings+bounces-2876-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B76AEE015
	for <lists+keyrings@lfdr.de>; Mon, 30 Jun 2025 16:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE55C3BD747
	for <lists+keyrings@lfdr.de>; Mon, 30 Jun 2025 14:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A16F1E5B7E;
	Mon, 30 Jun 2025 14:04:11 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from eidolon.nox.tf (eidolon.nox.tf [185.142.180.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2921BC2A
	for <keyrings@vger.kernel.org>; Mon, 30 Jun 2025 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292251; cv=none; b=SI7WFshoAshTH9YwxmDHdoUQ7iUlwVSPL3pFiK7cYPG+mOgxmla5KJWgxgkymjyVPnWcpYWysh+ycSttYTxBcHduvvbKkz18FAVTsnYZQo/qsReN5v98iN+coMpwmwHp2er3aGHimEIs3QGRySJi4Z6nqV6CAV3nmqvYhn9VXq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292251; c=relaxed/simple;
	bh=LmDOpHju2dOa0CKcFM4To0ap3itQEKxA/Ri7FMOkqZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IypPkDDm51hL11pj1qr9qcV+PugZaOpNYMOtNUJxSikwbEdw4fKtpwEXSQ6WIpDMmd20BPPGQHyEwgb7uoNDL7N7RBoN/a4n2+Tb0DKNzNAhVKKJsoLa3uyYIc/tEMDZm7jqFQ4sov358poSiKIBOZ5tIonbtmDelYFwc6arr9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net; spf=pass smtp.mailfrom=diac24.net; arc=none smtp.client-ip=185.142.180.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=diac24.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=diac24.net
Received: from equinox by eidolon.nox.tf with local (Exim 4.97.1)
	(envelope-from <equinox@diac24.net>)
	id 1uWF73-00000003BnL-0IZZ;
	Mon, 30 Jun 2025 16:04:01 +0200
Date: Mon, 30 Jun 2025 16:04:01 +0200
From: David 'equinox' Lamparter <equinox@diac24.net>
To: keyrings@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Steve French <sfrench@samba.org>,
	Chuck Lever <chuck.lever@oracle.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	Paulo Alcantara <pc@manguebit.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jeffrey Altman <jaltman@auristor.com>, hch@infradead.org
Subject: Re: [RFC] Keyrings: How to make them more useful
Message-ID: <aGKZUfjsj6kGs726@eidolon.nox.tf>
References: <462886.1749731810@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <462886.1749731810@warthog.procyon.org.uk>

[removed other lists from Cc:]

Hi all,

On Thu, Jun 12, 2025 at 01:36:50PM +0100, David Howells wrote:
> I think work needs to be done on the keyrings subsystem to make them more
> useful for network filesystems and other kernel services such as TLS and
> crypto.

As someone who has recently tried to use keyrings from userspace (in
order to bind key material to a TPM, and have it never enter user
memory), I would note two things here:

* the request_key() syscall seems to be blocking.  Of course you can
  work around that by creating a thread, but is it not possible to
  create a better API?

* the trusted key / TPM bits are incredibly poorly documented.  It's
  basically "cobble together things from old patch descriptions", e.g.
  https://marc.info/?l=linux-keyrings&m=160074197025246
  (I still have not figured out how to do this correctly.  Some of that
  is to blame on the TPM bits, but not all.)

I guess the kernel itself doesn't care about the blocking API, but for
trusted keys...  you'll have to tie things together from user space, and
I don't see how anyone can do that, especially with any level of
confidence that they didn't accidentally leave some wide-open hole (as
in - you might well get something to work, but without docs you can't
check you actually did it *right*.)  This is really improving keyctl
itself (i.e. how its commands are invoked) and also its documentation.


Hope this isn't too negative as feedback,

equi


P.S.: I wish I could submit patches for this.  I can't, because I don't
understand it.

