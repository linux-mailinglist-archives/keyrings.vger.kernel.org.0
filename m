Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA18832C2E8
	for <lists+keyrings@lfdr.de>; Thu,  4 Mar 2021 01:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236454AbhCCX7z (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 3 Mar 2021 18:59:55 -0500
Received: from aserp2130.oracle.com ([141.146.126.79]:39796 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1582041AbhCCHew (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 3 Mar 2021 02:34:52 -0500
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1233THpZ110096;
        Wed, 3 Mar 2021 03:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=ivF32mo9OGFO9W0M5yoaTUp94Y4zkGOVP6YXmsP1eEU=;
 b=SN7OkqiateLM0whOjvixZcFQedcE35tbklEkvUpG6PwCyhA0FheANQVjT+ucadnD37iZ
 YQ7x3q1gLVl9zFH1iWrcZuCBCbaGQuYTAn98ipa3GMPfdH0B5o5arsLrm4I106cNWqHh
 fVImHCkMAz00cqm8lSvn3OEC+JuOXMbi8YZGAckPQLZ2JOmPuOStnviwhocfZGHSDDF0
 cRSnyHOIcaogOrE9zTo05QPxBwPBB54VU75v/Lie0g/VkbPBcYNPiCPY3SnOGMH3+p0O
 CcEEtpzzvNCT27DqKDQXOOnYlcvd/S6Yr8iGzDwMn+swOlycZLHrRXX/zcOw1tXRXNOQ Nw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 36ybkba0x2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 03 Mar 2021 03:44:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1233UxP7081762;
        Wed, 3 Mar 2021 03:44:32 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        by userp3030.oracle.com with ESMTP id 37000xvnb5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 03 Mar 2021 03:44:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cuvSLxSt+7679UmrcvkCaSgstiSpDtlPiR7wA9vJ6f7PrbvxAl7KoOIfjU2csiZe1GFp3+j58MNLQvUZfjM3YqV+1oxTE5J2ackrr+S4fkvd6tiBKnkoWMlh3e9wrHgPyjl2Sx63E8u+JHq6h46OWL3wuPgmjIQiytliesxBldqY6odJkYAS4aLxdPcGFoqL0IEmMQcMVhUGFh4SJkkoe5fbnX7i1SbJlOuPYUINuJ1i1THlLn7gDkV+AXGgCTUkehyV4GjzIgnwfarWhZ74k/Ma66rJhHd171tAdD39qBkMhsuzWMGZRW4qHI2dRIwx1ovDhb3toKt08Yzplun6OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivF32mo9OGFO9W0M5yoaTUp94Y4zkGOVP6YXmsP1eEU=;
 b=EI29epIo+kAtRc4tGtk5JhbjUmCr4o4Sl9cp8RRy8QVFtfJpuO7oOKY3QLo5Vy0S95ZfZ/0+HM83vOKgzILN+IL4opuMsLDJazYwGhWCHM01z16NnigyaQZNuOFH9e9K0qeZu6RKLfYYt5y0OWSuvXjULhIJSxw5UuKhv6O/BbsP5V3xmxrrjI/q8r5fx2UCEiUXhv8wq7AFOsGGK8Lie3HMcY9ypKk1K4zcJ/hN6vZglXadwX1F5sBWhUCNlxWWRtMFdgCS5SSn9nnMA1E47HQqHxPOKf4VwvbdwiFQ97r16ith/2BmW85n0u8FO3RJS5a/GnwRmIFy276zOsy/jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ivF32mo9OGFO9W0M5yoaTUp94Y4zkGOVP6YXmsP1eEU=;
 b=tpeE55l4LQR/ZUZsd5RsjcG9XNMpj5GdXfAwvWz6hDkv6AdMa45TBD1qrgqtQ01BAkao/zevq5x+YvKoEqjSusD6PIO7GiivbuQ624oX4QDJYx3fltNpsVyc1+bFrHx3chFFfNxkP+nUSOdPzqKcLpKrYSyYtD8RXFy2sjgVeKI=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=oracle.com;
Received: from CH2PR10MB4150.namprd10.prod.outlook.com (2603:10b6:610:ac::13)
 by CH2PR10MB4374.namprd10.prod.outlook.com (2603:10b6:610:af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 3 Mar
 2021 03:44:29 +0000
Received: from CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df]) by CH2PR10MB4150.namprd10.prod.outlook.com
 ([fe80::95df:950e:af4c:a5df%9]) with mapi id 15.20.3912.017; Wed, 3 Mar 2021
 03:44:29 +0000
From:   Eric Snowberg <eric.snowberg@oracle.com>
To:     rdunlap@infradead.org, dhowells@redhat.com
Cc:     dwmw2@infradead.org, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, eric.snowberg@oracle.com
Subject: [PATCH] certs: Fix wrong kconfig option used for x509_revocation_list
Date:   Tue,  2 Mar 2021 22:44:18 -0500
Message-Id: <20210303034418.106762-1-eric.snowberg@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-Originating-IP: [138.3.200.2]
X-ClientProxiedBy: SN7PR04CA0181.namprd04.prod.outlook.com
 (2603:10b6:806:126::6) To CH2PR10MB4150.namprd10.prod.outlook.com
 (2603:10b6:610:ac::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.us.oracle.com (138.3.200.2) by SN7PR04CA0181.namprd04.prod.outlook.com (2603:10b6:806:126::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20 via Frontend Transport; Wed, 3 Mar 2021 03:44:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee7693c1-c7a2-40e1-f94f-08d8ddf6a63d
X-MS-TrafficTypeDiagnostic: CH2PR10MB4374:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR10MB43740B18B4DF2D815E715B2987989@CH2PR10MB4374.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mPOlPQXnswBMY64hD3qHD9e5RXbfGjDfZnxNTzbxmvf4vetDcvVqvqBVl0M+sewj3WA+FOJ/NQvvfSRRMLnbvFxN8sNWRuQUBvnY2YRLrSAsSig+MUAph23yjdCZENxNHNvJTsaV7H8xuM5Pv6x8b3aePQtP+2Ub7g4wkMhms++P6Onee6A9SlC1BD7QW4U1fBvLMdr2TydKPHqeydFF6CBjdt4PFMZCQ/ctGXhwiYcfy9wx+r3lP1607hVKZd+Y/J8BJKujchkj7Aai8yejeKfekFoqL+gRUZK3ySn7PIei2CgDyZAQ+ssXhhSjxLDu/lgj+TGRDH9V8X/FLRarUUGcpD4+Nb+p3igNIqOQCCFqVR8pzGWT9wCC5xMSWeTtIyit6uCxz3S++rYU2jFRt7KAqF8J5rhTAeIsYhXfESZctCXpXSQfASjarXWDaHrSMh1EyXjEYyeHOOzf/wwq26epj548iO/p0Vsub8WsUO165KOaBMY+IrXWXUrGdExvRN1ph8bSklRDILwKE4yoDY5Z5Ukq9Xr/FY9FDyPVHbDLoS8RTxGBfxxbqEP0P+5eqKPepRalCWf+9ufCfv5XcoKDnUQNj+gpZtqaVjDrXxI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR10MB4150.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(39850400004)(396003)(376002)(136003)(5660300002)(66476007)(66556008)(66946007)(83380400001)(2616005)(107886003)(956004)(478600001)(4326008)(966005)(44832011)(2906002)(6486002)(186003)(16526019)(316002)(52116002)(8936002)(26005)(6666004)(8676002)(7696005)(1076003)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Y4DxnAynpbg9b/ff6bG9EKqQcPIAKC6buo+AG4713N+wa7cd1tRbg2N8X0JA?=
 =?us-ascii?Q?6b8KU2k8serhxlI1HHDq00OpVclCOQuQMhOJf/7m70CbWotvS/UqmI4pgZhN?=
 =?us-ascii?Q?KVJZHBg7eBCly4qrv9kYF4Ta118EvjqQipHg0eXghHFtmi82IjXTqiBaICNU?=
 =?us-ascii?Q?h8t+VmE6yD43R83V0cyeZiy5qGucvAbtJ9kd8Bg9Jd6cWj8HAbqcJzhCkngk?=
 =?us-ascii?Q?YsRYSIVKluf1f0F/KrcMSoneSqMVy54OC5al1FFeUvbchOpL++hqrv068Mbu?=
 =?us-ascii?Q?yzyvL+ojhbrQyNS8usFnmqbnUMzs+vO23mv/EyscN6wiA0xldjweLxY/r+Zq?=
 =?us-ascii?Q?5ejK+L42o3mWTzcVGXLW80MgW0ioo58El1XL1QAoXJ1qPksfPUhIQdnED6nP?=
 =?us-ascii?Q?IakXhTH6qvlhhoryHdAGVW8c70+14EFpeIe67xiOr4GcoPHr5wo+DsDkTjel?=
 =?us-ascii?Q?4ghDvj8mFuUZVboBZlg3iqb5RqQ1BPkJ2hB5pkiu3qLgp0IjPQP6KUwkmcC/?=
 =?us-ascii?Q?n6Uc70Sg0y3JM0vPj1gUFeoAPpmE+ENJYX58KJfH7Q0t+Vjvrm/mOQr8Kw5W?=
 =?us-ascii?Q?F6lYtrSQ+JIgX+PVRF1VDiWJ3XVuV77F2iiG0kemBL5Ot/Qj0uNLfZHbKpkP?=
 =?us-ascii?Q?SSx7ElfSX/VlV9jcUT2KWXKiYW8uARlxpENQGwrVX3+YGxeIxvp88Eou4wNE?=
 =?us-ascii?Q?WYq9Hns4A9GdJTSUNWB3jytEs2pCuNOO+AC8UPasb7Ckxm2ZVz1wKWvG/pZa?=
 =?us-ascii?Q?U628VFLOPXoBXn6rEsQ0RF+SzgUp7aSXGvztHyB6QoxdDffeLXvOvWPzrZW1?=
 =?us-ascii?Q?MRWsbVM9FCxa+BnPPrmsU4pMTITD1uYjo7wJrPOAd2Imdb2lwjmAoM29GWu6?=
 =?us-ascii?Q?lfsjmYDgbnGlUPlakJt6U+oBCR3+Rqf+NuXKj8xsOJ6+oOxPqNSNUR107l3W?=
 =?us-ascii?Q?ElxYnvWWh+RQICu4qAIPZubbeLHQV1mfJ4ZfP5YRxWoF9urUUOkTctwleNWK?=
 =?us-ascii?Q?PZWJuYdFfU9lHTHePFtkywtX95pfOg3u5ophgPP8yAqjMadcim8gBZsCYvno?=
 =?us-ascii?Q?q26YX4kNK7a2PfjSiZgK/2jYmf6KcLbExh35yc+HB8FNW35cyTVKnZvUIKZ4?=
 =?us-ascii?Q?u6ZbL6ya9shzLeunem3SKFvf87ID+87OQI8SGcIZ/wudQFHir92NCOGFQjam?=
 =?us-ascii?Q?2FOeOzwckT0b/5liy+wS2VM4ygPKK8z8cRO+fYgcPGgR4Ei5iJL6YuI//hpv?=
 =?us-ascii?Q?WGcHT5qVZF9w45V8dFfBe7RW/oJrljIJ3Qt4NYYwYxtp/Je6R//X6tMj27II?=
 =?us-ascii?Q?sj48sA85cABa57ClXXsZRSsa?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee7693c1-c7a2-40e1-f94f-08d8ddf6a63d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR10MB4150.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 03:44:29.5161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6eChL+uqs8jxlkjYZRyd41himNj6x0AtyX1Z00O064w3b7T7lViT0F1q3FTDfb0/n7Rt45vgkWMgb+V9ZmvyuR1vRZtGvGhWPm8qhL/cuJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4374
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9911 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103030024
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9911 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 clxscore=1015 mlxlogscore=999 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103030024
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This fixes a build issue when x509_revocation_list is not defined.

$ make ARCH=x86_64 O=build64 all

 EXTRACT_CERTS   ../
At main.c:154:
- SSL error:0909006C:PEM routines:get_name:no start line: crypto/pem/pem_lib.c:745
extract-cert: ../: Is a directory
make[2]: [../certs/Makefile:119: certs/x509_revocation_list] Error 1 (ignored)

When the new CONFIG_SYSTEM_REVOCATION_LIST was added [1], it was not carried
into the code for preloading the revocation certificates [2].  Change from
using the original CONFIG_SYSTEM_BLACKLIST_KEYRING  to the new
CONFIG_SYSTEM_REVOCATION_LIST.

[1] https://lore.kernel.org/keyrings/EDA280F9-F72D-4181-93C7-CDBE95976FF7@oracle.com/T/#m562c1b27bf402190e7bb573ad20eff5b6310d08f
[2] https://lore.kernel.org/keyrings/EDA280F9-F72D-4181-93C7-CDBE95976FF7@oracle.com/T/#m07e258bf019ccbac23820fad5192ceffa74fc6ab

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
---
 certs/Makefile    | 7 +++++--
 certs/blacklist.c | 4 ++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/certs/Makefile b/certs/Makefile
index e3f4926fd21e..3bc43c88a6d2 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -4,7 +4,10 @@
 #
 
 obj-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += system_keyring.o system_certificates.o common.o
-obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist.o revocation_certificates.o common.o
+obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist.o common.o
+ifeq ($(CONFIG_SYSTEM_REVOCATION_LIST),y)
+obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += revocation_certificates.o
+endif
 ifneq ($(CONFIG_SYSTEM_BLACKLIST_HASH_LIST),"")
 obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist_hashes.o
 else
@@ -105,7 +108,7 @@ $(obj)/signing_key.x509: scripts/extract-cert $(X509_DEP) FORCE
 	$(call if_changed,extract_certs,$(MODULE_SIG_KEY_SRCPREFIX)$(CONFIG_MODULE_SIG_KEY))
 endif # CONFIG_MODULE_SIG
 
-ifeq ($(CONFIG_SYSTEM_BLACKLIST_KEYRING),y)
+ifeq ($(CONFIG_SYSTEM_REVOCATION_LIST),y)
 
 $(eval $(call config_filename,SYSTEM_REVOCATION_KEYS))
 
diff --git a/certs/blacklist.c b/certs/blacklist.c
index 723b19c96256..c9a435b15af4 100644
--- a/certs/blacklist.c
+++ b/certs/blacklist.c
@@ -21,8 +21,10 @@
 
 static struct key *blacklist_keyring;
 
+#ifdef CONFIG_SYSTEM_REVOCATION_LIST
 extern __initconst const u8 revocation_certificate_list[];
 extern __initconst const unsigned long revocation_certificate_list_size;
+#endif
 
 /*
  * The description must be a type prefix, a colon and then an even number of
@@ -225,6 +227,7 @@ static int __init blacklist_init(void)
  */
 device_initcall(blacklist_init);
 
+#ifdef CONFIG_SYSTEM_REVOCATION_LIST
 /*
  * Load the compiled-in list of revocation X.509 certificates.
  */
@@ -237,3 +240,4 @@ static __init int load_revocation_certificate_list(void)
 				     blacklist_keyring);
 }
 late_initcall(load_revocation_certificate_list);
+#endif
-- 
2.18.4

