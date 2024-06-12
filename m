Return-Path: <keyrings+bounces-1608-lists+keyrings=lfdr.de@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FAA9056B0
	for <lists+keyrings@lfdr.de>; Wed, 12 Jun 2024 17:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF7D8285ACC
	for <lists+keyrings@lfdr.de>; Wed, 12 Jun 2024 15:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17FF1802A2;
	Wed, 12 Jun 2024 15:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="tlf0xvUc"
X-Original-To: keyrings@vger.kernel.org
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D3B16EBED;
	Wed, 12 Jun 2024 15:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718205577; cv=none; b=Nj37JWw81dn9sD5jjGarpCkg02V/Yek7e3faVDwncH50HxNO+ICKr9qZ1ki5SJCk7LA1JPKOt6/d6mRp9kfILD8c9H9fo2ZgQJHeNWs1PShhdgSY2RYMakQ5zbnl5ucc0Xi2LnmvFYR2o4AAdjFctLDmaXUr3p0BgiS1n6JWrGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718205577; c=relaxed/simple;
	bh=E3J421gPUHv01sCdByhzhWzNLTj7rOGIoerrd07tG8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s7ZEClxpCfEYHDy62p1HHjK6tLERKVhiAp1ERyROAqM/iQBdCvXilX5BuFA+S5id+Jq3rlHY4cUOQiBpOvfPuEOS3tKFSWB5R1alMZiBWwaduaQivPTRgAjDME98pocf7kdlyRwsUireYQQEdyuzj9oyFcgtx7nweFYRgGnbcPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=tlf0xvUc; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CEwe6e030749;
	Wed, 12 Jun 2024 15:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=pp1; bh=0YZLNFM5669Wu
	jAaymd1JKNgSaG3JN+n2/cBPGZTGZo=; b=tlf0xvUc7tQWQKo9taVobWMzmKzq0
	VVGdQeEe+P/AvXoNduDmqMJ4GBqMhmDda+xVp1kAZia4D9tuGFyuYncXeP5RE/9k
	2d2zPsj7+RInTqY3gbHsj8VTZBl9G8ly4QnY7uIXhjayPcXyeLHdPynZ6d0n1bHB
	jDofM8jHcGUotD66tbMn5Wxw1fOKniip7IyYRU+ZtQ85KcpqVRYztY7NFEXTrwlr
	8kDtqa/AprSysn+GkrtzjP1ROowdN9et/YfkpEU4Wo8VFklR7/eHCDTf4V40m+0U
	VF6EjAx2V6rAam2OESTjaXnTT1i/JgBWhZabP75uY444+zi/dbG71GTzA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3yqdwf01u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 15:19:27 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 45CECZIC020048;
	Wed, 12 Jun 2024 15:19:25 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3yn34n6utj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 15:19:25 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 45CFJNWq55902694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Jun 2024 15:19:25 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8492C58066;
	Wed, 12 Jun 2024 15:19:23 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C173558059;
	Wed, 12 Jun 2024 15:19:22 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Jun 2024 15:19:22 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net
Cc: linux-kernel@vger.kernel.org, saulo.alessandre@tse.jus.br, ardb@kernel.org,
        Stefan Berger <stefanb@linux.ibm.com>
Subject: [RFC PATCH 3/3] crypto: ecdh - Use functions to copy digits from and to byte arrays
Date: Wed, 12 Jun 2024 11:19:00 -0400
Message-ID: <20240612151900.895156-4-stefanb@linux.ibm.com>
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
X-Proofpoint-GUID: FEd_k3G1nxaId23hT99Qh1LPPVmC3qS6
X-Proofpoint-ORIG-GUID: FEd_k3G1nxaId23hT99Qh1LPPVmC3qS6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_08,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120106

In ecdh_compute_value the public_key and shared_secret variables are not
arrays of digits (u64 *) but byte buffers that are either copied into from
the scatterlist req->src or copied out of to the scatterlist req->dst.
Therefore, convert these variables to 'u8 *' and modify ecc_make_pub_key
and crypto_ecdh_shared_secret to use ecc_digits_from_bytes to convert byte
arrays to digits and ecc_digits_to_bytes to convert digits to byte arrays.
This also prepares the code for usage with curves that do not use all
bytes in the most significant digit, such as NIST P521, since these two
functions can handle conversions between digits and byte arrays related to
such curves.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 crypto/ecc.c                  | 21 ++++++++++-----------
 crypto/ecdh.c                 |  9 +++++----
 include/crypto/internal/ecc.h | 15 +++++++++------
 3 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/crypto/ecc.c b/crypto/ecc.c
index 7cc82c9eacc8..3ad2d8ae41b9 100644
--- a/crypto/ecc.c
+++ b/crypto/ecc.c
@@ -1584,7 +1584,8 @@ int ecc_gen_privkey(unsigned int curve_id, unsigned int ndigits,
 EXPORT_SYMBOL(ecc_gen_privkey);
 
 int ecc_make_pub_key(unsigned int curve_id, unsigned int ndigits,
-		     const u64 *private_key, u64 *public_key)
+		     const u64 *private_key, u8 *public_key,
+		     unsigned int nbytes)
 {
 	int ret = 0;
 	struct ecc_point *pk;
@@ -1609,8 +1610,8 @@ int ecc_make_pub_key(unsigned int curve_id, unsigned int ndigits,
 		goto err_free_point;
 	}
 
-	ecc_swap_digits(pk->x, public_key, ndigits);
-	ecc_swap_digits(pk->y, &public_key[ndigits], ndigits);
+	ecc_digits_to_bytes(pk->x, ndigits, public_key, nbytes);
+	ecc_digits_to_bytes(pk->y, ndigits, &public_key[nbytes], nbytes);
 
 err_free_point:
 	ecc_free_point(pk);
@@ -1680,13 +1681,12 @@ int ecc_is_pubkey_valid_full(const struct ecc_curve *curve,
 EXPORT_SYMBOL(ecc_is_pubkey_valid_full);
 
 int crypto_ecdh_shared_secret(unsigned int curve_id, unsigned int ndigits,
-			      const u64 *private_key, const u64 *public_key,
-			      u64 *secret)
+			      const u64 *private_key, const u8 *public_key,
+			      unsigned int nbytes, u8 *secret)
 {
 	int ret = 0;
 	struct ecc_point *product, *pk;
 	u64 rand_z[ECC_MAX_DIGITS];
-	unsigned int nbytes;
 	const struct ecc_curve *curve = ecc_get_curve(curve_id);
 
 	if (!private_key || !public_key || ndigits > ARRAY_SIZE(rand_z)) {
@@ -1694,8 +1694,6 @@ int crypto_ecdh_shared_secret(unsigned int curve_id, unsigned int ndigits,
 		goto out;
 	}
 
-	nbytes = ndigits << ECC_DIGITS_TO_BYTES_SHIFT;
-
 	get_random_bytes(rand_z, nbytes);
 
 	pk = ecc_alloc_point(ndigits);
@@ -1704,8 +1702,9 @@ int crypto_ecdh_shared_secret(unsigned int curve_id, unsigned int ndigits,
 		goto out;
 	}
 
-	ecc_swap_digits(public_key, pk->x, ndigits);
-	ecc_swap_digits(&public_key[ndigits], pk->y, ndigits);
+	ecc_digits_from_bytes(public_key, nbytes, pk->x, ndigits);
+	ecc_digits_from_bytes(&public_key[nbytes], nbytes, pk->y, ndigits);
+
 	ret = ecc_is_pubkey_valid_partial(curve, pk);
 	if (ret)
 		goto err_alloc_product;
@@ -1723,7 +1722,7 @@ int crypto_ecdh_shared_secret(unsigned int curve_id, unsigned int ndigits,
 		goto err_validity;
 	}
 
-	ecc_swap_digits(product->x, secret, ndigits);
+	ecc_digits_to_bytes(product->x, ndigits, secret, nbytes);
 
 err_validity:
 	memzero_explicit(rand_z, sizeof(rand_z));
diff --git a/crypto/ecdh.c b/crypto/ecdh.c
index 55d140772da0..dfb5fa1a50d2 100644
--- a/crypto/ecdh.c
+++ b/crypto/ecdh.c
@@ -60,8 +60,8 @@ static int ecdh_compute_value(struct kpp_request *req)
 	struct ecdh_ctx *ctx = ecdh_get_ctx(tfm);
 	const struct ecc_curve *curve = ecc_get_curve(ctx->curve_id);
 	unsigned int nbytes = ecc_curve_get_nbytes(curve);
-	u64 *public_key;
-	u64 *shared_secret = NULL;
+	u8 *public_key;
+	u8 *shared_secret = NULL;
 	void *buf;
 	size_t copied, public_key_sz;
 	int ret = -ENOMEM;
@@ -94,12 +94,13 @@ static int ecdh_compute_value(struct kpp_request *req)
 
 		ret = crypto_ecdh_shared_secret(ctx->curve_id, ctx->ndigits,
 						ctx->private_key, public_key,
-						shared_secret);
+						nbytes, shared_secret);
 
 		buf = shared_secret;
 	} else {
 		ret = ecc_make_pub_key(ctx->curve_id, ctx->ndigits,
-				       ctx->private_key, public_key);
+				       ctx->private_key, public_key,
+				       nbytes);
 		buf = public_key;
 		nbytes = public_key_sz;
 	}
diff --git a/include/crypto/internal/ecc.h b/include/crypto/internal/ecc.h
index d6e51e45fb3d..19265394be48 100644
--- a/include/crypto/internal/ecc.h
+++ b/include/crypto/internal/ecc.h
@@ -126,13 +126,15 @@ int ecc_gen_privkey(unsigned int curve_id, unsigned int ndigits,
  * @curve_id:		id representing the curve to use
  * @ndigits:		curve's number of digits
  * @private_key:	pregenerated private key for the given curve
- * @public_key:		buffer for storing the generated public key
+ * @public_key:		2 * nbytes buffer for storing the generated public key
+ * @nbytes:		size of one coordinate of the public key
  *
  * Returns 0 if the public key was generated successfully, a negative value
  * if an error occurred.
  */
 int ecc_make_pub_key(const unsigned int curve_id, unsigned int ndigits,
-		     const u64 *private_key, u64 *public_key);
+		     const u64 *private_key, u8 *public_key,
+		     unsigned int nbytes);
 
 /**
  * crypto_ecdh_shared_secret() - Compute a shared secret
@@ -140,8 +142,9 @@ int ecc_make_pub_key(const unsigned int curve_id, unsigned int ndigits,
  * @curve_id:		id representing the curve to use
  * @ndigits:		curve's number of digits
  * @private_key:	private key of part A
- * @public_key:		public key of counterpart B
- * @secret:		buffer for storing the calculated shared secret
+ * @public_key:		2 * nbytes buffer with public key of counterpart B
+ * @nbytes:		size of one coordinate of the public key
+ * @secret:		nbytes buffer for storing the calculated shared secret
  *
  * Note: It is recommended that you hash the result of crypto_ecdh_shared_secret
  * before using it for symmetric encryption or HMAC.
@@ -150,8 +153,8 @@ int ecc_make_pub_key(const unsigned int curve_id, unsigned int ndigits,
  * if an error occurred.
  */
 int crypto_ecdh_shared_secret(unsigned int curve_id, unsigned int ndigits,
-			      const u64 *private_key, const u64 *public_key,
-			      u64 *secret);
+			      const u64 *private_key, const u8 *public_key,
+			      unsigned int nbytes, u8 *secret);
 
 /**
  * ecc_is_pubkey_valid_partial() - Partial public key validation
-- 
2.43.0


