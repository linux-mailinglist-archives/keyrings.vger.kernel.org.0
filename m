Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6020C3657E0
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbhDTLq5 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:46:57 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:44695 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231795AbhDTLqz (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919183;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KH0v0aoXcA7hrq0AgsRogda6T+ioH6k9wwvrgrJNqBw=;
        b=hgsQa0D2daWQaMCGL1MMoWrOotMJRgSL4cQZcXrZ/jtuEFxNRPcbOlF+6LKAj/wmP4N9GV
        hXH9dzaHmN2U6+5QrIr2zjAKvouJ5Z/FO2Pk8vDUNQe7E5GFJ7ebj0JqpG1oNpZtn3OsjH
        Td9vpXwSzUQyOiRILVfV1CJECPY82z8=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22-4BTrZ2diOoy70Ki9KiW1kg-3; Tue, 20 Apr 2021 13:46:22 +0200
X-MC-Unique: 4BTrZ2diOoy70Ki9KiW1kg-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVMQyzkPfOoMpAeuyBg5U4igLO+6p9YOISzZMPz0tNpu/HGaipY2OyAVGkK88jJcKJNgcQCJ7/Mz+/Xk5OywwMHalIOFKYJynIF0I27ypvXbIcqgRkgWgokijZfMgcs4DKKXt4exqsWUkTmacx9a6YhoQ6hdnKeNuX1ASYfvw8P3QK2Nm5quslSgb8TGQ+2zbLe8fwP7t+9aXgi4oAHjTS6mMAawOli5TlsGTYE7b/JMxxVm6gqcYr67zIMXsVw4erG1h2nYBUnHpard65AoALo3oO85zp1b+Ok4K718Br1Oa6KVr6QR8MmnOw1YMpeqyf6xAzT1lQKZ2PybP0duvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGT2urG9jqdhUkUdTwt04hei+fMGgSf1B3Vu5f4IAFg=;
 b=cmE1guJfQqP/MrrsNuG3+klQFPxWdX03EvK9xF5QKFUvzQhlhOX7ryNGun/IAEWa3fe9TC/1QtdBzeRS+v/rWIdbGBBfC7r5rAjbfQm21R201JR79zwkm95cpQFzhVufoFphRHADICmTMsGw6glWJYFJMqAfYv84Lp0vcrH+A93y9lA6RSkWvcshEXvPYSAZ4PH1RQa8Rlb/Rw4SeUzSCnUUJLMMU7tOd6j2Ip+/nD9dvxBGKC6mSOVO0y0pHkUI/5W6WWGGOcaKkdaVKGFkeRzIGGuVGNglwURAIXTEfcwj29ecC5WBjnRNWww7SorvgrKTLCaQEYOY4G+TzjPLrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB5154.eurprd04.prod.outlook.com (2603:10a6:208:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:19 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:19 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 04/18] crypto: rsa-pkcs1pad: Pull out child req processing code into helpers
Date:   Tue, 20 Apr 2021 13:41:09 +0200
Message-ID: <20210420114124.9684-5-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fee6097e-6614-45e1-7a88-08d903f1e9a8
X-MS-TrafficTypeDiagnostic: AM0PR04MB5154:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5154003E8656C5A2B055CA93E0489@AM0PR04MB5154.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /RIoqMpqsb9l+9zrWvo0jywbI6xJ1V6RuDgogzw+FYj0Jj/qms/e6b5x5XWI/W6VYL0XlLU8gjJJzmfyy/EHwrK95wY5dYlKV/+M7kVzmu0vyArs07ffcv/tAIkcC7fqTfmD2A7fRiV+oeK9Ux7v5jyIbsLAXX5zZg+7vhqhCs0bdKMP91dnKZsZ48hfRnDlFhscTn87Jadqg4vuHXOoXEAAxJjC5w5mscUI0DpvchUp9QacnEfDmi9xBZlHGau0WqyxSoMLTyLSLIr7BJKTvYgLMdHl1Xvze06+B2TeeAf7KvmJ8qPRwg5LL3tfZR/waovZCJcScTFXcaXLYOpXum878yrZ3XOCOemb3IUno8Ff/EMvf5nB88AW1BOz6otTotY0044osBJ/+c5vHw9ico9YbabfCJuC8uxr0344bXdERRVJ5TdyKXUrSAMa8tp6EtGKBMqWChrpKaGipVH/4si7nxrr2x8uo4lbr0WRCoQIGdfiPpFur1Agt+lQ439s7p5CfSqWW9Sz0fyDrYJnhhKgotF1r+3z1vrg8Vb8EMxvdy69x6h/ywA+qPKvzLXAVr4vY4l686hZ0Lu6Qrn2taXi0s6NexpPJDDlZsw4lecHneEhEW2EI8k+G1FTGdS8xhsXqtP9qNyl3kotBEjladmFxRNjI9j6sVSs2CWvw3h5ulnNl7axa8n8uCUbcKE5
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(396003)(39850400004)(26005)(16526019)(86362001)(186003)(956004)(66476007)(8936002)(5660300002)(66946007)(6506007)(44832011)(4326008)(6512007)(6486002)(8676002)(2616005)(316002)(6666004)(66556008)(36756003)(38350700002)(52116002)(478600001)(38100700002)(83380400001)(6916009)(1076003)(2906002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?r+j0K3VLSKCQMT5mcM7XqoGhapwXwJRi8Mm/Kv+Ioykmp4xtgDAXj7TMq5ZK?=
 =?us-ascii?Q?KJuwobFyEGgLISi8m0x4gyhEhzpkXhgwnIZiAHT/S0ggZkWsCIH0W4ShNy4m?=
 =?us-ascii?Q?tOqYHbdEkcATBQxjwsivpszTRPM5cnRipLwhfh4Xn2VCopEjQHVeMr6/fjwW?=
 =?us-ascii?Q?BHKU5KJTUilisy3P2J+PAc1xnJ4v63SzoUQkLbf+2od4UDSL74+1Y0gSojLk?=
 =?us-ascii?Q?hAjMsMvww714BOEplcgTYEcUDANAFbCfgzOCt4VtVouKAIbwCbFx7x/sRKRj?=
 =?us-ascii?Q?9CnO24RFxyr1jYkQX+TmP/pTsrj4ILjKXnBm1auTp2oaks/mIfxuohW+UORx?=
 =?us-ascii?Q?tIsp9ni/h3dtkSTj0KQew1ji845B8jeIi+XP2/tgMDvxqDSOd4ssYWV7v+lV?=
 =?us-ascii?Q?xHw5xS2i7geg4GSyTEeQSp/Bj+LML/MCANFmTgfPTsWoLk8+fq73K7DR3JVK?=
 =?us-ascii?Q?ueNyEp/dzJzLlrukWPfXvlS9jaOZ5/S8NLKTvoJ+LKkifqTN94w1lABKkOK/?=
 =?us-ascii?Q?Fhhm9QrHtWQczfb7/Y/mbMRctsG217JQg2YOWZLYc4R4R6MQdCQzkXM8Unz8?=
 =?us-ascii?Q?goznm+tgK7hmyRxYEoa/zRVTnuP8AphPY+G/21F/x3eKGXO+cCGdATHlhhhC?=
 =?us-ascii?Q?b1GMPHS9bLY5GB7mcUJChS6T1rL3Vv9LeszddW7Ksrw9AkVFx3K9Ti2tyqQJ?=
 =?us-ascii?Q?6JvEUw+NdyLvnUzgq1R+NaUkoBptaPuYmAX2yWF3GQBUKqYjMh8EcidNjhDM?=
 =?us-ascii?Q?O29aIqeCCZhbL9L8C+1DzN06I3Klbv5CyghKn8+ewJvBtoykQ3azYrGP+sLn?=
 =?us-ascii?Q?FzcnGODZBzVGdyUPZ0WjqAJol/BQ7WlT5Z6gLX2woemNcY4pUzUVeIym9rWJ?=
 =?us-ascii?Q?MOA50mmymZ39oUyPP+TfnH8MRCyj3BEegkwgnxKOjE7XwOSoyaUI028ftLxd?=
 =?us-ascii?Q?LBLY1wx2YPCExS/MnJiXM5yNs2a916SMTMp4a83JCO2Z9Vq7lS6ZWCVLjoBn?=
 =?us-ascii?Q?FBNzpDNx8IvYools6pAy8zl+UGipjLDC8A2TLeOH0UGk3lIsJuEBYwq4PSZF?=
 =?us-ascii?Q?1REkN0/Dl+u1331AvyDS32yxGsDIEdWZnugwgkfxg2SrmEW05UOK1iwwH4kR?=
 =?us-ascii?Q?Wpp0BGsWPiNeUbldemgn3yd43yBfjDE3vyyizl9XZ0OwBOUL20igk4DCud0l?=
 =?us-ascii?Q?LrcQaBbYAb3lkSqrCEVR+8kl7Y678zJQFMj9Bu/IsMSZj0KvGNrRKx/sJIW9?=
 =?us-ascii?Q?51JjRAk8/YRBl2pxWU5Fvn5G/jNQBSEckfjBV3NREzvsrk8vXBiTyZ5COOBf?=
 =?us-ascii?Q?A83YJfzd+9gSIFDJI//WjzNt?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee6097e-6614-45e1-7a88-08d903f1e9a8
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:19.2819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0ZQfldRmWCi9CMa2m90hxHuS8u5fT1twdCXOhcdOreVxORp6uM6GbUKlHbqvLRPhoeNR0E0hTkcCBesCxGa6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5154
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

rsa-pkcs1pad operations that require using RSA primitives rely on
creating an akcipher child RSA transform and processing the results
in the operation-specific callback. Add helpers
rsapad_akcipher_setup_child and rsapad_akcipher_req_complete for req
setup and callback handling, and switch pkcs1pad operations to use
these.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/rsa-pkcs1pad.c | 106 +++++++++++++++++++-----------------------
 1 file changed, 49 insertions(+), 57 deletions(-)

diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
index 849573f6b44b3..6329c79316d24 100644
--- a/crypto/rsa-pkcs1pad.c
+++ b/crypto/rsa-pkcs1pad.c
@@ -171,6 +171,38 @@ static void rsapad_akcipher_sg_set_buf(struct scatterl=
ist *sg, void *buf,
 		sg_chain(sg, nsegs, next);
 }
=20
+typedef int (*rsa_akcipher_complete_cb)(struct akcipher_request *, int);
+static void rsapad_akcipher_req_complete(struct crypto_async_request *chil=
d_async_req,
+					 int err, rsa_akcipher_complete_cb cb)
+{
+	struct akcipher_request *req =3D child_async_req->data;
+	struct crypto_async_request async_req;
+
+	if (err =3D=3D -EINPROGRESS)
+		return;
+
+	async_req.data =3D req->base.data;
+	async_req.tfm =3D crypto_akcipher_tfm(crypto_akcipher_reqtfm(req));
+	async_req.flags =3D child_async_req->flags;
+	req->base.complete(&async_req, cb(req, err));
+}
+
+static void rsapad_akcipher_setup_child(struct akcipher_request *req,
+					struct scatterlist *src_sg,
+					struct scatterlist *dst_sg,
+					unsigned int src_len,
+					unsigned int dst_len,
+					crypto_completion_t cb)
+{
+	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
+	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct pkcs1pad_request *req_ctx =3D akcipher_request_ctx(req);
+
+	akcipher_request_set_tfm(&req_ctx->child_req, ctx->child);
+	akcipher_request_set_callback(&req_ctx->child_req, req->base.flags, cb, r=
eq);
+	akcipher_request_set_crypt(&req_ctx->child_req, src_sg, dst_sg, src_len, =
dst_len);
+}
+
 static int pkcs1pad_encrypt_sign_complete(struct akcipher_request *req, in=
t err)
 {
 	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
@@ -213,17 +245,8 @@ static int pkcs1pad_encrypt_sign_complete(struct akcip=
her_request *req, int err)
 static void pkcs1pad_encrypt_sign_complete_cb(
 		struct crypto_async_request *child_async_req, int err)
 {
-	struct akcipher_request *req =3D child_async_req->data;
-	struct crypto_async_request async_req;
-
-	if (err =3D=3D -EINPROGRESS)
-		return;
-
-	async_req.data =3D req->base.data;
-	async_req.tfm =3D crypto_akcipher_tfm(crypto_akcipher_reqtfm(req));
-	async_req.flags =3D child_async_req->flags;
-	req->base.complete(&async_req,
-			pkcs1pad_encrypt_sign_complete(req, err));
+	rsapad_akcipher_req_complete(child_async_req, err,
+				     pkcs1pad_encrypt_sign_complete);
 }
=20
 static int pkcs1pad_encrypt(struct akcipher_request *req)
@@ -259,13 +282,10 @@ static int pkcs1pad_encrypt(struct akcipher_request *=
req)
 	rsapad_akcipher_sg_set_buf(req_ctx->in_sg, req_ctx->in_buf,
 			ctx->key_size - 1 - req->src_len, req->src);
=20
-	akcipher_request_set_tfm(&req_ctx->child_req, ctx->child);
-	akcipher_request_set_callback(&req_ctx->child_req, req->base.flags,
-			pkcs1pad_encrypt_sign_complete_cb, req);
-
 	/* Reuse output buffer */
-	akcipher_request_set_crypt(&req_ctx->child_req, req_ctx->in_sg,
-				   req->dst, ctx->key_size - 1, req->dst_len);
+	rsapad_akcipher_setup_child(req, req_ctx->in_sg, req->dst,
+				    ctx->key_size - 1, req->dst_len,
+				    pkcs1pad_encrypt_sign_complete_cb);
=20
 	err =3D crypto_akcipher_encrypt(&req_ctx->child_req);
 	if (err !=3D -EINPROGRESS && err !=3D -EBUSY)
@@ -331,16 +351,7 @@ static int pkcs1pad_decrypt_complete(struct akcipher_r=
equest *req, int err)
 static void pkcs1pad_decrypt_complete_cb(
 		struct crypto_async_request *child_async_req, int err)
 {
-	struct akcipher_request *req =3D child_async_req->data;
-	struct crypto_async_request async_req;
-
-	if (err =3D=3D -EINPROGRESS)
-		return;
-
-	async_req.data =3D req->base.data;
-	async_req.tfm =3D crypto_akcipher_tfm(crypto_akcipher_reqtfm(req));
-	async_req.flags =3D child_async_req->flags;
-	req->base.complete(&async_req, pkcs1pad_decrypt_complete(req, err));
+	rsapad_akcipher_req_complete(child_async_req, err, pkcs1pad_decrypt_compl=
ete);
 }
=20
 static int pkcs1pad_decrypt(struct akcipher_request *req)
@@ -360,14 +371,10 @@ static int pkcs1pad_decrypt(struct akcipher_request *=
req)
 	rsapad_akcipher_sg_set_buf(req_ctx->out_sg, req_ctx->out_buf,
 			    ctx->key_size, NULL);
=20
-	akcipher_request_set_tfm(&req_ctx->child_req, ctx->child);
-	akcipher_request_set_callback(&req_ctx->child_req, req->base.flags,
-			pkcs1pad_decrypt_complete_cb, req);
-
 	/* Reuse input buffer, output to a new buffer */
-	akcipher_request_set_crypt(&req_ctx->child_req, req->src,
-				   req_ctx->out_sg, req->src_len,
-				   ctx->key_size);
+	rsapad_akcipher_setup_child(req, req->src, req_ctx->out_sg,
+				    req->src_len, ctx->key_size,
+				    pkcs1pad_decrypt_complete_cb);
=20
 	err =3D crypto_akcipher_decrypt(&req_ctx->child_req);
 	if (err !=3D -EINPROGRESS && err !=3D -EBUSY)
@@ -418,13 +425,10 @@ static int pkcs1pad_sign(struct akcipher_request *req=
)
 	rsapad_akcipher_sg_set_buf(req_ctx->in_sg, req_ctx->in_buf,
 			ctx->key_size - 1 - req->src_len, req->src);
=20
-	akcipher_request_set_tfm(&req_ctx->child_req, ctx->child);
-	akcipher_request_set_callback(&req_ctx->child_req, req->base.flags,
-			pkcs1pad_encrypt_sign_complete_cb, req);
-
 	/* Reuse output buffer */
-	akcipher_request_set_crypt(&req_ctx->child_req, req_ctx->in_sg,
-				   req->dst, ctx->key_size - 1, req->dst_len);
+	rsapad_akcipher_setup_child(req, req_ctx->in_sg, req->dst,
+				    ctx->key_size - 1, req->dst_len,
+				    pkcs1pad_encrypt_sign_complete_cb);
=20
 	err =3D crypto_akcipher_decrypt(&req_ctx->child_req);
 	if (err !=3D -EINPROGRESS && err !=3D -EBUSY)
@@ -509,16 +513,8 @@ static int pkcs1pad_verify_complete(struct akcipher_re=
quest *req, int err)
 static void pkcs1pad_verify_complete_cb(
 		struct crypto_async_request *child_async_req, int err)
 {
-	struct akcipher_request *req =3D child_async_req->data;
-	struct crypto_async_request async_req;
-
-	if (err =3D=3D -EINPROGRESS)
-		return;
-
-	async_req.data =3D req->base.data;
-	async_req.tfm =3D crypto_akcipher_tfm(crypto_akcipher_reqtfm(req));
-	async_req.flags =3D child_async_req->flags;
-	req->base.complete(&async_req, pkcs1pad_verify_complete(req, err));
+	rsapad_akcipher_req_complete(child_async_req, err,
+				     pkcs1pad_verify_complete);
 }
=20
 /*
@@ -548,14 +544,10 @@ static int pkcs1pad_verify(struct akcipher_request *r=
eq)
 	rsapad_akcipher_sg_set_buf(req_ctx->out_sg, req_ctx->out_buf,
 			    ctx->key_size, NULL);
=20
-	akcipher_request_set_tfm(&req_ctx->child_req, ctx->child);
-	akcipher_request_set_callback(&req_ctx->child_req, req->base.flags,
-			pkcs1pad_verify_complete_cb, req);
-
 	/* Reuse input buffer, output to a new buffer */
-	akcipher_request_set_crypt(&req_ctx->child_req, req->src,
-				   req_ctx->out_sg, req->src_len,
-				   ctx->key_size);
+	rsapad_akcipher_setup_child(req, req->src, req_ctx->out_sg,
+				    req->src_len, ctx->key_size,
+				    pkcs1pad_verify_complete_cb);
=20
 	err =3D crypto_akcipher_encrypt(&req_ctx->child_req);
 	if (err !=3D -EINPROGRESS && err !=3D -EBUSY)
--=20
2.30.2

