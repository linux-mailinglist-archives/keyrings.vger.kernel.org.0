Return-Path: <keyrings+bounces-143-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CE37F4EE4
	for <lists+keyrings@lfdr.de>; Wed, 22 Nov 2023 19:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 443E32812F3
	for <lists+keyrings@lfdr.de>; Wed, 22 Nov 2023 18:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C365656475;
	Wed, 22 Nov 2023 18:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jTkjT+uj"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C141AB
	for <keyrings@vger.kernel.org>; Wed, 22 Nov 2023 10:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700676158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=nGOSaseF3+ogIPSYxa8/MeerGUIQ2lvMhccW/iCHr+o=;
	b=jTkjT+ujQNLMwLxX4/1PSN0PBQy7adm1EoF0lszB0tm5TD3oQUDFyXsdpcdxDU3HDQGNWN
	/sEzd0quvys1ll6y3PDnhSc6oQWP/bdf4HHKMUg/nuC25IVeG3ZcuRDoqCUJd1xyFfd0vs
	WMBNfIAUrT9e0eyFw/jE82bHu3APddM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-16-7nVcVsjLPIWOZ3Y7o_En6w-1; Wed,
 22 Nov 2023 13:02:36 -0500
X-MC-Unique: 7nVcVsjLPIWOZ3Y7o_En6w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E9CB3C10158;
	Wed, 22 Nov 2023 18:02:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 13FF21C060AE;
	Wed, 22 Nov 2023 18:02:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: keyrings@vger.kernel.org
cc: dhowells@redhat.com, Jarkko Sakkinen <jarkko@kernel.org>
Subject: GitLab repo for keyrings
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <268529.1700676155.1@warthog.procyon.org.uk>
Date: Wed, 22 Nov 2023 18:02:35 +0000
Message-ID: <268530.1700676155@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Hi,

I'm intending to move keyrings to GitLab for its upstream repo:

	https://gitlab.com/linux-afs/keyutils

David


