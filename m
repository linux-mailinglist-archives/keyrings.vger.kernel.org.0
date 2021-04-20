Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4B76365800
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbhDTLrm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:42 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:50492 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232228AbhDTLrT (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919207;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Gi1QTA91cQ04j2dsKALt2E8D20b12P2HzyMTUHz5qfY=;
        b=QiFsbwCoaUl/Kg4Ql3AWlmqlMORs4slIqTOI/FF86GG5rsPmaVBGbN5Xr5wDM/V7SLy4ob
        UBvmbnnzp/DL8VMSoD/40aYIskbap3I67IwqOaFZOkffNdxDtRTbUSAjExzYMBfG7EIzSH
        +Go3ZlOtBvLnzL0jMcQWFn/5KrAVwCw=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-35-4dwSqqHONMucMjlxtZUubQ-4; Tue, 20 Apr 2021 13:46:46 +0200
X-MC-Unique: 4dwSqqHONMucMjlxtZUubQ-4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXi+czS57U3tEggkrE2TDxipNzvJGDVX6sPrurnQ0HrRjtJx5rSduHis7C3oetjLsQHfu7qhUNoUBaj2sqIbDDUA4s2In2VueO6wBp1O1TYL4Ic/qFfjHqzUtmQwabDJ4xjWGnT3lFbGFsDRpRKZdDyK4vaDOK8Y1bJ6W0zXq17J0vlczBAsdvD2uCYRVBcSEgo+XGo2xhKv5Cq4QHizn/WgX61ylp9QAjxDl0gZtR3qtswhg7EW+AVFCXActEtow2Nz+TgocpsbZZPM5lKaOEN4MR5cVen5jFAEH9kv6dZ0n/vU5pEULVcKgY5aLwmzfNZHzwOd2XJHGesfUBDesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xDN6qusrHHlYH2y3rkKXJ6kk5Nij4grlay+a7TTMdU=;
 b=JxfhDn3hacfWxoisSgiv43YhV09GxIRFt70tx7TzuoYCnef3iCMxPCzw1NaI7cYGrGuNfR1WjR77jALzC+6nyMLkTzyFuV12AlEi4UJ2xP0QxYqApUGajYqECJSSTPUflTQCaYyJt0f5RhvkRbO6veRqQH+w1/Awmvm3F5m9ejKvMu3BaPTuRxLTqwzEau56VBc+AulwbFkGqnNEuR/jgFqcOUkKfyYTZRV03GeKe0s2faEU9dOOkJjL6ry7AI9joYms4/T29tumPx3neL2mUvAkvQjmVTzTEuG74OdMI2OrhSRwQjRFXB4kXES1ZVhw51Bpq08V66dTjJCB7EaKTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB4995.eurprd04.prod.outlook.com (2603:10a6:208:c4::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 11:46:44 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:44 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 17/18] crypto: Accept pss as valid encoding during signature verification
Date:   Tue, 20 Apr 2021 13:41:22 +0200
Message-ID: <20210420114124.9684-18-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0b4de44-25ce-40d7-8dbf-08d903f1f883
X-MS-TrafficTypeDiagnostic: AM0PR04MB4995:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4995B9B66B80BE59809F8114E0489@AM0PR04MB4995.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fX0djtRMffAwSPPUiapr3Wydb0JZGx0mvBMDg2jnB1soG9i8vNo/Tq4CJQBugGPRyqqxW3VxO9oGJ/5ldGo03yaJHx7bmQyoeziEvCOB3CL+39FhaV2hAa4otFrUTcsvGiKHs0+ZWCEfI4rCtCJ1pPtJfFVYYvHLadF/TXq6riHe0fNYj3+KOo7fA7vwCg4rk4wsgD4FBIwKJXrbt1SPVKRO7y37jR5SowHwC8fC3ognebY9JifIIBqyfUeMJpylasofz+e0mQy7efkLdAFP3533iqZ58ckn1PH5JdxFfdlv6kvUkLweISMJIJhiCu1ek6KZzjI/gcFCXFhhIpQznrqnaj5mB5LXYfxvwkENeR+z7OmIN5ztcpA+/vX1f+a1726Sst+IZhCAuKoiQ7JkRNXwK/ooowXHHfpyv9CBRjH8tz0ekPzDR2WoscZsjpP4CoU4IlHOEYgT+rS7Ru5mXhXeAwS33ni+EfNTwvWHuhdkvMV0zrLVGy0daClnzxEo3pULxkI334mB+IisOju/V4pLOMCEeFr17UsPvU1QvBvi1R2ZAaN9FykE+6llr55wK7tKfXqeH0+I0x4hoSxleMcnHCqep/gOpkywdsZmoTO5YDr7C8swK5J/dKCSkSha2zUu/O6FqTgOJ0Z3vomYqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(346002)(376002)(39850400004)(366004)(136003)(316002)(8936002)(83380400001)(6512007)(6486002)(52116002)(26005)(956004)(6506007)(8676002)(16526019)(2616005)(6916009)(478600001)(44832011)(4326008)(38100700002)(186003)(2906002)(66556008)(86362001)(66476007)(38350700002)(5660300002)(66946007)(1076003)(6666004)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?BBdgwLWEBx/8CRWLyILVwUvMlehbHhVHBs4uU3sr5ChRDFfvE9v0SpjubxYm?=
 =?us-ascii?Q?B7GXwedkZgcwnoum3ZFB5/7l1XQZKc4EJMx0bWIOB0hf5gEcJg3LZ9reQjmb?=
 =?us-ascii?Q?iZ9A5At0qDhpaIQ4enstj1XeqnttioS3v/8fu9W/Ud927ssbsPo+7W91Jlx2?=
 =?us-ascii?Q?T9SbDj+SLJ/MlX6AgKibIM4bR3tYkWvdu0HXsZQTr9dp+q2HVzzl3YeiwVJr?=
 =?us-ascii?Q?wqROarkEuGnbNi7f+Pwdp/tZDfmO0pflGBrGf/BMeRTyYdOo0yg0kFu+r/3S?=
 =?us-ascii?Q?cMJd0fnAYtZmlXCbD/c4KWyjU8e0IvtFnt8RpDhhJkKyq/fR4RI4qkqX5aTI?=
 =?us-ascii?Q?1Ujqvj0MJiM0VuABik2boN0tanlH8tt5pFITd7npfH/uhdf+7tH/HOfeRQKR?=
 =?us-ascii?Q?eyg0R0uqD5BE/cX4s1S182rUxguP1NPB1GXMG5hGVUtbSeu2CVlXjuf1e6B3?=
 =?us-ascii?Q?7czuqc/yTbNAd8YZviQeNl5zfh9FGltdoKcw5DtGmzvGHdrH9aOSQ4cG4L64?=
 =?us-ascii?Q?csgiU8n2wxT5hqrMLYErm2Jmdqh2lMSq0xwoLU8wvlxcKNiPN6CnHsRHo7yU?=
 =?us-ascii?Q?nVO7b0Ks2HkrTHpRhv4Os/r0MSK7GF+oxNzmwFZEsBkPTEjnL617LwUxDudI?=
 =?us-ascii?Q?Q3KzOnjGUjrHHTOuy9kuOo3jL8XMHs9Xl1/NU84LvgfxNBDa6RcSh/KKZ66e?=
 =?us-ascii?Q?d5Wbk84W0SNU5eeQuP6O415dWVK06EQ/9Zo4VTryy2/e9XEWdjRIG0Im65Xt?=
 =?us-ascii?Q?IHaqG+CoeukKCgIGxpy57JdmmeNs4JVOEXIMr0EmImvuSaVTnmOF8aG4Mm0F?=
 =?us-ascii?Q?RXl+tgdqnUxXD1/R6kzCsiUbSbpnYQu142wJb5xxGHO81ZC6ErXsReB3WZ55?=
 =?us-ascii?Q?1zDkOVpnsJDAqZv13ejehNRIUmFllaX9ajSQUYWjJrrZ1/1OR0ynbVPNLsnF?=
 =?us-ascii?Q?j0lFBwmgdcsgHp7OIq5SJRjxoLZrqu1QRQdUZ6Ak8dTCzx9CGrHYybcc2sag?=
 =?us-ascii?Q?Oumbq6RA0s3p1JG9SOc0g2dKZBPQVSxx5lRryOXmi2CtSUwMmY56ZZ//El5D?=
 =?us-ascii?Q?c5QJfltCgKVfaLSfShVmYWqpKqKTKtB01PDbHJk0aFP5VlVntRSSMPK6B0ag?=
 =?us-ascii?Q?tw1qgRDykkQMoxL1XSYYZCb1eNUvYwbbdJ19mOioXhGT1+5r8cmlS9R2n3L8?=
 =?us-ascii?Q?nKWvwsJiKlZz8twbFlNhJzZsPNRWhkrIzwLKoeSps89Gl5wvnibqwYMvCxx3?=
 =?us-ascii?Q?nNN86fKsLfywqCNbe6LnhOJ3Ooa9BuK7k5Br+sAqzDbuZiSX+7XS1t1HdvIO?=
 =?us-ascii?Q?h0A4edSzXF0C2RTjTvwy3U83?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b4de44-25ce-40d7-8dbf-08d903f1f883
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:44.2157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8wBoLncHK/ReI74b4pjitQ+T4mSYgfYZqOa3p8Q5cM4m8NCGlQargDAsXgEa6LtH9NyUSSQ4oyUQIRjHeNKcFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4995
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Accept pss encoding for public_key_verify_signature. If
CONFIG_CRYPTO_RSASSA_PSS is disabled, crypto_alloc_akcipher will
fail to find a pss backend anyway.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
Acked-by: Jarkko Sakkinen <jarkko@kernel.org>
---
 crypto/asymmetric_keys/public_key.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/p=
ublic_key.c
index 788a4ba1e2e74..b9cc83ba7a127 100644
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

