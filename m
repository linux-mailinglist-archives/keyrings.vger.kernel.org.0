Return-Path: <keyrings+bounces-2970-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1C0B31BB7
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 16:34:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B50C96432F1
	for <lists+keyrings@lfdr.de>; Fri, 22 Aug 2025 14:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7938A30E0F2;
	Fri, 22 Aug 2025 14:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HzrQDuXa"
X-Original-To: keyrings@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7805308F0A
	for <keyrings@vger.kernel.org>; Fri, 22 Aug 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755872547; cv=none; b=BvH2QMbDyAQdP4T3OlTrheTmZ2phF32kkboNMBVAkKsu+BryFFLxvgtfoee+WELUc7qapnyaAGp2q8I6A+/WY5AQMbRNGs5xw9bMVoy+w/w+kMg5ES24Me8MUQ9JcDF1fUdfBNE7sG7p9QY8fTtGBW814zyk8SxhqMRH4xwyvwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755872547; c=relaxed/simple;
	bh=ya+/2lywL7BGnBwGQ3T3zHs8dEkBfIpHOA+EH0QGW14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IXGm18qbSu40PyWnALatn5kRP8SlF03ek+ysh3od9eO9l4neqlChfA3R7UNYep0+KZShrkQyHx6OZvTldjQu30QBe5uV9zTpeyL6Ml7nwel2Ug0I8CfEizYF+i68Fm9pNuoBzh6g+igIT2RpoIRXqaRBUXgVIAzd2FlV211PfWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HzrQDuXa; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755872544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7vplKdO7OueluSFmo2pcySTxoa/ZLQ49kKhsm4ft+S8=;
	b=HzrQDuXaWuAe/h2lhztu+WOTtAmyUtodbed5a0oCWobbHyK8zNaB4vpF+V0K+Arkc/WBF0
	MAZ3Y91j+E+uin++VP1+7WVpA83G7kS5Yvnzyv2gP4+wJzsl2aO/0L23Cx0uRpkL6KcA4a
	0okclXgcH/uPI93zQxuiX23ZqMLtjHQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-25iV1S9KPaidp76cQknsiA-1; Fri,
 22 Aug 2025 10:22:23 -0400
X-MC-Unique: 25iV1S9KPaidp76cQknsiA-1
X-Mimecast-MFC-AGG-ID: 25iV1S9KPaidp76cQknsiA_1755872542
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 764CD1800366;
	Fri, 22 Aug 2025 14:22:22 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.132])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 392F61800447;
	Fri, 22 Aug 2025 14:22:21 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: David Howells <dhowells@redhat.com>,
	keyrings@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] lib: Fix a couple of potential signed oveflows
Date: Fri, 22 Aug 2025 15:22:08 +0100
Message-ID: <20250822142215.2475014-2-dhowells@redhat.com>
In-Reply-To: <20250822142215.2475014-1-dhowells@redhat.com>
References: <20250822142215.2475014-1-dhowells@redhat.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Fix keyctl_read_alloc() to check for a potential unsigned overflow when we
allocate a buffer with an extra byte added on the end for a NUL.

Fix keyctl_dh_compute_alloc() for the same thing.

Signed-off-by: David Howells <dhowells@redhat.com>
---
 keyutils.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/keyutils.c b/keyutils.c
index 37b6cc3..fd02cda 100644
--- a/keyutils.c
+++ b/keyutils.c
@@ -18,6 +18,7 @@
 #include <dlfcn.h>
 #include <sys/uio.h>
 #include <errno.h>
+#include <limits.h>
 #include <asm/unistd.h>
 #include "keyutils.h"
 
@@ -442,6 +443,8 @@ int keyctl_read_alloc(key_serial_t id, void **_buffer)
 		return -1;
 
 	for (;;) {
+		if (ret == LONG_MAX)
+			return -EFBIG; /* Don't let buflen+1 overflow. */
 		buflen = ret;
 		buf = malloc(buflen + 1);
 		if (!buf)
@@ -515,6 +518,8 @@ int keyctl_dh_compute_alloc(key_serial_t priv, key_serial_t prime,
 	if (ret < 0)
 		return -1;
 
+	if (ret == LONG_MAX)
+		return -EFBIG; /* Don't let buflen+1 overflow. */
 	buflen = ret;
 	buf = malloc(buflen + 1);
 	if (!buf)


