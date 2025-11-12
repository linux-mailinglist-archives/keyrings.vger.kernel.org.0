Return-Path: <keyrings+bounces-3332-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3AAC53687
	for <lists+keyrings@lfdr.de>; Wed, 12 Nov 2025 17:32:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72A38563C92
	for <lists+keyrings@lfdr.de>; Wed, 12 Nov 2025 15:03:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F07052BEC31;
	Wed, 12 Nov 2025 14:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HT8+sipB"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9592857F6
	for <keyrings@vger.kernel.org>; Wed, 12 Nov 2025 14:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762959331; cv=none; b=XDWEYXOaR0W4o6PcXKxf1Sua9OEBYA8eXSZJNaOkdNkP47MY+br7Pp0rm3YuKCMtjXbexzK5N4LBYGmxAuUPsUEUK/ASDpBZFSH2PFENJcwDi0p1OojcbtNx/nU7+EnReyu+1xJKkGsvd7Gbtkhb2zjrmVsHT6ssQaN60mkgJxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762959331; c=relaxed/simple;
	bh=VvaOpU8/UH8cMCHv+j437vMmYuAqux2R0UTK+ai0Se4=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=WOyQGpTYN+KrV9dT5xwPjVuQs550Z/YAQaSzKD7GCsK+RFoVpeJReduOzHsc+82aD71hwZk+jwjyDbeQfRmVsxKJ5j0N1XB6qJUuKL8/LIGvvuXur/0M31654SFBwdD1TeclpEgxwkgL8EL53kM8sAz6w3Ye4mge0l3eJxxXgDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HT8+sipB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762959329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XnEcES/eMdb8xcUNYxyYTP/uMJ28lCAKuvb73LvVDYA=;
	b=HT8+sipBfJ6gMN9y/UF2kulU+S2MmszMieDWLquc4Xnz1go7UnuSgUzM3t78q9b5Bfc50a
	ih6gKw2laGnifBLQXwfm0y64DEBODZUk/DbTbIkvApJ/jhYd0OxzYIZ2ZokEjqfPEBT730
	IKm895xSJNhJ5NLmuKqzmf3RO6c5tgc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-241-YfQTWq4hM2iYIckLzPN4Jw-1; Wed,
 12 Nov 2025 09:55:28 -0500
X-MC-Unique: YfQTWq4hM2iYIckLzPN4Jw-1
X-Mimecast-MFC-AGG-ID: YfQTWq4hM2iYIckLzPN4Jw_1762959324
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA89119373F3;
	Wed, 12 Nov 2025 14:55:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.87])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0EA1F30044E0;
	Wed, 12 Nov 2025 14:55:18 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251106192016.GA3318@quark>
References: <20251106192016.GA3318@quark> <20251106174456.31818-1-dhowells@redhat.com> <20251106174456.31818-3-dhowells@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, Herbert Xu <herbert@gondor.apana.org.au>,
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
Subject: Re: [PATCH v7 2/8] crypto: Add ML-DSA/Dilithium verify support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1232847.1762959317.1@warthog.procyon.org.uk>
Date: Wed, 12 Nov 2025 14:55:17 +0000
Message-ID: <1232848.1762959317@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Eric Biggers <ebiggers@kernel.org> wrote:

> As I mentioned before
> (https://lore.kernel.org/linux-crypto/20250613170456.GA1284@sol/), this
> code should go in lib/crypto/.  There seems to be a clean API in
> crypto/ml_dsa/dilithium.h already.  Just make that the library API.

It's not that simple, as it turns out.  Various of the API structures are
dependent on the strength-specific #include magic stuff.
dilithium_{44,65,87}.h (or parts thereof) are used in the generation of those
structs.

Now, I can move all that stuff into one header file in include/crypto/, but
it's exposing a lot of the internals.

It also requires the caller to do some of the work in expanding the public key
and signature into those API structs, so it's probably better to wrap the
dilithium.h API to a simpler one with just init, update, fini and all-in-one
functions and have the crypto_sig interface call those (the helper functions
are pretty much the wrappers I need anyway).

David


