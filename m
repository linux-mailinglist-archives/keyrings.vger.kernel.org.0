Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1FF64010F
	for <lists+keyrings@lfdr.de>; Fri,  2 Dec 2022 08:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232366AbiLBHeT (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 2 Dec 2022 02:34:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232280AbiLBHeS (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 2 Dec 2022 02:34:18 -0500
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5687DA68
        for <keyrings@vger.kernel.org>; Thu,  1 Dec 2022 23:34:17 -0800 (PST)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
        by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B27O7pc014483;
        Fri, 2 Dec 2022 07:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=tgUgF5lPd56uBk7KX6AMEy7QkqlFqII7FeXMQNDpN1M=;
 b=D/psSlyiN6XuPO73JKSRzWmKTrRahx0m77ekFfTETzOpdfXxIc7eM3Y6kwSCJzSLOt+P
 jbRaTOALnMB7HZp0Zi9+gVKoljCH+DeNYCUEpoe5zfSu0RypMz7iSiyF8N0asNUf8REo
 UvuLU+kUtytMJw19Q4v609sBzCfMlJ5KaBwoqcxSV8OxafxhvXhlhTi1eAsjB6ddhmYo
 5Aci2uGM19cCS7RYfvkf5bf8RITrzhwU4fYORH62m11sZ5qAngOU7zilW3LyIiS8+MxN
 WtQuFo+t5I6vgfvx6ZBGGq5S1R6kvKWl2tNk3QRj70yoK97UtkmidyBIgnonR8l7eVi3 KA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
        by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m39sbw3pq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Fri, 02 Dec 2022 07:34:15 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 1 Dec 2022 23:34:14 -0800
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 1 Dec 2022 23:34:13 -0800
From:   <changqing.li@windriver.com>
To:     <keyrings@vger.kernel.org>, <dhowells@redhat.com>
CC:     <changqing.li@windriver.com>
Subject: [PATCH] tests/toolbox.inc.sh: update regex for getting endian
Date:   Fri, 2 Dec 2022 15:34:12 +0800
Message-ID: <20221202073412.90239-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: D8IQdVb6uDd0UaneFNXQ5ZowK34pZ2AT
X-Proofpoint-ORIG-GUID: D8IQdVb6uDd0UaneFNXQ5ZowK34pZ2AT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-02_04,2022-12-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 suspectscore=0 mlxlogscore=918 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212020057
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Changqing Li <changqing.li@windriver.com>

Update regex for get endian to following condition:
/proc/777/exe: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 tests/toolbox.inc.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/toolbox.inc.sh b/tests/toolbox.inc.sh
index 609a6c7..b1943a1 100644
--- a/tests/toolbox.inc.sh
+++ b/tests/toolbox.inc.sh
@@ -13,10 +13,10 @@
 echo === $OUTPUTFILE ===
 
 endian=`file -L /proc/$$/exe`
-if expr "$endian" : '.* MSB \+\(pie executable\|executable\|shared object\).*' >&/dev/null
+if expr "$endian" : '.* MSB .*\(pie executable\|executable\|shared object\).*' >&/dev/null
 then
     endian=BE
-elif expr "$endian" : '.* LSB \+\(pie executable\|executable\|shared object\).*' >&/dev/null
+elif expr "$endian" : '.* LSB .*\(pie executable\|executable\|shared object\).*' >&/dev/null
 then
     endian=LE
 else
-- 
2.37.1

