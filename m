Return-Path: <keyrings+bounces-3870-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIX6NxEWcGlyUwAAu9opvQ
	(envelope-from <keyrings+bounces-3870-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 00:56:01 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAA74E313
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 00:56:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1B6819ADFF5
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 23:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E552C2FC006;
	Tue, 20 Jan 2026 23:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qbcv/6mp"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CBD3F23A3
	for <keyrings@vger.kernel.org>; Tue, 20 Jan 2026 23:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768952400; cv=none; b=Lbr92zPV/fPHAco6tqtyDFH3yiT0hHKTEWwe/dEk22iJViAe7vs6ZXnUFgil5laXy1cUYdw/d3hY02JcxphSZNrZ6Df4nJRF86SWh9fto+WuGv3i5obA4SNDfi1fl3ZjUWsalHRJVsCxZ2TlCj6TWzu+opda+/X7dnCJ8eKnwTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768952400; c=relaxed/simple;
	bh=8PRyOYCD5eYQzR+cQnyDeO0Q8ZZ5M54SdFDosc3Mtd8=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=Tvx2WL4D5idZudgEZ8HvgQQ4YzkIKZ633d0O5Wd5AQ4Jc5PMmjbd0KyXBT8KmkGBAVAQ99+Ll1I3A88+VlzFHb/5DcgGToXWChLLAQte2ECBZFyir1uuiXN8ZXYf6LKKWH42/0X6+9JWcfUMh/tFEXyZ0Jcgtrh2v1X3CF7Cpb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qbcv/6mp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768952397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4K6PuA+VwcYOVzfCFue8DjJCoVb1ol6gggBxb6ae3yw=;
	b=Qbcv/6mp8AycpKCz1iL8wfbHkLzziNZv+OIC0NomZVr2tFE7NrILDy+5eIgDbnVxJCHa6A
	BUi1qjJIzl5bdXiGXRJsvGlPzhcq6o7NLkQjvH2o9gV50DBeimB5uZmCXANUuB1ivZYdTN
	PjGwS6NyaPE4w/3FwiRhOa3+LSq+BIA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-258-oVbVS3WiMEOYyM0E1b6dzA-1; Tue,
 20 Jan 2026 18:39:54 -0500
X-MC-Unique: oVbVS3WiMEOYyM0E1b6dzA-1
X-Mimecast-MFC-AGG-ID: oVbVS3WiMEOYyM0E1b6dzA_1768952392
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F2CF2180035C;
	Tue, 20 Jan 2026 23:39:51 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.2])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1F4C81800240;
	Tue, 20 Jan 2026 23:39:47 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20260120220321.GA6191@quark>
References: <20260120220321.GA6191@quark> <20260115215100.312611-1-dhowells@redhat.com> <20260115215100.312611-7-dhowells@redhat.com>
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
    linux-kernel@vger.kernel.org,
    "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v12 06/10] crypto: Add supplementary info param to asymmetric key signature verification
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1418294.1768952386.1@warthog.procyon.org.uk>
Date: Tue, 20 Jan 2026 23:39:46 +0000
Message-ID: <1418295.1768952386@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	TAGGED_FROM(0.00)[bounces-3870-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,warthog.procyon.org.uk:mid]
X-Rspamd-Queue-Id: 7FAA74E313
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Eric Biggers <ebiggers@kernel.org> wrote:

> As I'm sure you're aware, C has native support for function parameters.

And we have a syscall interface to honour that takes a parameter string *for
this very purpose*.  It just wasn't threaded into the akcipher API.

> This is yet another example of a case where trying to fit different
> algorithms into a generic API doesn't work well.

Well enough.

> We should just have a library API for each signature algorithm, with
> each algorithm taking the parameters it needs.

No, we shouldn't.  We have a library that allows demand loadable modules.  We
should use that.

David


