Return-Path: <keyrings+bounces-2409-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09348A39D96
	for <lists+keyrings@lfdr.de>; Tue, 18 Feb 2025 14:35:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52D2A17027E
	for <lists+keyrings@lfdr.de>; Tue, 18 Feb 2025 13:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 750F0269AF9;
	Tue, 18 Feb 2025 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="dTyEZcpz"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E074426AA9D
	for <keyrings@vger.kernel.org>; Tue, 18 Feb 2025 13:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.171.184.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739885262; cv=none; b=f2wDmFarwkt3/Jhq2jlmTpsVhsegqxPasKX3Vi+dRBYX5Ssw6vYJUsa7hcvoi+vr2xVwVvVMBisxMm+tLRrlAV0lAbslIWomyvDjJygDCBaZCOS7+FgjqH1sO4o3pQ7GMexWFyvfNjPu10FM6Ar3HGOKNQHLtz2bxxTHcaq0+tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739885262; c=relaxed/simple;
	bh=uihzEH9P64f6uGalP8j8Bz+2Yo13xUzfAE+OdKL+b2k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rzAtUCRH5PqDF+Bm+rWFdGJXAUFfaE6fv5sZqscozkYAmI/mE7ejqjhXrvuqsUQqCfE/pFEgJSoAvLFxgE2k0SmSTKKuScG+Kx3bdx5nC65Io5wNocFZ5IKjYyT+dXs9jiXVfgNWFfbNJLt1/a3EKCCBPVjclQdBzOy9JES2xhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=dTyEZcpz; arc=none smtp.client-ip=207.171.184.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1739885261; x=1771421261;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ucs7cQ3GSs1gdQ6YzdEwZh/dcEHb01O6u+UnjsZ8Kwg=;
  b=dTyEZcpzTPVleVzCOqizqj93sXpcbKpzAV+sL7dwrGBDI7sSdM0X5w6j
   svo8RUu7eyEAX1wABBw92lBq++BiD+WCAnfphVPQA6DbeIVKDNHdF/YM4
   zWVLA6syERXDYnxOG3Rcf0plY2zXg70nXfvUFAOPUIMuQIE5b+EMIW+Ge
   k=;
X-IronPort-AV: E=Sophos;i="6.13,296,1732579200"; 
   d="scan'208";a="494876204"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2025 13:27:35 +0000
Received: from EX19MTAUWB002.ant.amazon.com [10.0.21.151:17239]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.21.53:2525] with esmtp (Farcaster)
 id c3907a39-824e-490b-9e99-7dd8979c7e91; Tue, 18 Feb 2025 13:27:35 +0000 (UTC)
X-Farcaster-Flow-ID: c3907a39-824e-490b-9e99-7dd8979c7e91
Received: from EX19D021UWA001.ant.amazon.com (10.13.139.24) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.39;
 Tue, 18 Feb 2025 13:27:34 +0000
Received: from EX19MTAUWB002.ant.amazon.com (10.250.64.231) by
 EX19D021UWA001.ant.amazon.com (10.13.139.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Tue, 18 Feb 2025 13:27:33 +0000
Received: from email-imr-corp-prod-pdx-all-2c-475d797d.us-west-2.amazon.com
 (10.25.36.214) by mail-relay.amazon.com (10.250.64.228) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.39 via Frontend Transport; Tue, 18 Feb 2025 13:27:33 +0000
Received: from dev-dsk-abuehaze-1c-21d23c85.eu-west-1.amazon.com (dev-dsk-abuehaze-1c-21d23c85.eu-west-1.amazon.com [10.13.244.41])
	by email-imr-corp-prod-pdx-all-2c-475d797d.us-west-2.amazon.com (Postfix) with ESMTP id B2E12A0104;
	Tue, 18 Feb 2025 13:27:33 +0000 (UTC)
Received: by dev-dsk-abuehaze-1c-21d23c85.eu-west-1.amazon.com (Postfix, from userid 5005603)
	id 4A6297449; Tue, 18 Feb 2025 13:27:33 +0000 (UTC)
From: Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>
To: <dhowells@redhat.com>, <keyrings@vger.kernel.org>
CC: <benh@amazon.com>, Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	Pratyush Yadav <ptyadav@amazon.com>
Subject: [PATCH v2 1/1] Pass "err" argument by address to "_nsError" function
Date: Tue, 18 Feb 2025 13:27:11 +0000
Message-ID: <20250218132711.34346-1-abuehaze@amazon.com>
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
Changes v1 -> v2:
 - Modify switch conditions to set timeouts correctly based on converted error codes

 dns.afsdb.c        |  4 ++--
 key.dns.h          |  2 +-
 key.dns_resolver.c | 25 ++++++++++++-------------
 3 files changed, 15 insertions(+), 16 deletions(-)

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
index 7a7ec42..0fe77b5 100644
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
@@ -177,14 +178,12 @@ void nsError(int err, const char *domain)
 	unsigned timeout;
 	int ret;
 
-	_nsError(err, domain);
-
+	_nsError(&err, domain);
 	switch (err) {
-	case TRY_AGAIN:
+	case EAGAIN:
 		timeout = 1;
 		break;
-	case 0:
-	case NO_RECOVERY:
+	case ECONNREFUSED:
 		timeout = 10;
 		break;
 	default:
-- 
2.47.1


