Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC703586C4
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:16:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbhDHOQ5 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:16:57 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:36979 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231977AbhDHOQv (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=96DN941Ef/gymzsqU9SPmXm1cdxD7+/+a/zlrCm7hnM=;
        b=i1fd5URhBaUHhxltNtFx5Mxl0m+/OiKyb5OBM97WTABlbj3s45ydeiuJ3ilyCO/ggAUTwt
        MuZtrrIJpU79uqUhLSAaSy5QY250tLvfW4yxjySgNQCCzudr0VfwZehOvr+6QVUYskeivv
        HeM17gVKhC80BT7GsFmCW8zEkLivWRA=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-Ft4tSEzDNbe_GsUI_sFm7Q-4;
 Thu, 08 Apr 2021 16:16:27 +0200
X-MC-Unique: Ft4tSEzDNbe_GsUI_sFm7Q-4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ecn/gqBFy/bFB0c9wcNA3mcKJXNdF2VEEKK9R3O4hOwrUvfHniOnAD4/8J/Lr0ataZfUmAaRVTZnQI5iRp60hs0LvU9vu5MnfHk7zNHKu8Fre2JLqN83XXyB5oDNVaLZ+K64FLmje0BaADG2uV8nrPwYU565kS5Ogfpq9TEdx/Yaibi05vwciTlC+jqeQ86bK3oNgnIKhER3BMfsHXSMhvAKIoQ2zi/L43KpG/egvfZ+uOF0nl72czL9EMLgAGEEjJP9P4l8NWIqD/4Avc1Laab3WuLJoiRAcvtLtNQKBYDnORGh2jIGLMVad7xfR6d1UhMG4nufbY+Rb7m2GDwJzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Sa23WQs3NsEGBLTmg6WpJVp9KxgVeUeR2V32E5DXSs=;
 b=k+Lle9JVsQkzoOAkPuPkw2CnrDxZnWy0uevWizVFntUcZAzIuyTkZvGJl51JlDbN5FHGuNYUsOzfRilWZQl1ikzKFukUIXAxzFqqzwnsRUXmnn6/JVUc9mbHaaDbDHB+PnRZSxF/VRZttzuYfYIDA/HYeoBRNvGK5cqofTOw9lcsVBGcCkRf3Gor7baYrl65H5sQybj15FvwEPH0r6xpwx4I7GceXYoz6IWqwaehnVI4scL5av1GatgyOc4vWkVsP6DkOgHQLoJgBUDlqvSBZ8VLICLBMAtR60mr6oFzQelUFD8I6lnm1l9ap+Kf1q/ZCLcufeLTX+fGdg/THhO/Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 14:16:14 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:16:13 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 08/18] crypto: rsa: Move rsapad_akcipher_setup_child and callback to rsa-common
Date:   Thu,  8 Apr 2021 16:15:06 +0200
Message-ID: <20210408141516.11369-9-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:16:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9a6d10f-5f6b-4e2a-f0d5-08d8fa98da56
X-MS-TrafficTypeDiagnostic: AM0PR04MB6289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB6289D2D12D054B6F4C86D03BE0749@AM0PR04MB6289.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:185;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ybx9oqeXHRlFh4GkPHKjyBAYerFOLC/BKtshcilpZmh41HvhgvCnb+h0DEw6qkLxjKSPgKUdmAshzMzrXzVXRTUg+jLWRjdOBIXhAU0nZtf4jmoP9NwRPIj0vNJNXV6I1kerky5mMmqmnWthbioofM17TqCsvG/LuklIsxDTWEVzns+Xj5MOE39CkIz133KgrO38lnAMkNpZsAFuatIGBwMcbFZwi36cAd07wPCFaQV5f1r3OUadHaOSA1RX7Z25LHQr8Q83g2s7LHdWRdKjMNJDn3kj+qrFBes/28aCdNkJdkSyE1j7/4flcBYfIm9GkHurVmgTQ0eOyrr+1azTewEG/01uzQDwGA2vhPSkuo7EeJdFuZkBx7RH07mfu7/AwufaWARrHGNjrjZHnCUxGCged3rLAUqIpv6ykTIPaEK2H4UtT1rqGBYmROIlx+0kDkIT2rf6o5ksKkwEAXrHdOIKqBBCg54/zJ59ZKbX6r/ZadW1UhJUOaz7omRdhZMqH7s0jxpCh2WMjXoaJW1og4vpYnpYaeuFNxQStUFYrwpl3t2z2SsEuONAWAUV3mt1jAun0SWKI4s6h8ylYec5akyaJCa0Ymq4HUOvMSlJN0xqqEmNfBP9ODFCP2WKhc/jiKpiZv6xJVSIJZSj/cYeFRNpRIoUtnhF6TKbgc7PDvGMMCFC23GXNA7yKq8mgovkl5qG5A9v9Ph9CxrWwSSWlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(186003)(83380400001)(16526019)(478600001)(6486002)(38100700001)(36756003)(5660300002)(4326008)(6916009)(1076003)(66476007)(316002)(2906002)(66556008)(26005)(38350700001)(2616005)(956004)(8676002)(44832011)(8936002)(6506007)(86362001)(52116002)(66946007)(6512007)(473944003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BW6WZiNYxD+8/YNcl2HxlD5rgJMTf+n8QLbNxqurDVHC97YeEa9euOClnwaJ?=
 =?us-ascii?Q?1ntSFJoVwiMG0cBGGqnLYbfYJx6n02wMX2SjNnSC+PuQ269hsrHK4TIsNmlq?=
 =?us-ascii?Q?QHn2DBm+KVwDRM1199jjQH+y1NDdQZkdi9lE17UC/19KTHIDFSdgym04chdo?=
 =?us-ascii?Q?QSoSW4v1w+Vl4MUVwqFpQIanTVb/cXcfqibBmgiRKa22juzBQjBoFzTebnxP?=
 =?us-ascii?Q?NDnwEbHFJmwVZa+vZyATMBazmAZZggpTwizVO0ffCALzbCwOSB07OgRckAdg?=
 =?us-ascii?Q?lXFUWi/mJXx4cBOChdYR040K0wSA9Dd8ZmKZZrN0b2AY/yDtPhL3rAsvwIF8?=
 =?us-ascii?Q?kFG7ubTZHE102njZHnbMOiZojv9Y4lDwZHY4L+xYfJw2ipnLCUTF/cpG+I4J?=
 =?us-ascii?Q?mONw9LwTRmVupI2L9UzHVMqHq/T4ME7x7a7OWhCDE6yvahEWV3dVfbkfp34a?=
 =?us-ascii?Q?kXn6aiyecqaasDVtKUPQIHMrjGdwvwx8nqmmjY9VPaCkgukucKpviXeG/CjB?=
 =?us-ascii?Q?HQe1oLO9zyHz/fUPcB3FhiladxqU7eRH3LKP8agyemkHwLXrzm7PcaSBPdeU?=
 =?us-ascii?Q?Xgv5F13zSfj3zpuLJ2rLm8X++MyV8y+TQ1oMGYO5SyW8V9iCCw3bf4RZ1NDl?=
 =?us-ascii?Q?vkMdO54cT7oYCeCQ4PMofI44cJho4BFwDV1jT8OZyQpEI1NOIYp4PzNrl0kP?=
 =?us-ascii?Q?OGSHUDS+5jcUnfJ45RfDxvqshhIWVDJGr/tCxqLwhhh3L34fXQAwW6L5TND2?=
 =?us-ascii?Q?wXeL6WDMrwrAkrMCEMXjSIBDSw2lcTNxBkSsAIro/1guYA26ViLwmaAkWC3o?=
 =?us-ascii?Q?13NDTcjClHOhSouohS5PbvmHuhwJRFMyfiThSGJmnuYuWkKgdR9ZpRXNYqqu?=
 =?us-ascii?Q?P1u5uGctVmF1I3sfw266u9Y2r6xHq+FFCRYgPz35RMc/f0x2+mNdacilOUtZ?=
 =?us-ascii?Q?Jhk8VeaaIe+pThWyaQGEh/6BjtldFWQlBLwIOaVtsWrkZuC72gSuBe4X0Nnl?=
 =?us-ascii?Q?MoALhBpuiT/crLQ2vevTFB/0qUPOokiLuYCZYTIUx9byepmRzXp+KWEZFY5K?=
 =?us-ascii?Q?TQbRH1zlKe/qwNPBPbxqGrMqzv+WJwQ84jzl+yY4nL37Ev5ZiLkltZEqYEV5?=
 =?us-ascii?Q?ji/fSYAxDLMCvZBsCBK8Y9vECi07EISax6NsqmEu4ZQLPTKZ9DN4JGSgu7Qr?=
 =?us-ascii?Q?DL3wuJkOoy0rawS+e6HtXb8S5fKKvhzhwJEMJhL4Vf6RzJM02PjWU6to3f8T?=
 =?us-ascii?Q?Wiq8CSXDYnZr547vJgsr9gYEXchpX7pKZZjfa9GNBZ58a09MoOWqeN+Uiv/E?=
 =?us-ascii?Q?iF0hC0TQgXWAKBz+LQt7y9eW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a6d10f-5f6b-4e2a-f0d5-08d8fa98da56
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:16:12.9499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DeeJmq5HYfTpzBBfZdrGZJXhPGQjS13ljawHDz5VcSxHs4E5NzbjniHJrhhtJChVTV0Lp8OTbAUDvBNDoGLJxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6289
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

