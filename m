Return-Path: <keyrings+bounces-145-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D92777F519C
	for <lists+keyrings@lfdr.de>; Wed, 22 Nov 2023 21:28:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A84E2812E2
	for <lists+keyrings@lfdr.de>; Wed, 22 Nov 2023 20:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B83E4CDFA;
	Wed, 22 Nov 2023 20:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EJPK1+BN"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BB979A
	for <keyrings@vger.kernel.org>; Wed, 22 Nov 2023 12:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700684893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kexBUKh1GtS1siCZEP+1NKTD1HmL5jAf4zVQjEezZLQ=;
	b=EJPK1+BNy/vhpXmcNbM2K2S+E6/cXc7iHi8VpBRstPdvSR3SnmSH7H97ntDBwYhj4/g1IB
	baFq1x/fwhBcGs1v93Jgv8EYXDdnA46QF3xNswOUaPXv8E12bbLkAv5BU9j66DG1rFFG/D
	k21iHNGc7Fn6HJ1e+AkoaS66bwvUdDY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-623-LIbAZVDaMHGnt3ZCA8kOUA-1; Wed,
 22 Nov 2023 15:28:11 -0500
X-MC-Unique: LIbAZVDaMHGnt3ZCA8kOUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C2342806047;
	Wed, 22 Nov 2023 20:28:11 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9180A1121306;
	Wed, 22 Nov 2023 20:28:10 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ZV5bs6azAPM2UIMq@farprobe>
References: <ZV5bs6azAPM2UIMq@farprobe> <268530.1700676155@warthog.procyon.org.uk>
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
Content-ID: <271141.1700684889.1@warthog.procyon.org.uk>
Date: Wed, 22 Nov 2023 20:28:09 +0000
Message-ID: <271142.1700684889@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3

Ben Boeckel <me@benboeckel.net> wrote:

> > I'm intending to move keyrings to GitLab for its upstream repo:
> > 
> > 	https://gitlab.com/linux-afs/keyutils
> 
> Thanks for the notice. Is the patch submission workflow going to add
> merge requests via the GitLab instance? If so, will the list be notified
> of activity on them?

Hmmm...  I wonder if I can make gitlab do that automatically.

David


