Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBF5D3586C6
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231937AbhDHOQ7 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:16:59 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:53169 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231952AbhDHOQz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:16:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891403;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yajnkEc27ntpQX9y5f1agIELyl3+Xvf1Su9bs6qert0=;
        b=hpbg5zPdXo2RsquF/FgYhyTku74eaYS1/Gy1bXgjDaM36F8QmE26XSofNRY8EZoIVXPc3d
        WlOGKcG0iht30z6zORD4u3RulGnHdY6RgXZhNhR0ms6lG53Y8/pLPwNIU12mlylk/4LxJY
        NpSkwoLCUFD+JE1QBWK21EXwOdza39s=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-4bJ2o2H5PpiXblB8gvqBow-4; Thu, 08 Apr 2021 16:16:26 +0200
X-MC-Unique: 4bJ2o2H5PpiXblB8gvqBow-4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PKTcxT4u4m+BC6xbGkMUAmrKX1YcEvKVtTEnLUO7x6mpYdgZSxK700x/1MPUHiNOTO1CJkJRx9ARAdV2eOxAtPNcqYPqtdRoeEAqGZxaLCQ/rmSqCL5JmUoePKQWpzj4gzFRZbKQvsXCV19QcB4AfBifPRP0rPtNwmeSxxmknG2VTViXChPszzpWfuTVsLoPyPOLCYLpMYzHutTgGVrFnk/l90Vq1HmvGAy2gdiOpfuPYswbrFRfw47cBXuGXjzrOknWvZilEFilXzL6VoV9/1HkOkewyVqnV3WQDXv6RFP6mFfSND/BTRbqceBsHX46O+Vshhw2p2yzXsGcFvVlAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T9VlDQvS45hhOSp2ljrxv0PI2XxklWAE2faxm4TbDk=;
 b=jNSSu+uYq5PfXijKdlIgW4sqsJRFaQz1GahRK/LPffxMtxUbnj42jP8LyIO8gMTkbdzcYNxhnudX0u5eimTf9/C4tGZ6zJsLIi3N/781LlR3LxhMUKD07zc5zIW4W266oqwcgo7Dl5bXZ7+aGqDe0mECEfoInebdWUn1XNq7O9wjD99qCk/fMgRIeXtv9miYdfVi5ZWQcbw9HTlXjHOSpnlkbHLNwFj/WIZQseXeuWxioBgRgeJVGlr/eFeYq80I2c0FrM+GWuqwl8SHR2LhLXwkdI2ktfJs2+d7vvSgWW73cWoWBTpjpP/EO05U7YAJZHtLG2yOyX2LuTiaCk3a5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 14:16:05 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:16:05 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 07/18] crypto: rsa: Move more common code to rsa-common
Date:   Thu,  8 Apr 2021 16:15:05 +0200
Message-ID: <20210408141516.11369-8-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:16:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 562b625c-9a30-49ea-500a-08d8fa98d8a4
X-MS-TrafficTypeDiagnostic: AM0PR04MB6289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB6289AABF82C9F97E77D41877E0749@AM0PR04MB6289.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:252;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: irSJHN+OYLOOsdHGoMiRHJ15zQt89a3DMHxqPOVepuObKhEVzgJ16XxanIcfLhKeMDFUFkoiG/SLo27P2E7IyEj91C5GkqfOhG21rVVk0afbIPhPmfp0VH+B8vcnMo8ssHxcHai9ttQat2o0RoVjrPKV3etpnWRIw24VsszCyIAIU3/jewauqgd5xV23oqbzRIm/vvoWQr8V6Z0QBblUSIDlyn2Mm4LXNH2CfwJAwtn7bkbknyCIBri70htj2+TNzHMcsYlo7dEPsWtYNcPckOmrHdUsFfjhO9GRfVi5xeIp2TntQKRFWYW5njSOiQZGmhVR5PpdVH9ULFQ/B9W1GYU5Pxdp4RVSI/aYmtmzPIvNdKYZ9rNgornACJgjFVxSB0m5d0CxXNjilqONdIT6qoKwqpc+7yg4q22O2d2Dv7VcSnIQ3ua0H5a48up7A1lYng4PXN2dMNxvcKgUtnWb2E5mOVWm1APbe6llDyZNAKgE7clTB9IFiTJYJhlmNgda6XEMb0nGgl+MmSC/UauMBLDlg3iOPrUZFA8DdaReyE4E/vM3E2bfNGEXWUriInpm0qVVwbM6bhN/3HsKjiCYpd/DcDj4JP3K85N08BaEN7V5fl1X8y/PEypaL/wFZvz2lqc9FQ+j77x6+xblI0ZFxbVH/n5zWd6kzQY0WtJ4+0Ff21cTYYnoMthV9J7qS/jX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(186003)(83380400001)(16526019)(478600001)(6486002)(38100700001)(36756003)(30864003)(5660300002)(4326008)(6916009)(1076003)(66476007)(316002)(2906002)(66556008)(26005)(38350700001)(2616005)(956004)(8676002)(44832011)(8936002)(6506007)(86362001)(52116002)(66946007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bcSEJPJ1UANNX2hdaJU4P4GgjY1nklfla/xwO5isIEwv37Dm8kXUgK7JrZJt?=
 =?us-ascii?Q?wtwoTeSni+8jwRgTabgcBEmL9ZYemlJso28UeWZt4tFV+ToyhBib2qHLs8WX?=
 =?us-ascii?Q?E/Yt9cNEknb5DyBvooX4aMy1/OlunNeKaXDrIrhQdNtquFQ9HYtt/UACcCVX?=
 =?us-ascii?Q?aWHlVDfUnCNNuRokbI2irjKLGoarlf/YcldCd/oVQa/7bOSMJiXWlupgtWiZ?=
 =?us-ascii?Q?/bgTBJViMWTkErX2uEYIvdcdf2AChBOQ1lAnjJjgtPyJPL39bozGJDZNF3jG?=
 =?us-ascii?Q?yn4uQ4+BEvCys6zxyJorNTOB7V1WV7esudK2Wq7JxwtPPUJZsIVrGO/X8kYG?=
 =?us-ascii?Q?Hlg/9cHX9jfBOQePw20tRC+P64zg9z8jOLRIxG0qCFD0Y/TM5dbjy+UsWKpR?=
 =?us-ascii?Q?zwXACUpnG7U+PuxsP5R20An0mKKVMVsKwMaq1gV6JyAK4cVqODbEOSJZQ2Al?=
 =?us-ascii?Q?uauBLAPOOJi6r1IHNmVkBUZjINRctbYJelt3G5q0I17YqBtXZtBLuYd+KsHT?=
 =?us-ascii?Q?kX0lLRZJG5mbaub3WKevm7IIV2U0GxUeuhVBNL2EQ4jEaYVcNTbTSvE6T0f2?=
 =?us-ascii?Q?Vq203v9yJh1ueTNkElvkraLA5mWM4S+LDGwe0jb0GgWRX40QmkrNryH/2cnG?=
 =?us-ascii?Q?8A35Etp0dEtSJzWK6eh+aIhKKbsGzDJID2WTB1LhTUD7DxQ+Mri9FKtXc2E8?=
 =?us-ascii?Q?WlUpbZLDzL35gSppcDHgEegV/wQA9mC8jaVwj6RhZnSDR/jKPxISNt8eqOAU?=
 =?us-ascii?Q?BW6d77XYjC6bCUG9GSndQH8W40M2JaaklJOd4BdM094rPIClkEknp9oi3+et?=
 =?us-ascii?Q?Q8fxnk9sxS+KO2skTrS+MIkyR66f9avbZplQkYJlE1pmv/fq+yt2eSFPkXYC?=
 =?us-ascii?Q?XlzCpdYzeFZTmxHapwDtypli46a7aAk8+T4sSwyPBwmYiCe1gRRc3qUokzRi?=
 =?us-ascii?Q?E4j8bb455+l7z+nWXGEyD+W13EymHc96yW8397a9kkQLJqKlzmYV5nD7b8FU?=
 =?us-ascii?Q?vp78q1gMaPV3GXE5FPx8Jcr83b4cZnvVPehTG80CVbt9EzD1HDxdLeKs38iP?=
 =?us-ascii?Q?f1VExjqgZi6Hk2qkcGW/laV9a0JOhKhnMokVWPRO2neJx2HNxXodJV0E8Ilp?=
 =?us-ascii?Q?NQCjWlorYyJeXXY5i89+kYxPw/KoGoewT0YwXyqdZI09SAkxsdOUeRu/GE1h?=
 =?us-ascii?Q?iiHihW/GSeHMNsAuIca9uqc9xgSe1/2KCTIh7q2d27jYlX8Q1DdRw3H+bBoL?=
 =?us-ascii?Q?yKfqDfaEH2qqu+ZG61XmAHYXryrDVhwx4n69g9sBf+RAywL4JmG7S33UMiw+?=
 =?us-ascii?Q?zOMIveHxh7yzZd3W5Sjbn1jL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562b625c-9a30-49ea-500a-08d8fa98d8a4
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:16:05.1344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KSOZCnNVLL0eeb0P29Odu6ii+DZznAThTrQAj8iMX5+4bwel7YanwSSRzX+qJYC5KgskyP+NkM2dkmkm8m1ekQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6289
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Move helpers for setting public/private keys, RSA akcipher
instance setup, keysize querying etc. to rsa-common.c.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/rsa-common.c                  | 183 +++++++++++++++++++++++++++
 crypto/rsa-pkcs1pad.c                | 183 ---------------------------
 include/crypto/internal/rsa-common.h |  13 ++
 3 files changed, 196 insertions(+), 183 deletions(-)

diff --git a/crypto/rsa-common.c b/crypto/rsa-common.c
index 60073c56e3748..d70d7d405165f 100644
--- a/crypto/rsa-common.c
+++ b/crypto/rsa-common.c
@@ -74,3 +74,186 @@ const struct rsa_asn1_template *rsa_lookup_asn1(const c=
har *name)
 			return p;
 	return NULL;
 }
+
+int rsapad_set_pub_key(struct crypto_akcipher *tfm, const void *key,
+		       unsigned int keylen)
+{
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	int err;
+
+	ctx->key_size =3D 0;
+
+	err =3D crypto_akcipher_set_pub_key(ctx->child, key, keylen);
+	if (err)
+		return err;
+
+	/* Find out new modulus size from rsa implementation */
+	err =3D crypto_akcipher_maxsize(ctx->child);
+	if (err > PAGE_SIZE)
+		return -EOPNOTSUPP;
+
+	ctx->key_size =3D err;
+	return 0;
+}
+
+int rsapad_set_priv_key(struct crypto_akcipher *tfm, const void *key,
+			unsigned int keylen)
+{
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	int err;
+
+	ctx->key_size =3D 0;
+
+	err =3D crypto_akcipher_set_priv_key(ctx->child, key, keylen);
+	if (err)
+		return err;
+
+	/* Find out new modulus size from rsa implementation */
+	err =3D crypto_akcipher_maxsize(ctx->child);
+	if (err > PAGE_SIZE)
+		return -EOPNOTSUPP;
+
+	ctx->key_size =3D err;
+	return 0;
+}
+
+unsigned int rsapad_get_max_size(struct crypto_akcipher *tfm)
+{
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+
+	/*
+	 * The maximum destination buffer size for the encrypt/sign operations
+	 * will be the same as for RSA, even though it's smaller for
+	 * decrypt/verify.
+	 */
+
+	return ctx->key_size;
+}
+
+void rsapad_akcipher_sg_set_buf(struct scatterlist *sg, void *buf,
+				size_t len, struct scatterlist *next)
+{
+	int nsegs =3D next ? 2 : 1;
+
+	sg_init_table(sg, nsegs);
+	sg_set_buf(sg, buf, len);
+
+	if (next)
+		sg_chain(sg, nsegs, next);
+}
+
+int rsapad_akcipher_init_tfm(struct crypto_akcipher *tfm)
+{
+	struct akcipher_instance *inst =3D akcipher_alg_instance(tfm);
+	struct rsapad_inst_ctx *ictx =3D akcipher_instance_ctx(inst);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct crypto_akcipher *child_tfm;
+
+	child_tfm =3D crypto_spawn_akcipher(&ictx->spawn);
+	if (IS_ERR(child_tfm))
+		return PTR_ERR(child_tfm);
+
+	ctx->child =3D child_tfm;
+	return 0;
+}
+
+void rsapad_akcipher_exit_tfm(struct crypto_akcipher *tfm)
+{
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+
+	crypto_free_akcipher(ctx->child);
+}
+
+void rsapad_akcipher_free(struct akcipher_instance *inst)
+{
+	struct rsapad_inst_ctx *ctx =3D akcipher_instance_ctx(inst);
+	struct crypto_akcipher_spawn *spawn =3D &ctx->spawn;
+
+	crypto_drop_akcipher(spawn);
+	kfree(inst);
+}
+
+int rsapad_akcipher_create(struct crypto_template *tmpl, struct rtattr **t=
b,
+			   struct akcipher_alg *alg)
+{
+	u32 mask;
+	struct akcipher_instance *inst;
+	struct rsapad_inst_ctx *ctx;
+	struct akcipher_alg *rsa_alg;
+	const char *hash_name;
+	int err;
+
+	err =3D crypto_check_attr_type(tb, CRYPTO_ALG_TYPE_AKCIPHER, &mask);
+	if (err)
+		return err;
+
+	inst =3D kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
+	if (!inst)
+		return -ENOMEM;
+
+	ctx =3D akcipher_instance_ctx(inst);
+
+	err =3D crypto_grab_akcipher(&ctx->spawn, akcipher_crypto_instance(inst),
+				   crypto_attr_alg_name(tb[1]), 0, mask);
+	if (err)
+		goto err_free_inst;
+
+	rsa_alg =3D crypto_spawn_akcipher_alg(&ctx->spawn);
+
+	err =3D -ENAMETOOLONG;
+	hash_name =3D crypto_attr_alg_name(tb[2]);
+	if (IS_ERR(hash_name)) {
+		if (snprintf(inst->alg.base.cra_name,
+			     CRYPTO_MAX_ALG_NAME, "%s(%s)", tmpl->name,
+			     rsa_alg->base.cra_name) >=3D CRYPTO_MAX_ALG_NAME)
+			goto err_free_inst;
+
+		if (snprintf(inst->alg.base.cra_driver_name,
+			     CRYPTO_MAX_ALG_NAME, "%s(%s)", tmpl->name,
+			     rsa_alg->base.cra_driver_name) >=3D
+			     CRYPTO_MAX_ALG_NAME)
+			goto err_free_inst;
+	} else {
+		ctx->digest_info =3D rsa_lookup_asn1(hash_name);
+		if (!ctx->digest_info) {
+			err =3D -EINVAL;
+			goto err_free_inst;
+		}
+
+		if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
+			     "%s(%s,%s)", tmpl->name, rsa_alg->base.cra_name,
+			     hash_name) >=3D CRYPTO_MAX_ALG_NAME)
+			goto err_free_inst;
+
+		if (snprintf(inst->alg.base.cra_driver_name,
+			     CRYPTO_MAX_ALG_NAME, "%s(%s,%s)",
+			     tmpl->name,
+			     rsa_alg->base.cra_driver_name,
+			     hash_name) >=3D CRYPTO_MAX_ALG_NAME)
+			goto err_free_inst;
+	}
+
+	inst->alg.base.cra_priority =3D rsa_alg->base.cra_priority;
+	inst->alg.base.cra_ctxsize =3D sizeof(struct rsapad_tfm_ctx);
+
+	inst->alg.init =3D alg->init;
+	inst->alg.exit =3D alg->exit;
+
+	inst->alg.encrypt =3D alg->encrypt;
+	inst->alg.decrypt =3D alg->decrypt;
+	inst->alg.sign =3D alg->sign;
+	inst->alg.verify =3D alg->verify;
+	inst->alg.set_pub_key =3D alg->set_pub_key;
+	inst->alg.set_priv_key =3D alg->set_priv_key;
+	inst->alg.max_size =3D alg->max_size;
+	inst->alg.reqsize =3D sizeof(struct rsapad_akciper_req_ctx) + rsa_alg->re=
qsize;
+
+	inst->free =3D rsapad_akcipher_free;
+
+	err =3D akcipher_register_instance(tmpl, inst);
+	if (err) {
+err_free_inst:
+		rsapad_akcipher_free(inst);
+	}
+	return err;
+}
diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
index ffb7220b3d10a..30b0193b7352a 100644
--- a/crypto/rsa-pkcs1pad.c
+++ b/crypto/rsa-pkcs1pad.c
@@ -9,73 +9,6 @@
 #include <linux/module.h>
 #include <linux/random.h>
=20
-static int rsapad_set_pub_key(struct crypto_akcipher *tfm, const void *key=
,
-		unsigned int keylen)
-{
-	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
-	int err;
-
-	ctx->key_size =3D 0;
-
-	err =3D crypto_akcipher_set_pub_key(ctx->child, key, keylen);
-	if (err)
-		return err;
-
-	/* Find out new modulus size from rsa implementation */
-	err =3D crypto_akcipher_maxsize(ctx->child);
-	if (err > PAGE_SIZE)
-		return -ENOTSUPP;
-
-	ctx->key_size =3D err;
-	return 0;
-}
-
-static int rsapad_set_priv_key(struct crypto_akcipher *tfm, const void *ke=
y,
-		unsigned int keylen)
-{
-	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
-	int err;
-
-	ctx->key_size =3D 0;
-
-	err =3D crypto_akcipher_set_priv_key(ctx->child, key, keylen);
-	if (err)
-		return err;
-
-	/* Find out new modulus size from rsa implementation */
-	err =3D crypto_akcipher_maxsize(ctx->child);
-	if (err > PAGE_SIZE)
-		return -ENOTSUPP;
-
-	ctx->key_size =3D err;
-	return 0;
-}
-
-static unsigned int rsapad_get_max_size(struct crypto_akcipher *tfm)
-{
-	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
-
-	/*
-	 * The maximum destination buffer size for the encrypt/sign operations
-	 * will be the same as for RSA, even though it's smaller for
-	 * decrypt/verify.
-	 */
-
-	return ctx->key_size;
-}
-
-static void rsapad_akcipher_sg_set_buf(struct scatterlist *sg, void *buf,
-				       size_t len, struct scatterlist *next)
-{
-	int nsegs =3D next ? 2 : 1;
-
-	sg_init_table(sg, nsegs);
-	sg_set_buf(sg, buf, len);
-
-	if (next)
-		sg_chain(sg, nsegs, next);
-}
-
 typedef int (*rsa_akcipher_complete_cb)(struct akcipher_request *, int);
 static void rsapad_akcipher_req_complete(struct crypto_async_request *chil=
d_async_req,
 					 int err, rsa_akcipher_complete_cb cb)
@@ -461,37 +394,6 @@ static int pkcs1pad_verify(struct akcipher_request *re=
q)
 	return err;
 }
=20
-static int rsapad_akcipher_init_tfm(struct crypto_akcipher *tfm)
-{
-	struct akcipher_instance *inst =3D akcipher_alg_instance(tfm);
-	struct rsapad_inst_ctx *ictx =3D akcipher_instance_ctx(inst);
-	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
-	struct crypto_akcipher *child_tfm;
-
-	child_tfm =3D crypto_spawn_akcipher(&ictx->spawn);
-	if (IS_ERR(child_tfm))
-		return PTR_ERR(child_tfm);
-
-	ctx->child =3D child_tfm;
-	return 0;
-}
-
-static void rsapad_akcipher_exit_tfm(struct crypto_akcipher *tfm)
-{
-	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
-
-	crypto_free_akcipher(ctx->child);
-}
-
-static void rsapad_akcipher_free(struct akcipher_instance *inst)
-{
-	struct rsapad_inst_ctx *ctx =3D akcipher_instance_ctx(inst);
-	struct crypto_akcipher_spawn *spawn =3D &ctx->spawn;
-
-	crypto_drop_akcipher(spawn);
-	kfree(inst);
-}
-
 static struct akcipher_alg pkcs1pad_alg =3D {
 	.init =3D rsapad_akcipher_init_tfm,
 	.exit =3D rsapad_akcipher_exit_tfm,
@@ -505,91 +407,6 @@ static struct akcipher_alg pkcs1pad_alg =3D {
 	.max_size =3D rsapad_get_max_size
 };
=20
-static int rsapad_akcipher_create(struct crypto_template *tmpl, struct rta=
ttr **tb,
-				  struct akcipher_alg *alg)
-{
-	u32 mask;
-	struct akcipher_instance *inst;
-	struct rsapad_inst_ctx *ctx;
-	struct akcipher_alg *rsa_alg;
-	const char *hash_name;
-	int err;
-
-	err =3D crypto_check_attr_type(tb, CRYPTO_ALG_TYPE_AKCIPHER, &mask);
-	if (err)
-		return err;
-
-	inst =3D kzalloc(sizeof(*inst) + sizeof(*ctx), GFP_KERNEL);
-	if (!inst)
-		return -ENOMEM;
-
-	ctx =3D akcipher_instance_ctx(inst);
-
-	err =3D crypto_grab_akcipher(&ctx->spawn, akcipher_crypto_instance(inst),
-				   crypto_attr_alg_name(tb[1]), 0, mask);
-	if (err)
-		goto err_free_inst;
-
-	rsa_alg =3D crypto_spawn_akcipher_alg(&ctx->spawn);
-
-	err =3D -ENAMETOOLONG;
-	hash_name =3D crypto_attr_alg_name(tb[2]);
-	if (IS_ERR(hash_name)) {
-		if (snprintf(inst->alg.base.cra_name,
-			     CRYPTO_MAX_ALG_NAME, "%s(%s)", tmpl->name,
-			     rsa_alg->base.cra_name) >=3D CRYPTO_MAX_ALG_NAME)
-			goto err_free_inst;
-
-		if (snprintf(inst->alg.base.cra_driver_name,
-			     CRYPTO_MAX_ALG_NAME, "%s(%s)", tmpl->name,
-			     rsa_alg->base.cra_driver_name) >=3D
-			     CRYPTO_MAX_ALG_NAME)
-			goto err_free_inst;
-	} else {
-		ctx->digest_info =3D rsa_lookup_asn1(hash_name);
-		if (!ctx->digest_info) {
-			err =3D -EINVAL;
-			goto err_free_inst;
-		}
-
-		if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
-			     "%s(%s,%s)", tmpl->name, rsa_alg->base.cra_name,
-			     hash_name) >=3D CRYPTO_MAX_ALG_NAME)
-			goto err_free_inst;
-
-		if (snprintf(inst->alg.base.cra_driver_name,
-			     CRYPTO_MAX_ALG_NAME, "%s(%s,%s)",
-			     tmpl->name,
-			     rsa_alg->base.cra_driver_name,
-			     hash_name) >=3D CRYPTO_MAX_ALG_NAME)
-			goto err_free_inst;
-	}
-
-	inst->alg.base.cra_priority =3D rsa_alg->base.cra_priority;
-	inst->alg.base.cra_ctxsize =3D sizeof(struct rsapad_tfm_ctx);
-
-	inst->alg.init =3D alg->init;
-	inst->alg.exit =3D alg->exit;
-
-	inst->alg.encrypt =3D alg->encrypt;
-	inst->alg.decrypt =3D alg->decrypt;
-	inst->alg.sign =3D alg->sign;
-	inst->alg.verify =3D alg->verify;
-	inst->alg.set_pub_key =3D alg->set_pub_key;
-	inst->alg.set_priv_key =3D alg->set_priv_key;
-	inst->alg.max_size =3D alg->max_size;
-	inst->alg.reqsize =3D sizeof(struct rsapad_akciper_req_ctx) + rsa_alg->re=
qsize;
-
-	inst->free =3D rsapad_akcipher_free;
-
-	err =3D akcipher_register_instance(tmpl, inst);
-	if (err) {
-err_free_inst:
-		rsapad_akcipher_free(inst);
-	}
-	return err;
-}
-
 static int pkcs1pad_create(struct crypto_template *tmpl, struct rtattr **t=
b)
 {
 	return rsapad_akcipher_create(tmpl, tb, &pkcs1pad_alg);
diff --git a/include/crypto/internal/rsa-common.h b/include/crypto/internal=
/rsa-common.h
index ecdce0cdafaa3..a6f20cce610ab 100644
--- a/include/crypto/internal/rsa-common.h
+++ b/include/crypto/internal/rsa-common.h
@@ -34,4 +34,17 @@ struct rsapad_akciper_req_ctx {
 	struct akcipher_request child_req;
 };
=20
+int rsapad_set_pub_key(struct crypto_akcipher *tfm, const void *key,
+		       unsigned int keylen);
+int rsapad_set_priv_key(struct crypto_akcipher *tfm, const void *key,
+			unsigned int keylen);
+unsigned int rsapad_get_max_size(struct crypto_akcipher *tfm);
+void rsapad_akcipher_sg_set_buf(struct scatterlist *sg, void *buf,
+				size_t len, struct scatterlist *next);
+int rsapad_akcipher_init_tfm(struct crypto_akcipher *tfm);
+void rsapad_akcipher_exit_tfm(struct crypto_akcipher *tfm);
+void rsapad_akcipher_free(struct akcipher_instance *inst);
+int rsapad_akcipher_create(struct crypto_template *tmpl, struct rtattr **t=
b,
+			   struct akcipher_alg *alg);
+
 #endif
--=20
2.30.2

