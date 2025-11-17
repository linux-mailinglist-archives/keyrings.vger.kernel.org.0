Return-Path: <keyrings+bounces-3367-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E715DC65064
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 17:03:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EFE20347E41
	for <lists+keyrings@lfdr.de>; Mon, 17 Nov 2025 16:02:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D102BEC45;
	Mon, 17 Nov 2025 16:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZnWcTGMR"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B4F285CAA
	for <keyrings@vger.kernel.org>; Mon, 17 Nov 2025 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763395319; cv=none; b=pf2eYqo5WmM8HenK9/Bz/tvfkrEen/9fUWPbA4dfx4FeXPkZmP9pZjD7jl4OEU1r+xwGkehGf+pZ0Y4zmsX+F6eQrFjeTGgMdBT0q6DblL3CA4IeLQRynzmyLtdd6chpVRe4v01n5GvbMBqoBD1gJDk79Yyr4fl5k7SCX4Q7dUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763395319; c=relaxed/simple;
	bh=IvWsMcb+Yh4OQgVKqlQOqb7kOQu14WaUOMto1enyEz4=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=B8nXNhDqRliEktGSwRkbdQqISEyve5xfwGDyvEIbWu1HjCy/GntS9Tmu/3l0VJLxHXnFKLnKq7BxFwD/HGuu+gFY283sOny0wsFdXGM5O6+CGNrB0cC2xdUseTx4n6JDkD/pQMXbPBPUTo+a8mxCOhBhDoyj7kw1VoWvqP0mgyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZnWcTGMR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763395316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xN1tMHSK0V4V/Ye9++bgGmJbF6vFPnFJ43P66UO+n5Q=;
	b=ZnWcTGMRfMgdNXnRuvp4gH/kC0gRimzxHlz4yKpx8zGNvLAMvosqXQYJmNyh9AxOySfeMp
	UCcYqZH3qmp+JKwqUsn9o2E2RLcM671D+n9gPCuLBRClV0MQFWXVEuIRS6pgl1jJbW2kxp
	mB875a5Xjs+QFHeIQnJVmVD98pjWuMk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-BuuLYLfTOkKQ9jkBXfwKiw-1; Mon,
 17 Nov 2025 11:01:51 -0500
X-MC-Unique: BuuLYLfTOkKQ9jkBXfwKiw-1
X-Mimecast-MFC-AGG-ID: BuuLYLfTOkKQ9jkBXfwKiw_1763395305
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A6C1A1802AAD;
	Mon, 17 Nov 2025 16:01:44 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 785E33003778;
	Mon, 17 Nov 2025 16:01:40 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251117145606.2155773-1-dhowells@redhat.com>
References: <20251117145606.2155773-1-dhowells@redhat.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: dhowells@redhat.com, Eric Biggers <ebiggers@kernel.org>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>,
    Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>, linux-crypto@vger.kernel.org,
    keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Where to add FIPS tests
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2158595.1763395299.1@warthog.procyon.org.uk>
Date: Mon, 17 Nov 2025 16:01:39 +0000
Message-ID: <2158596.1763395299@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi Herbert,

I'm wondering from where I should invoke the FIPS tests for ML-DSA.

Currently, the asymmetric key type has some FIPS selftests for RSA and ECDSA
built into it, but I wonder if that's the best way.  The problem is that it
does the selftest during module init - but that can only test whatever
algorithms are built into the base kernel image and initialised at the time
late_initcall() happens.

It might be better to put the tests into the algorithm modules themselves -
but that then has a potential circular dependency issue.  However, that might
not matter as the asymmetric key type won't be built as a module and will be
built into the kernel (though some of the components such as X.509 and PKCS#7
can be built as modules).

If I don't involve X.509/PKCS#7 in the selftest, then doing it from the ML-DSA
modules during module init would be fine.

Do you (or anyone else) have any thoughts?

David


