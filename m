Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B0F834F240
	for <lists+keyrings@lfdr.de>; Tue, 30 Mar 2021 22:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232802AbhC3Ub1 (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 30 Mar 2021 16:31:27 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:53910 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232698AbhC3UbE (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 30 Mar 2021 16:31:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617136263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eYB76umgftXzIzTxgCT9UWRo+Rrcqi57VJ/bps+IU5I=;
        b=FXz8iNzmOHlrAxd/JVVFG+wT5cIYV5lFlyBcok4FW4FEk5ULQOvlXKNZ30yuhojQMusJPG
        b37ITu6TrAYXM/j6xHtdfHE12e2yNrYe38iMO7+wh8qOxMzuu39vXJXsdNRsYKVamnriDo
        eXiZ1kOrv+cXAkadawr328AUZMRNYKs=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-fZTKmsXlO3S83kwIq_5Qzw-4;
 Tue, 30 Mar 2021 22:29:50 +0200
X-MC-Unique: fZTKmsXlO3S83kwIq_5Qzw-4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GS5u1sM7/kJfvA3ABM2ZIf4CsNNMIdTezj2VUYJGEdoF1Bl3FO/fi08aoo7f+OQBmqijsvxELWaBU9Q8UhaHCJanHkEfGR03ryIs6KGT/q5vTMPS8KUZjwcZpXg2uCn99pSO1sbyAI488d2gWX8LF/hbf/M82Tk5TBynRXJS08Y70oeta/FmvZPR9XSF/VqnCM+uo42CvmpNBq7u6V+WSTPzMCo+YkY8Huy76TiFKGpKDsinauYCeDoyNRYQ/jDNb/cCW5UyCT1PUqpxwdCc8abCpSvt3CiTkY6gZovOOmSIg82lWohdoGu73j7FBxm+yZrnkaMAPeqQ3UtWlazLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AsVzAqmtMgrcub9RNoaTFnQsWtFf3tkKDhatQU8Kmds=;
 b=JHA2pF/qGwr4Ws5G4PxHOY0C9yXaSYVJwcA/z1xBFB8AI0eoJW/Um4Go9k+oAmWhL9rvdkS61nLhYtqhVMSI/CWrAFPeKtgKDjmVZqW1d2E5YOZNMYXI4eydomOhQ/5chfYsNTq08Pqk0T+GW4Y0dMUjvPa/YBr3aOHLSIf30cQGXosw6N4tks28SFZB5NP27WyRl5Dyr6Z40E3yyc9UCD12e5dhFE6XGmTminAqvThv7SN7oXyyo3gqd515r9dtN9yoTDpOpC/l9qtXof0RkcRB5IDy2e0vcf1LSVtxe556MgoD27UABqbbUAdOye6EX6Xi5J2nMA3GNVOt6OlaqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM4PR0401MB2321.eurprd04.prod.outlook.com (2603:10a6:200:4e::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Tue, 30 Mar
 2021 20:29:49 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::40bd:b7d7:74a7:5679]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::40bd:b7d7:74a7:5679%3]) with mapi id 15.20.3977.033; Tue, 30 Mar 2021
 20:29:48 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     Varad Gautam <varad.gautam@suse.com>,
        David Howells <dhowells@redhat.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        keyrings@vger.kernel.org (open list:ASYMMETRIC KEYS),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 17/18] crypto: Accept pss as valid encoding during signature verification
Date:   Tue, 30 Mar 2021 22:28:28 +0200
Message-ID: <20210330202829.4825-18-varad.gautam@suse.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210330202829.4825-1-varad.gautam@suse.com>
References: <20210330202829.4825-1-varad.gautam@suse.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [95.90.93.216]
X-ClientProxiedBy: AM3PR03CA0066.eurprd03.prod.outlook.com
 (2603:10a6:207:5::24) To AM0PR04MB5650.eurprd04.prod.outlook.com
 (2603:10a6:208:128::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xps13.suse.de (95.90.93.216) by AM3PR03CA0066.eurprd03.prod.outlook.com (2603:10a6:207:5::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25 via Frontend Transport; Tue, 30 Mar 2021 20:29:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18df6bb2-4e77-4901-98f5-08d8f3ba9083
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2321:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR0401MB2321881A707959C89DAA31FDE07D9@AM4PR0401MB2321.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IYnvxXSRHNUWEJ1rFfCpmdw478f/4J/PrhBJkf/NGUrkmyAJVvm5LLsnvYTjLujwyGDXIYq2kMg20EFq2BqJAno7OXbfM5pRfXT7b2SHwIA7GmWtEcnDsibww+5R8MOak5vHsC5l7ADtcCcrH6FoE86CQkuhwVYV4ih4srxhRFxssEAcXqkWvWq/gcrkv8PNPveRM3U5J5RFTWkPW4kD7HCJa336Jnp1kJQVj49UHzkgdpTm0KqttNKc074LxfItA8gPqeuWtgSr1rBFaICfxnsWYytxi4wBeRhPfXBAMXEWYq+KqDgq+jVq6mGpPgt8z5/vEpXfbD6VbD6decboMo2vwFjK9dujpC+O9uKJAOVgGGm8Wk8bDaGq5V+/WXVbnFx8nXCRo0J3SfqfYBYGTjTW3wH4W8yhL+9Uw3xiAjQIoow9m5ZzmMcXPzn/VX/jECANmQyUr2/GuXUvk8Rg9Te3BuLtMwmXlgR6AehhLXKy/tOKhxKdVMFq1ra0sPbcLIxrbutNjZlltPhVL2Wa9OstuR9qlJ6ygovaH5DsBEeum/hkqmd6LA3U/t7ZUKpbCpVFRFrXmsrFNVAllSD3BfXX+rYLp56/p2A61FvkKkkgPZZrP0tGXKdCP5U1NKfmSGKfu40cQsPEejmllUtwqg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(136003)(376002)(366004)(39850400004)(478600001)(4326008)(8676002)(36756003)(186003)(6916009)(38100700001)(66476007)(26005)(66556008)(8936002)(6666004)(66946007)(5660300002)(86362001)(54906003)(316002)(6512007)(1076003)(16526019)(52116002)(83380400001)(44832011)(2906002)(956004)(6486002)(2616005)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?kbUOK0+NmqcGwcnCPnxw6P7Pno+kyA8LZO+kNZk0lBQ8EMzLK21r7B8gm1rc?=
 =?us-ascii?Q?lPgeRoV4tRgCjDo6ViWUGYaUgU99WOcPHnTxjZJrWaHn1EW3vcooXsOlmaDP?=
 =?us-ascii?Q?INIuKvLMIeaEBmHe4gdb44YIYUO+rUZBqnJ3U78/hOczHmaRj/U/KZw0x2Ev?=
 =?us-ascii?Q?jEFswke0olEwAv6U7RRYI6egXKWj8fOtqW0kFzOInVNrszECC94DRiiBtCF8?=
 =?us-ascii?Q?UUFzVJ0wXpE7bZPHHtjRSF42vJb56s/xHJSm8SzIfsqojsMP0ZO2L8Nn4vSv?=
 =?us-ascii?Q?Ysl2njCYuWf3Y79S+nmlMFaGDRnK42CCwv+5ji3G6Gq0KlCS3vMSkphYyedp?=
 =?us-ascii?Q?Ex1onnOIIE3xNjh3CfY0z72LH1AWUlFPpELZDZ68CFSHqDt1+wt060ByViWN?=
 =?us-ascii?Q?i2V6y9ux03Xx5Dt6luPOxSzdc27JjwUzImQEhvGOSVP3zKYF5faO8mV/rwsR?=
 =?us-ascii?Q?W/mhViYGxtAc0KCMpeGLASj2G3f+2D8auNEjudJ26As/t1JiH8MAJVTizU8G?=
 =?us-ascii?Q?UgBIacmBEwtXNOuOy6O15z8KpWG0hrlCwZsVQdOznwcKy+xss07+56ebQlKR?=
 =?us-ascii?Q?7EFWTXG+Juc/3F0XOjKG0rEc+Gnz8PZJkGaUb4Qfdp6JB8vRPTyH9gdOh5C6?=
 =?us-ascii?Q?HIwBlVhAGrnPQoWFDc1IzvZ4nkVJ/MwxmAPPW24b1UW/74AIsUH6cHWf30aZ?=
 =?us-ascii?Q?VdsQxaR12cPJNpydvf/wHyOTmocgTQbp5bVNmVGkxIxEymEtgjZYt0EHmzCY?=
 =?us-ascii?Q?IKeHkU5Gk4i14Scf9nDybyCa3PH7Ccp7q5bCXp4D1SgI7Yxyql0BOgiRAqgV?=
 =?us-ascii?Q?C19lMkXFEcM4UaT1D4237hbMdbMLyGl230LFLdW8zqBWdCoqaZmx6ex/6N4l?=
 =?us-ascii?Q?UC12kMdRIoMWkWTj9VN40UnyXPejiFBOC4ZP4qEVO8PzHKHgXzgwyUysAyCY?=
 =?us-ascii?Q?81+2PNnKVrFco4p1yhfQn8aqtbT3cL/lhESB5Q6i4UZA2LLZCCRoiRpqoaxw?=
 =?us-ascii?Q?AYLzJXzhgmklKRBxx3YUTzN1KcWtu0zXNV6/rh0Dzg2l0RcZyYkhPybugnIR?=
 =?us-ascii?Q?kLL4l410FpY/b0X8TTT5xHNHcEuaSaudxwvwcQP5vmkPPxKfC//tn0liN1hh?=
 =?us-ascii?Q?XVtJIo6jkoDaaCeOpAgHWvzBLR76qbU4/OGtTIvqtoXVj0bFtAODGi9pR4Vw?=
 =?us-ascii?Q?FdmpZH/sKu3jWX9tuLaNEFSlDiDemPzsqK7CqNyj+P3OatjP4mgTDF39qqt5?=
 =?us-ascii?Q?HPxY3Bi745LyTM5MElV1tu2iqBb65BHWJqhJNf+AUlZMTf3gn1YHQS0Vy+oQ?=
 =?us-ascii?Q?5v6lLYnnwRbyr1mfZr+2yPee?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18df6bb2-4e77-4901-98f5-08d8f3ba9083
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 20:29:48.8684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qmHlKAqitXlxA3EpHb2lr+RAQEJRW2goDCc7vVSVXUK1KQ5yE8r4qIx2qi881dLqPPr1WPwXLqiilYmJc5CEqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2321
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Accept pss encoding for public_key_verify_signature. If
CONFIG_CRYPTO_RSASSA_PSS is disabled, crypto_alloc_akcipher will
fail to find a pss backend anyway.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/asymmetric_keys/public_key.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/p=
ublic_key.c
index 788a4ba1e2e7..b9cc83ba7a12 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -69,19 +69,20 @@ int software_key_determine_akcipher(const char *encodin=
g,
 {
 	int n;
=20
-	if (strcmp(encoding, "pkcs1") =3D=3D 0) {
+	if (strcmp(encoding, "pkcs1") =3D=3D 0 || strcmp(encoding, "pss") =3D=3D =
0) {
 		/* The data wangled by the RSA algorithm is typically padded
 		 * and encoded in some manner, such as EMSA-PKCS1-1_5 [RFC3447
-		 * sec 8.2].
+		 * sec 8.2] or EMSA-PSS [RFC8017 sec 9.1].
 		 */
 		if (!hash_algo)
 			n =3D snprintf(alg_name, CRYPTO_MAX_ALG_NAME,
-				     "pkcs1pad(%s)",
+				     "%spad(%s)",
+				     encoding,
 				     pkey->pkey_algo);
 		else
 			n =3D snprintf(alg_name, CRYPTO_MAX_ALG_NAME,
-				     "pkcs1pad(%s,%s)",
-				     pkey->pkey_algo, hash_algo);
+				     "%spad(%s,%s)",
+				     encoding, pkey->pkey_algo, hash_algo);
 		return n >=3D CRYPTO_MAX_ALG_NAME ? -EINVAL : 0;
 	}
=20
@@ -363,6 +364,13 @@ int public_key_verify_signature(const struct public_ke=
y *pkey,
 			goto error_free_key;
 	}
=20
+	if (strcmp(sig->encoding, "pss") =3D=3D 0) {
+		ret =3D crypto_akcipher_set_sig_params(tfm, sig, sizeof(*sig));
+		if (ret) {
+			goto error_free_key;
+		}
+	}
+
 	sg_init_table(src_sg, 2);
 	sg_set_buf(&src_sg[0], sig->s, sig->s_size);
 	sg_set_buf(&src_sg[1], sig->digest, sig->digest_size);
--=20
2.30.2

