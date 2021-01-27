Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41900305B9C
	for <lists+keyrings@lfdr.de>; Wed, 27 Jan 2021 13:38:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343607AbhA0Mh6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Jan 2021 07:37:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21240 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343521AbhA0Mex (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Jan 2021 07:34:53 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10RCVPdf155394;
        Wed, 27 Jan 2021 07:34:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=190U7YO5U37cBKzA+7A2pZbX+zJ2W+2fQfdGyg1LzAc=;
 b=s6x+wREz+wUYVKnUHSRXs6omQwDKVjFbWYdKx/c8PC6NmjOVY3mHqfHKsB3eWpVN8nW1
 ncTiYcy0mqB1OKMZCAnZKVSn7hMYNlUZVBP9sabD9LKLhovhyrKwa3SEa8YcEEPW1mzX
 RNQfrH1kZgJ6mKY3JDUHaXrg9LWEzXREtyZrdS/Ag6Qs8R32biDV7nxS1i2hXMMe919f
 HuPwZjcq5stjZt73pdSvoahyAajUvl/HdCIxkEKdNTbPwnKUaDBzlp6pt5+QXyNY0r17
 OUwZDlem19AxjQVjvL29uKANCc3P/cDlOzQ1ZJkccHqnJMd24ltmHp0+owmswj3YMmNV sA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36b5t43vty-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 07:34:00 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10RCVZ15155770;
        Wed, 27 Jan 2021 07:33:59 -0500
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36b5t43vsp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 07:33:59 -0500
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
        by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10RCWdqY010801;
        Wed, 27 Jan 2021 12:33:56 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma03dal.us.ibm.com with ESMTP id 368be9ckhk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 12:33:56 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10RCXtO527918648
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Jan 2021 12:33:55 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6C037136055;
        Wed, 27 Jan 2021 12:33:55 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B3194136059;
        Wed, 27 Jan 2021 12:33:54 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed, 27 Jan 2021 12:33:54 +0000 (GMT)
From:   Stefan Berger <stefanb@linux.vnet.ibm.com>
To:     dhowells@redhat.com, keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, linux-crypto@vger.kernel.org,
        patrick@puiterwijk.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v3 3/3] x509: Add support for NIST p192 keys in certificates and akcipher
Date:   Wed, 27 Jan 2021 07:33:50 -0500
Message-Id: <20210127123350.817593-4-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210127123350.817593-1-stefanb@linux.vnet.ibm.com>
References: <20210127123350.817593-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-27_05:2021-01-27,2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270067
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
index 98577ed99aaf..0690c37f74e3 100644
--- a/crypto/ecc.c
+++ b/crypto/ecc.c
@@ -1813,13 +1813,47 @@ static struct akcipher_alg ecc_nist_p256 = {
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

