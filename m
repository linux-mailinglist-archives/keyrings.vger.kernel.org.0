Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBBDA3586B7
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:16:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231863AbhDHOQa (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:16:30 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:54510 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231881AbhDHOQ1 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:16:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891375;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tpynPgwla+q00f14OSK+oz3Q7ZoNhgyTaJm8QHk1oaw=;
        b=X0c78XMfkBCpI6JRmUyhXNFix398/i/sZ1w2L83JmJ1PadTAXlQYpJPnXo8TYeGKLx4M8F
        lqRWuBRkKZmavqcy8+HGG2AYyZwDSmfr08Ixwv/ow06ga8lAh+T9hEi0xynE4JclNNHW3P
        RaV/BDBxK1so615Wk0bAB5+YT5rvLh8=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-H_WA3VGsM7GwVLdPlfz1jw-2; Thu, 08 Apr 2021 16:16:02 +0200
X-MC-Unique: H_WA3VGsM7GwVLdPlfz1jw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdg/ShS77A4WdQ/PxNl8FBertjFmPxvhgHX+XIa7QxHtt2WfxB8P43JI+nJqwLXmdlglVhB6woUwbF8DZ54bb+q59r4Qhh/amYFH/bHWr8yOlEXqA48XACAKqnuObXnCbCD1kJ/bjwo8m34KYsvBa3/844lyT5Ul1Zz2M7mQOZQi5U47RVwuwv0t4uS6bZ2GDsiiGv1MxqoDndkMKGAmuBV7rgb/jB/PQArQ3kh1FQQIadGupv0kAHwRm4duwnIPH0+SN3jYE1n9jiRuB1ZW1jeNSJrKARPTrwPSxE1UCYlu3po/R7bA7JcvszvpzYvRoK8dUnPtzrXs6wdQC89V7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1C11B5dbJ0SABsUcHKP1mpYYYbdqU+LKBIFDmuzuv4=;
 b=I5eMBTjJp/rC3McuI8umOQxr3yAIN465PtrFjA/H1LiAHtB0S1z6uTsXQws/tGw6MZsV/0BxVCsEKKgwawEddGR56Yy6O2rV19zLi7c4GZ39v3gSYe3mXtF4CYfKhSB0FD4io3rszDV7hBK8roavVc2VTvqvhwZsNiSiGj0A9bu7aKWMeSSpA2K5bt55bmZN3uTS0Vqa+7zxk3kxitS2ngoDuKUtwrQcWgjUkjn0SnI6F5bi2M27hHK1+IBLD4+2Qfdxjb9H1IzF1wFGxI/6KfXZi6tyW43AQ/3RCLAGBUnZKxJiVg8b8wxZD5dsJxquY4F++vAM1r5cm1tsJs561w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 14:15:55 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:15:55 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 02/18] crypto: rsa-pkcs1pad: Rename pkcs1pad-specific functions to rsapad
Date:   Thu,  8 Apr 2021 16:15:00 +0200
Message-ID: <20210408141516.11369-3-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:15:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 366fe2d4-9586-4735-4b57-08d8fa98d2ca
X-MS-TrafficTypeDiagnostic: AM0PR04MB6289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB6289C5407B83417FF2C05637E0749@AM0PR04MB6289.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cpp7Mcj6p7au7jOtxs53k66mZunn3hzxneHlYcX29oKd6J3GA/z/979444sjgOnMpIhpUd/DsLBQKK7HP8ksXtP4zjO8x+K8JsAfxunCcrnWVlgYom833Ru9PfVkRBixn+KbJZKPGTeNZU1wRWdMRaywTizOpzeunpBQ6EuApzukOkWSm3nhU8sI4iED5rGDjjvUa1gkGWwhHFz1sCC3g/LnFBtzFzHn5CK3eb0/hcXidlhuxuUYuemesX1NjK6ONRo3JS+QBtox69+2QN15r5hJ2lL6ILeWa902lTOlv128Hd2eCpjOdCEaQY/AJaz75c2xa6s5m46iDbxpwU571vRxtGA54KcffyNbYnBoIkbrALkXu6hLrQa4fyEyFCfIuNSfx+l2N/xUSGOOfhZmO3sUwfOlc1sSWT+pY+WOYpReSyfiM4s+ATJY5tjChKK1vjfn0RnWakFI4NN5EJ6PyVrQ/Pl04R2o4Oc5Rp1EJXqD8/hVNRv024k+lznscaaEVy+LcGEuIrEKunKaKmQT/mI3v0xngyen5ibiK3SdQamtyhG2yTccnVlC95A9XTW8ZrsvhFquzFquSksUizwwI2oq3xVFs2UV1XL/hCmZaVhMKqf0Ay0s3wYGKIYjp+qmZ/4E+1mlIMD2vPlXVXoGiFfdSG2Rwh5heoMYAl9tUhYGqkPQ8nl53LdLAh7RHEhuME011df5VQ11Ewgx1P6/+P++leqGDHWE1yUX7kblalk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(186003)(83380400001)(16526019)(478600001)(6486002)(38100700001)(36756003)(5660300002)(4326008)(6916009)(1076003)(66476007)(316002)(2906002)(66556008)(26005)(38350700001)(2616005)(6666004)(956004)(8676002)(44832011)(8936002)(6506007)(86362001)(52116002)(66946007)(6512007)(32563001)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8qS8y6bMi85074ChFjIjm81KDSlkjY5alAxIrOz5F4rWDzv4NjvAnwhri/fS?=
 =?us-ascii?Q?OdNt17/tSTuONlsQL5UXVSi/wWSYbJqrV979cZaIEUMAHqg7sOk4wBBQzg4n?=
 =?us-ascii?Q?ouQ10xAr7paQqOn/VCPAH9PODjdPAklgG/0PFjUskzXZhq5CGpsrs2eBBU7b?=
 =?us-ascii?Q?og1aVb+bWZxHZnrpYIvZ6R2jY9TD6S0o3UJlAF0LlO2zrsaJ/eS3JIz5A/1h?=
 =?us-ascii?Q?ouwX50KcvsLtqSBflDzfa6QPCmcqf5atpv0cW1gT5P43TWTlcSeRGGCQwACy?=
 =?us-ascii?Q?AiYyPv4z+kQMpuxlP67w2S8oLcspkThWekrcMPugwpKWvjzPRwyDEQMFoYL8?=
 =?us-ascii?Q?R9VSplPGSLrA/7MyJhpYfFHDak8LfYqKiYZbIDtqqsXZ9T4StWAw1YBALzJ8?=
 =?us-ascii?Q?hcSiG/ADFIaOdxsTqrAhhZMee+SwIqzrX9CtXBACswtkZE9XacWOKmmSfoDW?=
 =?us-ascii?Q?GFo4L0Jym2Ed1ifFYPskYGyBsaPjNWW8/cB1neuP6i4Wcm87JuXvYmM0vgpa?=
 =?us-ascii?Q?XOurh3ctmafvHgFMEeH43lRX6kSsYXdhF8t+gg49QW+XKUyL20zvCpdiJ0Is?=
 =?us-ascii?Q?vjROrWR30BuRa5IoyNvKyUktiuoBFXoeMFB8LiLesYkXFfC9XIcCZ66PrkR2?=
 =?us-ascii?Q?Ma1cV7UpzYuUdLVpEr8AO4V9m34bTkNBrouM5rE4Q/kp/z9Eyk40/WrwD0gG?=
 =?us-ascii?Q?b+i2xDEgkhOpGVBDz7pOWRkHd7aPfCIupKmVjUgmoaItATxrf5JHRR1aNP0k?=
 =?us-ascii?Q?5G3v+SVbcub/sSBLtFMGPNCYFJB333E24aB1/yZ9NES9f1SENj3JN+kuFTyf?=
 =?us-ascii?Q?K7pLyU/rn5XHVkoIo6nFqJmI78syMyg16+6tITBmcrQHavkoK35gdpvahKUU?=
 =?us-ascii?Q?hdW5L7HNFQA8vdip31fs1Z/0nvYpeP3drFKOjXVXtyWCQ2pjdTNdQR0uQuCf?=
 =?us-ascii?Q?1pYpuZJ9VWAKReh4LEI4h/+tdZVS+HnbwopIm+llHu+9YwkvApJ7lErQz7KO?=
 =?us-ascii?Q?Z5T8BuYXQDGXgcpPU9RurWF2/vYFnrNawT+Z3qIsUFcV2QnGfkkaoqD6c4YY?=
 =?us-ascii?Q?EmxBbiuhStOSMQYnrs5MVQVFbCg9IWJ2ODEQAjCVgJYg5rkTObKqi/1FTzKL?=
 =?us-ascii?Q?hScsNoHcmQ12KmV96AU+rjh7jcLd9IjZzrZzT2IBA1xF0lA1i8RV7cgMwjgr?=
 =?us-ascii?Q?VqBdLQDVwI2rTzQmWsshRNl3uBeynYTMxsCCxIjzsUDRN5Hjt4S0wJaRfOgy?=
 =?us-ascii?Q?JdzZLQiED4X0GTvt9YP99yNqjS54tC/rC77j6Y5CjsW9CVbzAh/2u5pLOiIV?=
 =?us-ascii?Q?Q2rVk+AFGi1vi0uGZcyPMtgB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366fe2d4-9586-4735-4b57-08d8fa98d2ca
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:15:55.3689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJ/rpfCyH2/GpHsWAKY4kVAmW4Xht/6DPRye/FBKaKRi54GOQBBzTSH+sfXr+tGvrvOjW0zJiVhGAZDxJMcB3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6289
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

