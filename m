Return-Path: <keyrings+bounces-2930-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9645B0C705
	for <lists+keyrings@lfdr.de>; Mon, 21 Jul 2025 16:56:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7455B3A2D42
	for <lists+keyrings@lfdr.de>; Mon, 21 Jul 2025 14:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4D42D0C7E;
	Mon, 21 Jul 2025 14:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D4qrwjXj"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E45B289E07
	for <keyrings@vger.kernel.org>; Mon, 21 Jul 2025 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753109757; cv=none; b=WCOexyMGzym4HHdhPzUfRfsJG7Jhu67b/6Tl7z8ucE40scnhOHk8xc3/5NTwTsZAHmUTSyqD3DrCXjw6YeLKTpQslfgwb3yV5Cbync4NQDf62mmFG8Ymf1HhqoYnZ15tast+QQhQdhUZkljvavJzp+KyROG4KolDbxHckMT/i+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753109757; c=relaxed/simple;
	bh=icHDG6QdluZP41phR7NW3BvJGZ6CNzzMYK0DBPYI9ic=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=vBXUKfnMwyB9Hl8/RRkiQX+SHTKA4/XrlziYLd1dSomn1PbvZoQg5Cs4UaTohP0/O6B1Lx6xrZAxxdlYAdj/mk8YV0Fl/dUwg2+NQjiPOukkZGD7PlQpysQeWV2aiLnwLO/RUCEVTy1gWtHfBYM66IEZV859QP/g0c9yYEz+HHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D4qrwjXj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753109754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e2Wh3wSdrb09fmYGhTRJzbMDCoAcmNLpNDTD5FVsfRU=;
	b=D4qrwjXjgJ5NQ45+Mu4wr7D5jLHGXblRRV8XhfU7FLhquR19076h/XuMXSTEeZI1W0wDkZ
	tpuNNj5s2bnUZMWEFhdGCVjG/2SB7fiOgw1nqlIrwFfOo7InS3UwTIvQ5NbJDA3stai9cu
	cxnXYLYsnS48NQ/gAfrYG6fDr7Fz1iA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-688-Qni8g5HtMy-nGonJzQI5wA-1; Mon,
 21 Jul 2025 10:55:50 -0400
X-MC-Unique: Qni8g5HtMy-nGonJzQI5wA-1
X-Mimecast-MFC-AGG-ID: Qni8g5HtMy-nGonJzQI5wA_1753109749
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 77CE01800292;
	Mon, 21 Jul 2025 14:55:48 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.8])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6980130001A4;
	Mon, 21 Jul 2025 14:55:45 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <aGKZUfjsj6kGs726@eidolon.nox.tf>
References: <aGKZUfjsj6kGs726@eidolon.nox.tf> <462886.1749731810@warthog.procyon.org.uk>
To: David 'equinox' Lamparter <equinox@diac24.net>
Cc: dhowells@redhat.com, keyrings@vger.kernel.org,
    Jarkko Sakkinen <jarkko@kernel.org>,
    Steve French <sfrench@samba.org>,
    Chuck Lever <chuck.lever@oracle.com>,
    Mimi Zohar <zohar@linux.ibm.com>, Paulo Alcantara <pc@manguebit.org>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Jeffrey Altman <jaltman@auristor.com>, hch@infradead.org
Subject: Re: [RFC] Keyrings: How to make them more useful
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4120269.1753109744.1@warthog.procyon.org.uk>
Date: Mon, 21 Jul 2025 15:55:44 +0100
Message-ID: <4120270.1753109744@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

David 'equinox' Lamparter <equinox@diac24.net> wrote:

[Apologies, I've been off fixing bugs for a few weeks]

> On Thu, Jun 12, 2025 at 01:36:50PM +0100, David Howells wrote:
> > I think work needs to be done on the keyrings subsystem to make them more
> > useful for network filesystems and other kernel services such as TLS and
> > crypto.
> 
> As someone who has recently tried to use keyrings from userspace (in
> order to bind key material to a TPM, and have it never enter user
> memory), I would note two things here:
> 
> * the request_key() syscall seems to be blocking.  Of course you can
>   work around that by creating a thread, but is it not possible to
>   create a better API?

Depends what you mean by a "better API".  Unfortunately, we're somewhat stuck
with this API - it has to go on working pretty much as-is.  However, some
things can be changed.

request_key() can block, yes - that's part of the design.  It can upcall to
userspace to go and get the content for a key - and this might involve, say,
network calls to a KDC.  Now, the exact upcalling mechanism can be done better
- and that's one of the things I included in my list - but it should not block
forever and, ideally, if someone presses Ctrl-C, it should perhaps terminate
the upcall.

> * the trusted key / TPM bits are incredibly poorly documented.  It's
>   basically "cobble together things from old patch descriptions", e.g.
>   https://marc.info/?l=linux-keyrings&m=160074197025246
>   (I still have not figured out how to do this correctly.  Some of that
>   is to blame on the TPM bits, but not all.)

Note that the trusted key/TPM bits aren't part of the core keyrings code.
Trusted and encrypted keys are examples of key types.

> I guess the kernel itself doesn't care about the blocking API, but for
> trusted keys...  you'll have to tie things together from user space, and
> I don't see how anyone can do that, especially with any level of
> confidence that they didn't accidentally leave some wide-open hole (as
> in - you might well get something to work, but without docs you can't
> check you actually did it *right*.)  This is really improving keyctl
> itself (i.e. how its commands are invoked) and also its documentation.

Are you talking about keyctl() the syscall or keyctl the program?

David


