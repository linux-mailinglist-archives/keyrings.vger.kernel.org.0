Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90398305073
	for <lists+keyrings@lfdr.de>; Wed, 27 Jan 2021 05:10:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237133AbhA0EJ6 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 26 Jan 2021 23:09:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60000 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731183AbhAZRF0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 26 Jan 2021 12:05:26 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 10QH2lnF142817;
        Tue, 26 Jan 2021 12:04:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=lQXCXlAY16ryEQoXpRWuEDcQKmEETRmymadtYc+qZrs=;
 b=C/KlOrKJtLTy6EcLuJ1+SlqtkB2GgV4SdHTI+0+d6Ax8GqTIFBd9js3oxdPMhzQdpcUA
 F5qQX5Y1Ir70lyLAhpNp39KlbF92nAdJhvZuSJL/ZcXGFLkqS4uEM/DKY6U6kiXSy+X5
 UXdjGA48LmloJNB1UYe2OeAm7h3n9OUCe/1tWagCKOGtnTCfLjYWIU0T4j3wonZxh24Q
 UwT/VwEZ4uRQ98pkYrHGzT2Nrg3LIyFQP4YnSEfkFfwUELaCkUQP3dRD60S4fj2L9c3p
 0wePGH5w2ZTvPhYP+gum/UKIdvaSckD5MorqJFwxsW+2yufBbeZHSY+/Ny6CvMJA67ro 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36apuf8h6b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 12:04:06 -0500
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10QH3Oar146027;
        Tue, 26 Jan 2021 12:04:05 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
        by mx0b-001b2d01.pphosted.com with ESMTP id 36apuf8h5w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 12:04:05 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
        by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10QGvucH010073;
        Tue, 26 Jan 2021 17:04:05 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma01wdc.us.ibm.com with ESMTP id 36a8uh4qy2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 26 Jan 2021 17:04:05 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 10QH42Ei31064556
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 26 Jan 2021 17:04:02 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 21FA4124058;
        Tue, 26 Jan 2021 17:04:02 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 128E9124052;
        Tue, 26 Jan 2021 17:04:02 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue, 26 Jan 2021 17:04:01 +0000 (GMT)
From:   Stefan Berger <stefanb@linux.vnet.ibm.com>
To:     dhowells@redhat.com, keyrings@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
        davem@davemloft.net, linux-crypto@vger.kernel.org,
        patrick@puiterwijk.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH 0/3] Add support for x509 certs with NIST p256 and p192 keys
Date:   Tue, 26 Jan 2021 12:03:56 -0500
Message-Id: <20210126170359.363969-1-stefanb@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-26_09:2021-01-26,2021-01-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101260086
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
a NIST P256/P192 key:



The ECDSA signature verification will be used by IMA Appraisal where ECDSA
file signatures stored in RPM packages will use substantially less space
than if RSA signatures were to be used.

   Stefan

Stefan Berger (3):
  x509: Add support for parsing x509 certs with NIST p256 keys
  x509: Add support for NIST p192 keys in certificates and akcipher
  x509: Detect sm2 keys by their parameters OID

 crypto/Makefile                           |   9 +-
 crypto/asymmetric_keys/public_key.c       |  19 ++
 crypto/asymmetric_keys/x509_cert_parser.c |  45 ++-
 crypto/ecc.c                              | 331 ++++++++++++++++++++++
 crypto/ecc.h                              |   2 +
 crypto/ecc_curve_defs.h                   |   4 +
 crypto/eccsignature.asn1                  |   4 +
 include/linux/oid_registry.h              |   6 +
 8 files changed, 417 insertions(+), 3 deletions(-)
 create mode 100644 crypto/eccsignature.asn1

-- 
2.25.4

