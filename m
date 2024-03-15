Return-Path: <keyrings+bounces-890-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A6A8F87D453
	for <lists+keyrings@lfdr.de>; Fri, 15 Mar 2024 20:06:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D75D61C22632
	for <lists+keyrings@lfdr.de>; Fri, 15 Mar 2024 19:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41B673EA77;
	Fri, 15 Mar 2024 19:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="a9t79nW0"
X-Original-To: keyrings@vger.kernel.org
Received: from smtp-fw-52005.amazon.com (smtp-fw-52005.amazon.com [52.119.213.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28A81094E;
	Fri, 15 Mar 2024 19:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710529567; cv=none; b=Cp1CMS1SApIVc1iBVFWS8ypKP1MJxmdTsBmxYaD01AwzrogBhFwhVBRDT864La2yIZ2X0S7Iwvj17SxZ5H3hHRlBCuf/XvkRKRKr12ukLS7UDMvGR3tj6ABbXU/srX1tU/19GvMg1akLHhparR7f9/+aEbNs0lIR3I8fubqmzjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710529567; c=relaxed/simple;
	bh=0VDT7J1/QepqMv/XEEEQKBYRyntYzyaDYOHYDe1pIFI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=E+jAaWWhB6YhYP8fk753zyrqEY1Z+1jsWN149buo3Y1mhXNUYFQ6ed9paMZCUz1nZ7fjhZlcIFknTwXmfuUG1HS0Lf+80elq9h4MOAu3jdXisoua9dpF2GZVCRrA6jU7aTwJImbAwc1bZY6Zz8/si6Is1hs99qlzSQ+DCLl6+/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.com; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=a9t79nW0; arc=none smtp.client-ip=52.119.213.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1710529564; x=1742065564;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Gf2DovfvmQwhkL/kXF4YVIB/ReTx6e9MuV1WrxiXpuM=;
  b=a9t79nW0PEUVX6XbdpV58X+HgY5x4VcjAExZf8J41Tsx6y+3MrF2oxmL
   +uYoCTmw+4bM2BCD9xX4rr6W1oHpx/EIiFvb5ojeaAiWTySL3fr0VX9gH
   9BOmpJ8eyIho6QNd5N5nUhgAzBD84E2zBMhBGcQAN8JGuhkq9fIFHEdqR
   M=;
X-IronPort-AV: E=Sophos;i="6.07,129,1708387200"; 
   d="scan'208";a="641212513"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52005.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 19:06:03 +0000
Received: from EX19MTAUWC002.ant.amazon.com [10.0.21.151:36126]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.8.10:2525] with esmtp (Farcaster)
 id a747de0e-b23b-4bc8-acf8-48d0b814be82; Fri, 15 Mar 2024 19:06:02 +0000 (UTC)
X-Farcaster-Flow-ID: a747de0e-b23b-4bc8-acf8-48d0b814be82
Received: from EX19D011UWC004.ant.amazon.com (10.13.138.174) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 15 Mar 2024 19:06:01 +0000
Received: from SEA-1800900140.ant.amazon.com (10.106.178.23) by
 EX19D011UWC004.ant.amazon.com (10.13.138.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.28;
 Fri, 15 Mar 2024 19:06:00 +0000
From: Silvio Gissi <sifonsec@amazon.com>
To:
CC: Silvio Gissi <sifonsec@amazon.com>, David Howells <dhowells@redhat.com>,
	Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>,
	<linux-afs@lists.infradead.org>, <linux-cifs@vger.kernel.org>,
	<keyrings@vger.kernel.org>, <netdev@vger.kernel.org>,
	<stable@vger.kernel.org>
Subject: [PATCH] keys: Fix overwrite of key expiration on instantiation
Date: Fri, 15 Mar 2024 15:05:39 -0400
Message-ID: <20240315190539.1976-1-sifonsec@amazon.com>
X-Mailer: git-send-email 2.40.1.windows.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D045UWA002.ant.amazon.com (10.13.139.12) To
 EX19D011UWC004.ant.amazon.com (10.13.138.174)

The expiry time of a key is unconditionally overwritten during
instantiation, defaulting to turn it permanent. This causes a problem
for DNS resolution as the expiration set by user-space is overwritten to
TIME64_MAX, disabling further DNS updates. Fix this by restoring the
condition that key_set_expiry is only called when the pre-parser sets a
specific expiry.

Fixes: 39299bdd2546 ("keys, dns: Allow key types (eg. DNS) to be reclaimed immediately on expiry")
Signed-off-by: Silvio Gissi <sifonsec@amazon.com>
cc: David Howells <dhowells@redhat.com>
cc: Hazem Mohamed Abuelfotoh <abuehaze@amazon.com>
cc: linux-afs@lists.infradead.org
cc: linux-cifs@vger.kernel.org
cc: keyrings@vger.kernel.org
cc: netdev@vger.kernel.org
cc: stable@vger.kernel.org
---
 security/keys/key.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/security/keys/key.c b/security/keys/key.c
index 560790038329..0aa5f01d16ff 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -463,7 +463,8 @@ static int __key_instantiate_and_link(struct key *key,
 			if (authkey)
 				key_invalidate(authkey);
 
-			key_set_expiry(key, prep->expiry);
+			if (prep->expiry != TIME64_MAX)
+				key_set_expiry(key, prep->expiry);
 		}
 	}
 
-- 
2.34.1


