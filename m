Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20FDB3586DA
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbhDHORx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:17:53 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:55141 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232020AbhDHORU (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:17:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891428;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9Igtuzm/ok+NRbcSZq13s9pDJLANSUiOqCGZ0QY7cno=;
        b=ffnmPrsTUZ6hb3LzDlHMpd+BoJHZA4VIQ6Fqn6uut1V9/6i+moJOLvWCFLa5kiFYVOw8aL
        DPj1et/toQhKGA+o5rIyGlGFhLd/Vo25WTTjfUc4eICPLdvlHk8HMnDDSu62wqTN83JLoT
        bDP+zXfPDIOPo6Ut+jR+ZBO2PUyHsrQ=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-FODe4QFwOwS8KoFUGSkj7w-2; Thu, 08 Apr 2021 16:16:52 +0200
X-MC-Unique: FODe4QFwOwS8KoFUGSkj7w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naUxeLsiv/2i/KlcmuXlumdaBOs5ZW7S9KTBJ0+YzTqzFR4oWNcfVHPQu4ZV+9PyZNTokqoZ/dSLuAAeVUzojSvA4yD/g5OgcSL5k0rTvED94ThKHKV1Ug7+UeTKBE3CY2RVnJgAYf1m1YsFpO/VkhGbF1DQD+vpDW1X04rCwYcFtgCx3wgdheWaqKQK6INdVSVumOpcptlCwc4RvEuTdqx0TqTALLTgHOLzYDSOB4GjRT4mpwgukrFCNpXbHW20QTxCKttuyYp8Mk6vwXW78a0GgW+43TrskrKnT45gfUJ3XqMxyTdX/Ia2c+yNwV00VNq1FYl6vorJEktG4N7AEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7DWld0uBXexXyntNHnpn8e2x15y1B2pMLwJzTav2Lw=;
 b=aiYgRDGO/a7HvOW9fVnIulVOJpiYqwc8qV1mPZRh6mFWvuBb6M+UaUNxlGEu65OuVD1Mwxm4x6khJEdtBxicYKScK2uKcIVua6YVRXg/8P/NE792QgGhFYPjhqxRsueq7/4D31If9/AP31FDjC1S3i0rH5arRH/sSpDpRv3vr8dtM5E3YWgWTgSpfeihpPETr5JglDHO9Sr89YuCZC31jLvDokolp1/XHq0a5A+1BATYu+Q4JCnK9hQmGp76YnReSSaWMs+PF9Nc4DQ9ik/z4DCGRWEXY4LepUvzVw2F/TC7cHt7FzcSNE/GVjOFQ1OLRKny9r52EKWILYWi1dDqWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR0402MB3572.eurprd04.prod.outlook.com (2603:10a6:208:22::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 14:16:42 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:16:42 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 11/18] crypto: Scaffolding for RSA-PSS signature style
Date:   Thu,  8 Apr 2021 16:15:09 +0200
Message-ID: <20210408141516.11369-12-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:16:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c3a7e99-e990-448e-2ee9-08d8fa98eecf
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3572:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3572AE1F9CB02305082219CEE0749@AM0PR0402MB3572.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zNTqufgO9RPVcc3WGkTL/EbzQslqML2QxocVZoljn2PAI3MVtio+ztM7pXMumuwaxOGy+lRh6kUQN1/Rjdjgg32hRC5++25+GnAmEUls39S0RznAKKwMm0As1MIH0u0sd8V/epMG9UNtClB3czkrksdvSkmF0ucJKSn17uia6VPgOyBgTNWoRKC4yWR9HqzQAaf0VBXpnovjrbYQcCbscqcmFTuzbouKWkCpvcw071Mo6ZQuDJTzf1R7uDLBTEk8c4d2wtebFLEIupGy/tXzZ+OBtPwM4WSFUAROZag1BOuOMRs9eysVjhhwlaHu6KKrTSTlawRU3a+YRlJ4MmHVUObqvHylaMi9d2fKJc6trH3Z0EbutczB7er4xPt+4nxMBoR/Cu3LhIBxAvfjz7W0I00xpnViSj9QZylJnDB+J3f5xkF9MeUYoy4X2dA0vV+DE3xtJiroSYPEpQsu46ccBYmx/ODkAL4GyCpjzLQdpy9E+C2B79OwxbICt6ZzTl3MfJxzHJRJKQEqZnv01YfEIkbvgBSdikhiEaTnuIaIgM9Q/dtPaMhRmpNysJqKvOE5cXOiSj+sJEo+r6rIeD/9+cVU18T2pHRmUVN1pW23iGJyyGdYpZ0HzL7CkzohgO+jYDwLMW3KBEJnyJZ+jv3SJZS7IygcZtZJvddzZF1bPBLHQR7tSOtJmzpwvA6h7lGm
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(376002)(346002)(366004)(16526019)(186003)(38100700001)(2616005)(956004)(38350700001)(52116002)(6512007)(2906002)(36756003)(44832011)(6916009)(83380400001)(6666004)(8936002)(26005)(66476007)(66556008)(66946007)(4326008)(316002)(1076003)(6506007)(6486002)(478600001)(5660300002)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qvxPb/lpbvZdmGd6ljo0jwSA856MTvTrD8I4SoxeANBARPr72kMUvk1bZG9w?=
 =?us-ascii?Q?k91VDkml5cdetlzPbbuaSFCMVIxcdze7n/9rNbNkHxxteak3w1ySbPr8tJhK?=
 =?us-ascii?Q?9yWDpaJP/DcVO3kJVhflcJOvg0Ii7/ltOtY5ozRwoRN7xy44uRSlrquyE3W3?=
 =?us-ascii?Q?QF45WCO3/BYUOZZFmYxjAS15DmNYw40UvGvo0dzUlmZMDyjMEDLzlgdaBgl9?=
 =?us-ascii?Q?WKq4rFqNYRxYnB4mG5T3WIdIsPqAkKPLWlX0fDKwh+BkZJ9v23lVTMzzl6M3?=
 =?us-ascii?Q?Nb4piJpPUEMTfJ1xK2dXLfZzCQ8B/49Teyp+f4xsYJ/vgv0IbcIkURTY5WTb?=
 =?us-ascii?Q?mAH/AZke2jLiZ0HuqViCzehzAIVx6FU/DIuOls8PSB4tPlByICBAPPSwaVda?=
 =?us-ascii?Q?3wAUZWacv+xf2Gl/2ZtLZLzEi3m1CBOn9ibPj+402osqEH2+BHCGSjvuI/cq?=
 =?us-ascii?Q?juDWDrhhW3D1S/eGJcLoh+Hr9lD5GDUXUJ4fVgqYpfGztyewZ1oyyD7gGzSR?=
 =?us-ascii?Q?mZJo3HzouQ5lDqfyUu1Z/nRt/l/IXW1T+LxzUxhlZ84pMKUNFo6HCsCCVCv0?=
 =?us-ascii?Q?V63j3GvHwbwH61Mp4GwsPUUCHsfFD+noJyQ6iygm2mwbSqsyHujDLx5PootH?=
 =?us-ascii?Q?sdR7KwOHJfeskVQQBoFXQyys1V03PEm8wOfQfXQkRvBghmMByWZzgG8A+wu4?=
 =?us-ascii?Q?n8P+KehlUesBT30udUZrW2Aedu3tbaVu9Xz674oQD+V1k2UQyHWCuLbNin7P?=
 =?us-ascii?Q?Q5WgDJy9q3JDCPYlECfegeJItvXsGgKSu//1doGXvtkb7JYK6JjNW04xRtAm?=
 =?us-ascii?Q?gfLk4lIb7jsQWnU54LE5D7rc/X15XyZuM2gwb18yoTu1A6LsFZrU4P3gcYmf?=
 =?us-ascii?Q?BIzcyHg21hnIxy23Mw0eNXJg2LhTdDq68n7+zJh0gLdAAOPQjRWsbxj9lwUf?=
 =?us-ascii?Q?A0QBdcgjg9oCVoSrTWC4uhYFYAaz9o5vJQA0Powk/BOQDc3zNm8nGTkKTr6G?=
 =?us-ascii?Q?I1d1Ehe4D68o2to5wgqoALVH1lFarGMJkk8BMSgfKuW5cJeWbXu1Qs8KAOxx?=
 =?us-ascii?Q?FslBIC8WvQwBo5FEOv2iO0cvp6ZkbUhULR4/CV6296kSEf1tylGdK6L3Gj8a?=
 =?us-ascii?Q?eYbJcPmeWFdt1PCuahHxdqMwfYwMaDz0ltcYaX6XohTTG6TJ6vkpN9RzQdXf?=
 =?us-ascii?Q?EfrfKzjJ9IqEScJyHEROk4uLeFeK9DhXtcgydfLC+l390lB8nLt0glg2altP?=
 =?us-ascii?Q?NPu6wreULOgIh9sX20cgRDSi7OqvD42E6NIEqp7f9hDl8hgkHQ5TIBc/lcS0?=
 =?us-ascii?Q?nm/5crR5Py4S4yrEdSGwfD65?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c3a7e99-e990-448e-2ee9-08d8fa98eecf
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:16:42.3262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+4seCmMFSyGrribJXIsFvPlUNB3A2czg8zw9/m0WGyWo936SRYa4RP7+8Z0X8oIQAEKell0XQF2Yt4z9NEXZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3572
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

