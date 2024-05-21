Return-Path: <keyrings+bounces-1380-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF968CB628
	for <lists+keyrings@lfdr.de>; Wed, 22 May 2024 00:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 93D57281421
	for <lists+keyrings@lfdr.de>; Tue, 21 May 2024 22:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B81F86BB4A;
	Tue, 21 May 2024 22:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="PRxX5Y41"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2DF168BD;
	Tue, 21 May 2024 22:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716331835; cv=none; b=CWZ3Az0b27xgp1uMHzr6XOkAXVTKLLC3LqmP713pKCke5QyvJGgenT4rinV23uDfYpiCSjULoSE0yQdDJbciCgg1FCYdM+3mzpvcOuIZN21972mCkFR/vazz2Z9JXJkOknD4Ps8IHPqqTWWPprnUU6GsizR8QMXYytPWL9JQoxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716331835; c=relaxed/simple;
	bh=1zvBhO11KU07W6//cXwWC2aMDcPdVMYA8rYU21wJ2M4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y9zaZPymeevxqTfxzLoLzYnFxi/wMLjNtZdhVwy/sAttpPMTrvZMb8z2++paHlNWqVq2cDvR0O3WUcJBAa48GrK4KPCzDTuYO/Q20KVnpnj3l/nivXkXOi4Drr1LxzDf/87P3ckwuSa5N50gkQ0OQrZRJis/tOKjkS5uhcUAC+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=PRxX5Y41; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44LMGGvD024153;
	Tue, 21 May 2024 22:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=6hQdQWIJQzQJKZkddUQqTAvsAlR93yaL2HeF+Kt++gM=;
 b=PRxX5Y41b+1cpwHaM5OzrFc3C/VJkITTky0lGweUb/+kB+bW4/bnwnwPY7XrshP8xaX4
 kYtrZoWqP6hPInuxZfA+BVQLNtTMxTD56JcAmYEqlxQ7dH8dI844YIpPMmpWbZxx3R0r
 sSmLwu4Nf0rwwP6jehgW297GHwCCSMKyiwlmVGbz9OPiPWiO3oQZYd+gU/xE/zABk+Gj
 F6sUG6L6cq2DmyQ/Xg+C/QLU26RoTVx5QYQjZ+uSN5ymRHxigmZnH8yxVHxJ/KL5XEZI
 +QHEFjA6h1elPFV/bdfeKo5FdPcgM4rL4EXe63WgDI+LpVk+bJymZX1HfiJr4RceJhVh dQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y93s50509-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 22:50:18 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44LKOxfM023469;
	Tue, 21 May 2024 22:50:18 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3y77np8hw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 May 2024 22:50:18 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44LMoFnk16057072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 May 2024 22:50:17 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 484915805A;
	Tue, 21 May 2024 22:50:15 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C39D958051;
	Tue, 21 May 2024 22:50:14 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 21 May 2024 22:50:14 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, lukas@wunner.de, jarkko@kernel.org,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: [REPOST PATCH v3] crypto: ecc - Prevent ecc_digits_from_bytes from reading too many bytes
Date: Tue, 21 May 2024 18:50:06 -0400
Message-ID: <20240521225006.207084-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: SBdtM7poBZMlZv-A0wM4h4X2aoRVcfBY
X-Proofpoint-ORIG-GUID: SBdtM7poBZMlZv-A0wM4h4X2aoRVcfBY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_14,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxlogscore=999 clxscore=1011 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405210173

Prevent ecc_digits_from_bytes from reading too many bytes from the input
byte array in case an insufficient number of bytes is provided to fill the
output digit array of ndigits. Therefore, initialize the most significant
digits with 0 to avoid trying to read too many bytes later on. Convert the
function into a regular function since it is getting too big for an inline
function.

If too many bytes are provided on the input byte array the extra bytes
are ignored since the input variable 'ndigits' limits the number of digits
that will be filled.

Fixes: d67c96fb97b5 ("crypto: ecdsa - Convert byte arrays with key coordinates to digits")
Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>

---
v3:
 - Applied Jarkko's tag

v2:
 - un-inline function
 - use memset
---
 crypto/ecc.c                  | 22 ++++++++++++++++++++++
 include/crypto/internal/ecc.h | 15 ++-------------
 2 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/crypto/ecc.c b/crypto/ecc.c
index c1d2e884be1e..fe761256e335 100644
--- a/crypto/ecc.c
+++ b/crypto/ecc.c
@@ -68,6 +68,28 @@ const struct ecc_curve *ecc_get_curve(unsigned int curve_id)
 }
 EXPORT_SYMBOL(ecc_get_curve);
 
+void ecc_digits_from_bytes(const u8 *in, unsigned int nbytes,
+			   u64 *out, unsigned int ndigits)
+{
+	int diff = ndigits - DIV_ROUND_UP(nbytes, sizeof(u64));
+	unsigned int o = nbytes & 7;
+	__be64 msd = 0;
+
+	/* diff > 0: not enough input bytes: set most significant digits to 0 */
+	if (diff > 0) {
+		ndigits -= diff;
+		memset(&out[ndigits - 1], 0, diff * sizeof(u64));
+	}
+
+	if (o) {
+		memcpy((u8 *)&msd + sizeof(msd) - o, in, o);
+		out[--ndigits] = be64_to_cpu(msd);
+		in += o;
+	}
+	ecc_swap_digits(in, out, ndigits);
+}
+EXPORT_SYMBOL(ecc_digits_from_bytes);
+
 static u64 *ecc_alloc_digits_space(unsigned int ndigits)
 {
 	size_t len = ndigits * sizeof(u64);
diff --git a/include/crypto/internal/ecc.h b/include/crypto/internal/ecc.h
index 7ca1f463d1ec..f7e75e1e71f3 100644
--- a/include/crypto/internal/ecc.h
+++ b/include/crypto/internal/ecc.h
@@ -64,19 +64,8 @@ static inline void ecc_swap_digits(const void *in, u64 *out, unsigned int ndigit
  * @out       Output digits array
  * @ndigits:  Number of digits to create from byte array
  */
-static inline void ecc_digits_from_bytes(const u8 *in, unsigned int nbytes,
-					 u64 *out, unsigned int ndigits)
-{
-	unsigned int o = nbytes & 7;
-	__be64 msd = 0;
-
-	if (o) {
-		memcpy((u8 *)&msd + sizeof(msd) - o, in, o);
-		out[--ndigits] = be64_to_cpu(msd);
-		in += o;
-	}
-	ecc_swap_digits(in, out, ndigits);
-}
+void ecc_digits_from_bytes(const u8 *in, unsigned int nbytes,
+			   u64 *out, unsigned int ndigits);
 
 /**
  * ecc_is_key_valid() - Validate a given ECDH private key
-- 
2.43.0


