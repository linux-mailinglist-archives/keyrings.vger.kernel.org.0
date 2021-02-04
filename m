Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E25C30EB05
	for <lists+keyrings@lfdr.de>; Thu,  4 Feb 2021 04:35:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234328AbhBDDfX (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Wed, 3 Feb 2021 22:35:23 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:42502 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231553AbhBDDfP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Wed, 3 Feb 2021 22:35:15 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1143OTsc151057;
        Thu, 4 Feb 2021 03:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=RB7P+Pv4hZHA3FWXTyBAF/5mWygJB0QYPoN6Of4V3/o=;
 b=an8Us3eJ5XgwuR0JZELmBQp0j4EOD61ifWR+0jKQZmzZxPP7GHJeu1vCYJg/RIZjNIGl
 GCxaNYKQVsnfajfczhbEW6TOx+iKn85fakqEtRBN5l8lqpFA5iReyC7La8Wz8eW3aHHZ
 r5FDeCS6Qudsy94+8s5xx51Zy4E+o39ErAxaz+wpySBksrL/ajQ4IhNoeYA6nAbz5GKG
 w56chF8ITGuPZOhUKwVswSCaK0nml28uT6CXpMQpgJlm7OdHSqXxWW0Y+7Wq6UTmGA14
 OLIL3MYVhOQOIs4fzg4NqfMHv7GQ5B/ItUxc1d8F4UhL1dDnj73ScE937X9nivzm050h 1Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2130.oracle.com with ESMTP id 36cxvr5yp9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Feb 2021 03:34:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 1143Os4H046367;
        Thu, 4 Feb 2021 03:32:24 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        by userp3030.oracle.com with ESMTP id 36dhd0r0dv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Feb 2021 03:32:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyBeUCtMZmntdOzQiK9f/+64ePpX9WyfbgQpfjRpzl7bH+mEQ1pvoeQjj4F5amPAtdoouRxySy5khNEiny8Im4u9uVi2D9sE9J2sz1kIi/8BjHiPOMTT9feJK/20tkvQTAxj6ReKOoy2NU7gFJpyomkZjX5qGM7u/3fkhD38sghS6v4mFzrOC2BKhL1L9x9cHw7bWfnCW3Z3COzWRLwYRdxBNNUYj5+5VCMVq5KeErvErGG6Lk+gxVmKXbm3hqgM5QdmVUe0CUiYmgQlxIjxv6ghekKry3dNqZcRd6aEl0jxASd9Ahr6V/buRPJUPJwfFUmc3WZPwOYeEKSuYmCenA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RB7P+Pv4hZHA3FWXTyBAF/5mWygJB0QYPoN6Of4V3/o=;
 b=aUYZf8X+vO/1GJVop0Ht4lrsjiu0aE0O3zVby5igWSVFlck2ZRurIwd4naGgpdOfbabWX+dGyODywGUAJaP09qNM/SAGg6sgy7iHLId2L+FYOIIWcZLBdzPJ+yWyCN2tIJrH1LM3+glO2/9T7ljZqjW2ox5YVbMemJRDPxlFkusrapiGAU7dO3JyE2+7vSYyWs2bX5wlOzRF+FZA9WpvSSYQ/xt1+g38xWrnLMYegKvGXN+TYz2Tx0tEFzjwmnVlR+ctnXOAqg24ZA2ynJFXmwmAc3XQKIVB3Hm50drow+/Er8ri4SFvcXMMZwhMawY3giH5AGDIrT1gJPXmk6ybFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RB7P+Pv4hZHA3FWXTyBAF/5mWygJB0QYPoN6Of4V3/o=;
 b=e80XCKK0mgp9DyZ/Cioh3c0en8IBxAlF1gp3l1ju3aiMbFMEn5yO9dD1YZgeQZsh7HuqzczPkmwRriMf/8gjHb0MCevsoNqy+MXOK8NmgbMl6FQlb6jlLdB8huiprwxIkNFXx3ndwwEuQdNUJxo/dAJK3ZJxuw8tmyxzoIsAaHU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3099.namprd10.prod.outlook.com (2603:10b6:5:1ad::18)
 by DS7PR10MB4975.namprd10.prod.outlook.com (2603:10b6:5:3b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Thu, 4 Feb
 2021 03:32:22 +0000
Received: from DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4]) by DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4%7]) with mapi id 15.20.3825.019; Thu, 4 Feb 2021
 03:32:22 +0000
From:   Eric Snowberg <eric.snowberg@oracle.com>
To:     dhowells@redhat.com, dwmw2@infradead.org
Cc:     keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        eric.snowberg@oracle.com
Subject: [PATCH] certs: include prototype for load_certificate_list
Date:   Wed,  3 Feb 2021 22:32:08 -0500
Message-Id: <20210204033208.1389901-1-eric.snowberg@oracle.com>
X-Mailer: git-send-email 2.18.4
Content-Type: text/plain
X-Originating-IP: [138.3.200.2]
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To DM6PR10MB3099.namprd10.prod.outlook.com
 (2603:10b6:5:1ad::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.us.oracle.com (138.3.200.2) by SJ0PR05CA0188.namprd05.prod.outlook.com (2603:10b6:a03:330::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend Transport; Thu, 4 Feb 2021 03:32:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15b45911-f20b-4ea5-0a67-08d8c8bd7b72
X-MS-TrafficTypeDiagnostic: DS7PR10MB4975:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR10MB4975A7887768264390C9B87787B39@DS7PR10MB4975.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xxUOWO+KnvKLMz46XgigrAQJDH65eEnr4aSAO8yl6WTxgDCliWj+HtXA4FG2KggkyurLwsf25Ei0avlXWLLf7cq9jDcejhVXzLgymkbg/gVX6et4MgU6zvj5gTj2ACvg+cw1tOY0EhLFkiZnoYY4h4BwTv4hvcuhhd/kToSWT+KlywK4E1Xm3c5qQ92nn7D99JBCg0rmVxO9yAhwWN/tlXL3QEqw/DBuaK2MhzjqQsb2F/S/C/ZQ7qoD57jjb2zteRxUzrFLqMtpRjnJsEJpfQ128fEsRhhgUs7eHmQ54qDfoAb/qLI2oi9+tzgffCU0wuBgsvOsiVUHbItvxgbO6qwHP3I0Hd2OItefBfhIGUyAtvBUpzs4J2IBcLG5ig8Pf5a0qGHQTWrto5h0oinKRBEcZ4CwVVBHyr1V8YbqTYSc8zhjVtKNlKxzilLVOD6bqavg48m2yiaw569WedXUqHMtS/uOSjY0UDv+pONMGLHVt2XKRrOGcfp1kxzoDapV7tlAcqr0kBwXVg2KyHJG1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB3099.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(346002)(366004)(39860400002)(396003)(16526019)(186003)(107886003)(83380400001)(86362001)(4326008)(956004)(44832011)(5660300002)(316002)(2616005)(4744005)(8936002)(26005)(478600001)(1076003)(66476007)(66556008)(66946007)(2906002)(36756003)(6666004)(52116002)(6486002)(8676002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?b+pv42W1Khxfq+yxZSurDSA5z8qDukhDcEAR6x2vNFvuWZx9kIbyCN4Eqau1?=
 =?us-ascii?Q?C3YrdCfJcILEQLhdm9NsfNZv0s6kYvzmKkcJQDJjJpEi3RSxOfkgKUc32lij?=
 =?us-ascii?Q?Nup3tVvoJohQZsrxmc/eB2ponxObaHHDRu1CkfhpXteaUCXQuoPy+rdXQjai?=
 =?us-ascii?Q?xviDZICxReDNz29LrMZpk/qJFUCwtsPfXRx/c4eOWo6EbPeb3Jhixh/Jfeuj?=
 =?us-ascii?Q?bunJ0bTexypBZqEogI+14UF+hYSuIWiaH5sYx5djIECfGWRXjqLGPdu1fz8N?=
 =?us-ascii?Q?kOe0S43TUwNIJs4yoVEXbKSHrGhqg/rU1iKbpixcKcZ3huwOf6NkeAxrmJIj?=
 =?us-ascii?Q?MVa6DWfWAMCloTHjSFGX1XJXEh8fIrZ3Ky2+zJWerjNqcIwHbgSNOPL3oyF3?=
 =?us-ascii?Q?gDpkWrhyqCBelH5us3/kFrQY60XWi32ESpFWaLJDeA4cL7FUkpmBPmfdaUuj?=
 =?us-ascii?Q?6xyzvputBpfMOZuiQHRFpFcnqf7y6SmVGcvZ1LFBxkTyqYeuheBKfssCN7DR?=
 =?us-ascii?Q?hJgjCW347hxFaVltwWWmHEWhR/7iwgyJCyemB3YDtn/9wdue3dDCGxY6Iw25?=
 =?us-ascii?Q?1VHw1WyT1Q3D4SnPcedbkSoFsNdpWDCq06AY3hxsMPXxjMsVpFFDkyQz8ZHz?=
 =?us-ascii?Q?TAeOPkjQ/5Y7V4DB3y/sgG6y8P2Z/HN4XWhp2cnmqYIya/GR6xQz0D4YNEBN?=
 =?us-ascii?Q?4H/6CvZDj8ftH0Z0Ti1EgcuUHUUVjO3DVDQ87DJNXXvFWNTyWC1o87+MhJoP?=
 =?us-ascii?Q?OZR3DLnU8cFCtBnofnJI8QRsjhJ2q0igW2iR2bD6zx6i7LPwCs491GC2e7Ll?=
 =?us-ascii?Q?2JFoSCUEk5L0RAl8SHSeQogipuuG/3rsbCTT/FexLKQH/NPhQG5XTeP2Rkor?=
 =?us-ascii?Q?gXuhBOVwdHVUnvnF7u0wgVqWXx1kWNp+CO10YZ+IYgzE513GgDOGah5hYlKt?=
 =?us-ascii?Q?IriVzGcrhczYzo2mg27SLzrUAhbYrq8lYctwQaNOsrJaSaQkwt8D/6w4SkTe?=
 =?us-ascii?Q?XORaxVPnzcJ7mjco+PJE/H59CZfNEiPTEu5XBCwKR0Omz0HQeUWt2TSgq5j1?=
 =?us-ascii?Q?HrJ97Dhg?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15b45911-f20b-4ea5-0a67-08d8c8bd7b72
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3099.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2021 03:32:22.1129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nVelSpA3YBJYxv6tQZHqG7Q3z5YweHKhNR8M5cWuSFWw17PoVYnt4vWz9MLQp7zKL6UmkBiPzPuJeIRv7u0bqW7ggRqinmr0j+l162xCO0o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4975
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9884 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 mlxlogscore=999 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102040019
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9884 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 mlxscore=0 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2102040019
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The build test robot reports the following when building
with -Wmissing-prototypes

  int load_certificate_list(const u8 cert_list[],
      ^
  certs/common.c:6:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
  int load_certificate_list(const u8 cert_list[],
  ^
 static
  1 warning generated.

Fix the warning by including the header file.

Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 certs/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/certs/common.c b/certs/common.c
index 83800f51a1a1..16a220887a53 100644
--- a/certs/common.c
+++ b/certs/common.c
@@ -2,6 +2,7 @@
 
 #include <linux/kernel.h>
 #include <linux/key.h>
+#include "common.h"
 
 int load_certificate_list(const u8 cert_list[],
 			  const unsigned long list_size,
-- 
2.18.4

