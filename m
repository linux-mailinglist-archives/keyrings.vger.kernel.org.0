Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90B883657E3
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232118AbhDTLrB (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:01 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:48462 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232093AbhDTLq5 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:46:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919185;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ocAazsLxY4QF9+UznNegPKeahTtK1vL+omwrBn0daXU=;
        b=dqORQmFPmO2nPonuDsVH+q3S53zVy/ABWID1dcoPqmlSbjxf2vtqcC41GyxtqRC8D6TvRi
        fPEw4PfotqRkXSqetTlFTrEqK/2+E218+aQK2yp1aEufXhbEKpqlC2cElk36Qw6HzIHRco
        9ptL7mWnHgO/bzhusprhSKW+jXCHDWw=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-22--rUv-S5HNHC72uLx6cJgVw-4; Tue, 20 Apr 2021 13:46:23 +0200
X-MC-Unique: -rUv-S5HNHC72uLx6cJgVw-4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kKGSguDMRpPHoo7DEeTlVVsRsXvcUHia/6PmYPvWWpUiIKgM51CVVBkFvXV1I0JN4GJK5QhUdD/WSY6U+MjWNstBn8sAYzmCKHVbKkLCRTr6iNjLstAvD/39YgAtkoTO1ejkyH6akn6ovSi+R8qpE5O1jxFfbrzMhABKu3SaFqWUoDHbTFBKWmU3M1l/pYO7MV2v8KvoD95oMB85esvhRqSPW2CSJBH0ws6GWC3z92BM1/97w0Yxay3gUeDJJRP6+Gq/BR6i+c5SttZkBJ3Rt7emgyiVt75w7mnHe54DQLRtc/W6E4mAcb4dP5hSDPX9skfDDjCbC7X4HQKywAkTXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYLADhNkUUMdivmEEQa0kCwOxggXebXsloq8B+dupUA=;
 b=lsNMetoOc6PGxTunlp/Ncr8I6T2zfSB/EJLoAhH5zmtxyY9yf4564icIl0usmmRE/QXAF2xtpNuagZKNbWprddZKClGyaHTcpJExc7g/+b/6m2Pojc3t+JColfCoPnBd6SnTIV4H0RJdt0rUvvFmujybaLFKAoyNuKNkDNjv07RmWXXTwgzKk9Ut+dWlqqrSq5SvVDmiXez4bBWpiIQgF8JUju5tjv38+hdMvuR1D44EaH21jDxrjgQN2TkkhKsV9jVqR56KuOe3KHOiLzvdlilL7fdMA7z1Qgp3GhyCbboz8w8SJJzKLIo9w+/uZKQ3vu7I5T/dGWN+C7CMOICWjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB5154.eurprd04.prod.outlook.com (2603:10a6:208:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:20 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:20 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 05/18] crypto: rsa-pkcs1pad: Rename pkcs1pad_* structs to rsapad_*
Date:   Tue, 20 Apr 2021 13:41:10 +0200
Message-ID: <20210420114124.9684-6-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e92b382-dc3a-44b9-9e1d-08d903f1ea58
X-MS-TrafficTypeDiagnostic: AM0PR04MB5154:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5154A01F26B90DFE213D3114E0489@AM0PR04MB5154.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0n6OYc8LYJUcCj8IW4Iv0e+spEfhpbl5skc34AkkoTiBugf3p98zv7nLZHMtVnjpucWDAMWka1ry1IPQ28y0rI5hasdoTelzlm0tT0ZC/CnHFfo+jvCueWAUuD/6Veg5xe/ZsqLHofHf/pwX1AwNt7803luITfor9UAIC/DmBMcWd7U9OLolI9x9HQoaBFiCoJFPzGuS06k2IjVBM0j2n7utvDU71Jsz6JVP6QDTuhUs3ZqWiD83wc6NVtz6Da/mCMO7lWLlvWSgQNWQnEs0Kxs1XFM+bjQWl8u6LTzhLOfPe0BcHHxNiQ2LVxlYXmUfddGbLiKMmMoGrFfRKK1bJrzIzkdidQQt7GZG9qM5DlgvyYtNqoaS7RO1mScFvdLiCYKvG1XV9zE2PWqT8+T6rALiVpKbGkJMu70jIWxB2Z7ecNSxThivVvT1k3bJbh0vOS5tjc9EgN0LkG2bCfht9fYn5e6FI4xlz49iI3TmkWHxRVlZTG2c9SyUJUF7b2gO45NiqX6IYkTbmG/P1p2EagAx1zfgClkHwEFDzGl+B7+f2EFJznTggoHOU+AUzq4fOcp6jq5EyBmxZPneJZ5q4XGbAuM9fNv4QH7mVPtQNaMtYm7HVJCcEVn+Cwi/AfFyi/k88PHBXQOLkVKM4hQeaLLsySgR+VrfBrdT8g4CNNE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(396003)(39850400004)(26005)(16526019)(86362001)(186003)(956004)(66476007)(8936002)(5660300002)(66946007)(6506007)(44832011)(4326008)(6512007)(6486002)(8676002)(2616005)(316002)(6666004)(66556008)(36756003)(38350700002)(52116002)(478600001)(38100700002)(83380400001)(6916009)(1076003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TtUwg0NqsnZxS8BKvBDLyB6VmFfZFiZkcKXSKVmWhkrIURWHIMpc3EzBdIT+?=
 =?us-ascii?Q?JASv8QGUcQ7RTMhbY1FNXh7Wt49c2RdBxZ5rXyKU7aYoaxpn2f9cb8wEnQ5r?=
 =?us-ascii?Q?gfZrvV0aYJK1NshZaPh3X7mgTBDy+/JHegfxLaXLeeslmiaaEsLluUMRX3en?=
 =?us-ascii?Q?EQvbpb4Gb1IYe9/L21gbKwlSGBTauDy7Ye4ozGrBSRTMzwUe55pdQ5yjJx9r?=
 =?us-ascii?Q?Z+bsgzKpiCR/qSBU0vw3bBvCb0pj3ZORbBJMuWN9Q+SCqvylcqYrSdFuIq5h?=
 =?us-ascii?Q?T8DhtTJMu4WVMCoRxQY9fyBAjKyJBS0HLxXD/ewBfYcsP+CM5ZQplTbwSpvK?=
 =?us-ascii?Q?eFV4J6NFframfNGdiH+mHi8XSRTit4JTlPpHQAB8QiQAkysuaHtfwWt13m7Z?=
 =?us-ascii?Q?HVrtpSg4liEjv6tJXlOYPAUN0dlJSRguxGgyPKZ4q01129PzTrumwrEoYKGO?=
 =?us-ascii?Q?rMHiZuMU+MqRiTjBoZxmPsaHbwZyhyVP8Ef3ZKlwERogOOJBzid5+5BxShVn?=
 =?us-ascii?Q?MqYdKR3rNzOEr7HvcmhXTMxsPD8HHSqPnc+Aa5qPDu9eSa6GgPXCdHHZrCFP?=
 =?us-ascii?Q?h4Y8O6/6bZP9vNxxyzQV1bRDguSUFqKSp1MdNzlhyR6rzoxhremX0XvZsMeJ?=
 =?us-ascii?Q?xRTBIkKCDViIlOYntYmToxRqR0OUjgjcQHZ5H8RsRCc5MnfGSXu52gwz2gud?=
 =?us-ascii?Q?WOZs8qlksRZCS62liLYYWucv0pK6djyLeltSaEdix6b7pbaiW47Bm24+s33+?=
 =?us-ascii?Q?nb0ascIpBkrnSCBwUXK0G3mexQv8KfW/e/aXjftFE3ZYIH77AuB3UMeuLcee?=
 =?us-ascii?Q?NtYs/3sou5egrptkx1Bn0R//T+N+iHquGqpo0MZqcXANGMbA+YTzIwFjXB47?=
 =?us-ascii?Q?5kLgrBaGqrZGsEFd63HDJftYgO3XfygdOWey4wqe3INHWf1OR9Wix73tovEt?=
 =?us-ascii?Q?+xSHerC5uYNrByg7H7RIweLbHO+31Iwukj9BZo6+Ci6e0JtZ2RobwMYjVUvM?=
 =?us-ascii?Q?zpHmEZPTuQ77sm8QCUCIuvuZGZwKBEycibMYfRnwIEo1Gojws63nkzYvOcqK?=
 =?us-ascii?Q?QOrSnCujn177L41LECVtaPP0WkgPPexT+0oiZMTR7h3EOBV4EB8qYP9pSh3P?=
 =?us-ascii?Q?ls3msMRBF+XIHuBYr1RWTdk3q3jl0hmInIqwmm10UeTFnMuVQ55R4cB0X3lM?=
 =?us-ascii?Q?wbRrGFbY/W560/kj+48d0GsD/57i840/1ImAsmBTKomwIJCw21PN1YmX2Jez?=
 =?us-ascii?Q?0spcZUmKrq6WQlIxMJ9zmBGDRJOlcm93OogVMOAVe/pGlzcVTT70RoxqYVMU?=
 =?us-ascii?Q?NN2UFyoZzoo7pMtceD9wCzTv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e92b382-dc3a-44b9-9e1d-08d903f1ea58
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:20.4542
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /JIjLQSfN5oIzdXNfpm4hGBvUkltwIl9BSzNfm0Ph3WnBex/vuJ7Ez8ARFBgSXwWOF/HFZG3HnRm+Sx1gYJdnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5154
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

