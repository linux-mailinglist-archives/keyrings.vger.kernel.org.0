Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0943657F5
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232209AbhDTLrc (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:32 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:43101 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232230AbhDTLrO (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919199;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9Igtuzm/ok+NRbcSZq13s9pDJLANSUiOqCGZ0QY7cno=;
        b=FYVQZ4ztsYnexKETonL74GEfL8SLnJSCGyPGGgE6cFCAiAtNy+XPaQJRDgODThi14WhZfG
        41/YnR23iILONeehjDZWM669e6WwXA27lk3MCijjfh9Gbo64HNB62vY+WuVA6ssfcVWbev
        cFvrALQ2GkDYXW3Xlo+R4ZhL06Wf1HY=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-8-Mf4Ald4COPuvjd_zrSXeSQ-1; Tue, 20 Apr 2021 13:46:37 +0200
X-MC-Unique: Mf4Ald4COPuvjd_zrSXeSQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7MIXKG30FPrSo0GjNlqIY4kfyuplxUrETEKVCsh7pFhBMkhsrgpKo66kKHiz95Deedwmr7VHm6l1Lg50krsPP5S6T2Aw3BrD3ixsTE4i6SE0HMLTalAdKXaq/zpvI2c/WqheRnKsWSLH8WuvYYwNWQG0vgJ8th6Gm1OEHK2k55D4eyYoWmrliLluL/tD/e0fVQ0XlgsaO7UudWnsPltptyKxLcz2nQNi2wldPrBq2ONzuoW24GB6LbbVNYZrYfJK++fbJsIIAsu0hMRH6iUpQzsSpjikGqv8C0ZPvIQV6QjACswa2NQaM+EUSnPF4toHreP8lzcTNBfonTx6mAPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7DWld0uBXexXyntNHnpn8e2x15y1B2pMLwJzTav2Lw=;
 b=XU0Pde72YbqXzzr8VY1MJDgpvgLiYAD3glGMtzIr0b/T4uKSgMIGUdAavWYzY47xQUQjPr9DzjaG+TIB46tLDx8wmVMljUd/32nMFbBmHmwAVH/aLsuy9LKBZVUnVwu/Zwsa9XN9gXtMA8EwZqLIatEQgnVequSE1/iiK8vyyI3xM2cjIKgrW6f0OkK1v3CbEhysGG0VJPgNJRrypYjtV1WPjR+TWgWw0AF00kF1HFXgmB0VNfGtAj1GNzSAv2QPrz1LSMyJF0BzQ92qMP5xFowr81ZBQhajRa9A96rmOPxzLcTXUiGzBe2bltx6YFsqQHFTQ5xtE9ru7J4VR19gtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR0402MB3396.eurprd04.prod.outlook.com (2603:10a6:208:20::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 11:46:36 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:36 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 11/18] crypto: Scaffolding for RSA-PSS signature style
Date:   Tue, 20 Apr 2021 13:41:16 +0200
Message-ID: <20210420114124.9684-12-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 902f047a-535a-436f-49fe-08d903f1f3c2
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3396:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3396E2B995A45EA889EC4ABBE0489@AM0PR0402MB3396.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3gDmJIYW/jnsefgEaJ/qdjYlfbvx2wnedMEjeLDUoinmaZgJw53pqluCc3Kru9viYkKeM9OXldyxhTKQlN+G79HSyOf2QiRpjALkdn6TMeUAgtbxt4ttxD9qYxXlVVd4tsin0SWKqUa6b1sJx2AUiLJj3mt1dhnM3H4nY45yvsx1iZbjnaHSXoukRFD8neFrX5b0SBQnjEuF5c/UOK1XS+sA4NQ7IwehLnGm63/YEQodTv/bKc9MAyox6u90Mm2Ktwoev32/aro0djfGY3vKyla1xHRMzD3/UGC1QjFZYZnmxjc5W7oLkbTnPsoZDiJesLVIelOy/CRSdoHmL+L/dB3bhSdPjVqUaD4iNvagq9ntgvLjHYwQFCwYLaHhaVdp940nH/QLljvJAgftpZpNrp8QK7N7akZSEJdRvClEm5EE378Gu6L93nZf7cMHxDALGp2YSoG5LxPYD7aLtvkFEI6tc5QICu/E6M4P1Fkc2dLRa39MAQFEwWPeUuta+IP8pLuziDzRu1cqexc3/CnqPe+dFekjbKNTRkJzwccu2RlpUmZwZo6F1G+50CBRW9BsrcJtnGkR8scMKTR5ZVnKMvvEFYHBv5aEtvU9A7nleR40Bx/7T2arsLTXM4EFsjQIc8uT/r0Y6gwOSfEuiZuCyGc3DwcH3n29aifyvV2tv38=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(396003)(376002)(366004)(346002)(6506007)(8676002)(52116002)(4326008)(1076003)(186003)(66946007)(316002)(6486002)(956004)(44832011)(66556008)(66476007)(86362001)(36756003)(16526019)(2616005)(5660300002)(478600001)(6512007)(6916009)(26005)(2906002)(6666004)(38100700002)(8936002)(83380400001)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BQHclds9BKFNEJmuEj4T444ow/lmjXtFUH21pLO8Uoi5WOjmEwzQ41N5NTBJ?=
 =?us-ascii?Q?pYIF/nmaid3RKJeY2Y2kWHYmIaAK0myJE/9yPA8eZJ7Aj87M+ZWDCzD/S3wq?=
 =?us-ascii?Q?nIEG+7t2+KajB0abBxYejE2VTfBbNRsHNWYuyrJtW58WnJzFTRosVsvYqH7G?=
 =?us-ascii?Q?nr2tBmNw5wuAjy/6fsxrqzfQGePH8lxI7oevnJj+wLNSs7Q0V3giEWTUx3Lr?=
 =?us-ascii?Q?7mPN3eNlAchQQT8NIrQ1WbSRmglvE0y1/VpbZIWVKUazwnFmT+Nr+zLObQCD?=
 =?us-ascii?Q?1zbtzBwKAqPY4jultMh1IjeBv56wjbjnx3TOw+gWVkMv8dY30KCFh1nmJzWA?=
 =?us-ascii?Q?9vPGJQQfAzkeGCGyK2Zjdfl0j97DRS+ORuzqYfyK1LBCnPmMuQAeoaCKuAc1?=
 =?us-ascii?Q?kHLcsykfB7pjJRv6GXqUU9m+yN20o8HsKQbudfvJ6iIFYJ/TAoBWa/kXm6el?=
 =?us-ascii?Q?LayruN6Ax+wvWy27B/ZBkyeIknIHZZc5Ln1UQW627qoeNXD0Gk0WZRAnZ3fo?=
 =?us-ascii?Q?if3GW78wvNV5J4AGu35azKTM2kcKxgN5MwVAb7VmzbzSwGe7XXo0DRtNWg38?=
 =?us-ascii?Q?UkD/+7S8IS4l5EXzn07of3UoSpkgtqoB6d7NRx0vDj+5IYEyh89Lha/8oJ/y?=
 =?us-ascii?Q?c+TbscLvWExfI9CXRSM3xQQ5QR869PpxngyHz3pxUKhEdQZzGw9UQbU534Ae?=
 =?us-ascii?Q?OUPHFqU/v+tawLYf6MoANr7Jz2E+m4AnPLohiQbRg0F8pHbDjKOUegd7Crhp?=
 =?us-ascii?Q?pcMotw28Nv3fGeOJd0QPWjzybb5+lRKS1vg2Gnlvql/9FbR+TJt7ndtmLVPt?=
 =?us-ascii?Q?J/jkaH9LkV4Jq2Eaw3/wXOdSyh9I8jJMCuJ1Pqn6dpSlojjhsp9XhFGhiF+L?=
 =?us-ascii?Q?gcEF7+DnHvL4EtYr+fIjwCBfLfiG0o/w6lR8BnXoe/ysOUFgNFi/hN+KZWPx?=
 =?us-ascii?Q?JBWfHUhfj+SdAnvLlNT5XqmN1C3DoSba/i8Pe/PWTLzkB+0O7e89h+3NMwTg?=
 =?us-ascii?Q?CTyTRLsiqI1d2n4x/t59sDvbei+mDGs8OkGBEFnPsZKCOF1WI2j/1jOc+vwT?=
 =?us-ascii?Q?cTIUy8TkloJcAce8Gm3t2vRePqAxEkGEBL2dXBcX6QJ/Phi776V1jOCIViqV?=
 =?us-ascii?Q?BLqtsTQtp5AUkGe2h/2mJST+AcCaXPI/jE1AXwCWSh9qAHnJHprLG5AEqVU1?=
 =?us-ascii?Q?f3aUewUZkH09jKY5s7xEqpfEm3YravRGYwHoPyKY9d4mHgUNabjiEtV5CTNz?=
 =?us-ascii?Q?xt99iM+LJ745eWt7cpNi12/wd4ru8nkEFoLnGwEUhJeb+MgMCK/TpU2evTw4?=
 =?us-ascii?Q?kHSrtR2VrEd0yPpVeuZO7v80?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902f047a-535a-436f-49fe-08d903f1f3c2
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:36.2852
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7AgqwK5GK+aTzxefk+ifSdiykylaXfOONZFFfciKhxbh+Zv5wdyixHLxYsOL/pCj78JMXGtLtAp9eVNBocxiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3396
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Add a crypto_template for rsa-psspad, hidden behind
CONFIG_CRYPTO_RSASSA_PSS. Set the sign/verify/encrypt/decrypt
operations to return -EOPNOTSUPP, to be implemented in the future

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/Kconfig                |  6 ++++++
 crypto/Makefile               |  1 +
 crypto/rsa-psspad.c           | 39 +++++++++++++++++++++++++++++++++++
 crypto/rsa.c                  | 20 +++++++++++++++---
 include/crypto/internal/rsa.h |  3 +++
 5 files changed, 66 insertions(+), 3 deletions(-)
 create mode 100644 crypto/rsa-psspad.c

diff --git a/crypto/Kconfig b/crypto/Kconfig
index 5809cc198fa7c..3aedb40aa08f1 100644
--- a/crypto/Kconfig
+++ b/crypto/Kconfig
@@ -224,6 +224,12 @@ config CRYPTO_RSA
 	help
 	  Generic implementation of the RSA public key algorithm.
=20
+config CRYPTO_RSASSA_PSS
+	bool "RSASSA-PSS algorithm"
+	select CRYPTO_RSA
+	help
+	  RSASSA-PSS signature verification scheme.
+
 config CRYPTO_DH
 	tristate "Diffie-Hellman algorithm"
 	select CRYPTO_KPP
diff --git a/crypto/Makefile b/crypto/Makefile
index 57a85b2b3429b..88be24b9bcb24 100644
--- a/crypto/Makefile
+++ b/crypto/Makefile
@@ -42,6 +42,7 @@ rsa_generic-y +=3D rsa_helper.o
 rsa_generic-y +=3D rsa-common.o
 rsa_generic-y +=3D rsa-pkcs1pad.o
 obj-$(CONFIG_CRYPTO_RSA) +=3D rsa_generic.o
+obj-$(CONFIG_CRYPTO_RSASSA_PSS) +=3D rsa-psspad.o
=20
 $(obj)/sm2signature.asn1.o: $(obj)/sm2signature.asn1.c $(obj)/sm2signature=
.asn1.h
 $(obj)/sm2.o: $(obj)/sm2signature.asn1.h
diff --git a/crypto/rsa-psspad.c b/crypto/rsa-psspad.c
new file mode 100644
index 0000000000000..0e5422b05c081
--- /dev/null
+++ b/crypto/rsa-psspad.c
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * RSASSA-PSS signature scheme.
+ *
+ * Copyright (C) 2021, SUSE
+ * Authors: Varad Gautam <varad.gautam@suse.com>
+ */
+
+#include <crypto/internal/akcipher.h>
+#include <crypto/internal/rsa-common.h>
+
+static int psspad_s_v_e_d(struct akcipher_request *req)
+{
+	return -EOPNOTSUPP;
+}
+
+static struct akcipher_alg psspad_alg =3D {
+	.init =3D rsapad_akcipher_init_tfm,
+	.exit =3D rsapad_akcipher_exit_tfm,
+
+	.encrypt =3D psspad_s_v_e_d,
+	.decrypt =3D psspad_s_v_e_d,
+	.sign =3D psspad_s_v_e_d,
+	.verify =3D psspad_s_v_e_d,
+	.set_pub_key =3D rsapad_set_pub_key,
+	.set_priv_key =3D rsapad_set_priv_key,
+	.max_size =3D rsapad_get_max_size
+};
+
+static int psspad_create(struct crypto_template *tmpl, struct rtattr **tb)
+{
+	return rsapad_akcipher_create(tmpl, tb, &psspad_alg);
+}
+
+struct crypto_template rsa_psspad_tmpl =3D {
+	.name =3D "psspad",
+	.create =3D psspad_create,
+	.module =3D THIS_MODULE,
+};
diff --git a/crypto/rsa.c b/crypto/rsa.c
index 5c4eece5b8028..de4ad34f9cd95 100644
--- a/crypto/rsa.c
+++ b/crypto/rsa.c
@@ -258,17 +258,31 @@ static int rsa_init(void)
 		return err;
=20
 	err =3D crypto_register_template(&rsa_pkcs1pad_tmpl);
+	if (err)
+		goto out_err;
+
+#ifdef CONFIG_CRYPTO_RSASSA_PSS
+	err =3D crypto_register_template(&rsa_psspad_tmpl);
 	if (err) {
-		crypto_unregister_akcipher(&rsa);
-		return err;
+		crypto_unregister_template(&rsa_pkcs1pad_tmpl);
+		goto out_err;
 	}
+#endif
=20
-	return 0;
+	goto out;
+
+out_err:
+	crypto_unregister_akcipher(&rsa);
+out:
+	return err;
 }
=20
 static void rsa_exit(void)
 {
 	crypto_unregister_template(&rsa_pkcs1pad_tmpl);
+#ifdef CONFIG_CRYPTO_RSASSA_PSS
+	crypto_unregister_template(&rsa_psspad_tmpl);
+#endif
 	crypto_unregister_akcipher(&rsa);
 }
=20
diff --git a/include/crypto/internal/rsa.h b/include/crypto/internal/rsa.h
index e73c61f788e68..4c168ea2f050a 100644
--- a/include/crypto/internal/rsa.h
+++ b/include/crypto/internal/rsa.h
@@ -61,4 +61,7 @@ struct rsa_mpi_key {
 };
=20
 extern struct crypto_template rsa_pkcs1pad_tmpl;
+#ifdef CONFIG_CRYPTO_RSASSA_PSS
+extern struct crypto_template rsa_psspad_tmpl;
+#endif /* CONFIG_CRYPTO_RSASSA_PSS */
 #endif
--=20
2.30.2

