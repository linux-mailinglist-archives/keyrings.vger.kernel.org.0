Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3DCE27F310
	for <lists+keyrings@lfdr.de>; Wed, 30 Sep 2020 22:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729813AbgI3UPr (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 30 Sep 2020 16:15:47 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:33918 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728660AbgI3UPq (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 30 Sep 2020 16:15:46 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UK968k027479;
        Wed, 30 Sep 2020 20:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=IxEOgq4WlywNMdlTE5ZZC/146RxyMY0YB+K/R5GilZY=;
 b=DEW5hcn51YZTDbHL2iXs2DTfcVAi/0xW3kmLpi+zC4c44Xf7DRuCGvYDixEM2U59c1Q4
 Upy23LuANqA0jXd3jzG7b304EEk5gDbTxBpH/uEedHmW01/jkyxb/9pHiMqeuaY4M4vO
 ThZIZYvBFBkTIuHiDnruhYh+l69BZnhyhLVTpmwNqiGDAF6RwBdA7sfWKV8U/rO/QY5Y
 a+tZS6TMXuKPELVkwNdNg0Rm+rdGq1Wa66s9gc0vkfPhHXr9YqjyZk5AA8QaObjSL1MJ
 F2EF32LQ/vZ79vCU1ijP6AoC25JYLJtEblhfdJGkQGMt6+zY2sF/iPqImhiwwzf6JKiz 2Q== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2120.oracle.com with ESMTP id 33sx9nahd4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Sep 2020 20:15:29 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UKEn9U196397;
        Wed, 30 Sep 2020 20:15:29 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3020.oracle.com with ESMTP id 33tfduhgyt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 30 Sep 2020 20:15:29 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 08UKFPGp028144;
        Wed, 30 Sep 2020 20:15:25 GMT
Received: from localhost.us.oracle.com (/10.147.27.2)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 30 Sep 2020 13:15:25 -0700
From:   Eric Snowberg <eric.snowberg@oracle.com>
To:     dhowells@redhat.com, dwmw2@infradead.org
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, jarkko.sakkinen@linux.intel.com,
        eric.snowberg@oracle.com
Subject: [PATCH 2/2] certs: Add ability to preload revocation certs
Date:   Wed, 30 Sep 2020 16:15:08 -0400
Message-Id: <20200930201508.35113-3-eric.snowberg@oracle.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20200930201508.35113-1-eric.snowberg@oracle.com>
References: <20200930201508.35113-1-eric.snowberg@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9760 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009300164
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9760 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300163
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Add a new Kconfig option called SYSTEM_REVOCATION_KEYS. If set,
this option should be the filename of a PEM-formated file containing
X.509 certificates to be included in the default blacklist keyring.

Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
---
 certs/Kconfig                   |  8 ++++++++
 certs/Makefile                  | 18 ++++++++++++++++--
 certs/blacklist.c               | 17 +++++++++++++++++
 certs/revocation_certificates.S | 21 +++++++++++++++++++++
 scripts/Makefile                |  1 +
 5 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 certs/revocation_certificates.S

diff --git a/certs/Kconfig b/certs/Kconfig
index c94e93d8bccf..379a6e198459 100644
--- a/certs/Kconfig
+++ b/certs/Kconfig
@@ -83,4 +83,12 @@ config SYSTEM_BLACKLIST_HASH_LIST
 	  wrapper to incorporate the list into the kernel.  Each <hash> should
 	  be a string of hex digits.
 
+config SYSTEM_REVOCATION_KEYS
+	string "X.509 certificates to be preloaded into the system blacklist keyring"
+	depends on SYSTEM_BLACKLIST_KEYRING
+	help
+	  If set, this option should be the filename of a PEM-formatted file
+	  containing X.509 certificates to be included in the default blacklist
+	  keyring.
+
 endmenu
diff --git a/certs/Makefile b/certs/Makefile
index f4b90bad8690..e3f4926fd21e 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -4,7 +4,7 @@
 #
 
 obj-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += system_keyring.o system_certificates.o common.o
-obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist.o
+obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist.o revocation_certificates.o common.o
 ifneq ($(CONFIG_SYSTEM_BLACKLIST_HASH_LIST),"")
 obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist_hashes.o
 else
@@ -29,7 +29,7 @@ $(obj)/x509_certificate_list: scripts/extract-cert $(SYSTEM_TRUSTED_KEYS_SRCPREF
 	$(call if_changed,extract_certs,$(SYSTEM_TRUSTED_KEYS_SRCPREFIX)$(CONFIG_SYSTEM_TRUSTED_KEYS))
 endif # CONFIG_SYSTEM_TRUSTED_KEYRING
 
-clean-files := x509_certificate_list .x509.list
+clean-files := x509_certificate_list .x509.list x509_revocation_list
 
 ifeq ($(CONFIG_MODULE_SIG),y)
 ###############################################################################
@@ -104,3 +104,17 @@ targets += signing_key.x509
 $(obj)/signing_key.x509: scripts/extract-cert $(X509_DEP) FORCE
 	$(call if_changed,extract_certs,$(MODULE_SIG_KEY_SRCPREFIX)$(CONFIG_MODULE_SIG_KEY))
 endif # CONFIG_MODULE_SIG
+
+ifeq ($(CONFIG_SYSTEM_BLACKLIST_KEYRING),y)
+
+$(eval $(call config_filename,SYSTEM_REVOCATION_KEYS))
+
+$(obj)/revocation_certificates.o: $(obj)/x509_revocation_list
+
+quiet_cmd_extract_certs  = EXTRACT_CERTS   $(patsubst "%",%,$(2))
+      cmd_extract_certs  = scripts/extract-cert $(2) $@
+
+targets += x509_revocation_list
+$(obj)/x509_revocation_list: scripts/extract-cert $(SYSTEM_REVOCATION_KEYS_SRCPREFIX)$(SYSTEM_REVOCATION_KEYS_FILENAME) FORCE
+	$(call if_changed,extract_certs,$(SYSTEM_REVOCATION_KEYS_SRCPREFIX)$(CONFIG_SYSTEM_REVOCATION_KEYS))
+endif
diff --git a/certs/blacklist.c b/certs/blacklist.c
index 6514f9ebc943..a0e7770895ce 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -16,9 +16,13 @@
 #include <linux/seq_file.h>
 #include <keys/system_keyring.h>
 #include "blacklist.h"
+#include "common.h"
 
 static struct key *blacklist_keyring;
 
+extern __initconst const u8 revocation_certificate_list[];
+extern __initconst const unsigned long revocation_certificate_list_size;
+
 /*
  * The description must be a type prefix, a colon and then an even number of
  * hex digits.  The hash is kept in the description.
@@ -177,3 +181,16 @@ static int __init blacklist_init(void)
  * Must be initialised before we try and load the keys into the keyring.
  */
 device_initcall(blacklist_init);
+
+/*
+ * Load the compiled-in list of revocation X.509 certificates.
+ */
+static __init int load_revocation_certificate_list(void)
+{
+	if (revocation_certificate_list_size)
+		pr_notice("Loading compiled-in revocation X.509 certificates\n");
+
+	return load_certificate_list(revocation_certificate_list, revocation_certificate_list_size,
+				     blacklist_keyring);
+}
+late_initcall(load_revocation_certificate_list);
diff --git a/certs/revocation_certificates.S b/certs/revocation_certificates.S
new file mode 100644
index 000000000000..f21aae8a8f0e
--- /dev/null
+++ b/certs/revocation_certificates.S
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <linux/export.h>
+#include <linux/init.h>
+
+	__INITRODATA
+
+	.align 8
+	.globl revocation_certificate_list
+revocation_certificate_list:
+__revocation_list_start:
+	.incbin "certs/x509_revocation_list"
+__revocation_list_end:
+
+	.align 8
+	.globl revocation_certificate_list_size
+revocation_certificate_list_size:
+#ifdef CONFIG_64BIT
+	.quad __revocation_list_end - __revocation_list_start
+#else
+	.long __revocation_list_end - __revocation_list_start
+#endif
diff --git a/scripts/Makefile b/scripts/Makefile
index bc018e4b733e..fb105b2bc006 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -11,6 +11,7 @@ hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
 hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
 hostprogs-always-$(CONFIG_SYSTEM_TRUSTED_KEYRING)	+= extract-cert
 hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
+ hostprogs-always-$(CONFIG_SYSTEM_BLACKLIST_KEYRING)	+= extract-cert
 
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
-- 
2.18.1

