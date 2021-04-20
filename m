Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82AE13657E6
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232128AbhDTLrC (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:02 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:58698 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231651AbhDTLrA (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919187;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RLInDh1h/QkEsygzJTUoZgnIz9dQEBlOY2EEntpAdgI=;
        b=Q3nF2gNzFpsgBjtJKlkQCqHRV5FaXuheQhcX516OrHHlgatMg/EuKvU02CwxdTY2TVXVdu
        +SbeZHetMkLpyWIjnvVJwq/YPMmAwCRf+GmeZBI2iBVmpIGvv2RvVFlLBDsOoHO+WT4D4g
        jgFmoGQHVqkOdMzIzFnGgL9GRW772R4=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-apgE18vcObemiJIrBXOkUw-1; Tue, 20 Apr 2021 13:46:26 +0200
X-MC-Unique: apgE18vcObemiJIrBXOkUw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k9AR9j7KYoJlKKWMUWXzzk4vOYCJLwoicEEG/KciJyfUaL5BJNH8XzT6t8BNB/hq9Tfx5BY1dx53cmW3/bEs5Kzp96UI4J2uWIW6em0OApL1uIfAYfRVm53tMRC67aERzi1OtSztRO03SioeI3YHkOYImnDiqC60yx16Ymy+KUFWcJbY8KRjuIOb4IbwdEARUifjeZRbdvCjZC+lT8JjGKg5m5Ehsg8Lm2Ly1durQtyBMRb5bndnHbZUJwZ4QefbTLwm7UboIphqM8Zni/nAM2pM72B6l53Sd79ow1XS57o2sKuyGPXykubhYzA5bN3yKJZFM/uIYMoOU3A7804czg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=68wfWvHe5jcomxWSlTIKYqj5qEWMMKnldpc+63TNMwI=;
 b=SzdlZv5XzQUTKCtRLHZwVztJT+q0xJcVYrsRLyVDUegduaHUfJGh+F9trRidiw95e0HXHmeEl0kOZU22IAGRMIEwrNLdxvq79tw/TlxFJGUn/4oqE5rc/03y0b1irXRKp3uF6W4W6E7w/E3qk9JtSNKEC6mNA2nWumIss2GLBldqSDnN+9CxgspgIMuDmRqu73K/JzRn1GRuqh9f/sAokLLf0Xio6XALlHfopCZG+Rs9yqguh5ufCuVb45xhOb94ZvFoUbOX36EO8mo/Wr1u6kFYEzzt1SePyfHLo6Hhma6TfEBjCjyM1cJenBVgT7jd/8wOKS61lIeTqGOzKewCig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR0402MB3396.eurprd04.prod.outlook.com (2603:10a6:208:20::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 11:46:24 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:24 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 06/18] crypto: rsa: Start moving RSA common code to rsa-common
Date:   Tue, 20 Apr 2021 13:41:11 +0200
Message-ID: <20210420114124.9684-7-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 583502c6-d146-4844-66df-08d903f1ec7c
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3396:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3396095E81A02E6BAFFDCA28E0489@AM0PR0402MB3396.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6LmwBR1DDezUQVX1ms2U8KA7B1BEympgHJLbrxmF6CsQYEhfv08Ui49L1vomunTrjU97bpj7aTU3M+saLmrsEombZB9Df4aIIFVd8fmiisNloJ0BGAnZ0pkRL9in+GGJ6P9Jb9aovcQg8o+BN1yKKvIW4zRuO7ncb6rhszdSK3oniSSe2NfU4KsVFPdCc3Y4Y8sVE4xkSzFMVLhucVoEeZcNB7haGnn06rcCNFxaxpz0FS46IakA+HjMOp9vrIhu9ClLjio+QM8kPoQar4J+rtAJie0fwx2trai8hHJV6tsAJFLAqUlnxCGK518KHwUW2CuNCkDzN/uIqWe6TxIWDXCDc7lRZTXZJzBgMVhC9323AFc0Ebk2DLfcA9KwOQxjiLDXRkay0hASh3MfSZxGn215h3aTsxYxqco+d3J9A4GizXOGgGuQtUI4AYUYZPMB7D6V9CzDYUxoyU1wLwddjCJfpTe/MDcO1c9DBg+VILddoO5YaQ3I7zhsJreePT16PeywQNL4RZudH0ArBzbMXNrGVOE/tGD7QZdQ0V8fbtBPygIJpjq+dwZv3UzXIMPotBln+E7Pwp29svEu33LHAqdLUOe981XEjvtHAHLiaEBsNSnBBPHA7Ws4ke4insVxaicJrxqHN8+6AoYyfeZk9A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(396003)(376002)(366004)(346002)(6506007)(8676002)(52116002)(4326008)(1076003)(186003)(66946007)(316002)(6486002)(956004)(44832011)(66556008)(66476007)(86362001)(36756003)(16526019)(2616005)(5660300002)(478600001)(6512007)(6916009)(26005)(2906002)(6666004)(38100700002)(8936002)(83380400001)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Pdcw0ExoTj1PSpklbzf8fx0c0RKQnb95l89+vw17sw1LsDW6g3944B1d36sC?=
 =?us-ascii?Q?bcU17GY5gmoZRSWQTyDo7l6VGKSgTkqP7IG3iaW/1N1+gEX4pTdsaQr9R77f?=
 =?us-ascii?Q?hnTdnuie30FDBvRfADkSH1oBWUAXt3R+LdSlO/+LsKzSpXkkurOm/ODL3AJ+?=
 =?us-ascii?Q?fvxcLX54ybkx6/jX/fuMF5qE9n2ecKb/Jo6X9l2MS3KR2tiPiiwgdqyw6xV7?=
 =?us-ascii?Q?lTNni3IJsStudNv89Nh5xjUn62KQJEl28i2D4hQpUQYXfgx+DvgjAOm0/JiE?=
 =?us-ascii?Q?VhxhXnlAk9S8K1kXkdYa5JSWkzdn3ut13Uq+uOMU7hrPR4nMAK5ZPgAKNQKI?=
 =?us-ascii?Q?vtaxfgqQowbHkjVCWQ7AuKl1ZsPoWR9UKyGnT05IjwDNdvdHscZzrkwEMlJe?=
 =?us-ascii?Q?6orpgR2m8BrYBBxzu+BvvZdRLFFLmxiRrso3uAT6qS2MD1h2yGmx75EeBmCI?=
 =?us-ascii?Q?6cy5AY2UV6VK25g2rDe+F30vJY68tKdo3JY3f4B7sXoJNBnAPxROzfreHLd+?=
 =?us-ascii?Q?hhJNNmYLZpFLNuWcw7vc7lIkpAf99iAcifWreXYxRkBgs4ofOV5nFKBdiOcN?=
 =?us-ascii?Q?QnDjTH44Gqj228TbwHe9d007JxNEN7bxdvC1bhz/aqWZuh6cQGWl14GV1jGP?=
 =?us-ascii?Q?q5aP27zEE78cMcOVI8gVVClKfy4vjg3oAJOnDPaR7q2VSFD4gU0EwaIHDt1u?=
 =?us-ascii?Q?903Tx1owK5kPR3E2q5Q86PotgqaykqWypiGy/NN6o8fojtrUo3efxBlGEaZW?=
 =?us-ascii?Q?BhXpvsGKVb79TYKxCUxTGhcvA/dP5RLDSCqcySGRZ7UCLqUSz8XVUmXiv/nR?=
 =?us-ascii?Q?cTObXMfwwj0ZD1/zqTa8DyCKWXfHEB+DS1A9Dce8kGpuQNGtgdiHlT9vapvG?=
 =?us-ascii?Q?dA4xgRZiMQXGRCZtbiGNBJ22JiVOEA1ZnxJ25FcJqXQZqcn/r3RWBtvUFpU7?=
 =?us-ascii?Q?ytXR1VgCo8XYWLJlR5GPLTYe9kjYxMQhNuWl8AfH7LBed02jWRM9hZoJHuDf?=
 =?us-ascii?Q?B5Tnwalsta1Qd0wxOzWErlVnoGO2ejpX29agZ/e6kVTaqKutoZhBC00mxo7o?=
 =?us-ascii?Q?QpW+joSh2Wi55HcU37GaxPwYxv0Nh+sJsyMyEHDPw61gVwlxcVlU3cbZaUeX?=
 =?us-ascii?Q?npQLjHcpzpPvh7KK1DQ/egB9jywZgO3jXXFNXVhF+WV7vlzGAsB1ZakXUxGB?=
 =?us-ascii?Q?8oQmxvPQLwZqevEkkZK54yPCgVnhSfIaCgHahUFTMJRXUNGdh+d1Vxv3vP8v?=
 =?us-ascii?Q?WrjYiIyb4EZ8eEALICdeC3eAroeyAGshMRreXEr90SOKvknkutXE/yKJTviv?=
 =?us-ascii?Q?J7RjXwIHDvj4biKRU/2zavIN?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583502c6-d146-4844-66df-08d903f1ec7c
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:24.2051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gQABqkQz3aASsMm305IZl9DSi1VhvrpI0gJLsO3IXDcK97NXIgSXepBZkbjV0KuFclp6QHETHCg0EZsy83XypA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3396
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

