Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA4DE32D906
	for <lists+keyrings@lfdr.de>; Thu,  4 Mar 2021 18:54:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231837AbhCDRwo (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 4 Mar 2021 12:52:44 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:35402 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbhCDRwb (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 4 Mar 2021 12:52:31 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 124HmxVs134616;
        Thu, 4 Mar 2021 17:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=arEAA2tpjWpt3hLYObyYWXaXVnY9YiVb4m+dhqxpHMM=;
 b=I4DdPw4u7WNguHgdSq382FjkUks97xdd61r4spTJMwRifVBJagyz3krMsiUxFG7l8BUr
 fQBzSxS6u2QkXNVuq9Gymh1MycdfJI6/4GeSrD1DERqfeYF2jbG50FtlMov0rWdF+RGd
 pZS0RtHM8AVzablM+fmLYo5MD77AMFzL33Ig2NtsV4S9TAAOfwu/G2d/Ayyn5VOXZMwR
 zGP5qFOsE+h8F63mu96V/Xi4IcTEy4YUHQtZRaRFV3SsFOse1bcII1LJvln/gpn7OTds
 tRIT3LeJr0xcKb7LWFMEctCS+apNIzDLwH0lmx65anEPo1qX44OLe/RiCoymaR4O8U1t lQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 36yeqn7vxx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Mar 2021 17:50:47 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 124HjBC1073515;
        Thu, 4 Mar 2021 17:50:46 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
        by userp3030.oracle.com with ESMTP id 370011502c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Mar 2021 17:50:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a0IGbZdCohatTnDN67k+y25iFK2hy/MuFzN/k2S80YBGjpIrCqFaPL9wGrSjTVrFYN2fLeGcvD+dp4A4/ZZbu/+I/ct8EpezobT9HvaG16WGhemSPobURIRY/AHAm+C2QxYQstPfnCkYOkAhsGQkXpvmQuD5SyHcWYKazXxPwTtoK9ZB4nGhbzTajJNZY//ieEQCa0o4NpNNqJoSZ7dMTR75pht6BFf9rTDe0cNzS6aB4NbPB2lHfJr3rLMIzsf3a93XvUt576mFXOGXgqpMGHhqTZB94jUaPOV7ZrCzA6l7/t4lU7oMcjopUZ9ApghDNSKy4nkwkSWDa+psY8Cl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arEAA2tpjWpt3hLYObyYWXaXVnY9YiVb4m+dhqxpHMM=;
 b=P2jBZG1IKIfbEt3x7+XC0johL825p8GuQsLXelXkaIj2feBmmfTxo6aKa2nC5DKZ22upHekGvA2Zp/ZY8ONq6lMb96gId+o81pNLZmsvoS7lA4ombL9Y88AU3wTYix0Ns37QkQrhdnHdLgcYbmwFPldHApJRVmooRdU7W1L2IUQx4R1MeiVP6ftwbOHVY3GlcHPCM1VszEKjpdK9rE1v+xTffS0oKR9LUZjASeDy1e5IPQGL8/uE8siPMOqsw5Mdg4saOtEznRGH9hiLXBljxzamAiaJGXMM2PcZXcdBKlSSiqro5vzlu5vxlD3uubwiy4ERSpigVWUiXz+1DqRpng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arEAA2tpjWpt3hLYObyYWXaXVnY9YiVb4m+dhqxpHMM=;
 b=Ww9cGfHccKnFCp0ad865xUaoYzd8U9UYKQV/JP3iRW8Fvu297IbDtk4ZzMcwtXduLLFUlckIRWg6+2Qk+J58ZYqdun1PqaYNqICzqhpllZDlbpDNnWlPcVgHivjW8ijOuFiNXNh8W66sov8nlaFIB26HHHoFE91n75GbywZrD7Y=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4157.namprd10.prod.outlook.com (2603:10b6:208:1dc::18)
 by MN2PR10MB3808.namprd10.prod.outlook.com (2603:10b6:208:1be::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 4 Mar
 2021 17:50:43 +0000
Received: from MN2PR10MB4157.namprd10.prod.outlook.com
 ([fe80::f9c4:2f7a:9d35:c145]) by MN2PR10MB4157.namprd10.prod.outlook.com
 ([fe80::f9c4:2f7a:9d35:c145%2]) with mapi id 15.20.3890.030; Thu, 4 Mar 2021
 17:50:43 +0000
From:   Eric Snowberg <eric.snowberg@oracle.com>
To:     rdunlap@infradead.org, dhowells@redhat.com
Cc:     jarkko@kernel.org, nathan@kernel.org, dwmw2@infradead.org,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        eric.snowberg@oracle.com
Subject: [PATCH v2] certs: Fix wrong kconfig option used for x509_revocation_list
Date:   Thu,  4 Mar 2021 12:50:30 -0500
Message-Id: <20210304175030.184131-1-eric.snowberg@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-Originating-IP: [138.3.200.2]
X-ClientProxiedBy: SN1PR12CA0092.namprd12.prod.outlook.com
 (2603:10b6:802:21::27) To MN2PR10MB4157.namprd10.prod.outlook.com
 (2603:10b6:208:1dc::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.us.oracle.com (138.3.200.2) by SN1PR12CA0092.namprd12.prod.outlook.com (2603:10b6:802:21::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend Transport; Thu, 4 Mar 2021 17:50:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae50faf6-2d21-4e88-31da-08d8df360860
X-MS-TrafficTypeDiagnostic: MN2PR10MB3808:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR10MB3808BB3BDB05F65689B256FF87979@MN2PR10MB3808.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xY0RP8t16by2O6Ir5Qaii7GTYBzutMnCihekKD8gqP1LkoK+bPEykG25nVU6Mk34SL4YMEXpx0rfYta/2lMbKiaWIZYbCYAiYllCQcPWKiTufIp6xfOfWfPLQAcAuhj+mKplQ6mgfrUfmoD3zaDLCqVOnq2XRX1UZEzTI426q5GucwGUqBRuRG3neMea+IvICT/97CMS+7CLemMMVfCNnl2gJXejsgAeQirLAabeO9GmbB++lcBtI2jWBZayvEk6fqMbnmNb7ZWadDB6pL/GxKyULglddFEpV5/gUaf56l9PbUDPwl5m0CryS2EJYfZLAZiiw+l9VOi6Mj9hlwVJoSpY8yIh6oz4+k6UAdm2oQGypEg2VOhVww364J/8AZUbMNA3duQvkQmYf1AlkNGPExIDxVdSsXKmxYg3asgWfc0GoRhgzEXL6G3g+Du09Eb5aq2q8bpbMXrmetQXAGo9SV5goZODTNCnFlhkKa83A/CDMdn4ywmrMS798GsKOSRRtSBfoZ6hFV7fIgEZ1KPjK3YftinW7blyHJaFNd37youFq92YuV7EtAo1b+z8XtazYBVYR4KOxgDvlu0vylxf4zqtgt/uR3daMyGJkApJ7yw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4157.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(346002)(396003)(376002)(366004)(36756003)(66476007)(8936002)(8676002)(16526019)(966005)(66946007)(186003)(66556008)(6666004)(44832011)(86362001)(316002)(956004)(478600001)(26005)(7696005)(83380400001)(2616005)(1076003)(52116002)(4326008)(6486002)(107886003)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FqfsILdTVRCePB9Fmq3EL2ja9weXFND1QAIjztwVguncsHETNF0Lj4RkrbKE?=
 =?us-ascii?Q?MlKge/KEsix5CDD2VdKpZmCNc50i01pebxeVIEkUBIWSd8BinB1/ApnkyYLN?=
 =?us-ascii?Q?UD4jgsxXI6YaXdWmUJzFHBSub0vFXGkCkChSS/8vyHeRuaMjGAbAN7ZiAO9e?=
 =?us-ascii?Q?xwu/f5BnjOEN6ZBXtWPG15FSHWAZWlT9ZY3Fos66eLLIxHS2O1SKBLVZtWtA?=
 =?us-ascii?Q?VhoeudTTJr8/QrV8iFjwxoGiNCw1Pz13QdekBD4s6DkVoF/vKhfTsHFyVpcN?=
 =?us-ascii?Q?ow8u2BHkIwgaim95/WvyuTf65JBvkYfF0mBu30VL6LP/Mit1xKTIh5LBdLik?=
 =?us-ascii?Q?Zi305fwcIG1iOjFobQ/2BjVZwkfonM5Zl4b420CtCBbkmYhvPvcxqgoSa5Em?=
 =?us-ascii?Q?jnv1/Vvwx5mUVUbwIKSc7TlTECzWSQ0jqKHWCzAWcKQkkPzwNwKzfYdMuKTs?=
 =?us-ascii?Q?Q1hnhEakK+K5MMxbpih/fPXvIyuHplu7Jg/Eeq6ZBlsiJDkdfVhPntDjcqt7?=
 =?us-ascii?Q?eCw9y/DhcIOScsamQ0GkW59p4SPSaFDxCewRpvKxLRJv2QFM+p5c4DKqwr93?=
 =?us-ascii?Q?LaazeqfATZHkeLUIw5KUdM9JUFbBT9EjmdrS7VFT66xp26zyqIjuexflVD6G?=
 =?us-ascii?Q?mkXq3hT18VWBVeLCzMtfB8P+rorcm8HgvZ6MLcuvvP7oT9z3ROaSU7rE4q2I?=
 =?us-ascii?Q?zH03aFDPZeDwSMr0Yj/lN2CgirnUznEetLyDSAdSY0SuN/wmOePRM82QndZj?=
 =?us-ascii?Q?B24sMIV7lfFzsWJJykUfu+W823p0qRieLy8z5Ki3SmrNy9YSVfHxG1wm1wFY?=
 =?us-ascii?Q?qi8PaztOLLoIEsAtn7W8SosDEFcj4Fm01T5+/uU8ewg2U+dP9A1pFO/6jptD?=
 =?us-ascii?Q?hQ3sBSrYV/esQBBvSO0pnT5UWP2xX0QRLGB7BDTg2Y3WIrGo8C6ebAp1XM4H?=
 =?us-ascii?Q?DObokNCSG7ZcuJXFxuf9dFS9Q1PkWhvwUFX+NfW8wC8Olmy4qV0fkmh3kyxk?=
 =?us-ascii?Q?GTGG4FK5y2YxMvQ4WSO70JjLlVK+rlZ7SLadq2Nhqa2GRqqbJvff0Bacq03K?=
 =?us-ascii?Q?nfGVe4zFd2e3nDeIIoPUGWVTxPWQJ4F5MP4YdKIoUWVut92szBUtOg8gcFDO?=
 =?us-ascii?Q?DO0ZqLiBWWANTpMPlEwpCtDesVhufrMI8/ifHD2uVCvCKbzJwiZ9xJf71y52?=
 =?us-ascii?Q?Gbklbd0H0KbkBIghmDCUI9TxPEQIAxcHq0SnJFjE9icVEEc/bLYkhgWac+17?=
 =?us-ascii?Q?0IjQJjvf8q110Y9XucEBd38NkBg4swynlhhbwseDG7sL1KmJKhFWRZQjYPuX?=
 =?us-ascii?Q?UGSwBoZ97dvIQWGmGAL8nab7?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae50faf6-2d21-4e88-31da-08d8df360860
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4157.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 17:50:43.6317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mGdMqCfdHK5xe73d61jANep1qX6V1gzA7IN0ZX3B2xpNoEG2fxwo9w5Dk+fo+W0voc1bi8wDQzc3CsIHTlAiqEcaAvX1h5BrLhlcyF9j6wE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3808
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9913 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103040084
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9913 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 clxscore=1011
 priorityscore=1501 mlxlogscore=999 suspectscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103040084
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Fix a build issue when x509_revocation_list is not defined.

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
v2 changes:
  Use the new config option for extract-cert
  Use the new config option when building revocation_certificates.o
---
 certs/Makefile    | 5 +++--
 certs/blacklist.c | 4 ++++
 scripts/Makefile  | 2 +-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/certs/Makefile b/certs/Makefile
index e3f4926fd21e..b6db52ebf0be 100644
--- a/certs/Makefile
+++ b/certs/Makefile
@@ -4,7 +4,8 @@
 #
 
 obj-$(CONFIG_SYSTEM_TRUSTED_KEYRING) += system_keyring.o system_certificates.o common.o
-obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist.o revocation_certificates.o common.o
+obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist.o common.o
+obj-$(CONFIG_SYSTEM_REVOCATION_LIST) += revocation_certificates.o
 ifneq ($(CONFIG_SYSTEM_BLACKLIST_HASH_LIST),"")
 obj-$(CONFIG_SYSTEM_BLACKLIST_KEYRING) += blacklist_hashes.o
 else
@@ -105,7 +106,7 @@ $(obj)/signing_key.x509: scripts/extract-cert $(X509_DEP) FORCE
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
diff --git a/scripts/Makefile b/scripts/Makefile
index 983b785f13cb..bd0718f7c493 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -11,7 +11,7 @@ hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
 hostprogs-always-$(CONFIG_MODULE_SIG_FORMAT)		+= sign-file
 hostprogs-always-$(CONFIG_SYSTEM_TRUSTED_KEYRING)	+= extract-cert
 hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
- hostprogs-always-$(CONFIG_SYSTEM_BLACKLIST_KEYRING)	+= extract-cert
+hostprogs-always-$(CONFIG_SYSTEM_REVOCATION_LIST)	+= extract-cert
 
 HOSTCFLAGS_sorttable.o = -I$(srctree)/tools/include
 HOSTCFLAGS_asn1_compiler.o = -I$(srctree)/include
-- 
2.18.4

