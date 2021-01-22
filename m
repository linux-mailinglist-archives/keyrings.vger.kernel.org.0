Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE603300BA3
	for <lists+keyrings@lfdr.de>; Fri, 22 Jan 2021 19:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729976AbhAVSm7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Fri, 22 Jan 2021 13:42:59 -0500
Received: from aserp2120.oracle.com ([141.146.126.78]:48544 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729466AbhAVSNP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Fri, 22 Jan 2021 13:13:15 -0500
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MIAM4j038529;
        Fri, 22 Jan 2021 18:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 mime-version; s=corp-2020-01-29;
 bh=SBIqqNMVfgCrGHElLt/6J7rn2y9r30+5dVX0+nKWBwA=;
 b=P9H/yO+hlmKHyTUwUItpsnNfmmlp4k/pNHeTLECc/RAWF5tZ9uSwsyQs8g7+Hx680Qkq
 +dY8R61Bb2LOtCAXHxaWYB5FK59y7G0yNSB6erBgM+HQY4e1q8/mDwz86Sc7Px6oKQoH
 Gj5JEKc0vQ+CwSCskEvDRHJT64f0DUhBqg+YAqbwpFrD8AQQBy1ibpYsUxzoOLfJBuBU
 xvSxIQPn68MTtc7F8MpXLoj03tfv/l7CgGdEfd9XKhydlkTlNhn07asDlxnTEosvw7c5
 Gf8HnSCG5RVXsFTUBzGUN/Ed6HKbYwgiP1hXMpgSLXilsKWrQvgg633WdckY3IW/oXyL Jg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 3668qn5cgq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 18:11:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10MI4xTr149772;
        Fri, 22 Jan 2021 18:11:41 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        by userp3020.oracle.com with ESMTP id 3668r1dqcr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 22 Jan 2021 18:11:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kdjxgADP1oMSMc6L8ot6WsvgCy39kFo2IDpjk+JwlQrcfc5plix/2JqJiheSibQh+nW5EWVii13nIH0MdNlqtuQhJdvzhT5IYhOuJGM9oq6nZ2OzQVFoqrMHZ+iBFj0HdnArlMnUvT7oHjkNz6eZuYLRLauzNJcl8s2NkSXxbEkP9JWtPyjVjuS61VjMHa9m0zFvymwCdWSPrNmAIZaWP4jOyT8aMjYlVT/X/PcAbEYNs+vS7yq/9iYpVrTHBenb4ZOQ07E1vx9RRxHeab+kEwWAAt1Pze/PotZiDagyhNS8UuEhn/l+JlY8tkCR0OlicYH1YadqfJJw/PtD3blFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBIqqNMVfgCrGHElLt/6J7rn2y9r30+5dVX0+nKWBwA=;
 b=bqL50em82eutkv6K/e4tQw0mNJlrJNp9mvrWp5Qe5cKjiSfJK0BsuNEtVhOqCWMoZH2R8fqIXR/DeJy8doDPIVgnKtOtVmZlPSLVG6k27SjJBS8eFB8ar2z+M4rcF7+9BuJjjNwq5W0Y58fIWXb+mlDbJwqyAT7zvxP5MCSrJqP24S625BJtgTLtq99shN4gsZ432ibuZf2j+Tj2lcjxQWinlqZSFgvNKagtmFPe4oH2BgDquCjkysQXH91UNuLEMX95fqZaygVShEUUQAabq2hUPp8StJ+ZyYm7IZkzmEHefT+DgtqECJ32jjN5PH254b45CsOkFaUdLL4Ek54ueA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SBIqqNMVfgCrGHElLt/6J7rn2y9r30+5dVX0+nKWBwA=;
 b=GzrGzI0eVoqFu9CgDLF7WxdnqJ+Rk98PjivU4XHGZnmD9LZNOzSEDunEHVkFS08KxfkJIdu9z9KaNSwaiI3i46VVEs03pZNYYB1tXAyUXlVI6OZlf/zvSUASSy8p0089OzeRlPupC2XIjpzIod/UHnY/PWxpV9qiCqX+WQ7BJlA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from DM6PR10MB3099.namprd10.prod.outlook.com (2603:10b6:5:1ad::18)
 by DM5PR10MB1673.namprd10.prod.outlook.com (2603:10b6:4:6::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11; Fri, 22 Jan 2021 18:11:39 +0000
Received: from DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4]) by DM6PR10MB3099.namprd10.prod.outlook.com
 ([fe80::70bf:d626:5218:70e4%7]) with mapi id 15.20.3763.017; Fri, 22 Jan 2021
 18:11:39 +0000
From:   Eric Snowberg <eric.snowberg@oracle.com>
To:     dhowells@redhat.com, dwmw2@infradead.org, jarkko@kernel.org,
        James.Bottomley@HansenPartnership.com
Cc:     masahiroy@kernel.org, michal.lkml@markovi.net, jmorris@namei.org,
        serge@hallyn.com, eric.snowberg@oracle.com, ardb@kernel.org,
        zohar@linux.ibm.com, lszubowi@redhat.com, javierm@redhat.com,
        keyrings@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-security-module@vger.kernel.org
Subject: [PATCH v5 4/4] integrity: Load mokx variables into the blacklist keyring
Date:   Fri, 22 Jan 2021 13:10:54 -0500
Message-Id: <20210122181054.32635-5-eric.snowberg@oracle.com>
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
Received: from localhost.us.oracle.com (138.3.200.2) by CH2PR10CA0006.namprd10.prod.outlook.com (2603:10b6:610:4c::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend Transport; Fri, 22 Jan 2021 18:11:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afe170df-7858-4b64-4bdd-08d8bf0129e7
X-MS-TrafficTypeDiagnostic: DM5PR10MB1673:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR10MB16737E6DFF3259EEE21362F387A09@DM5PR10MB1673.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ohlqo4oKdiLdox+rg3UzrmLVTc2aslScdD0yfJFMGOVyJ5iNy686SvWJoHgcXyP+1Pa8+GZoFRkSaXJsgWnerFg5KlAiHIPT0E2t8O9Xr9PB2Vokci6upIBKNWxBx3X0OrWX/Y8c9Hs0J25oQFbM3KGW+Yrek3IWlqLK3cZTMuRwSXBPeLdBgwItuhAnMWvcQDyMV08xCNF2SBHMtfgyPvajmERHBOufVA8gixHfRl1wa9HCxElQPZluhOr6nWEdoXqwtTcqEz77u8jWj+LhmRlc9hwKQioALOxq/ZzrSk8EFzDuVmhIRtJTMc2FQBsXZfTTFlxZFUAxcoDdv3v8p4Gew5by4SZUB6atTsI5HTDViI0Y2z/eO0ocLReHqFVw8UIdWAa+rfzhVtUw/UMzZoH3UIppCVbRdVujp1IwLD7ljW6wL3B+0NW84NMOswhJrdbMvAdILBFnwHqxw3N6IcnMDBiVOFCn2Y5hF0T2bN0RnTgwUSfrXedYG9XJ/yw8hw/fmIyEZxd1l0J6NlUByQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB3099.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(39860400002)(366004)(136003)(346002)(316002)(7416002)(6486002)(7696005)(2616005)(1076003)(52116002)(5660300002)(4326008)(44832011)(2906002)(8676002)(16526019)(26005)(66946007)(478600001)(186003)(956004)(36756003)(83380400001)(66556008)(66476007)(8936002)(86362001)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VICHSTGD7xid4aDoZKDlbbr8IThvuQoI1uv0jYo6TMiI0DeIpWgLzTA3lb2H?=
 =?us-ascii?Q?KIPncFGMz3ncZsTnMbOTxxDi2Mq8MYv23MC5HHk763oXhv6j9Soefl4rSa/S?=
 =?us-ascii?Q?GFSScKoiW6zOXn3aKeu7qhyVJD7ftzCNthl6iDsYHr847DYhIQ8bz6t9wG5H?=
 =?us-ascii?Q?l6Z188a2yXj/51/AWpb/GGJjLl+V3FobvlqeDFgvQ1VIrtf/sQHGpbxJ5gI+?=
 =?us-ascii?Q?7viC01YmayjGVXO5Oguem88PL0H9A/mXiqGM985mKs5Nn2JDKf+epPBbSPQw?=
 =?us-ascii?Q?wYufof7nieXJpdEEOLCLwPejjtKK9aB+QZlnEJXtu6q5MxGgElhx1mWB41LE?=
 =?us-ascii?Q?jbTMAvUCOwzh3EtozWqzVDmIGbFxvU8+igu70ZMQHZ321JWbfqg/R1nholof?=
 =?us-ascii?Q?cRwziY2DlN3pS684BCUa5LKETcUrIrT7TRpYEx9q9cntBs5SiXMHiNFmARjh?=
 =?us-ascii?Q?im2oc/A4qP81MwvwKf3V5a33hEJT8/NAhRv460x2MMYz/m+p1pHwMy1n1kEV?=
 =?us-ascii?Q?IghrS8QxZcN7vLaQUbI2YRY2QbB9U3Rc66BBAnAoqvoqow99hOKyK4U/Vfwg?=
 =?us-ascii?Q?kAp3aBjAqIyxym4ak6IgcMoIvB9x0TvssFexjjM3IfjfpjpAxUqhBH5Mo5tx?=
 =?us-ascii?Q?L6ijRdTUPkJPOx1ZWyVgWPk/pLYl0WfAfCC9lLxoyk3uNfOjkS4hq+8PhQA/?=
 =?us-ascii?Q?zM3YJHh6TYbkTGIBWdiGrcA33JC93k37JS+m9nCdudcYestAXqc3UXQf+Ypt?=
 =?us-ascii?Q?Ee/w9szG+EmYQummNqJgbj+8jjVCFkXwFkrNwTUUcNvA+nX/uyYHUlzXQk30?=
 =?us-ascii?Q?XjDOGRQSFFjJUI00aSiCaMvCMoEBwQduIGDqxQv4WhaBFlUbGNOdDl4WHxk5?=
 =?us-ascii?Q?Iu3/qMGqlulWfHh21iUf9Q13eY5mXYz8SBvz1tv27LCwIVDQf8bcQsq1XtHa?=
 =?us-ascii?Q?3vz0VDQnGffuiPQA6qxuER1qJ71YT8nViup25rIrJLE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe170df-7858-4b64-4bdd-08d8bf0129e7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB3099.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 18:11:39.4130
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J2p/ANLCZcNVSGCthhdhO44jOjzUYMRRO/09oNO8fFNhO0lrBulzy7QczwJvhQVKzbTxswn7vz29ywVrFKhsJkDusDZ28ZA2GrvZSPzQegc=
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

During boot the Secure Boot Forbidden Signature Database, dbx,
is loaded into the blacklist keyring.  Systems booted with shim
have an equivalent Forbidden Signature Database called mokx.
Currently mokx is only used by shim and grub, the contents are
ignored by the kernel.

Add the ability to load mokx into the blacklist keyring during boot.

Signed-off-by: Eric Snowberg <eric.snowberg@oracle.com>
Suggested-by: James Bottomley <James.Bottomley@HansenPartnership.com>
---
 security/integrity/platform_certs/load_uefi.c | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/security/integrity/platform_certs/load_uefi.c b/security/integrity/platform_certs/load_uefi.c
index ee4b4c666854..f290f78c3f30 100644
--- a/security/integrity/platform_certs/load_uefi.c
+++ b/security/integrity/platform_certs/load_uefi.c
@@ -132,8 +132,9 @@ static int __init load_moklist_certs(void)
 static int __init load_uefi_certs(void)
 {
 	efi_guid_t secure_var = EFI_IMAGE_SECURITY_DATABASE_GUID;
-	void *db = NULL, *dbx = NULL;
-	unsigned long dbsize = 0, dbxsize = 0;
+	efi_guid_t mok_var = EFI_SHIM_LOCK_GUID;
+	void *db = NULL, *dbx = NULL, *mokx = NULL;
+	unsigned long dbsize = 0, dbxsize = 0, mokxsize = 0;
 	efi_status_t status;
 	int rc = 0;
 
@@ -175,6 +176,21 @@ static int __init load_uefi_certs(void)
 		kfree(dbx);
 	}
 
+	mokx = get_cert_list(L"MokListXRT", &mok_var, &mokxsize, &status);
+	if (!mokx) {
+		if (status == EFI_NOT_FOUND)
+			pr_debug("mokx variable wasn't found\n");
+		else
+			pr_info("Couldn't get mokx list\n");
+	} else {
+		rc = parse_efi_signature_list("UEFI:MokListXRT",
+					      mokx, mokxsize,
+					      get_handler_for_dbx);
+		if (rc)
+			pr_err("Couldn't parse mokx signatures %d\n", rc);
+		kfree(mokx);
+	}
+
 	/* Load the MokListRT certs */
 	rc = load_moklist_certs();
 
-- 
2.18.4

