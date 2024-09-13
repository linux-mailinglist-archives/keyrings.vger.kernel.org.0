Return-Path: <keyrings+bounces-2046-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F5F97828F
	for <lists+keyrings@lfdr.de>; Fri, 13 Sep 2024 16:31:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B7FD1C224F6
	for <lists+keyrings@lfdr.de>; Fri, 13 Sep 2024 14:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5376C11C83;
	Fri, 13 Sep 2024 14:31:14 +0000 (UTC)
X-Original-To: keyrings@vger.kernel.org
Received: from mx01.omp.ru (mx01.omp.ru [90.154.21.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DA4C8C0;
	Fri, 13 Sep 2024 14:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.154.21.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726237874; cv=none; b=VvTC+v4dA/ejqm4Oqpd15XND52iJJlHoqLmodQyKdaPF2GV4rqKoOp7x07IugfDLFg/Klpyqg37zaS9WXF6rhjLS5IUX6q8pzR890c3timdYLejHZIQ+Rwu/1w1AzNFkdJogoTQKHDMWhrGfR++wLpF5YhZD0yjisX9uJl4vMGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726237874; c=relaxed/simple;
	bh=vn/VM5mbqa3ILpM2QKIWip9xSaN4yeJC8BD5e4XcUvg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VskqgE3Lvvkcy9WQ5t2TpUa2ZYKMVeYP9siazvOBz7JLcfv5ne0ch2XJxCzA//a0TbBpwHyDakmtIgIbnwIQzeEn7DWjHIlW7JLFr5/ldle2Y94zppKYZVd9Ivj2GigSY62eRFfHwQVHPFP0RaFNMzqQYwK2LrbE6botmvDBWFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru; spf=pass smtp.mailfrom=omp.ru; arc=none smtp.client-ip=90.154.21.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omp.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omp.ru
Received: from localhost.localdomain (178.205.55.120) by msexch01.omp.ru
 (10.188.4.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Fri, 13 Sep
 2024 17:30:47 +0300
From: Roman Smirnov <r.smirnov@omp.ru>
To: David Howells <dhowells@redhat.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>,
	Jarkko Sakkinen <jarkko@kernel.org>, Andrew Zaborowski
	<andrew.zaborowski@intel.com>
CC: Roman Smirnov <r.smirnov@omp.ru>, <keyrings@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<lvc-project@linuxtesting.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Karina
 Yankevich <k.yankevich@omp.ru>, Sergey Yudin <s.yudin@omp.ru>
Subject: [PATCH v3] KEYS: prevent NULL pointer dereference in find_asymmetric_key()
Date: Fri, 13 Sep 2024 17:30:09 +0300
Message-ID: <20240913143010.117883-1-r.smirnov@omp.ru>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: msexch01.omp.ru (10.188.4.12) To msexch01.omp.ru
 (10.188.4.12)
X-KSE-ServerInfo: msexch01.omp.ru, 9
X-KSE-AntiSpam-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 6.1.1, Database issued on: 09/13/2024 14:17:55
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 59
X-KSE-AntiSpam-Info: Lua profiles 187737 [Sep 13 2024]
X-KSE-AntiSpam-Info: Version: 6.1.1.5
X-KSE-AntiSpam-Info: Envelope from: r.smirnov@omp.ru
X-KSE-AntiSpam-Info: LuaCore: 34 0.3.34
 8a1fac695d5606478feba790382a59668a4f0039
X-KSE-AntiSpam-Info: {rep_avail}
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: {relay has no DNS name}
X-KSE-AntiSpam-Info: {SMTP from is not routable}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.205.55.120 in (user)
 b.barracudacentral.org}
X-KSE-AntiSpam-Info: {Found in DNSBL: 178.205.55.120 in (user)
 dbl.spamhaus.org}
X-KSE-AntiSpam-Info:
	d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;omp.ru:7.1.1
X-KSE-AntiSpam-Info: FromAlignment: s
X-KSE-AntiSpam-Info: ApMailHostAddress: 178.205.55.120
X-KSE-AntiSpam-Info: {DNS response errors}
X-KSE-AntiSpam-Info: Rate: 59
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dmarc=temperror header.from=omp.ru;spf=temperror
 smtp.mailfrom=omp.ru;dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/13/2024 14:22:00
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: Clean, bases: 9/13/2024 12:44:00 PM
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: InTheLimit

In find_asymmetric_key(), if all NULLs are passed in the id_{0,1,2}
arguments, the kernel will first emit WARN but then have an oops
because id_2 gets dereferenced anyway.

Add the missing id_2 check and move WARN_ON() to the final else branch
to avoid duplicate NULL checks.

Found by Linux Verification Center (linuxtesting.org) with Svace static
analysis tool.

Fixes: 7d30198ee24f ("keys: X.509 public key issuer lookup without AKID")
Suggested-by: Sergey Shtylyov <s.shtylyov@omp.ru>
Signed-off-by: Roman Smirnov <r.smirnov@omp.ru>
Reviewed-by: Sergey Shtylyov <s.shtylyov@omp.ru>
---
 V1 -> V2: updated patch description, returned WARN_ON() macro
 V2 -> V3: updated patch description
 crypto/asymmetric_keys/asymmetric_type.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/crypto/asymmetric_keys/asymmetric_type.c b/crypto/asymmetric_keys/asymmetric_type.c
index a5da8ccd353e..43af5fa510c0 100644
--- a/crypto/asymmetric_keys/asymmetric_type.c
+++ b/crypto/asymmetric_keys/asymmetric_type.c
@@ -60,17 +60,18 @@ struct key *find_asymmetric_key(struct key *keyring,
 	char *req, *p;
 	int len;
 
-	WARN_ON(!id_0 && !id_1 && !id_2);
-
 	if (id_0) {
 		lookup = id_0->data;
 		len = id_0->len;
 	} else if (id_1) {
 		lookup = id_1->data;
 		len = id_1->len;
-	} else {
+	} else if (id_2) {
 		lookup = id_2->data;
 		len = id_2->len;
+	} else {
+		WARN_ON(1);
+		return ERR_PTR(-EINVAL);
 	}
 
 	/* Construct an identifier "id:<keyid>". */
-- 
2.43.0


