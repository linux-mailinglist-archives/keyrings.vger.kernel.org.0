Return-Path: <keyrings+bounces-3877-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJSlESflcGk+awAAu9opvQ
	(envelope-from <keyrings+bounces-3877-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 15:39:35 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB80588B6
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 15:39:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A369874229E
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 14:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF76C32D7F9;
	Wed, 21 Jan 2026 14:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jQeEuFLU"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AEAD26E71E
	for <keyrings@vger.kernel.org>; Wed, 21 Jan 2026 14:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005296; cv=none; b=jR9j5ETUep8nqNphcGeFp8mxqv4xqbBbwj+Vnt/i+jpHfG1p6dBjs1nlUBSSbOJRU0hI28lFDo0kgZ3wEMvyYo0C1CZ4ZkViij+kCIikdeZU2V6u42Ec9msjXllX6f0YmJqsWUdNXSijwRUYwnKwmHYA/xFhNE6rvxn6Y9VrC8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005296; c=relaxed/simple;
	bh=SKkxHr/4Y20TrGGrhUHMZ8TfhmW/auFLQlevZ9nME78=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=J60uw9lDlzvU6tHRWws9Axgpc6EJyDHAqMiJ4sdnIuBxjJTMRomXHbhRlqB4vlragSYjsCgrK2IpSSyVWtg3r1lCnVw7IrcijLeygGFQdEZxzyxXR89jYDKJsL/cMK3P8vqRV/AzqS9Qn0QQPFBQGOvnxr8rD4WGKC7f7YCyIo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jQeEuFLU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769005294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y9J0yNk9gQUKqagsXpBx9lwE8Dd54ncS4Pt3VeCsioE=;
	b=jQeEuFLUzNlP4hlcx1I+Fx4wh6EfgA3Sx7P4NVBpvT7m49zb3xcNWfl/deTQ6QEVgi2Rnt
	2Z5V1ts0wIQh9+670j63ydeTc6ZN45b0UgkLE69xMycNKn39+Ih4tLVqZJJaC+xD90jhBD
	Ld1FuEdhKqYsXChaBJgrjPEMzHc+qkI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-259-iJeA0WS6MHa0uBqGFEzEJQ-1; Wed,
 21 Jan 2026 09:21:29 -0500
X-MC-Unique: iJeA0WS6MHa0uBqGFEzEJQ-1
X-Mimecast-MFC-AGG-ID: iJeA0WS6MHa0uBqGFEzEJQ_1769005287
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 21E7219560A6;
	Wed, 21 Jan 2026 14:21:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.2])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B821C1800240;
	Wed, 21 Jan 2026 14:21:21 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20260120213820.GD2657@quark>
References: <20260120213820.GD2657@quark> <20260120145103.1176337-1-dhowells@redhat.com> <20260120145103.1176337-6-dhowells@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: dhowells@redhat.com, Lukas Wunner <lukas@wunner.de>,
    Ignat Korchagin <ignat@cloudflare.com>,
    Jarkko Sakkinen <jarkko@kernel.org>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    "Jason A . Donenfeld" <Jason@zx2c4.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
    keyrings@vger.kernel.org, linux-modules@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 05/12] modsign: Enable ML-DSA module signing
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1551501.1769005280.1@warthog.procyon.org.uk>
Date: Wed, 21 Jan 2026 14:21:20 +0000
Message-ID: <1551502.1769005280@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	TAGGED_FROM(0.00)[bounces-3877-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: DDB80588B6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Eric Biggers <ebiggers@kernel.org> wrote:

> If OpenSSL 3.5 is the last version that doesn't support the noattr case,
> that would mean that OpenSSL 3.6 does support it, right?  OpenSSL 3.6
> was released several months ago.  Yet the above code requires version 4.

3.5 and 3.6 support ML-DSA, but not with CMS_NOATTR, so I need to update this.
Version 4 will support ML-DSA with CMS_NOATTR, but that's not yet tagged.

> How about we just support the new way only?  That would be simpler, and
> it sounds like it's already supported by the latest OpenSSL.

Depends what you mean by "latest OpenSSL".  Latest in git, yes; latest in
distributions that people can simply install as an rpm/deb/etc., no.

Now, assuming OpenSSL releases v4 sometime in the spring, I would probably be
fine with saying you have to have OpenSSL v4 if you want ML-DSA; but others
might have a different opinion.

David


