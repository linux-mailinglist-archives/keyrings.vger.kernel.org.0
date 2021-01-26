Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 056A5305076
	for <lists+keyrings@lfdr.de>; Wed, 27 Jan 2021 05:10:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238264AbhA0EKO (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Jan 2021 23:10:14 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:3674 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2395231AbhAZTMS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 26 Jan 2021 14:12:18 -0500
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10QJ2iqW189030;
        Tue, 26 Jan 2021 14:11:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ikDn+ZRYaj3bFOq/SC2Ll0iFE2WX9JysIlM2RPX6Jik=;
 b=TAor40+2O3Onk13z1A2JUZsrq8pbYEr+zfyByXkH5nNJh27+llglcWgGj52bIbICG06L
 E7sdP/APiSOvzJ9WYeN5jdnm12dh1LOI7WZIOnRcNYzhaJ2O68DlaEY0zwKM+IhQFcB0
 Ir9GjD+G63yV7cziXaAQ6QlOkUsCZYUuZwnogeH7LDdHTjCFIk9yd3d5xkZRha8WBhTM
 2IXvQSTOixZcU85UDkrJa0qDcZwvHETG2SjpFrihF07ZzWT2uT0+hX5zshR5qu4IT793
 +Q/uIrfc5AJYrZdwvaSFPlR5rpfpxlboaqtpiWNdsKcp7I/VFvvkWk1ROq45SdP4jbON pw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36aqvm1xus-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 14:11:28 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10QJ3Opq194219;
        Tue, 26 Jan 2021 14:11:28 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36aqvm1xtw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 14:11:27 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QJ96KT024294;
        Tue, 26 Jan 2021 19:11:25 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
        by ppma01dal.us.ibm.com with ESMTP id 36adttn1qj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 19:11:25 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10QJBOGC21430656
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 19:11:24 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 76271136051;
        Tue, 26 Jan 2021 19:11:24 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id DA5D2136061;
        Tue, 26 Jan 2021 19:11:23 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue, 26 Jan 2021 19:11:23 +0000 (GMT)
From:   Stefan Berger <stefanb@linux.vnet.ibm.com>
To:     dhowells@redhat.com, keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, linux-crypto@vger.kernel.org,
        patrick@puiterwijk.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v2 3/3] x509: Add support for NIST p192 keys in certificates and akcipher
Date:   Tue, 26 Jan 2021 14:11:15 -0500
Message-Id: <20210126191115.434842-4-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126191115.434842-1-stefanb@linux.vnet.ibm.com>
References: <20210126191115.434842-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-26_09:2021-01-26,2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260098
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Stefan Berger <stefanb@linux.ibm.com>

Add support for NIST p192 keys in x509 certificates and support it in
'akcipher'.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 crypto/asymmetric_keys/public_key.c       |  3 ++
 crypto/asymmetric_keys/x509_cert_parser.c |  1 +
 crypto/ecc.c                              | 36 ++++++++++++++++++++++-
 include/linux/oid_registry.h              |  1 +
 4 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index 0fcbaec0ded0..bb4a7cc0e3c8 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -98,6 +98,9 @@ int software_key_determine_akcipher(const char *encoding,
 
 		oid = look_up_OID(pkey->params + 2, pkey->paramlen - 2);
 		switch (oid) {
+		case OID_id_prime192v1:
+			strcpy(alg_name, "nist_p192");
+			return 0;
 		case OID_id_prime256v1:
 			strcpy(alg_name, "nist_p256");
 			return 0;
diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 50f6ecc70d8b..5ff891f8235d 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -505,6 +505,7 @@ int x509_extract_key_data(void *context, size_t hdrlen,
 		case OID_sm2:
 			ctx->cert->pub->pkey_algo = "sm2";
 			break;
+		case OID_id_prime192v1:
 		case OID_id_prime256v1:
 			ctx->cert->pub->pkey_algo = "ecdsa";
 			break;
diff --git a/crypto/ecc.c b/crypto/ecc.c
index 3b5494794bce..02dbc45eef18 100644
--- a/crypto/ecc.c
+++ b/crypto/ecc.c
@@ -1812,13 +1812,47 @@ static struct akcipher_alg ecc_nist_p256 = {
 	},
 };
 
+static unsigned int ecc_nist_p192_max_size(struct crypto_akcipher *tfm)
+{
+	return NIST_P192_KEY_SIZE;
+}
+
+static int ecc_nist_p192_init_tfm(struct crypto_akcipher *tfm)
+{
+	struct ecc_ctx *ctx = akcipher_tfm_ctx(tfm);
+
+	return ecc_ec_ctx_init(ctx, ECC_CURVE_NIST_P192);
+}
+
+static struct akcipher_alg ecc_nist_p192 = {
+	.verify = ecdsa_verify,
+	.set_pub_key = ecc_set_pub_key,
+	.max_size = ecc_nist_p192_max_size,
+	.init = ecc_nist_p192_init_tfm,
+	.exit = ecc_exit_tfm,
+	.base = {
+		.cra_name = "nist_p192",
+		.cra_driver_name = "ecc-nist-p192",
+		.cra_priority = 100,
+		.cra_module = THIS_MODULE,
+		.cra_ctxsize = sizeof(struct ecc_ctx),
+	},
+};
+
 static int ecc_init(void)
 {
-	return crypto_register_akcipher(&ecc_nist_p256);
+	int ret;
+
+	ret = crypto_register_akcipher(&ecc_nist_p256);
+	if (ret)
+		return ret;
+
+	return crypto_register_akcipher(&ecc_nist_p192);
 }
 
 static void ecc_exit(void)
 {
+	crypto_unregister_akcipher(&ecc_nist_p192);
 	crypto_unregister_akcipher(&ecc_nist_p256);
 }
 
diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index 9060f19c80eb..e8071133d0e2 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -21,6 +21,7 @@ enum OID {
 	OID_id_dsa,			/* 1.2.840.10040.4.1 */
 	OID_id_ecdsa_with_sha1,		/* 1.2.840.10045.4.1 */
 	OID_id_ecPublicKey,		/* 1.2.840.10045.2.1 */
+	OID_id_prime192v1,		/* 1.2.840.10045.3.1.1 */
 	OID_id_prime256v1,		/* 1.2.840.10045.3.1.7 */
 	OID_id_ecdsa_with_sha224,	/* 1.2.840.10045.4.3.1 */
 	OID_id_ecdsa_with_sha256,	/* 1.2.840.10045.4.3.2 */
-- 
2.25.4

