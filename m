Return-Path: <keyrings+bounces-3415-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 37378C7B1AB
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 18:41:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63AF63A37DF
	for <lists+keyrings@lfdr.de>; Fri, 21 Nov 2025 17:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74C134D38E;
	Fri, 21 Nov 2025 17:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="heVUq8Vm"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6292ECE83
	for <keyrings@vger.kernel.org>; Fri, 21 Nov 2025 17:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763746897; cv=none; b=ejTx3hz8OpHDsfME2M1dLCaIUD66bfHOKMQRsn0ZTT2wjtLDmdLbHzfiRz+h7l3gj3qhzHC+36h/diytFNQiXnv7Q1pChQYyxMlS9cbx7bIMJ4ECcOJ1Ubb38ssBqAdXf2dVfCSLZhK3JY2rywFH7dMGrGJKxK8ALmtJba7YaFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763746897; c=relaxed/simple;
	bh=Hr0jEcRhdkLIIYgRig4jVVH0qfASNwYnKxYMauD9L7g=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=JJ67KdaZalZ5EUM9QoIzbZnz7GUOJ0qygnnpFnIQhHHGa83mrlAYEd4s4iKdz16B5m0iyepMVDjcEPWUb7EcVoncxPH0brKfjjoimHX4FVYRr/rJjbVSYPXBez/9sLsqk7lRlRswOdTYeYhYmBN2kE3f6PegxjG9SvEyKkQwVeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=heVUq8Vm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763746895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hr0jEcRhdkLIIYgRig4jVVH0qfASNwYnKxYMauD9L7g=;
	b=heVUq8VmoGXbBE6TnTLKi3R5NMnUo+CH34VDfYOU505cnEOwFsHQPzu9ae5E0LDGMDcKfm
	nxiJDHGrlpl11W2czcJ3WBj41VQa507PWTMDa1qJ38qXOE+D3LnqZzbLEB35nbAu8W8tIu
	Va990+e0+ciYi/9ee9GJTCZdNAftqcU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-336-e8P11Z0mMvKXmHXx4Gzk9A-1; Fri,
 21 Nov 2025 12:41:31 -0500
X-MC-Unique: e8P11Z0mMvKXmHXx4Gzk9A-1
X-Mimecast-MFC-AGG-ID: e8P11Z0mMvKXmHXx4Gzk9A_1763746889
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE08B1956094;
	Fri, 21 Nov 2025 17:41:28 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.5])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DE8401956045;
	Fri, 21 Nov 2025 17:41:24 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20251121171421.GA1737@sol>
References: <20251121171421.GA1737@sol> <20251121005017.GD3532564@google.com> <20251120003653.335863-2-ebiggers@kernel.org> <20251120003653.335863-1-ebiggers@kernel.org> <2624664.1763646918@warthog.procyon.org.uk> <2755899.1763728901@warthog.procyon.org.uk>
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
Content-ID: <3042396.1763746883.1@warthog.procyon.org.uk>
Date: Fri, 21 Nov 2025 17:41:23 +0000
Message-ID: <3042397.1763746883@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Eric Biggers <ebiggers@kernel.org> wrote:

> I could write it another way that wouldn't assume familiarity with open
> interval notation, like [0, q - 1] or 0 <= val < q.

"[0, q-1]" would be less prone to confusion, thanks - and editors flagging the
bracket mismatch.

David


