Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E901578C71
	for <lists+keyrings@lfdr.de>; Mon, 18 Jul 2022 23:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234619AbiGRVHN (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Mon, 18 Jul 2022 17:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235930AbiGRVHL (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Mon, 18 Jul 2022 17:07:11 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080F13244F;
        Mon, 18 Jul 2022 14:07:09 -0700 (PDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IKq8Xf002412;
        Mon, 18 Jul 2022 21:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tb/BsOHioLaCvkGd4+8+MRISiZKeBQb87J3hWk7sLS8=;
 b=owUPGptU80yFvQGhJl4YzLoH1NKiHlCRi2VSxWIfo0+2h0qCsaGYa68ZNKRVXG7tW6pW
 TB2NF+54ZXpckBSJVfEtiKauZBIghvAB152M8eprWLNQPb3LhdHS+3V84hz4nxhvG7JQ
 93LI4so5ASCdOimhheQmce4lPbOMAbsl+nIS9KFHMtqztObC+NjhnvWUNBS5fy6AWxeW
 mOGK6cqZmK4QFR33f+07xKGx6cJQEyglxt/Bk0sqAv2JNX6GiSDVag8JzWwyg6kT9IW9
 4efrUMt2BQU9gHMUaj1Si4lca22cp/drrJWchE9qliMu7Laws+g/2F9GsI+31g1LXlzD NQ== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hdexb0a50-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 21:07:05 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26IKwAZ3036314;
        Mon, 18 Jul 2022 21:07:05 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hdexb0a4c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 21:07:05 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26IKpQfC002668;
        Mon, 18 Jul 2022 21:02:04 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
        by ppma02dal.us.ibm.com with ESMTP id 3hbmy9axc5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 18 Jul 2022 21:02:04 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26IL237F24183258
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Jul 2022 21:02:03 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1A290C6059;
        Mon, 18 Jul 2022 21:02:03 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4223AC605D;
        Mon, 18 Jul 2022 21:02:02 +0000 (GMT)
Received: from rhel-laptop.ibm.com.com (unknown [9.160.81.14])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon, 18 Jul 2022 21:02:02 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     linux-block@vger.kernel.org
Cc:     keyrings@vger.kernel.org, dhowells@redhat.com, jarkko@kernel.org,
        jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com,
        greg@gilhooley.com, gjoyce@ibm.com
Subject: [PATCH 4/4] arch_vars: create arch specific permanent store
Date:   Mon, 18 Jul 2022 16:01:56 -0500
Message-Id: <20220718210156.1535955-5-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
References: <20220718210156.1535955-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vHjccvSCUvosNSc4r0yOYkBy0xjJT7m9
X-Proofpoint-ORIG-GUID: uKak-wVgjsMSFjymcB6e6EZzdMQcJDr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_20,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 mlxscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207180088
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Platforms that have a permanent key store may provide unique
platform dependent functions to read/write variables. The
default (weak) functions return -EOPNOTSUPP unless overridden
by architecture/platform versions.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
---
 include/linux/arch_vars.h | 23 +++++++++++++++++++++++
 lib/Makefile              |  2 +-
 lib/arch_vars.c           | 25 +++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/arch_vars.h
 create mode 100644 lib/arch_vars.c

diff --git a/include/linux/arch_vars.h b/include/linux/arch_vars.h
new file mode 100644
index 000000000000..9c280ff9432e
--- /dev/null
+++ b/include/linux/arch_vars.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Platform variable opearations.
+ *
+ * Copyright (C) 2022 IBM Corporation
+ *
+ * These are the accessor functions (read/write) for architecture specific
+ * variables. Specific architectures can provide overrides.
+ *
+ */
+
+#include <linux/kernel.h>
+
+enum arch_variable_type {
+	ARCH_VAR_OPAL_KEY      = 0,     /* SED Opal Authentication Key */
+	ARCH_VAR_OTHER         = 1,     /* Other type of variable */
+	ARCH_VAR_MAX           = 1,     /* Maximum type value */
+};
+
+int arch_read_variable(enum arch_variable_type type, char *varname,
+		       void *varbuf, u_int *varlen);
+int arch_write_variable(enum arch_variable_type type, char *varname,
+			void *varbuf, u_int varlen);
diff --git a/lib/Makefile b/lib/Makefile
index f99bf61f8bbc..b90c4cb0dbbb 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -48,7 +48,7 @@ obj-y += bcd.o sort.o parser.o debug_locks.o random32.o \
 	 bsearch.o find_bit.o llist.o memweight.o kfifo.o \
 	 percpu-refcount.o rhashtable.o \
 	 once.o refcount.o usercopy.o errseq.o bucket_locks.o \
-	 generic-radix-tree.o
+	 generic-radix-tree.o arch_vars.o
 obj-$(CONFIG_STRING_SELFTEST) += test_string.o
 obj-y += string_helpers.o
 obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o
diff --git a/lib/arch_vars.c b/lib/arch_vars.c
new file mode 100644
index 000000000000..e6f16d7d09c1
--- /dev/null
+++ b/lib/arch_vars.c
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Platform variable operations.
+ *
+ * Copyright (C) 2022 IBM Corporation
+ *
+ * These are the accessor functions (read/write) for architecture specific
+ * variables. Specific architectures can provide overrides.
+ *
+ */
+
+#include <linux/kernel.h>
+#include <linux/arch_vars.h>
+
+int __weak arch_read_variable(enum arch_variable_type type, char *varname,
+			      void *varbuf, u_int *varlen)
+{
+	return -EOPNOTSUPP;
+}
+
+int __weak arch_write_variable(enum arch_variable_type type, char *varname,
+			       void *varbuf, u_int varlen)
+{
+	return -EOPNOTSUPP;
+}
-- 
2.27.0

