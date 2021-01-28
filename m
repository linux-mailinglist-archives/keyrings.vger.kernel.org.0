Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4918330686F
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 01:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231225AbhA1APC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Jan 2021 19:15:02 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:28830 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231312AbhA1APB (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Jan 2021 19:15:01 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10S03WgE158634;
        Wed, 27 Jan 2021 19:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Sgy7dj6DVYCig6LOMExYxbK1i7XfwPMuOGVMsg/dbas=;
 b=jLyeSI3EXPWxumM5ee0gyS6v26ijhv1CaQl6xjaOPr7XfAdfdrxUE6KPDiT/G6N5HRud
 gRdK0DyCO/w75A2GVSE/Kp5fHDeIHNlZjHDfwca85sNIIYlSRG1mc/B+OTZCeg9avQSY
 18RfmMYGRate/ovEqeh1ls9P7UIubRL5jXrPf7aG7KrvEl7taU+qAhtpGIRnKFgkcTvQ
 LXCFCswCok1tZetKadpHSezxiu2K6N4hVbU7jDw6Tm1qGArK25+/fmNxLol098EXe5ec
 3ZrO2qWUz2hzAlyoY2TDKbhlrdMahwHURXvrKH17dZL+ofpXRIj6WUczJIQA2EdPJIti 7w== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36bde801a3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 19:14:19 -0500
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10S03hF6159256;
        Wed, 27 Jan 2021 19:14:19 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36bde8019s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 19:14:19 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10S08eat029783;
        Thu, 28 Jan 2021 00:14:18 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
        by ppma03dal.us.ibm.com with ESMTP id 368be9hmgf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 00:14:18 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10S0EH7f27001208
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 00:14:17 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C5B29AE060;
        Thu, 28 Jan 2021 00:14:17 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 86CD0AE05F;
        Thu, 28 Jan 2021 00:14:17 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 28 Jan 2021 00:14:17 +0000 (GMT)
From:   Stefan Berger <stefanb@linux.vnet.ibm.com>
To:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, patrick@puiterwijk.org,
        Stefan Berger <stefanb@linux.ibm.com>,
        David Howells <dhowells@redhat.com>
Subject: [PATCH v4 2/3] x509: Detect sm2 keys by their parameters OID
Date:   Wed, 27 Jan 2021 19:14:11 -0500
Message-Id: <20210128001412.822048-3-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128001412.822048-1-stefanb@linux.vnet.ibm.com>
References: <20210128001412.822048-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-27_09:2021-01-27,2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270116
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Stefan Berger <stefanb@linux.ibm.com>

Detect whether a key is an sm2 type of key by its OID in the parameters
array rather than assuming that everything under OID_id_ecPublicKey
is sm2, which is not the case.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Cc: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org
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
2.26.2

