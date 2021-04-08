Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20B1F3586C2
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:16:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbhDHOQy (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:16:54 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:34438 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231969AbhDHOQo (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891391;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RLInDh1h/QkEsygzJTUoZgnIz9dQEBlOY2EEntpAdgI=;
        b=l18Pn2sw4/x3B8dikKtbRgQ3csaWQDSsNZ4WgJhk4opqetLb5DYlMaDQbouM1WILb8ogJP
        stx9uCEn1nIDMz57rk1bgKn6YpiZYE+WPT3k6qkzaOafji0ahwFN9l66Rge+y1jGc7HqRf
        mNGP4Xh10pNCWKRh5/NfN9NnY4YO4Kk=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-ZTpLxAohNKOtORKYzWW-Gw-3;
 Thu, 08 Apr 2021 16:16:20 +0200
X-MC-Unique: ZTpLxAohNKOtORKYzWW-Gw-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdgX0vw8HPRAKR2YiKZecFBktziDxWS7x9rsFb6rtoIVM5YLZti2NNyPBsBOiHU5e/Gj0Navz80fKWsdG5imEPGWbPdbVWR+q5GUnRw34S31vfLdGipJHg8cF8u/0OMWR53NVqanKp5omExKbH12Z8jLtV9lCzXSPHS5az2dE//6yswsYDQoupozySp6VEb5UiHXTS3TD2GpffGgsHeKcaD9vQbM+X2ip5cqCWxQElh14NRPWc7Bty+VfCZUjlKfgXA+ZFQlR7jWFib3tL94kqpujV7Onm/rQvIF4WmTJNjId7/Zqs/KReZhxs3DcM4QliQedeU6fNfh42xEBBoHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68wfWvHe5jcomxWSlTIKYqj5qEWMMKnldpc+63TNMwI=;
 b=PxS+fe2L6nVUjvTHFzgwOfRUJK1nW9Di/6t2NKB65HVE9KsjPH1DXMKwij1HMlR8mVbZyTYfEe1129p/b7+G51qfFfhNaH1tQGjUsMV8AxreGZ/hokQER3jT77Xh3GykoW+RwRSkpZol7SPUSY+HyCE/Z+aBB8VDixmIIqQ/L5FMv8IpzvB/ZO/irIir7Dzcov9/pbNf6WYNtF1eHIdCt33zYgRQmjzfRT+gr7vlnUepgb54WzqzdyCiH3QyhJycQ8jP5Lm0N81hTHZ/3Lqz9YVLLYoz8jEV/BZyYWiZgJPC0I8CGOHjgbo7Yj5TQyq3Td8PGjXB8OC2VZLMR3ypjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 14:16:02 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:16:02 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 06/18] crypto: rsa: Start moving RSA common code to rsa-common
Date:   Thu,  8 Apr 2021 16:15:04 +0200
Message-ID: <20210408141516.11369-7-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:16:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af2984c0-cfc6-4209-626b-08d8fa98d6df
X-MS-TrafficTypeDiagnostic: AM0PR04MB6289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB62896A5032F21B0ED7DDE30FE0749@AM0PR04MB6289.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hCkcAUtDkQJ+h5Vu7vycDSApD4kZQEAxWrq0Etf0sKpe7G7nHAgpB+o0JQkOrj9we67cVu7t/t9iafagrVdfMy1JDBIxj0oAKUvU3J7jxgw3UrBuUCpj2j88H/mVfg1NiO2P5Qd4FRTl4Aittl3bQFiwPyeGcMzeCpK8K0Fq//unY1hgy9MMCPM089p5ydxU9NkiLiUaSakE6EtZk/cXDszBypD6uzFQSLP96cW9lKAopx5+WCvXQvMFsanA3ysFddpMf9U9LA7hpIhbTqsrmFyqqYTEPDb79MWKhxZK/KnbYqYnGxRhEVmtFLbqetx1GaUrXLtnhkkRNSYGrdHfeSEcxAxVYZeAczmVpCpBzv8FrzUT5UssuJMQwI7rq0skyL2zrUmFzxnv8oXyfYBR3WZvjnB/JzFJcoEljBlHdjXVGXuaO4u7r37umLe26K+WaayeYQKv/pQGdI4hFtpnAUFolcfUxTDbsnybRcTnzhsxn2N6+ksYEwkBCgkCWhAwtIiaJLa63HzpdjUUr/S6uNHiNB71IO4J5cvRiOWaedcEBYIvDN5+uMjw9D39yUrzJya4PE8bXOGM4263mgPqI0aurxjiIQ+U1MJKKF2MBPCUseMFZfXQA+HEsSJbFfYjqdt1YRUeyAC07tCahlQ0NDK7rT3YA9HOhjk9kRwH1MX3xgpvgU6lGtjMa1XJAljn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(186003)(83380400001)(16526019)(478600001)(6486002)(38100700001)(36756003)(5660300002)(4326008)(6916009)(1076003)(66476007)(316002)(2906002)(66556008)(26005)(38350700001)(2616005)(956004)(8676002)(44832011)(8936002)(6506007)(86362001)(52116002)(66946007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YnxqARE6H4PoM7bVRgxsTYxMErgdOQbK5jZaGBDF/ucK6ef+OaSWQPHqLhne?=
 =?us-ascii?Q?LDROyd744gFrPX1seN8oBrdANoOJPy5WNxQO2qTiaWD1/8AWh/d60pkOm7Sk?=
 =?us-ascii?Q?uigHQfGtu03vs7emaPa2fi7SJMedoCOMA2UmkWzgJRME62MhLkemz3J4p4jd?=
 =?us-ascii?Q?rROOPQdZn8aRsijPqOIGswGhu37ld8g6wN44RoUj5Lng9b0Cokf8dle8meKn?=
 =?us-ascii?Q?ZAUUQj7g2TTc+cbr/f4+YmAEDyPCHdqFDkoWFMnnWnw7Y0sdMYeerMxpqxT8?=
 =?us-ascii?Q?z6JlCJs4QNjVBky1yLDG6B+NY1uCXg9NEoXcES2sSwScPnN/RpGH0nhGQQ+Z?=
 =?us-ascii?Q?PWDlGrcCEFIyCgDM5nEKudGsFe/RGprFYOBLTxdw3Kt7IdyC7Cxk4uZ/D/pY?=
 =?us-ascii?Q?HihHld+dtu91Eb9nWlT9g32ytnRxWYA1+5LCjh/Y2mIc+6FpJOaoXpQYUGQ9?=
 =?us-ascii?Q?u6j3MwMvSjYG0cn83AqiavFzji6gpTst682vxVBcNTxyJiljnJSmdH8aqvJJ?=
 =?us-ascii?Q?mBdajLDRHKeWZNcTj/doLzOoQY3Vni4E69TVUuW/hiWy1UxzMCSn1XSBmLl8?=
 =?us-ascii?Q?Im6C1W/diOv6HWV+ud07AcZk06968ibc4xwbeINzayj5Et7XdPf6ozO5hcPu?=
 =?us-ascii?Q?qaWlEWGkHJL8hiq+n9cQ+Ko36gMF0xHUkIOJBJYlmXSfZ879n9ZMttvqedDN?=
 =?us-ascii?Q?tvx8qnQHDkb7tUx8QgFNLqHXdRg5+/fKhoPbx7seGXjJ8qOkbMqBSVoIZwGj?=
 =?us-ascii?Q?8aejAYvslTglRPwGEHN7yeGg9SUSvT2I8owr3+XCyGuedJqBgmTA77ziUJPW?=
 =?us-ascii?Q?/xPXBQLGE5QiNzqAs+pwmqQsstJK0mN+JGp2ZfKVtCe/ZtSeq2SWPoGQ5z4y?=
 =?us-ascii?Q?HXSdY+Oc+XhwcxEmMLqHHVL78as+n55KQgIa8vTKw26+LFurmHA5XrTzAAyC?=
 =?us-ascii?Q?T87/ndxZ2j45jW0ZQtUkpIVSZO8n7lD86ngu2hV8rZlIDLtSsZ0ENw2tGvOE?=
 =?us-ascii?Q?Kal+mvF221o3XVbFjWMAR4HOy/5/lhR1vyreSYeeN0OifHNnE7nHDNkD/B5q?=
 =?us-ascii?Q?JxGxq4/mTrXK9/m4s4Ydt1JGPEs16Av76apav3cq19aa7VLS966VfReqiiSD?=
 =?us-ascii?Q?Y/FXOcXO7YKyyWMu1ve1QwVY49CRngDAXiNva55UdOtCv4DubWUcFXfid1d3?=
 =?us-ascii?Q?Okc6LUSH15LibB+YN9EuzZr77HkDxdhU7ym+B+OtRMMD4rXS/RN8tNqkbKq/?=
 =?us-ascii?Q?X49U/jFTy9WoblVR/+HBfYaw4Um4KeBSA9zGREs/6aI+elyzVnn3kfjdU5a/?=
 =?us-ascii?Q?ZjdKPXWQwFq1zp6/EogMpY0R?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af2984c0-cfc6-4209-626b-08d8fa98d6df
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:16:02.2100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYPs0OM7EK3PkqC/C5ZisX56OCbUHTeZHi8P48bZRIYka1BW01o0hcgcqaWteXvGYkVJT/KYcbMewFR5aesAJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6289
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Move out helpers from rsa-pkcs1pad.c which will be shared across
rsa-*pad implementations.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/Makefile                      |  1 +
 crypto/rsa-common.c                  | 76 ++++++++++++++++++++++
 crypto/rsa-pkcs1pad.c                | 97 +---------------------------
 include/crypto/internal/rsa-common.h | 37 +++++++++++
 4 files changed, 115 insertions(+), 96 deletions(-)
 create mode 100644 crypto/rsa-common.c
 create mode 100644 include/crypto/internal/rsa-common.h

diff --git a/crypto/Makefile b/crypto/Makefile
index cf23affb16780..57a85b2b3429b 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -39,6 +39,7 @@ rsa_generic-y :=3D rsapubkey.asn1.o
 rsa_generic-y +=3D rsaprivkey.asn1.o
 rsa_generic-y +=3D rsa.o
 rsa_generic-y +=3D rsa_helper.o
+rsa_generic-y +=3D rsa-common.o
 rsa_generic-y +=3D rsa-pkcs1pad.o
 obj-$(CONFIG_CRYPTO_RSA) +=3D rsa_generic.o
=20
diff --git a/crypto/rsa-common.c b/crypto/rsa-common.c
new file mode 100644
index 0000000000000..60073c56e3748
--- /dev/null
+++ b/crypto/rsa-common.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (c) 2015  Intel Corporation
+ * Copyright (C) 2021 SUSE
+ *
+ */
+
+#include <crypto/internal/rsa-common.h>
+
+/*
+ * Hash algorithm OIDs plus ASN.1 DER wrappings [RFC4880 sec 5.2.2].
+ */
+static const u8 rsa_digest_info_md5[] =3D {
+	0x30, 0x20, 0x30, 0x0c, 0x06, 0x08,
+	0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x02, 0x05, /* OID */
+	0x05, 0x00, 0x04, 0x10
+};
+
+static const u8 rsa_digest_info_sha1[] =3D {
+	0x30, 0x21, 0x30, 0x09, 0x06, 0x05,
+	0x2b, 0x0e, 0x03, 0x02, 0x1a,
+	0x05, 0x00, 0x04, 0x14
+};
+
+static const u8 rsa_digest_info_rmd160[] =3D {
+	0x30, 0x21, 0x30, 0x09, 0x06, 0x05,
+	0x2b, 0x24, 0x03, 0x02, 0x01,
+	0x05, 0x00, 0x04, 0x14
+};
+
+static const u8 rsa_digest_info_sha224[] =3D {
+	0x30, 0x2d, 0x30, 0x0d, 0x06, 0x09,
+	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x04,
+	0x05, 0x00, 0x04, 0x1c
+};
+
+static const u8 rsa_digest_info_sha256[] =3D {
+	0x30, 0x31, 0x30, 0x0d, 0x06, 0x09,
+	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x01,
+	0x05, 0x00, 0x04, 0x20
+};
+
+static const u8 rsa_digest_info_sha384[] =3D {
+	0x30, 0x41, 0x30, 0x0d, 0x06, 0x09,
+	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x02,
+	0x05, 0x00, 0x04, 0x30
+};
+
+static const u8 rsa_digest_info_sha512[] =3D {
+	0x30, 0x51, 0x30, 0x0d, 0x06, 0x09,
+	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x03,
+	0x05, 0x00, 0x04, 0x40
+};
+
+static const struct rsa_asn1_template rsa_asn1_templates[] =3D {
+#define _(X) { #X, rsa_digest_info_##X, sizeof(rsa_digest_info_##X) }
+	_(md5),
+	_(sha1),
+	_(rmd160),
+	_(sha256),
+	_(sha384),
+	_(sha512),
+	_(sha224),
+	{ NULL }
+#undef _
+};
+
+const struct rsa_asn1_template *rsa_lookup_asn1(const char *name)
+{
+	const struct rsa_asn1_template *p;
+
+	for (p =3D rsa_asn1_templates; p->name; p++)
+		if (strcmp(name, p->name) =3D=3D 0)
+			return p;
+	return NULL;
+}
diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
index e76fc98a537a4..ffb7220b3d10a 100644
--- a/crypto/rsa-pkcs1pad.c
+++ b/crypto/rsa-pkcs1pad.c
@@ -5,104 +5,9 @@
  * Copyright (c) 2015  Intel Corporation
  */
=20
-#include <crypto/algapi.h>
-#include <crypto/akcipher.h>
-#include <crypto/internal/akcipher.h>
-#include <crypto/internal/rsa.h>
-#include <linux/err.h>
-#include <linux/init.h>
-#include <linux/kernel.h>
+#include <crypto/internal/rsa-common.h>
 #include <linux/module.h>
 #include <linux/random.h>
-#include <linux/scatterlist.h>
-
-/*
- * Hash algorithm OIDs plus ASN.1 DER wrappings [RFC4880 sec 5.2.2].
- */
-static const u8 rsa_digest_info_md5[] =3D {
-	0x30, 0x20, 0x30, 0x0c, 0x06, 0x08,
-	0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x02, 0x05, /* OID */
-	0x05, 0x00, 0x04, 0x10
-};
-
-static const u8 rsa_digest_info_sha1[] =3D {
-	0x30, 0x21, 0x30, 0x09, 0x06, 0x05,
-	0x2b, 0x0e, 0x03, 0x02, 0x1a,
-	0x05, 0x00, 0x04, 0x14
-};
-
-static const u8 rsa_digest_info_rmd160[] =3D {
-	0x30, 0x21, 0x30, 0x09, 0x06, 0x05,
-	0x2b, 0x24, 0x03, 0x02, 0x01,
-	0x05, 0x00, 0x04, 0x14
-};
-
-static const u8 rsa_digest_info_sha224[] =3D {
-	0x30, 0x2d, 0x30, 0x0d, 0x06, 0x09,
-	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x04,
-	0x05, 0x00, 0x04, 0x1c
-};
-
-static const u8 rsa_digest_info_sha256[] =3D {
-	0x30, 0x31, 0x30, 0x0d, 0x06, 0x09,
-	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x01,
-	0x05, 0x00, 0x04, 0x20
-};
-
-static const u8 rsa_digest_info_sha384[] =3D {
-	0x30, 0x41, 0x30, 0x0d, 0x06, 0x09,
-	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x02,
-	0x05, 0x00, 0x04, 0x30
-};
-
-static const u8 rsa_digest_info_sha512[] =3D {
-	0x30, 0x51, 0x30, 0x0d, 0x06, 0x09,
-	0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x03,
-	0x05, 0x00, 0x04, 0x40
-};
-
-static const struct rsa_asn1_template {
-	const char	*name;
-	const u8	*data;
-	size_t		size;
-} rsa_asn1_templates[] =3D {
-#define _(X) { #X, rsa_digest_info_##X, sizeof(rsa_digest_info_##X) }
-	_(md5),
-	_(sha1),
-	_(rmd160),
-	_(sha256),
-	_(sha384),
-	_(sha512),
-	_(sha224),
-	{ NULL }
-#undef _
-};
-
-static const struct rsa_asn1_template *rsa_lookup_asn1(const char *name)
-{
-	const struct rsa_asn1_template *p;
-
-	for (p =3D rsa_asn1_templates; p->name; p++)
-		if (strcmp(name, p->name) =3D=3D 0)
-			return p;
-	return NULL;
-}
-
-struct rsapad_tfm_ctx {
-	struct crypto_akcipher *child;
-	unsigned int key_size;
-};
-
-struct rsapad_inst_ctx {
-	struct crypto_akcipher_spawn spawn;
-	const struct rsa_asn1_template *digest_info;
-};
-
-struct rsapad_akciper_req_ctx {
-	struct scatterlist in_sg[2], out_sg[1];
-	uint8_t *in_buf, *out_buf;
-	struct akcipher_request child_req;
-};
=20
 static int rsapad_set_pub_key(struct crypto_akcipher *tfm, const void *key=
,
 		unsigned int keylen)
diff --git a/include/crypto/internal/rsa-common.h b/include/crypto/internal=
/rsa-common.h
new file mode 100644
index 0000000000000..ecdce0cdafaa3
--- /dev/null
+++ b/include/crypto/internal/rsa-common.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2015  Intel Corporation
+ * Copyright (C) 2021 SUSE
+ *
+ */
+#ifndef _RSA_COMMON_
+#define _RSA_COMMON_
+
+#include <crypto/algapi.h>
+#include <crypto/internal/akcipher.h>
+#include <linux/scatterlist.h>
+
+struct rsa_asn1_template {
+	const char	*name;
+	const u8	*data;
+	size_t		size;
+};
+const struct rsa_asn1_template *rsa_lookup_asn1(const char *name);
+
+struct rsapad_tfm_ctx {
+	struct crypto_akcipher *child;
+	unsigned int key_size;
+};
+
+struct rsapad_inst_ctx {
+	struct crypto_akcipher_spawn spawn;
+	const struct rsa_asn1_template *digest_info;
+};
+
+struct rsapad_akciper_req_ctx {
+	struct scatterlist in_sg[2], out_sg[1];
+	uint8_t *in_buf, *out_buf;
+	struct akcipher_request child_req;
+};
+
+#endif
--=20
2.30.2

