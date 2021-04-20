Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFED3657DA
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232019AbhDTLqx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:46:53 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:39049 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231986AbhDTLqw (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919180;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tpynPgwla+q00f14OSK+oz3Q7ZoNhgyTaJm8QHk1oaw=;
        b=ghrBEzpdgRBPixm/l8qVRufH3MmQ6X5ZVKsIHH1zWVls4BwdPWYhMr/20omqu4w0mrCKvw
        D21zRV6JHmjcfbfVQSQzIhD7JeKo6eRYZWsEhRbv7S0c7yb7JayEWZU/WL+Z1rf+polPeZ
        cxnR5lM+pvvEZ29GvTZfeTj//i5Vm9c=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-bDpJklJGMJm948XlI3-iPQ-1; Tue, 20 Apr 2021 13:46:19 +0200
X-MC-Unique: bDpJklJGMJm948XlI3-iPQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhbIIB0b/T3jEN+/TavHosuTlICV921fvLCJG+QtcIRXKo0FZlRwRCGT2ZQrOfW4sjaPA0nDgbhgPZXP/IyK/pq7lxSaqT3eAzEc60Oj+J3scYC0AA81AA0i6I463SQ8SzI2P08Dkh9W8aETSmXPv+LpNiXNZ9853DNysZlHMlNhwY4Aepd9DddrmrVcOst1k+Q3u6IMiogRI4AOUJn8+fzxn2GThFLDGpGiPlhrKYAm5NT33l8TayZ0+Pq4IvUnFWM1SJmHGl4ZQ6YCr2MxfozigjBbf4YwQU1ve8u0aXN8gpkwS9w346udAMcB4HEfB/dQRNlYiosnH7aNi1IMaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1C11B5dbJ0SABsUcHKP1mpYYYbdqU+LKBIFDmuzuv4=;
 b=ZHvp1xHpZMSfj+yjLHG99qVBlUWRSzFvznilV8ZC+REpcP5unOpIJKTmW6a1ZbYD5ddmWmMfnnnvpDQCup6I9i+W5BY3zImrwKjGLwcuH/1XIJjb7RCVMv/WqaIq7qU+NJihC16SQurf5IVTUmqX3B5mpGctsz3LsKxcCI2YnrSMIz9L4ABz6FRhLdLhbf/LnhbDiMjy/HQDIt+ON1VWtk6oKtf/PV8NoGLM7o1YQtZ85bDCue0whmG5AUdVDYRKibAk88X/gBT/iU6jFWY1twivCEiiFPIwwT2PmQZXG/0XLgZlZh7ZRCivjEVOXgw77QbffIfqk8j97chjaXSZHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB5154.eurprd04.prod.outlook.com (2603:10a6:208:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:17 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:16 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 02/18] crypto: rsa-pkcs1pad: Rename pkcs1pad-specific functions to rsapad
Date:   Tue, 20 Apr 2021 13:41:07 +0200
Message-ID: <20210420114124.9684-3-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14a0252f-2d76-4eaf-13f8-08d903f1e819
X-MS-TrafficTypeDiagnostic: AM0PR04MB5154:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5154B482AA6D70C90394D403E0489@AM0PR04MB5154.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BtpqaMuqK18rLBAeOVjoRpERggEbxmF5XCAQfDHtUNeAO5S3IDAfMGSrkhPKQngMbcWuEXyRDNsST7LAugZl7JT9ytWTTrNcisEpw7xLC/cUDcg60zl8Sbxosv6Ub6Y8rq+ZAOlwqFHKDhi3u39zPBlHRa0aRG+BUXp3RJmgxJ1A8R3+1Xcqutz5GEZRBwsIzO0zjvHlZ3uwutXpiiEPzWTR3t+B7KdaFO4YyJijgmwmfPAduBDfVsHSKqPviE9GrIDOTGdlxI5wj72kY1dKM4T/m7mkieilM8g6Y0OoyM/GAFkYUPtNWTzqbkDuif5KVGiVcpnxwngApfehKFrFqAUsa0PRng/2kZAzQux9cxq/2tVwibg3puGKJAGiGyGHt555VcqAawrL0F54wOnQtOHa0MV1dxjca1HnYSbII0lB+Jx6lkguPeM06sx8yD0QXlfRTq8wSVkNddNBuf0dsglYMkAtWUBmMGkpgKOtzcOXcinHLHo7gUQpTUCmrH3aDn6JRsWrVzMUhf5r+DPD1xkCa60EzxpMi9ESLaCe/tzKcVy6napvJlI0zrvVUWhwBHMabpmA+QyvtZkg3YSbsoBIfExLBS6Khdhb+ETvPs+ut2tV+GyGDX19KOxtPAE/0k2S7s4a0zllhwyX/bIK3UIIsCZ0x34S60g1O8/DUo+bZdA+0Zdl94+5/xJv3B2Ogb+cfXWQ1p5YnIZVw425AQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(396003)(39850400004)(26005)(16526019)(86362001)(186003)(956004)(66476007)(8936002)(5660300002)(66946007)(6506007)(44832011)(4326008)(6512007)(6486002)(8676002)(2616005)(316002)(6666004)(66556008)(36756003)(38350700002)(52116002)(478600001)(38100700002)(83380400001)(6916009)(1076003)(2906002)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WSv6QnnAHvcS6oOKXMixg19kkSLvXNYZR/YeEgfIyEUDpQ0DSmOmuXLko3+m?=
 =?us-ascii?Q?Oha3RntOHbqiOoysHo4w5Kk3M9rKg6Y4v/iYFr7PjZ04f8ryrqmIkm+1xoLh?=
 =?us-ascii?Q?ScR2M8TPzFhDsxejxO4LL0kMiKIqnKmEyN95C3CwjzEZ2JppyuyasXugaCPs?=
 =?us-ascii?Q?+o3RGS2MX7tAfnJ6etWhi3VNdWyAJ+xAK3AX0SAC0QpZ0+GIRkBm5KkSgvHJ?=
 =?us-ascii?Q?oy6xnAEX3Td9bEI8ePzFHgqGYvPE91jHfhT3CIYVCxYT/iNazyPsXCFlecAp?=
 =?us-ascii?Q?wnNAXlE2ZTfNlQ+buiMlkcZ4kqXqmAFmgFgcbUeH/mvtD9EQVGh+f534M4sH?=
 =?us-ascii?Q?4UnSZzurfC7JgSmMUx0PGnCPO8fkKeR6zmblhNPzusypzZHN60qCrPh7XE+Z?=
 =?us-ascii?Q?pjF1qaTqfQ4wnA75z93K/27MM2a21qNEiqPOyMDiobTSG2OtYcxsyobRc8Rt?=
 =?us-ascii?Q?34aMlsAU0sXI0svTD7hXQin5iw3JPvCTp3PSiDPkE3kW2UCfIpN6qQtLte7L?=
 =?us-ascii?Q?oPaYaZV12rdVr1hIN8uA2BX+xqLdz6v6E1uJ4zoYI72HbvjP7fokX6Y1GKre?=
 =?us-ascii?Q?6gm/jLEszP4dT36bMTrDI2CLsiBnMl51HnzxoBjcydHvpj74R6H79URqfrvd?=
 =?us-ascii?Q?LJjboKWQUaZM63df747qhRCMgcfYCmJnEWQGDPsx7Yh3ues4CvfarlsPWuVr?=
 =?us-ascii?Q?MBFn3VsZBtw7t3k9U0ciYv1J687uw3Pmot4eLQCq6YTKr111JBGsha8c2VGM?=
 =?us-ascii?Q?BgshJeNNIbII4/JcjnYqP6DbQ0zk2jAv8MNTBoTJXYJficVtvbYHkA3BR4g5?=
 =?us-ascii?Q?ttVmq95ABWRqsr3oNBCCo4O0d1nvLaG8161eb3h/Ng0w+Fss6hn48Lsdk4Aw?=
 =?us-ascii?Q?tPBvDFcxIWn0o1/pDRECMenMOs+qold6rwHtim8FJIMoNiGjEgaOlhxHEYXm?=
 =?us-ascii?Q?YBwFtHQyvkdmNDVwWXG/u4oUGu0MHzIAniWaYPtg21wmHz7I6/ijYyN/vxVS?=
 =?us-ascii?Q?PQApmbOiQWDLIbO36aB+Klkb4hIBujitmMXw7SyvttireR9MqkCYnx9aEKu8?=
 =?us-ascii?Q?dCsT2WonoeHNF5W6s7599gL9hkZwmk3rIl90Ucj85fUC+dWjMFqYTqAEjG/a?=
 =?us-ascii?Q?znhMNCNsTzhOqXW4nwH+w0Ks3XrD40lmtMN59rJ/RPOUEJ4Zi5uEbYfox5fB?=
 =?us-ascii?Q?KPflicIMGwELBiL+vEc1S72WWWQ+AnPPiIT4S6H6uZ3DHMa5ZZhgPpulEKAE?=
 =?us-ascii?Q?4SWfr28aTOnQGf24JXKkEQdxL/94lnXOCqFUPScAJ3/kFLF5Z9F+eDqKAdaz?=
 =?us-ascii?Q?zMui7oIi1/NGTRTLVLs6BXKg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14a0252f-2d76-4eaf-13f8-08d903f1e819
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:16.6864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bT8neN/NKR8Q8WJVuFvlsmWtSMkqSnH7JOitgAQ1L9H672vQszPBL0ODRf5MLNFQxHRT7YRGzkzAYOwm9BAxQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5154
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The existing RSA implementation supports PKCSv1.5 style signature
paddings via rsa-pkcs1pad. A lot of the functionality implemented
for rsa-pkcs1pad can be reused across other RSA padding schemes.
Rename such functions as rsapad_* before moving them out of
rsa-pkcs1pad.c.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/rsa-pkcs1pad.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
index 8ac3e73e8ea65..83ba7540a53ac 100644
--- a/crypto/rsa-pkcs1pad.c
+++ b/crypto/rsa-pkcs1pad.c
@@ -104,7 +104,7 @@ struct pkcs1pad_request {
 	struct akcipher_request child_req;
 };
=20
-static int pkcs1pad_set_pub_key(struct crypto_akcipher *tfm, const void *k=
ey,
+static int rsapad_set_pub_key(struct crypto_akcipher *tfm, const void *key=
,
 		unsigned int keylen)
 {
 	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
@@ -125,7 +125,7 @@ static int pkcs1pad_set_pub_key(struct crypto_akcipher =
*tfm, const void *key,
 	return 0;
 }
=20
-static int pkcs1pad_set_priv_key(struct crypto_akcipher *tfm, const void *=
key,
+static int rsapad_set_priv_key(struct crypto_akcipher *tfm, const void *ke=
y,
 		unsigned int keylen)
 {
 	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
@@ -146,7 +146,7 @@ static int pkcs1pad_set_priv_key(struct crypto_akcipher=
 *tfm, const void *key,
 	return 0;
 }
=20
-static unsigned int pkcs1pad_get_max_size(struct crypto_akcipher *tfm)
+static unsigned int rsapad_get_max_size(struct crypto_akcipher *tfm)
 {
 	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
=20
@@ -159,8 +159,8 @@ static unsigned int pkcs1pad_get_max_size(struct crypto=
_akcipher *tfm)
 	return ctx->key_size;
 }
=20
-static void pkcs1pad_sg_set_buf(struct scatterlist *sg, void *buf, size_t =
len,
-		struct scatterlist *next)
+static void rsapad_akcipher_sg_set_buf(struct scatterlist *sg, void *buf,
+				       size_t len, struct scatterlist *next)
 {
 	int nsegs =3D next ? 2 : 1;
=20
@@ -256,7 +256,7 @@ static int pkcs1pad_encrypt(struct akcipher_request *re=
q)
 		req_ctx->in_buf[i] =3D 1 + prandom_u32_max(255);
 	req_ctx->in_buf[ps_end] =3D 0x00;
=20
-	pkcs1pad_sg_set_buf(req_ctx->in_sg, req_ctx->in_buf,
+	rsapad_akcipher_sg_set_buf(req_ctx->in_sg, req_ctx->in_buf,
 			ctx->key_size - 1 - req->src_len, req->src);
=20
 	akcipher_request_set_tfm(&req_ctx->child_req, ctx->child);
@@ -357,7 +357,7 @@ static int pkcs1pad_decrypt(struct akcipher_request *re=
q)
 	if (!req_ctx->out_buf)
 		return -ENOMEM;
=20
-	pkcs1pad_sg_set_buf(req_ctx->out_sg, req_ctx->out_buf,
+	rsapad_akcipher_sg_set_buf(req_ctx->out_sg, req_ctx->out_buf,
 			    ctx->key_size, NULL);
=20
 	akcipher_request_set_tfm(&req_ctx->child_req, ctx->child);
@@ -415,7 +415,7 @@ static int pkcs1pad_sign(struct akcipher_request *req)
 		memcpy(req_ctx->in_buf + ps_end + 1, digest_info->data,
 		       digest_info->size);
=20
-	pkcs1pad_sg_set_buf(req_ctx->in_sg, req_ctx->in_buf,
+	rsapad_akcipher_sg_set_buf(req_ctx->in_sg, req_ctx->in_buf,
 			ctx->key_size - 1 - req->src_len, req->src);
=20
 	akcipher_request_set_tfm(&req_ctx->child_req, ctx->child);
@@ -545,7 +545,7 @@ static int pkcs1pad_verify(struct akcipher_request *req=
)
 	if (!req_ctx->out_buf)
 		return -ENOMEM;
=20
-	pkcs1pad_sg_set_buf(req_ctx->out_sg, req_ctx->out_buf,
+	rsapad_akcipher_sg_set_buf(req_ctx->out_sg, req_ctx->out_buf,
 			    ctx->key_size, NULL);
=20
 	akcipher_request_set_tfm(&req_ctx->child_req, ctx->child);
@@ -564,7 +564,7 @@ static int pkcs1pad_verify(struct akcipher_request *req=
)
 	return err;
 }
=20
-static int pkcs1pad_init_tfm(struct crypto_akcipher *tfm)
+static int rsapad_akcipher_init_tfm(struct crypto_akcipher *tfm)
 {
 	struct akcipher_instance *inst =3D akcipher_alg_instance(tfm);
 	struct pkcs1pad_inst_ctx *ictx =3D akcipher_instance_ctx(inst);
@@ -579,14 +579,14 @@ static int pkcs1pad_init_tfm(struct crypto_akcipher *=
tfm)
 	return 0;
 }
=20
-static void pkcs1pad_exit_tfm(struct crypto_akcipher *tfm)
+static void rsapad_akcipher_exit_tfm(struct crypto_akcipher *tfm)
 {
 	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
=20
 	crypto_free_akcipher(ctx->child);
 }
=20
-static void pkcs1pad_free(struct akcipher_instance *inst)
+static void rsapad_akcipher_free(struct akcipher_instance *inst)
 {
 	struct pkcs1pad_inst_ctx *ctx =3D akcipher_instance_ctx(inst);
 	struct crypto_akcipher_spawn *spawn =3D &ctx->spawn;
@@ -656,24 +656,24 @@ static int pkcs1pad_create(struct crypto_template *tm=
pl, struct rtattr **tb)
 	inst->alg.base.cra_priority =3D rsa_alg->base.cra_priority;
 	inst->alg.base.cra_ctxsize =3D sizeof(struct pkcs1pad_ctx);
=20
-	inst->alg.init =3D pkcs1pad_init_tfm;
-	inst->alg.exit =3D pkcs1pad_exit_tfm;
+	inst->alg.init =3D rsapad_akcipher_init_tfm;
+	inst->alg.exit =3D rsapad_akcipher_exit_tfm;
=20
 	inst->alg.encrypt =3D pkcs1pad_encrypt;
 	inst->alg.decrypt =3D pkcs1pad_decrypt;
 	inst->alg.sign =3D pkcs1pad_sign;
 	inst->alg.verify =3D pkcs1pad_verify;
-	inst->alg.set_pub_key =3D pkcs1pad_set_pub_key;
-	inst->alg.set_priv_key =3D pkcs1pad_set_priv_key;
-	inst->alg.max_size =3D pkcs1pad_get_max_size;
+	inst->alg.set_pub_key =3D rsapad_set_pub_key;
+	inst->alg.set_priv_key =3D rsapad_set_priv_key;
+	inst->alg.max_size =3D rsapad_get_max_size;
 	inst->alg.reqsize =3D sizeof(struct pkcs1pad_request) + rsa_alg->reqsize;
=20
-	inst->free =3D pkcs1pad_free;
+	inst->free =3D rsapad_akcipher_free;
=20
 	err =3D akcipher_register_instance(tmpl, inst);
 	if (err) {
 err_free_inst:
-		pkcs1pad_free(inst);
+		rsapad_akcipher_free(inst);
 	}
 	return err;
 }
--=20
2.30.2

