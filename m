Return-Path: <keyrings+bounces-3413-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EF042C790AB
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 13:42:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7F97D4EA342
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 12:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20C6331158A;
	Fri, 21 Nov 2025 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FLfATZ1+"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535AC311C39
	for <keyrings@vger.kernel.org>; Fri, 21 Nov 2025 12:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763728917; cv=none; b=QOmH8e1m/WAn0kUkgTsRr4c3akvcXwiPvpW6TdEpSguS64r4Em+VROr27E2aLL4KhG1n5Sf7h7Z6CPR+gYlGbmjupNUgco0BxyRpdEWtxq+0+9az7Gxej9K8sUM/v+3cbV5gJwWNQ4NqOHrXKjlw9QmWPbdwGCOlJUPQRWVVpXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763728917; c=relaxed/simple;
	bh=Vap15O/LCeEV3yjhE8W7o8qtxMXTBX6RyW3ZEv7xYs8=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=qLTVPKbyDXCoeWHo4SyCjRM/924cJ56/Tn8TxtmueLFTmJv0Dm9PRJ0Y5opCTtk4g0k74QbNQwOf95d09FDFdiqF48UrjAVss7X/xHQJQGDDjHUNNySfP+32xM5BMF+HrVFsy3hi3Ju/o0nEnzT7F+bEjIJ+Y4EihXb2g1qjPtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FLfATZ1+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763728914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SJyQizyUQfr4vBGiRcxbci2GL/tku31+RZUix1dYDTk=;
	b=FLfATZ1+i9Bpih2wLvuXerskJRsnVM3ugMlFHcYmVqEdKQ265eaFzwNuB5suJxeiDsNSAU
	Kbfpix4P04f+45N1xF2QT2EzoqfUfvH9pR4qBdy1YnmzZKN4sQjAy9yAfA7runzMsI4PSq
	VkF4h0Fw0k0NwwcetES2Nq6b33jxARQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-558--A0WeA1uN_uDpccxjrM_Lw-1; Fri,
 21 Nov 2025 07:41:49 -0500
X-MC-Unique: -A0WeA1uN_uDpccxjrM_Lw-1
X-Mimecast-MFC-AGG-ID: -A0WeA1uN_uDpccxjrM_Lw_1763728908
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 739C9195608A;
	Fri, 21 Nov 2025 12:41:47 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B555030044DB;
	Fri, 21 Nov 2025 12:41:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251121005017.GD3532564@google.com>
References: <20251121005017.GD3532564@google.com> <20251120003653.335863-2-ebiggers@kernel.org> <20251120003653.335863-1-ebiggers@kernel.org> <2624664.1763646918@warthog.procyon.org.uk>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, linux-crypto@vger.kernel.org,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>,
    Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>, keyrings@vger.kernel.org,
    linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] lib/crypto: Add ML-DSA verification support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2755898.1763728901.1@warthog.procyon.org.uk>
Date: Fri, 21 Nov 2025 12:41:41 +0000
Message-ID: <2755899.1763728901@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Eric Biggers <ebiggers@kernel.org> wrote:

> On Thu, Nov 20, 2025 at 01:55:18PM +0000, David Howells wrote:
> > Eric Biggers <ebiggers@kernel.org> wrote:
> > 
> > > +	/* Compute d = (c mod 2^32) * (q^-1 mod 2^32). */
> > > +	s32 d = (s32)c * QINV_MOD_R;
> > 
> > Hmmm...  is "(s32)c" actually "(c mod 2^32)"?  Should that be:
> > 
> > 	u32 d = (u32)c * QINV_MOD_R;
> > 
> > This is followed up by casting 'd' to "s64".  I don't think that should
> > sign-extend it, but...
> 
> It selects the representative in the range [INT32_MIN, INT32_MAX],
> rather than the representative in the range [0, UINT32_MAX].  The sign
> extension is intentional.

I'm concerned about the basis on which it becomes positive or negative.  It
looks like the sign bit ends up being chosen arbitrarily.

> > > +		/* Reduce to [0, q), then tmp = w'_1 = UseHint(h, w'_Approx) */
> > 
> > Bracket mismatch.  "[0, q]"
> 
> It's intentional, since it denotes a mathematical range.  Elsewhere I
> used the words "the range" explicitly, so I'll add that above too.  (Or
> maybe reword it differently.)

I meant you have an opening square bracket and a closing round bracket in
"[0, q)".

David


