Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A173586D1
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232079AbhDHORY (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:17:24 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:35327 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231962AbhDHORJ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:17:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891417;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GNjWFjXDejG3E3NOFeXgEdrLskVD3XbvsnvqDZWR808=;
        b=Mye3+QaI/9tPhJc42NLaTWC1BlJBF/317BzT7k7h8RSsTlw6FopZf67uREDLmJWF1rekv1
        aUfBotIHFrX7RlFtY7m7TOrN9v6Bc2V7WWOud2om7HfeMqShQq0HAAWwXEI4Ng6kPlUcIa
        2uzZ9djzJvLGbKlFeIzQCW3Kb3AtUy8=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-tzzGxpx3PxiplTRQhzGM0w-1; Thu, 08 Apr 2021 16:16:41 +0200
X-MC-Unique: tzzGxpx3PxiplTRQhzGM0w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4eRUcO0eZYlL09iU6KtToXdJ4ZY0+nEjBNx1Bvx6wSH8LzrOFd1I1VpZKwjPT9tBWFmkB8S8ULYjIkUApm9gTA4AokGAm4aHCyK93fdo2jKMn7yYKdDzTU8e0Yqh/GMCdteU/JmLrnvxzlB1v7G+6kP9rSxL0T2ncUALPWCwlug8OSNLO34hZ/mV3+ilPCW1cKN6V3m6gddRlnXkzENVE5zVAMe5CGhLmTKyH+XT4RfqImVpqBuz3KgOKvHK1wHqMdYZVlMGxxAdGHgmkFuATxzYjESXhOU/mNGUX9CxQBTwagtlOAD19RlUvvoof1+XzMht3RXa2L+hwuNAI1mZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F0kTH773gbCKICjeT11lBBAalcITmZBWtl2W9LJ9fA=;
 b=HWdk5RFZM0hUCtWCyj0JvLNbPbjVgF6E+CH5r8orBt/SIwtjMK9fsRanGN/AD1UOFhi9aOCkIMWzyTgyQ5UZzJ9/3scvrv1kcrFayHzP8+PXvIV7tBv6PfRbK4Zrt1fd6+eAFfmbtrf+SmCYY+gKdTXHb1B0bUh4DJzDPkSAs0wEZngj/IBCG9hiLUQ4TxQR50GpjGwP8BxAHjEcwiBZqVLM0Jq3Cd78mAuBDp2D7trv0cQAJZU0tKLXlfPb9hvxAPmYvyZ4fKdAHM36+b8Op8Vcm9TZGocdB/CgnaEpV/C67dOGwunGCWKd19tYk1ORX9A4bEv/Vs8N2YbinqHV0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR0402MB3572.eurprd04.prod.outlook.com (2603:10a6:208:22::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 14:16:39 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:16:38 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 10/18] crypto: rsa: Move struct rsa_mpi_key definition to rsa.h
Date:   Thu,  8 Apr 2021 16:15:08 +0200
Message-ID: <20210408141516.11369-11-varad.gautam@suse.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408141516.11369-1-varad.gautam@suse.com>
References: <20210408141516.11369-1-varad.gautam@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::16) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:16:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b188372c-d210-49f0-409b-08d8fa98e4c3
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3572:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3572016A0297DB46D9581A62E0749@AM0PR0402MB3572.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OlBx+Wc6ab3amZM6/UjZu/ku1nclB3CuRlGg73UbFPiJMnd0jHAJZs5A4vnLxFFVM4P2TmcbkP3nWq8HN9d0qkQUIBRHBTNNmrfY73wV89vhfvQqFIMey0KYhda+mafShP/5qT1JePMBzZtIlDzNTG/8R8RkXtv0kyIGxTrdzCOX72EpyQYbcPQSkrpa+0X+eTMKLDESirFlEoA6v4g/j6537XEVLj4OCrdMhmgRDFGIdwdzaRZZJFWEx1tCmWyxiPEXVrfmcnh+XOpwC1t29eiGBY7IpD4kutqHm0InjeuTcuGSj6VItMGlXXQC/9GHSH09/umfqqRIJ6sti1iYBW+uEIZJ096+wsrMVlxART2TdBitIvfrGBgKBKXrGAz6IxsQ372vDpDE3FSiSxMlNLs0vhxxRjAJLaq1yYg5iaC4puzP9tvILZ+TgShEoR7Hf7PAxYbpSJPuQ8xD5Ew59U0MfVb4SSKg/y/+XO4gkPCISET99hg/RfP5pPMGAjqgedQNidnEsfqS9uk+5gowrGL2GszdFLDanV/3K/uhXHwPIQ+Bj6eSM6BSy2jF/FayDkF5KzkZsmODTN0XWy7LxNUhbumxf+jm7YL4ZGyaUR0udEMwJ9nESYCDp/ltNcvnoJp3Kfvr551T4otnKi8XUk+y66ib3ZMHh1Zky19n0jXZ1OtvETFtPGhevsz9Qmkp
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(376002)(346002)(366004)(16526019)(186003)(38100700001)(2616005)(956004)(38350700001)(52116002)(6512007)(2906002)(36756003)(44832011)(6916009)(83380400001)(6666004)(8936002)(26005)(66476007)(66556008)(66946007)(4326008)(316002)(1076003)(6506007)(6486002)(478600001)(5660300002)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DvZaCPiSTkPaEKq3kyJp4YL3PJZB9xvjIh1eYvdzmbkVXSBRhKkC7yzKJ/GU?=
 =?us-ascii?Q?Y+40ZfPpmKoauAjGAT5/ZjnSqbl0HVpPit/syO/nbO+1twWbl+JaouR2Utun?=
 =?us-ascii?Q?wxhXJ+qty62uLyS3pkrKAw8E3WuKIkoJg3hSKUJHU+ploJbYP82laqhTaN/j?=
 =?us-ascii?Q?vB7gRTR9qsrOzzeuLVl05O12cqOdc8ByE26kw8wHsDT7iAmxPsIaEyj/1OtB?=
 =?us-ascii?Q?iclNicEwBq6faGOCqi0Pq2GP7041XUbUUl8NGc3xf8Xf/nt8shnykA7VdouV?=
 =?us-ascii?Q?PQnGIcf0KrsbAH8E+lqL/e8/0WO3sVXbyRVntI0pIFz1wluCp1zFKS+8mm4L?=
 =?us-ascii?Q?cKCoBCmEsXaPq5bJpcYPEKNx/5wmdQtrzhPgV0r+fp23fOZ1wWKZn2KIowFS?=
 =?us-ascii?Q?M/RUFKM4jrpuP/VFQwESudUGZgh4lDdhYW4BPTFHzKo0Ngy2rGkmr8Hfty3q?=
 =?us-ascii?Q?g8D3qDevkKa3f+1iRSxLAccD2kz233qVp439XaSkQSfNLcdzdjO8NpA/STHA?=
 =?us-ascii?Q?/Bkhi19uZppwmXB2quPY9LDgvFi3oS78wIg3W7lE9XRnNiSFFtjWoZ/Ecci8?=
 =?us-ascii?Q?5TaSsRFxMvh6AM8PbdCSSLtqAd8SzCGtFikU4mocwJnNfDVXDsxUSDmtjG/H?=
 =?us-ascii?Q?aRWdCTeNquKTiCdykRU59qBDsiciPIA/ocbEHtseFv0IYO2d/OYtOv9F7hhd?=
 =?us-ascii?Q?8fkDmtClY3Ifq0VjPzADtWbYFoI0Aku19baQ7UdMVZAJ4s73n7uZpssjHLk3?=
 =?us-ascii?Q?TllDzCR4/j+tSZdI8TGlLltnd6M2j+R3e0mTedlA3LxhIpF1f/5+a0IGbftY?=
 =?us-ascii?Q?9GalF7D/zkz4QQ34CclSsyTVU0+g94v26BOPzCa4PudD9ewChCMD7mm2tCdJ?=
 =?us-ascii?Q?OWqHMSkuKk7SKnYTeDOaZT2/OWrq05zZZJUWSzR/QM7X1bg3ZMxwpG4Znr6v?=
 =?us-ascii?Q?5otPpCjX6K8fGy7eRMu1pFv3gHJ17XGIntIa7QSmdX2vEMhIZ26qgCzFrNMD?=
 =?us-ascii?Q?sCZZOVfYIR3yNGIG/0gjau71B60Dm11hLCS4j39pDYxRrqhZocHOnQDsqVs7?=
 =?us-ascii?Q?3+diPEsNSV7o9Zwtn2QymZ1/f73BmEgvy4Ns6IzkRu/JBqDqFvCibyI/oGWv?=
 =?us-ascii?Q?G07NDn4Z/0b7ivtEqxtghqsBRzrfqwrfeKFOrUkfj4wsvVZ5JUnS7/MURSsS?=
 =?us-ascii?Q?/Qy9tr5ZL24/L8PLErwomBVnHdXHfStxkge1h9lhqDX775cIk+60xKsBDIq4?=
 =?us-ascii?Q?2F6n8qevHQq/cLc9pD15ikx2ysmWkrT4wZp15jzdS7NxupYTN/MVkqhl1Dxk?=
 =?us-ascii?Q?26A5sO9o+jG1S0hKlUUrLE1i?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b188372c-d210-49f0-409b-08d8fa98e4c3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:16:35.9998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loys/0cRTDZ3gzOhEFXaWVi7IAWymzdnypOG445DyD63wVwBhqIaCrjSUdZt8TeOkoR0SqoF3sIStCteYon64A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3572
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The RSASSA-PSS signature scheme requires knowing the RSA modulus size
in bits. The rsa akcipher_alg max_size call is insufficient for this,
as the returned keysize is rounded up to the next byte.

Since the RSA modulus is stored as an MPI accessible via
struct rsa_mpi_key, move the struct definition to rsa.h to help RSA
sub-implementations query the MPI values.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/rsa.c                  | 6 ------
 include/crypto/internal/rsa.h | 7 +++++++
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/crypto/rsa.c b/crypto/rsa.c
index 4cdbec95d0779..5c4eece5b8028 100644
--- a/crypto/rsa.c
+++ b/crypto/rsa.c
@@ -12,12 +12,6 @@
 #include <crypto/akcipher.h>
 #include <crypto/algapi.h>
=20
-struct rsa_mpi_key {
-	MPI n;
-	MPI e;
-	MPI d;
-};
-
 /*
  * RSAEP function [RFC3447 sec 5.1.1]
  * c =3D m^e mod n;
diff --git a/include/crypto/internal/rsa.h b/include/crypto/internal/rsa.h
index e870133f4b775..e73c61f788e68 100644
--- a/include/crypto/internal/rsa.h
+++ b/include/crypto/internal/rsa.h
@@ -7,6 +7,7 @@
  */
 #ifndef _RSA_HELPER_
 #define _RSA_HELPER_
+#include <linux/mpi.h>
 #include <linux/types.h>
=20
 /**
@@ -53,5 +54,11 @@ int rsa_parse_pub_key(struct rsa_key *rsa_key, const voi=
d *key,
 int rsa_parse_priv_key(struct rsa_key *rsa_key, const void *key,
 		       unsigned int key_len);
=20
+struct rsa_mpi_key {
+	MPI n;
+	MPI e;
+	MPI d;
+};
+
 extern struct crypto_template rsa_pkcs1pad_tmpl;
 #endif
--=20
2.30.2

