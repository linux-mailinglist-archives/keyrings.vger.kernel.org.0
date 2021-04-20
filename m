Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4EE63657EA
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232111AbhDTLrI (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:08 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:54074 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232122AbhDTLrC (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919190;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yajnkEc27ntpQX9y5f1agIELyl3+Xvf1Su9bs6qert0=;
        b=fgrjQFrr0R+VJmeVsfJnIxzGl7ZJDfWG0AaiF/apZvV6Y0K2Fm7OFxreTYcRRL9cmJWFxn
        5ZATYNvKxEzDu3dGI6jRLE65rw1P1mSlwvYK21q8l4qsI+Fdi5mymPA/0Rjfwi8ybDMyo2
        P0mZhBGxGwlbTA2uQyGX1zQp2UfaAjQ=
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2059.outbound.protection.outlook.com [104.47.1.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-19-EEBsFvTZPliE8uTBdC-X7g-1; Tue, 20 Apr 2021 13:46:28 +0200
X-MC-Unique: EEBsFvTZPliE8uTBdC-X7g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mT4wbYdELaxU7z+pUNZ68PPWLZAc7iXupgCFTT6KeLknSB+gAIJdjsAy0X5Stu8bIAo/gZ2ZwtOPQyLqZ2e7ceEXPeTBddDoYmBA/SWPWai6JIc9Be5tih7uSL5lZqmZjQLjLbC+LTA59dnsC/hHLcreXdSO+XaKZPAhTk4sPDWqXcMYKQtaqLfGTAytJUZO2HiH0AGQVvYoSpqAPx0tJqG62P4w9XkeaSZYEfZmfT2quVycbELLD1T+EbTFY5/10hyaidGOf/dV8rRQjyJulShy8GIgdmhEj3X09Oem/ctdhXaXyKV4qCerT4TFIU0FqI1Y18yloLtsngaQnaxfrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T9VlDQvS45hhOSp2ljrxv0PI2XxklWAE2faxm4TbDk=;
 b=VRqNzL2WugmCifTHv1XAu6XK2XglNXQ0ByJbrkqPHIoficevU7UeYn8DPUf8qc6rCc5CVl+yfzunkhu26oROTU32mAmCY7shfexESo3k/v2ylb5g9C3Tm+/IYQxEwp2iO7Dl5L56kbJFrGi5YW/iXqXAVUjlSVsQoa9WKdp14ZE96LjCbJKByZWOCNZdXfkTwaaG5ZoolVL2bPkLlFFkpCssJzWNaL7B9pFrenuPfmEK5e3ttCyB4plE2qtQIVgWDptwsrtuaJGP5dRgJXO2ffejXpWLfHAiiX4hGxzZ0AZTBHjx2YnmW32s3L7+n0ReVsJG4erGEbl3+aiW7r4Gxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB5154.eurprd04.prod.outlook.com (2603:10a6:208:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:27 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:27 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 07/18] crypto: rsa: Move more common code to rsa-common
Date:   Tue, 20 Apr 2021 13:41:12 +0200
Message-ID: <20210420114124.9684-8-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 451cb5f8-7f8e-4306-d888-08d903f1ee66
X-MS-TrafficTypeDiagnostic: AM0PR04MB5154:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5154A284046622B54B2549CCE0489@AM0PR04MB5154.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:252;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ecWhF4pwHqrcWs3YJvM1/X4cbSQgkxASN7Rcpm4HbtJnjGUmv23HRtzgvdxLBmL0SHvrN5uApsDbX5HzUaneBOTO3wP2W2PbPm0GzauKnLcQc1+JWb1Iq8BHDBnNz3maabT/Czb2L8u6mE5cC+lQLzskjfjyhV1jdvL6uc+4ognDnrApmwYdzRA7YHkhOioxZBlQkgKfu7Ob4mJCu5DmRP97aVdhZNjPaS/l5M8yU/DsNIwikrhel70DKGY/JRxJbDjS8ppo68XvbAZjtJwmWMqj5reMfWHKFysEl7slb0XZMJamlVcvJaEYhaq65lPK5RudPO2N9Mzgn49s4WZApqmeQqIf1VB4zITBe+uMuE31oXaV4p6XOLZyZ+tONeUe17LoYZaMrCcTUJd3SW+HiPTgFw12qfbFGt3EB/+6UEeOMTguMU1Kd1mPmgboKFtDyNM1iXNVXSx/ZYHA/zNOHbQpYb63+YDl7PJqIwRQM2trfw2N69gJb8L7cj7DxctL7wCKwl+wFPRcx0DHXNNr7iiIr/xQRtv24b/tq643Kzw9wckEuJtBQswcGbkilBMO1MFDZ6GpGc67lx2muDlmNQ4CrF8xbmrdCKuWDUch/aDqeeEVgOstjIvEjIamTuAzZBW4c4nakWI+P1VcaHD4OBdzdlGShzyTOkGXvf0KnZ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(396003)(39850400004)(26005)(16526019)(86362001)(186003)(956004)(66476007)(8936002)(5660300002)(66946007)(6506007)(44832011)(4326008)(6512007)(6486002)(8676002)(2616005)(30864003)(316002)(6666004)(66556008)(36756003)(38350700002)(52116002)(478600001)(38100700002)(83380400001)(6916009)(1076003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1qf36gbMrU1uc4GUmdSKu77Smafmsy1ySE+B63i3eDrpfqjUJhPqagL6rfzH?=
 =?us-ascii?Q?GA+1Ry8SuS0Bn+ZpRBbzPBR6RluXTD1q/+1ZnrFnKoa+J+v9BT8m4FXY4jE1?=
 =?us-ascii?Q?LW2Qq8ZVv+jkPsPHQMBxMoUo0T+9ZHC601YiM34lwCZvT4i1mUQw5gMfXHa4?=
 =?us-ascii?Q?mp2x0WdMKL9UIhlbRqAs1/jnkEa7DS9Ac3vkBFeDzGKiVKzP9Jj1ii+WGIl5?=
 =?us-ascii?Q?RbbicmD9t+5VMnMpNmSjTujHDbBH4g8ma+IClfDuH5lSsJtggrCRE7X5HHwL?=
 =?us-ascii?Q?1iK91slCSNl1Hf5b5sFl/yI+aU2gG4/vQAwo45oTydK5z1Ge+qDsy1HVl1yG?=
 =?us-ascii?Q?8gT7vKc3RNx1eBaumwLfKCkZpCJp4damunER8ooG99nTgX/1B5O4QUUqlD5+?=
 =?us-ascii?Q?uE2rpyLdbJVWNWwymRb8HetvwIJx0r7caYfulKGxR9PaJUUtNJ+yI9zE6GLI?=
 =?us-ascii?Q?yINERODczxX3g6vcvrEg6/s3tRAsjJerIyONLDc69zZ0UnxyoTTvLw1RTO3i?=
 =?us-ascii?Q?TSGVWItRc+tmftAgfBfvY/B0FWOK0BpTJYViymo0XI6uMqPfXLOJMzpW/u9R?=
 =?us-ascii?Q?JLj70+CPA2pQ15VDlADEMtfDlRf64np4iScc7C4ldL3w7QnOF4JO9RZiZeB5?=
 =?us-ascii?Q?grKR/6/kNko2XgWlnSr6wLIaC8n4mo8tpP6nZgu+JWI9NtWT2tqdMcKNdnPQ?=
 =?us-ascii?Q?9iq6V3GXbyJB2NIQSdxWm9/ltVIE2HBnGQx343du4p6IIn9GJAUWLZ5r1M4j?=
 =?us-ascii?Q?HL/aT0maGY+061EASmPY1DaA1ZH6WUYp071a9xuooE54F1nUy4FJgIWWbkgJ?=
 =?us-ascii?Q?fejDaYcPz/aYw9/jeatdFyubgAS2xmnd90kL0JIGkblXA3BjYOKnWBWlfQrK?=
 =?us-ascii?Q?1JTRkAlp8y9M896ApGVQzP8Re5rfjjuoahFjGzmoLOLC0N/AGdDie7x4WR+I?=
 =?us-ascii?Q?Tr49O/bXbyPtggTku2g54J1W9Y4jgp6SPsrH1TBTK0Tw4gYf9oiwQhlHY7MB?=
 =?us-ascii?Q?a42BdoyCrte/exjEYfO+hbSehC20ivXEaI6J1fFK7qrxpPBfUmhdMjGQBb6j?=
 =?us-ascii?Q?D+zwTSowkrM04bqsAHkNI9jHsCtwLIFQse3iR07XACqwuEy8+s8OVrAEErUf?=
 =?us-ascii?Q?KCJ52q04kC/gJHidOBYKAlvTKH4rAZPngJoNPPFOKQxpsfSTzGBqVM84sS+h?=
 =?us-ascii?Q?RH5ys6XOhNDAL2fNlQnD9/qr2XLo48C39YjowvFJEy7cfvjxjEJj/HnOeYsP?=
 =?us-ascii?Q?R24RxXurQuZ8dgikfwH9BThYVhe7x3s+bEQ9zSvHmdknvK+wyDH6vtXp8Jg1?=
 =?us-ascii?Q?jIW5dAejlK+NgJLt3UJJXb+a?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 451cb5f8-7f8e-4306-d888-08d903f1ee66
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:27.3004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LsZgmcKRoddHAxVo14qzccnFitymdUuCtV7RWLiQJisoJTAAcx1VbuhoWAR2JfHF6fDJ7vinTUsrRjC26zpFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5154
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

