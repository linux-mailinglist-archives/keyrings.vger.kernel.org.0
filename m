Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C714305074
	for <lists+keyrings@lfdr.de>; Wed, 27 Jan 2021 05:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238258AbhA0EJ7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Jan 2021 23:09:59 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:22458 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731228AbhAZRF0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 26 Jan 2021 12:05:26 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10QH203v075883;
        Tue, 26 Jan 2021 12:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0825v1EbrhFAES/Br9Z3x90qJ+sI4FzkH07mA0tswA4=;
 b=N7Zy4Wd1Oqj1cz+/CI+KmO0Hb+55dbzvZjz3SQlRPdVdG/BFKiMwM2IlHlaTGz2ndSR/
 PFQX2Ju3K+K0Py1vMnjutuhn19tvHOOzTFP2EhTywiSgU3vNAgg9pgBsof40A49UUrch
 qCG6hQ+v4GCJmoqqCLF4Tj+J7dNRU0W4x2m2OSlYXVwk1HBQRyWUyr4WgQ/haLtsZfEx
 KaAuphPmJ8wlvDMNSgYnR6cTuADqoBuSuaSJ0cGRzM2th+CCSru86uGUclr/TKtOnP5g
 uA39tuIDBRWsk0+cw/DlTpti+lNEMTuBi8TTf+Fp9SikuaWOazFvBTJcZULgOhxAx217 gA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36am6rpb37-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 12:04:04 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10QH3Mn8084702;
        Tue, 26 Jan 2021 12:04:04 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36am6rpb2p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 12:04:04 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QGup6u027829;
        Tue, 26 Jan 2021 17:04:03 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma01dal.us.ibm.com with ESMTP id 36adttm512-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 17:04:03 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10QH42Dl24117710
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 17:04:02 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7F263124052;
        Tue, 26 Jan 2021 17:04:02 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 70D65124055;
        Tue, 26 Jan 2021 17:04:02 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 26 Jan 2021 17:04:02 +0000 (GMT)
From:   Stefan Berger <stefanb@linux.vnet.ibm.com>
To:     dhowells@redhat.com, keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, linux-crypto@vger.kernel.org,
        patrick@puiterwijk.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 3/3] x509: Detect sm2 keys by their parameters OID
Date:   Tue, 26 Jan 2021 12:03:59 -0500
Message-Id: <20210126170359.363969-4-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126170359.363969-1-stefanb@linux.vnet.ibm.com>
References: <20210126170359.363969-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-26_09:2021-01-26,2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101260086
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Stefan Berger <stefanb@linux.ibm.com>

Detect whether a key is a sm2 type of key by its OID in the parameters
array.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 27 +++++++++++++----------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 720cc7977077..82e331da5041 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -485,6 +485,7 @@ int x509_extract_key_data(void *context, size_t hdrlen,
 			  const void *value, size_t vlen)
 {
 	struct x509_parse_context *ctx = context;
+	enum OID oid;
 
 	ctx->key_algo = ctx->last_oid;
 	switch (ctx->last_oid) {
@@ -496,18 +497,20 @@ int x509_extract_key_data(void *context, size_t hdrlen,
 		ctx->cert->pub->pkey_algo = "ecrdsa";
 		break;
 	case OID_id_ecPublicKey:
-		ctx->cert->pub->pkey_algo = "sm2";
-		if (ctx->params_size > 2) {
-			enum OID oid = look_up_OID(ctx->params + 2,
-						   ctx->params_size - 2);
-			switch (oid) {
-			case OID_id_prime192v1:
-			case OID_id_prime256v1:
-				ctx->cert->pub->pkey_algo = "ecdsa";
-				break;
-			default:
-				break;
-			}
+		if (ctx->params_size < 2)
+			return -ENOPKG;
+
+		oid = look_up_OID(ctx->params + 2, ctx->params_size - 2);
+		switch (oid) {
+		case OID_id_prime192v1:
+		case OID_id_prime256v1:
+			ctx->cert->pub->pkey_algo = "ecdsa";
+			break;
+		case OID_sm2:
+			ctx->cert->pub->pkey_algo = "sm2";
+			break;
+		default:
+			return -ENOPKG;
 		}
 		break;
 	default:
-- 
2.25.4

