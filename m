Return-Path: <keyrings+bounces-3499-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF70C9EA4B
	for <lists+keyrings@lfdr.de>; Wed, 03 Dec 2025 11:09:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ACC463446A8
	for <lists+keyrings@lfdr.de>; Wed,  3 Dec 2025 10:09:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 639412E719E;
	Wed,  3 Dec 2025 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JfBrr9bH"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C056523EA97
	for <keyrings@vger.kernel.org>; Wed,  3 Dec 2025 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764756557; cv=none; b=rZyuo2AwTN9BsJShSPn/DUg1ISyrtIPpctkUiOm6/T6zDwFnvv5tqBbsgDAl+I0Uzx942ODuEPGU601P3u6wPg3LCvYDeTq0Nyi72qCWAvcQtCjkX6pIE1FgC5wHI1NinpOnzU7Wz0o+V/uyy1Zba3BY0SN5tADNtPpLS7MfRmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764756557; c=relaxed/simple;
	bh=tzhX9DvkipLSLKw4MW4S2fgp3s51hA4sXUYCURSrK/A=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=Dw8wGLm3w1EWbaIc2Y2PMv3lxQUZs+G67cAh8GpEzdpLa++TMTNDJ/vK2Qpm124yxgCXXqlMebwWvd6fODlu9LuJbyYMsy8OJJEeZwX3VJCDd6aJM3Aik62cHz1UjH08d2vuMXqfb3NzPcNoh5jZsVdmJSWBQGTmdVutDEf+zss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JfBrr9bH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764756554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tzhX9DvkipLSLKw4MW4S2fgp3s51hA4sXUYCURSrK/A=;
	b=JfBrr9bHHQP0Jpnzbahrgj3EA8FTCGskRTNmwaUgz+3OwFnAm1H6pcFV8Qu4As4+N3sC4i
	NVWnOlk+IiCijVs09PhZ5YNr3wHkJByL9210iopyC2h0p6OsuvNjcFc3k/lH+QZBt1deh8
	wdi2v1vpuik5ChWEVhRTmJgk3DZBwDU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-524-10XCLjGwN9GL3OUaqKpyRw-1; Wed,
 03 Dec 2025 05:09:11 -0500
X-MC-Unique: 10XCLjGwN9GL3OUaqKpyRw-1
X-Mimecast-MFC-AGG-ID: 10XCLjGwN9GL3OUaqKpyRw_1764756549
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B776C1956096;
	Wed,  3 Dec 2025 10:09:08 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.14])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0307C19560A7;
	Wed,  3 Dec 2025 10:09:03 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251203072844.484893-1-ebiggers@kernel.org>
References: <20251203072844.484893-1-ebiggers@kernel.org>
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
Subject: Re: [PATCH v3 0/2] lib/crypto: ML-DSA verification support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1733238.1764756542.1@warthog.procyon.org.uk>
Date: Wed, 03 Dec 2025 10:09:02 +0000
Message-ID: <1733239.1764756542@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Give or take fixing the symbol export build failure:

Reviewed-by: David Howells <dhowells@redhat.com>
Tested-by: David Howells <dhowells@redhat.com>


