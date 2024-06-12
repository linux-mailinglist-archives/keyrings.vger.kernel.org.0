Return-Path: <keyrings+bounces-1607-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A41F9056AE
	for <lists+keyrings@lfdr.de>; Wed, 12 Jun 2024 17:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 599F11C222EE
	for <lists+keyrings@lfdr.de>; Wed, 12 Jun 2024 15:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3936C17FABD;
	Wed, 12 Jun 2024 15:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="drl40EG7"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4632216F278;
	Wed, 12 Jun 2024 15:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718205577; cv=none; b=PZDzw4RqjaSmmwHEgi7QtulwAFD5ZEcOb8IL4yHehvr0QavDyiwGXlRKn/KxKA9vBBUSlhwkEKeIyXmzxvIpFOvoKqN9mMLYAQqHgLhsBiOo1ZtuhqCSUBVVeJORaqnSV3O752au0GegsHdT4q8Xew9D1zFUlWgivbss8ygsP1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718205577; c=relaxed/simple;
	bh=WJ2rI4LRNfmpPQZ/rrMvTKlCFRyc5RpGb1ltt6w3l4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZs+P+LYxHcoP905YQAK1r6WitHlqCKL26klffbsJDnSpBPHq1mSyHjsjhENN+tIYXa/4EFZx8WbqlFI++lFMs0XfQa8hpHVSDCYYNOhRxL6GYOnpucY/043/bZr5DUqljAgtRr1ZPbNSmVnHFI9WLJCD1ZlTwqomrDWa0QvHO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=drl40EG7; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CEvcWS020546;
	Wed, 12 Jun 2024 15:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=kSAC4NA5rJm4U
	X+nu4R9X6pFVEKToIjD2wN8Z+LMTl4=; b=drl40EG7U761fPbrCIhoI72vANrb9
	ZliaLH2JiSr+COX5oot1GKdwpcgrXuTloZ24RUWClo554+1E8lAeYjpPGX5XxMeX
	CauSq9xQD+wZiUDJIcwM2fbaIsF13APNMfln32kIogGAyCqTEStn2Q8+B6y6nIdK
	Bkk6s/uExdf72EZj6+rgHnzt4LVb1ex41d0gI5bzvRcUC/FisZY0poy0VovQfNIR
	lBtg26eELuAsvE2OleEWJaAfnS8B7CSBGZBNS8HMbheJzYg+pIt2PDU8QBfAoYpF
	IA9Lp/Q4UJNgUZBpIQ69gvRI1jA+gShNxLKnXgCIIgxpHoFmpGBEQqDpA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yqdj0g343-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 15:19:26 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45CECZIB020048;
	Wed, 12 Jun 2024 15:19:25 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yn34n6utf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 15:19:25 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45CFJMWl43188978
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jun 2024 15:19:25 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CF4C58065;
	Wed, 12 Jun 2024 15:19:22 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9A6C5805B;
	Wed, 12 Jun 2024 15:19:21 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Jun 2024 15:19:21 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, saulo.alessandre@tse.jus.br, ardb@kernel.org,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: [RFC PATCH 2/3] crypto: ecc - Implement and use ecc_curve_get_nbytes to get curve's nbytes
Date: Wed, 12 Jun 2024 11:18:59 -0400
Message-ID: <20240612151900.895156-3-stefanb@linux.ibm.com>
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
X-Proofpoint-GUID: fGtCzLnGL-8p-KNRnfOsRaphSofn4ERi
X-Proofpoint-ORIG-GUID: fGtCzLnGL-8p-KNRnfOsRaphSofn4ERi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_08,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=798 suspectscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120106

Implement ecc_curve_get_nbytes to get a curve's number of bytes (nbytes)
derived from the nbits field of a curve. This function should be used
where nbytes is currently derived from ndigits since it gives a precise
number for all curves including those that do not use all bytes in the
most significant digit, such as NIST P521.

Neither of the modified functions have so far been used with the NIST P521
curve.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 crypto/ecc.c                  |  4 +---
 crypto/ecdh.c                 | 15 ++++++++++-----
 include/crypto/internal/ecc.h |  9 +++++++++
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/crypto/ecc.c b/crypto/ecc.c
index 1cdb5df3aa5d..7cc82c9eacc8 100644
--- a/crypto/ecc.c
+++ b/crypto/ecc.c
@@ -1522,10 +1522,8 @@ static int __ecc_is_key_valid(const struct ecc_curve *curve,
 int ecc_is_key_valid(unsigned int curve_id, unsigned int ndigits,
 		     const u64 *private_key, unsigned int private_key_len)
 {
-	int nbytes;
 	const struct ecc_curve *curve = ecc_get_curve(curve_id);
-
-	nbytes = ndigits << ECC_DIGITS_TO_BYTES_SHIFT;
+	unsigned int nbytes = ecc_curve_get_nbytes(curve);
 
 	if (private_key_len != nbytes)
 		return -EINVAL;
diff --git a/crypto/ecdh.c b/crypto/ecdh.c
index 72cfd1590156..55d140772da0 100644
--- a/crypto/ecdh.c
+++ b/crypto/ecdh.c
@@ -27,11 +27,13 @@ static int ecdh_set_secret(struct crypto_kpp *tfm, const void *buf,
 			   unsigned int len)
 {
 	struct ecdh_ctx *ctx = ecdh_get_ctx(tfm);
+	const struct ecc_curve *curve = ecc_get_curve(ctx->curve_id);
+	unsigned int nbytes = ecc_curve_get_nbytes(curve);
 	struct ecdh params;
 	int ret = 0;
 
 	if (crypto_ecdh_decode_key(buf, len, &params) < 0 ||
-	    params.key_size > sizeof(u64) * ctx->ndigits)
+	    params.key_size > nbytes)
 		return -EINVAL;
 
 	memset(ctx->private_key, 0, sizeof(ctx->private_key));
@@ -56,13 +58,14 @@ static int ecdh_compute_value(struct kpp_request *req)
 {
 	struct crypto_kpp *tfm = crypto_kpp_reqtfm(req);
 	struct ecdh_ctx *ctx = ecdh_get_ctx(tfm);
+	const struct ecc_curve *curve = ecc_get_curve(ctx->curve_id);
+	unsigned int nbytes = ecc_curve_get_nbytes(curve);
 	u64 *public_key;
 	u64 *shared_secret = NULL;
 	void *buf;
-	size_t copied, nbytes, public_key_sz;
+	size_t copied, public_key_sz;
 	int ret = -ENOMEM;
 
-	nbytes = ctx->ndigits << ECC_DIGITS_TO_BYTES_SHIFT;
 	/* Public part is a point thus it has both coordinates */
 	public_key_sz = 2 * nbytes;
 
@@ -123,9 +126,11 @@ static int ecdh_compute_value(struct kpp_request *req)
 static unsigned int ecdh_max_size(struct crypto_kpp *tfm)
 {
 	struct ecdh_ctx *ctx = ecdh_get_ctx(tfm);
+	const struct ecc_curve *curve = ecc_get_curve(ctx->curve_id);
+	unsigned int nbytes = ecc_curve_get_nbytes(curve);
 
-	/* Public key is made of two coordinates, add one to the left shift */
-	return ctx->ndigits << (ECC_DIGITS_TO_BYTES_SHIFT + 1);
+	/* Public key is made of two coordinates */
+	return nbytes * 2;
 }
 
 static int ecdh_nist_p192_init_tfm(struct crypto_kpp *tfm)
diff --git a/include/crypto/internal/ecc.h b/include/crypto/internal/ecc.h
index b18297aaff08..d6e51e45fb3d 100644
--- a/include/crypto/internal/ecc.h
+++ b/include/crypto/internal/ecc.h
@@ -83,6 +83,15 @@ void ecc_digits_from_bytes(const u8 *in, unsigned int nbytes,
 void ecc_digits_to_bytes(const u64 *in, unsigned int ndigits,
 			 u8 *out, unsigned int nbytes);
 
+/*
+ * ecc_curve_get_nbytes() - Get the number of bytes the curve requires
+ * @curve:   The curve
+ */
+static inline unsigned int ecc_curve_get_nbytes(const struct ecc_curve *curve)
+{
+	return DIV_ROUND_UP(curve->nbits, 8);
+}
+
 /**
  * ecc_is_key_valid() - Validate a given ECDH private key
  *
-- 
2.43.0


