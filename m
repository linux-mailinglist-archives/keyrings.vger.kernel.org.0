Return-Path: <keyrings+bounces-3501-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C46C9F52B
	for <lists+keyrings@lfdr.de>; Wed, 03 Dec 2025 15:40:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 34DE730000BF
	for <lists+keyrings@lfdr.de>; Wed,  3 Dec 2025 14:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5DFC2FFDE3;
	Wed,  3 Dec 2025 14:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X+t1y9ut"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056512FFDFA
	for <keyrings@vger.kernel.org>; Wed,  3 Dec 2025 14:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764772843; cv=none; b=KX1VlSwf2mB4M11lBBceuH1hh1QUSACL9OTybuQgsv7jwKGf/ZJVYQnojkoC+tTzcV+YXiuV6QCZQFTFl/gfib9h1dqqIZfJgerwOPeH4hlfz9CVfrfMKr4PAUWcvoIe8y+Y4eq6m+To31ZocGLkUS0fjpQBEw1w9GwsjxWPtGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764772843; c=relaxed/simple;
	bh=sni84eXEYd+de2L/vVmmutjA/aIPRSlalbCS50kC3+w=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=I7PQe2MvB6j0MzkyQnHj/7OwWaj22V2V6vz+NJZSdDDVZRMC0XpfEXlEGWZNDK+sc5JIUk+0CvqeweBlmJE1rQETd8D9ve8w4DHMNuKRqCQV1UQW0WDGZEQzrFTVwEAYwju3gR6zbLA3g/mE/jGovxhOBc6crcQScuMZZE7mYuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X+t1y9ut; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764772841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sni84eXEYd+de2L/vVmmutjA/aIPRSlalbCS50kC3+w=;
	b=X+t1y9utHvtDSx/goosEFmaMHWqKUGI2BfY3hyokFiqKYVmEmbREO95GyvsFQ+oYNxpapX
	V5d3e6alzKjCSudw0wHYkTiRcspgCTGRmNjD8dR4pw040Tb36EYbOrZ8oSNuk0vdlmcu69
	UvZozoP3tNTZSxlIwqVUGKTni6sMTh0=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-549-t8h2yfuzPCq4fDB4xJVCDw-1; Wed,
 03 Dec 2025 09:40:37 -0500
X-MC-Unique: t8h2yfuzPCq4fDB4xJVCDw-1
X-Mimecast-MFC-AGG-ID: t8h2yfuzPCq4fDB4xJVCDw_1764772835
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 300BF1800358;
	Wed,  3 Dec 2025 14:40:35 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.14])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B001530001A2;
	Wed,  3 Dec 2025 14:40:30 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <94cb715bd8782b93e10a285c6dc6ec58@linux.ibm.com>
References: <94cb715bd8782b93e10a285c6dc6ec58@linux.ibm.com> <20251203072844.484893-1-ebiggers@kernel.org>
To: freude@linux.ibm.com
Cc: dhowells@redhat.com, Eric Biggers <ebiggers@kernel.org>,
    linux-crypto@vger.kernel.org,
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
Content-ID: <1937479.1764772829.1@warthog.procyon.org.uk>
Date: Wed, 03 Dec 2025 14:40:29 +0000
Message-ID: <1937480.1764772829@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Harald Freudenberger <freude@linux.ibm.com> wrote:

> ERROR: modpost: module mldsa_kunit uses symbol mldsa_use_hint from namespace
> EXPORTED_FOR_KUNIT_TESTING, but does not import it.

Change EXPORT_SYMBOL_FOR_KUNIT() in patch 1 to EXPORT_SYMBOL_GPL().

David


