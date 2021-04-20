Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AED13657F2
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232197AbhDTLr0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:26 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:42039 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232215AbhDTLrI (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919196;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GNjWFjXDejG3E3NOFeXgEdrLskVD3XbvsnvqDZWR808=;
        b=QuCgyqx75BP+NK5x4PnSj+RpF0du5n5LtpxrMdMmbmFPdRpB7syY99AZc1waWyghtYcJr6
        x3sVURVtlAtXTSFRnXhlj9XEemBxCl+Musq/IOgqYpsGaRaKKCImMFTeu7bfmqO8HXhiaU
        RJwgWISRdsq/0lmXRSURRJq/ci9MSOc=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-2-p-qnXwYGPTC95uZTfVGp_Q-1; Tue, 20 Apr 2021 13:46:34 +0200
X-MC-Unique: p-qnXwYGPTC95uZTfVGp_Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y/1rqm4DQjlf40PXMxWeCYhj6IrzCEp14ZQohUb1KOlunrBadXjI3XfFj1T4WIKqzOFNsQBlwg6lv1Cnw83Jcrjzr7SUy29jqbScCZiVjag44V8T3eUPvVXHlGSCxlCjD3HopJz8lz32MTbTgBPXgE4z6tY0QtVUVZvFC93Y7a4igY1MGqKEGTrMpndUoGWmLK53L1rj88jClyrU7K6p6CmiZVjWtEZ79CliFkSFfp/QPNhz5iWIzZAQpfB5EVHlgZUe7hB32kYZer6/3rkGsmK12ERVW7khdtEdjB9AvNynOjxG1Bhxx0t/1gUeX5rCGguqiVhpmvcUzX7nRAJHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1F0kTH773gbCKICjeT11lBBAalcITmZBWtl2W9LJ9fA=;
 b=LRUbuGWFGIzQ/xn8kG7blQOedq5Z5th9urBYrGgFJLecoD2Il7gXfU9W/snGJQbu3mNdA5gx5F1X2EsLMwqnzO2pUD8SwrU50oVt5X+9w1dojVG39Pk+tv5H9JTKuEF4R7TwSQ/+4jISwqccBt0nNshxEe0FTme6nL/v6fgPt7wxJ+osG/TOz8qoc4mRfudQl3gif3hjnYDm6dluKSS633O5K+2roVnB0be5sfxm6vk3sK7eusryN/7Ih9WovIzmlgDPwuZz68TFE7gkO8pxti1/ki2M/O51lSlfpp1f6RAuaGj62TB9JpH5oiPadHh0i8WML8eYkWBgXbjZ+jA3FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB5154.eurprd04.prod.outlook.com (2603:10a6:208:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:33 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:33 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 10/18] crypto: rsa: Move struct rsa_mpi_key definition to rsa.h
Date:   Tue, 20 Apr 2021 13:41:15 +0200
Message-ID: <20210420114124.9684-11-varad.gautam@suse.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420114124.9684-1-varad.gautam@suse.com>
References: <20210420114124.9684-1-varad.gautam@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: PR3P189CA0083.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:b4::28) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef786923-2a0d-4aee-69b7-08d903f1f1f7
X-MS-TrafficTypeDiagnostic: AM0PR04MB5154:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5154736B8F8E22FCCD716458E0489@AM0PR04MB5154.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 12ar3CKvzqpnijPev7KVtD0EeiWB6/Xg6hd9qRDOYIbOnoQrtBh0aCGLPJQHdbUA5ogm3Qajinbos7KH4GLn/vbjW+Bb8p30rwSAsrqE/JOIIsVRzrBEVpu6dWtVVEqBUSu5ViWi+NYmWfJcRFUeoTolY4BtsGNyaAYvaSG6MEYaZ/DQJSXRbRDyReFz7DMIuqAT/OV5tyunVCsxoys6qslvKtjiqaWA/Sk7nARPMQ5aD+Ez5iyn1aRccPyZUBa/y8m5uiFosusq32Q+5wQ5NLT/G64EIQle2iftxmjIo4iDNU1h25Lrpnxp6a/IXO15+jifLbpR9evGgMlDYG0DQ36z7SnjkkGZ8/MsbTyq0H4/xLcjCnUckYjzdswkRxkI0NRhJiKSVVUCYDsHeUB73J/xH70dhn2LNJwZ7rPtcsv1n3JBQEbhr7z8a75Gg4hGydNSP2VTmDMmFrlU/RM8KsH57heFMePgdq0QiLixLUTe/UXs3oH3t6wKyzRwtVDNedID5XsJkoGam5/0BWFaJUdqX4dJuiljjutlfqqkg3vlU/i55fF5OLWpOYQnyyXhIBlKcPudt/CzbD5c7pdnbiqDx+RGGmqPj8Asy5PqWto2TuN+OB1FC4l8eGopvFJl37iWlPoFdVeNMCvsxXCuwv/EYzdFPEdT77maEAYfhcE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(396003)(39850400004)(26005)(16526019)(86362001)(186003)(956004)(66476007)(8936002)(5660300002)(66946007)(6506007)(44832011)(4326008)(6512007)(6486002)(8676002)(2616005)(316002)(6666004)(66556008)(36756003)(38350700002)(52116002)(478600001)(38100700002)(83380400001)(6916009)(1076003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RmEyKyMYVnGhmF0tHUeq4OvkmbWHqoy4/hm52B+9EBVFu/wU4ck7Kp7rWJ68?=
 =?us-ascii?Q?9/PPjHYZt8/6+fT8iy7WH7jY1DWjfmLE5T4R/ZmqZ78+yZsvL1tm9NknRuQl?=
 =?us-ascii?Q?HXnLQUWs84jBLL1U+sI53nLEMKis0qB+BDXvwkphDpzP0PEP0vK2GaUgFWls?=
 =?us-ascii?Q?RYBFOht6OFoNtTKF8OZxCOP4/AZJrf2AvHxdSrPXbM9bXgy2KCQk0PRPu0qr?=
 =?us-ascii?Q?YjJF1pb4kjKw/3UkmvVxsZG0N142idefu9KSIpZ0mgj3cUM7RmtKGWAQ8e97?=
 =?us-ascii?Q?SBbY4okroGh0jMIsOqV7fg1OyRzkYcpQiideFygxSddIG79YIGcG/7BTGy+9?=
 =?us-ascii?Q?qYjTnmTodHLfS8eJ/Zq2wgLneGlKQR6JfDT7ZnkI3+AXhQ1scMgriZLb2mdO?=
 =?us-ascii?Q?HxxzqsgZP+a2bnZ0rdAIvQL4CfkcTxegwPCrpA25cRFdOGisYkAgdEtBPBlo?=
 =?us-ascii?Q?i8oSwTDbEf+GoZUrk/OJ+xK7CHucW9WaImBKrk9mJTwfyWqGkgPEjoUI41bz?=
 =?us-ascii?Q?yMOVpbumSxdBt6gyI6RUlq++6/FpH4RZ3ktyobX+TmOR9DBYmdM4C2hzYn3l?=
 =?us-ascii?Q?ENQXVuiAO77Oz66RM0Mk5ijZRu1JPXAjhjhRuD2x2j+vRHcNkD4EIOAF+PoK?=
 =?us-ascii?Q?+NDsONW5eezsKCfhtTQu1kTYEPs6nchb1eLWs/0Wej5Yv2LI+fcK7YrAiTzF?=
 =?us-ascii?Q?SAMKKtqb8l9OHRSdAPxL1adtPH1QT+MSZmyHR17mU8NAcWP1anOyOPBLoiVI?=
 =?us-ascii?Q?CUuBrWdUdLD/8urGKIPjsGlTLZF6xhOfxWwGRuytgx0gOtWx9fFiYNO9FIew?=
 =?us-ascii?Q?54G6OsC9g58LG8gv3Sd03PC7tIfHrjjyMnY9k5JI+OIAuW8O1Puy6LN0swnq?=
 =?us-ascii?Q?5I2EiqS+CFLEyR+1Wj4OlTu2AOTPhCxtcvCEO8HA6OSkRj1Jx+BmtZBpDYhZ?=
 =?us-ascii?Q?bXe7qDNp++BOS+BvrXx7/laCSnt91k7oPZJHJ0KwBJbhxb6WqoG8qA4xA2rt?=
 =?us-ascii?Q?64/yXgN8TO6XpUMtHUhRPtWiy/5PxzhWiF8PP4SLR3x8Y3sgrX7ZArQr9bsR?=
 =?us-ascii?Q?C8xcGXX7s44hAcJE7rMkLN0EISQXg1tx4bKps7/PY07vI+t7YAhsdgYPR9dY?=
 =?us-ascii?Q?9WXZO3+W023XRDfPi/8Zv3y4urh/O5KTltSpEAuFOlSmQCUTZjBFdw5KVosK?=
 =?us-ascii?Q?Rzpqf/lqT10G/H6urXfASlU1x1masrbncttwgU5siAULa7RZ7iZ63qayZO1n?=
 =?us-ascii?Q?EHHkxxhwUTa++6qS32WGw5XRfxHGT1JvsueVtjZC7oTm7sFR6TdYYEKwZXiS?=
 =?us-ascii?Q?JTWHKg4/UESOUiD6lWYuqhFL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef786923-2a0d-4aee-69b7-08d903f1f1f7
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:33.5408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: roM9SdtJuzUiAAXI56WujwHCRvdIUt/J3GH/H+UOmPZwPxwRBHHi1/RpsOjnNOLHbCbyrmj3OCGPN4db/ePTaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5154
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

