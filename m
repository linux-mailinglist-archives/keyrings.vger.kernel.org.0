Return-Path: <keyrings+bounces-3376-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E88B6C683A8
	for <lists+keyrings@lfdr.de>; Tue, 18 Nov 2025 09:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 9FEC72954B
	for <lists+keyrings@lfdr.de>; Tue, 18 Nov 2025 08:39:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5A5307AC7;
	Tue, 18 Nov 2025 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jV1JeU38"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721F3302CD5
	for <keyrings@vger.kernel.org>; Tue, 18 Nov 2025 08:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763455170; cv=none; b=ekLAtqfs4wi+RvFRtD4zLmE8xagssex8gzQOxt9x/vDQNISAH7+buxGp/GPitMwDdbAX4xPjFVu8wzw1WTW2oQDDcLGmxbTcISB89A0PStUUqYoyvwJsQ9iYqJNERK4q6n9ryT/l6Pk8ZVBkFvPG3h4kJaY/mjQsMrdQw+vm9Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763455170; c=relaxed/simple;
	bh=EczDlkyDRFeAv68Aop81/CjtdTFYJJsFwEwAecerlBc=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=ph1FaBbxz0LhFJDJgNGQqts7tcpgHNuqARD48kcvRzcrm0X3V+QXwleh/Ie1DzP0d0TwhMF3OgO8WBt3u9Agc4fRbAVIPWy6RwktFqSWQpTnI+VpeTy92A6pvhGM9U8h8PF7RfEBTU1uAYQIkwZqU3Pf3CSOKj8N4tf1JHsmNmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jV1JeU38; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763455167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7FL0nv8u6A7f3to0nc11pn91OMRRKpxQEVPN+kjD6Sw=;
	b=jV1JeU388Qdz2KKWFJtGHNHMPPASf3SLZzf03fj20h2QSgGao395CZXIalvZxE5erRFshU
	Nq2v45myzM3GdXBIy2nw34HDNSENdrv+mdOff2TsUCnf8i19qSEw3c2TUP0b3KXjVZ8w5X
	jnxMoC7bo1ASeQLWDYUruack9Q2dMkQ=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-140-gwAfvOgXMwiscJTRXIZsHA-1; Tue,
 18 Nov 2025 03:39:24 -0500
X-MC-Unique: gwAfvOgXMwiscJTRXIZsHA-1
X-Mimecast-MFC-AGG-ID: gwAfvOgXMwiscJTRXIZsHA_1763455161
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0FAC418AB30C;
	Tue, 18 Nov 2025 08:39:21 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 25879180047F;
	Tue, 18 Nov 2025 08:39:15 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <13213304ac049113655ab8fe1bae76cc84a3330e.camel@HansenPartnership.com>
References: <13213304ac049113655ab8fe1bae76cc84a3330e.camel@HansenPartnership.com> <20251117171003.GC1584@sol> <20251117145606.2155773-1-dhowells@redhat.com> <20251117145606.2155773-3-dhowells@redhat.com> <2165074.1763409175@warthog.procyon.org.uk>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: dhowells@redhat.com, Eric Biggers <ebiggers@kernel.org>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason A .
 Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>,
    Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org,
    keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/9] crypto: Add ML-DSA/Dilithium verify support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2187236.1763455154.1@warthog.procyon.org.uk>
Date: Tue, 18 Nov 2025 08:39:14 +0000
Message-ID: <2187237.1763455154@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

James Bottomley <James.Bottomley@HansenPartnership.com> wrote:

> But even if you don't accept that, Google keeps effective joint
> ownership of the code through their CLA and so could grant a dual
> licence to the kernel anyway without needing to refer to any
> contributors.

Actually, the fact that BoringSSL's ML-DSA implementation uses C++ with heavy
use of integer-parametered templating is more insurmountable for borrowing
their code.  Yes, it does allow them to reduce their LoC to ~3000 and is much
more readable, but I can't do that in C.  Now, if we want to work on
persuading Linus to allow C++ into the kernel...

David


