Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6DB3586B6
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhDHOQa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:16:30 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:28100 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231863AbhDHOQ0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:16:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891374;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cmUAdFJ0uQw14A1uRJhYFxeqhrEmpnRdb5fucZevEH8=;
        b=HFzZ8/R3f0LnM/34QGDtGrXOuxywfRXsjyvGg983XWhAOMva4lFhGw0awV2YnE+bMvxylN
        hVQg+pESsAl/CfZgVyreyap2XZZJKDY7OT+v700qZrPfzR63yqttSdblcdC8MpyFe1jDuv
        wraXUXtIojP5bJ8t47H7kDA9hT25pFw=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-hp_enYxZN1uqXJ_i4yPCAg-1;
 Thu, 08 Apr 2021 16:16:07 +0200
X-MC-Unique: hp_enYxZN1uqXJ_i4yPCAg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JgaCdXJk0DGipYkmRq5X4pIUnDwo0K/NxDDpZiRRLCQ3nkwJ85sO5QQ2XXOGUcu9SJe2Bn/1ou/wV8kMhSFAwwUNK1/1cEi7vPveP4TXa1F6zaciF3CmgjP8bkq8fvLo/ymoY6O4aKquZTvArykTmTYz84LkK6jF6eM5+PwG7YsjQ3RP2mhQqqcHjl3GMwAV5Z2Cjw4hlZH7seJHbp/fnhj78g8z0dhEC31uhslsnub2qUtnQ2wlzyxrXu8W09VVYDBC09Dm2v/kCQBuTlZPhhIRUtZWPDndppu0QeyzgyNadnY+RhC4i/Jveiz5t4zhUHfUStMhiKmDsmZxt9czCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93i75lPbvB/8koH1C6/WbV75u4YZP4Ne/6Qzxao+vC8=;
 b=fjeKJtiUeYvXFjdo9QoNIBxUdFjNTxM2kIQoTKJcp7ActWD2bCraM+F4heveOUg8/CoD9sB0yRuvIH+kVxzPldGJh9ijUWqNO1ABpfU3fDI31fKmJ8I2TgYL1KQEO3U7URsJ9i+oyncFTg4CJnS+EkKsFfq/lVCe8xHHoqVTmT2sE+HqO84pjD+ycrUmhHWM/LSIbbamrcauNudzIxNpGGKfXAGm2IiVE3EotJemfo1xnJmCIkAzQ4wEfIw661wNl1G9uhkQqiacIqaxNzF22S2MF92kAG7kVSvHX8tBEk8NwaSTD0GVbJSpPFXDl5bmNdcyX8DZ5HndRcL0lDMZhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 14:15:56 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:15:56 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 03/18] crypto: rsa-pkcs1pad: Extract pkcs1pad_create into a generic helper
Date:   Thu,  8 Apr 2021 16:15:01 +0200
Message-ID: <20210408141516.11369-4-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:15:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbacf15a-b043-40a8-54a6-08d8fa98d37d
X-MS-TrafficTypeDiagnostic: AM0PR04MB6289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB62893210C205BB43CD12083BE0749@AM0PR04MB6289.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:98;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pyMxu3B8G1b+hK7CJk1UYJqsSmxR8FbA3eNI1Zb6GQBSTP+hYj+d1UYNTqbeRBv8FL6uDtdD6ZYZXz/znIJhFYyuQVXthCZ2ZkZqZT6tKgt9JG9tyKNl1B3xoI6j5AxuBzh8W5Fk/uwFf0UEW8ry+74aTdf4hIWjTkIYcRwXjlDY0yxVcp0J5vjD7JbZqRe2nJPxzw9Xu9Ajj9NOKci5A1FQ7RabC/GjJIBV5PNzzgnH+kLwS+XBqTW9ATMTSDUBezR9tLbv0c8twFPrKKN6SufgCra/wTtUp43aoOL5HG3D0NJJHQVk90xcafUFjuc7eLfCoabuXaCGUWjBD4MwxenxxRxYnJ/vCVV8v5S06Z6U7V9hRrlzj3QRlDUFyjPK+/mj3NRogCBOF+0v9oEjuCIPm/FofwD2byXIyowEDan4wP6nOCi4VR9BKqW8Pi9x5DBtYrZci4qOT5qJgN5CGZZnO0CEAcPdr9SPWPCGkkt3/Hc5SyzQ0ULzDB6ucxcKpy2Es+kScepqBotIsKoWBpffSuJQ0Ze4mFru0fZXfP+phfvd/X2YDEO9m1lw2Z+bJ5IEqfhqu0dmqyeKt3XG024MkerzeYR9FiGqD98Wr2qRAeSKonMpYlTDmIaoLLM5OUi9MWzBrrYD7oZ9oCqeSAcF8l0H1UrvY8qOim5NKnNr2yK5tSVjVQI4knP1Ew8QMWahvlMqcpGFtCxam2CfsQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(186003)(83380400001)(16526019)(478600001)(6486002)(38100700001)(36756003)(5660300002)(4326008)(6916009)(1076003)(66476007)(316002)(2906002)(66556008)(26005)(38350700001)(2616005)(6666004)(956004)(8676002)(44832011)(8936002)(6506007)(86362001)(52116002)(66946007)(6512007)(41533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?PzTDZcmo/TcQU02mvb8KNhH1a1mgZOAQUBg/LnI079uQD6FPU6GFspnmMXV+?=
 =?us-ascii?Q?NpgQaAoOUioJ0S2CyywhwIIPIr/4PFbo+4VoH9BcA+vx2LJYUxpkSJKY+4aa?=
 =?us-ascii?Q?748e1/mnYZWrPlD+ShA73w9LpmAcJ9hUJeZkHJzBeWi8sx/jUtgZ54Hpa9kJ?=
 =?us-ascii?Q?AxCxOlaLIBkzDUAIdvNZVtDMiUz6D4CrA4/1g643DvW87YMLzIyNEPBfwpw7?=
 =?us-ascii?Q?0VIdj/ZXSHwqgh4DZpE+BXgcMQyQeVnmbgeNTLycUiIQ0n2R6cL67PsUOEvp?=
 =?us-ascii?Q?eHJ8uKFk79vFZhhITeyS4L717aW17HNj/4+eg6oocSeEOzRWuSVUZ+e4m8B0?=
 =?us-ascii?Q?GM4dYHfZiUbA8MNq3iGbFhzQFtwwL6PwHXGwTrVE806hu46G1DR3ZO20gAio?=
 =?us-ascii?Q?q+LyYCcRkzZrohv/AnXMuu9jQg4sj4VqfHXArowQ24gsF48A9CXmMjUOkOpJ?=
 =?us-ascii?Q?tmUbODuEpRWxqgIHpUHcrIgjEurrMoz4OltOXZOp5EiuUfIRh8Znmpp09KQ/?=
 =?us-ascii?Q?PQaScprbXgY4XkHxdCwpu69IH42zLmcAiNpZfAROlaQEdVm85x+ouYiS+NFq?=
 =?us-ascii?Q?QHYz1MGAqUMCHkM3X+mwewR3s8BOT5Kdgonab0RRLNvlW/yG96YCQJe4ncPq?=
 =?us-ascii?Q?5oYCs3U2TERkCOtQLuulkLh4pn/XBuvU00WDG+fKe++YB1CcKMDeIQvkOOAF?=
 =?us-ascii?Q?g0xFeyHZfe2+S4IF3/X1yuWGBMWXmA7uJwaj19z8w6M17TehQP2i7J3y2M8W?=
 =?us-ascii?Q?/t2Z0YmBhEMwIE0qVk4ddEhrNSirJdD3C3D9RnnjiMDa8Z8P/KhgvoeXcDMz?=
 =?us-ascii?Q?5UQiVG3P4DAR7GGfZ9Ournb8eYPWCqKpJoBRCB1u9G/GUZpxjlYsHcIeg7e5?=
 =?us-ascii?Q?xFyXbkYpi9PGqJ370aU99mEsa7vbNvv5B5lTa/P4JHO4hkz+leh4i4MjGE5j?=
 =?us-ascii?Q?9kdmqZg7Ggnuq4awRazm9yrPlgwjTKqUyenwqYFdj3yk2+avCPZUfWOLxfO8?=
 =?us-ascii?Q?tPCQsUTjJx6JLCK7bG7qFOZhTXXqcW/SCL7G+mKyU3y+ZPS+B6LTqFXgy96j?=
 =?us-ascii?Q?bEpNROPxgRXOVTZiobDpfiewlD0AQogp4KFQfa2HyrLN535dfEFKY0xOTkGy?=
 =?us-ascii?Q?ih+WvhH4/A5u6HeijKNyLzpRpPCySxwHWbO4+oDSeJKwkkHKUdJcAXhz/K/x?=
 =?us-ascii?Q?vr9BRrGCXfnUtefB1yJs2G5cV1d4tIRpnOa/7HjJF5uY4SdtmZNif88nlTj0?=
 =?us-ascii?Q?JkwEqL/QiMWNbFCj98X/Txvz0UoxzUSBwXAq0Zi2kXklNve611xlvDN0k5QV?=
 =?us-ascii?Q?K5dEVl4axsnvaKu6Vwb/cCPu?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbacf15a-b043-40a8-54a6-08d8fa98d37d
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:15:56.4363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLApZPyi6+bgWbLZJnguyNd+4sD+uMmtxOzJaNCu5RFpLWXclw8RVCAVFWNCuqESLFKWh9RgGgSAWvuOC2FFWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6289
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

which can be reused by other signature padding schemes as
rsapad_akcipher_create. This will be moved out of rsa-pkcs1pad.c to
be used across rsa-*pad implementations.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/rsa-pkcs1pad.c | 48 ++++++++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 14 deletions(-)

diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
index 83ba7540a53ac..849573f6b44b3 100644
--- a/crypto/rsa-pkcs1pad.c
+++ b/crypto/rsa-pkcs1pad.c
@@ -595,7 +595,21 @@ static void rsapad_akcipher_free(struct akcipher_insta=
nce *inst)
 	kfree(inst);
 }
=20
-static int pkcs1pad_create(struct crypto_template *tmpl, struct rtattr **t=
b)
+static struct akcipher_alg pkcs1pad_alg =3D {
+	.init =3D rsapad_akcipher_init_tfm,
+	.exit =3D rsapad_akcipher_exit_tfm,
+
+	.encrypt =3D pkcs1pad_encrypt,
+	.decrypt =3D pkcs1pad_decrypt,
+	.sign =3D pkcs1pad_sign,
+	.verify =3D pkcs1pad_verify,
+	.set_pub_key =3D rsapad_set_pub_key,
+	.set_priv_key =3D rsapad_set_priv_key,
+	.max_size =3D rsapad_get_max_size
+};
+
+static int rsapad_akcipher_create(struct crypto_template *tmpl, struct rta=
ttr **tb,
+				  struct akcipher_alg *alg)
 {
 	u32 mask;
 	struct akcipher_instance *inst;
@@ -625,12 +639,12 @@ static int pkcs1pad_create(struct crypto_template *tm=
pl, struct rtattr **tb)
 	hash_name =3D crypto_attr_alg_name(tb[2]);
 	if (IS_ERR(hash_name)) {
 		if (snprintf(inst->alg.base.cra_name,
-			     CRYPTO_MAX_ALG_NAME, "pkcs1pad(%s)",
+			     CRYPTO_MAX_ALG_NAME, "%s(%s)", tmpl->name,
 			     rsa_alg->base.cra_name) >=3D CRYPTO_MAX_ALG_NAME)
 			goto err_free_inst;
=20
 		if (snprintf(inst->alg.base.cra_driver_name,
-			     CRYPTO_MAX_ALG_NAME, "pkcs1pad(%s)",
+			     CRYPTO_MAX_ALG_NAME, "%s(%s)", tmpl->name,
 			     rsa_alg->base.cra_driver_name) >=3D
 			     CRYPTO_MAX_ALG_NAME)
 			goto err_free_inst;
@@ -642,12 +656,13 @@ static int pkcs1pad_create(struct crypto_template *tm=
pl, struct rtattr **tb)
 		}
=20
 		if (snprintf(inst->alg.base.cra_name, CRYPTO_MAX_ALG_NAME,
-			     "pkcs1pad(%s,%s)", rsa_alg->base.cra_name,
+			     "%s(%s,%s)", tmpl->name, rsa_alg->base.cra_name,
 			     hash_name) >=3D CRYPTO_MAX_ALG_NAME)
 			goto err_free_inst;
=20
 		if (snprintf(inst->alg.base.cra_driver_name,
-			     CRYPTO_MAX_ALG_NAME, "pkcs1pad(%s,%s)",
+			     CRYPTO_MAX_ALG_NAME, "%s(%s,%s)",
+			     tmpl->name,
 			     rsa_alg->base.cra_driver_name,
 			     hash_name) >=3D CRYPTO_MAX_ALG_NAME)
 			goto err_free_inst;
@@ -656,16 +671,16 @@ static int pkcs1pad_create(struct crypto_template *tm=
pl, struct rtattr **tb)
 	inst->alg.base.cra_priority =3D rsa_alg->base.cra_priority;
 	inst->alg.base.cra_ctxsize =3D sizeof(struct pkcs1pad_ctx);
=20
-	inst->alg.init =3D rsapad_akcipher_init_tfm;
-	inst->alg.exit =3D rsapad_akcipher_exit_tfm;
+	inst->alg.init =3D alg->init;
+	inst->alg.exit =3D alg->exit;
=20
-	inst->alg.encrypt =3D pkcs1pad_encrypt;
-	inst->alg.decrypt =3D pkcs1pad_decrypt;
-	inst->alg.sign =3D pkcs1pad_sign;
-	inst->alg.verify =3D pkcs1pad_verify;
-	inst->alg.set_pub_key =3D rsapad_set_pub_key;
-	inst->alg.set_priv_key =3D rsapad_set_priv_key;
-	inst->alg.max_size =3D rsapad_get_max_size;
+	inst->alg.encrypt =3D alg->encrypt;
+	inst->alg.decrypt =3D alg->decrypt;
+	inst->alg.sign =3D alg->sign;
+	inst->alg.verify =3D alg->verify;
+	inst->alg.set_pub_key =3D alg->set_pub_key;
+	inst->alg.set_priv_key =3D alg->set_priv_key;
+	inst->alg.max_size =3D alg->max_size;
 	inst->alg.reqsize =3D sizeof(struct pkcs1pad_request) + rsa_alg->reqsize;
=20
 	inst->free =3D rsapad_akcipher_free;
@@ -678,6 +693,11 @@ static int pkcs1pad_create(struct crypto_template *tmp=
l, struct rtattr **tb)
 	return err;
 }
=20
+static int pkcs1pad_create(struct crypto_template *tmpl, struct rtattr **t=
b)
+{
+	return rsapad_akcipher_create(tmpl, tb, &pkcs1pad_alg);
+}
+
 struct crypto_template rsa_pkcs1pad_tmpl =3D {
 	.name =3D "pkcs1pad",
 	.create =3D pkcs1pad_create,
--=20
2.30.2

