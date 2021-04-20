Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 576903657EE
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbhDTLrV (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:21 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:26295 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232149AbhDTLrE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919192;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=96DN941Ef/gymzsqU9SPmXm1cdxD7+/+a/zlrCm7hnM=;
        b=H6vO2alJRZp1QEZFhIdwr8ychC03GqqZIhKm7Vn6cieLp1R1DrLKElWAGutw93c/yCwPqk
        d8piYqDWTGA4WJwGxP0Uslx8rKaIClIOb7/gUGCKwfMmgMHm0tgVNgo06NSwiOUt6vI31s
        hyo2LHRl0p/GN7Af62wKYXqMrtxy6Tw=
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-ZNLBFaSyOgaGRSWf60g7Og-1; Tue, 20 Apr 2021 13:46:31 +0200
X-MC-Unique: ZNLBFaSyOgaGRSWf60g7Og-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h7YApRX77Pu662NGBfbk8n2jqmePAGkREWaT3EZMRDymaN7srZ2O/vfnIwdar4GVQZRJq0BiOqXRcRIq7jWKJgqDEBE+SRRbkVeESapx9flJjFeMKO0Gzea6cojXCBulBfF4GJdr4QHKT5arwT0KiScIbvx/HNUkTYoX3e0icf1lzhG4VMfT8hNRKZlz6KiuVtBjJf8WQ9SxkSnm/anRytem5CSsessA/PcSKZFWgWe4EulIQuqAI1wT5euHBtofab1y9VMxcPX996MK25xVeFzfmGo3cxTUY1OP6uo4RKctRsARZwzUPywu4SNICPf2h1Ah18MAlVZirLvHY1arUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Sa23WQs3NsEGBLTmg6WpJVp9KxgVeUeR2V32E5DXSs=;
 b=G5NmWNrilFaydDAF0jzsUmFRbDJNg1biD+2re/Iv6p2Z/kyF5dvhkBRSUsoxR5ftdaEx2+rb8uz0LLJ9VUMoWDdAfffwWgrXn81DCEB4SUQFUF753G2upJLgb0aN2pppCgqTTfQPBSXsxdhI8Rcg4FSwBcHnxywXE0NFx+6/9wazWGTSHSqXLkzKFQqTryLewQ28MCrGBJUoOmTdI2BmG4TzY9f1OmRvKx4Kxo/QPoaqy2YSoVQpJd1mbl2sGqAfhU+hP7VYlqKPqT8sMBdtgDDpouTC7pQrX9bMrwKEDwHaYw37x+mVzE9/IbVNOvut3XjHf16IP8xBYR+kyvVCFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB5154.eurprd04.prod.outlook.com (2603:10a6:208:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:30 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:30 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 08/18] crypto: rsa: Move rsapad_akcipher_setup_child and callback to rsa-common
Date:   Tue, 20 Apr 2021 13:41:13 +0200
Message-ID: <20210420114124.9684-9-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70643ec7-10af-4ac2-3e7b-08d903f1efff
X-MS-TrafficTypeDiagnostic: AM0PR04MB5154:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB51542A9081F93737A31DB32BE0489@AM0PR04MB5154.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:185;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NcvpiVK4rdAIQXfcDyRXtMWjtyeIrgPUeHyaYQFH6V7vmlOLTYAOvDZh++3T2IFuz6VVxZyD4JJ7Nu3eSYjI73vBnUaqb1ksKzQhu81U0xUE1mt1xFI0EdhBz5123Kb/3r2lfr8Y2BsTnhRLjwKAvTOEILoLUrf+V6G5+LlsxFNXxYWfPpCavRS9q6eoaKhm2jtdjYNsOumERlqOac5520pg1q/trj+IXDDFezlKiEe/R07dlAWqKCj07A9m1FjvJXdjVaFjYLsXVRyFr8rJhc3JLt5n7QxZgJvuddvDhSNmXCd5EbT/RKvl1SQ6aCel5Abi19y51WxNXo2zP5RFCFKv9Rsdto1XBhQCKCOwQ1eTTO900PCxcpNg75zqLWmyLV+YCaXFdbHMii0pOUTCLckPE/Ci91mnc0bYJU6sNT/iP1WdxpPq23H7OwlxEY2tEPqY1MxcEeZroXuJ1js2yRy+PDXg14CHeFHigtQhaIGXW4WxYiiY2/M345lvIUzd21fXddxU1zpilys27KKJmV5hSmR1P34I2+WM8eoJ4Sr0JrCKqUxBGIfOPB3Ji/BWTuDkUVVSHzz0g7UZTY72zKaq161WFNXiigcfwA3FnrArk+ZFjtbXoOYKTWDroLaC/vcMUqZnAxgzNCAKWSl+Ru9MFqVQKNviz5KcQH3vg38hm2vBQ+gtUXO1oy1tRh2Y
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(396003)(39850400004)(26005)(16526019)(86362001)(186003)(956004)(66476007)(8936002)(5660300002)(66946007)(6506007)(44832011)(4326008)(6512007)(6486002)(8676002)(2616005)(316002)(6666004)(66556008)(36756003)(38350700002)(52116002)(478600001)(38100700002)(83380400001)(6916009)(1076003)(2906002)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CoKouxK8AvihHDxD8Cv5avNb9qsxEnudJRp00cVcStA2plEw8XJtbdH9XRrp?=
 =?us-ascii?Q?jy+l7uYzZobnrR0g1TSiOHdaxbXVU5cIeF/42Hp5RkdO4RUKhAzcRfPIdIJQ?=
 =?us-ascii?Q?qnwEXZfTqO9pEOaMp3Gw4Pl94vFTC0zfvNHBbmllGDoJBDJz9S7MlImo0DFf?=
 =?us-ascii?Q?xo7uLUcjD4uAVlhDSt25hT/GGaCCkUY84vta5TL6cmcc5Sxz9uOkWBmddOx5?=
 =?us-ascii?Q?fnvrmgIXOjp3qpztCnkSaQx4j2kNrzgfvHes1IpHwfJ6aTMt0km0WePBtV0U?=
 =?us-ascii?Q?OnNuJ6Pr9VeqZXMYKiil+fkbpe1scP9jABZ4WPFzkKkPzYWvRNclaRKnDi4C?=
 =?us-ascii?Q?2A/82JRBCXZIP25WjpCZ6ZjUX8m03DVwNkf4UWvAjTmA6YYGOMmEvmujpApE?=
 =?us-ascii?Q?sszWsqqZWp9YRJn/tALGEc31oaqGGgyWhgunD2EjLpaawG/XKwVPX5u8W1z8?=
 =?us-ascii?Q?pFiOd6y6Z+CIGxkItfKQKwTcdaf0HiwCNYxx+SzLLMEu1t/5NqSW3Mowudaz?=
 =?us-ascii?Q?TBjs2MbGeASFhiof3bUCE+RcIhDH2m6sDKYhh1l3gB2lyjuZqDGHJ57K9jpQ?=
 =?us-ascii?Q?Sex0JPb38lw+NAXP/l/PE1IalEBfwt+F36wORvZ3/fbtHnHNpeho4OZN4xWP?=
 =?us-ascii?Q?GRd43rGcXmArgUHdWXRSN/xO314au7Tn9EM1KdrmDZoKG7IsK9bfP07MQoRj?=
 =?us-ascii?Q?cln8q26oHf94P8dT3LRMdlydFUxQt2sl0H6Ls2Q6vPUkGB2dMzIt1XN0QlxI?=
 =?us-ascii?Q?R+FvHary0vk9mqIIxsEy1Y3Z78isrch7PNCXNHhuvJ16FjZzgyqyH+sfTsJT?=
 =?us-ascii?Q?p0ooCODYe3YpetYb9/L6XDGJDUvKwpT94W9QAS7FGQh3Y/lJZh4JxkvarKmw?=
 =?us-ascii?Q?fc0w2ypyg0wFSXJsPKsQqEFp9xEkkCH2Tm50f1+OmAj8H4UIlc2nkWxzKRo3?=
 =?us-ascii?Q?92itfsIOXCoBh+AyCG3CJQtswxT0NAy+U5B5++NfjKaf3eloDUWaA3PkdbAS?=
 =?us-ascii?Q?VVsAkhfrWRdKb7fZ5DI2m7WQUb619fCE5IKYcnXkcTeBm+VAmskmw9h1igMC?=
 =?us-ascii?Q?/chWwtBqPmp5TFVZTKP5gV81926PtBH2gUWIGq1332oQfE5UndkfwSlCMeWf?=
 =?us-ascii?Q?qyuHS8KECZZUSnL3dzHizem6IgP5IkEvEEv2HM//eppPzaPgNkoJ5vutD1Nq?=
 =?us-ascii?Q?EN7lj3LTUIKd9RH8Obed7xgZdmLSjiwSwLFIl+3IdQCNMU4qJs2sWdju1rLf?=
 =?us-ascii?Q?bcUqlWw9C4ZeH4UbFrCiQQw+ydlFRW2j9COGgkPuWsLeHcFvWnwc+CrDcgj1?=
 =?us-ascii?Q?SMmujY8JARm4ThhbcE8zIIOj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70643ec7-10af-4ac2-3e7b-08d903f1efff
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:29.9169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPnBWEYDzKLHrsmlKLSvaXukTN3O7th+NZhWdfO4AFGS72Ykl/fjcI8n8+0p03+LzLiC0is7gG8NrRRvFyBoyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5154
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Pull out more common code from rsa-pkcs1pad into rsa-common.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/rsa-common.c                  | 31 +++++++++++++++++++++++++++
 crypto/rsa-pkcs1pad.c                | 32 ----------------------------
 include/crypto/internal/rsa-common.h |  9 ++++++++
 3 files changed, 40 insertions(+), 32 deletions(-)

diff --git a/crypto/rsa-common.c b/crypto/rsa-common.c
index d70d7d405165f..6ed258a782875 100644
--- a/crypto/rsa-common.c
+++ b/crypto/rsa-common.c
@@ -75,6 +75,37 @@ const struct rsa_asn1_template *rsa_lookup_asn1(const ch=
ar *name)
 	return NULL;
 }
=20
+void rsapad_akcipher_req_complete(struct crypto_async_request *child_async=
_req,
+				  int err, rsa_akcipher_complete_cb cb)
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
+void rsapad_akcipher_setup_child(struct akcipher_request *req,
+				 struct scatterlist *src_sg,
+				 struct scatterlist *dst_sg,
+				 unsigned int src_len,
+				 unsigned int dst_len,
+				 crypto_completion_t cb)
+{
+	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_akciper_req_ctx *req_ctx =3D akcipher_request_ctx(req);
+
+	akcipher_request_set_tfm(&req_ctx->child_req, ctx->child);
+	akcipher_request_set_callback(&req_ctx->child_req, req->base.flags, cb, r=
eq);
+	akcipher_request_set_crypt(&req_ctx->child_req, src_sg, dst_sg, src_len, =
dst_len);
+}
+
 int rsapad_set_pub_key(struct crypto_akcipher *tfm, const void *key,
 		       unsigned int keylen)
 {
diff --git a/crypto/rsa-pkcs1pad.c b/crypto/rsa-pkcs1pad.c
index 30b0193b7352a..6fa207732fcbe 100644
--- a/crypto/rsa-pkcs1pad.c
+++ b/crypto/rsa-pkcs1pad.c
@@ -9,38 +9,6 @@
 #include <linux/module.h>
 #include <linux/random.h>
=20
-typedef int (*rsa_akcipher_complete_cb)(struct akcipher_request *, int);
-static void rsapad_akcipher_req_complete(struct crypto_async_request *chil=
d_async_req,
-					 int err, rsa_akcipher_complete_cb cb)
-{
-	struct akcipher_request *req =3D child_async_req->data;
-	struct crypto_async_request async_req;
-
-	if (err =3D=3D -EINPROGRESS)
-		return;
-
-	async_req.data =3D req->base.data;
-	async_req.tfm =3D crypto_akcipher_tfm(crypto_akcipher_reqtfm(req));
-	async_req.flags =3D child_async_req->flags;
-	req->base.complete(&async_req, cb(req, err));
-}
-
-static void rsapad_akcipher_setup_child(struct akcipher_request *req,
-					struct scatterlist *src_sg,
-					struct scatterlist *dst_sg,
-					unsigned int src_len,
-					unsigned int dst_len,
-					crypto_completion_t cb)
-{
-	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
-	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
-	struct rsapad_akciper_req_ctx *req_ctx =3D akcipher_request_ctx(req);
-
-	akcipher_request_set_tfm(&req_ctx->child_req, ctx->child);
-	akcipher_request_set_callback(&req_ctx->child_req, req->base.flags, cb, r=
eq);
-	akcipher_request_set_crypt(&req_ctx->child_req, src_sg, dst_sg, src_len, =
dst_len);
-}
-
 static int pkcs1pad_encrypt_sign_complete(struct akcipher_request *req, in=
t err)
 {
 	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
diff --git a/include/crypto/internal/rsa-common.h b/include/crypto/internal=
/rsa-common.h
index a6f20cce610ab..4fa3cf5a989cc 100644
--- a/include/crypto/internal/rsa-common.h
+++ b/include/crypto/internal/rsa-common.h
@@ -34,6 +34,15 @@ struct rsapad_akciper_req_ctx {
 	struct akcipher_request child_req;
 };
=20
+typedef int (*rsa_akcipher_complete_cb)(struct akcipher_request *, int);
+void rsapad_akcipher_req_complete(struct crypto_async_request *child_async=
_req,
+				  int err, rsa_akcipher_complete_cb cb);
+void rsapad_akcipher_setup_child(struct akcipher_request *req,
+				 struct scatterlist *src_sg,
+				 struct scatterlist *dst_sg,
+				 unsigned int src_len,
+				 unsigned int dst_len,
+				 crypto_completion_t cb);
 int rsapad_set_pub_key(struct crypto_akcipher *tfm, const void *key,
 		       unsigned int keylen);
 int rsapad_set_priv_key(struct crypto_akcipher *tfm, const void *key,
--=20
2.30.2

