Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFA063586BA
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231769AbhDHOQe (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:16:34 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:37505 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231826AbhDHOQc (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:16:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891380;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KH0v0aoXcA7hrq0AgsRogda6T+ioH6k9wwvrgrJNqBw=;
        b=il1nlLibHPKl3ndecVLEUEe3b6/Td9dMRpug+chQTvGyahYJMuuOy9do2x+poGpfl0BypC
        4ESFdSRycJXXAi4expfdXU6J+eTjT0ZFJqGkAqO/RxEv+2+ALMy4fFira3c7zQq2N6+xAk
        wZRySCl2+sGG+EBPqnSXWDbzHOKZ5Kw=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-aQejvcLkNK-nNUBcs5vMeg-2;
 Thu, 08 Apr 2021 16:16:08 +0200
X-MC-Unique: aQejvcLkNK-nNUBcs5vMeg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6XCSMBzMh+zzW86ffjAh3Uu7MSS4XaUvPi2pWzkyb13FbLAINTWd3pcmGHMWuSzsX7oLu6dgMVXs9E72a+e4yCGvaYV1Zy3pSly24IjO3ZwJCp1+sgecRmxP3qUthoFtCUj7Fcy09qGD57bF86TQkIjEd/UJIp7eoFWCAidRJc0+EtWi/RVZqmj2cw+TaOcyvIY5aE42odlohTeFCr7mXdCngkTiCifSxjQ/dfSEoawbe9TtrQ6KYUnd6R9r0UCQ4r2kKBGHE7e2ZWRhHZ3sAaFTb2/8HEr15Mr4kwU0Y0wP1QosipU2cb2uWF30B/CFvb7VtDoY6lb0CRFzaShmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGT2urG9jqdhUkUdTwt04hei+fMGgSf1B3Vu5f4IAFg=;
 b=K+xaJ4uQhFAj0oFoQUACQk8CDNikWERPQMVDvjB793IumeR07NP//s9jdn8ycLzuGTEiPQPqo5xSSmGDoE1Nht5hRSYGZIRHTFk8/4nUK+Nq3EwVZEvA3AHDoXPNDxdHDxRnzk+Xu9tpMa6w89hbkYuhvr10mIfBqEkSqu56hAHMzfDHRo1S6MAtujNxCIQ19FR4YFngJ/HfwV6BYdFIfaHt1D75GhWy42D8ReUfuUvtCtlkTu4hAkRB2ouRrdwiImd2JJWn3wnspt4XR378yv8N6xF6g/6fTCwTew3XBmt38F2Nb16GGyF0BhC4EAaETcIlJML5S1lEfVh2TRl+Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 14:15:57 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:15:57 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 04/18] crypto: rsa-pkcs1pad: Pull out child req processing code into helpers
Date:   Thu,  8 Apr 2021 16:15:02 +0200
Message-ID: <20210408141516.11369-5-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:15:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64c755e7-4d0f-49b3-9304-08d8fa98d421
X-MS-TrafficTypeDiagnostic: AM0PR04MB6289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB62891B98C536C668553099BDE0749@AM0PR04MB6289.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n7CRUtjg1/McsMTHewGBNO5lB80hwMjVdFyxlGE1+10Fc8yPsgQs0Nd5eeF9tZPiTeIqGeRULgCNmPTMotEuzLwbaZFLlP/SMUoOBdEZu0F/I9JRO14aDFgOJX2+IH6GvcZqh29msj1lkj4Oqm1KCqLmTCSoZyDYu0F27vBOZm+kxeKbVRJV1tsOABOH1tdsdllHa1VjcXYcwVTV5yQrSNhvhANpC+OcwX4WoXFzwFAucvz9ntH6aDe1udX9CaCfa12pt9PgG7zbqVmbEsXFwk3mI0lQI/4Ej9TS+J2Yawyn+yh3iH9ie7Y6ZvwLT6m4Hrxy1hop0zqgFPKfLBooEezdKDH1cIKZljowAHQ5eokJqTBCmiHXSWI9a/J/msyf8wWu/zn5SZ75VQ6wp+sf4Xj610bwBeiROWu6oB9SHyi83wlXWgoAUEoHxAq7R/ASR4kSmHRgu/W29Ht4i/6wolucWYO5ncI9sycKFhyrMlF+11BVvxQCIIMtgllAJQ+dKcLDSjjF9RKw2Eq514dwVreabQBlVHIkZNkVbQU1RtWKfBQmYE7q+X+/LNChHM6z3EETl15IOBllRtnHEDl82D2rY7B89cFIbNBRIHRjX+47jU83eZxPfttPsLpSchUJzSHwWfE7De/YxJ5e8sN2jjX+4mziY2SVZEtRMiM7gZZ/QIi8kuqTRJJhCNdUH0ZJ3qsq4wFZUESGa980tDqETQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(186003)(83380400001)(16526019)(478600001)(6486002)(38100700001)(36756003)(5660300002)(4326008)(6916009)(1076003)(66476007)(316002)(2906002)(66556008)(26005)(38350700001)(2616005)(6666004)(956004)(8676002)(44832011)(8936002)(6506007)(86362001)(52116002)(66946007)(6512007)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?M5OGOrTcWvEYNt+Pr1mixE1QcOoixVcUJNDeqkp/Yeq52onVFN9JnX6uUlnW?=
 =?us-ascii?Q?RyT6oV96EYgKhe5S6o3dCEjX5LjbgzW0GQvHJOFgVodtUDUgvHsOhhnJV1c5?=
 =?us-ascii?Q?o3pBrAZoV8Z7KCVKKwBsVf8LQ0AkDDTVjRv/JAcaQF0p010h025okqTKZnTI?=
 =?us-ascii?Q?sAqe/raUqf+yKK4KdQhnToWurmBm5LCzmrMuJQQ+ESk9Z4N3eFVWUPuumDP1?=
 =?us-ascii?Q?NTz4EBLRwfWpwcM0jjarsDoFnw23uCLFVZwsmTwJ7zJtgm8Jxf0/AMZPpl+O?=
 =?us-ascii?Q?RN7QpmlCN1HisL8Q0mwUpQo/jvcUb0m2KzUTaLxYppVVgn6sZhObEBeC7K4H?=
 =?us-ascii?Q?f0+BG3UO9RpDfrgqXqVqwTmw+ta+pZ3cnjfFGP+pbGtvkSfdoJcaFEo2KVPx?=
 =?us-ascii?Q?QSM3aZPbPTCPpqn3AuLi9k4STSYB75kpjta3Qi073AOpe22x8lTpwSvK+Wv1?=
 =?us-ascii?Q?9QWKKfUgdrWh8z0YbHbjV7N5aHqFnPfVaV5TFLmovOnRDRzBvV57nWyLrUq9?=
 =?us-ascii?Q?JOOISxWGN8xZuljy6KG+uusNXoS2s87QOFvLuCNJoA+YhQONrEMA6bu8g3Qj?=
 =?us-ascii?Q?UoXz6X2Pe8UH1l4CJwoi1wRYDjjlTLPQGs3otFoqYzIGtUgQLRAtuH57CTQ0?=
 =?us-ascii?Q?cimb9vRbnoaiINRWzol8T9qmZq1PcvVGV+NJ0qlFPHFLo6qgEscyrC/JxSLu?=
 =?us-ascii?Q?OFqzeDm13iApKT3ZKhMxVFLrSyGFPb8Vwy5MuBCsG3s/SpNvbuOspbQPUC//?=
 =?us-ascii?Q?7FSV0dEh8G7qUcsF7r74exrWl6oVZlywWMaM5crhzoKNEchqnYFA5ia2oKOr?=
 =?us-ascii?Q?fxZU0Y9i0GtsVHtcakgXEhCCd0f6OtxSutbtrEtRmK7W1G7pkyaB92w94HPy?=
 =?us-ascii?Q?KbGvwVsjdDN/g7jCIG6oIbCV/ED/TTV72TVzC5NL/yP4DK/DqGud4i5XzQrE?=
 =?us-ascii?Q?QiLY6RjyebXiqV6gxgs4tOVv0oN+FXBAhFqWD0PmR3MCL+1drEW3TBV4Hwde?=
 =?us-ascii?Q?rXyoELyaFpgSYH3X3OKoRoDJ3voFd76lkl7ZgrwcwYlnJoNKaYghCevElKpf?=
 =?us-ascii?Q?Ne7ufjutCcZZ7a7TZEmyfu/nLlCHC9tcaPzi+didqQMeqH2bdYo6tiHacO2K?=
 =?us-ascii?Q?2UIg5w4R95nkpfnZqnGPKFWIBN7QHtiHJIlfSiL2uZAC1SHcrgxd01kyhmJM?=
 =?us-ascii?Q?kDdNrXL0DvE47IcIfCpGR+RNwcwbkQJaph5mIhgVeUSwT95KLhvfd0IFPmGa?=
 =?us-ascii?Q?PPC8n0GDO+Fatk+YAzHQC3P2ty/zh7g4B7m6C8PvnjtwFhUWHNpmNutzoeef?=
 =?us-ascii?Q?UW3xxiW7hUqIHvjxk6NO/Nqj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64c755e7-4d0f-49b3-9304-08d8fa98d421
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:15:57.5067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xNxIGeAvstQk6+qq1y/+H1wQ+HrtDA3Ub8nRsb/KMl0YupGYYg4pVGbZjYTZJkB437g/pA6cu7K3KBxxLqpiHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6289
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

