Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E89714C829
	for <lists+keyrings@lfdr.de>; Wed, 29 Jan 2020 10:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726010AbgA2Jgm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 29 Jan 2020 04:36:42 -0500
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:62076 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726401AbgA2Jgl (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 29 Jan 2020 04:36:41 -0500
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
        by mx0a-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00T9YTAa022886;
        Wed, 29 Jan 2020 09:36:29 GMT
Received: from g9t5008.houston.hpe.com (g9t5008.houston.hpe.com [15.241.48.72])
        by mx0a-002e3701.pphosted.com with ESMTP id 2xttcnn9gh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 29 Jan 2020 09:36:29 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g9t5008.houston.hpe.com (Postfix) with ESMTP id 01FDD57;
        Wed, 29 Jan 2020 09:36:28 +0000 (UTC)
Received: from blofly.tw.rdlabs.hpecorp.net (blofly.tw.rdlabs.hpecorp.net [15.119.208.30])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id 814134F;
        Wed, 29 Jan 2020 09:36:27 +0000 (UTC)
From:   Clay Chang <clayc@hpe.com>
To:     dhowells@redhat.com, dwmw2@infradead.org
Cc:     keyrings@vger.kernel.org, Clay Chang <clayc@hpe.com>
Subject: [PATCH] KEYS: check the certfile for ASN1 encoding before inserting
Date:   Wed, 29 Jan 2020 17:36:12 +0800
Message-Id: <20200129093612.16889-1-clayc@hpe.com>
X-Mailer: git-send-email 2.16.6
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-29_01:2020-01-28,2020-01-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=412
 phishscore=0 mlxscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1911200001 definitions=main-2001290077
Sender: keyrings-owner@vger.kernel.org
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The certfile to be inserted into the kernel must be in ASN1 encoding.
This patch implements a guard against invalid certfile.

Signed-off-by: Clay Chang <clayc@hpe.com>
---
 scripts/insert-sys-cert.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/insert-sys-cert.c b/scripts/insert-sys-cert.c
index 8902836c2342..2d9139887ba0 100644
--- a/scripts/insert-sys-cert.c
+++ b/scripts/insert-sys-cert.c
@@ -311,6 +311,11 @@ int main(int argc, char **argv)
 	if (!cert)
 		exit(EXIT_FAILURE);
 
+	if (cert[0] != 0x30 && cert[1] != 0x82) {
+		err("Invalid certfile.\n");
+		exit(EXIT_FAILURE);
+	}
+
 	hdr = map_file(vmlinux_file, &vmlinux_size);
 	if (!hdr)
 		exit(EXIT_FAILURE);
-- 
2.16.6

