Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 666273657FC
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbhDTLrf (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:35 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:30919 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232093AbhDTLrQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919204;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=URAufh9G4VgN4MkCX5Z/LjG4n/IsUcl/tv9wamHX41A=;
        b=eQfFNuqEiLkjJZLWVhwuxhNnEAPIEpCVQAMK4qQqfdr7u5EcLFRNfTMneEtHBtUSPubRzN
        +gUS6Aii7OKSNkaOwvmb4DQmM8DgvKX7qAxnXct50+lA9bEWmysUdyHT4Ur2Ws73fYukqK
        EER8AlVsTgj32fQL5js6ERbdGRr0eFI=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-vVbYYK7PMlmetb-zxZFBtA-2; Tue, 20 Apr 2021 13:46:43 +0200
X-MC-Unique: vVbYYK7PMlmetb-zxZFBtA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F7Xtrp8OmqSM4e8G1m0Px8z+flbmhsyR1xARCYb3KGMVjEoWR4WoX/ljk8NK8Aqqj8hkNs+MQd/K40On5VbVq4HV0QEb76cDThmtaFM4fOHfTuTSsj0ngmzslW15zTOcVcFZDmsIrGHCKuQIAqXNuY21uNgzaXxaot+CAHtnAY2JJ98XT8QNKm17+RpRi5K7F1/iU0N7dlLbrKjp3d/9q0f7oj26rjjv4lkkx+9pkiNZGSHVw+fWFGvaMI/58VhqQpl8rRsh3Mosp3S/2XOadGiZX7QPP1g+a1ejKV9P7HH2bjgPGRheEv12X1GEwTKXxHbekeTJOBj3gPcVvaAY0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPPUr1yJmykEATN97PtEAMe5qXCY3900ZCoRjV2kMuE=;
 b=l7Upn+3hPyE795mC+CGg9SJLM7QkZfzXe4srkU/7IYoL+cXjAizR77wJyRwaUrQ8AHKkW/w8TLBi6Kz3GRs7f9c/uvwaHs5ZlJxcVAELkqA8Neb6fQ8Alshw/+WTPm1C++7H3ygDS4ZrF+1t3JmLfD3eYg8H5jq1Y4GCqunVBV32DyQbgOrGWE6/OhLGO2+HeXn/IU0kOgO2uh9esf3vHVWJ4vjSo1poNhNF9jnVn7gvZdBjmVVawSyS9nkYohZFCJOptuY+D8E10M0LOtA5zslgr7Ey0Pdd+lg4IR/YvmlfHzgPemUrSLvrCssmAKK9HBPVBfiZ2HTJZXnTSYbuRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB4995.eurprd04.prod.outlook.com (2603:10a6:208:c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:42 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:42 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 15/18] crypto: rsa-psspad: Provide PSS signature verify operation
Date:   Tue, 20 Apr 2021 13:41:20 +0200
Message-ID: <20210420114124.9684-16-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c25aba1-7e8d-4722-eef6-08d903f1f72f
X-MS-TrafficTypeDiagnostic: AM0PR04MB4995:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4995572275A1D03F755F941BE0489@AM0PR04MB4995.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:332;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LYmnkRO+0+kfz42zli0VnuHJNAQk/mf9Zz4imR0lEXblu43xyDujFz+eQZ3G14luGtKbAKfmRlW0+cCTWsswl6Rk5l3iVei5wHxPekojL5XiQP8F2KIKGGjxwGIy11Khn9grf9DSYIVx4v6Ov8iapFnrppotdTWyMuzcevyjLuP3FQNUHio/Yvxif1e8DZ0UIEcLCMBSjyhKYLkWOA1OF2Ygjztd1xs5qpjB5STA6iikYK0CuoLfr/k7M5WhEdyPX5oArAwAPoeaNpyJ/rCgb7uIpWD3flXaaVmzKtqjOJ0TE8OteAZDU+985Q7QbRFibTseXcgmJhPXbVPO4aBZD90obPJA+EroS13YhmPU8EoKWDYsw6GqdLLAd++F9nkfc4HXy+q7vmYdd9vBtMlyT0CYkldyH19d2TFf9hlu+n5aw9qspMw8o1o/nYTr/n7eekwZeH/RHhJz2sDMSB2txAEvO1fq5t0IUn1pjUnXwWgrCwgxY/og0BO8tibTnDh5ca7w0DwicXuGD+OjuHq7jU5vRzJvRKTgRzjy1SbCGer4xKLyUxQtGXhtO/cTDYM/er+2WpyRcAQmouxm/Pm+E+T5V0DWaxtHPIYt3yCi4SRO6Wp58SW6MQCMRzYFcKjkS9kzudRIiXyY/N3Vxn6ChVBGE+ZDiPNDZdMzpFmELe+/g5M17sB2+XaFO31UpAJHXbenfPJmJ8gtB0aHB4OZ0D1lo7foc6UZr7aIuQ0GN5I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(39850400004)(366004)(136003)(316002)(8936002)(83380400001)(6512007)(6486002)(52116002)(26005)(956004)(6506007)(8676002)(16526019)(2616005)(6916009)(478600001)(44832011)(4326008)(38100700002)(186003)(2906002)(66556008)(86362001)(66476007)(38350700002)(5660300002)(66946007)(966005)(1076003)(6666004)(36756003)(15650500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8Y/PYh2hxBpyziAxMBMp1L5F1He4KP5YxLSdSzsszyU7AMby1b4QjPRstMcI?=
 =?us-ascii?Q?ZxUX6YgKrvmlRsme1luBcr4ym3yeRU12oD59sxRqQZdaGuWyhoHqBE2PDiNI?=
 =?us-ascii?Q?E/UysOWKhZZvWVuOB6EnBL9pzlBHubuIXHtTJpxxfiWOZHjOpkxjK4uy3k2E?=
 =?us-ascii?Q?FvTCYncttaUYDSmBuKHMnKd0tBGefNHi/Dh3QpKze3xvYuIR3wVK3mfk3kQe?=
 =?us-ascii?Q?0DkHz9ar8DYnvWFpZiH2K97gfvr+FxFl2Q45XaHGlbMcTtwZIGfqCenEDCCO?=
 =?us-ascii?Q?+clBfw4N5bJCl0aQMDGW8S+Pxbe6Hl+gKPqaptAjvrMcscCbQSgDyLOlSzzw?=
 =?us-ascii?Q?SRxJYDfThD2n9920PooAetM8LDqJCGyG1L1Fk9Wq1FkqCq5qqLgbLL0WntcY?=
 =?us-ascii?Q?ausQTSVLHtsu9P5ANxPuzsylNtAm3qfcbgfSUGQ03MoVcxpc+4Y4kv9I1py7?=
 =?us-ascii?Q?ihCXUS/8S3a7beC7DVtmmh9Gpd8K2otziv2YH1709Cz7vS8zSfmhI0pvQ6px?=
 =?us-ascii?Q?A1xfuVIhPJm7z2PpGRDU3qQ4UPMFQsLCYvmRoYwpTz8OIojxJrUpDYzgcwaN?=
 =?us-ascii?Q?OBooTwby6Jo7aA12LW3Z/6zj6l+/wdNQpTb/h7PuWR/Hvz2ZeWu3fs9kNoF7?=
 =?us-ascii?Q?6PgybO+O8PEgpihaonL3bFw6o8Pida6ym3CDTyOpTnXAQpE8s3sQBTaJ+eqp?=
 =?us-ascii?Q?+brxe4A9C+9sBSQjRKBdFvDR4mOo8bfCv62fcKUUSFzTQEaEx7e2qamJ8JNt?=
 =?us-ascii?Q?Zpx9Qbw3a+O952G/ajefwRiePdRZqZR3R8+efEpa88umLs40eQV1QFNyonxj?=
 =?us-ascii?Q?dHRDioBzYc76EWuc7pS6hKqTRakaX0f6byLigG+B5NNuQwiR4Q6pr4M359iD?=
 =?us-ascii?Q?fGGbNmECq6zN59S9DW9taSdvSP9VmCrdCWVpKki/aXTEx1sn24Azsy31SXqK?=
 =?us-ascii?Q?/poS4ENao0RRpRRZVMrEvM/TqBvrt8u0aXdYjpuA3Koti51wo57sJMLXeOJA?=
 =?us-ascii?Q?l85sfSfifKm/H1dFNe8TWcjCdAIrpLwpWa8i70p+a9DCVbciqVs6fmkw0hpa?=
 =?us-ascii?Q?FKGH/NDzjBvsRFanvrU+AEDz38oCpKepg0dKKiLdMwDuqTIjVDGqI50lSgDV?=
 =?us-ascii?Q?WEc5oaWuiytrQ5CDlSjU03Hdsbm1L/8UnbGQnnOeCHTDTVTyje99Yg+jk82Q?=
 =?us-ascii?Q?Vz8VbeDqd34QGzPFsSKf1eYwdj1kIzS2I1ixfjGeDq7TOxDDaRjJG4VFpvRP?=
 =?us-ascii?Q?h+uxkZj0ekip3I+LDeM+YZqYSZBL63tndEQdqQGzqlJEnTZ4dPB5RvvVrV2z?=
 =?us-ascii?Q?bi0YderpJo8TOz2NFDd6cDQJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c25aba1-7e8d-4722-eef6-08d903f1f72f
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:42.0320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: toRBzf53l1Ox+jlGiC1lgEIy4YdR4Aqr8MLrupfwx5RN+1ha95xV53NodKAmDAzPwFsesdcerObvyLBaonK6qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4995
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Trigger RSA transform on the signature being verified from
psspad_verify, to produce intermediary data which will be handled
in the psspad_verify_complete callback.

Reference: https://tools.ietf.org/html/rfc8017#section-8.1.2
Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/rsa-psspad.c | 53 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 5 deletions(-)

diff --git a/crypto/rsa-psspad.c b/crypto/rsa-psspad.c
index 990c2cda552a7..4e8525d89172d 100644
--- a/crypto/rsa-psspad.c
+++ b/crypto/rsa-psspad.c
@@ -124,7 +124,50 @@ static int pkcs1_mgf1(u8 *seed, unsigned int seed_len,
 	return ret;
 }
=20
-static int psspad_s_v_e_d(struct akcipher_request *req)
+static int psspad_verify_complete(struct akcipher_request *req, int err)
+{
+	return -EOPNOTSUPP;
+}
+
+static void psspad_verify_complete_cb(struct crypto_async_request *child_a=
sync_req,
+				      int err)
+{
+	rsapad_akcipher_req_complete(child_async_req, err,
+				     psspad_verify_complete);
+}
+
+static int psspad_verify(struct akcipher_request *req)
+{
+	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_akciper_req_ctx *req_ctx =3D akcipher_request_ctx(req);
+	int err;
+
+	if (WARN_ON(req->dst) ||
+	    WARN_ON(!req->dst_len) ||
+	    !ctx->key_size || req->src_len < ctx->key_size)
+		return -EINVAL;
+
+	req_ctx->out_buf =3D kmalloc(ctx->key_size + req->dst_len, GFP_KERNEL);
+	if (!req_ctx->out_buf)
+		return -ENOMEM;
+
+	rsapad_akcipher_sg_set_buf(req_ctx->out_sg, req_ctx->out_buf,
+			    ctx->key_size, NULL);
+
+	/* Reuse input buffer, output to a new buffer */
+	rsapad_akcipher_setup_child(req, req->src, req_ctx->out_sg,
+				    req->src_len, ctx->key_size,
+				    psspad_verify_complete_cb);
+
+	err =3D crypto_akcipher_encrypt(&req_ctx->child_req);
+	if (err !=3D -EINPROGRESS && err !=3D -EBUSY)
+		return psspad_verify_complete(req, err);
+
+	return err;
+}
+
+static int psspad_s_e_d(struct akcipher_request *req)
 {
 	return -EOPNOTSUPP;
 }
@@ -133,10 +176,10 @@ static struct akcipher_alg psspad_alg =3D {
 	.init =3D rsapad_akcipher_init_tfm,
 	.exit =3D rsapad_akcipher_exit_tfm,
=20
-	.encrypt =3D psspad_s_v_e_d,
-	.decrypt =3D psspad_s_v_e_d,
-	.sign =3D psspad_s_v_e_d,
-	.verify =3D psspad_s_v_e_d,
+	.encrypt =3D psspad_s_e_d,
+	.decrypt =3D psspad_s_e_d,
+	.sign =3D psspad_s_e_d,
+	.verify =3D psspad_verify,
 	.set_pub_key =3D rsapad_set_pub_key,
 	.set_priv_key =3D rsapad_set_priv_key,
 	.max_size =3D rsapad_get_max_size,
--=20
2.30.2

