Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87A6C305079
	for <lists+keyrings@lfdr.de>; Wed, 27 Jan 2021 05:10:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233593AbhA0EKU (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Jan 2021 23:10:20 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:65310 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2395233AbhAZTMT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 26 Jan 2021 14:12:19 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10QJ1Xkb076035;
        Tue, 26 Jan 2021 14:11:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=sigtRxcd2FME8yadU5aWQfSDBgsJlGfepDO9gFD1khI=;
 b=s35ICghB3gT4W1wUBiam9O16eJZe2THQdFPT5s3hbG9dK2qqT6fwx/2XnuHJ4vzVKUjH
 jnIVWUmqOAD/Nh2oTxlMydkIGns6SrKzLi+9bajSf2cPxZjfX22dbghitAIarjMcQLnO
 xBErrDc/ZecU8/zVrs7onCHjygMCDLJcxqH9bXS3iTfCOyS1PSNoZO5TWcP070wDoJWW
 16qH9cwYUh7SOcovqAQzwGIIq02KhOdi7oU0ZVkiS3Fit5c4hjM7bg2Wbs1US5ezXUXa
 hxFuM3lkETJoTB7HawZN6lzx/326LIiDiXPZD0YYmCBjRsM68xXZSH5vrjfSkoy6zT/B ew== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36apmqv81y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 14:11:24 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10QJ2sOB080479;
        Tue, 26 Jan 2021 14:11:24 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36apmqv81m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 14:11:24 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QJ36ee027883;
        Tue, 26 Jan 2021 19:11:23 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
        by ppma04dal.us.ibm.com with ESMTP id 36agvekssm-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 19:11:23 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10QJBMDk25166310
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 19:11:22 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 30741136051;
        Tue, 26 Jan 2021 19:11:22 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 933DE136055;
        Tue, 26 Jan 2021 19:11:21 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue, 26 Jan 2021 19:11:21 +0000 (GMT)
From:   Stefan Berger <stefanb@linux.vnet.ibm.com>
To:     dhowells@redhat.com, keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, linux-crypto@vger.kernel.org,
        patrick@puiterwijk.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v2 0/3] Add support for x509 certs with NIST p256 and p192 keys
Date:   Tue, 26 Jan 2021 14:11:12 -0500
Message-Id: <20210126191115.434842-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-26_10:2021-01-26,2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2101260096
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

keyctrl newring test @u

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
		keyctl padd asymmetric testkey %keyring:test < cert.der
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
 crypto/ecc.c                              | 317 ++++++++++++++++++++++
 crypto/ecc.h                              |   2 +
 crypto/ecc_curve_defs.h                   |   4 +
 crypto/eccsignature.asn1                  |   4 +
 include/linux/oid_registry.h              |   6 +
 8 files changed, 403 insertions(+), 3 deletions(-)
 create mode 100644 crypto/eccsignature.asn1

-- 
2.25.4

