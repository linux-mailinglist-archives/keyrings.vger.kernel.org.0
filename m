Return-Path: <keyrings+bounces-3394-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 483CDC72BDC
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 09:15:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 89FED352E1D
	for <lists+keyrings@lfdr.de>; Thu, 20 Nov 2025 08:15:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E66A61E0083;
	Thu, 20 Nov 2025 08:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VU3h0doe"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93254273D81
	for <keyrings@vger.kernel.org>; Thu, 20 Nov 2025 08:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763626511; cv=none; b=sXqYB3WCh/jebKTNRpTMulsAtElGuNkkv5EsGWYaJ9JEAaBKThcmzvccpc9yy4Oaz6dNUCLr2Z2njgHgb3UsuKm2E6c0wtYz45Fk9iMGN95GWkJmkXfekGBzSWx7fUQ1qbeKd5TI+6/aJPeYV/535O2r11SqlTqu6bXYQxsUDrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763626511; c=relaxed/simple;
	bh=Lb3IrJprVqz6CKxtaqHmth6EKjf78JfcR5bwaWL3YxI=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=Pvm7rZnbLc3Fk4iEpujk6E867tMBh3PlNU+3GjaIwJdBla3rm7q/ShvtXRZKvYlIBfnApo3pbCXWgsPXraKyzgqgyzmcNj6SKo+00LQjl9uPk+hu0mHPZpgdE1IUP3hjSlVIeSK84PfMYFj0OF0WDhRL5g1Fm8s/DBLHnxiWUKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VU3h0doe; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763626508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lb3IrJprVqz6CKxtaqHmth6EKjf78JfcR5bwaWL3YxI=;
	b=VU3h0doeLE0gQSP9o2IY7w7vHMQa52aOFz0Wu3NmLKMnfzmMFItwIiUitpNkOyHocV0inf
	uFn1ndE+Fb4YUCc9G4A/2lFn3rn+wGmKL8qePpQ+bTVNo7XkZwlLpIUz1hbfdLzow6TokW
	Lxvsamgwt0MmYuMBG8c3ex9i/u5y5jc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-417-jO5k8ezrOFejpa_A36ztYw-1; Thu,
 20 Nov 2025 03:15:05 -0500
X-MC-Unique: jO5k8ezrOFejpa_A36ztYw-1
X-Mimecast-MFC-AGG-ID: jO5k8ezrOFejpa_A36ztYw_1763626502
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EB49118011EF;
	Thu, 20 Nov 2025 08:15:01 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 30F3F19560A2;
	Thu, 20 Nov 2025 08:14:58 +0000 (UTC)
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
Content-ID: <2534430.1763626496.1@warthog.procyon.org.uk>
Date: Thu, 20 Nov 2025 08:14:56 +0000
Message-ID: <2534431.1763626496@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

You need to add something like:

#include <linux/module.h>
...
MODULE_DESCRIPTION("ML-DSA signature verification");
MODULE_LICENSE("GPL");

David


