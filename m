Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD417300C41
	for <lists+keyrings@lfdr.de>; Fri, 22 Jan 2021 20:22:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729643AbhAVSms (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 22 Jan 2021 13:42:48 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:45572 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728978AbhAVSNO (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 22 Jan 2021 13:13:14 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MI9dRq150783;
        Fri, 22 Jan 2021 18:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=4Kdy3H1vNCwIMuqOEPXO+hJ8hB+cADG3Kgr05wZdrMQ=;
 b=aA1d8bWI7nJ0uFEsEChzcwNgdX7h53YuBEE8e+Isa3ppM9IdME4WwQ+mVa4ExWyiwF90
 vFXzNkfz1Q2bXy7LoXESO2051vY2Z1PyKhf+Y2MRLdehTiYEYuTaboTid93ln2u8xcY6
 DoyOhBZ00mCa7lZqs3adI3u5S2orOD0NAu6elE+Tl792xwoXFBCeSItOVbaoe5+o3v0Q
 i5xLmBubMm2RDwM+gziJqek53Jqp9dkT03e4mwg5oRbRNG+KCw9LSb3fZ6hk27dUC5DQ
 tLiJAaBI6tVIwtfmfVWxILCcnVZxVpNtB+3CaMbBWlglknouCBQo/nS4CWMnTyM2vM+j OQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 3668qand96-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 18:11:34 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MI4xS4149933;
        Fri, 22 Jan 2021 18:11:34 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
        by userp3020.oracle.com with ESMTP id 3668r1dq72-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 18:11:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IYCXJpBCTeFm9W8WgwYegd5/iwp81Do9njUKXZHT892sQf5cFA/XFdQVWLA4dYQh2/eFk1oIt4LMcvhO8bxJpPfeKaKpoZllvy1G9Eph4OOj/F+jnAzutdROF5K6dPN1jHAd3L6LelDsKssMxr+e37Y1Twl7DycXbT7tlUiug8Pc59GFfYrxKGrGASZlQtR6u2r9jhnbyVPJU8idZeBz7ivB6g3be8YQExmn3yBOsXYkUZJLBq1wy9+AuDkFe/Yt/lT+ewA0IZEFXVbHkUzVJRmokj192jLHyhoPWbX/J5FwcCzCIVJ2SnipVD4KMP5TEs1x09ZRjCooPJlZXllfog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Kdy3H1vNCwIMuqOEPXO+hJ8hB+cADG3Kgr05wZdrMQ=;
 b=FsPU26Wry/SpTZ+6lCkfwRcBPaDmz5tuschXeU1Q5grBWA8RGSnnkk5edk8JJxB27+vWZyBIsF7DvxGvePcQST6rWu0pg1ptRHZmSw+vc/k+vpYeAx8zIfKRWLS0TRwXnRiyVGAL36aWssUBo5rQSNWuhaBNtMolJXg3iTdFv7uQsz2UydG4DFlRPbjeP4pwBY7wAxj6yO1kIxU+2TCQd8H6PRMyXCvzPhP3YSQ9WaXfj7Ow3tcSPrDWdNgGWQtjvXzTw8nSoyAMUUCZb9ImiHaAwApoQcZ/5YFkyoi+i64gV8xdfYvkwGTIOPgGOG4jPPuxX0+8NbncPhMsdzkndw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Kdy3H1vNCwIMuqOEPXO+hJ8hB+cADG3Kgr05wZdrMQ=;
 b=T8uE/y5IATvsrvDUII54bJXSwEHm6U+8JCXrS1TzVhNbvzJzl55GzBTCs/r923AB3cgNmFk9hHiRRKEenCiAR2LuHlsna5LFOA0Y+qUofeoRfRMw7p+qNWujmt3yhV0ucuro3pl+iUM+i5zsSlIQfIvzvgWlbeSlAGyIA1MgI4Q=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3099.namprd10.prod.outlook.com (2603:10b6:5:1ad::18)
 by DM5PR10MB1673.namprd10.prod.outlook.com (2603:10b6:4:6::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11; Fri, 22 Jan 2021 18:11:32 +0000
Received: from DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4]) by DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4%7]) with mapi id 15.20.3763.017; Fri, 22 Jan 2021
 18:11:32 +0000
From:   Eric Snowberg <eric.snowberg@oracle.com>
To:     dhowells@redhat.com, dwmw2@infradead.org, jarkko@kernel.org,
        James.Bottomley@HansenPartnership.com
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net, jmorris@namei.org,
        serge@hallyn.com, eric.snowberg@oracle.com, ardb@kernel.org,
        zohar@linux.ibm.com, lszubowi@redhat.com, javierm@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [PATCH v5 0/4] Add EFI_CERT_X509_GUID support for dbx/mokx entries
Date:   Fri, 22 Jan 2021 13:10:50 -0500
Message-Id: <20210122181054.32635-1-eric.snowberg@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-Originating-IP: [138.3.200.2]
X-ClientProxiedBy: CH2PR10CA0006.namprd10.prod.outlook.com
 (2603:10b6:610:4c::16) To DM6PR10MB3099.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.us.oracle.com (138.3.200.2) by CH2PR10CA0006.namprd10.prod.outlook.com (2603:10b6:610:4c::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Fri, 22 Jan 2021 18:11:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39b3255f-bb04-45a0-8927-08d8bf01259c
X-MS-TrafficTypeDiagnostic: DM5PR10MB1673:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR10MB16736B982C49B13BDCEE973287A09@DM5PR10MB1673.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ucpL3MCWWdNqCLuh31e1AH2NBQHlb4RlWeIfHmaVgWLO3DewaUbvOqEmVglDCEOfohxw4ag32FIou1TkBsjuf+ErV5kdwRyBIXmNM0VeW/n8AChHlVykVNEQDnrb93j1uy+23ux9U6DqObOSYGYQWLogiSQehLkoMWbyYgePfVNefMIp/4kvB/1UUp8r4iCbhjpilm4jLoYxqQpPD1HPunz079OB7NYjRtsO7RfdSHCpowtrKWUgIftPjYd9E494YJmxB921/YJKuKMjSjM86v+BsDQsjJ7bGC76PTLIahut5Y5k2ejGvkKCb9DKiGVyEuN9C5LMzqAW5L2x9arJiVPVUpvEON6owEdbyE4Aa733pARM4teHENs7mOrK47wThkZCBWpvs7cGd0WbcQn46xHVjmZuXrlruOpRS41p2R5B89Ooq20N1YDBiQVyjq6F6RshS9Sg9UEfinahIXWGpucPw3iZU9//jnyxQUANpPVFbjEM9gU265ebxMDGQJmWCItYMxwI7yucJsFOJk2qpeSEeK5o4C7cScnjYyqVxZ0ZJthku0eQZZR+EPhi16V318LVLXgDLTcG0mu5SIXOnoQvKSgGujTQmLOvqStMazo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB3099.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(39860400002)(366004)(136003)(346002)(316002)(7416002)(6486002)(7696005)(2616005)(1076003)(966005)(52116002)(5660300002)(4326008)(44832011)(2906002)(8676002)(16526019)(26005)(66946007)(478600001)(186003)(956004)(36756003)(83380400001)(66556008)(66476007)(8936002)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aemAvyxxAgk+mwroTydRLW41Nr6mY2TxlvuRQXmCbpKOYyuIIsUgnkQMbqFp?=
 =?us-ascii?Q?2kGyHaeMEy06NaZBkhL9YiGymAbJKU2IRjygL8aele3gEvceS1R6V6m8Cs77?=
 =?us-ascii?Q?2kYq3JD4iTS8DkgxFCd5/lNzuK99k85VxpNOyHGssOE2IFKTSues91O6F7u7?=
 =?us-ascii?Q?lnryovp3wH6j69lAejLQcaKRy5vwDbJf0tudrtta8dMnSnKdGTM6ToBJHpnT?=
 =?us-ascii?Q?lXbvNdP4MfIR2md1q+1kLsu6WbFD2t6I31w9mttMhXbI42Xui8jtZEAvwkrN?=
 =?us-ascii?Q?blatJr9TsxeXfn0ExzG2yvK0onniFeYktIvY8DYokqVshp3s/UDv7B/WXSee?=
 =?us-ascii?Q?7G0gEDI3XtWsKwdZ4PSmw5AG5Po3cp95lNkXfMfQsb/p4LysRN13t782jbJ9?=
 =?us-ascii?Q?GFoNRMrDkafNuzbXiN8B2Kxy9f5Ox4YgEyb7u+YqwvEOSSarzrj0IzzSB+Zf?=
 =?us-ascii?Q?D3bzfCv//S5gH3LFJhonpR7lrRifSk3lqHA7TNrL7X7DJEYSGGJmOp384SQd?=
 =?us-ascii?Q?fEla1ubF62QXbZfkXrvE0pAdvD4wFuo5J5HL3L5/XinD7EBjQaGLnfQvEah2?=
 =?us-ascii?Q?hNkAdptmv291HaP20+HCigFVa2hpMae3qYcqxciqg/8LEQzybI3SPUAZ8+jP?=
 =?us-ascii?Q?AlIzyQ4sWVyDUWh2tiDoxdiO24nSVqerToEtf42xBF3D895dHA7f8erihwAT?=
 =?us-ascii?Q?Rwx6cr3aDxnA2qQs395ZOHY2+SCzsojMghUaVuBN2tCT0wS18UhEueZutnGS?=
 =?us-ascii?Q?yi4Eo6FnTzm7JUB5ExkRkz7DZAZojniQweVf+LagZWueFEDybYv/M/b+2eYC?=
 =?us-ascii?Q?FDNIK8SXOQzoi2Av8YTHMCJ1S34iarDsPvarxIcx0g76PT8h7E8TMCD1hxE5?=
 =?us-ascii?Q?C3jXrinN6Jvi8aqRz/BwbAShF9scbPMsVydxcw38iGCY9vOPSAV6rE0od4wQ?=
 =?us-ascii?Q?bCxRqKEq7ILRhp1gilspm0Ilkz1frW2ZEkoqVZQ1K3I=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b3255f-bb04-45a0-8927-08d8bf01259c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3099.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 18:11:32.1482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5cXvcEHaAvZHJOlETFLFCCepxzOuVkEKnKCoLNgl3sFrbdrUbahLr4EvRHu/faQUtkgQGQfQ/1Y9zTpcrpaaAtVja2NEq6EZ+cuTBRMybxM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1673
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220093
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9872 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1011 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220093
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This is the fifth patch series for adding support for 
EFI_CERT_X509_GUID entries [1].  It has been expanded to not only include
dbx entries but also entries in the mokx.  Additionally my series to
preload these certificate [2] has also been included.

This series is based on v5.11-rc4.

[1] https://patchwork.kernel.org/project/linux-security-module/patch/20200916004927.64276-1-eric.snowberg@oracle.com/
[2] https://lore.kernel.org/patchwork/cover/1315485/

Eric Snowberg (4):
  certs: Add EFI_CERT_X509_GUID support for dbx entries
  certs: Move load_system_certificate_list to a common function
  certs: Add ability to preload revocation certs
  integrity: Load mokx variables into the blacklist keyring

 certs/Kconfig                                 |  8 +++
 certs/Makefile                                | 20 ++++++-
 certs/blacklist.c                             | 49 ++++++++++++++++
 certs/blacklist.h                             | 12 ++++
 certs/common.c                                | 56 +++++++++++++++++++
 certs/common.h                                |  9 +++
 certs/revocation_certificates.S               | 21 +++++++
 certs/system_keyring.c                        | 55 +++---------------
 include/keys/system_keyring.h                 | 11 ++++
 scripts/Makefile                              |  1 +
 .../platform_certs/keyring_handler.c          | 11 ++++
 security/integrity/platform_certs/load_uefi.c | 20 ++++++-
 12 files changed, 222 insertions(+), 51 deletions(-)
 create mode 100644 certs/common.c
 create mode 100644 certs/common.h
 create mode 100644 certs/revocation_certificates.S


base-commit: 19c329f6808995b142b3966301f217c831e7cf31
-- 
2.18.4

