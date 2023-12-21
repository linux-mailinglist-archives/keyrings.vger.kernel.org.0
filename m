Return-Path: <keyrings+bounces-320-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE8C81B8E8
	for <lists+keyrings@lfdr.de>; Thu, 21 Dec 2023 14:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2712B1C2485D
	for <lists+keyrings@lfdr.de>; Thu, 21 Dec 2023 13:56:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A219755E67;
	Thu, 21 Dec 2023 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DC5tejTH"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA6453A0F
	for <keyrings@vger.kernel.org>; Thu, 21 Dec 2023 13:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703166367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FhlF0RFlx/kyh10s4ogQ+OUEod4X/F6PSmoh9V7F5AY=;
	b=DC5tejTHiJR2gVORmUcGeroOd0V+sj8VfrLgO2aae+pWyQjuuvpdngJmsM2LmX74McRJQR
	pHundVLpfMIMqrO65Nuw6bYB5soYkjs++3DpSpsH6aWRR8NtDSDMso0F7UYiwsXgrC9tW6
	JNjpj0voYU1dBLOMkiW87iIJSCbuWqU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-fg1EOsahPoyamTCawUubBg-1; Thu, 21 Dec 2023 08:46:03 -0500
X-MC-Unique: fg1EOsahPoyamTCawUubBg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 327F685A588;
	Thu, 21 Dec 2023 13:46:03 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DA921C060AF;
	Thu, 21 Dec 2023 13:46:02 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Markus Suvanto <markus.suvanto@gmail.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: David Howells <dhowells@redhat.com>,
	linux-afs@lists.infradead.org,
	keyrings@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] afs: Fix the dynamic root's d_delete to always delete unused dentries
Date: Thu, 21 Dec 2023 13:45:28 +0000
Message-ID: <20231221134558.1659214-2-dhowells@redhat.com>
In-Reply-To: <20231221134558.1659214-1-dhowells@redhat.com>
References: <20231221134558.1659214-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Fix the afs dynamic root's d_delete function to always delete unused
dentries rather than only deleting them if they're positive.  With things
as they stand upstream, negative dentries stemming from failed DNS lookups
stick around preventing retries.

Fixes: 66c7e1d319a5 ("afs: Split the dynroot stuff out and give it its own ops tables")
Signed-off-by: David Howells <dhowells@redhat.com>
Tested-by: Markus Suvanto <markus.suvanto@gmail.com>
cc: Marc Dionne <marc.dionne@auristor.com>
cc: linux-afs@lists.infradead.org
---
 fs/afs/dynroot.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
index 1fa8cf23bd36..34474a061654 100644
--- a/fs/afs/dynroot.c
+++ b/fs/afs/dynroot.c
@@ -252,20 +252,9 @@ static int afs_dynroot_d_revalidate(struct dentry *dentry, unsigned int flags)
 	return 1;
 }
 
-/*
- * Allow the VFS to enquire as to whether a dentry should be unhashed (mustn't
- * sleep)
- * - called from dput() when d_count is going to 0.
- * - return 1 to request dentry be unhashed, 0 otherwise
- */
-static int afs_dynroot_d_delete(const struct dentry *dentry)
-{
-	return d_really_is_positive(dentry);
-}
-
 const struct dentry_operations afs_dynroot_dentry_operations = {
 	.d_revalidate	= afs_dynroot_d_revalidate,
-	.d_delete	= afs_dynroot_d_delete,
+	.d_delete	= always_delete_dentry,
 	.d_release	= afs_d_release,
 	.d_automount	= afs_d_automount,
 };


