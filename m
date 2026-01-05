Return-Path: <keyrings+bounces-3707-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D254CCF2E48
	for <lists+keyrings@lfdr.de>; Mon, 05 Jan 2026 11:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 862CD30D80CA
	for <lists+keyrings@lfdr.de>; Mon,  5 Jan 2026 09:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6138232ABFF;
	Mon,  5 Jan 2026 09:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UDo5SXb9"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F1E32BF40
	for <keyrings@vger.kernel.org>; Mon,  5 Jan 2026 09:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767607052; cv=none; b=MWrb2MIjZ28YaeDzAQqeTEdC0Q/OgpMoRm+TPXTWxs+HgOEeX9SwHyvVGdYWIwKVpUOEcanIe3mU4umAxvElfTcpXUiZAzX5hBUiqbTFnC4o88wj+kdRHXsBfvoPzlDKuMUApQgTi2g7wJV1S2DGBoPeH+IoyS9wHTUDaPJAAAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767607052; c=relaxed/simple;
	bh=YosT8TmEHTsMmh8rks0COGu2q0XNu7LTcinrJQC64tU=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=SNdAILvfpunXL8njKOLkh34YIi6DE4mRup7RD+nw2Xd8WOXDz7YXtw5HenrRqsu2gA/w9dHWMHCM4pN6esd2q1LkbqnC99Je/p99/aLnDUkjKP/m//S0o30tyZTc9xAf/T2NmlRExP4L9E7DLD8GhlPCRzs6E23siA7KL/KQDCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UDo5SXb9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767607049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y7fU2oLj4//El3OkC487mYGloPVDa7j3e9myZHNTrq0=;
	b=UDo5SXb9whFWxIFJiJh0XqNOwU952AkZtwObJsf/NC3sWbYn1gVuB9Bx/crvc54ENsjxp1
	RT/pRH8VkJUImyfBdfYP6+CY2vv850IKlTvnoCGG7fvkBU/gfh6sjzGtTMjqBX/i1r8Gjr
	XYrMVLLBr6nTJidAiFzt4QYoD4ACQog=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-302-AaRMCpPqPi-aYc21tMwNzA-1; Mon,
 05 Jan 2026 04:57:27 -0500
X-MC-Unique: AaRMCpPqPi-aYc21tMwNzA-1
X-Mimecast-MFC-AGG-ID: AaRMCpPqPi-aYc21tMwNzA_1767607044
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0E72E1956089;
	Mon,  5 Jan 2026 09:57:23 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.4])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 20C5F1800367;
	Mon,  5 Jan 2026 09:57:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251220-dev-module-init-eexists-keyring-v1-1-a2f23248c300@samsung.com>
References: <20251220-dev-module-init-eexists-keyring-v1-1-a2f23248c300@samsung.com>
To: Daniel Gomez <da.gomez@kernel.org>
Cc: dhowells@redhat.com, Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    "David S. Miller" <davem@davemloft.net>,
    Jarkko Sakkinen <jarkko@kernel.org>,
    Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
    "Serge E.
 Hallyn" <serge@hallyn.com>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>,
    Sami Tolvanen <samitolvanen@google.com>,
    Aaron Tomlin <atomlin@atomlin.com>,
    Lucas De Marchi <demarchi@kernel.org>, keyrings@vger.kernel.org,
    linux-crypto@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
    Daniel Gomez <da.gomez@samsung.com>
Subject: Re: [PATCH] KEYS: replace -EEXIST with -EBUSY
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1793803.1767607035.1@warthog.procyon.org.uk>
Date: Mon, 05 Jan 2026 09:57:15 +0000
Message-ID: <1793804.1767607035@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Daniel Gomez <da.gomez@kernel.org> wrote:

> From: Daniel Gomez <da.gomez@samsung.com>
> 
> The -EEXIST error code is reserved by the module loading infrastructure
> to indicate that a module is already loaded.

EEXIST means a file exists when you're trying to create it.  Granted we abuse
that somewhat rather than add ever more error codes, but you cannot reserve it
for indicating that a module exists.

> When a module's init
> function returns -EEXIST, userspace tools like kmod interpret this as
> "module already loaded" and treat the operation as successful, returning
> 0 to the user even though the module initialization actually failed.
> 
> This follows the precedent set by commit 54416fd76770 ("netfilter:
> conntrack: helper: Replace -EEXIST by -EBUSY") which fixed the same
> issue in nf_conntrack_helper_register().
> 
> Affected modules:
>   * pkcs8_key_parser x509_key_parser asymmetric_keys dns_resolver
>   * nvme_keyring pkcs7_test_key rxrpc turris_signing_key
> 
> Signed-off-by: Daniel Gomez <da.gomez@samsung.com>

Please don't.  Userspace can always check /proc/modules (assuming procfs is
enabled, I suppose).

David


