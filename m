Return-Path: <keyrings+bounces-2971-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71066B31BB5
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 16:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 627D61D40A0B
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 14:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA01A3101BF;
	Fri, 22 Aug 2025 14:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bUFM46pT"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4128A30EF9B
	for <keyrings@vger.kernel.org>; Fri, 22 Aug 2025 14:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872550; cv=none; b=Wrw6EnzHZAFW3gQZBOvU4edvANdTGNdG6Vk4lIq4SyztAMSJuSZmuWSirQhIT6cP+Tu1q0wYYNaBq3PgYCiOhClPFlQTnnv6pJQfziLkXPKerhlY2nUHA35Fdfp+S4UjUYYIAlhCYJlVzZQIDCxtwuG9weX3zKEc9Jh+j2LcSkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872550; c=relaxed/simple;
	bh=EwhQfNdwMRYnfyJhiDl/WI6c9SiGSsdsQ4W0UUcmEFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edew6zudHwYysMi0xc8o6udjwfp11L+n63GIWsXWyGFL8u1m504u6VdUrS7tX5xFCCSCYqH9yRdUZgjMAkIYbuWgc2i1cfM+biq6Q2WXF9AOEMRRF9MavvMJWdsbwcVv13KlDGkPngnVYNQMGcphC9ENGHNGXjXMvTzeBXj359o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bUFM46pT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755872548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OjevWaCAD9+4PGKq/fwSEtJ4889VG5wi2+iz89n84dc=;
	b=bUFM46pT0BoQ9UZpaBzi2/+iDm2/wmGikK5acp89C1khavab/Q2yA5pUJNeWzde58cCecP
	3GXaUOat6r46u/PKkO/UWJrlMIBsxdZBJ+R6J1gQ8FLBmCfCR7Ut3tLT1Jd/Y2rCuBtbaz
	y7in1vsbo8WtFrmGZBVy9+N9fSL8eV4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-191-Fnxh-02ROLuLaIZevzUWMg-1; Fri,
 22 Aug 2025 10:22:26 -0400
X-MC-Unique: Fnxh-02ROLuLaIZevzUWMg-1
X-Mimecast-MFC-AGG-ID: Fnxh-02ROLuLaIZevzUWMg_1755872545
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AEB121956088;
	Fri, 22 Aug 2025 14:22:25 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.132])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E283730001A1;
	Fri, 22 Aug 2025 14:22:23 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] request-key: Fix mishandling of last line of config file
Date: Fri, 22 Aug 2025 15:22:09 +0100
Message-ID: <20250822142215.2475014-3-dhowells@redhat.com>
In-Reply-To: <20250822142215.2475014-1-dhowells@redhat.com>
References: <20250822142215.2475014-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Fix mishandling of the config file by /sbin/request-key whereby the last
line of a file, if it is lacking a newline, will trim off the last
character and then try and use that.  Return an error instead if we find a
line without a newline char at the end.

Signed-off-by: David Howells <dhowells@redhat.com>
---
 request-key.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/request-key.c b/request-key.c
index bf47c0a..d1feec3 100644
--- a/request-key.c
+++ b/request-key.c
@@ -367,6 +367,8 @@ static void scan_conf_file(struct parameters *params, int dirfd, const char *con
 		/* ignore blank lines and comments */
 		if (len == 1 || buf[0] == '#' || isspace(buf[0]))
 			continue;
+		if (len == 0 || buf[len - 1] != '\n')
+			line_error("Line missing newline\n");
 
 		buf[--len] = 0;
 		p = buf;


