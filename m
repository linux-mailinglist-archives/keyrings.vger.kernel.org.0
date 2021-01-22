Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D551C300BA5
	for <lists+keyrings@lfdr.de>; Fri, 22 Jan 2021 19:45:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729985AbhAVSnC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 22 Jan 2021 13:43:02 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:49848 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729633AbhAVSOd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 22 Jan 2021 13:14:33 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MIAcum038714;
        Fri, 22 Jan 2021 18:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=jFhaaN6+2ClnE90wSGul6o1qszCGh3uNfMkXhhYxoVg=;
 b=wWbDmRxG0chyVCBcyXyVpgbmDjlbj0td1kFllhlBhZmBfn6qikVRbJWzGkjOvxqdHU9w
 puWE/aCiiYBzLU6cpxTruTonGvM5wS8q9yvdN0As961AtXDCIBGFT3lKHqFTTIpA0WD5
 oRc3tvy2RbSPFR2LNG6/LCY+4SL9+phGmvajwv4RQo6fhWg4hNAwW3qZNQM+mtJzCn3O
 ByTdBpurYnOm744A91gLJ8DsqhsndZX6bIF4MPZ7EnaKqRVWa8iPya2JFMC43AHksd1H
 UtQJG2u+glZlnovZxsTpPke4sGjUjIkuey3QN2HFs4F22flyBd0K3OJKbhIAAIwj5Ko6 nA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 3668qn5csb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 18:13:39 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MI4xMq149816;
        Fri, 22 Jan 2021 18:11:39 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
        by userp3020.oracle.com with ESMTP id 3668r1dqa5-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 18:11:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqID+BVfeqBo/NSyAWPM1WQvze5C8NDku6rvfKI06vxd2UchfqRhI0z43vcaml+Uzot+j5wga1ku2VVPT+xxQ3fW4nWjAynJDL4wyk6FfV34fhxzZNQkGDDLMerhKIx+d7JRKl6W4M+LGGSIqpC2pcGZPVl+76FhvwLO3pl+XuIzDOfL2/G8+l+kmrWI7ul1Ru3UiISzLyXDzJvytWLrgKAyehRGTFNTDmKpOb92FsGKeqnA76EYeYxCg0UTCaUJMZqONBVTRXnlEaXGQkm4m5DcOIpInr/Za1aCsYoz79pMuI65AinrGp3/QYO7gKMO715KkZETbtUs5WwBEZLsOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFhaaN6+2ClnE90wSGul6o1qszCGh3uNfMkXhhYxoVg=;
 b=VW15JNLK/Wdwu4kDv4SQQ3NE02xjPbNJl6P+YojSm3NFU6/8+8Oy/cia+BxS5o91cqYLAOutuQJTg9hqphHQL07oxymDA/YqCuoX/K8jN2I7RN/Qrf27k+2dbjI65tIauuhdgysktUjn84K+iaNVqU5n0r6XZ16o4ujRKa7LaNjMtjnvinj+nGiLN+KOqoum0GWDITaqIH1BhTgpLcLLZeTYYreSS3jouTL5X/YI3sTykS7pPCBGzOxVyKq8QKgGBbM7qjeeBWt+1YWMxprLTGUbRuhDJ+A5EHGDiEooDSaplEQiYMD2udjGuf3jpFu95w70jRM5TyUc4/4JRjOMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jFhaaN6+2ClnE90wSGul6o1qszCGh3uNfMkXhhYxoVg=;
 b=f6SZq2WKa9jR4nEb/4zHCkxnJaIjAdSxKS0P+VqnFgp9jDtx05iVxtVOlrwNCRv0HyM9N7tYdFaFgLIJHNYvQ5fMyuA3Yio0jDpNuu5sVESAP6Vf43npfkh+foRwrs6aHYkj8s76KHm+uXU3cwLrN+TYcJcgkerEqQf3R4//f1Q=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3099.namprd10.prod.outlook.com (2603:10b6:5:1ad::18)
 by DM5PR10MB1673.namprd10.prod.outlook.com (2603:10b6:4:6::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11; Fri, 22 Jan 2021 18:11:37 +0000
Received: from DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4]) by DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4%7]) with mapi id 15.20.3763.017; Fri, 22 Jan 2021
 18:11:37 +0000
From:   Eric Snowberg <eric.snowberg@oracle.com>
To:     dhowells@redhat.com, dwmw2@infradead.org, jarkko@kernel.org,
        James.Bottomley@HansenPartnership.com
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net, jmorris@namei.org,
        serge@hallyn.com, eric.snowberg@oracle.com, ardb@kernel.org,
        zohar@linux.ibm.com, lszubowi@redhat.com, javierm@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [PATCH v5 3/4] certs: Add ability to preload revocation certs
Date:   Fri, 22 Jan 2021 13:10:53 -0500
Message-Id: <20210122181054.32635-4-eric.snowberg@oracle.com>
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
Received: from localhost.us.oracle.com (138.3.200.2) by CH2PR10CA0006.namprd10.prod.outlook.com (2603:10b6:610:4c::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Fri, 22 Jan 2021 18:11:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee3b9d6a-9cfa-4c6f-a11a-08d8bf0128cd
X-MS-TrafficTypeDiagnostic: DM5PR10MB1673:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR10MB167301EC46C85B44D2F86A3587A09@DM5PR10MB1673.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ICjMV494sOVeqs5schre05cS1fZW4FJVrj0Dmb5sOVlKtAmpmNUkZ+GAu3xvMHlgizi2DqlqMGvoxJESb+ujpHDwSgPQ3Fe/vFsgvVELc3kUnMwWdM4MKTKoGjRGNdeug23qUVmqDb/Ep2uRpp3U7DHU1iGL5OpwRzpJmtljZofq/gH4cJJKUmBzgmIg3dD67oiCcp7VeTYQ4qc42zCRs8LOZYnlf3dd8zNTLXRnz0juXfXxmZWUrF9OwxjQyCB0ZlhFsLI8JD3InZZdeKpzYkFiPojOk3pF1OyYX4kV6IY2VqTNxtSGRW0TtjzuhKhFTLf12ihBERs6wx+75Otei6273krexKYgpVD0NfKVfVCFNTvcZs1NhUTFencW/toXd+CHNWayfqKyIC6MhhzUrmsk2BtAHvm3enwauoY+xS5b43zUom67pF7WWorHVw0qlrEqPtw+feRBI/j+kSU0qhODi1iJ+I2u7NqUMvJ2OPDYLRMQQpsHRKDwA/70L2E94lW+WqETAug6E7UsXX94Lg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB3099.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(39860400002)(366004)(136003)(346002)(316002)(7416002)(6486002)(7696005)(2616005)(1076003)(52116002)(5660300002)(4326008)(44832011)(2906002)(8676002)(16526019)(26005)(66946007)(478600001)(186003)(956004)(36756003)(83380400001)(66556008)(66476007)(8936002)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XuxvA+S1EFyUl4eBDa/H234r3fLh8N2TkTbKNo0XCGnY51+y82+xN07FkzQE?=
 =?us-ascii?Q?Q7eisD96lYL4C6CcJu3bd7ZVKlTmH0CUsnk9xkE90KJK927/1uYwLg4cJmva?=
 =?us-ascii?Q?7026mJYkHSYdcRbMkKiCiEim7Pc/Ne8JvfXu4da1qfq7FKSu+f7uwI7w4PQ6?=
 =?us-ascii?Q?6/wd5rjUN0GrXel3AwR7KoDfE6URFYMO3lVQvOQp/UXORW0n+XX1YSEvePma?=
 =?us-ascii?Q?aXYdIiX2MtOHtVBJN+RkZcliROeLCpeKWeuG74clQxyS/zBlkRs6exnhWwAN?=
 =?us-ascii?Q?Scc0Wr+LYiSYXciCZBy1J7IIMYRqeMZjn5xbAcJ7kPj300pjRU3w9eLCpb+k?=
 =?us-ascii?Q?/hXtunCAs1RvFcwoHtaKhEZD+trPnH00TwXlGfpBq1gfFXZi5Nx/iEgY4hKQ?=
 =?us-ascii?Q?pPUuY9BTCbaIT5PMsiwsYTSYAP4SFIYjEknoql+LTtnObWM3QfoAmhivRI0Z?=
 =?us-ascii?Q?8nxhz1OVBfIO0ChXyfLbwPbXAZzoQ+fmnnXcS1uq2CZWneOVSCpNDNwMCamy?=
 =?us-ascii?Q?lttj8qCU+iiFyr8Via005zYX55zidt51I65eeP7CSAzGRyqdMXuDU9RJO4kN?=
 =?us-ascii?Q?T4l9178egM7rF7EYbiN76+HLMxRNAB33BjsFKsDyZvdoqIHW0WVZRiiKq11L?=
 =?us-ascii?Q?3cRFHg9YJLCTHR2jEQAiRVg22dnf+qi5DzXQ3SEOOO+8QZ8CqDIm83VkhKXa?=
 =?us-ascii?Q?qRwyNo2PQdkb6tQQ5MDQqDzDI4qcKnepWfQiOc6l9qbn6oWFeCWGHfnXSK0G?=
 =?us-ascii?Q?eooY9axrhHAIip/QC1l2lIIBR7RxIf15FNJR1Hd3W9uIcgwvdUjMHa0ZcJmo?=
 =?us-ascii?Q?cpZ7pI1Ah0GwClHHduXEuqhJtV3/1RWiwPopEhBW8v96S+PqzhHEnAF0NpVE?=
 =?us-ascii?Q?IEFUiSUl4cbhuZ+5Di0DxpntbU010o3A/iI/Ys60MeJcxhYGhcBv+0bhGFH/?=
 =?us-ascii?Q?0xbEpkeUhC87SwTCH7QqHnPjdDsMumsKc+ljxex5Jn0=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3b9d6a-9cfa-4c6f-a11a-08d8bf0128cd
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3099.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 18:11:37.5251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MhcFnNCfGQKWZvaiWT7GotTI2YPNYZW6H5m8XsjsWuo2gXTjHZ44GBZCp/BGGEFvJ+IzY8NAJgeXVyHSSld4xDBMsWcE2MBBaJ7tsiDMTAc=
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

Add a new Kconfig option called SYSTEM_REVOCATION_KEYS. If set,
this option should be the filename of a PEM-formated file containing
X.509 certificates to be included in the default blacklist keyring.

Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
Acked-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
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
index a7f021878a4b..4e8a1068adb2 100644
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
@@ -209,3 +213,16 @@ static int __init blacklist_init(void)
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
index b5418ec587fb..983b785f13cb 100644
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
2.18.4

