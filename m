Return-Path: <keyrings+bounces-1838-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFA2942854
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2024 09:45:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF413B23302
	for <lists+keyrings@lfdr.de>; Wed, 31 Jul 2024 07:45:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24EF91A7F98;
	Wed, 31 Jul 2024 07:45:18 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA89B495E5;
	Wed, 31 Jul 2024 07:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722411918; cv=none; b=FtRBaBlblcCec13TjcOd9KqZLJTg3wchbSMlnuLFc1MFhAXyDkgC4YjAMMvlsC6fyLm+tB2FLtd0gAzY+JPfSsivneP6xXo4sw/CLEZ2jS8cW8pmpqq8guhh+D2XsceoM3D07Iybxih5XU0mfBqeqkeLrKpxwm8LKIrvmk3f5oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722411918; c=relaxed/simple;
	bh=dGl1QgNR0YqRGpc2yw3HXx44gw7irQiCeHNf0BHpii0=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QHeG+RI5MifItmkMhi2ncrYUTwuDFkdEyy1lwX6VZ4fpH9FI82OkQulDDUJ4/DhDeDjOyXNgKZwsxxyK28xmo0L0awsLw87jS4FsXIfqtlaVsJ2q7glBRWe8HFtvhoOcIC5La3q4TrLj6JjQOJMDqA7z6na0N9m8gQsQTw+TRYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WYkcs6k7dzndHv;
	Wed, 31 Jul 2024 15:44:13 +0800 (CST)
Received: from dggpemf500002.china.huawei.com (unknown [7.185.36.57])
	by mail.maildlp.com (Postfix) with ESMTPS id 35012180104;
	Wed, 31 Jul 2024 15:45:13 +0800 (CST)
Received: from huawei.com (10.175.101.6) by dggpemf500002.china.huawei.com
 (7.185.36.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 31 Jul
 2024 15:45:12 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <dhowells@redhat.com>, <jarkko@kernel.org>, <yuehaibing@huawei.com>,
	<hare@suse.de>
CC: <keyrings@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH resend -next] KEYS: Remove unused declarations
Date: Wed, 31 Jul 2024 15:43:13 +0800
Message-ID: <20240731074313.1349741-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemf500002.china.huawei.com (7.185.36.57)

These declarations are never implemented, remove it.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 include/keys/dns_resolver-type.h | 4 ----
 include/linux/key.h              | 3 ---
 2 files changed, 7 deletions(-)

diff --git a/include/keys/dns_resolver-type.h b/include/keys/dns_resolver-type.h
index 218ca22fb056..1b89088a2837 100644
--- a/include/keys/dns_resolver-type.h
+++ b/include/keys/dns_resolver-type.h
@@ -12,8 +12,4 @@
 
 extern struct key_type key_type_dns_resolver;
 
-extern int request_dns_resolver_key(const char *description,
-				    const char *callout_info,
-				    char **data);
-
 #endif /* _KEYS_DNS_RESOLVER_TYPE_H */
diff --git a/include/linux/key.h b/include/linux/key.h
index 943a432da3ae..074dca3222b9 100644
--- a/include/linux/key.h
+++ b/include/linux/key.h
@@ -436,9 +436,6 @@ extern key_ref_t keyring_search(key_ref_t keyring,
 				const char *description,
 				bool recurse);
 
-extern int keyring_add_key(struct key *keyring,
-			   struct key *key);
-
 extern int keyring_restrict(key_ref_t keyring, const char *type,
 			    const char *restriction);
 
-- 
2.34.1


