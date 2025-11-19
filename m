Return-Path: <keyrings+bounces-3383-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFD8C6E305
	for <lists+keyrings@lfdr.de>; Wed, 19 Nov 2025 12:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B0B3B352097
	for <lists+keyrings@lfdr.de>; Wed, 19 Nov 2025 11:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF25199252;
	Wed, 19 Nov 2025 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TvlG84Ez"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA98F2DA758
	for <keyrings@vger.kernel.org>; Wed, 19 Nov 2025 11:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550676; cv=none; b=fC+ia4da6V0JZ3S8uKlxUeGCI+jMy/qTLK6Q6F0/a5DVOBZ79+X10FYwFF1LuB8X2ixg93fCp5BN+2C6ntOwXaO8kz3uHwzC0fL9KGiU5uKZc1vTBM5WnANgGGT5t42sjU4NtNaX6LkkNnBgZXg8DvxV1/ABSt8pcm/8QTPiUCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550676; c=relaxed/simple;
	bh=/UCCUc/SLJzFtu93dCW43tqk5LK6wtqq0pR+5zBPivg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pJRjdZnWClZp6VsmcflC4/6KFwRveNN2bwayx2XMqsQ8L+/3fi+8aZwbZVIAxvdZcJoYrji6XSiAhynLmec2lqp5psGI9QEO9IQyxwR3xSkjYNqdEenTfsd9kxs2m3i+2Xa0ecFuoFRuCs1eMfp3q4BXV5hfrclJZwKHI0TlXkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TvlG84Ez; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ97FtA020218;
	Wed, 19 Nov 2025 11:11:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=Xeq3owNreOqjUg2Hl30yn/Ur6xml
	+EWyChxcSiqfww4=; b=TvlG84EzwcLnB6MbAud5KrVTVLuGpZvrpno7GMsFQqfu
	0Eu+5nXjS8b+9hdltA1O8zYJPr8BxUBLvlNyHS2/qu9oVU9lG9k2oOVpxO2C21yS
	RQgqGhF/lpzvJ2aXp3Ly+wQkBISmvHgflSO96ppyd4FNNDfZkPl2qKPinQuvZFCh
	k3GRCUzrLzHtiB3YgDX8PNDY9il/Y5vGYaOKY8lk8AxCgW5Jd6wrUpjtj9W4CEyp
	kn6sXJoNZ0/VlXiJbcFNTKiGGQ9RZmQDK9wQkU+X5iPCJHk9D7SrrLL2RM9phefK
	3Rkxv0HLljE9PzFFhE2q/QR9fkwk3QiM6k/xw2+vtQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk9yywh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 11:11:02 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJAwIoG030795;
	Wed, 19 Nov 2025 11:11:01 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af47y0b5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 11:11:00 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJBAuKZ33948140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 11:10:56 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC0172004D;
	Wed, 19 Nov 2025 11:10:56 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB67C20040;
	Wed, 19 Nov 2025 11:10:54 +0000 (GMT)
Received: from shivang.com (unknown [9.39.20.163])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 11:10:54 +0000 (GMT)
From: Shivang Upadhyay <shivangu@linux.ibm.com>
To: keyrings@vger.kernel.org
Cc: shivangu@linux.ibm.com, sourabhjain@linux.ibm.com, dhowells@redhat.com,
        dwmw2@infradead.org
Subject: [PATCH] certs: buffer OpenSSL log output to avoid flooding compile log
Date: Wed, 19 Nov 2025 16:40:51 +0530
Message-ID: <20251119111052.26718-1-shivangu@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kYbAvT65KIGxOcWgOlHFE_yYmVjtYQ-4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX/X329HCkPTjx
 mhTh3a6Nok6pwEJBl5bzfqLGSIpEngqJtVecH7mo7qI9O6UY/pgekbt0x6vsDzLa94cXM7lPZ6M
 M4Rh8c6A3yiHPJE2QbxxavnETC9z0Acw/HLBmPS7S7o9J9O5B3LUqYPpbIRCKRPep73WBr0oHVY
 fD8uUR1aQ2nJp9LeVK8nJ9PoB9KAzBWtfyUcn2l391WmDDiBmeplqGNHWGl10usbo/sqg3VnHTw
 Ejs2WX8abWOv7O1iMx8p7UYAxDMGl2jP5yBBSdHT0rO+9doI1SvKAVIRuc1YekkdQ02oQRnUBJ0
 N30Vfevz89/+a0Lh3KgWed+CDDtgKRPiXHl97EvHBAo0LNXOWROevRl7u+xu3Aktcb3z0xP7kSz
 FxJ3/H5Iy0vGtTnhSH9/9BXEMHQ9Kg==
X-Proofpoint-ORIG-GUID: kYbAvT65KIGxOcWgOlHFE_yYmVjtYQ-4
X-Authority-Analysis: v=2.4 cv=XtL3+FF9 c=1 sm=1 tr=0 ts=691da5c6 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=Vbee3HPpaZGeHkrlMr0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032

When running `openssl genkey` in multithreaded builds, its output can
interleave with other compiler messages, making the build log messy and
difficult to read.

=== example log ===
	  GENKEY  certs/signing_key.pem
	..+....+..+....+.....+......++++++++++
		<snip/>
	......+...+  CC [M]  sound/core/sound.o
	..+++++

This patch redirects OpenSSL’s output into a temporary file. So the
output is grouped and clearly separated from other build messages.

Signed-off-by: Shivang Upadhyay <shivangu@linux.ibm.com>
---
 certs/Makefile | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/certs/Makefile b/certs/Makefile
index f6fa4d8d75e0..f57272b77b36 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -47,7 +47,15 @@ keytype-$(CONFIG_MODULE_SIG_KEY_TYPE_ECDSA) := -newkey ec -pkeyopt ec_paramgen_c
 quiet_cmd_gen_key = GENKEY  $@
       cmd_gen_key = openssl req -new -nodes -utf8 -$(CONFIG_MODULE_SIG_HASH) -days 36500 \
 		-batch -x509 -config $< \
-		-outform PEM -out $@ -keyout $@ $(keytype-y) 2>&1
+		-outform PEM -out $@ -keyout $@ $(keytype-y) 2>&1 |
+		( \
+			openssl_log=$$(mktemp); \
+			cat > $$openssl_log; \
+			printf "    [openssl output]: "; \
+			tr -d '\n' < $$openssl_log; \
+			echo ""; \
+			rm -f $$openssl_log; \
+		)
 
 $(obj)/signing_key.pem: $(obj)/x509.genkey FORCE
 	$(call if_changed,gen_key)
-- 
2.51.0


