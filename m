Return-Path: <keyrings+bounces-256-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E807680E822
	for <lists+keyrings@lfdr.de>; Tue, 12 Dec 2023 10:49:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25B891C20A22
	for <lists+keyrings@lfdr.de>; Tue, 12 Dec 2023 09:49:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91B1F3C064;
	Tue, 12 Dec 2023 09:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BYE5x6pj"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B48AD2
	for <keyrings@vger.kernel.org>; Tue, 12 Dec 2023 01:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702374577;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JqHDA3enYyDm9+orwRX3ZL56upwXmxhtRXNULm36dzE=;
	b=BYE5x6pjo7wUyZ6K81psaY9JUWm7EjVg1eg6FRbwsk1iZbOyTX68/Zev34mLaxOQJQJZCO
	HNzVKjf+cXNT6xEKEYzV8xWAqFoTO6Csoi0hiD4e7fjjmjykG8TGeWRntbQFm/pZapFqf1
	IEH34c1vYit9gRzA7rlSiyNI6jqsZzk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-XhY6sUdRMPqMxl8h6TStQg-1; Tue, 12 Dec 2023 04:49:31 -0500
X-MC-Unique: XhY6sUdRMPqMxl8h6TStQg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5ED1088D588;
	Tue, 12 Dec 2023 09:49:31 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.2])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1380B40C6EB9;
	Tue, 12 Dec 2023 09:49:29 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <d523ca40916a8c17ea8ab6d980265e2985e094b3.camel@gmail.com>
References: <d523ca40916a8c17ea8ab6d980265e2985e094b3.camel@gmail.com> <59be73c8346ca0c0d6feddcdb56b043cfa0aea4d.camel@gmail.com> <20231211163412.2766147-1-dhowells@redhat.com> <2810523.1702371786@warthog.procyon.org.uk>
To: markus.suvanto@gmail.com
Cc: dhowells@redhat.com, Marc Dionne <marc.dionne@auristor.com>,
    linux-afs@lists.infradead.org, keyrings@vger.kernel.org,
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] afs: Fix dynamic root interaction with failing DNS lookups
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2812151.1702374569.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Dec 2023 09:49:29 +0000
Message-ID: <2812152.1702374569@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

markus.suvanto@gmail.com wrote:

> > Can you "grep rxrpc /proc/keys" at this point?
> > =

> different cell though...
> =

> masu@t470 ~ % grep rxrpc /proc/keys
> 23e16cda I--Q---     1   3d 3b010000  1001   100 rxrpc     afs@movesole.=
com: ka

Okay, I see the persistent keyring disappear, but I don't see a key linked
into my session keyring vanish.

David


