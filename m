Return-Path: <keyrings+bounces-1606-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E679056AB
	for <lists+keyrings@lfdr.de>; Wed, 12 Jun 2024 17:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84B0F1C230F4
	for <lists+keyrings@lfdr.de>; Wed, 12 Jun 2024 15:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DEAC17F504;
	Wed, 12 Jun 2024 15:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="WQFLhLjx"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B299A1649DB;
	Wed, 12 Jun 2024 15:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718205576; cv=none; b=u6NYOIerAAmYO5LVmzd4w9D3yMr4kRL7fUYuIsFH7AkvSchziVIXC0GHJJW4KJEc6ShlyE+yvP+9UW3A/Iz2KpqUAW6bLXBFa4smr6UJ5o/SXhBsjrTFIk91pzgrwXP6Upjnb6BVt2ct1AxEfqIkyTZl9fLOFO8Q32MGVA0aKRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718205576; c=relaxed/simple;
	bh=cNg9KJP9TCvb066cqNRlsJS4i+R5DweD6nIVXFzJlOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qw0Z9vpK1Zkn6SFGE+IyO0A9W7cVAVgaAWw09CNSAUCdmLnIU/Jx7P3fsi27n/z3vHXnt9HEZMv8P1LuAFwkN8esdmJ/OtgYUR2dLizTCv6yzDc9U3vT15IrftuT/mfKt6tTbacJSN/AhFe3aWxwmz/Q9FfmO0EvCiTs3nVt4JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=WQFLhLjx; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CEvEW4019404;
	Wed, 12 Jun 2024 15:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=qFuvSRf6Wm9F+
	796itw4tivKW6u8kIcp1dcfEG+Df+4=; b=WQFLhLjx91yVZlW25SQqtgvkDB/nQ
	CLp9SwhdIIeZgETYwQLx0LGk3UaIsDxpWIG/qobo6MQ03NiRXNHyO5+l837PGtSw
	2tBdUB78ARQoXi3TKJVcD+60DCYlVmbA7P6I6olRTgq6xd4K/kvqLEs1gwZAF5Ej
	pKn1XOsWXFa3PbtJ2FZAgbZLgiVCK3Jin7DMZxyUrjGALQPNoCPF7LDKcqfpN325
	xCUZWUVWi5Uh4sRnb/LjyKGPRxJX2tjYP8URMBwagUTYdkrqZI5b9El0nk8trIdt
	lOtLRSy4kjdxWIK4QJ5WQFjdAuNFOJLYgZWC2JosbQzEzUgQ58jC94nwg==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yqdj0g340-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 15:19:25 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45CEuYjW028716;
	Wed, 12 Jun 2024 15:19:24 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3yn1muf59s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 15:19:24 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45CFJLGO8520254
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jun 2024 15:19:23 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B58E258055;
	Wed, 12 Jun 2024 15:19:21 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F2ADF58059;
	Wed, 12 Jun 2024 15:19:20 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Jun 2024 15:19:20 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, saulo.alessandre@tse.jus.br, ardb@kernel.org,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: [RFC PATCH 1/3] crypto: ecc - Implement ecc_digits_to_bytes to convert digits to byte array
Date: Wed, 12 Jun 2024 11:18:58 -0400
Message-ID: <20240612151900.895156-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612151900.895156-1-stefanb@linux.ibm.com>
References: <20240612151900.895156-1-stefanb@linux.ibm.com>
Precedence: bulk
X-Mailing-List: keyrings@vger.kernel.org
List-Id: <keyrings.vger.kernel.org>
List-Subscribe: <mailto:keyrings+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:keyrings+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RlvygaBQzjpfHmR8G0g6vGmrSgAtcOWf
X-Proofpoint-ORIG-GUID: RlvygaBQzjpfHmR8G0g6vGmrSgAtcOWf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_08,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=809 suspectscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120106

Implement ecc_digits_to_bytes to convert an array of digits into an
nbytes-sized byte array. The first byte in the byte array holds the most
significant bits of the large integer.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 crypto/ecc.c                  | 22 ++++++++++++++++++++++
 include/crypto/internal/ecc.h | 13 +++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/crypto/ecc.c b/crypto/ecc.c
index af698f8852fb..1cdb5df3aa5d 100644
--- a/crypto/ecc.c
+++ b/crypto/ecc.c
@@ -90,6 +90,28 @@ void ecc_digits_from_bytes(const u8 *in, unsigned int nbytes,
 }
 EXPORT_SYMBOL(ecc_digits_from_bytes);
 
+void ecc_digits_to_bytes(const u64 *in, unsigned int ndigits,
+			 u8 *out, unsigned int nbytes)
+{
+	unsigned int o = nbytes & 7;
+	__be64 msd;
+	int i;
+
+	if (o) {
+		msd = cpu_to_be64(in[--ndigits]);
+		memcpy(out, (u8 *)&msd + sizeof(msd) - o, o);
+		out += o;
+		nbytes -= o;
+	}
+
+	for (i = ndigits - 1; i >= 0 && nbytes > 0; i--) {
+		put_unaligned_be64(in[i], out);
+		out += sizeof(u64);
+		nbytes -= sizeof(u64);
+	}
+}
+EXPORT_SYMBOL(ecc_digits_to_bytes);
+
 static u64 *ecc_alloc_digits_space(unsigned int ndigits)
 {
 	size_t len = ndigits * sizeof(u64);
diff --git a/include/crypto/internal/ecc.h b/include/crypto/internal/ecc.h
index 0717a53ae732..b18297aaff08 100644
--- a/include/crypto/internal/ecc.h
+++ b/include/crypto/internal/ecc.h
@@ -70,6 +70,19 @@ static inline void ecc_swap_digits(const void *in, u64 *out, unsigned int ndigit
 void ecc_digits_from_bytes(const u8 *in, unsigned int nbytes,
 			   u64 *out, unsigned int ndigits);
 
+/**
+ * ecc_digits_to_bytes() - Copy digits into a byte array of size nbytes
+ * @in:      Input digits array
+ * @ndigits: Number of digits in input digits array
+ * @out:     Output byte array
+ * @nbytes:  Number of bytes to copy into byte array
+ *
+ * The first byte in the byte array will have the most significant bits of the
+ * large integer.
+ */
+void ecc_digits_to_bytes(const u64 *in, unsigned int ndigits,
+			 u8 *out, unsigned int nbytes);
+
 /**
  * ecc_is_key_valid() - Validate a given ECDH private key
  *
-- 
2.43.0


