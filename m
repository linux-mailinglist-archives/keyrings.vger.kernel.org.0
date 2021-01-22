Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4274B300B0F
	for <lists+keyrings@lfdr.de>; Fri, 22 Jan 2021 19:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729127AbhAVSUP (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 22 Jan 2021 13:20:15 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48542 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729475AbhAVSNP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 22 Jan 2021 13:13:15 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MIAM4h038529;
        Fri, 22 Jan 2021 18:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=3b8lD2qRJBa8+iwVl54AGxLANggDdJ9IkUlAdmRCMIc=;
 b=lzdYbj9TPrL9x/7MKfeIjiuc/sf5ItQMcdNbPhmV+maJ8JFmgAyWCToocc33KA6CBrfM
 jwxwNGS495f4/ASaNQ8T1hAbTck3k95iS/psw87UKIo84uVOEyBA6XSmBtlvIE3hFiO0
 xCGvalcjxWuYB1EB/Y9VB5OvGuHw+pGR6AltBZV0H1QO8O/FgOa+kp3J9DIq9qcVV27F
 Rh0njb2aRzytR9Nri0ctfGjcdjX8qH3y7JovmhFVHbz0iGKAPk3ewW3Y6oY84YAHpY+4
 4hXkpf6RCntcl7V8lY31qYus2/hAT3J8suJaJKb5zeHnLNLjR1QaK2C11jRIiEFMa00K YA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 3668qn5cgb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 18:11:38 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MI4xMp149816;
        Fri, 22 Jan 2021 18:11:38 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
        by userp3020.oracle.com with ESMTP id 3668r1dqa5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 18:11:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c0gv8ar1iCE89h5XOkZfzr0/8gbUGCkYQwI3TZ2JNMd3jQisRziffWLDHFtFDa+DSkWl3tLgoiCZ/l1X4YNIQGftnLkq+Lw9wAIS7lyf/8Mmp1y0iJcml27ibEYJzkEYoAq/Am32GZu9ex20uMk0i0R9DEKEvAjvNLUbvkpNEs5IVc5RSLv8Za51J9s3mst1yeE9awhEEUF7srou8lZPhzJhEU1hKwXcfmiCB509z5S51L4AjzkUbITezUIy1+01Jc4L6tyHOj8Kl8SAZQ009MENh9fYnCLTOGA25lk8vVNXr6HJWf9ISM4oStx0Jt4O+awGQ6rq/y0XgrIeJ7oRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3b8lD2qRJBa8+iwVl54AGxLANggDdJ9IkUlAdmRCMIc=;
 b=FaFA6D15MZhwWlR9q7XnW5vcuZFFTIF504wf2R/wjhmz2msl7ynTYWkhs2C2Kj5/D7xY8a/prOCZ+4mo0QtW9gKGYg/444aN1xWB6KbfK9aO6ok/YXxOzW9nkJlXAr0BK1rZBacPVrBpuWdJjpgpfM2A/gdLQYawap+17x7Yg7wRMELUEb5mN55Nb8i4VTLCZibl8PHck6tarbu4BgNjNMV7ngmS1CQKg/5+ZrGOHDEXF9wDYVQhJSflbdjoWXb0/INwbN3Xs2jkGfC1QAeAP4OciXYUPcymmMpdWrwb8O8QInBMuNi2SnEJ3wJAn8krBW6cg4Yg4e1uvYAILEcL8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3b8lD2qRJBa8+iwVl54AGxLANggDdJ9IkUlAdmRCMIc=;
 b=u3FhwZA4U3JJDcboxUsPdu2LMgdXfwmQJWtpBAUavQY6PwBXGLrCVjpilgq9lPcIm9YGPUv1LCqgc8jQGVdPs319/EK4J7yigq/0mnnEl3sAs6XlaiQeeofY54OsExJfthGu40AJqLg/5WKRkVb0E+vMl+e7IW6Mmy2fsVqd8to=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3099.namprd10.prod.outlook.com (2603:10b6:5:1ad::18)
 by DM5PR10MB1673.namprd10.prod.outlook.com (2603:10b6:4:6::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11; Fri, 22 Jan 2021 18:11:35 +0000
Received: from DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4]) by DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4%7]) with mapi id 15.20.3763.017; Fri, 22 Jan 2021
 18:11:35 +0000
From:   Eric Snowberg <eric.snowberg@oracle.com>
To:     dhowells@redhat.com, dwmw2@infradead.org, jarkko@kernel.org,
        James.Bottomley@HansenPartnership.com
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net, jmorris@namei.org,
        serge@hallyn.com, eric.snowberg@oracle.com, ardb@kernel.org,
        zohar@linux.ibm.com, lszubowi@redhat.com, javierm@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [PATCH v5 2/4] certs: Move load_system_certificate_list to a common function
Date:   Fri, 22 Jan 2021 13:10:52 -0500
Message-Id: <20210122181054.32635-3-eric.snowberg@oracle.com>
X-Mailer: git-send-email 2.18.4
In-Reply-To: <20210122181054.32635-1-eric.snowberg@oracle.com>
References: <20210122181054.32635-1-eric.snowberg@oracle.com>
Content-Type: text/plain
X-Originating-IP: [138.3.200.2]
X-ClientProxiedBy: CH2PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:610:4c::16) To DM6PR10MB3099.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.us.oracle.com (138.3.200.2) by CH2PR10CA0006.namprd10.prod.outlook.com (2603:10b6:610:4c::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Fri, 22 Jan 2021 18:11:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a731e564-36f6-4766-4d65-08d8bf0127b0
X-MS-TrafficTypeDiagnostic: DM5PR10MB1673:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR10MB16739C3AA90438A71C975F5487A09@DM5PR10MB1673.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:529;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Vf4SJY5rDOfdb9NgznqU/NDLLYJPAL009rOd8s7J+ybL3jCULJimLouf8EFq/HoXHHWbo2SNrR4z+L3iSTeLxlNGWPgpuNiC0SbbOyoX59uVE9+6aIr9M1ETvr9I5BhdMCCzGMRA1ZgM5cOCBhR+Yg/s+qC4IEJhAEnjGjBTo/qb+bEtG6WaFKHm8hJaJ8Ks8CTkG/m8xyIOLKkqba8/EimD09Hk/F2rTgAFk9CaZzv3jNwGhr5G/9vjM5b/zsWlxk1aCSerfaP9ZOdMo3NNMVrI3r2ZZGahXAwkriTpC+zAHMT64opc0A4hnR6MPQn3ny7Z/lGrW4lD062CRKkMsjY0Ms/glhZ73Y5IpHf9q75QaLZbHuP48bXpNB5bcvzOZeqlelhaQLA5svt25r+3KwBd0WoJweA/Y/VPDAswOJJBIeHoi8XtsteklIsCCIyYORY4tgCxhtmVjZlet5xpuUWkwOUgQFeHekvoYyzbk0Wk8zAYKSd/76TTjs+jOpNz53uIYfTCVw/RpT1HvkiNkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB3099.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(39860400002)(366004)(136003)(346002)(316002)(7416002)(6486002)(7696005)(2616005)(1076003)(52116002)(5660300002)(4326008)(44832011)(2906002)(8676002)(16526019)(26005)(66946007)(478600001)(186003)(956004)(36756003)(83380400001)(66556008)(66476007)(8936002)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uz5Ua0WYYfovWjw2zxBJJeTaUUGh2CelHGw+36RJxvrYBVIW/DFKdq8s6ngI?=
 =?us-ascii?Q?zQXxp7UCxY08LMxtQ2wozGk8YqatZXbY6Bwo/HZGIWy0dUe/J3SlOHg9djIP?=
 =?us-ascii?Q?UFEaD7NTlBPmbBfJxqx1f4OG72XSy4ORut/BTN93+eIzIV0BqxZrREZ+pceT?=
 =?us-ascii?Q?VVv489Pqqwze3ylnWs0ArnLS3zdpEPX+3YdepDsqHFqksafoILWrDuEmITmO?=
 =?us-ascii?Q?i3dZ0oL3+Gp+CpRrQj/mECYMq0TV5SQxcngpsWNTIiMqy3exr29BEYkSk8SC?=
 =?us-ascii?Q?wt9PsDsd2xLgFoVe7MSNoaBJBY/M8qpLUENqT4AaNPZB37rdayv0TGUAJeuf?=
 =?us-ascii?Q?eAToeNTed/aDbCgVREy6kTqcZXaT8jSQ6Ol6PSH6K9t2cMdmP02I6Z1AEThd?=
 =?us-ascii?Q?VZF1ZcHkhlyLJi6NSeQGtVUdoAHyN/GHqge/yb0HoPk5XmdWCGBe8qA126m/?=
 =?us-ascii?Q?bOZtCO7yjzKp64ibVox7tqr4/ThKCTv4qOaOv0jWxvbPHNK5r37YcZOfX43Y?=
 =?us-ascii?Q?w9rnJFvufFozx2ZU+z4wRvwoXQ2OW6xKyC6g54fg+b6hGaFLTBlxfcQya6fv?=
 =?us-ascii?Q?ppkyUYh5Ud025xRMVgNs2V6Ish6C27HmPxQ51GgcLmSFMC0m4WndJdeAym0d?=
 =?us-ascii?Q?XZ/ovmRGb2CCyppJfT/VWqAbWW/oHhQqlPfDAXn3kuDwnJrq73gArSTPRuf+?=
 =?us-ascii?Q?y+KtqdcjHHSLWQB0yjL46Pi8LtTIVEQrNwGRtc6FRtEqazpwJWHgdwj7d9AC?=
 =?us-ascii?Q?NYpZ8RabEo1Y1exkjN6ZTllHyq2/hGFlC/PbZOGBXyt/AjFVP+L5RlQ/b/R/?=
 =?us-ascii?Q?0jzvB9HBnyLN6XnbVe4/rFkPalUWX1eJY5ICFDghb1MPNFCURxM4sDwqs+Z3?=
 =?us-ascii?Q?ONPec0BqovXPXTDDNv6c1QEgzZTXMXE9ZqhwkPY+TiKNDRjiajvhdwM5bMRe?=
 =?us-ascii?Q?eASop+BWSGCL5Q8ZMKztzGUHNUBZven1x8Q1ILzzIjw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a731e564-36f6-4766-4d65-08d8bf0127b0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3099.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 18:11:35.8051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oiGVAnp+FBtDJIpiyvqQlQYH/bxIkIs7dn6nisNIsT5g17IcxkQZMPqQsNfH36Ve76ymnx1QCJFJpO64iyWm3TN8z3jCe4JInBsMHeALrLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1673
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220093
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1015 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220093
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Move functionality within load_system_certificate_list to a common
function, so it can be reused in the future.

Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
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
index cc165b359ea3..a44a8915c94c 100644
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
2.18.4

