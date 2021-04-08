Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B143586C0
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231935AbhDHOQx (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:16:53 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:22687 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231964AbhDHOQo (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891391;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ocAazsLxY4QF9+UznNegPKeahTtK1vL+omwrBn0daXU=;
        b=eWW7qg69GPVQ04rHd0l63xCXPfcrEDijbqU7fOuLgo57beJYfociM4e9YENWI9Gf5fJ3UE
        ByOfP63XpRIvhO9hEqkv9vL/kvJjQ1Xi+/KhT7y1v+7CsdBw3tUWN2Zuds+IGPLOq0hFOK
        BJTISTDk3mBdAbnzCqYd65H3Dh5R9CI=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-27-hOkGH2q9N2Cpl-qqeYRULA-3; Thu, 08 Apr 2021 16:16:15 +0200
X-MC-Unique: hOkGH2q9N2Cpl-qqeYRULA-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5A3DwmU7gzJd6uiJ2OjvZmu02L5TcItDBliULG/pFn8vAuFmMegMYKhIoFg6HVYyX/GHAzCDjMD9t7I9vEXs/DsWjr2i5sMgwk6F4aD3jj1nQudv/d2W2IMCrkpJTkJfY+hj6n+RGOxgc12HpOUw63lAF7PeeaGDVQ7pc7OUXVUe9bnKFHiNJ7dVUvCQbaNApohUQfm4Iv5VFKasp754RkIGgp/cq6WNuMLmXFnYYLNdIHw6Fs1mTqfVV2OotOzo8SG3GlYnSJkoGEp5gFqSfZTAo2jMUjzlvYxw4QDizcXa+v4cWejG5wAyyElc+qmCYlssipRfT0YLAmvPtIM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYLADhNkUUMdivmEEQa0kCwOxggXebXsloq8B+dupUA=;
 b=JFpIw1PMXEg1JPBJjaD7Vociw5F48MU+646dJb3JcYFqUiiGJoXSsqpghDpz3rmGKh39VbugmVCtrZLIwCWctOW97w4Cv8puOiCynEdoopmIifQX+E3Pvpj+V+7HMCEHVTCXJxdsj51pYT2N05xdyF/aKQTP5sqpgp5ZDh/Acqj8zl8I3mSm8dheY9R3nqdbNo/x9W5g4AWaBWcsnLzyUrefaE7MZikQy/IFeDyJXXHZm8Jt5iH3a9bmHMWWbPApxrOGbRRTN3OeTad7Jg0cgCzn+TTJN+rfhC9BrM0/AtLM9O0j6bxOA2HsTgE6Yxa/l4bMQ+8OJz3BZifModgR6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 14:15:58 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:15:58 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 05/18] crypto: rsa-pkcs1pad: Rename pkcs1pad_* structs to rsapad_*
Date:   Thu,  8 Apr 2021 16:15:03 +0200
Message-ID: <20210408141516.11369-6-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:15:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54ebeb93-a4d2-4aeb-d5e7-08d8fa98d4c3
X-MS-TrafficTypeDiagnostic: AM0PR04MB6289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB62893DA9C2413D8985A62E10E0749@AM0PR04MB6289.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PCf4MRTS+yd02bm+avSrJu3ExfWYg9YYu9yBSZH0VOrTr8GFrytvZq8CnhrlRDhmO9zrSDL5MdhKt0WsxgNdeF8Qj9CsULIIMSoCcFIatCYap2NyH3YxjxiR5PPStBKtTx+gWSFhNuwMzJVRO+X4bFlY1NEuT7+uNbXTCyp12wv3Jsjxye5Fs4z+jBgxR0mlar2wV0wc45CdqxvECSLZwHxVQsoaMfFBgo4276Pv1/+YKGbdq7YUI51M9eacX4yKd9ri85gdAjv9To9/+nS4RsLdGvVflwOwe7a4b9+jLIUxj7VvfwfQxhVc9BWjaROHT2lmx2ghwGuZAFYMO0ujdMGTr4QCrXNmEghO+0GzHYqwTrVt29ZyI9HTVhxHkOMjlwkzvBIjsDwN3KbRJlO9xkxmtB9L1YiAHAbGWx7kPT7pbcQVCiGWZEbx9a41Icsyw5+zAgmRu1FBUMMDEDQI0nURRR0/vkqFjFXoQI57r6a9FTygGY3h4JUQt32pPsajGRXZfurDwWoD+4qfm2MJABp45hb8mn6wihHANcLd9TeQWCGm7eFctWfzPaedCMfIwa0XrOKCFyf/OnlV4j4o0b9tIUP2ExQe9kVQgVvv2W1C7ixd+j1D+FbXNi3A2U2zQVF6huzN5fG4DgMgI2pqJqe2VqgYMlDqgGsI8z/vByAWAY91xtE/ITTYHdRc7gG6
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(186003)(83380400001)(16526019)(478600001)(6486002)(38100700001)(36756003)(5660300002)(4326008)(6916009)(1076003)(66476007)(316002)(2906002)(66556008)(26005)(38350700001)(2616005)(6666004)(956004)(8676002)(44832011)(8936002)(6506007)(86362001)(52116002)(66946007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Df5vn6fn+M/tnkmyFHzP9bdYHbyMoSzpi4Va3Z1/mcolaprB/wuFVT8rQfCw?=
 =?us-ascii?Q?OmIUYCZcgVkE8gBj2bn6PekfhqGPCLdAVaC1U7MBWxbnQfYRVeOQUoM1+IJ+?=
 =?us-ascii?Q?4f9YdkPczMncHBBnaUvJG6xwJlVPqDRnDTkaRYAjmHrv51bMFBbo6c2e6A2t?=
 =?us-ascii?Q?Cz3AoqeiB3/Wf0VAj+hgwW5WQvy/GGzoHYJaTGNImXqIjMzuikmWvESqMBER?=
 =?us-ascii?Q?DoA1IE3M3xo0fAINJ0fNtEOFmrqvqkZ6Qfo3OP70sMOC81HJZxLvRs1YTICA?=
 =?us-ascii?Q?iB4zrjyEMz7CFIybYXFDruWlQreH0xrIYChnZ6QVOVPiKvnbj2ZDQplz9BEL?=
 =?us-ascii?Q?99UGJ7+RwVD6WRZRB5QGYcoFuhr0t0sIo8lqx7+xebOCiMDgHQofFSFvX1zn?=
 =?us-ascii?Q?JXPLGwBDcVYODb/1B3WZKlg1Zkw5+l863RZ4YYVpa9kRh31jXATpeB3RfM/G?=
 =?us-ascii?Q?bDX9Xe8hfCTZWrdf7i6gQAO6FQIS26kgLwlOmxDX8TuzmU2HVAfo1ZY43+hr?=
 =?us-ascii?Q?UhuAJIGWktNjXXDsEadrUI0l4kn+6sJgPG9Q3e4R+Ji3fjm6uUp9b07gU0Z7?=
 =?us-ascii?Q?0prYFvJ9PQJnrYr/YPK05VNPe30XhRJ/PtJyNc5YVT2RQQ2GV38lV5orRYjC?=
 =?us-ascii?Q?5I6HgSjy5+M9W8Zc5WbWE9f33Vt+OLXyzMrtqNrFcgj5S2xZnSV7IiOgp5Ur?=
 =?us-ascii?Q?FyEfOoGsV1K/SiBJf1Kco1BhcSTT7T+yZR6Czcj/8BjUyTBRqQd94IyvK86D?=
 =?us-ascii?Q?E7MaS28t2FpEVOm9qJ+UAEEXJjZYIE1E21Q+r6z0lnhfcgExY6l/swVZ0r7r?=
 =?us-ascii?Q?OdraqU9hUuUWLgJp06tbOtLVgvXIfqnF0hoJdVR81htw2DjlN0KoTvCDW9kM?=
 =?us-ascii?Q?hRL54N119p5Ln6EaGaw6K60TXhhnXRhjfZTutBJStpWUk3Uww0tklRfPXAOP?=
 =?us-ascii?Q?QYBjohvdzH+xWb+0xR4TwQ28FIjXvPWuWCkaW8hzDQN0Z4hgj7M1NRBUIJ7S?=
 =?us-ascii?Q?4bLsb0YEvTHyVJPzhDCq5IyB5RWOo2kuL5u/irSdUqCfhcuOqg5q2l6GQr6L?=
 =?us-ascii?Q?j1bJR+nBZhzM3FYFpyh1R8HxPUEzfzvUJsmREiKxidRWcPH5UYWlu4DbPHJu?=
 =?us-ascii?Q?8kh/H8V6+06EnRulQKzZzDdwjIA3OjIu0lunKF/QnpB22FAdlibHVcdf9ngx?=
 =?us-ascii?Q?PCXWLfftnfPEFd+o9yyeVuu6sIoWhhz2RpWZVLx3OTH0xrjI2isVQCWONKVV?=
 =?us-ascii?Q?EJWYipG1ZESgcBG7VpGXT/HZOTAU+aXRsikMTLGai3FeLhHnXPsvuNrsRlnv?=
 =?us-ascii?Q?zcjPbLabgeVpKTWSmZ5JSVbL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54ebeb93-a4d2-4aeb-d5e7-08d8fa98d4c3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:15:58.5831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGJGjrYyGFtQCncntIpqYlt27SILptpVbjGNxQj4499Mg6LBgTU/bn5z42Pdu/GzIeUGJXBtENe0PgJn0urXTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6289
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Use generic naming to share with other padding scheme implementations.
These will be moved out of rsa-pkcs1pad.c.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/rsa-pkcs1pad.c | 62 +++++++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
index 6329c79316d24..e76fc98a537a4 100644
--- a/crypto/rsa-pkcs1pad.c
+++ b/crypto/rsa-pkcs1pad.c
@@ -88,17 +88,17 @@ static const struct rsa_asn1_template *rsa_lookup_asn1(=
const char *name)
 	return NULL;
 }
=20
-struct pkcs1pad_ctx {
+struct rsapad_tfm_ctx {
 	struct crypto_akcipher *child;
 	unsigned int key_size;
 };
=20
-struct pkcs1pad_inst_ctx {
+struct rsapad_inst_ctx {
 	struct crypto_akcipher_spawn spawn;
 	const struct rsa_asn1_template *digest_info;
 };
=20
-struct pkcs1pad_request {
+struct rsapad_akciper_req_ctx {
 	struct scatterlist in_sg[2], out_sg[1];
 	uint8_t *in_buf, *out_buf;
 	struct akcipher_request child_req;
@@ -107,7 +107,7 @@ struct pkcs1pad_request {
 static int rsapad_set_pub_key(struct crypto_akcipher *tfm, const void *key=
,
 		unsigned int keylen)
 {
-	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
 	int err;
=20
 	ctx->key_size =3D 0;
@@ -128,7 +128,7 @@ static int rsapad_set_pub_key(struct crypto_akcipher *t=
fm, const void *key,
 static int rsapad_set_priv_key(struct crypto_akcipher *tfm, const void *ke=
y,
 		unsigned int keylen)
 {
-	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
 	int err;
=20
 	ctx->key_size =3D 0;
@@ -148,7 +148,7 @@ static int rsapad_set_priv_key(struct crypto_akcipher *=
tfm, const void *key,
=20
 static unsigned int rsapad_get_max_size(struct crypto_akcipher *tfm)
 {
-	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
=20
 	/*
 	 * The maximum destination buffer size for the encrypt/sign operations
@@ -195,8 +195,8 @@ static void rsapad_akcipher_setup_child(struct akcipher=
_request *req,
 					crypto_completion_t cb)
 {
 	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
-	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
-	struct pkcs1pad_request *req_ctx =3D akcipher_request_ctx(req);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_akciper_req_ctx *req_ctx =3D akcipher_request_ctx(req);
=20
 	akcipher_request_set_tfm(&req_ctx->child_req, ctx->child);
 	akcipher_request_set_callback(&req_ctx->child_req, req->base.flags, cb, r=
eq);
@@ -206,8 +206,8 @@ static void rsapad_akcipher_setup_child(struct akcipher=
_request *req,
 static int pkcs1pad_encrypt_sign_complete(struct akcipher_request *req, in=
t err)
 {
 	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
-	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
-	struct pkcs1pad_request *req_ctx =3D akcipher_request_ctx(req);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_akciper_req_ctx *req_ctx =3D akcipher_request_ctx(req);
 	unsigned int pad_len;
 	unsigned int len;
 	u8 *out_buf;
@@ -252,8 +252,8 @@ static void pkcs1pad_encrypt_sign_complete_cb(
 static int pkcs1pad_encrypt(struct akcipher_request *req)
 {
 	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
-	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
-	struct pkcs1pad_request *req_ctx =3D akcipher_request_ctx(req);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_akciper_req_ctx *req_ctx =3D akcipher_request_ctx(req);
 	int err;
 	unsigned int i, ps_end;
=20
@@ -297,8 +297,8 @@ static int pkcs1pad_encrypt(struct akcipher_request *re=
q)
 static int pkcs1pad_decrypt_complete(struct akcipher_request *req, int err=
)
 {
 	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
-	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
-	struct pkcs1pad_request *req_ctx =3D akcipher_request_ctx(req);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_akciper_req_ctx *req_ctx =3D akcipher_request_ctx(req);
 	unsigned int dst_len;
 	unsigned int pos;
 	u8 *out_buf;
@@ -357,8 +357,8 @@ static void pkcs1pad_decrypt_complete_cb(
 static int pkcs1pad_decrypt(struct akcipher_request *req)
 {
 	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
-	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
-	struct pkcs1pad_request *req_ctx =3D akcipher_request_ctx(req);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_akciper_req_ctx *req_ctx =3D akcipher_request_ctx(req);
 	int err;
=20
 	if (!ctx->key_size || req->src_len !=3D ctx->key_size)
@@ -386,10 +386,10 @@ static int pkcs1pad_decrypt(struct akcipher_request *=
req)
 static int pkcs1pad_sign(struct akcipher_request *req)
 {
 	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
-	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
-	struct pkcs1pad_request *req_ctx =3D akcipher_request_ctx(req);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_akciper_req_ctx *req_ctx =3D akcipher_request_ctx(req);
 	struct akcipher_instance *inst =3D akcipher_alg_instance(tfm);
-	struct pkcs1pad_inst_ctx *ictx =3D akcipher_instance_ctx(inst);
+	struct rsapad_inst_ctx *ictx =3D akcipher_instance_ctx(inst);
 	const struct rsa_asn1_template *digest_info =3D ictx->digest_info;
 	int err;
 	unsigned int ps_end, digest_size =3D 0;
@@ -440,10 +440,10 @@ static int pkcs1pad_sign(struct akcipher_request *req=
)
 static int pkcs1pad_verify_complete(struct akcipher_request *req, int err)
 {
 	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
-	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
-	struct pkcs1pad_request *req_ctx =3D akcipher_request_ctx(req);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_akciper_req_ctx *req_ctx =3D akcipher_request_ctx(req);
 	struct akcipher_instance *inst =3D akcipher_alg_instance(tfm);
-	struct pkcs1pad_inst_ctx *ictx =3D akcipher_instance_ctx(inst);
+	struct rsapad_inst_ctx *ictx =3D akcipher_instance_ctx(inst);
 	const struct rsa_asn1_template *digest_info =3D ictx->digest_info;
 	unsigned int dst_len;
 	unsigned int pos;
@@ -528,8 +528,8 @@ static void pkcs1pad_verify_complete_cb(
 static int pkcs1pad_verify(struct akcipher_request *req)
 {
 	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
-	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
-	struct pkcs1pad_request *req_ctx =3D akcipher_request_ctx(req);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_akciper_req_ctx *req_ctx =3D akcipher_request_ctx(req);
 	int err;
=20
 	if (WARN_ON(req->dst) ||
@@ -559,8 +559,8 @@ static int pkcs1pad_verify(struct akcipher_request *req=
)
 static int rsapad_akcipher_init_tfm(struct crypto_akcipher *tfm)
 {
 	struct akcipher_instance *inst =3D akcipher_alg_instance(tfm);
-	struct pkcs1pad_inst_ctx *ictx =3D akcipher_instance_ctx(inst);
-	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_inst_ctx *ictx =3D akcipher_instance_ctx(inst);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
 	struct crypto_akcipher *child_tfm;
=20
 	child_tfm =3D crypto_spawn_akcipher(&ictx->spawn);
@@ -573,14 +573,14 @@ static int rsapad_akcipher_init_tfm(struct crypto_akc=
ipher *tfm)
=20
 static void rsapad_akcipher_exit_tfm(struct crypto_akcipher *tfm)
 {
-	struct pkcs1pad_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
=20
 	crypto_free_akcipher(ctx->child);
 }
=20
 static void rsapad_akcipher_free(struct akcipher_instance *inst)
 {
-	struct pkcs1pad_inst_ctx *ctx =3D akcipher_instance_ctx(inst);
+	struct rsapad_inst_ctx *ctx =3D akcipher_instance_ctx(inst);
 	struct crypto_akcipher_spawn *spawn =3D &ctx->spawn;
=20
 	crypto_drop_akcipher(spawn);
@@ -605,7 +605,7 @@ static int rsapad_akcipher_create(struct crypto_templat=
e *tmpl, struct rtattr **
 {
 	u32 mask;
 	struct akcipher_instance *inst;
-	struct pkcs1pad_inst_ctx *ctx;
+	struct rsapad_inst_ctx *ctx;
 	struct akcipher_alg *rsa_alg;
 	const char *hash_name;
 	int err;
@@ -661,7 +661,7 @@ static int rsapad_akcipher_create(struct crypto_templat=
e *tmpl, struct rtattr **
 	}
=20
 	inst->alg.base.cra_priority =3D rsa_alg->base.cra_priority;
-	inst->alg.base.cra_ctxsize =3D sizeof(struct pkcs1pad_ctx);
+	inst->alg.base.cra_ctxsize =3D sizeof(struct rsapad_tfm_ctx);
=20
 	inst->alg.init =3D alg->init;
 	inst->alg.exit =3D alg->exit;
@@ -673,7 +673,7 @@ static int rsapad_akcipher_create(struct crypto_templat=
e *tmpl, struct rtattr **
 	inst->alg.set_pub_key =3D alg->set_pub_key;
 	inst->alg.set_priv_key =3D alg->set_priv_key;
 	inst->alg.max_size =3D alg->max_size;
-	inst->alg.reqsize =3D sizeof(struct pkcs1pad_request) + rsa_alg->reqsize;
+	inst->alg.reqsize =3D sizeof(struct rsapad_akciper_req_ctx) + rsa_alg->re=
qsize;
=20
 	inst->free =3D rsapad_akcipher_free;
=20
--=20
2.30.2

