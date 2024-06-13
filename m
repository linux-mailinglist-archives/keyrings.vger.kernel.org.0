Return-Path: <keyrings+bounces-1615-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 145C1907E44
	for <lists+keyrings@lfdr.de>; Thu, 13 Jun 2024 23:38:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85B01B260BC
	for <lists+keyrings@lfdr.de>; Thu, 13 Jun 2024 21:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C54A143743;
	Thu, 13 Jun 2024 21:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="JoZvBjA2"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA210143868;
	Thu, 13 Jun 2024 21:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718314716; cv=none; b=USDQaXb5Xay/i1ASofX4uKuA20ZYcnd+ISjqDaZmezXiOwPudpRkPy8UZM96ZTSbhGg2wOudhSGCSQosoTWgE5yViJ8ykPvw9W0PYZrqVeazcl8meSHNHsw7/qovS3X1wJ7SsMgv7Vq+fUtOGSpnLA2Q7u6ZLAKO5uUsIxZ3ij0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718314716; c=relaxed/simple;
	bh=KU+Xae0sCdy5dDGu7hPb6YuLV1+s82d6WqA7AyKo9fw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jq6RidlHDNZLd3wfkUU7J0OpqpM73n8Z/iHHFWK6L43h5WX7If6zXlXTeSMODkIgAIs60iQfPnPEll4w93LFQd8zoyQ/V1afoJivvEB2oTLAFyMnQ+xOTuh4DtFzBluzNKd3nY+st1ko/IgWNrCav840O9UvL+s25eeIvoDjSLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=JoZvBjA2; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45DLQrci015607;
	Thu, 13 Jun 2024 21:38:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:content-transfer-encoding
	:mime-version; s=pp1; bh=JIQefO2Y629EhI//dNmGRknLby3XjVSZEG49EIW
	exvo=; b=JoZvBjA2OytBTtfitsYFtIkwLAittKu6wxUSsyuMOUz/FdKHVD9CS+I
	qSt5RMQ3PfZbk7VAzj4XMst1MO+gkcxbA49H+OAvzKVoTbhkkxT1SnGm5dUilwWS
	K0rI4T3BfhY02NnHBUvmR57+XvSJ/f5eP80P9/inBxYqmIyPpqogMUJpE5pD8MRn
	mNxg8UP2jlw23ynzNUBPXzHFOnJueDJp8FtWrtNopHwHDRgDOyOpLZxSDOh2M6Ot
	EdztNG46SexTKXI38Qpno3cYBhSJfrqOgkpKbKw+e6SV6t1rTaNnb9nPmWSXM6cp
	lGYMVKotGLOSwamDUxHAVutNZ6UZW9Q==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yr896g33f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 21:38:26 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45DKPUoS028690;
	Thu, 13 Jun 2024 21:38:25 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yn1muv16y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Jun 2024 21:38:25 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45DLcMDO35717592
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Jun 2024 21:38:25 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDCD35805D;
	Thu, 13 Jun 2024 21:38:22 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65CD358055;
	Thu, 13 Jun 2024 21:38:22 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 13 Jun 2024 21:38:22 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, jarkko@kernel.org,
        Stefan Berger <stefanb@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Subject: [PATCH] crypto: ecc - Fix off-by-one missing to clear most significant digit
Date: Thu, 13 Jun 2024 17:38:20 -0400
Message-ID: <20240613213820.995832-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1-AyOHSzyoWrGvIBVSbWjBe9kIa_aCXp
X-Proofpoint-GUID: 1-AyOHSzyoWrGvIBVSbWjBe9kIa_aCXp
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-13_13,2024-06-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 mlxlogscore=910 mlxscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406130154

Fix an off-by-one error where the most significant digit was not
initialized leading to signature verification failures by the testmgr.

Example: If a curve requires ndigits (=9) and diff (=2) indicates that
2 digits need to be set to zero then start with digit 'ndigits - diff' (=7)
and clear 'diff' digits starting from there, so 7 and 8.

Reported-by: Venkat Rao Bagalkote <venkat88@linux.vnet.ibm.com>
Closes: https://lore.kernel.org/linux-crypto/619bc2de-b18a-4939-a652-9ca886bf6349@linux.ibm.com/T/#m045d8812409ce233c17fcdb8b88b6629c671f9f4
Fixes: 2fd2a82ccbfc ("crypto: ecdsa - Use ecc_digits_from_bytes to create hash digits array")
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 crypto/ecc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/ecc.c b/crypto/ecc.c
index fe761256e335..dd48d9928a21 100644
--- a/crypto/ecc.c
+++ b/crypto/ecc.c
@@ -78,7 +78,7 @@ void ecc_digits_from_bytes(const u8 *in, unsigned int nbytes,
 	/* diff > 0: not enough input bytes: set most significant digits to 0 */
 	if (diff > 0) {
 		ndigits -= diff;
-		memset(&out[ndigits - 1], 0, diff * sizeof(u64));
+		memset(&out[ndigits], 0, diff * sizeof(u64));
 	}
 
 	if (o) {
-- 
2.44.0


