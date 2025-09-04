Return-Path: <keyrings+bounces-2987-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C589B44146
	for <lists+keyrings@lfdr.de>; Thu,  4 Sep 2025 17:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DD11169F0B
	for <lists+keyrings@lfdr.de>; Thu,  4 Sep 2025 15:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F4E2284696;
	Thu,  4 Sep 2025 15:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mGWof7UB"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B753127AC3E;
	Thu,  4 Sep 2025 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757001356; cv=none; b=IDkIF0ozaVJ6EzsytCgnvfs1nyPzs1rgrUNerLaGDbpme3sB8geKaw27QNiLirCbuk1J9Wi0V1zPWXQaWsaMfHy9S6EBcxOfud+f2b1A3UFYaeBsergXB+qceaEWJ7+cFJF/aaIhwXfSHNh92g672HnQokym6eipGzQ4NWGuyu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757001356; c=relaxed/simple;
	bh=LEEF+tzGiW/O8S/Dp318GpZJprlPN9OhJf6zA6oP0Wk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K6XNM0PEHWF6MmZ/54VgMvl8EbQI8utu8Ujq/TvKGDVeUJRt/zPYWlSpsps2qFkjDvJkbcq1BNQ2SIyHmTZ/t4M8yr/W9e0s+UnETYu4jXyXq8cVsDZpfiqCrERJT6mkXBbU/s2DIXD59gO9KlsoMkm8YUMk4ObSeWpn2k768Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mGWof7UB; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584FjpHd008879;
	Thu, 4 Sep 2025 15:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=b0xBg
	MFvCnQ8oQ4XyquylrWb2Efu8L4wuFiOFRBuc0w=; b=mGWof7UBEXtB7+PWcCFqh
	MG1zo/gjx38mBMVYi5lwF2miLXre44BocgDagtN+8j6Rc8K8HI/7waLrtdL0/Bz7
	r/dpN9WicyaWYKh2aIMoFGOi5tbido+SkGfKv6mjrQxleelAGKuQERBgtSirQRV4
	610wTmig5yMjvUcflxWDNwBjtpTsqEhr4bQZEP45XLVfef2uTgGN+Bnyo4i/2paP
	OHIubgXQBavP8KxdMqbgG61WzM+MUOdV8FQ4PtEBELTE9emUtywSUvOnyFjmZkWj
	vSeURVNMt210m5STOtMQCNbHGsvxlGOT4ou7KNUjyjidmMJvCLUx/Pqmr/rAm8vO
	w==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 48yd1004sg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Sep 2025 15:55:39 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 584FgNUL040151;
	Thu, 4 Sep 2025 15:55:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 48uqrhtm9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Sep 2025 15:55:38 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 584Fsx54000707;
	Thu, 4 Sep 2025 15:55:37 GMT
Received: from localhost.localdomain (dhcp-10-154-122-161.vpn.oracle.com [10.154.122.161])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 48uqrhtkds-10;
	Thu, 04 Sep 2025 15:55:37 +0000
From: Vegard Nossum <vegard.nossum@oracle.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org,
        Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
        Daniel Gomez <da.gomez@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
        "Jason A . Donenfeld" <Jason@zx2c4.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Wang, Jay" <wanjay@amazon.com>, Nicolai Stange <nstange@suse.com>,
        Vladis Dronov <vdronov@redhat.com>,
        Stephan Mueller <smueller@chronox.de>,
        Sami Tolvanen <samitolvanen@google.com>, linux-modules@vger.kernel.org,
        Vegard Nossum <vegard.nossum@oracle.com>,
        David Howells <dhowells@redhat.com>,
        David Woodhouse <dwmw2@infradead.org>, keyrings@vger.kernel.org
Subject: [PATCH RFC 009/104] certs/system_keyring: export restrict_link_by_builtin_*trusted
Date: Thu,  4 Sep 2025 17:50:41 +0200
Message-Id: <20250904155216.460962-10-vegard.nossum@oracle.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904155216.460962-1-vegard.nossum@oracle.com>
References: <20250904155216.460962-1-vegard.nossum@oracle.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2508110000
 definitions=main-2509040156
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA0MDE0OCBTYWx0ZWRfXzH2R/tRc3FKN
 y5EXbMoxYwVXsitxURzXjv0mCJKjsyaKl1U4nEQWo6gMEruSX+dbK3JZ/cOO9XwlJzj1ZKIotzl
 c9RBIavged0XZFze48EBV+gtElnUg6C+HnXAkyeXEww4ENFlb3QQJlO2AjfjMR9k8+piO9L2WiU
 IDQHYaxG4F57mM2IoDGVqBGsI+SqCWTnpiNxiLFjlbXK5pdCxbq3b33yW0yWQ8UsqvIIYWeBs9K
 r4OB2xj1pvr/o4hcQKCOENCbWjpPGWPG1jYeQoSXcmHHxFW9OFoujl9yx6FLuTjCEvXDckl9Y9+
 2rG0iviswvQvr67ZwuyAIub9+SdDdRUlbfvEtDS0353wthVi86XdYfxTLWXO+0U8NEOf+AbStGi
 6q61vckMJD9ykqje7RxTGciNBOE7oA==
X-Authority-Analysis: v=2.4 cv=CbkI5Krl c=1 sm=1 tr=0 ts=68b9b67b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=yJojWOMRYYMA:10 a=20KFwNOVAAAA:8 a=JfrnYn6hAAAA:8 a=VwQbUJbxAAAA:8
 a=yPCof4ZbAAAA:8 a=-90ldKIzPkhNXM-SrBcA:9 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf
 awl=host:12068
X-Proofpoint-ORIG-GUID: ENc0i0RQor8jhI_5tUlXLmDsgpln_c46
X-Proofpoint-GUID: ENc0i0RQor8jhI_5tUlXLmDsgpln_c46

This allows us to call these functions from modules, specifically
the standalone FIPS module (which we're adding support for in this patch
series).

Cc: David Howells <dhowells@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: keyrings@vger.kernel.org
Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
---
 certs/system_keyring.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index 9de610bf1f4b..b9a882b627b4 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -50,6 +50,7 @@ int restrict_link_by_builtin_trusted(struct key *dest_keyring,
 	return restrict_link_by_signature(dest_keyring, type, payload,
 					  builtin_trusted_keys);
 }
+EXPORT_SYMBOL_GPL(restrict_link_by_builtin_trusted);
 
 /**
  * restrict_link_by_digsig_builtin - Restrict digitalSignature key additions by the built-in keyring
@@ -102,6 +103,7 @@ int restrict_link_by_builtin_and_secondary_trusted(
 	return restrict_link_by_signature(dest_keyring, type, payload,
 					  secondary_trusted_keys);
 }
+EXPORT_SYMBOL_GPL(restrict_link_by_builtin_and_secondary_trusted);
 
 /**
  * restrict_link_by_digsig_builtin_and_secondary - Restrict by digitalSignature.
-- 
2.39.3


