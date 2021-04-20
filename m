Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6783C3657F9
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbhDTLrf (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:35 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:58757 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232260AbhDTLrP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919203;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MD+r4pw6uAQkNHnxfZHNh2cUWpurcpYUBU4PYm7eHcY=;
        b=MoKIRvgprrkWfXFwi8anwH6SBbS012Vb0UX4fNLWPl3o9Rp0WmsDJKDupTArCkkRnUYxDW
        ahHzKC5IJWTDk8whiOBfHcZMZAtX4vq4vZckCwTFyYlAlHGVr06VgFhsj43nQ/ub9dReWp
        4hrxYdzemflsusgNe+H1CW76CEuZ4Ao=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-toJOxvH7PaOpHKLUrj7AbA-1; Tue, 20 Apr 2021 13:46:42 +0200
X-MC-Unique: toJOxvH7PaOpHKLUrj7AbA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuhfgPL1IaYcgo8SdXCh/Djb237ua08xV/j90Vg9lpyvjNhrVrHpW/K7V23FwdstWdfGFriAnFLO1Z794bBB5nPM9zVk1xr9Rjw/yM3M64+mIC5FZ97tEaCy9OseDq2u4n/5UfXAJOVPO1mOlJBRy6heWT+cxNH0hgB+0nLU/OORKE4zwijbyzo00BpxV6DAg0stDfVgXoISaExRJUCqC4zDerB4nbz5Hek4pgOgTz/ADpywoyWvCXwZ5/a7NRPao+05PkIGdGRkHGBGL8kyf2fIFXScHWXHHvsi6mUW2h+GiWMca6RswKBYaTjchlpycsHBXG9mEvcacGHQQwL3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQYOA2QVqu3B/sTnmWzy/OgH1SgEXg/Syt3CrThw+d0=;
 b=LEvhrYs8wDZLjgCMUrHAewWTjcmrSMqF63WEASGENI826zibyCE+1lGvgHQsLxRtqFSmS/EJHjimkBdH8SUO6b0f+GF30YPHz/wqnld7iXtvHH431YbbPuIrYwQ1GBzEklqbbG72mxiXY3qXjSBlHIyekfqvEVU/F49RO1rmJymz8Am7FVX4DGXK7sMW8HroTFq8zdgA8dgGry1fyvpGnk5RnbAZi04isV54F+eKsFYm5hUnDApebUUvHdJDc0+KWtqveqEE24U2jw0/aMmMotMMuxj7IPpjR9KCTVmEUYM211gmg7nep8QUjhCOJAy3Rs3sH6hIE6MGlZ1HE259AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB4995.eurprd04.prod.outlook.com (2603:10a6:208:c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:41 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:41 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 14/18] crypto: Implement MGF1 Mask Generation Function for RSASSA-PSS
Date:   Tue, 20 Apr 2021 13:41:19 +0200
Message-ID: <20210420114124.9684-15-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ae8f027-8d06-4dc9-aff4-08d903f1f694
X-MS-TrafficTypeDiagnostic: AM0PR04MB4995:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4995AC0B96ED815B3A6752BBE0489@AM0PR04MB4995.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cvKrRIteC8ArEltpRy/55XicrZOiBIMXBn8FxF33MuUryATngnr5GV5/hsjaPD/n7U+GVk3d8wszS1Jhg6gL2ACuUAOum9mfV1c54S4Z3AOTeV7OqbtIeKPwNi8nuo7dBYuZNIGgCHqBqyMibaPglXUyugZr7fdCY+Ze4UWSB0dTh2hUnL/96hyPhfedmAtGIg9PZ7nGJjkzynR4nB1kQM/zb5gyU+Dn4xAGl3jQoJhRmNOW3puemNV35eus0w2fLp3p/JzmXw5IgOzRy0pW0rqSbUbu8yRYj8RN0TEVC29KgRZk6/vKbHyRG5Mp4kYXQ/wzUcxk3U9JG8+/y2y8rFSsL2j6kzLSQ4gu5Do0zT8MYwVPQrervpM0bfHEJhdH9S8UrqYlmNIUwVw/d01ay9fMln1n2p3aqulOSCTkySnmLIPBCwv15CZTbq4IQnt0iLK6QDPCLssceakfhT5SPznHijescLEhp8Uhp3zVtrRUMQWPBodYO6V1otXLnb6PEaTAC+HQPf4LnUqdrbFbzy3YtQ1n9ATOBvQ9tdqj54yRCBCaoOJixYbEpOUAfmyJqHhoYQeZTzcQiEe+vGk3EzGUlYEvDux34iO4pj4jmtQIL8iVdt4q0g1Tw5hi3060rNFYfpa49ArLRdvujvqub156V3AWFV2ASwcNjY2JRf+FpVYzx7E3H4geplOQcj98DkTDRjI7ea7851/va7NAvZPYtN3etwtZ+harVOgbGYc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(39850400004)(366004)(136003)(316002)(8936002)(83380400001)(6512007)(6486002)(52116002)(26005)(956004)(6506007)(8676002)(16526019)(2616005)(6916009)(478600001)(44832011)(4326008)(38100700002)(186003)(2906002)(66556008)(86362001)(66476007)(38350700002)(5660300002)(66946007)(966005)(1076003)(6666004)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Bqc83DW0v4L+IX8D5a1OJnk6/5hO777ZO0vbU/aJLNbuHCeUJQv6M7nQ9Fzk?=
 =?us-ascii?Q?LzX2oNC/RUyfxyuRyOOu+KkGx2a4a5xTEcnsamwLcPxt575JiKB/mr4h8CdJ?=
 =?us-ascii?Q?MXsqOlrekX73Z2mYcre4wNhSU6Zf4Jd86qguWYI+f4bwcDqXXACT3cNF5o6S?=
 =?us-ascii?Q?rXLcpQ2xtEGj+kIehd4xwBG5bMqnhOXIp521ucj6qz9FP3j4Sna2ClSpa4JH?=
 =?us-ascii?Q?RhBrYl1TpFfxVo7+KSwvR6TADTSN7qvvUaTCo4LWxCR3PMg5WDMOJkVaqRij?=
 =?us-ascii?Q?59BxTclcR1G+/OFOH/kefoP8vBj/GnxGe8mCL6JiSDdnpzp1Xf52vNbHL294?=
 =?us-ascii?Q?d4g4Oju9sfAM6ZQlLZFThLueZAXMYWygWo1+ZNac+xtryCncvy9av6QXugFa?=
 =?us-ascii?Q?QdYd81lEZ1leSHDvmXyRpmkAqHHKnXTIKE6FJKpSsG3EN2Gv46zgUL67bH9V?=
 =?us-ascii?Q?0Q6NvRpIGaimEVz6szmUJgtsKJB//GxHKW77ngA1FhNrR/1CweW+WUhhSocE?=
 =?us-ascii?Q?0t0aq1kWEM4qmjhU4dxv+kpwX+IIe5K18J3dLlZEM0bpdZJT8BkKRtUcWUQU?=
 =?us-ascii?Q?R/6NXFHWbZsk81qW+ki5u5cEDDal7h9Z+jG/Df26U5ooo7BVnyid6Lguopkz?=
 =?us-ascii?Q?dMdmdmxasPbzKOwcWHtn2wOFKEjwOeU58EbcSKiiDNVOhJtmd01wfnTCjd6f?=
 =?us-ascii?Q?p0mL+BDJTmnhtstSQkZ2kuaq/5aiZpW8oTb7CYPRK7yj13KhhQ10gIBpkm/T?=
 =?us-ascii?Q?ZjBP4Wp95TrVBDZut5hXih8VA3WowehXrqJbHmufjP5fk5eejvzgcp7i1/Tl?=
 =?us-ascii?Q?0ZTcX5rG6heXsFhvdcP/sVPoTAxa6n/KVy5EcTOEOEKAGXi2glwARjrPTw0x?=
 =?us-ascii?Q?S9tmvF6Chj8DeBgkbosIZiLbunW4qxyh3lufzMhO6VvS1aHSICfVscwS/GgT?=
 =?us-ascii?Q?Odbm6H3xeAEF3KW4MYtRNFu0s+sm1tQEB4WD1xts4hdI1vAueP0As8qqiWBU?=
 =?us-ascii?Q?UCkynHMdcU+cAQwEhuSBoCHQYMIhjrzL53PvL701UvPXqT2Nj1qrWYU+iNwj?=
 =?us-ascii?Q?L3Xkefh73HOrYcEt0xN6moGnS9hG/xZM0MBrPevLCxreerNVVNqjL13BZeEA?=
 =?us-ascii?Q?0praIrz3lXcCkLg1t45l25iU41GXMltaZawI9axGbvc+UEVq3zdhGbLFIvjf?=
 =?us-ascii?Q?HeZLILW901KO7PXyChE+wXYgD1hPAEyijzryCOOD2z0Qk8C8GU26Z/M4FrWe?=
 =?us-ascii?Q?g5Z4RL4AlTyirmLpkYfa06mmKABVSNv0ENbxCNSoajCSL5aDssyvC2UmrsqP?=
 =?us-ascii?Q?GfnHPDNL5eGjq4vl2IinKn7E?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae8f027-8d06-4dc9-aff4-08d903f1f694
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:40.9566
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RYh+1wLDabazFC7r131NxDGNM96nh/VNAlnjm/NRDTFX6D66MQnHGsdSgpVTwYxxk/ZZKQW2xKxqcIyTQb6Ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4995
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
index 0a9c0f9e9f0fe..990c2cda552a7 100644
--- a/crypto/rsa-psspad.c
+++ b/crypto/rsa-psspad.c
@@ -70,6 +70,60 @@ static int psspad_set_sig_params(struct crypto_akcipher =
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

