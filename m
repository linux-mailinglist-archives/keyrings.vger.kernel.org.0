Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F97C27F31A
	for <lists+keyrings@lfdr.de>; Wed, 30 Sep 2020 22:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729792AbgI3URl (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 30 Sep 2020 16:17:41 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:53226 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3URk (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 30 Sep 2020 16:17:40 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UK9cLN087784;
        Wed, 30 Sep 2020 20:17:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=8+YjHgLoEHByilPsETufBgIIxemgj0lRXRq5q8j7QcA=;
 b=HwCBrv56hqszFJNu839yaRnCRx74q7wuKfhofe+c9tXFonZbdRGbfoHev/Uh8rv9bQbe
 UYjGC8lgANtwyNwVI2/iNUX5yEHzrHDOEb492ipfz0swKZYyZFyB68nlUZp3C8bgo1bP
 CMA0/8O2ez4BjqVWVINRbwuqnY2Yb/60T3N6C0tgxoidlTpPX57SpUvAnd9ZpuKtE9pY
 5MA5R/eq+RTSgOw/FYNZp4uE2hrrYQz/BdhVWaC+Z+byu5a3v9OFAZfQjV93PwCY9So/
 bevkyAN6+RAweQvIA6HGDF2onJdsC+Oh+A42Zxb3RMHwp3IkSSkFfLkTU25A83RU///P hw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2120.oracle.com with ESMTP id 33swkm2kv4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Sep 2020 20:17:30 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08UK9nxr091667;
        Wed, 30 Sep 2020 20:15:29 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 33tfk09gdj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 30 Sep 2020 20:15:29 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08UKFOhA009486;
        Wed, 30 Sep 2020 20:15:25 GMT
Received: from localhost.us.oracle.com (/10.147.27.2)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 30 Sep 2020 13:15:24 -0700
From:   Eric Snowberg <eric.snowberg@oracle.com>
To:     dhowells@redhat.com, dwmw2@infradead.org
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, jarkko.sakkinen@linux.intel.com,
        eric.snowberg@oracle.com
Subject: [PATCH 1/2] certs: Move load_system_certificate_list to a common function
Date:   Wed, 30 Sep 2020 16:15:07 -0400
Message-Id: <20200930201508.35113-2-eric.snowberg@oracle.com>
X-Mailer: git-send-email 2.18.1
In-Reply-To: <20200930201508.35113-1-eric.snowberg@oracle.com>
References: <20200930201508.35113-1-eric.snowberg@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9760 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300163
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9760 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009300163
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Move functionality within load_system_certificate_list to a common
function, so it can be reused in the future.

Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
---
 certs/Makefile         |  2 +-
 certs/common.c         | 56 ++++++++++++++++++++++++++++++++++++++++++
 certs/common.h         |  9 +++++++
 certs/system_keyring.c | 49 +++---------------------------------
 4 files changed, 69 insertions(+), 47 deletions(-)
 create mode 100644 certs/common.c
 create mode 100644 certs/common.h

diff --git a/certs/Makefile b/certs/Makefile
index f4c25b67aad9..f4b90bad8690 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -3,7 +3,7 @@
 # Makefile for the linux kernel signature checking certificates.
 #
 
-obj-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += system_keyring.o system_certificates.o
+obj-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += system_keyring.o system_certificates.o common.o
 obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist.o
 ifneq ($(CONFIG_SYSTEM_BLACKLIST_HASH_LIST),"")
 obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist_hashes.o
diff --git a/certs/common.c b/certs/common.c
new file mode 100644
index 000000000000..83800f51a1a1
--- /dev/null
+++ b/certs/common.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <linux/kernel.h>
+#include <linux/key.h>
+
+int load_certificate_list(const u8 cert_list[],
+			  const unsigned long list_size,
+			  const struct key *keyring)
+{
+	key_ref_t key;
+	const u8 *p, *end;
+	size_t plen;
+
+	p = cert_list;
+	end = p + list_size;
+	while (p < end) {
+		/* Each cert begins with an ASN.1 SEQUENCE tag and must be more
+		 * than 256 bytes in size.
+		 */
+		if (end - p < 4)
+			goto dodgy_cert;
+		if (p[0] != 0x30 &&
+		    p[1] != 0x82)
+			goto dodgy_cert;
+		plen = (p[2] << 8) | p[3];
+		plen += 4;
+		if (plen > end - p)
+			goto dodgy_cert;
+
+		key = key_create_or_update(make_key_ref(keyring, 1),
+					   "asymmetric",
+					   NULL,
+					   p,
+					   plen,
+					   ((KEY_POS_ALL & ~KEY_POS_SETATTR) |
+					   KEY_USR_VIEW | KEY_USR_READ),
+					   KEY_ALLOC_NOT_IN_QUOTA |
+					   KEY_ALLOC_BUILT_IN |
+					   KEY_ALLOC_BYPASS_RESTRICTION);
+		if (IS_ERR(key)) {
+			pr_err("Problem loading in-kernel X.509 certificate (%ld)\n",
+			       PTR_ERR(key));
+		} else {
+			pr_notice("Loaded X.509 cert '%s'\n",
+				  key_ref_to_ptr(key)->description);
+			key_ref_put(key);
+		}
+		p += plen;
+	}
+
+	return 0;
+
+dodgy_cert:
+	pr_err("Problem parsing in-kernel X.509 certificate list\n");
+	return 0;
+}
diff --git a/certs/common.h b/certs/common.h
new file mode 100644
index 000000000000..abdb5795936b
--- /dev/null
+++ b/certs/common.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef _CERT_COMMON_H
+#define _CERT_COMMON_H
+
+int load_certificate_list(const u8 cert_list[], const unsigned long list_size,
+			  const struct key *keyring);
+
+#endif
diff --git a/certs/system_keyring.c b/certs/system_keyring.c
index 798291177186..4510fb5462fb 100644
--- a/certs/system_keyring.c
+++ b/certs/system_keyring.c
@@ -15,6 +15,7 @@
 #include <keys/asymmetric-type.h>
 #include <keys/system_keyring.h>
 #include <crypto/pkcs7.h>
+#include "common.h"
 
 static struct key *builtin_trusted_keys;
 #ifdef CONFIG_SECONDARY_TRUSTED_KEYRING
@@ -136,54 +137,10 @@ device_initcall(system_trusted_keyring_init);
  */
 static __init int load_system_certificate_list(void)
 {
-	key_ref_t key;
-	const u8 *p, *end;
-	size_t plen;
-
 	pr_notice("Loading compiled-in X.509 certificates\n");
 
-	p = system_certificate_list;
-	end = p + system_certificate_list_size;
-	while (p < end) {
-		/* Each cert begins with an ASN.1 SEQUENCE tag and must be more
-		 * than 256 bytes in size.
-		 */
-		if (end - p < 4)
-			goto dodgy_cert;
-		if (p[0] != 0x30 &&
-		    p[1] != 0x82)
-			goto dodgy_cert;
-		plen = (p[2] << 8) | p[3];
-		plen += 4;
-		if (plen > end - p)
-			goto dodgy_cert;
-
-		key = key_create_or_update(make_key_ref(builtin_trusted_keys, 1),
-					   "asymmetric",
-					   NULL,
-					   p,
-					   plen,
-					   ((KEY_POS_ALL & ~KEY_POS_SETATTR) |
-					   KEY_USR_VIEW | KEY_USR_READ),
-					   KEY_ALLOC_NOT_IN_QUOTA |
-					   KEY_ALLOC_BUILT_IN |
-					   KEY_ALLOC_BYPASS_RESTRICTION);
-		if (IS_ERR(key)) {
-			pr_err("Problem loading in-kernel X.509 certificate (%ld)\n",
-			       PTR_ERR(key));
-		} else {
-			pr_notice("Loaded X.509 cert '%s'\n",
-				  key_ref_to_ptr(key)->description);
-			key_ref_put(key);
-		}
-		p += plen;
-	}
-
-	return 0;
-
-dodgy_cert:
-	pr_err("Problem parsing in-kernel X.509 certificate list\n");
-	return 0;
+	return load_certificate_list(system_certificate_list, system_certificate_list_size,
+				     builtin_trusted_keys);
 }
 late_initcall(load_system_certificate_list);
 
-- 
2.18.1

