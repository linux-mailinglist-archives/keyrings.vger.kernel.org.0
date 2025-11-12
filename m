Return-Path: <keyrings+bounces-3334-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 093B9C53275
	for <lists+keyrings@lfdr.de>; Wed, 12 Nov 2025 16:47:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2242E353C0D
	for <lists+keyrings@lfdr.de>; Wed, 12 Nov 2025 15:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88FC633AD8C;
	Wed, 12 Nov 2025 15:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dhq91ijk"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FC52BD022
	for <keyrings@vger.kernel.org>; Wed, 12 Nov 2025 15:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762961832; cv=none; b=QR4gX90gCeZgmUdein2W54BSRnFA6BCexqMAesYFU6Dfs+YLKdMq1ZlCFX1Gv+N4204Jo5qHUcjcDIgIpXEkI99n7CqUicLbZlTEDxalpJkMOlZ82nfIKmpdSAqrviJjOUywqDvVGZMS3VqjGy/RixwtWGjKbH7pKlZ8G4iKyec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762961832; c=relaxed/simple;
	bh=El9v2YHou57F4ZelpceI4moqozxDnwwk7sgNbOY1u4A=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=g1FiA+fytAuy0KQyAY7GJ+vumthgnSAw5Yh8/AcKY/b3wi/4eJhrAvLzHCktylpD88H21yQuAZozbtGr5GKvDLUMv8ywSN/WrCGjIoC8ba6E/ozyY51C6sasMkPfz7IHgQAlyHnN3USsqhWyJj7lpXtWhr2tguWrfWkvDuAMVJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dhq91ijk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762961829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=El9v2YHou57F4ZelpceI4moqozxDnwwk7sgNbOY1u4A=;
	b=dhq91ijkFAIdfXZq8G5hLKtwptYwnBhrC2DwNT9udc9qRqr1IpsnugpnJRokEmsTBTCdKm
	UjP07At49kt8hL7HROpVkLUCyJHtCYxvW+DQVDFQFqod7O3cgTzzQEceEHPaXEZSUi92Iv
	Oqi6DgQVK/zXdVL2zlTDpoNhEAh1ygI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-55-T9BcvPaAPIG20bMTCY_0nw-1; Wed,
 12 Nov 2025 10:37:06 -0500
X-MC-Unique: T9BcvPaAPIG20bMTCY_0nw-1
X-Mimecast-MFC-AGG-ID: T9BcvPaAPIG20bMTCY_0nw_1762961823
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8E584195606D;
	Wed, 12 Nov 2025 15:37:02 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.87])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C454830044E9;
	Wed, 12 Nov 2025 15:36:58 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <e624c242-b297-4bb7-a76a-cbb18b027472@suse.com>
References: <e624c242-b297-4bb7-a76a-cbb18b027472@suse.com> <20251111154923.978181-1-petr.pavlu@suse.com> <20251111154923.978181-3-petr.pavlu@suse.com> <922480ff44bda3b6ecfda1ae780c659644560f94.camel@HansenPartnership.com>
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: dhowells@redhat.com,
    James Bottomley <James.Bottomley@HansenPartnership.com>,
    David Woodhouse <dwmw2@infradead.org>,
    Luis Chamberlain <mcgrof@kernel.org>,
    Daniel Gomez <da.gomez@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Aaron Tomlin <atomlin@atomlin.com>, keyrings@vger.kernel.org,
    linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] sign-file: Remove support for signing with PKCS#7
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1234919.1762961817.1@warthog.procyon.org.uk>
Date: Wed, 12 Nov 2025 15:36:57 +0000
Message-ID: <1234920.1762961817@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Petr Pavlu <petr.pavlu@suse.com> wrote:

> In practice, since distributions now typically sign modules with SHA-2, for
> which sign-file already required CMS API support, removing the USE_PKCS7
> code shouldn't cause any issues.

We're looking at moving to ML-DSA, and the CMS support there is slightly dodgy
at the moment, so we need to hold off a bit on this change.

Patch 1, removing the option to sign with SHA-1 from the kernel is fine, but
doesn't stop things that are signed with SHA-1 from being verified.

David


