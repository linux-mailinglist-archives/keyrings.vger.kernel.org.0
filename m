Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 806C83586E4
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232120AbhDHOSQ (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:18:16 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:51035 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232117AbhDHORd (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:17:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891441;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iRrxgw68q6pfk4lUz7LU5w9BVk3PvX2ZAS9xN2QluJs=;
        b=fmuLAz8RKg3DVudDCF/TLLcUEc1pWYHWih/YKzbNYTTsZDd5wD/csiopd7KkzSCtEA1zhf
        mCrcq2PenIQl4VNqBRWTabZAw0evs3Tmuuu+5em04tgz+Ad+LFQBFsdmEdTf/ktpwdhYwB
        3mofN1QdZTuihm/0i5ChY034Mu5/hjA=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-7CC3_sUfOXizLHEbsMdYEg-4; Thu, 08 Apr 2021 16:17:09 +0200
X-MC-Unique: 7CC3_sUfOXizLHEbsMdYEg-4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jl6LVUTO0gr6u4yPEmc6h5WgjAPe7BKkcUW690d5xoq9e6djKAsfpEHe3FEdYkVea4KPCGbZsZwETkpSsWyxWnEhzfCmMAsVjp9FlJifCCJjjAGiqrtze59wjCmGFU4ouTyXmFnXtXkYxAn8fXB228z0OhiHMjTAmJxuGzckYpNWoxg0IBQDq74gCUufsHDOQoSeyAMXhLJGTI1D5iS2NUGPViEVdznPetd9OWJEE9WKfCzJzv5qFCfXVBzYSLw+iuj8BkzVQWp8Gt4x1PO4bPZWXEx8bMoTGInHJBpnmo13Nr6hVN/6PizZ58QflstNGaKrVWzxu5JdaZFMGtV27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IskEQdezwsG+1Vbwgg1ivmFRskQn4FAtE3PJv8JoXBY=;
 b=faTpkP2a+EMm4J1jAdU1FPTJcymssBxWgQlE5R5/wRiabPWLPpWwxKJZl8KsYZ3/Ep2kRxXMSBqE6Uq28Da5RBtyBr3FbVw+5A6+WxHXXcCphyAM9mb3+eoB8blPvdVwwUaJ71YFq+3fRyiwDEAmrn4/dUzdSVL0JQwJRZbCeWST6CA5I1/4RpalUfBbXq3XuIzApfMqGbCjLulXoqN2Wnu4PACRQTUagmn+uBGm+TpGriLoyVjn4qo1B/nKU81PBhWK581XbGpWY1imvZ22B/WEu1VgywkUVFOHf5OM3g48Z+xffKqYbB/3wMNhZZpnPawhMBkDUx7GTMAD45w9iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR0402MB3572.eurprd04.prod.outlook.com (2603:10a6:208:22::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 14:16:48 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:16:48 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 14/18] crypto: Implement MGF1 Mask Generation Function for RSASSA-PSS
Date:   Thu,  8 Apr 2021 16:15:12 +0200
Message-ID: <20210408141516.11369-15-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:16:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e7dcb37-588e-432d-37a6-08d8fa98f279
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3572:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3572E102703BF373574E732AE0749@AM0PR0402MB3572.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 43VUSBm4UyNwEBcrmhxFfTxwVBHo1hNWnTdqcHqegtToUJcwuZYDtgFwOClGTv8CUnZWdZnBe7IKgvaNSauj44vPTn7tota82YsHVU5cBFiCm6Ec9IWPW0p281v7JDm+82zfed3GDVIuwdE4AIhxia3zzzOBpdwvf8D/pcVq7mYZXVYkFEfp+KpKBqeT22w5DfXcVNS3FOqXaEwAp4tjRgi5bDT/V7lA/7K+ZmiwBmUTLhLlUdxfNcA6o7zyiuTTjsDXmJkjihJRyXJpJ4P8CfRpPMFQbTi4fHs7F+7FvI4KtVOsX79XTOvmkkOCUC5RboA/15cLRYAF52uPXLrMpo7JlXdXLKDF7yicK6R6ldlBv7ZQXOjlYoT2RRvY9zO6ZZbAhnBmivstMMuVbsaSWMx/eUEUtJNsPyVW50APXuKuyAf1cgbBpWZssfQdWsAKO65FrgpFeWvwI9i2YT451vIpz7S/iwzWZoYzAzZQP+OsF8ghMMSRM4czYXca4RfCEjAPT9koOMow7mx/dHsJ39nTgR3a7FaYi08l3n1BxjfpI4vWyrqk2N7/ojVPGJ10qo2CnvdXuqTlRwvZo5Mz1FE+0BFbQyoHPthPJimJ6y5h188UqvODef04/aLrF6VCr64g2OPQjQHZVMa+uB+bCmjhSdRYc/sKbtdJGqtBEyqi39Dhgffrrp7XU/YEFZ55ar4FpGZxw8QEC7NfJHep1Y1xtl2Bc/aAi3HurJuj4S4fnSl72nH5/ZnSWh/4D0S3
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(376002)(346002)(366004)(16526019)(186003)(966005)(38100700001)(2616005)(956004)(38350700001)(52116002)(6512007)(2906002)(36756003)(44832011)(6916009)(83380400001)(6666004)(8936002)(26005)(66476007)(66556008)(66946007)(4326008)(316002)(1076003)(6506007)(6486002)(478600001)(5660300002)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Y4f7O2+Zg+WZsnPJP2mwd7H0nmHhVDPYcUU42xkqu0oJxbjAGpKWOE1AxFjk?=
 =?us-ascii?Q?7GV74gLohGQPXKUA73MRyKEXUnsiUX+1KsxZHMT8PP97a/ZqUFKqmidW5VBw?=
 =?us-ascii?Q?wZq/k1v9iyxDfwIRj8w5ke5FUGQlWFt2XfkB9NDKoboYA3bP/Uheu1Ale1t8?=
 =?us-ascii?Q?wKqTCkTUcAeH8axN784uejMat4mFiS/eb29OgnVWyySCpD+qHyLt1x8XgfHO?=
 =?us-ascii?Q?DLnCS4tCvpLk4ik9Zg0KugcpBBsnBNXweYDacJg/hc8Hnq3Z2zzF+nCimpIU?=
 =?us-ascii?Q?7exorgQDcQisUImmSmVVlo3BIjTAiDLZt5Zm9CbaGDAWGTQ+8chPCWRxLAVy?=
 =?us-ascii?Q?ZIC2cnttoT0oEP5pSM85GdrWn3EJeg3i9zLrptoZvJbEoPKBUApnlv/hKvB2?=
 =?us-ascii?Q?bVO5+sUXV+SI69ugdgnPjGF809ZoxZ8coWypMXJzm9s8t5d7tzgA36kwVBTq?=
 =?us-ascii?Q?J23SzEeAJ2hAztxyjDG9awa4aHOYuVa+UeCS6T/JA19IAQ4Gp7j+63rDtMFd?=
 =?us-ascii?Q?l2KItwSkwgQ1EnGSd8FCmNUJqpM7kmJDyD0iztFLdIr24xnAZ9dIfPKx2EUa?=
 =?us-ascii?Q?MqKhhocj3eg+ix2C4zInLeFUbmn9oa/sMqanPLhTFlSqPWm6IfN4H5mpjn/C?=
 =?us-ascii?Q?qqekhlTOQ/XZOe8X2ZyM4P/mh4+7ZNBj2lxhZ25Oqg/zkIvpmgIaZ96NejPY?=
 =?us-ascii?Q?mC6oj0y0TKJHuqtp6pXnJCVWiDicz/nVINM5FTI6Ot/oGBMQT4qgoX8ReB/M?=
 =?us-ascii?Q?84XgBKZEbXcVA72PkQKCxZhx16CNN1ZuQ5Bm/zE8krK8CPL7MvetznXRUqgZ?=
 =?us-ascii?Q?0+LIycse94EEf//qkUAqb6DEOKdczshHl3dCfRfSsiUX5vz715XqbyqxFqOF?=
 =?us-ascii?Q?xu0YjITYbsIJXoeUT5OuQtMxON3Rvu5W/UOCklyC2WXW8RRgR8lIPaXV6DN/?=
 =?us-ascii?Q?GveZlTHMsl9OK4TR0Dynroy9mKK5LQST+QK3alR63jVDilqlp3RsuWyPMgN1?=
 =?us-ascii?Q?klCFQdlamT1YFZzVMetsYunktw0A/RSLatqigA3GZ2eBJ7rjzoLZ+4Y4h5Ec?=
 =?us-ascii?Q?e3NUO9u77NNfQgFssPRh9Fx8A7KMf00czobuOEyG309TwmMMRRGLBFE/ZNyg?=
 =?us-ascii?Q?SsOGQRciNn6Ebx1Po6coVxsgnR9UCZwYlEXUr4Z5vyWU+47YQHq9HcZB9sqd?=
 =?us-ascii?Q?GKH8Og/5F3VlTacb3K91aNBIxDg2OkPPOGf+c3x8ncWwVQBV4kI5BflKmvNu?=
 =?us-ascii?Q?Z+APT7ludipDlHWqqq8HfBrRPh8sQAkhvzZhCZCJ5xhh+A3pGSqsR18CgRYF?=
 =?us-ascii?Q?Qubie8lFKRn05yPwJ6NY6ixm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7dcb37-588e-432d-37a6-08d8fa98f279
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:16:48.3977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TRdmxlHOiNFBvNYT9Cmva2HTV82oRfisqN2GU2hLa/UpoHxxKigdQezGg+vFORMxHmqohRLEdlbm4OLnI1nODw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3572
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

This generates a "mask" byte array of size mask_len bytes as a
concatenation of digests, where each digest is calculated on a
concatenation of an input seed and a running counter to fill up
mask_len bytes - as described by RFC8017 sec B.2.1. "MGF1".

The mask is useful for RSA signing/verification process with
encoding RSASSA-PSS.

Reference: https://tools.ietf.org/html/rfc8017#appendix-B.2.1
Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/rsa-psspad.c | 54 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/crypto/rsa-psspad.c b/crypto/rsa-psspad.c
index eec303bb55b2d..ed5374c381513 100644
--- a/crypto/rsa-psspad.c
+++ b/crypto/rsa-psspad.c
@@ -51,6 +51,60 @@ static int psspad_set_sig_params(struct crypto_akcipher =
*tfm,
 	return 0;
 }
=20
+/* MGF1 per RFC8017 B.2.1. */
+static int pkcs1_mgf1(u8 *seed, unsigned int seed_len,
+		      struct shash_desc *desc,
+		      u8 *mask, unsigned int mask_len)
+{
+	unsigned int pos, h_len, i, c;
+	u8 *tmp;
+	int ret =3D 0;
+
+	h_len =3D crypto_shash_digestsize(desc->tfm);
+
+	pos =3D i =3D 0;
+	while ((i < (mask_len / h_len) + 1) && pos < mask_len) {
+		/* Compute T =3D T || Hash(mgfSeed || C) into mask at pos. */
+		c =3D cpu_to_be32(i);
+
+		ret =3D crypto_shash_init(desc);
+		if (ret < 0)
+			goto out_err;
+
+		ret =3D crypto_shash_update(desc, seed, seed_len);
+		if (ret < 0)
+			goto out_err;
+
+		ret =3D crypto_shash_update(desc, (u8 *) &c, sizeof(c));
+		if (ret < 0)
+			goto out_err;
+
+		if (mask_len - pos >=3D h_len) {
+			ret =3D crypto_shash_final(desc, mask + pos);
+			pos +=3D h_len;
+		} else {
+			tmp =3D kzalloc(h_len, GFP_KERNEL);
+			if (!tmp) {
+				ret =3D -ENOMEM;
+				goto out_err;
+			}
+			ret =3D crypto_shash_final(desc, tmp);
+			/* copy the last hash */
+			memcpy(mask + pos, tmp, mask_len - pos);
+			kfree(tmp);
+			pos =3D mask_len;
+		}
+		if (ret < 0) {
+			goto out_err;
+		}
+
+		i++;
+	}
+
+out_err:
+	return ret;
+}
+
 static int psspad_s_v_e_d(struct akcipher_request *req)
 {
 	return -EOPNOTSUPP;
--=20
2.30.2

