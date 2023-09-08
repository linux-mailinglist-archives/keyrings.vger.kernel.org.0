Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12FCE798A01
	for <lists+keyrings@lfdr.de>; Fri,  8 Sep 2023 17:31:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjIHPbd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 8 Sep 2023 11:31:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244617AbjIHPbc (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 8 Sep 2023 11:31:32 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0690719BA;
        Fri,  8 Sep 2023 08:31:27 -0700 (PDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 388FMees007511;
        Fri, 8 Sep 2023 15:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=37EaSG+hZvHYJwP2Wv/sAvBnjYP7N9fep/NmZebZ+VQ=;
 b=L6reSzHY0uELaabxIP1hQeKLVwejf/ScVDCGOFsBZ4eKapC8uw1RGApD/1n8dmq3cRIw
 8lfGKhUtNkz+6GsmREXohBlQl5icCoFBQcILKOTaXjixIpjmM4+p9ES50mKYytn5NgX1
 txbxe6aDavY3xATHCNS4nTMIAbMnO7Gc+eJFt110FE2A3uD7hqVJSiStQwoXdNPkla7J
 GxtHjtteeWephNXrZhMR9vhTywDyEVwKS17Vv5FkvytoWhZRNYhkRIYInDpxnRXZXUpR
 z1U1GLbNETc5beyNERGTMv0ArYxH9xUnjJCXQF5O2jXxMh9BxJbjhmwO9aqjDPkX7h1Z zw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t066v86qx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Sep 2023 15:31:01 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
        by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 388EuAsw001603;
        Fri, 8 Sep 2023 15:31:00 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
        by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svfctcya3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Sep 2023 15:31:00 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
        by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 388FUxam34538090
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 8 Sep 2023 15:30:59 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 54B445805B;
        Fri,  8 Sep 2023 15:30:59 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B55025805F;
        Fri,  8 Sep 2023 15:30:58 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.45.202])
        by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
        Fri,  8 Sep 2023 15:30:58 +0000 (GMT)
From:   gjoyce@linux.vnet.ibm.com
To:     linux-block@vger.kernel.org, axboe@kernel.dk, jarkko@kernel.org
Cc:     linuxppc-dev@lists.ozlabs.org, jonathan.derrick@linux.dev,
        brking@linux.vnet.ibm.com, msuchanek@suse.de, mpe@ellerman.id.au,
        nayna@linux.ibm.com, akpm@linux-foundation.org,
        gjoyce@linux.vnet.ibm.com, keyrings@vger.kernel.org
Subject: [PATCH v7 3/3 RESEND] powerpc/pseries: PLPKS SED Opal keystore support
Date:   Fri,  8 Sep 2023 10:30:56 -0500
Message-Id: <20230908153056.3503975-4-gjoyce@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
References: <20230908153056.3503975-1-gjoyce@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HlaN4zN7a0yk0VhQ8uc4AVnsQZAOhrfn
X-Proofpoint-GUID: HlaN4zN7a0yk0VhQ8uc4AVnsQZAOhrfn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-08_12,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309080139
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

From: Greg Joyce <gjoyce@linux.vnet.ibm.com>

Define operations for SED Opal to read/write keys
from POWER LPAR Platform KeyStore(PLPKS). This allows
non-volatile storage of SED Opal keys.

Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
Reviewed-by: Jonathan Derrick <jonathan.derrick@linux.dev>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 arch/powerpc/platforms/pseries/Kconfig        |   6 +
 arch/powerpc/platforms/pseries/Makefile       |   1 +
 .../powerpc/platforms/pseries/plpks_sed_ops.c | 114 ++++++++++++++++++
 block/Kconfig                                 |   1 +
 4 files changed, 122 insertions(+)
 create mode 100644 arch/powerpc/platforms/pseries/plpks_sed_ops.c

diff --git a/arch/powerpc/platforms/pseries/Kconfig b/arch/powerpc/platforms/pseries/Kconfig
index 4ebf2ef2845d..afc0f6a61337 100644
--- a/arch/powerpc/platforms/pseries/Kconfig
+++ b/arch/powerpc/platforms/pseries/Kconfig
@@ -164,6 +164,12 @@ config PSERIES_PLPKS
 	# This option is selected by in-kernel consumers that require
 	# access to the PKS.
 
+config PSERIES_PLPKS_SED
+	depends on PPC_PSERIES
+	bool
+	# This option is selected by in-kernel consumers that require
+	# access to the SED PKS keystore.
+
 config PAPR_SCM
 	depends on PPC_PSERIES && MEMORY_HOTPLUG && LIBNVDIMM
 	tristate "Support for the PAPR Storage Class Memory interface"
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 53c3b91af2f7..1476c5e4433c 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_PPC_SVM)		+= svm.o
 obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
 obj-$(CONFIG_PSERIES_PLPKS)	+= plpks.o
 obj-$(CONFIG_PPC_SECURE_BOOT)	+= plpks-secvar.o
+obj-$(CONFIG_PSERIES_PLPKS_SED)	+= plpks_sed_ops.o
 obj-$(CONFIG_SUSPEND)		+= suspend.o
 obj-$(CONFIG_PPC_VAS)		+= vas.o vas-sysfs.o
 
diff --git a/arch/powerpc/platforms/pseries/plpks_sed_ops.c b/arch/powerpc/platforms/pseries/plpks_sed_ops.c
new file mode 100644
index 000000000000..c1d08075e850
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/plpks_sed_ops.c
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * POWER Platform specific code for non-volatile SED key access
+ * Copyright (C) 2022 IBM Corporation
+ *
+ * Define operations for SED Opal to read/write keys
+ * from POWER LPAR Platform KeyStore(PLPKS).
+ *
+ * Self Encrypting Drives(SED) key storage using PLPKS
+ */
+
+#include <linux/kernel.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/ioctl.h>
+#include <linux/sed-opal-key.h>
+#include <asm/plpks.h>
+
+/*
+ * structure that contains all SED data
+ */
+struct plpks_sed_object_data {
+	u_char version;
+	u_char pad1[7];
+	u_long authority;
+	u_long range;
+	u_int  key_len;
+	u_char key[32];
+};
+
+#define PLPKS_SED_OBJECT_DATA_V0        0
+#define PLPKS_SED_MANGLED_LABEL         "/default/pri"
+#define PLPKS_SED_COMPONENT             "sed-opal"
+#define PLPKS_SED_KEY                   "opal-boot-pin"
+
+/*
+ * authority is admin1 and range is global
+ */
+#define PLPKS_SED_AUTHORITY  0x0000000900010001
+#define PLPKS_SED_RANGE      0x0000080200000001
+
+void plpks_init_var(struct plpks_var *var, char *keyname)
+{
+	var->name = keyname;
+	var->namelen = strlen(keyname);
+	if (strcmp(PLPKS_SED_KEY, keyname) == 0) {
+		var->name = PLPKS_SED_MANGLED_LABEL;
+		var->namelen = strlen(keyname);
+	}
+	var->policy = PLPKS_WORLDREADABLE;
+	var->os = PLPKS_VAR_COMMON;
+	var->data = NULL;
+	var->datalen = 0;
+	var->component = PLPKS_SED_COMPONENT;
+}
+
+/*
+ * Read the SED Opal key from PLPKS given the label
+ */
+int sed_read_key(char *keyname, char *key, u_int *keylen)
+{
+	struct plpks_var var;
+	struct plpks_sed_object_data data;
+	int ret;
+	u_int len;
+
+	plpks_init_var(&var, keyname);
+	var.data = (u8 *)&data;
+	var.datalen = sizeof(data);
+
+	ret = plpks_read_os_var(&var);
+	if (ret != 0)
+		return ret;
+
+	len = min_t(u16, be32_to_cpu(data.key_len), var.datalen);
+	memcpy(key, data.key, len);
+	key[len] = '\0';
+	*keylen = len;
+
+	return 0;
+}
+
+/*
+ * Write the SED Opal key to PLPKS given the label
+ */
+int sed_write_key(char *keyname, char *key, u_int keylen)
+{
+	struct plpks_var var;
+	struct plpks_sed_object_data data;
+	struct plpks_var_name vname;
+
+	plpks_init_var(&var, keyname);
+
+	var.datalen = sizeof(struct plpks_sed_object_data);
+	var.data = (u8 *)&data;
+
+	/* initialize SED object */
+	data.version = PLPKS_SED_OBJECT_DATA_V0;
+	data.authority = cpu_to_be64(PLPKS_SED_AUTHORITY);
+	data.range = cpu_to_be64(PLPKS_SED_RANGE);
+	memset(&data.pad1, '\0', sizeof(data.pad1));
+	data.key_len = cpu_to_be32(keylen);
+	memcpy(data.key, (char *)key, keylen);
+
+	/*
+	 * Key update requires remove first. The return value
+	 * is ignored since it's okay if the key doesn't exist.
+	 */
+	vname.namelen = var.namelen;
+	vname.name = var.name;
+	plpks_remove_var(var.component, var.os, vname);
+
+	return plpks_write_var(var);
+}
diff --git a/block/Kconfig b/block/Kconfig
index 77f72175eb72..0375d2abf7a6 100644
--- a/block/Kconfig
+++ b/block/Kconfig
@@ -185,6 +185,7 @@ config BLK_SED_OPAL
 	bool "Logic for interfacing with Opal enabled SEDs"
 	depends on KEYS
 	select PSERIES_PLPKS if PPC_PSERIES
+	select PSERIES_PLPKS_SED if PPC_PSERIES
 	help
 	Builds Logic for interfacing with Opal enabled controllers.
 	Enabling this option enables users to setup/unlock/lock
-- 
gjoyce@linux.vnet.ibm.com

