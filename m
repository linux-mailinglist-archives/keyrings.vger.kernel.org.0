Return-Path: <keyrings+bounces-240-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0522180C4DA
	for <lists+keyrings@lfdr.de>; Mon, 11 Dec 2023 10:40:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C499281667
	for <lists+keyrings@lfdr.de>; Mon, 11 Dec 2023 09:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B69721373;
	Mon, 11 Dec 2023 09:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dgqs95N1"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE29F4
	for <keyrings@vger.kernel.org>; Mon, 11 Dec 2023 01:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702287597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D6E/JbOgRlafB07l2RhqXyNqtkIVK6/P45Vcd+KIE9A=;
	b=dgqs95N16PCwuq5nYmMcTxnZbal4F10LqF6MJCZ54S0zrVbUGUNdR3Fcj1pNBmG2rzhDPH
	EkFGdvnMZlORRQlu1OwoREGx6kpDWLHcZ1DWSzrfqUBbr97/wYTo4xRQSZR/wGue+jVUEa
	Ibtw/K919ItqRB/C6YflTSd0L1NEDnM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-6O8qtyyINq2RFDZfbUt1mg-1; Mon,
 11 Dec 2023 04:39:53 -0500
X-MC-Unique: 6O8qtyyINq2RFDZfbUt1mg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 810C6280D583;
	Mon, 11 Dec 2023 09:39:53 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CB6D42166B31;
	Mon, 11 Dec 2023 09:39:52 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ZV6ilnhiE5tQs3RK@farprobe>
References: <ZV6ilnhiE5tQs3RK@farprobe> <ZV5bs6azAPM2UIMq@farprobe> <268530.1700676155@warthog.procyon.org.uk> <271142.1700684889@warthog.procyon.org.uk>
To: Ben Boeckel <me@benboeckel.net>
Cc: dhowells@redhat.com, keyrings@vger.kernel.org,
    Jarkko Sakkinen <jarkko@kernel.org>
Subject: Re: GitLab repo for keyrings
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2709278.1702287592.1@warthog.procyon.org.uk>
Date: Mon, 11 Dec 2023 09:39:52 +0000
Message-ID: <2709279.1702287592@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

Ben Boeckel <me@benboeckel.net> wrote:

> I don't see anything on my (unpaid) account at least under project
> integrations.

There is an gitlab email integration that says it can send notifications for
pushes and various other things.  I set that, did a merge (which apparently
did a push), but it didn't seem to generated any notification email.

> Another alternative is setting up a gitlab.com account that receives
> notifications and forwards/subscribes using the ML address.

That has occurred to me, but all the account wangling notifications would go
through the mailing list too:-/

David


