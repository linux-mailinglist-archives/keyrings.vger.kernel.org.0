Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA993657D9
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhDTLqv (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:46:51 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:45864 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231949AbhDTLqu (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:46:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919178;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6fL98t5zZN0iCvyW4Pat9TU44DEzWzujgQbdoqyxf5A=;
        b=AWJkYpkmexESZRQL6dvmds0tzlrJZEI79jsE4FSwT4trEMhaYKDjwHhciPktSAhNHyMidA
        RPxeE1XiLjlDUwTn28GlhptgCbkxooOjnzDavEwz8ollssSz86MB8Y3aXDmBgjqLCKNgEJ
        OKaeyGLwwOOlmYH3CI1ew+1n6EkF7Eo=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-oXuShDJuOdypKjVYQKlG9w-1; Tue, 20 Apr 2021 13:46:16 +0200
X-MC-Unique: oXuShDJuOdypKjVYQKlG9w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3NxH+SeNzUV+nEtlMtmJeqTF6ZGrrnYnwI8ATiIpMjQgwybZ2ezvG/SvAv1FZCVQJ0+o4wDqFpzd4mnNXMHrSZXWrq7TCiHjs6Qyqgybe5O3RZ4ZDW/mOx/ns2/dRSqe9CXa0NXI1s1YJGV/o7qz8RbNXLRuMePPBq/JupkFOUBa3uIztBLRh1GZsu+uKpvySzhdpyRMdDHTNJQ1ujiNco0XwMhf2OBddMtDP6raMQq2+J2mzk+AZY8XUvfSkcAKrDQ1p9/bysT2D5HaJMRCrmc8dY1M0L+43lwEt6D8EGBBEcrAswObHxskaQ0LNzAscRVwoH9NYuSCvEgDGAGzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sj5+vSrW7VRmF6gKH5OlFOxZGJYseHq1OU1GF+D6wvc=;
 b=MdEVqX2CylpIqXN4qXkWkhrwtYfhLv6wjpnFIh8t8ShdFt8lFknRnJ1AlncP+Eln+JiiBXcBPQo56KkuV/nMYHTIyCBLbJWZSlBk6UpF1hVfuM2tDHNZulWCmwN+SXhOz1qxk1Bi8DrtrQW/nfm0wZmXI1oddeTIllxmLzHlI3HHDawHap6P3K4HwSyDOx49z+iIsW9x1maJbb6WdueNs4H3esoksnCFsOncybdXI+ano4h05fDbcy5zQnL8ZRWasqPDYmCFJawJ2VZREI61uEDBIn4exu6cK4wE6K4IZiwX/r+WArqRDw9dXX3EOnRPGco/zBMjF8cpqHivUrSDwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB5154.eurprd04.prod.outlook.com (2603:10a6:208:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:15 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:15 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 01/18] X.509: Parse RSASSA-PSS style certificates
Date:   Tue, 20 Apr 2021 13:41:06 +0200
Message-ID: <20210420114124.9684-2-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3dfc24c3-495e-4cc0-d941-08d903f1e73e
X-MS-TrafficTypeDiagnostic: AM0PR04MB5154:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB51541B7DF904139152927135E0489@AM0PR04MB5154.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:597;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wiwR76UUzcKjRdXWEJksBVLVwx0rybR/EHPjER5MFfYhw8gRYpPy6/nJXqyu8Ik4jl6Ei0jS7HJvi4lS4cL/n4P3cE/zTNZXXbA+DRW/K5zqWUYL61xPKaQqviqazSJG426AYYnvPgLSBNU3y0ModrYhyaKi7gAxrKLar6L0aqDy29p/cuJU61oUUvyObDwKMMj1jD0qpXUxKsbcHalZ3GAkQXvm7JXFxeUXg9rHovhas6/95MMrZTQFIrENFegu6CdylGwoJCHv+LCJQbrhQzN7pb3vaGRsmNBbT2wZOiP0a5toiUWlILobDGL4ShmOB6+GI4hxFQW37nluI4sbxU0NHbLj3Lydm/QGu1+60AXPcZZr/N6Bfgrp5dtW4v4nLUTUYco0QzB/zMWsiF/o84Hl1jfMKgjjAeYhwzoa7ZA0dQVPHYD9yS4fIItUWX4gFDD8gbfM7PF6svWoKbdnYuErYRLxkkXLDy7hy7KPj/2oGLJbxHoV5EkxIJ2oYDkuNDYadLu2Xcg6IZUfcSdFJemkNlbv4tkFtmi83GNLAVcSY0mYLYG5dE9xFedEGGh/yhXtRAJhTXQ6RIwuDoWeSvnbqd1uoD13VR97OuhStds0vKAdLnM7CVAZSgXEssRFdd0ZkqzfNalcoEMfMimz9pC7nDl6GE3NwTJMzZmJqDt7bP9+XUfx4BiR17e9R2oYozSFLxuKyEJFjwUlFw7EwVPkH/E2+ZGgljqY0lYEAIA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(396003)(39850400004)(26005)(966005)(16526019)(86362001)(186003)(956004)(66476007)(8936002)(5660300002)(66946007)(6506007)(44832011)(4326008)(6512007)(6486002)(8676002)(2616005)(316002)(6666004)(66556008)(36756003)(38350700002)(52116002)(478600001)(38100700002)(83380400001)(6916009)(1076003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SzROJ5eyNfL2oXGDyrcSGuavYgb3nJ9sRsTBxFi83NekGtxpzoEdwZ3XxdnN?=
 =?us-ascii?Q?gviYz8nehfo+2yaj3o235ry16/7k/66/pNzfYH0Mhr21qdywsh++1qH0knuo?=
 =?us-ascii?Q?dt3N7aaA+zNG7KFmf6MwVzmeFr9yyV+iVr1UZc87vv4C26aRMxZfiBCQZGNg?=
 =?us-ascii?Q?EHLHlXbE+jae8TLMIolXR4Yoq/6+Fl8pfLCBmJe3cz5fq1XNV9l0ZO0Sa8vB?=
 =?us-ascii?Q?RuYtOXIsHX6BOd9hlaBFghqF0aLFIq3zGe8MTz4nxAX5t8+ApppdMI9kXrVP?=
 =?us-ascii?Q?0zjxwdXgn2ATETV+RiKxV2hauRh2B5q9qz7UTJcAGdtgvWMzkFZHafWeMj66?=
 =?us-ascii?Q?rZwBRltQF+WnF2HJ2V4v6HJEPWKe5xPaHxWPiZ3K5Lm6D1paUS/w7Q8M5jqp?=
 =?us-ascii?Q?AbY71ZsPCP97spVyLIJeM71KaZt1gZF6cJVDWGPnVRq3ymMIB6Pfp3+puM3a?=
 =?us-ascii?Q?jv/cuxCgJY/tT8GTIJqQoJKZX2M6Luop5ANuRfJF5upLyfZJIcC3nWYStaaZ?=
 =?us-ascii?Q?9dP6/U+KJYG50ohgnnsxfJybriyGdX94R3SUiDwmc4oQu4x7X+x+r0dtNBGf?=
 =?us-ascii?Q?wcy2Ghv7d29RiuUVswVgIAi/8/g/57ajzMEncF99KL68NXpBfGKka2K8Rsdq?=
 =?us-ascii?Q?KBBUlOx7mP54yK4kXOTZCGa8opdX5SNTI0tGbgLIqlpA+PQXWgr9Pa0fflkD?=
 =?us-ascii?Q?gZX43xHhaCh4dVAKnVlx+y12ZzgeJtcdDdgTI8xTCzTXQ3JVvh529kLZH3LZ?=
 =?us-ascii?Q?ZTIkAXuw3iOZ8jBUKwzdX9Idmy1LiBK9MPQTMvdV4lFEHJ3PPPP/63Zeo2A5?=
 =?us-ascii?Q?BjGVPiJVTXXuX3RyoLQv4YgevKJ48tkcoCoR1Y9J0ew/ZPaqFNnDuSpaUBGN?=
 =?us-ascii?Q?j/c8lb8M52H9oeyIYHrixpzakGF4UHNTq0bfE+pfMTMXh9ZW6xyx4ay6oIFd?=
 =?us-ascii?Q?orw2GVW45Nv1MizU2bj+Mru8KtjsykHv4h5vXSXSzzKAdIL/nPjAKrpNpo/U?=
 =?us-ascii?Q?02pUyGIGBbSgazdY+0C3eNelwSPgCnEZYCcye6kNoKKSfAqoUXvnsEZ7pvny?=
 =?us-ascii?Q?g4FAZb2YSpTmtYnAfRYHvMvaepcmU95+Fj34mOXpWNIeJ0rOF/qDDR6ltNro?=
 =?us-ascii?Q?SEvWb+lHFhuCfLFpKcGKpbMR0D1PpKwqWubXUEfJ5mPL9GEyw+61vCOJ5fdf?=
 =?us-ascii?Q?ZvosHYajgh2dmi1FeEAf3kRT+trKmx4aNdv6wlAp/zVxrRsBLtXt1fFCL1dn?=
 =?us-ascii?Q?38LJ+lIew9nirniq/7xfjFXvHtPfvSGE18jX4lD3jyDM8hmaoW/aUtIRMWAB?=
 =?us-ascii?Q?rgKNLtrvi+tYLw/mScHN06oc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dfc24c3-495e-4cc0-d941-08d903f1e73e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:15.2752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I2gTxBKNkX9TiwsrdAp5RcEqd2tJiClQH4GPaZWlr7A2tXPdhQCqo5V2O8yMNBwm6BC89z2ov+hlV2AVwtH0Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5154
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

An X.509 wrapper for a RSASSA-PSS signature contains additional
signature parameters over the PKCSv.15 encoding scheme. Extend the
x509 parser to allow parsing RSASSA-PSS encoded certificates, with
the defaults taken from RFC8017.

References: https://tools.ietf.org/html/rfc8017#appendix-C
Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/asymmetric_keys/Makefile           |   5 +-
 crypto/asymmetric_keys/x509_cert_parser.c | 148 ++++++++++++++++++++++
 crypto/asymmetric_keys/x509_rsassa.asn1   |  17 +++
 include/crypto/public_key.h               |   4 +
 include/linux/oid_registry.h              |   3 +
 5 files changed, 176 insertions(+), 1 deletion(-)
 create mode 100644 crypto/asymmetric_keys/x509_rsassa.asn1

diff --git a/crypto/asymmetric_keys/Makefile b/crypto/asymmetric_keys/Makef=
ile
index 28b91adba2aed..f79ed8e8ef8e2 100644
--- a/crypto/asymmetric_keys/Makefile
+++ b/crypto/asymmetric_keys/Makefile
@@ -20,15 +20,18 @@ obj-$(CONFIG_X509_CERTIFICATE_PARSER) +=3D x509_key_par=
ser.o
 x509_key_parser-y :=3D \
 	x509.asn1.o \
 	x509_akid.asn1.o \
+	x509_rsassa.asn1.o \
 	x509_cert_parser.o \
 	x509_public_key.o
=20
 $(obj)/x509_cert_parser.o: \
 	$(obj)/x509.asn1.h \
-	$(obj)/x509_akid.asn1.h
+	$(obj)/x509_akid.asn1.h \
+	$(obj)/x509_rsassa.asn1.h
=20
 $(obj)/x509.asn1.o: $(obj)/x509.asn1.c $(obj)/x509.asn1.h
 $(obj)/x509_akid.asn1.o: $(obj)/x509_akid.asn1.c $(obj)/x509_akid.asn1.h
+$(obj)/x509_rsassa.asn1.o: $(obj)/x509_rsassa.asn1.c $(obj)/x509_rsassa.as=
n1.h
=20
 #
 # PKCS#8 private key handling
diff --git a/crypto/asymmetric_keys/x509_cert_parser.c b/crypto/asymmetric_=
keys/x509_cert_parser.c
index 52c9b455fc7df..19cd162acdb06 100644
--- a/crypto/asymmetric_keys/x509_cert_parser.c
+++ b/crypto/asymmetric_keys/x509_cert_parser.c
@@ -15,6 +15,7 @@
 #include "x509_parser.h"
 #include "x509.asn1.h"
 #include "x509_akid.asn1.h"
+#include "x509_rsassa.asn1.h"
=20
 struct x509_parse_context {
 	struct x509_certificate	*cert;		/* Certificate being constructed */
@@ -38,6 +39,8 @@ struct x509_parse_context {
 	const void	*raw_akid;		/* Raw authorityKeyId in ASN.1 */
 	const void	*akid_raw_issuer;	/* Raw directoryName in authorityKeyId */
 	unsigned	akid_raw_issuer_size;
+	const void	*raw_sig_params;	/* Signature AlgorithmIdentifier.parameters *=
/
+	unsigned	raw_sig_params_size;
 };
=20
 /*
@@ -101,6 +104,15 @@ struct x509_certificate *x509_cert_parse(const void *d=
ata, size_t datalen)
 		}
 	}
=20
+	if (strcmp(ctx->cert->sig->encoding, "pss") =3D=3D 0) {
+		pr_devel("rsa enc=3Dpss hash=3D%s mgf=3D%s mgf_hash=3D%s salt=3D0x%x tf=
=3D0x%x\n",
+			 ctx->cert->sig->hash_algo,
+			 ctx->cert->sig->mgf,
+			 ctx->cert->sig->mgf_hash_algo,
+			 ctx->cert->sig->salt_length,
+			 ctx->cert->sig->trailer_field);
+	}
+
 	ret =3D -ENOMEM;
 	cert->pub->key =3D kmemdup(ctx->key, ctx->key_size, GFP_KERNEL);
 	if (!cert->pub->key)
@@ -194,6 +206,7 @@ int x509_note_pkey_algo(void *context, size_t hdrlen,
 			const void *value, size_t vlen)
 {
 	struct x509_parse_context *ctx =3D context;
+	int ret =3D 0;
=20
 	pr_debug("PubKey Algo: %u\n", ctx->last_oid);
=20
@@ -238,6 +251,35 @@ int x509_note_pkey_algo(void *context, size_t hdrlen,
 	case OID_SM2_with_SM3:
 		ctx->cert->sig->hash_algo =3D "sm3";
 		goto sm2;
+
+	case OID_rsassaPSS:
+		/* For rsassaPSS, the hash algorithm is packed as a mandatory
+		 * parameter in AlgorithmIdentifier.parameters.
+		 */
+		if (ctx->raw_sig_params =3D=3D NULL && ctx->raw_sig_params_size !=3D 1)
+			return -EBADMSG;
+
+		ctx->cert->sig->pkey_algo =3D "rsa";
+		ctx->cert->sig->encoding =3D "pss";
+		ctx->algo_oid =3D ctx->last_oid;
+		if (ctx->raw_sig_params) {
+			ret =3D asn1_ber_decoder(&x509_rsassa_decoder, ctx,
+					       ctx->raw_sig_params,
+					       ctx->raw_sig_params_size);
+			if (ret < 0)
+				return ret;
+		}
+
+		/* Fill in RSASSA-PSS-params defaults if left out. */
+		if (!ctx->cert->sig->hash_algo)
+			ctx->cert->sig->hash_algo =3D "sha1";
+		if (!ctx->cert->sig->mgf)
+			ctx->cert->sig->mgf =3D "mgf1";
+		if (!ctx->cert->sig->mgf_hash_algo)
+			ctx->cert->sig->mgf_hash_algo =3D "sha1";
+		ctx->cert->sig->trailer_field =3D 0xbc;
+
+		return 0;
 	}
=20
 rsa_pkcs1:
@@ -439,6 +481,18 @@ int x509_note_params(void *context, size_t hdrlen,
 {
 	struct x509_parse_context *ctx =3D context;
=20
+	if (ctx->last_oid =3D=3D OID_rsassaPSS && !ctx->raw_sig_params) {
+		/* Stash AlgorithmIdentifier.parameters for RSASSA-PSS. */
+		ctx->raw_sig_params_size =3D vlen + hdrlen;
+		if (ctx->raw_sig_params_size) {
+			ctx->raw_sig_params =3D value - hdrlen;
+		} else {
+			ctx->raw_sig_params =3D NULL;
+			ctx->raw_sig_params_size =3D 1;
+		}
+		return 0;
+	}
+
 	/*
 	 * AlgorithmIdentifier is used three times in the x509, we should skip
 	 * first and ignore third, using second one which is after subject and
@@ -705,3 +759,97 @@ int x509_akid_note_serial(void *context, size_t hdrlen=
,
 	ctx->cert->sig->auth_ids[0] =3D kid;
 	return 0;
 }
+
+int x509_note_hash_algo(void *context, size_t hdrlen,
+			unsigned char tag,
+			const void *value, size_t vlen)
+{
+	struct x509_parse_context *ctx =3D context;
+	const char **ptr =3D NULL;
+
+	if (ctx->last_oid !=3D OID_rsassaPSS)
+		return -EBADMSG;
+
+	if (ctx->cert->sig->mgf)
+		ptr =3D &ctx->cert->sig->mgf_hash_algo;
+	else
+		ptr =3D &ctx->cert->sig->hash_algo;
+
+	switch (look_up_OID(value, vlen)) {
+	case OID_sha224:
+		*ptr =3D "sha224";
+		break;
+	case OID_sha256:
+		*ptr =3D "sha256";
+		break;
+	case OID_sha384:
+		*ptr =3D "sha384";
+		break;
+	case OID_sha512:
+		*ptr =3D "sha512";
+		break;
+	case OID_sha1:
+	default:
+		*ptr =3D "sha1";
+		break;
+	}
+
+	return 0;
+}
+
+int x509_note_hash_algo_params(void *context, size_t hdrlen,
+			       unsigned char tag,
+			       const void *value, size_t vlen)
+{
+	return -EOPNOTSUPP;
+}
+
+int x509_note_mgf(void *context, size_t hdrlen,
+		  unsigned char tag,
+		  const void *value, size_t vlen)
+{
+	struct x509_parse_context *ctx =3D context;
+
+	if (ctx->last_oid !=3D OID_rsassaPSS)
+		return -EBADMSG;
+
+	/* RFC8017 PKCS1MGFAlgorithms */
+	if (look_up_OID(value, vlen) !=3D OID_mgf1)
+		return -EINVAL;
+
+	ctx->cert->sig->mgf =3D "mgf1";
+
+	return 0;
+}
+
+int x509_note_salt_length(void *context, size_t hdrlen,
+			  unsigned char tag,
+			  const void *value, size_t vlen)
+{
+	struct x509_parse_context *ctx =3D context;
+
+	if (ctx->last_oid !=3D OID_rsassaPSS)
+		return -EBADMSG;
+
+	if (!value || !vlen || vlen > sizeof(ctx->cert->sig->salt_length))
+		return -EINVAL;
+
+	ctx->cert->sig->salt_length =3D (vlen =3D=3D 2) ?
+		be16_to_cpu(*((__force __be16 *) value)) : *((u8 *) value);
+
+	return 0;
+}
+
+int x509_note_trailer_field(void *context, size_t hdrlen,
+			    unsigned char tag,
+			    const void *value, size_t vlen)
+{
+	struct x509_parse_context *ctx =3D context;
+
+	if (ctx->last_oid !=3D OID_rsassaPSS)
+		return -EBADMSG;
+
+	/* trailerField 0xbc per RFC8017 A.2.3 regardless of if
+	 * specified. */
+	return 0;
+}
diff --git a/crypto/asymmetric_keys/x509_rsassa.asn1 b/crypto/asymmetric_ke=
ys/x509_rsassa.asn1
new file mode 100644
index 0000000000000..e524b978856d2
--- /dev/null
+++ b/crypto/asymmetric_keys/x509_rsassa.asn1
@@ -0,0 +1,17 @@
+-- RFC8017
+RSASSA-PSS-params ::=3D SEQUENCE {
+	hashAlgorithm      [0] HashAlgorithm DEFAULT,
+	maskGenAlgorithm   [1] MaskGenAlgorithm DEFAULT,
+	saltLength         [2] INTEGER DEFAULT ({ x509_note_salt_length }),
+	trailerField       [3] INTEGER DEFAULT ({ x509_note_trailer_field })
+}
+
+HashAlgorithm ::=3D SEQUENCE {
+	algorithm		OBJECT IDENTIFIER ({ x509_note_hash_algo }),
+	parameters		ANY OPTIONAL ({ x509_note_hash_algo_params })
+}
+
+MaskGenAlgorithm ::=3D SEQUENCE {
+	mgf	OBJECT IDENTIFIER ({ x509_note_mgf }),
+	parameters	HashAlgorithm
+}
diff --git a/include/crypto/public_key.h b/include/crypto/public_key.h
index 47accec68cb0f..f36834c8bb139 100644
--- a/include/crypto/public_key.h
+++ b/include/crypto/public_key.h
@@ -46,6 +46,10 @@ struct public_key_signature {
 	const char *encoding;
 	const void *data;
 	unsigned int data_size;
+	const char *mgf;
+	const char *mgf_hash_algo;
+	u16 salt_length;
+	u16 trailer_field;
 };
=20
 extern void public_key_signature_free(struct public_key_signature *sig);
diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
index 4462ed2c18cdd..c247adc8a41e4 100644
--- a/include/linux/oid_registry.h
+++ b/include/linux/oid_registry.h
@@ -113,6 +113,9 @@ enum OID {
 	OID_SM2_with_SM3,		/* 1.2.156.10197.1.501 */
 	OID_sm3WithRSAEncryption,	/* 1.2.156.10197.1.504 */
=20
+	OID_mgf1,			/* 1.2.840.113549.1.1.8 */
+	OID_rsassaPSS,			/* 1.2.840.113549.1.1.10 */
+
 	OID__NR
 };
=20
--=20
2.30.2

