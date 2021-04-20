Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 694783657F6
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232136AbhDTLrd (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:33 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:23591 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232241AbhDTLrP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919201;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EOMupzGMwbHtr4Sr8xRQS7/HtpgE4rBfbmrRmZn9jbQ=;
        b=dOtpGtVIDQKZPHwy6gr2iOf+hI98YLMO+Z1A6kaVPl7reM3rxLD4odCDNAW0C5O4+AgY1M
        Bnd6cht98jy0xNuEFO8s9u6nTTw3KIu10Vizkw39APQRvX1K69crocJAf77v0JjDeiYcH7
        xbHkdpg/qiEfIdBjJ74s64abhh+kzD4=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-8-wd3ZV1jCN1606-s2AqaItQ-2; Tue, 20 Apr 2021 13:46:39 +0200
X-MC-Unique: wd3ZV1jCN1606-s2AqaItQ-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T62REWDaveUEnjVXxDNS6ZuBWSoc7bubhGsTVtm8LQ+RctrwImKArgn7/MsqPibQBzCsY14jQ7V/TS45kgZ6uaSvZqm19z2HR90VvwwV0xnTg8FoWYQZdS+kG6PXBnj3s5IhqO3NHdO8GTZUS8PdlFX+R2/tn2yYcMUZAts6zSA3aH20RzmpUarME0/uhWVKryrXNstoABJBDheBR9eibclwKrGlgYWDDXmlgvkhI1D6VHCEveGlz1SyAc8b70Yc6r8IhTTo4G2RkEC/thSo7Uzil6CkWcSQmBQjBI6J1Xk7r/LPsBqXzbaZ8C9Kt+GAHtOGh1OQ5kfwBtqkcVeYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2+m+IY0z8fsaEXhUEPsDlsQ8iOhG2QlOeKccdIAYNz8=;
 b=Pk3OVJxb5UjZzGB8zOMrNPamsXavKVlfC1tTI2QFv9qN9X5sAxiIpZ2jEUj20cPTzLxosI69gE+gbrhsvpsOJ7CVstsFJcLui3xPRQZuZN5bP/Gyu+8MHwma+f0T6rDUcmtf1Kae6K5gM2RyIRJMcg/qjsWP72puT2gVVecAiX+JeObghwK92Mpy3g7bErI8NAcj640ky9T3X589rIgqLgYE46052f50vJnzUCn5SayGmRCcTtZz4qewmA8wGu1GtcCC5q+TjB2lIE2FE8xxblAMSHxGWtQrBIXjAscgByqk7Ef/XlXYG69T3sPhX3so4d+QduhPQRB2MNGKRyaT8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR0402MB3396.eurprd04.prod.outlook.com (2603:10a6:208:20::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 11:46:37 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:37 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 12/18] crypto: rsa-psspad: Introduce shash alloc/dealloc helpers
Date:   Tue, 20 Apr 2021 13:41:17 +0200
Message-ID: <20210420114124.9684-13-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 515f0581-1544-4c94-4aff-08d903f1f470
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3396:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB339605F0EE72F51EFA61558EE0489@AM0PR0402MB3396.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hSbGzJd8ti/l4ikEYYJ+sqUtCc2Azt5Cw/ynsR/8Kb+RFB4x+o13dGocFwhxuPmX2LtQfKPtrokemkNA4vTvEuWi7X3SRZff4/K4+jPoxgmwF4PnophgHNy9yMIFRgqZKW31itSzV/8YerDZYSJSiCP5hRSCJOg+gSwO1MXpV6d7j3RMh9z3H/tNd3vAxhq2xG36LOc1Vnq7nAsoGdwu2EImgKaqEn0fVj0iPQkuFwqkdWR8LTFU2xN1g3Ly1g60F2FZ4WE+wbSSAGOnsFgNRA6gKfuHzH+j6SKEvSvsEG3P/Ikhkcy/t+880N09jx712IKQ9krsTf2Iad1Lv4JyHgq0zSWy7hqAFTaUmMT2PkZ0eoIQi5Cyuj0OcC2LKxmup3gETXcNdpuH+e3QEfEgqAOjDRFeuaEhpkbKiXmz2JDI/qP89RkFOzRgZKzo2duViLtD7MdTPMujSXbJ9V9MetQVk8RTn6/tmVzJFuxFkl5cGuDc0OD8jUH3SwKLiNKwF5yWPEkavY+cf1eWDgW4gGktU74ZTyHfRvQcNMyMX+M+emLvn21OM74Gge0Lc0gn0dwjdYVJkytNFYWbq2hPByoASQc6jNHHAjLgkMQTzcHIh+rGZH54KJPR702O2hEu7y/h7DdIcSnV/mkRGByIGQ1EqrYOa2r8SUn1p913Rc8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(396003)(376002)(366004)(346002)(6506007)(8676002)(52116002)(4326008)(1076003)(186003)(66946007)(316002)(6486002)(956004)(44832011)(66556008)(66476007)(86362001)(36756003)(16526019)(2616005)(5660300002)(478600001)(6512007)(6916009)(26005)(2906002)(6666004)(38100700002)(8936002)(83380400001)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DPWsUNnAMv9spXACOdTQ1aPFMVMjnRAfmuVorchrtDyaCXaclRh4+PlQY697?=
 =?us-ascii?Q?r8c0AjFID9QqOlD2dJpNl0pkGn8bAykiex/as9hT5I58kcJI7rIGwzQjFEPE?=
 =?us-ascii?Q?G8jYTpjj2QpChzMaCMfE7HJowSzEA2L+2+IicaplV40LcW1rwUx69K1AQnM6?=
 =?us-ascii?Q?7eWcIOnD7MXKrMnFqKl6rrQjdR4TL07CawkksWA/rCQ7UGTnLz6m88AL+gKK?=
 =?us-ascii?Q?d4/kwiZlxDVr7lkIdD2DkZlAIdnMZrMwVydeYy3IQYzDAmRn3Ykn6sLkGS1k?=
 =?us-ascii?Q?4K9zfctasjSqSBNIPtiKP8owuOA95FQagRJRM/TPQfh/BGULLiXK6Kg1l540?=
 =?us-ascii?Q?2EZHOpfd1Gi8Aww1pReoiuhosncsAMTHS5hf028J1SGA0brL92FlCcYPisYy?=
 =?us-ascii?Q?hD1hv92g8ROKnLFYXGIApG/bve1L0vUcQAHf5B6otgHn07gaom2ALJZb6/q2?=
 =?us-ascii?Q?74GbU8szkxwm/v6ylbMzSiwOsNIOnPNW6JocS+fO4NTs11EhP8PlQFqwa/eW?=
 =?us-ascii?Q?FpBJpZei0YvIwTk8YnOYvpt6DlKH8XA37zimDtlCuLrNaEeM3cLgd0fZfTY8?=
 =?us-ascii?Q?ovG3g6+N0EnRhuBoR5HFms4t3SS6jxUsCB3+ii6VOq1qhcm+fsRlcQCDrW5b?=
 =?us-ascii?Q?Q7mvbINf/4NyWu/rJTGwZJV6GIAuygFNXQL+ei2nz3NLnBW4dwC413wju8aa?=
 =?us-ascii?Q?EAlL3fS5TbN7PyLPoJcvQsVzPSrqBT0NEuYB0bmnODfZfZw2UmAv+gfQO9uP?=
 =?us-ascii?Q?7JlFZD0quX45Tq9r2S3CIZDvwK+gvJx4RbepF/p33xST1+RSW4ojaz04Pgbb?=
 =?us-ascii?Q?efWlm9+PbNJaKJ94Fqc7pMR8cWdWTQVJB035Oq1gKyoi82g/fHIsnJLmR0Mk?=
 =?us-ascii?Q?j90garblAjFsjKo8GY/EdHBT1Simk7gPL5SUoRgdr1foiVjONsiNG38FhoOs?=
 =?us-ascii?Q?OZ0eAdMy0kaffMi6VkrcB2xqsDywcv7TTHkbxinLIuuBcbjYNVs2uJ5lY7Wv?=
 =?us-ascii?Q?O5ZpV2Alf6OEfdkTi8BGSlYRZn095HUPC/VSpvvKPa90kfv66ryx1R4naA9n?=
 =?us-ascii?Q?9OjctwzGxqO1VB5cRG8iqQ+CGtwsp49NvMxSMRTfDVHtdzYcMhoNlzIdmGcO?=
 =?us-ascii?Q?uraCl/hQMqlX8fAF07+ItsiGBs9nbZyWXykIYpHtHP4BhqD2Vzl6F/KlDtta?=
 =?us-ascii?Q?Df0PmICZhqBQ9kKt/rqZ/05YxaW72chAonwSabnhgiPkDPLDRHf3w9olxMGB?=
 =?us-ascii?Q?wtsP7N1tvzmhxlse+WnXxn4EalCugOKGGkkkKBY0A7WYoipoPNfAlHWQjL2U?=
 =?us-ascii?Q?UzO9dOOXJyF7kp+7G5nBTnYU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 515f0581-1544-4c94-4aff-08d903f1f470
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:37.4786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aHpc48LoUfw+FcIzjwIvKRYvSbhnBpDTfbN/xokPiYQcWRDtQu3cVQvMCU81qrdTK0/cmnixR5iauT5wBEfzkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3396
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

RSASSA-PSS verify operation needs to compute digests for its
Mask Generation Function (MGF1), and for digest comparison.

Add helpers to populate a crypto_shash and desc for use in both cases.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
v3: Add psspad_check_hash_algo to only allow valid hash algorithms in
  psspad_setup_shash.

 crypto/rsa-psspad.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/crypto/rsa-psspad.c b/crypto/rsa-psspad.c
index 0e5422b05c081..40bb6d1dd2067 100644
--- a/crypto/rsa-psspad.c
+++ b/crypto/rsa-psspad.c
@@ -6,9 +6,52 @@
  * Authors: Varad Gautam <varad.gautam@suse.com>
  */
=20
+#include <crypto/hash.h>
 #include <crypto/internal/akcipher.h>
 #include <crypto/internal/rsa-common.h>
=20
+static bool psspad_check_hash_algo(const char *hash_algo)
+{
+	const char *hash_algos[] =3D { "sha1", "sha224", "sha256", "sha384", "sha=
512" };
+	bool found =3D false;
+	int i =3D 0;
+
+	for (i =3D 0; i < ARRAY_SIZE(hash_algos); i++) {
+		if (strcmp(hash_algo, hash_algos[i]) =3D=3D 0) {
+			found =3D true;
+			break;
+		}
+	}
+
+	return found;
+}
+
+static int psspad_setup_shash(struct crypto_shash **hash_tfm, struct shash=
_desc **desc,
+			      const char *hash_algo)
+{
+	if (!psspad_check_hash_algo(hash_algo))
+		return -EINVAL;
+
+	*hash_tfm =3D crypto_alloc_shash(hash_algo, 0, 0);
+	if (IS_ERR(*hash_tfm))
+		return PTR_ERR(*hash_tfm);
+
+	*desc =3D kzalloc(crypto_shash_descsize(*hash_tfm) + sizeof(**desc),
+			GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
+
+	(*desc)->tfm =3D *hash_tfm;
+
+	return 0;
+}
+
+static void psspad_free_shash(struct crypto_shash *hash_tfm, struct shash_=
desc *desc)
+{
+	kfree(desc);
+	crypto_free_shash(hash_tfm);
+}
+
 static int psspad_s_v_e_d(struct akcipher_request *req)
 {
 	return -EOPNOTSUPP;
--=20
2.30.2

