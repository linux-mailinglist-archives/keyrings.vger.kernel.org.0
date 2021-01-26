Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 201D5305072
	for <lists+keyrings@lfdr.de>; Wed, 27 Jan 2021 05:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233297AbhA0EJ4 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Jan 2021 23:09:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31948 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731168AbhAZRFZ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 26 Jan 2021 12:05:25 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10QH3OSq062665;
        Tue, 26 Jan 2021 12:04:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nH/KOZhxc3+G7TQa160noAJ40uv2p4KujvCr5h12ylM=;
 b=dvqirsDLHFTyFZfjYzvyyoOyVp14UngJV/L5rsRZ2hBKwD2bmtmwYdDt5nJPkEMUD/G/
 MKUVL6LJkWMgwgxwItUfEE+gGzgD4lWBkqQgvtl/si5YqucO3X8/Lb5gv+KKubRfPmdU
 UTIb5kvgYNiStPVeH6KIVt7vkkwWv+/J4CcQsFOkb7+eC0kQFVwusy5wwgBFe+SKs5nH
 PH8GD79jK//9q/QlmxIUywp2aNacZSLoru5RuHPg8m6B97tLLei667a9QS6NkmhSzblq
 6Y2IU6uhP4aL8cImVovFJRmHZaD4Xk7TceBRCTv2iocXkvy+8iqLPj6nbapeYg+Q69RN UA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36apv08hch-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 12:04:04 -0500
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10QH3VHH063558;
        Tue, 26 Jan 2021 12:04:04 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36apv08hbp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 12:04:04 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QGvlMA010029;
        Tue, 26 Jan 2021 17:04:02 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma03wdc.us.ibm.com with ESMTP id 36a0t2fpqy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 17:04:02 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10QH42Rc31064562
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 17:04:02 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 5E56D124053;
        Tue, 26 Jan 2021 17:04:02 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 58DCE124058;
        Tue, 26 Jan 2021 17:04:02 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 26 Jan 2021 17:04:02 +0000 (GMT)
From:   Stefan Berger <stefanb@linux.vnet.ibm.com>
To:     dhowells@redhat.com, keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, linux-crypto@vger.kernel.org,
        patrick@puiterwijk.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 2/3] x509: Add support for NIST p192 keys in certificates and akcipher
Date:   Tue, 26 Jan 2021 12:03:58 -0500
Message-Id: <20210126170359.363969-3-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210126170359.363969-1-stefanb@linux.vnet.ibm.com>
References: <20210126170359.363969-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-26_09:2021-01-26,2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260088
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
index 44bae5ccb475..720cc7977077 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -501,6 +501,7 @@ int x509_extract_key_data(void *context, size_t hdrlen,
 			enum OID oid = look_up_OID(ctx->params + 2,
 						   ctx->params_size - 2);
 			switch (oid) {
+			case OID_id_prime192v1:
 			case OID_id_prime256v1:
 				ctx->cert->pub->pkey_algo = "ecdsa";
 				break;
diff --git a/crypto/ecc.c b/crypto/ecc.c
index fb8370720350..79df35a23a61 100644
--- a/crypto/ecc.c
+++ b/crypto/ecc.c
@@ -1826,13 +1826,47 @@ static struct akcipher_alg ecc_nist_p256 = {
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

