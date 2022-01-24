Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54ABA4984ED
	for <lists+keyrings@lfdr.de>; Mon, 24 Jan 2022 17:35:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241044AbiAXQfv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 24 Jan 2022 11:35:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14902 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236102AbiAXQfv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 24 Jan 2022 11:35:51 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OFt5Zh002856
        for <keyrings@vger.kernel.org>; Mon, 24 Jan 2022 16:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Wk7vhwBCxdNbH4TAChdqJ6CbU5AQVw9ePezYoJv0iTc=;
 b=c9VgWzZBeY81e9YKqLQ+8azInFdEnp54HfzumlXZJBBdrmDBsJ1XBkMb1MOe443t8bEv
 n34d/beJN0o+IDijUulAYDKLF2zQwtlGm0wbPkp4fnsF3yObXNUKY9mzSObif5+pLOUO
 /xnX4VJBMfWohFD3UE24kXmdudM5JnckHtTVZb2Zv1NHkykHbb+L3Q4pHq6vZchpkBff
 W2dTKyeClNynm1tK5DecmTCrtEbSceQmqL9bLBSYdY4e8nhdp0zExE2BrSSKJDlWFzQE
 8hMr3PZhiJrrwBRdIlvzz06NPQq2Vdr/QoM0nSR4qMhVSzCXZlkGFrSpUlE57T9Lzfae DA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3dsy5x8vhk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <keyrings@vger.kernel.org>; Mon, 24 Jan 2022 16:35:49 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OGCuln026884
        for <keyrings@vger.kernel.org>; Mon, 24 Jan 2022 16:32:12 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
        by ppma02dal.us.ibm.com with ESMTP id 3dr9ja29wx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
        for <keyrings@vger.kernel.org>; Mon, 24 Jan 2022 16:32:12 +0000
Received: from b03ledav004.gho.boulder.ibm.com (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
        by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 20OGWATW25624958
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 24 Jan 2022 16:32:10 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 27C97780C5;
        Mon, 24 Jan 2022 16:32:09 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 86E1878105;
        Mon, 24 Jan 2022 16:32:08 +0000 (GMT)
Received: from li-85aba201-53f2-11cb-b5ad-ae21909f0c1f.ibm.com (unknown [9.77.149.101])
        by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon, 24 Jan 2022 16:32:08 +0000 (GMT)
From:   Douglas Miller <dougmill@linux.vnet.ibm.com>
To:     keyrings@vger.kernel.org
Cc:     dougmill@linux.vnet.ibm.com, gjoyce@ibm.com
Subject: [PATCH 1/1] keys: Allow access to key_type_lookup()/key_type_put() within kernel.
Date:   Mon, 24 Jan 2022 10:32:00 -0600
Message-Id: <20220124163200.735362-2-dougmill@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220124163200.735362-1-dougmill@linux.vnet.ibm.com>
References: <20220124163200.735362-1-dougmill@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: H50XnflF6F-b7cXm8uB-9YLdpHdo6Yb0
X-Proofpoint-GUID: H50XnflF6F-b7cXm8uB-9YLdpHdo6Yb0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_08,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201240110
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Signed-off-by: Douglas Miller <dougmill@linux.vnet.ibm.com>
---
 include/linux/key-type.h | 2 ++
 security/keys/key.c      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/linux/key-type.h b/include/linux/key-type.h
index 7d985a1dfe4a..868a6fb368f3 100644
--- a/include/linux/key-type.h
+++ b/include/linux/key-type.h
@@ -165,6 +165,8 @@ extern struct key_type key_type_keyring;
 
 extern int register_key_type(struct key_type *ktype);
 extern void unregister_key_type(struct key_type *ktype);
+extern struct key_type *key_type_lookup(const char *type);
+extern void key_type_put(struct key_type *ktype);
 
 extern int key_payload_reserve(struct key *key, size_t datalen);
 extern int key_instantiate_and_link(struct key *key,
diff --git a/security/keys/key.c b/security/keys/key.c
index c45afdd1dfbb..3091fd6d65a7 100644
--- a/security/keys/key.c
+++ b/security/keys/key.c
@@ -719,6 +719,7 @@ struct key_type *key_type_lookup(const char *type)
 found_kernel_type:
 	return ktype;
 }
+EXPORT_SYMBOL(key_type_lookup);
 
 void key_set_timeout(struct key *key, unsigned timeout)
 {
@@ -744,6 +745,7 @@ void key_type_put(struct key_type *ktype)
 {
 	up_read(&key_types_sem);
 }
+EXPORT_SYMBOL(key_type_put);
 
 /*
  * Attempt to update an existing key.
-- 
2.27.0

