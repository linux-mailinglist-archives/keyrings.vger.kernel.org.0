Return-Path: <keyrings+bounces-232-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 539CD80749B
	for <lists+keyrings@lfdr.de>; Wed,  6 Dec 2023 17:13:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CEAECB20DE0
	for <lists+keyrings@lfdr.de>; Wed,  6 Dec 2023 16:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9AC45C07;
	Wed,  6 Dec 2023 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c4eqo7YL"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7887912F
	for <keyrings@vger.kernel.org>; Wed,  6 Dec 2023 08:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701879194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b00doOcUAWq1RTxBpUUl3AhHUCRtaaT2eXgI04xU0rI=;
	b=c4eqo7YL4oCwNg9zn+d5OJIplvW/aEfPvikAnUFs/RvpDdbo8gibGuGCvSNf055pmubd9h
	5VmvEnJ6p35wScy4DQQBJ1l5+z0R0W30vEFuRwIjrAIegxcFakASz9joNdNyeRwlPcur3f
	dfQ1jLm8Qe9Jb/aenZXJrQHzHx/Da5w=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-yIe0WVutN_udtif27DAn6w-1; Wed,
 06 Dec 2023 11:13:07 -0500
X-MC-Unique: yIe0WVutN_udtif27DAn6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 142363806105;
	Wed,  6 Dec 2023 16:04:04 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4435340C6EB9;
	Wed,  6 Dec 2023 16:04:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20231206145744.17277-1-lhenriques@suse.de>
References: <20231206145744.17277-1-lhenriques@suse.de>
To: Luis Henriques <lhenriques@suse.de>
Cc: dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>,
    Eric Biggers <ebiggers@kernel.org>, keyrings@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] keys: flush work when accessing /proc/key-users
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <498293.1701878642.1@warthog.procyon.org.uk>
Date: Wed, 06 Dec 2023 16:04:02 +0000
Message-ID: <498294.1701878642@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Luis Henriques <lhenriques@suse.de> wrote:

> This patch is mostly for getting some feedback on how to fix an fstest
> failing for ext4/fscrypt (generic/581).  Basically, the test relies on the
> data read from /proc/key-users to be up-to-date regarding the number of
> keys a given user currently has.  However, this file can't be trusted
> because it races against the keys GC.

Unfortunately, I don't think your patch helps.  If the GC hasn't started yet,
it won't achieve anything and the GC can still be triggered at any time after
the flush and thus race.

What is it you're actually trying to determine?

And is it only for doing the test?

David


