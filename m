Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D95CD305B99
	for <lists+keyrings@lfdr.de>; Wed, 27 Jan 2021 13:38:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237944AbhA0Mhs (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 27 Jan 2021 07:37:48 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19704 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343518AbhA0Mex (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 27 Jan 2021 07:34:53 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10RCVNDd134379;
        Wed, 27 Jan 2021 07:33:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=IGrrrNYvITiLLwmEvTEKqx9468YFWQGSYuHwIhpwLD8=;
 b=IMo2Fp2US9fM9hoT7kBc4GkdOyRzCcxVLyIgPRy8gYPlsG9PRMmBrFUyDYgIIsMjMfPk
 fAoBqM/PNmd++7cFq0kSocNNYALsOYz80fkb49lbg6PqGH+Mn2cUUfu8oX5lSEPF969M
 plE+3ZeNM7mOZR8fqttGmnUXrPUr/WiX3bqrMcVkRhyrpCpuxf9olEVN9CBvC8CejYhL
 E+qU5SWXbm0jBScv6D3zbhjEClQDQN/kMGyh10z/sTbsM9bSjBXYT7v5Aqe/MyMle4jI
 pJ5qy89PF1cSplfy7qDHJYSXrMOVJx91oVsXbql8zrf4ziNop1JGM4WknnLeeT+oSZHK HQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36ayn8dbq1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 07:33:55 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10RCVYf0135008;
        Wed, 27 Jan 2021 07:33:54 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36ayn8dbpq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 07:33:54 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
        by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10RCWnR3002862;
        Wed, 27 Jan 2021 12:33:53 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
        by ppma05wdc.us.ibm.com with ESMTP id 36a3qbve97-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 12:33:53 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10RCXqT937749046
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Jan 2021 12:33:53 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D5CCC136059;
        Wed, 27 Jan 2021 12:33:52 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 282F113604F;
        Wed, 27 Jan 2021 12:33:52 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Wed, 27 Jan 2021 12:33:51 +0000 (GMT)
From:   Stefan Berger <stefanb@linux.vnet.ibm.com>
To:     dhowells@redhat.com, keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, linux-crypto@vger.kernel.org,
        patrick@puiterwijk.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v3 0/3] Add support for x509 certs with NIST p256 and p192 keys
Date:   Wed, 27 Jan 2021 07:33:47 -0500
Message-Id: <20210127123350.817593-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-27_05:2021-01-27,2021-01-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270067
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Stefan Berger <stefanb@linux.ibm.com>

This series of patches adds support for x509 certificates signed by a CA
that uses NIST p256 or p192 keys for signing. It also adds support for
certificates where the public key is a NIST p256 or p192 key. The math
for ECDSA signature verification is also added.

Since self-signed certificates are verified upon loading, the following
script can be used for testing:

k=$(keyctrl newring test @u)

while :; do
	for hash in sha1 sha224 sha256 sha384 sha512; do
		openssl req \
			-x509 \
			-${hash} \
			-newkey ec \
			-pkeyopt ec_paramgen_curve:prime256v1 \
			-keyout key.pem \
			-days 365 \
			-subj '/CN=test' \
			-nodes \
			-outform der \
			-out cert.der
		keyctl padd asymmetric testkey $k < cert.der
		if [ $? -ne 0 ]; then
			echo "ERROR"
			exit 1
		fi
	done
done

It also works with restricted keyrings where an RSA key is used to sign
a NIST P256/P192 key. Scripts for testing are here:

https://github.com/stefanberger/eckey-testing

The ECDSA signature verification will be used by IMA Appraisal where ECDSA
file signatures stored in RPM packages will use substantially less space
than if RSA signatures were to be used.

   Stefan

v2->v3:
  - patch 2 now includes linux/scatterlist.h

v1->v2:
  - using faster vli_sub rather than newly added vli_mod_fast to 'reduce'
    result
  - rearranged switch statements to follow after RSA
  - 3rd patch from 1st posting is now 1st patch

Stefan Berger (3):
  x509: Detect sm2 keys by their parameters OID
  x509: Add support for parsing x509 certs with NIST p256 keys
  x509: Add support for NIST p192 keys in certificates and akcipher

 crypto/Makefile                           |   9 +-
 crypto/asymmetric_keys/public_key.c       |  19 ++
 crypto/asymmetric_keys/x509_cert_parser.c |  45 ++-
 crypto/ecc.c                              | 318 ++++++++++++++++++++++
 crypto/ecc.h                              |   2 +
 crypto/ecc_curve_defs.h                   |   4 +
 crypto/eccsignature.asn1                  |   4 +
 include/linux/oid_registry.h              |   6 +
 8 files changed, 404 insertions(+), 3 deletions(-)
 create mode 100644 crypto/eccsignature.asn1

-- 
2.25.4

