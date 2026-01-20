Return-Path: <keyrings+bounces-3867-lists+keyrings=lfdr.de@vger.kernel.org>
Delivered-To: lists+keyrings@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMnuF4cVcGlyUwAAu9opvQ
	(envelope-from <keyrings+bounces-3867-lists+keyrings=lfdr.de@vger.kernel.org>)
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 00:53:43 +0100
X-Original-To: lists+keyrings@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F20194E2A8
	for <lists+keyrings@lfdr.de>; Wed, 21 Jan 2026 00:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1AFCAB63D04
	for <lists+keyrings@lfdr.de>; Tue, 20 Jan 2026 23:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424DE3EFD0A;
	Tue, 20 Jan 2026 23:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Io1SDcCu"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E01539E6ED
	for <keyrings@vger.kernel.org>; Tue, 20 Jan 2026 23:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768950975; cv=none; b=JagT5uVP+8GpUx1y9JiIzBT5Imo2h33PRk0Di9p8gP18tza52TxP4O5SNkuW4VPwJjqWJrZhcxNIfO9Z/qdgN3C+/JVv1RZrj3JyUBYXheU2RR9IhIrwmIxrE6G2ppzL6EzVKcTISBiry07f9oljh6Yt59l9n93WV7GJ/vwtrJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768950975; c=relaxed/simple;
	bh=LEePhgeA+c4wUWPgrH0V4UdQ6IDyqqR0Km9eK2soupU=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=ixrlKRCcEbAGc+CcmsVpzQP+pTVK7+aPF2LqrmuZ5dguPln9pgTnhVAKNcRkTGYjk6kYW7NjVwuiM5AFrVltaU8P2F2FXylP7r84Hg4b0qzSzgBCrkQNz09s8nKiSQbN8RbIEd6u1NsSWB1knxRLXpCY5mfsc+gYxmZf5kgzpdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Io1SDcCu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768950972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bUD87WoL8alrN45Dp0W0iZwxis7ACA2ngLoImtzCs5I=;
	b=Io1SDcCuC0SobviIyXBBurAFz/981H3NJl5z7He1mraHnU6Uy77JtyURIi2N/hF23Pw9Mk
	VymUa5C0yvBKM75wOg4SQuLHn203+EJ935gxUvVbHBlnaHUqTxXoAnnJruRG/Ql0wU6qmP
	xvNrrtCFfCl5s2YYwPwc9/xgART2P1A=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-344-96MHl7qaOGuI3_ImjVdjfg-1; Tue,
 20 Jan 2026 18:16:07 -0500
X-MC-Unique: 96MHl7qaOGuI3_ImjVdjfg-1
X-Mimecast-MFC-AGG-ID: 96MHl7qaOGuI3_ImjVdjfg_1768950964
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E37EF1956095;
	Tue, 20 Jan 2026 23:16:03 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.2])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DDAA91800285;
	Tue, 20 Jan 2026 23:15:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20260120224108.GC6191@quark>
References: <20260120224108.GC6191@quark> <20260120145103.1176337-1-dhowells@redhat.com> <20260120145103.1176337-8-dhowells@redhat.com>
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
    Tadeusz Struk <tadeusz.struk@intel.com>,
    "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v13 07/12] crypto: Add RSASSA-PSS support
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1416721.1768950957.1@warthog.procyon.org.uk>
Date: Tue, 20 Jan 2026 23:15:57 +0000
Message-ID: <1416722.1768950957@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	TAGGED_FROM(0.00)[bounces-3867-lists,keyrings=lfdr.de];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	FROM_NEQ_ENVFROM(0.00)[dhowells@redhat.com,keyrings@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[keyrings];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,warthog.procyon.org.uk:mid]
X-Rspamd-Queue-Id: F20194E2A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Eric Biggers <ebiggers@kernel.org> wrote:

> As I mentioned in another reply, error-prone string parsing isn't a
> great choice.  C has native support for function parameters.

But is constrained that it has to work with KEYCTL_PKEY_VERIFY's info
parameter.

David


