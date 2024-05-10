Return-Path: <keyrings+bounces-1184-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BA38C1C45
	for <lists+keyrings@lfdr.de>; Fri, 10 May 2024 03:59:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A37F281939
	for <lists+keyrings@lfdr.de>; Fri, 10 May 2024 01:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D15A13B797;
	Fri, 10 May 2024 01:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="fI3dHeba"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867AE33CD1;
	Fri, 10 May 2024 01:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715306387; cv=none; b=FeQUq7MupVFP+alDRcutXdZei/F7jrfz9sEdWNDjvX2nZWegqi1fLcq1CT74rRXiwjDyTyir25OoWamFNTx6hGcZQ3MersY2t61juuHT0qp/xT/vmPWgwrl67nOZtZLHM64HiOLtKQHEKmJ09tT+J/vkBSIIkB/7ZawsabkX0P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715306387; c=relaxed/simple;
	bh=1zvBhO11KU07W6//cXwWC2aMDcPdVMYA8rYU21wJ2M4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RfdNjo+8honSO/fV0VU0JiFGV/CHugtKPsVjXy3xv42QIl1yXDp+kpDp/JOvWJZUO8QrXov94I7jfiOpIBsDm3DmTFpcbiCZurG7+cnRi+Tt2Pdcx9PoWB/dHFQdBdq/z4eo8MFn54yux4D271WalR/W6NH3B0m7Gmtu+VvA49U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=fI3dHeba; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44A1lenh017504;
	Fri, 10 May 2024 01:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=6hQdQWIJQzQJKZkddUQqTAvsAlR93yaL2HeF+Kt++gM=;
 b=fI3dHebaSoPgdeo5SWBQxMdoME/WtTPJAhMDH8wd8I7e1aFBR1+hHtP2hmvNlBOz125A
 TuQVPxWFQqZ83p3SMKPICox2DWSJ1qfVDYpWIzaJtMjnjcLR0mFmXxIJmh7V8jkqBNsY
 ECgk+23EAzt9aJnYEjVCSVFQ2kgl4Sft7x8GjbuTExhlLW4uIJDevvV4C5hfttsf1YAM
 CZynZsTno/nbIabtHZJECjrwRm5pake0aACvzhlTHg+gG9IRT3FK6UzEkFAlX12aVP3k
 x/U8H/WtXEUeXYH7QCuTk2uqg6QuYQfkwQe0e+rOgi16PbuMxLqQTQTmWx9N9MHD57f4 3g== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3y1a7p80jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 01:59:31 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44A0Y2ZQ026745;
	Fri, 10 May 2024 01:59:30 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xysfwxerx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 01:59:30 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44A1xRHY10355390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 May 2024 01:59:30 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF00C58061;
	Fri, 10 May 2024 01:59:27 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 503105803F;
	Fri, 10 May 2024 01:59:27 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 May 2024 01:59:27 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, lukas@wunner.de, jarkko@kernel.org,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v3] crypto: ecc - Prevent ecc_digits_from_bytes from reading too many bytes
Date: Thu,  9 May 2024 21:59:21 -0400
Message-ID: <20240510015921.179175-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.45.0
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OWCrg3R4g_-Y7GN8ak5RkX8wPvR2PPAC
X-Proofpoint-ORIG-GUID: OWCrg3R4g_-Y7GN8ak5RkX8wPvR2PPAC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_01,2024-05-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405100012

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


