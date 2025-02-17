Return-Path: <keyrings+bounces-2404-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9B8A37950
	for <lists+keyrings@lfdr.de>; Mon, 17 Feb 2025 01:56:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA2A5188CEC4
	for <lists+keyrings@lfdr.de>; Mon, 17 Feb 2025 00:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 573AB7483;
	Mon, 17 Feb 2025 00:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="Dt1VZFOr"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-fw-9106.amazon.com (smtp-fw-9106.amazon.com [207.171.188.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF89E8F6B
	for <keyrings@vger.kernel.org>; Mon, 17 Feb 2025 00:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.188.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739753762; cv=none; b=LazVk+/9Kii69+8E2fSWz7SgIU2v3bVF2yO784Lc4DimhpCN4CZThNJW2eaLLkZsS2WCxDGvv+s6Rh1nuJx33CBMxn5Fcso3zEAiXiMeK3S+FTYBN+cPnEg+vI1Z3wopK3A/HPOi4Mou3ZhN9/MGkNJ3iYQKG/ROR6FrgWUGFPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739753762; c=relaxed/simple;
	bh=M76tTXeOco/DTmfQJhlp7IBFxX8hTcbiscKDZRNBJz4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WGL5Hb8S1uZ3dFFd5cUdJn5yKTFhVWDzkvB6ioNJJTIni9fqeUdjv/Y2ItuutUxJl4as/nQhMQHl0irOSNZFxeJna83hUj01GZHO2eydpsGhL6qQGJlQjenWnpXnMgRV65XG7p2QlOCGuxGhhK5fslbsc5ef5LTbi+AVEUVjUp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=Dt1VZFOr; arc=none smtp.client-ip=207.171.188.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1739753761; x=1771289761;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=oH0aRh5X50kbgH43zwPx6QjEUg3SHz7JY0IvkQnPiW4=;
  b=Dt1VZFOrrrb1m2GBzsmRMMOMNhID2cX+fQetQAvvUvNvJPURsoGeM7uY
   vfeBKdB0mSpo1sMTrf6pYURcQsy0qbNor2GhkRS/yp4EaRpVRY4gmsbK3
   +J120ndGJlrUFQjg5dauX1Vqr7ndOsH9XAVenFiCTDOTgM+bfprbUv1xi
   U=;
X-IronPort-AV: E=Sophos;i="6.13,291,1732579200"; 
   d="scan'208";a="799297622"
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.210])
  by smtp-border-fw-9106.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 00:55:55 +0000
Received: from EX19MTAUWA001.ant.amazon.com [10.0.21.151:4566]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.55.73:2525] with esmtp (Farcaster)
 id 7d4ee54c-08fe-4a3e-9dc8-062ceac3c0cd; Mon, 17 Feb 2025 00:55:37 +0000 (UTC)
X-Farcaster-Flow-ID: 7d4ee54c-08fe-4a3e-9dc8-062ceac3c0cd
Received: from EX19D021UWC004.ant.amazon.com (10.13.139.224) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Mon, 17 Feb 2025 00:55:37 +0000
Received: from EX19MTAUWA001.ant.amazon.com (10.250.64.204) by
 EX19D021UWC004.ant.amazon.com (10.13.139.224) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Mon, 17 Feb 2025 00:55:37 +0000
Received: from email-imr-corp-prod-pdx-all-2c-785684ef.us-west-2.amazon.com
 (10.25.36.214) by mail-relay.amazon.com (10.250.64.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.39 via Frontend Transport; Mon, 17 Feb 2025 00:55:37 +0000
Received: from dev-dsk-abuehaze-1c-21d23c85.eu-west-1.amazon.com (dev-dsk-abuehaze-1c-21d23c85.eu-west-1.amazon.com [10.13.244.41])
	by email-imr-corp-prod-pdx-all-2c-785684ef.us-west-2.amazon.com (Postfix) with ESMTP id D8EEFA0484;
	Mon, 17 Feb 2025 00:55:36 +0000 (UTC)
Received: by dev-dsk-abuehaze-1c-21d23c85.eu-west-1.amazon.com (Postfix, from userid 5005603)
	id 6DE837485; Mon, 17 Feb 2025 00:55:36 +0000 (UTC)
From: Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>
To: <dhowells@redhat.com>, <keyrings@vger.kernel.org>
CC: <benh@amazon.com>, <ptyadav@amazon.com>, Hazem Mohamed Abuelfotoh
	<abuehaze@amazon.com>
Subject: [PATCH] Pass "err" argument by address to "_nsError" function
Date: Mon, 17 Feb 2025 00:54:52 +0000
Message-ID: <20250217005452.4873-1-abuehaze@amazon.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Commit 0d71523ab584 (“DNS: Support AFS SRV records and
cell db config files”) has refactored the "nsError" function
by moving some of error handling to "_nsError" function
however we are passing the "err" argument to "_nsError"
by value not by address which is wrong as that basically
waste any processing we do in the "_nsError" function
so correcting that by passing "err" by address.

Reported-by: Pratyush Yadav <ptyadav@amazon.com>
Signed-off-by: Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>
---
 dns.afsdb.c        |  4 ++--
 key.dns.h          |  2 +-
 key.dns_resolver.c | 20 ++++++++++----------
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/dns.afsdb.c b/dns.afsdb.c
index 986c0f3..7bffb60 100644
--- a/dns.afsdb.c
+++ b/dns.afsdb.c
@@ -228,7 +228,7 @@ static int dns_query_AFSDB(const char *cell)
 
 	if (response_len < 0) {
 		/* negative result */
-		_nsError(h_errno, cell);
+		_nsError(&h_errno, cell);
 		return -1;
 	}
 
@@ -267,7 +267,7 @@ static int dns_query_VL_SRV(const char *cell)
 
 	if (response_len < 0) {
 		/* negative result */
-		_nsError(h_errno, cell);
+		_nsError(&h_errno, cell);
 		return -1;
 	}
 
diff --git a/key.dns.h b/key.dns.h
index 33d0ab3..2fedbc3 100644
--- a/key.dns.h
+++ b/key.dns.h
@@ -59,7 +59,7 @@ extern __attribute__((format(printf, 1, 2)))
 void info(const char *fmt, ...);
 extern __attribute__((noreturn))
 void nsError(int err, const char *domain);
-extern void _nsError(int err, const char *domain);
+extern void _nsError(int *err, const char *domain);
 extern __attribute__((format(printf, 1, 2)))
 void debug(const char *fmt, ...);
 
diff --git a/key.dns_resolver.c b/key.dns_resolver.c
index 7a7ec42..6b16427 100644
--- a/key.dns_resolver.c
+++ b/key.dns_resolver.c
@@ -157,19 +157,20 @@ static const int ns_errno_map[] = {
 	[NO_DATA]		= ENODATA,
 };
 
-void _nsError(int err, const char *domain)
+void _nsError(int *err, const char *domain)
 {
 	if (isatty(2))
-		fprintf(stderr, "NS:%s: %s.\n", domain, hstrerror(err));
+		fprintf(stderr, "NS:%s: %s.\n", domain, hstrerror(*err));
 	else
-		syslog(LOG_INFO, "%s: %s", domain, hstrerror(err));
+		syslog(LOG_INFO, "%s: %s", domain, hstrerror(*err));
 
-	if (err >= sizeof(ns_errno_map) / sizeof(ns_errno_map[0]))
-		err = ECONNREFUSED;
-	else
-		err = ns_errno_map[err];
+	if (*err >= sizeof(ns_errno_map) / sizeof(ns_errno_map[0]))
+		*err = ECONNREFUSED;
+	else{
+		*err = ns_errno_map[*err];
+	}
 
-	info("Reject the key with error %d", err);
+	info("Reject the key with error %d", *err);
 }
 
 void nsError(int err, const char *domain)
@@ -177,8 +178,7 @@ void nsError(int err, const char *domain)
 	unsigned timeout;
 	int ret;
 
-	_nsError(err, domain);
-
+	_nsError(&err, domain);
 	switch (err) {
 	case TRY_AGAIN:
 		timeout = 1;
-- 
2.47.1


