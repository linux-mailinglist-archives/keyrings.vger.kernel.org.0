Return-Path: <keyrings+bounces-3373-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B11C660FA
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 21:06:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC7504E1B32
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 20:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13A5F2550A4;
	Mon, 17 Nov 2025 20:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CJpyNG1D"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC9A2F532C
	for <keyrings@vger.kernel.org>; Mon, 17 Nov 2025 20:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763409963; cv=none; b=D2ttHn2ChOlo7sTFj/9vZLfyDpv9CiC54U4WuZ9pfi9K4MTYxpIN2LXBvpur2980vUmpRhfcRkT2Xn62/ztX5mlGW0xCHgjCxmUAiI7HWV2iJMQt6NV5s74x0CaS+4L+S3DUCKHXpa7Jyjm4kbNquPAaD37/PaBjXm71jNLLB3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763409963; c=relaxed/simple;
	bh=WzqzfWGUrf811a74YIw3NeM5bLcQdbwj7XGDri7DLIE=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=QiR8YQ4/Hj/l3UXFztgqFfQpGrTJZ+jEtSaGY9BqD2VW9aU/+9GVtsS4HZx6Wl7YTM28RgKeIibsJCgSFrQXaQi/lHdJWqqxDitur9LkZaSgpoito1aC9fJsU0zr//zcVdsgFWlpxbZJjh07BKj5iThb5ge0Sk3RTBQRpk5wwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CJpyNG1D; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763409960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Gk1A7WAVLacyqtUo+UN7TCmmst81dLSvI7tZqiv/zqU=;
	b=CJpyNG1DBK9sot70WENNdBS0K4+lhL/JytviKkPxne7WLQri2kfZr9CfLGQiP97dWPCx1T
	w3df7/7ZaoNWqdvTwKM4c8avcGwT2CjQ/hh7jRR6Hp0fxQG94PtuTmWkNFVjdl5QJxT6zi
	KVsaLr8ddY93poplY1fpLhupXc/v6GI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-573-bRxPBrVSOcOw7NmUdswN5Q-1; Mon,
 17 Nov 2025 15:05:56 -0500
X-MC-Unique: bRxPBrVSOcOw7NmUdswN5Q-1
X-Mimecast-MFC-AGG-ID: bRxPBrVSOcOw7NmUdswN5Q_1763409954
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0366619373D8;
	Mon, 17 Nov 2025 20:05:54 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 01ACD195608E;
	Mon, 17 Nov 2025 20:05:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <2165074.1763409175@warthog.procyon.org.uk>
References: <2165074.1763409175@warthog.procyon.org.uk> <20251117171003.GC1584@sol> <20251117145606.2155773-1-dhowells@redhat.com> <20251117145606.2155773-3-dhowells@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, Herbert Xu <herbert@gondor.apana.org.au>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason
 A . Donenfeld" <Jason@zx2c4.com>,
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
Content-ID: <2165357.1763409948.1@warthog.procyon.org.uk>
Date: Mon, 17 Nov 2025 20:05:48 +0000
Message-ID: <2165358.1763409948@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

> Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > In comparison, BoringSSL has an entire implementation of ML-DSA, ...
> 
> ... which cannot be used in the kernel due to the licence.

... and it's written in C++.  Now, whilst I'm in favour generally of moving
the kernel to C++, it could be a hard sell.

David


