Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC4D31DDAA
	for <lists+keyrings@lfdr.de>; Wed, 17 Feb 2021 17:52:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234167AbhBQQwK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 17 Feb 2021 11:52:10 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:41812 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233694AbhBQQwK (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 17 Feb 2021 11:52:10 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11HGp0ZJ168389;
        Wed, 17 Feb 2021 16:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=0TuWruc4faaL4wl84FkIJZxuJlkX7CeF/LtG02bC82A=;
 b=QjqJcxWLhc83b65CGW8MId2znUsrjJyzztbrYMx5cb64zMYxkoSlZs3xSDez28i0WRlP
 09SORXEmGn2MHNdV1dARj2xUn9GWeA1XhnujOKMrwbtrW/8wNPXYltrb/GbDmyda2ifI
 o2TQJcMqYifhwiQIo2LyNM0Q3c+BZv2u0jIuw0E7JFHmZeSyUryD6O2G9zDtKQf8K/xV
 8FP3qs0dbhFDvCgp4aHGu0hoK9f0/wzZ/k+IrXteVxNrr5hnNf1y2L380ywDrdBFrjj+
 iCyXUQWKy0lorVS852SKKUB2qPnhJzAXh5KzVociqcQmZqmGCkptFFOPw8Dik5t8yCZS dQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2130.oracle.com with ESMTP id 36p66r33xq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Feb 2021 16:51:15 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 11HGoO4D006002;
        Wed, 17 Feb 2021 16:51:14 GMT
Received: from nam04-bn3-obe.outbound.protection.outlook.com (mail-bn3nam04lp2052.outbound.protection.outlook.com [104.47.46.52])
        by aserp3030.oracle.com with ESMTP id 36prbppnnb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 17 Feb 2021 16:51:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMObwsAxWY+Oggs2hQtYOQFuITjEtXjvR+BZuLtVGqAFt57cL2jeCG3/YzMJAgV5ZFI86qW4/zr1XuOHo3wGe40vvkaEJJul3L5jbpvr6j9EZk5TuIUQUsgCKgwnO6PJMab1NlzN6dlRme8DvOZoJV2KIMlHD3Tzkyzi7EZ0+X8kV9tdlC8tJxEqua5oZKNzglMxc9FrmoIrai8jFWphFKtWYlOLQ2kJrevZE9Pzi9n5EOfqoouZHjnZ8cD1vWi4kCO5/9afegKd8ZaWSazZaQq0faqRlYwEy7Lk1fygRND9b8UOQ1Vpl59nC60FqxlyX+ZJMvMHjWLvHqT5tVrDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TuWruc4faaL4wl84FkIJZxuJlkX7CeF/LtG02bC82A=;
 b=gPl3thunPXtDQ45DufLVWAJ5LcqJM6CPyo0Um0sbc+RUKBbyq3puUjwtGhb6UXXLG43TzW40gP9OXyvVs0e2ZDsxo1z2whEZADO+qhxOy4hSlRwr+Q0jc8PBEzkTlXNZCqik5HrB12QEEdeafedwjOpJC05VKVj91IQb0cP3xrGqzSMOOa9RTq9BlM9SBSGpM4Mt+qy/bnyNV0urrw3VAygIq47YjzLGH7N7MwG03UDylEuHaCBVoTNuKUbspCl20oKUHaed6iyHewsmWOETJuXn49klTCFy7R/3mCJBri/zviHymkPqVO7ZdKz6PB/Zobv/G7CRV0HvNNFXNc37Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TuWruc4faaL4wl84FkIJZxuJlkX7CeF/LtG02bC82A=;
 b=CEs7JR7kMDe4kRQGQqe0beU8r9qhnwXU/Yr4iU20X5fB1RRr208oB9cAwS6vuaVHY/aUfk9a4Cf35ZdAYZjy/DJTMFor9sgmxaJfE8BHVDyIYOh6+zMjJbxzZHwsfDKPZX/EY5SwNJ1Lab1zh11kpz5I4rzr0TdJDnBRY+5hTO8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from MN2PR10MB4157.namprd10.prod.outlook.com (2603:10b6:208:1dc::18)
 by BLAPR10MB5010.namprd10.prod.outlook.com (2603:10b6:208:30d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.25; Wed, 17 Feb
 2021 16:51:13 +0000
Received: from MN2PR10MB4157.namprd10.prod.outlook.com
 ([fe80::f9c4:2f7a:9d35:c145]) by MN2PR10MB4157.namprd10.prod.outlook.com
 ([fe80::f9c4:2f7a:9d35:c145%2]) with mapi id 15.20.3846.042; Wed, 17 Feb 2021
 16:51:12 +0000
From:   Eric Snowberg <eric.snowberg@oracle.com>
To:     dhowells@redhat.com, dwmw2@infradead.org
Cc:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        eric.snowberg@oracle.com
Subject: [PATCH] cert: Add kconfig dependency for validate_trust
Date:   Wed, 17 Feb 2021 11:50:58 -0500
Message-Id: <20210217165058.1336155-1-eric.snowberg@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-Originating-IP: [138.3.200.2]
X-ClientProxiedBy: SA9PR13CA0043.namprd13.prod.outlook.com
 (2603:10b6:806:22::18) To MN2PR10MB4157.namprd10.prod.outlook.com
 (2603:10b6:208:1dc::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.us.oracle.com (138.3.200.2) by SA9PR13CA0043.namprd13.prod.outlook.com (2603:10b6:806:22::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.14 via Frontend Transport; Wed, 17 Feb 2021 16:51:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 92747647-16c6-4d55-40ff-08d8d3643bcd
X-MS-TrafficTypeDiagnostic: BLAPR10MB5010:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BLAPR10MB5010353366449882D8959D0987869@BLAPR10MB5010.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jJK65nKFfPRkRUc5yLpENJGw3PsLU5wDyO1ZdboPcssJw/lKnNR4DTuYaeYtmV7/eLskH9joBNEZAvdKLhPz3M99FY8shmOkrbSKqRAGCse5TFcqSwgYCtAkxUWr1UEnirayVN2g92Z+QZPhssjwK+0sA6dER5MOXj0cBSvqQEqdMzCP0Kuycbh/ISaiPeCpJiKIP0TiYNaOzkYuilDPwOgJ40TiwCzYhwHo4YCuuWxVEaxJJYVhJMsPJ3ylOMb4H7GGk0Q9jc/unyJClhGH+n87FcTmYbk6QOYPpmxasEft2MH/TiWcou1FaoaVm/cbeYhgbtnOQ/5hWrfCJC9a72xJgsh9xmSRHvrVRfRSSY3lf4gujKQ7jldjjQi3IyhvfzfAZsK+r8/42L6aN15njHqYo0VJXOMniOT5MwoLJpyNsMnGOWjkQln1U4tX9jM1xfpclPirfrJZmx6FcZggxwyuGcNJY8LWuXUd2ugI37qucsZAjBqOBk3SJhE+LoEieIGoBFvTYWtYNS6NEMzgiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR10MB4157.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(396003)(39860400002)(366004)(346002)(8936002)(66556008)(6486002)(52116002)(478600001)(66946007)(44832011)(6666004)(66476007)(8676002)(36756003)(107886003)(316002)(2906002)(83380400001)(4326008)(186003)(26005)(5660300002)(7696005)(16526019)(956004)(15650500001)(86362001)(2616005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+zCncDaYSw/PHrmhaGSkJJFm++iOBErSNK/B8kRrDmCKwRq80ecqrc830A5r?=
 =?us-ascii?Q?lDalW7GC3F9/+0Gt2tdYP1dWF3s2vFmdWPvY2fborI0+CC1WxgQJBSFgMaie?=
 =?us-ascii?Q?qp3MWPMryQc3jIgcg7JpeEVTM8LjvNUTNtKnFjhcVWOtbwJ2AnrC6Ahs27Wa?=
 =?us-ascii?Q?PYQY0KLIhuk3KfTPpBoC4T6ukZI5ouyUeTBJVBCa3WpGrnWk1v6Y6NTzlinq?=
 =?us-ascii?Q?kdUUSlPQujzoWF8PQDJtYMw+xNTMaBFxqNXEA+wuEHUPm3+2AB89LGj6invu?=
 =?us-ascii?Q?/hDnO4YEWQ9gWMzeao7PVhO18J7PEAB1PVv8gsKaZZoDj+V7LFK+TcdRIJ4v?=
 =?us-ascii?Q?jYFykWX3oGFB4Iw3Wfr1ngVXoQ90pjIKyFzevhNxDeIqqdE6vWFFvYGzYkiV?=
 =?us-ascii?Q?CptSMwmQHYbkDmtix6oczsfNxnKSRtE1xd2Brlfk5yCzVzNXtqAJU66WpFL3?=
 =?us-ascii?Q?Hzc9WrYQ4r8RkiG7H+li32Q29mVIKKWl3N/LKUN4SCXSfYrYi7R2RUFjE66c?=
 =?us-ascii?Q?mM6eRlQJtlidMuPf7rsJOT92GDZ98/xa+KrCaRVCGMKQqFajEyTQMgXvltcG?=
 =?us-ascii?Q?vVzUsO2eXetc3IroIWCkhpUrl4jUcOh6smBNguZJnOU3y1tP60EeUU6dicaK?=
 =?us-ascii?Q?fsJr83If+cHMouhFFWDrrdsUgA/RHakW3A/uLM/YE2my0GWGoZjL8I3yFyef?=
 =?us-ascii?Q?be2Nj+RLf+L3Rucr/eNeqfDB8N+mV2HY9Z+mDHjlP1DU9mTJHqArexn/Vdlz?=
 =?us-ascii?Q?TUG4ouz3yHBgcnhIe0oXHHv69k/RU4Ho1HQxI4WDiVsTs/+1hrlY4XJFwIxc?=
 =?us-ascii?Q?rY0i85eNmVRl89ABe00fOiOtyGWTemwkn6yqpVNzzfvcFztVyncSKGki9RKv?=
 =?us-ascii?Q?m3q88AyGAGIbdOkBrqB9rCTBF1IFseDvFPkhXHYz1dZfjRqBQuoqzCCrTl+9?=
 =?us-ascii?Q?fNdhE5TW9m4lwM7C/iVyIPHE4bNozOdViwmoNbHVGSBiXaW88xyicTnxEjj7?=
 =?us-ascii?Q?1oKHWss8cTn8SUGv/CQnxIvKpLEOmwDR42flimDZ+dlNE6WdezgkNFEZnDRq?=
 =?us-ascii?Q?vuaDpRjWa/FdAtAmrTWrtig540pvdkVtU44PE4mBVmdLN6B26pHgG8Oyu5S9?=
 =?us-ascii?Q?vr5X98OsFvLJnM7tZJcv4Wxku2+/8z3dur1gCG1uZR+xPTHxcAZxoRAJNkMH?=
 =?us-ascii?Q?YDiCZdfpzzyVLusVYeSGYXP2NRm8MmUjQAhSWwLB4AQT8oUehz/BaC02QePJ?=
 =?us-ascii?Q?wYXh9Fk40X05IMsyrC3q2eE8w4UjXLV6hsWmvtfR2GZ/LVe/IQiWQRIuLzb+?=
 =?us-ascii?Q?lz5kq9EDx9HRR/uspZP+SCwg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92747647-16c6-4d55-40ff-08d8d3643bcd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4157.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 16:51:12.8244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBd8ybFE4K9+xWsuEOWczzT+FZ4EqL2vC20wG8OjAALLE54wSwsLTcdtjHpd8Wc6FUgbgUB7kezyUayoDc/+RP6em5rl9gKWB/H0H1BKEAA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5010
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9898 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102170125
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9898 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0 mlxscore=0
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102170125
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The kernel test robot reports when building with Kconfig
CONFIG_INTEGRITY_PLATFORM_KEYRING defined and 
CONFIG_SYSTEM_DATA_VERIFICATION undefined:

ld.lld: error: undefined symbol: pkcs7_validate_trust
referenced by blacklist.c:128 (certs/blacklist.c:128)
             blacklist.o:(is_key_on_revocation_list) in archive certs/built-in.a

Make CONFIG_SYSTEM_DATA_VERIFICATION a dependency for validate_trust.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
---
 certs/blacklist.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/certs/blacklist.h b/certs/blacklist.h
index 420bb7c86e07..a86f0b52a033 100644
--- a/certs/blacklist.h
+++ b/certs/blacklist.h
@@ -4,7 +4,7 @@
 
 extern const char __initconst *const blacklist_hashes[];
 
-#ifdef CONFIG_INTEGRITY_PLATFORM_KEYRING
+#if defined(CONFIG_INTEGRITY_PLATFORM_KEYRING) && defined(SYSTEM_DATA_VERIFICATION)
 #define validate_trust pkcs7_validate_trust
 #else
 static inline int validate_trust(struct pkcs7_message *pkcs7,
-- 
2.18.4

