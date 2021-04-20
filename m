Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBCFF3657DE
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232072AbhDTLqz (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:46:55 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:54256 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231993AbhDTLqy (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cmUAdFJ0uQw14A1uRJhYFxeqhrEmpnRdb5fucZevEH8=;
        b=SSltrLkE460CiVSLUZi3Io4OGkYh4OINmbvaEAMp2bvDlfP3W36J8ErXICMQUij1jGQqOP
        qPjhxQD49+OrrkZsjdUWm8l27f+6OkoFXJjlzOd8T23BU++Yn9xf+qu7VqK4txjcHiPejt
        PFtPska9DWCh48eK/Lfs+jNqCYDNp84=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-2MRsBgdyOdqdnNQ_DWCOoA-2; Tue, 20 Apr 2021 13:46:20 +0200
X-MC-Unique: 2MRsBgdyOdqdnNQ_DWCOoA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJH93DmWWgSnM2z64k+I49JPA0I7btmmI1uTqkx/puQC9I58qs401YRDn3l4lO8ycRVMoBZLMB9hkgT9NOmmWkkUeipOfWrGOd9hO6t6ACbeeYccRqcng8FSqitNG3bL3AoNZJkX+fd0hhQuLkA83QmAwV7foLcY5TkqpyylBEcWZYFM+H/beUJOW7nNH/vlHavUFj83pJd/KHwkK27xZqhY9K3zSCWbUSWKhUyVRmAx9XVr2bU0Z8K/eJzg4N5zHsAgnyuwrWsfT5mS8ziPO3gF8z4JWhY5YfVd8x72NE6Dkl++UT3cqNlRbQH3G8WAV26QZ04eYnR44pLpqxkyIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93i75lPbvB/8koH1C6/WbV75u4YZP4Ne/6Qzxao+vC8=;
 b=JOGOBXjc0nS1N0MCT0OtEN/qgSrjSmWmvp47DDtVgKm9rgPbfK8CUuA9O0jzOW08MoibFCkD7XykFrUdXRSok0Sy00rq77+K6hzNE0Q+AtRYgvhNMr6ExVf7AuSadtFhSkD0EZeqghRnQnhFx58qvb2+Cq+tLwzBb781oAIB0fDmfSfI94y0R9g5eVud2Pp/R9MlfRCiqVO9viGh4qHQ7j5R/Kdn5p+7vTv3txbP8i7S2hzFcV8khCb2Ub4p6dRJ0RLrL02xEAn0RK9+79IPiLd7/3WYHypQK0STVy48s8LemAoWt5aINX+yGJQtlgP4uPRw3fJsQxFG4Cihgj3zvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB5154.eurprd04.prod.outlook.com (2603:10a6:208:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:18 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:18 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 03/18] crypto: rsa-pkcs1pad: Extract pkcs1pad_create into a generic helper
Date:   Tue, 20 Apr 2021 13:41:08 +0200
Message-ID: <20210420114124.9684-4-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1a61b98-03d1-46ec-f460-08d903f1e8e6
X-MS-TrafficTypeDiagnostic: AM0PR04MB5154:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB515481A368CFDC7443679046E0489@AM0PR04MB5154.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:98;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o7+uY/ciYssTYjrBXr8rpY8eb06yNc5qD7WmVjANJW3+4Yw0XLxf93+Vcz3FlyOCNVybwzDr7S8/YIre5dCHPg0P04jWNiJ9FvZXRFbv73fY2DocmrjgcBV9P3Bb7oPWmUTAFjqBS+yQtSpbI0Ao/okgnXj/LxBiYM41aO3Si7w6B/i5YvK6dWL6fRL2U1K8oOWEyKbL4mktatsxMlPJaG5jTorrKsn0xvwMMii47mV1bu6VydRaCKfqi5mkH2VZ28EgMBU7c35BLY1Naz/indwgi6GxWtyf3/SMn0QNUZw0GKrGloCWkozYorSKJM7qqQ/qv8uPBf4Z56q5A2SfQiTUZFO57WxSLjhS/u/xurEUrEjQtXshvvQCLJUWSXtWkePQoEPEdXTITvvCFUlmtX/MNq1Cvdkls31rnYSjogN23N3NFC2rgeQibisQCp57i6SEVDoVCf2wSw3xuCKNBstFpUTYOAvZhTilcRfYyyFgtOCRZlhk7NHWs6B0HgAAsBoNt7KxMclTeiTOnj9xZQAdefq9hDw33kcWhAYf2Y6QFcmPbBdZkruGz0cSwBEUr/VEtESLDB9rzoL07riA3xJyN6SmCT77Q97XxqSI7LdFrRwzN4uiMwliH8xjAs4dK9Xps0Qb9K+8e46GBeczFWK0v+Up3uQ3M18y8cAiOVfuPHW2yp3MU6yekkb0tGsO
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(396003)(39850400004)(26005)(16526019)(86362001)(186003)(956004)(66476007)(8936002)(5660300002)(66946007)(6506007)(44832011)(4326008)(6512007)(6486002)(8676002)(2616005)(316002)(6666004)(66556008)(36756003)(38350700002)(52116002)(478600001)(38100700002)(83380400001)(6916009)(1076003)(2906002)(41533002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?KPacT7tzKBfcD3SDmvexXqj/t1pk2epPkwQHl2cYUjyf6jRBCaKrBMN1NnSb?=
 =?us-ascii?Q?i2hAnZ/cTN3twXCbOWn4ntaA/9UDDodgG6r/JG1JYm6PpqOniLWIP9Hss/3v?=
 =?us-ascii?Q?EZnBIyT8WxDJXtTcQaGUdFV0n1viRIIcw4HNqdK4yMX5+jNZlfxYv/YtWXi+?=
 =?us-ascii?Q?wyjdBsRQLD+xsxmVr2nOw3d7QwyILNzLNQjT/epNbHUK8aN9oT6CtO6zrEtI?=
 =?us-ascii?Q?KDCbY0px5LEwpOEd75lWaWfd9DQdVpVwDQDOo+8Lv9zNGwDSEfTATvOq8/Ua?=
 =?us-ascii?Q?k3I7lkpL9TZUlcAQI8sTzdQ/YBDHaadKdG9Agr+jNXheWsi+3oWRSruKJdsS?=
 =?us-ascii?Q?tCZdG+botcnZjdKi/5pu4bUBXNpicsi7Uz7CtTDkHBnSNcgBt2ifoOsa6acB?=
 =?us-ascii?Q?TtIDl5JjbgKI1gSEph/kTGbji8vUm4gjnwpEbqitEStfc3cYIsgq0qxzXIXv?=
 =?us-ascii?Q?3iCDCMplIS7BB41WRcE2Pe48nIP+XShoTyMlxlCxb25Bv9gVwbWNrYie0zsA?=
 =?us-ascii?Q?obdb8LMDDnTreGOTF6YALYSP+KmTqygB0ulOk2Qz6AHOC56oyPGEhOR1aCA6?=
 =?us-ascii?Q?Xl1YHlt6n9Q/BrYfqpad9rqGTWzVxHm/XFtnopRSlt6H0aShZQw0/DAM/3dX?=
 =?us-ascii?Q?dxZ700qBGbqAfz9o42cOFcfYfy8O0XsFxThxgDKRbD4fh4LvFN56ZmQR097J?=
 =?us-ascii?Q?PbKtvtPJGAK5VRjx09X8vq8dl8f+LJCXj1bZZSfd5ZIrvy+x7OA9Q8mCcZix?=
 =?us-ascii?Q?ocy+R+m+6wYn45QSX8VfWzEAlH2PxIie4523oPFbcRHJGZ1oGU9CJi6iqiGQ?=
 =?us-ascii?Q?16KWTn1IDFacwY3+PRFjgTAKfb8umyZCFRAfLM8/Ly7nIFzYDtgUB/i1CBWf?=
 =?us-ascii?Q?gQ0h66srqjtvhdM5Gox096WCzPY400AO06CVrHSKoap8D6S/1FrSsnjGJ1jE?=
 =?us-ascii?Q?P3WEhUKOY7K0sHAzbjOPSCAT+pCB9Iz3SPhurycQngranvrh2PTaYzEwZ7Vk?=
 =?us-ascii?Q?gT0vUtlKvgFmOxjqONrV+fIfsciapczN2rjdpxUjh3qnRMXSYVcT1xpqbMbC?=
 =?us-ascii?Q?7bJz81orRxZDvomTXfBiQdaJmWEPiNQseJJdeKVNa9Z+hyQ0cF/YrAeIjISF?=
 =?us-ascii?Q?6UiYOx9/jLNOMc18yejAtAQHWmzBVs5Znq5Q/zfADD1GAJPDfvifHIqueQ2q?=
 =?us-ascii?Q?pHxKWhY2aFv46AHFvC3OB9y+KSMw5+UP0TnKpXxC+WNajTrWXgwwFsBzwGFV?=
 =?us-ascii?Q?37q4XRbC2Fb65T7I3qHNReV5+IokHP6KCw2b7iCUNi2RlkUbMQvml5a0z7xY?=
 =?us-ascii?Q?sVyQ0FOLxAESS+7Op9iYzjCg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a61b98-03d1-46ec-f460-08d903f1e8e6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:18.0076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: onROkuajrtA5SgzYGr/P8wiuEHESazOAlCUfacm35GeZUX1Xv0egPenQGrTjALkD04drghXomm2tLqn3dT4FFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5154
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

