Return-Path: <keyrings+bounces-1518-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D9A8D41AA
	for <lists+keyrings@lfdr.de>; Thu, 30 May 2024 01:08:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76C611F22E7F
	for <lists+keyrings@lfdr.de>; Wed, 29 May 2024 23:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F39511CB327;
	Wed, 29 May 2024 23:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="qnCqM9oj"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB07316E876;
	Wed, 29 May 2024 23:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717024125; cv=none; b=USAigTo8om9KsUDQB4GI+xTf9h7ytH/SWiT5Td5IXdBMWmpixm6vWcrusP+U/SJaMf9yZt3nkJ39yFgFFEX/49mHiqKw9C/CuP8HkzOjE6zTdIImAnHuxFEpuptRSJLv+Y/iSfaKgVvSnO1nYUq/HlHbzLRDF4RhoPS1B2M+DTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717024125; c=relaxed/simple;
	bh=b1hTvvq30ns4ZUPHAmOSRIl12tXuTOVrGFTxmU1vRg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dH+UhkaaWVkh5qsd2+cRtJ0q2yam4PgZKRXoY1OFwr7wM+vAgaMH09AhDf0kzsX5C5xUGZ/Lr/n4BMVye7VPn4KxzVHx85o86nre9G8rt+hxxucbE20GQtLkJTqE/znycN2ynK9i1tXFeI4ZoJ5cvIoGJoMf7mOo3BxvI9/bzJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=qnCqM9oj; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44TMvm5k003471;
	Wed, 29 May 2024 23:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=pp1;
 bh=ka+yz/thzSzS2ZYYfuMF8iCDDb8pRJrRqOgeCYPW4Bo=;
 b=qnCqM9oj9wOFqeW3Y5osoIHnFoJDiQmKK+gjMdItIV0D/hs7l0E+crV97Kvpb97VwF6A
 bSlG3LATFS4ulv9sAhrdHJq6RZ7JZX4VbiveorFRlaiuEPRRk4vAwRTfppZEpqEft/bE
 37fl7VgMaC9lxskScAvzqfg6oVQJJhljy2Xu+ppAkxIka9ZmtcehsdlrGlXmw0N3oXxq
 9PZlYokouIn1yoSxUsC7UO5m65O5XipB4c82DRpBpwFQgsMx1A1SbiiiI18bfhKjLCBz
 j+LD5dTUFLnfFGsvYZi0tFHAVwnbsxp8ygmXu1IHBH1PRNz6zcGBbGbCK/TLxHLi/hpK 1g== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yedkw00k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 23:08:36 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44TLgRcr026789;
	Wed, 29 May 2024 23:08:35 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ydpd2pkmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 23:08:35 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44TN8WDK17236570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 May 2024 23:08:34 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6D2258062;
	Wed, 29 May 2024 23:08:32 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0477758054;
	Wed, 29 May 2024 23:08:32 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 May 2024 23:08:31 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, lukas@wunner.de, jarkko@kernel.org,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 1/2] crypto: ecdsa - Use ecc_digits_from_bytes to create hash digits array
Date: Wed, 29 May 2024 19:08:26 -0400
Message-ID: <20240529230827.379111-2-stefanb@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: VoTUgXBe_DTnL3fLKbyxvJ_WnSgy9X2p
X-Proofpoint-GUID: VoTUgXBe_DTnL3fLKbyxvJ_WnSgy9X2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405290166

Since ecc_digits_from_bytes will provide zeros when an insufficient number
of bytes are passed in the input byte array, use it to create the hash
digits directly from the input byte array. This avoids going through an
intermediate byte array (rawhash) that has the first few bytes filled with
zeros.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 crypto/ecdsa.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/crypto/ecdsa.c b/crypto/ecdsa.c
index 258fffbf623d..fa029f36110b 100644
--- a/crypto/ecdsa.c
+++ b/crypto/ecdsa.c
@@ -142,10 +142,8 @@ static int ecdsa_verify(struct akcipher_request *req)
 	struct ecdsa_signature_ctx sig_ctx = {
 		.curve = ctx->curve,
 	};
-	u8 rawhash[ECC_MAX_BYTES];
 	u64 hash[ECC_MAX_DIGITS];
 	unsigned char *buffer;
-	ssize_t diff;
 	int ret;
 
 	if (unlikely(!ctx->pub_key_set))
@@ -164,18 +162,11 @@ static int ecdsa_verify(struct akcipher_request *req)
 	if (ret < 0)
 		goto error;
 
-	/* if the hash is shorter then we will add leading zeros to fit to ndigits */
-	diff = bufsize - req->dst_len;
-	if (diff >= 0) {
-		if (diff)
-			memset(rawhash, 0, diff);
-		memcpy(&rawhash[diff], buffer + req->src_len, req->dst_len);
-	} else if (diff < 0) {
-		/* given hash is longer, we take the left-most bytes */
-		memcpy(&rawhash, buffer + req->src_len, bufsize);
-	}
+	if (bufsize > req->dst_len)
+		bufsize = req->dst_len;
 
-	ecc_swap_digits((u64 *)rawhash, hash, ctx->curve->g.ndigits);
+	ecc_digits_from_bytes(buffer + req->src_len, bufsize,
+			      hash, ctx->curve->g.ndigits);
 
 	ret = _ecdsa_verify(ctx, hash, sig_ctx.r, sig_ctx.s);
 
-- 
2.43.0


