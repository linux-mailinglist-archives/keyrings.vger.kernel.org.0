Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6830F3657F0
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbhDTLr0 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:26 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:46817 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232181AbhDTLrG (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919194;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yN4wtR5jd/CKbP4TNdutXtmJHYMvPTYZO36/3uXm/FE=;
        b=UmdJMv/Sp6PoDD+IWkku4E9jctMsV8iO5srh6iF3x8dSmprmDvROTzz0gd2hvTVImF9IA8
        wO4eVZW3rUtLx+xOv85gL4j/DoMWi9I5cCtmdonux6fQwt6rszrPMj/G5usWamNVmhRTq4
        m/HmdAwddxXme4VgdQOV5FIjMI51H1I=
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2050.outbound.protection.outlook.com [104.47.1.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-15-Okr-ZIEpMUe6xGYplEQ4KA-2; Tue, 20 Apr 2021 13:46:32 +0200
X-MC-Unique: Okr-ZIEpMUe6xGYplEQ4KA-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ldQWksaQnvohsNRhSL/qWAbb328VsHn8pAjo1WnoQpMGP2P74D5/w5Vy4bH0vL1tNhSPjSg3g/XdSG8/OteU9uCB8/jH4zN5RRisnGHy1pzZnGAARw/XWC125S3Im2mKa4OtSVAMNpcEw5kSPgAmgB1e7lR//vgeXVx2/bU1lynZ8Om3QLBgl/1sLdlqxsknRaW0t+SqL27zxoGn9B47HHv/HzxuPgbJVZQ2zOjUQSxgFZr/rSajRQy3tmgdUCwZhPzhXn2RbtxGzr/S42CJcaLXWCoSK0R7Se61XpDTuFqvyOBW+jWWHgwf3duon1Huk0ueJqSiKKlQLGOGICM4Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8SkvN5sNCcLK7KC5Wzzfa3EoWG186cgQIpcgTHH+5w=;
 b=PpvtKY3ICkh8x+HDxLpVVc1FhPbn+ASAuOrvfaht+DH2BVvl6eoUlRa6jsWX995YVNBoJJBEQrBfLyNFEVNLzWcnF1im9MbfIxVI4suIfIGeWWL8vzpQTglPRlj7awclXTLpyXMv9vEnc7n42+VjDpLdasuZS+KhgmZYzWmnLI9c/Ofi0S92NjF65i2H35GQ2nv2Z9VEV/rReT0ZRJeu8juoGYzYFisrJscLYjBarlIAJ6XbQQupXMbYhplcGYbNQ52AFKbeOSM7bgQGtbFNgEwbgy1WVV+WWXDrWvpaacCgGXFxjZrB7EriIdJgvBUs1K51TnfB3VfTHfxCAyfkBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB5154.eurprd04.prod.outlook.com (2603:10a6:208:c4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:31 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:31 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 09/18] crypto: Extend akcipher API to pass signature parameters
Date:   Tue, 20 Apr 2021 13:41:14 +0200
Message-ID: <20210420114124.9684-10-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb38f916-5b18-4751-84b2-08d903f1f0ee
X-MS-TrafficTypeDiagnostic: AM0PR04MB5154:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB5154295EA4971B3D9A53BC5DE0489@AM0PR04MB5154.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: psIKbriYGsae6zUGDZ1kYHrcQTMjkLLLhcYED4o52q7D4H6bcO8LIXIehi6w98gw9jtpxmsi49LLexiFwUtx/QbIiw5RjUR/ywlZQUi87rn0KuSzolJYTWQYoBCXm/eOKkKYLmMUo3k9l6PZ+MkFO/q03alrLZNvFjPCTR9j0WwJwNTTXGI3DDi8CJ90izxHz0AIkBy+lAK9r37ZG47FKQHo65Fe4Im0urUI06H6IoKtRN38p+50ShD4c4rRCIIJMZGOOEOwqmoraqprk2sBxFBnqZgMykCQbXJ+7jAiw9qG2v8WKoipIfgySyrRqAYDdJ9TZjX/wSYz+ZxQTPeKto4JO5jUVgh41O8QGMWu83urC196dVGRQDRmgZ6GbSQSp75g7tmO1QSXnKIrG3p8ctTGF+aAkBELujj5wf3NK7OobovRe+sy/UcqaocAOunsugXXX+aJoQKdUWgvIMJdhc17/+4WOBInslj55FvLOLX+bAx6ejnsCISDfJe47Xu1ZL75VTAvS3NA/8tjSNYVWY5QcNPxmLly/vR1wp9jCUg1umS6A6MgFXmHpJxmUcTROo7EKmB9SuquWj5vEv4PnvRCx1y6ncP2nk02mmB7oN6G0FwV9d52PQMbDRFprfaJj+PX64lBsHHDd+pRal8ZsEbulqVUarrEP1yFuwrh6KU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(136003)(366004)(346002)(396003)(39850400004)(26005)(16526019)(86362001)(186003)(956004)(66476007)(8936002)(5660300002)(66946007)(6506007)(44832011)(4326008)(6512007)(6486002)(8676002)(2616005)(316002)(6666004)(66556008)(36756003)(38350700002)(52116002)(478600001)(38100700002)(83380400001)(6916009)(1076003)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?JxAnRyqQr4twVG0TSQMSuY2c/r6LS4Qiv7YGXwWW0EidRJXsynRN2x6PGbcf?=
 =?us-ascii?Q?Uydr6YZ7JUzaJUa/VEOfLm7F6X9hlGQzpiHp51A2dsrA0/cHwKYUMVGv2Hvp?=
 =?us-ascii?Q?fdifQk3xQzZX2BmQQE7ZP40FC9Cq7u0ddj8Vbuhxu87nx9KOZoTdkFzYLc9p?=
 =?us-ascii?Q?A6kIHyLxswycdGTMY63WxdMTTy0PZTNg+nvlmly2TgXAqRNl59aeWFs6k4Z1?=
 =?us-ascii?Q?1HMIqjpzED07nhpEctKRnpexJ3hVbwH7N0Lfq5QemABOpFRw7gOhdHT6jVbE?=
 =?us-ascii?Q?kyV7DQ2ygPM/2Tn0+a3AmPyhsNjzOGpqM8p1DTtgWvzu9FcnHlQspSe1lNFp?=
 =?us-ascii?Q?YPOhxBAJFVHsQ1YKtyuYKGyCYqcH6iBl+XhimmAsUHUtjT1wuTXo6w+vqqii?=
 =?us-ascii?Q?Yc78T/LN7CWb0RF7WRLg5U8pHJ1pNiG9TecxtugTqZ4m9V/xmlLiMPZx35Bx?=
 =?us-ascii?Q?FvAQ3xeegKGI1ZdxNVsj9ggOZlmNOcnICHU5/8Fay3IE/pZKs0tj3JCacZKi?=
 =?us-ascii?Q?JqrHxQTzuhoueTCzC2grlOtkIgsBz8J/44nP5Gg4SdD+qCcAeBqIilHcjkZY?=
 =?us-ascii?Q?0g71/5+Kpv2x5maLrnSk5UFTs1oM2Bs81oIwt+vhBOPHGOyO0qU3XY3ehPbW?=
 =?us-ascii?Q?RqvfvxKTQZjJIXeTwHNgLiwzqz5UP/1QD1IctTGxqaO/M6Ie6cwrc77oPYwV?=
 =?us-ascii?Q?P4u/b3abvaTZDSsiK2Hrt0l1ujUpDaE460jWD9UxHlxN2ma7Dx5Y2TKW+7IB?=
 =?us-ascii?Q?qoEfBrE8buxuo4xFMUqG/yu8h1DGDH0q/ZZbm+wD6Ym1ttNfCgUyT8UwuGfP?=
 =?us-ascii?Q?IbeNOYrpxmlUtaXq28d2R+magdBCs3ICzAgwrzpRkp4sZxrd7eQn+iICtd1q?=
 =?us-ascii?Q?WXqmpCtxgv4M2aY6fL0LFr55uRc0qb/omWMwUHcB2Ut7DKXUUXkNyNO+QIXl?=
 =?us-ascii?Q?muqpe6D4+LX0PpTLQtqWOzSEC6OLRc0BOzTksGm+6u4D+wy8u5VbM56qHWIO?=
 =?us-ascii?Q?ZAAnRplc2DdH1WhA7aWTvMoaFKhZsCxlXB4wasbC2cWnoGycfLb9w2jWnmy/?=
 =?us-ascii?Q?i6yrSZfTy+K9fXH9gOf6B3VEhk4qk+9S3WGf8XNGlX5Ntx4qcgF2NBCYHxam?=
 =?us-ascii?Q?hNgCyPzjheMj/65d+Bb5ZPRHDEzwS/IoUqFQN425yUzmrLUbslW/qPJVMemn?=
 =?us-ascii?Q?iNnhNPPVUUHrc79C2yUk0c3tfackypaDujWbIr0tBJop73Cdf4TobZwFZ4R5?=
 =?us-ascii?Q?t6vGezRI6ZNAUZzRbR1Z6LsOtACKsOMCNS0ujiPGm42nkiT2OYbJwULzmei9?=
 =?us-ascii?Q?WGm/h9y29Bp6K88yQX6sMxVq?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb38f916-5b18-4751-84b2-08d903f1f0ee
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:31.4940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M6R+x5TbUR1pWYgqjfIBF3u0Yc96Tsw9A1qMvsFbup+XDpuvSM6h+BUFq3dsbamizVYIyKllELZf/tg7pLPEPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5154
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

For certain signature encoding schemes (eg. RSASSA-PSS), the
verify/sign operation behavior depends on information contained in
the signature blob. Allow passing this down to the crypto_template by
introducing a crypto_akcipher_set_sig_params() call.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/rsa-common.c       |  1 +
 include/crypto/akcipher.h | 26 ++++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/crypto/rsa-common.c b/crypto/rsa-common.c
index 6ed258a782875..f80cdfcc1f9ee 100644
--- a/crypto/rsa-common.c
+++ b/crypto/rsa-common.c
@@ -277,6 +277,7 @@ int rsapad_akcipher_create(struct crypto_template *tmpl=
, struct rtattr **tb,
 	inst->alg.set_pub_key =3D alg->set_pub_key;
 	inst->alg.set_priv_key =3D alg->set_priv_key;
 	inst->alg.max_size =3D alg->max_size;
+	inst->alg.set_sig_params =3D alg->set_sig_params;
 	inst->alg.reqsize =3D sizeof(struct rsapad_akciper_req_ctx) + rsa_alg->re=
qsize;
=20
 	inst->free =3D rsapad_akcipher_free;
diff --git a/include/crypto/akcipher.h b/include/crypto/akcipher.h
index 1d3aa252cabaf..a0e8720294293 100644
--- a/include/crypto/akcipher.h
+++ b/include/crypto/akcipher.h
@@ -101,6 +101,8 @@ struct akcipher_alg {
 	unsigned int (*max_size)(struct crypto_akcipher *tfm);
 	int (*init)(struct crypto_akcipher *tfm);
 	void (*exit)(struct crypto_akcipher *tfm);
+	int (*set_sig_params)(struct crypto_akcipher *tfm, const void *sig,
+			      unsigned int sig_len);
=20
 	unsigned int reqsize;
 	struct crypto_alg base;
@@ -413,4 +415,28 @@ static inline int crypto_akcipher_set_priv_key(struct =
crypto_akcipher *tfm,
=20
 	return alg->set_priv_key(tfm, key, keylen);
 }
+
+/**
+ * crypto_akcipher_set_sig_params() - Invoke set sig params operation
+ *
+ * Use this if the verification/signing operation behavior depends on
+ * parameters contained in the signature.
+ *
+ * @tfm:	tfm handle
+ * @sig:	ptr to a struct public_key_signature to extract info from
+ * @siglen:	Length of sig - should be unnecessary if you pass the struct.
+ *
+ * Return: zero on success; error code in case of error
+ */
+static inline int crypto_akcipher_set_sig_params(struct crypto_akcipher *t=
fm,
+						 const void *sig,
+						 unsigned int siglen)
+{
+	struct akcipher_alg *alg =3D crypto_akcipher_alg(tfm);
+
+	if (alg->set_sig_params)
+		return alg->set_sig_params(tfm, sig, siglen);
+	else
+		return -EOPNOTSUPP;
+}
 #endif
--=20
2.30.2

