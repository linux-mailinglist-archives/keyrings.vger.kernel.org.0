Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CBC3305075
	for <lists+keyrings@lfdr.de>; Wed, 27 Jan 2021 05:10:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232280AbhA0EKI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Jan 2021 23:10:08 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:5712 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2395230AbhAZTMS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 26 Jan 2021 14:12:18 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10QJ2Al6192571;
        Tue, 26 Jan 2021 14:11:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=vfwSj6vlYSSmIGdUcZZ+Hwp8PfJM9qaqp+/yheoF7G4=;
 b=fBeMCUv8me+C3Y27JWUajSDQzs0viXbnqwWF8YPQZT7SQg8upxAzuC0aiA4Rirvw0biY
 /m6wqP9rf0DGXzVS55lainMxMzd2JXxFdoblanPjzfkooL7HvfmEz/XykmHihragPn46
 DVG0j1p+nvbB5a5mu3C38bMv45W2fHJgutyNZHWRjCD7LHJ6oEhNMmY6Iw86ssMdxeaf
 woxQ9vo0CIlXE+dxDj/6EtnxhLdiGxjcaD11wrSljRSAeCZ2qoI0McVVWfFne0qLK2tj
 swhR7TqjYCumLuxmsRiANUDkSlEOEMIcBtdOLqaoljJYlB4p/U+kkzKb0vcpLWbz+QOq kg== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36arvfg8dw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 14:11:25 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10QJ2Clt192670;
        Tue, 26 Jan 2021 14:11:25 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36arvfg8df-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 14:11:25 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QJ2hsf020002;
        Tue, 26 Jan 2021 19:11:24 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma02dal.us.ibm.com with ESMTP id 36a4mbrngc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 19:11:24 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10QJBMve21168446
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 19:11:23 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DC11E136059;
        Tue, 26 Jan 2021 19:11:22 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4C380136055;
        Tue, 26 Jan 2021 19:11:22 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue, 26 Jan 2021 19:11:22 +0000 (GMT)
From:   Stefan Berger <stefanb@linux.vnet.ibm.com>
To:     dhowells@redhat.com, keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, linux-crypto@vger.kernel.org,
        patrick@puiterwijk.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v2 1/3] x509: Detect sm2 keys by their parameters OID
Date:   Tue, 26 Jan 2021 14:11:13 -0500
Message-Id: <20210126191115.434842-2-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126191115.434842-1-stefanb@linux.vnet.ibm.com>
References: <20210126191115.434842-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-26_09:2021-01-26,2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260096
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Stefan Berger <stefanb@linux.ibm.com>

Detect whether a key is an sm2 type of key by its OID in the parameters
array rather than assuming that everything under OID_id_ecPublicKey
is sm2, which is not the case.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 crypto/asymmetric_keys/x509_cert_parser.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 52c9b455fc7d..4643fe5ed69a 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -459,6 +459,7 @@ int x509_extract_key_data(void *context, size_t hdrlen,
 			  const void *value, size_t vlen)
 {
 	struct x509_parse_context *ctx = context;
+	enum OID oid;
 
 	ctx->key_algo = ctx->last_oid;
 	switch (ctx->last_oid) {
@@ -470,7 +471,17 @@ int x509_extract_key_data(void *context, size_t hdrlen,
 		ctx->cert->pub->pkey_algo = "ecrdsa";
 		break;
 	case OID_id_ecPublicKey:
-		ctx->cert->pub->pkey_algo = "sm2";
+		if (ctx->params_size < 2)
+			return -ENOPKG;
+
+		oid = look_up_OID(ctx->params + 2, ctx->params_size - 2);
+		switch (oid) {
+		case OID_sm2:
+			ctx->cert->pub->pkey_algo = "sm2";
+			break;
+		default:
+			return -ENOPKG;
+		}
 		break;
 	default:
 		return -ENOPKG;
-- 
2.25.4

