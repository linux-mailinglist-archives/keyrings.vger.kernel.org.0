Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999BC3586E7
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:18:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232130AbhDHOS3 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:18:29 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:24909 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232054AbhDHORo (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:17:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891452;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Gi1QTA91cQ04j2dsKALt2E8D20b12P2HzyMTUHz5qfY=;
        b=O6L96p6JTwtH7xr1SY17wiavTUmyfbAJ6bs06x3JBFOr+gwCMg9gWh4lU0d8YVxmgVSPFP
        ck8GH+8wN0Ttp4dUHgQ3G+PDFkHO9stleg9TwZR1SxmWisDWUnDwskbdlXjY+jsLJAsukA
        +CO1EOiJeQl7rUoQj4JihbGLwZR1mkE=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2105.outbound.protection.outlook.com [104.47.17.105])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-5-JMKOEsrTPGqCDN4FvasxEA-3; Thu, 08 Apr 2021 16:17:16 +0200
X-MC-Unique: JMKOEsrTPGqCDN4FvasxEA-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtzaMOqWgSfvPvcWADuDFNoTQcDVJcEv3QUjGwTeC8W+6V3YcLPbGo1pvT06ql8eOa9l1+EZn59aOBSpr+bx6hrfdSgW4XqgICCCIiP5OmgJkiaf3lV0qiMvhHEUJ4NVzppgx48AiXIx9zP/3tczHpLXaecnZoLpxkwAxBvC5eNlbvmDkA8eGeufUd56V+VtocObDP2pjlxonR9Wu6M8HBvQ28SXwL1SdJU4hISLwaZKaGZbmHSIZA2gzHcM0EG+T8mDVYkdxEL2ooL2RAxi1NqsGXMVlzTZ1UIr/WIHnz1QEkz/W5Ki8sAD7DjE7hK48K2+OElU9m6PEAQf9huIhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xDN6qusrHHlYH2y3rkKXJ6kk5Nij4grlay+a7TTMdU=;
 b=CHFQyVmvNTdhj+JTC4d6t17TzPTXrzCb1EYYKHuM0zZhK65OrL1j2gHJpP0iy7FVWGCH/4znl25rS1YDnVSJe01J5kVmhG3YyM+1UzlbBcmW5T0ZKG3rPMR/gZ+L2aixTcyJoStIFlIJtdPH8ArTVtUS0pT7pwAnKisJAszn0D4LO/+z53tzChjbHlEgDXunxUpHJOmFhzDtUhDb2Yr/PzqPe3uwpkzuo/w3rJ7gMjftGpI5tW5xt2ZuQyEurJMeVXHW7K8nvOwBeLrrLjIDGfHViYQmu5CwKWL0FBqaH0rSJykDR/OJb/ZEMmfzKfWBxWk4MZLBKxyKQt8pKYKpyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR0402MB3572.eurprd04.prod.outlook.com (2603:10a6:208:22::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 14:16:54 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:16:54 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 17/18] crypto: Accept pss as valid encoding during signature verification
Date:   Thu,  8 Apr 2021 16:15:15 +0200
Message-ID: <20210408141516.11369-18-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:16:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 654f3388-95c1-46f9-d862-08d8fa98f565
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3572:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB357275317038248F97D2E7BDE0749@AM0PR0402MB3572.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W0SskvxERI4R+oDxY/CaQ7neZ4r8zlVOX4i4Bn1oNXtQQPPp36pGUCb86jFa+WA+XkXrnX7NRex911ISLYJB/qcCJah1iDk1ttj6svPqrz7vJx0acJALEhA0hGE+edOsQQvKywawS6KZBRSRwRGSt/x64EaEGN2XuNY5tn5PTZhLjcFs7ypQqVbfMXtthJ+J+PpHmCdBAOsDTDqvNG2hYKNIBCHvVH4oTYcaFX0E9kVlrqKmxDWV7edNxpZA8Du9Dy8kHhfBFIS25YUDJ6Seu1alFXTNQN4IWR7CzQnUXTefwmWdXkLVPS+dP0H5nW/P/D/GB4M5SkhesUc2erD7EOZ0DfPELA8WO64jeUco2nmD8lnnmhSgS1A1wmdrRAvkfGZsU/efWhXo2NXiBsP9rLI2i0oo4QmrRpbLaTJr/PVKHtKCfQCq4IyyY9Ov5ME1iNTs4Lw+fK7TGv2saC+6oI/kyuIM3yPJ3L21rsxfgL+3UM590lNqUIBDktcVMeiv9cSevPKKBFGnFGFLkeMTAG7rC7loiC7MjTcdjBc76e7nqQth+ZbavmkJX/co0cZDxZMGcI8lfOIsV3AZhYM49cGP2h4Flon0wKLqHLVrAG6/YNbazS756X5VVe/875Qchpaun+r3tNku6qoMD/4pRH4AxQpafRvkSM/pXQVUVBPLeWdfPcK26B3j1vAUTXTC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(376002)(346002)(366004)(16526019)(186003)(38100700001)(2616005)(956004)(38350700001)(52116002)(6512007)(2906002)(36756003)(44832011)(6916009)(83380400001)(6666004)(8936002)(26005)(66476007)(66556008)(66946007)(4326008)(316002)(1076003)(6506007)(6486002)(478600001)(5660300002)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rL5vEEx2KGRZZa70I7ReC1NDG2+c1mhgBqVOgV/OK1XLsGZY5TaObAbXN1gj?=
 =?us-ascii?Q?d2pNwL1zvZLYyVDOhMg4lvUxt45gwNad3cNob+0lGgwqaITbDox7QRB8U10X?=
 =?us-ascii?Q?iZULLQizUj9nNNb1fZv/VbuRY5p+3UpkYJZOKQs6MoQI/s4Z7jy3YJ2uPxtc?=
 =?us-ascii?Q?mBvBaIk+oCigp32yqksoTkjMnKGq8pXGrdxU6AlE8Qt6yIb91Oi/2PnUnrCh?=
 =?us-ascii?Q?slzcKXEw4Bljm1ssHoS7mrtghsLH2eDDakgtLRzqOhrQH5WX8NYMNnW8ixj/?=
 =?us-ascii?Q?MPuPFJJAOnL7MdZxVnzhlUTgEK/ySf+Umdz46Tq3NT1b7sQoEA9tfKqx0FJr?=
 =?us-ascii?Q?i9AZNuPlxRzeALC5e7zfUs9J5gYUHSgejVe0cnCWk/Sc0eTUNzr33VNW+93a?=
 =?us-ascii?Q?Xcvs5bNPPLTa5twMATxxAISu2OJrZ81unX42PugJ00DxwM7fhw1IdW/UHbtj?=
 =?us-ascii?Q?xngmC+4cXPPrjSulS/P5oFuBDmF8ctjVngKIgVQzJlfHVNX+tywbOdYnYLaG?=
 =?us-ascii?Q?/6VKJjPPmcw7dclQXreDqOCevBPWNQ9JHU+JvW84NCLSKl20VU3bDSULkc13?=
 =?us-ascii?Q?pAuN8n8eKdeARoHJkloKkiqKdFvhLf32Hb08pt5x9KJZpZ9XmfS1GgAMvpaS?=
 =?us-ascii?Q?fh5cYW/CY/BBtth1eWchfeJ+SWZHWyKIA7/wVrBsIm0ACXZSiIOl3uwqhlu2?=
 =?us-ascii?Q?Efy7ojfhorgLzL2EFnegCwdDfKVjGzjQ0YRM7EF2vNkVFIO68lNrmjTHADlm?=
 =?us-ascii?Q?3WHdQBgHFwMw49dohMNkNyrrooHdgfsDW5nqMik2UIzZHAPxxihTO2kv8v4V?=
 =?us-ascii?Q?9AKwAk3cslic890SA9MMaSuijxY6YRf72wvt9KTgtis+6B6tHd3nZ+zC8Nvp?=
 =?us-ascii?Q?72aJibKsUA7+u6H9mGIwWMljzh+b8yQADZ0olDRzOXH1cpuSACDVnc9wRk6i?=
 =?us-ascii?Q?Rd+b2AqC8eOd0ylGT4pThaE4rIhRZACm6J6e04k2kK6KrDli3zrpf4Od9pZ7?=
 =?us-ascii?Q?nW+foBNudKPMNZDrGD4B8zcOet9CqZgQyhvYS4T+dTpnbA4PqKl8HDQQPf7l?=
 =?us-ascii?Q?evA80rxCsZs36Fmp40iGPOfjGIU8C0G+5LyaWylH8WxPsilrmpZpcehLiVoS?=
 =?us-ascii?Q?WpFemqNXtrCwaqFZ8vBvggm7/576P4GDIJmNHHDNe9VKzk+40ZxQ8vKySFT0?=
 =?us-ascii?Q?39dSpFY537tcHgLUzW/ad8NNCTQuQbbAIdycE8l8BD3EAftZ/+Yq4/5C3isc?=
 =?us-ascii?Q?nn9AnzwaHTNyki6tCFKQRFo3mTnQjVRWToh1FWui+eMDpkAEEuzv9nr1XyxI?=
 =?us-ascii?Q?bhIE1awB64N2Xho3GPcG9NxN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654f3388-95c1-46f9-d862-08d8fa98f565
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:16:54.2314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r6RVAcPFOEGwbXJlFEF1Eqyn6zq0nGQEVUEJa+Vt8nP8lsgWx0fH0pC3mZuAUNkA/FFrVm0YwdzDpt+FsXxxBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3572
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Accept pss encoding for public_key_verify_signature. If
CONFIG_CRYPTO_RSASSA_PSS is disabled, crypto_alloc_akcipher will
fail to find a pss backend anyway.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 crypto/asymmetric_keys/public_key.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/p=
ublic_key.c
index 788a4ba1e2e74..b9cc83ba7a127 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -69,19 +69,20 @@ int software_key_determine_akcipher(const char *encodin=
g,
 {
 	int n;
=20
-	if (strcmp(encoding, "pkcs1") =3D=3D 0) {
+	if (strcmp(encoding, "pkcs1") =3D=3D 0 || strcmp(encoding, "pss") =3D=3D =
0) {
 		/* The data wangled by the RSA algorithm is typically padded
 		 * and encoded in some manner, such as EMSA-PKCS1-1_5 [RFC3447
-		 * sec 8.2].
+		 * sec 8.2] or EMSA-PSS [RFC8017 sec 9.1].
 		 */
 		if (!hash_algo)
 			n =3D snprintf(alg_name, CRYPTO_MAX_ALG_NAME,
-				     "pkcs1pad(%s)",
+				     "%spad(%s)",
+				     encoding,
 				     pkey->pkey_algo);
 		else
 			n =3D snprintf(alg_name, CRYPTO_MAX_ALG_NAME,
-				     "pkcs1pad(%s,%s)",
-				     pkey->pkey_algo, hash_algo);
+				     "%spad(%s,%s)",
+				     encoding, pkey->pkey_algo, hash_algo);
 		return n >=3D CRYPTO_MAX_ALG_NAME ? -EINVAL : 0;
 	}
=20
@@ -363,6 +364,13 @@ int public_key_verify_signature(const struct public_ke=
y *pkey,
 			goto error_free_key;
 	}
=20
+	if (strcmp(sig->encoding, "pss") =3D=3D 0) {
+		ret =3D crypto_akcipher_set_sig_params(tfm, sig, sizeof(*sig));
+		if (ret) {
+			goto error_free_key;
+		}
+	}
+
 	sg_init_table(src_sg, 2);
 	sg_set_buf(&src_sg[0], sig->s, sig->s_size);
 	sg_set_buf(&src_sg[1], sig->digest, sig->digest_size);
--=20
2.30.2

