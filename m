Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2D6306873
	for <lists+keyrings@lfdr.de>; Thu, 28 Jan 2021 01:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbhA1APW (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Jan 2021 19:15:22 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33372 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231267AbhA1APC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Jan 2021 19:15:02 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10S04gHc194098;
        Wed, 27 Jan 2021 19:14:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GSh8PJ6ofn903tTaSF5pHyAmbQDjE5xRyDbzfGgKTQ0=;
 b=IUZZbxCSouNkwE4INZJJe8+yY/D/DywI8VsVfJjh6M1yzPcYUu4w8BlL3YwGqY5s7K7l
 X7pMZbLUh3ZfSqHGWif70whXUEGrZUei6tnQUC2i2VSIrjT5iZPUtBc1OXZUJr5Ng1Hy
 YWI95JehNDE+Gk0n8Xu2Gs4KJfbs5UfE/6Td5OYdLa2IizcP2do9JXsC8TifxNuSHETN
 4+ak77rIDRIhGDSm0rhnjlEKgpdIr9kGaqj/KbJI3vkt3wLA+fVZbPdyz50pQ47KvC9q
 zuNRczCGbahHvot1qKLbClOYcd9x3Q6CQUrnXvzk+Xz3jACuw2pJJjSlEnsmrujdMsqU eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36b5awku28-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 19:14:19 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10S0Bqov019584;
        Wed, 27 Jan 2021 19:14:18 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36b5awku21-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 19:14:18 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
        by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10S07g3K029361;
        Thu, 28 Jan 2021 00:14:18 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
        by ppma02wdc.us.ibm.com with ESMTP id 36acj9dkwe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Jan 2021 00:14:18 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10S0EHIe27001210
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Jan 2021 00:14:18 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E0268AE05F;
        Thu, 28 Jan 2021 00:14:17 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C77A8AE062;
        Thu, 28 Jan 2021 00:14:17 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 28 Jan 2021 00:14:17 +0000 (GMT)
From:   Stefan Berger <stefanb@linux.vnet.ibm.com>
To:     keyrings@vger.kernel.org, linux-crypto@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, patrick@puiterwijk.org,
        Stefan Berger <stefanb@linux.ibm.com>,
        David Howells <dhowells@redhat.com>
Subject: [PATCH v4 3/3] x509: Add support for parsing x509 certs with ECDSA keys
Date:   Wed, 27 Jan 2021 19:14:12 -0500
Message-Id: <20210128001412.822048-4-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210128001412.822048-1-stefanb@linux.vnet.ibm.com>
References: <20210128001412.822048-1-stefanb@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-27_10:2021-01-27,2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270116
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Stefan Berger <stefanb@linux.ibm.com>

This patch adds support for parsing of x509 certificates that contain
ECDSA keys, such as NIST P256, that have been signed by a CA using any
of the current SHA hash algorithms.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
Cc: David Howells <dhowells@redhat.com>
Cc: keyrings@vger.kernel.org
---
 crypto/asymmetric_keys/public_key.c       | 17 ++++++++++++
 crypto/asymmetric_keys/x509_cert_parser.c | 32 ++++++++++++++++++++++-
 include/linux/oid_registry.h              |  6 +++++
 3 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index 8892908ad58c..cc5d59d2b35d 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -90,6 +90,23 @@ int software_key_determine_akcipher(const char *encoding,
 		return 0;
 	}
 
+	if (strcmp(encoding, "x962") == 0) {
+		enum OID oid;
+
+		if (pkey->paramlen < 2)
+			return -EINVAL;
+
+		oid = look_up_OID(pkey->params + 2, pkey->paramlen - 2);
+		switch (oid) {
+		case OID_id_prime192v1:
+		case OID_id_prime256v1:
+			strcpy(alg_name, "ecdsa");
+			return 0;
+		default:
+			return -EINVAL;
+		}
+	}
+
 	return -ENOPKG;
 }
 
diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_keys/x509_cert_parser.c
index 4643fe5ed69a..5ff891f8235d 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -227,6 +227,26 @@ int x509_note_pkey_algo(void *context, size_t hdrlen,
 		ctx->cert->sig->hash_algo = "sha224";
 		goto rsa_pkcs1;
 
+	case OID_id_ecdsa_with_sha1:
+		ctx->cert->sig->hash_algo = "sha1";
+		goto ecdsa;
+
+	case OID_id_ecdsa_with_sha224:
+		ctx->cert->sig->hash_algo = "sha224";
+		goto ecdsa;
+
+	case OID_id_ecdsa_with_sha256:
+		ctx->cert->sig->hash_algo = "sha256";
+		goto ecdsa;
+
+	case OID_id_ecdsa_with_sha384:
+		ctx->cert->sig->hash_algo = "sha384";
+		goto ecdsa;
+
+	case OID_id_ecdsa_with_sha512:
+		ctx->cert->sig->hash_algo = "sha512";
+		goto ecdsa;
+
 	case OID_gost2012Signature256:
 		ctx->cert->sig->hash_algo = "streebog256";
 		goto ecrdsa;
@@ -255,6 +275,11 @@ int x509_note_pkey_algo(void *context, size_t hdrlen,
 	ctx->cert->sig->encoding = "raw";
 	ctx->algo_oid = ctx->last_oid;
 	return 0;
+ecdsa:
+	ctx->cert->sig->pkey_algo = "ecdsa";
+	ctx->cert->sig->encoding = "x962";
+	ctx->algo_oid = ctx->last_oid;
+	return 0;
 }
 
 /*
@@ -276,7 +301,8 @@ int x509_note_signature(void *context, size_t hdrlen,
 
 	if (strcmp(ctx->cert->sig->pkey_algo, "rsa") == 0 ||
 	    strcmp(ctx->cert->sig->pkey_algo, "ecrdsa") == 0 ||
-	    strcmp(ctx->cert->sig->pkey_algo, "sm2") == 0) {
+	    strcmp(ctx->cert->sig->pkey_algo, "sm2") == 0 ||
+	    strcmp(ctx->cert->sig->pkey_algo, "ecdsa") == 0) {
 		/* Discard the BIT STRING metadata */
 		if (vlen < 1 || *(const u8 *)value != 0)
 			return -EBADMSG;
@@ -479,6 +505,10 @@ int x509_extract_key_data(void *context, size_t hdrlen,
 		case OID_sm2:
 			ctx->cert->pub->pkey_algo = "sm2";
 			break;
+		case OID_id_prime192v1:
+		case OID_id_prime256v1:
+			ctx->cert->pub->pkey_algo = "ecdsa";
+			break;
 		default:
 			return -ENOPKG;
 		}
diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index 4462ed2c18cd..e8071133d0e2 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -21,6 +21,12 @@ enum OID {
 	OID_id_dsa,			/* 1.2.840.10040.4.1 */
 	OID_id_ecdsa_with_sha1,		/* 1.2.840.10045.4.1 */
 	OID_id_ecPublicKey,		/* 1.2.840.10045.2.1 */
+	OID_id_prime192v1,		/* 1.2.840.10045.3.1.1 */
+	OID_id_prime256v1,		/* 1.2.840.10045.3.1.7 */
+	OID_id_ecdsa_with_sha224,	/* 1.2.840.10045.4.3.1 */
+	OID_id_ecdsa_with_sha256,	/* 1.2.840.10045.4.3.2 */
+	OID_id_ecdsa_with_sha384,	/* 1.2.840.10045.4.3.3 */
+	OID_id_ecdsa_with_sha512,	/* 1.2.840.10045.4.3.4 */
 
 	/* PKCS#1 {iso(1) member-body(2) us(840) rsadsi(113549) pkcs(1) pkcs-1(1)} */
 	OID_rsaEncryption,		/* 1.2.840.113549.1.1.1 */
-- 
2.26.2

