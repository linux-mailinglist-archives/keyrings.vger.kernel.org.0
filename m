Return-Path: <keyrings+bounces-3395-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A909DC730D5
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 10:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AFFD14EBE98
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 09:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 504CC78F54;
	Thu, 20 Nov 2025 09:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q1oVSbVZ"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFC62F690B
	for <keyrings@vger.kernel.org>; Thu, 20 Nov 2025 09:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763629815; cv=none; b=QenQcV/7bynhzDGXuNiMDGNCvMjTYCGQ+i02xNdeVNpfysqiwkGA4cvdMUJtHhmC5ctiePECJoMebPPP9P3ZsVNswNsp+urL6UFiLMcQpF/aJKbiXvCfdrV2W7z74/44VClf1WurA8FF4OvY3c4l5JT6n53osArU6Y4BGlknfwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763629815; c=relaxed/simple;
	bh=ZdQcOdc7gCABHJOdZ40aULWk4ET7OGHhGZClDWDgjBk=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=VIQI1K9hNrdpRoy+prlp2WOZuN+CHabMN6Mf8CNm65o5Oqx4F2ro9kQbAIbSgsoD2G0qWlaSJMSNtqbzdz2Lj/IV7YkLLba78Vfbp+ahVnAOQhVGORQHAXToZ1rmvxzyZkPuYyOQnl3upQjB2jGt791QdQ3DFi6cwyjhenAAzqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q1oVSbVZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763629812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xQO1fZFPrOhkdsyZjdLmzQ+Mgobs3gJJ1WmIDYIAKQA=;
	b=Q1oVSbVZ1JCH/m7k7L3u+udivBz8dlWz4DUWrLLtS+5MvmzoPpv0Ka/FHNGIt2k72qRSYf
	u2efJUYUBefCwSXUFnYQucmLNVp9xpBo53JfulpLCdTAVXtWerrieB1Fwykl4ySUQc7dXC
	f1XCpSF3DAWoYPKmCw0tPwvz866CxkI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-608-LkhFORreN5SdLYfztd7_gg-1; Thu,
 20 Nov 2025 04:10:09 -0500
X-MC-Unique: LkhFORreN5SdLYfztd7_gg-1
X-Mimecast-MFC-AGG-ID: LkhFORreN5SdLYfztd7_gg_1763629807
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B04ED1800EF6;
	Thu, 20 Nov 2025 09:10:06 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7DB193001E83;
	Thu, 20 Nov 2025 09:10:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251120003653.335863-2-ebiggers@kernel.org>
References: <20251120003653.335863-2-ebiggers@kernel.org> <20251120003653.335863-1-ebiggers@kernel.org>
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
Content-ID: <2590972.1763629800.1@warthog.procyon.org.uk>
Date: Thu, 20 Nov 2025 09:10:00 +0000
Message-ID: <2590973.1763629800@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Eric Biggers <ebiggers@kernel.org> wrote:

>   - Is about 600 lines of source code instead of 4800.

There's less shareable code for other algos that I'm sure people are going to
ask for, but that's probably fine.

>   - Generates about 4 KB of object code instead of 28 KB.
>   - Uses 9-13 KB of memory to verify a signature instead of 31-84 KB.

That's definitely good.

>   - Is 3-5% faster, depending on the ML-DSA parameter set.

That's not quite what I see.  For Leancrypto:

    # benchmark_mldsa44: 8672 ops/s
    # benchmark_mldsa65: 5470 ops/s
    # benchmark_mldsa87: 3350 ops/s

For your implementation:

    # benchmark_mldsa44: 8707 ops/s
    # benchmark_mldsa65: 5423 ops/s
    # benchmark_mldsa87: 3352 ops/s

This may reflect differences in CPU (mine's an i3-4170).

The numbers are pretty stable with the cpu frequency governor set to
performance and without rebooting betweentimes.

Interesting that your mldsa44 is consistently faster, but your mldsa65 is
consistently slower.  mldsa87 is consistently about the same.

I don't think the time differences are particularly significant.

David


