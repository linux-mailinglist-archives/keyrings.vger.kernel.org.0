Return-Path: <keyrings+bounces-1519-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F21A8D41AD
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2024 01:08:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 156F21F23170
	for <lists+keyrings@lfdr.de>; Wed, 29 May 2024 23:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B90601CB337;
	Wed, 29 May 2024 23:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Fzoj78OU"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D575178360;
	Wed, 29 May 2024 23:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717024126; cv=none; b=LV2oaLcPqm9P24U05seULfO/RDqDtytkQuKh/N3Awy1xCn4yGXmTljrBIJ2gAYVOKAiSHDzyWMrFI/xEjz8PSql200YgLLOPnOhCB/v3kIJR8KnvB7u6uxoz+xQtMoxttC9cljhgTiI21SC0mHuz8RV4OKaogwnFKgQgOItGZ9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717024126; c=relaxed/simple;
	bh=9hflfRrZb424cwnqf/iro650WO5bVJxeXnW7wHQXjYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eRw24G+2L7h50SvdpQ7sgBBcy6hB2+5elufI3zDdzhUVazTj0p7GBI3/5oEW4l9SdkSfj7mHlssqo1A5zYaLRPyeGn0dnmnwA12JVjanfZULTgr5/I2Qg6WguhDqAIaibUc8VXdJKY5wcp6h0JJAdWYyzVRAZ3XRYZarngtg2Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Fzoj78OU; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44TMbxPF022947;
	Wed, 29 May 2024 23:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=tfpTIOiHxnILFvod7wxA6yfuRrE3T97/xxPgvdUVf78=;
 b=Fzoj78OUKHHCFEyeln+BzC2zzqAYVAOVwnm136g+5Ly3IyNAckUI+nnfyPf/Yw9wpFAJ
 +bHjqitYE+0VRSwuv4ZtCU3uf7bsH7AaFuiImb59763z9liNDzwqRa+BBy9YCR+lK5Jj
 trfv2g2h9o/3Idtru+Ba0Y+LPaS+rlwj1IrnIUrnZrDNFOuFjJKxBrjic07T+OQ3fAtV
 xTlNah3DMv4kVPpJov3EzGTUplCeb6cV7tN07IZczro5QiNr5ZlKdwbwT/e5ecu1jTqu
 LQIlOA5gZF19pQG9aD6tOIjlvqkXoCNilyEJ4+ZSq/zbiMG9Ju74IaRx67LS0Biic7bZ 1g== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yedakg1pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 23:08:37 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44TLiGx8026662;
	Wed, 29 May 2024 23:08:36 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ydpd2pkn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 23:08:36 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44TN8XVF18481820
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 May 2024 23:08:35 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95E3958056;
	Wed, 29 May 2024 23:08:33 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D951D58054;
	Wed, 29 May 2024 23:08:32 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 May 2024 23:08:32 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, lukas@wunner.de, jarkko@kernel.org,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 2/2] crypto: ecdsa - Use ecc_digits_from_bytes to convert signature
Date: Wed, 29 May 2024 19:08:27 -0400
Message-ID: <20240529230827.379111-3-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240529230827.379111-1-stefanb@linux.ibm.com>
References: <20240529230827.379111-1-stefanb@linux.ibm.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: z0xQju7NkbK5RIUZcofU-LpnTH1PkTj3
X-Proofpoint-GUID: z0xQju7NkbK5RIUZcofU-LpnTH1PkTj3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 mlxscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405290166

Since ecc_digits_from_bytes will provide zeros when an insufficient number
of bytes are passed in the input byte array, use it to convert the r and s
components of the signature to digits directly from the input byte
array. This avoids going through an intermediate byte array that has the
first few bytes filled with zeros.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 crypto/ecdsa.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
index fa029f36110b..941cdc2b889b 100644
--- a/crypto/ecdsa.c
+++ b/crypto/ecdsa.c
@@ -38,7 +38,6 @@ static int ecdsa_get_signature_rs(u64 *dest, size_t hdrlen, unsigned char tag,
 	size_t bufsize = ndigits * sizeof(u64);
 	ssize_t diff = vlen - bufsize;
 	const char *d = value;
-	u8 rs[ECC_MAX_BYTES];
 
 	if (!value || !vlen)
 		return -EINVAL;
@@ -46,7 +45,7 @@ static int ecdsa_get_signature_rs(u64 *dest, size_t hdrlen, unsigned char tag,
 	/* diff = 0: 'value' has exacly the right size
 	 * diff > 0: 'value' has too many bytes; one leading zero is allowed that
 	 *           makes the value a positive integer; error on more
-	 * diff < 0: 'value' is missing leading zeros, which we add
+	 * diff < 0: 'value' is missing leading zeros
 	 */
 	if (diff > 0) {
 		/* skip over leading zeros that make 'value' a positive int */
@@ -61,14 +60,7 @@ static int ecdsa_get_signature_rs(u64 *dest, size_t hdrlen, unsigned char tag,
 	if (-diff >= bufsize)
 		return -EINVAL;
 
-	if (diff) {
-		/* leading zeros not given in 'value' */
-		memset(rs, 0, -diff);
-	}
-
-	memcpy(&rs[-diff], d, vlen);
-
-	ecc_swap_digits((u64 *)rs, dest, ndigits);
+	ecc_digits_from_bytes(d, vlen, dest, ndigits);
 
 	return 0;
 }
-- 
2.43.0


