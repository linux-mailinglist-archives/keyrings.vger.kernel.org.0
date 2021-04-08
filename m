Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44CC43586CC
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232039AbhDHORK (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:17:10 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:24869 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231989AbhDHORB (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891409;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yN4wtR5jd/CKbP4TNdutXtmJHYMvPTYZO36/3uXm/FE=;
        b=d3IJuWY1q/QRuiBKmD/pxmY9VlHsKIHI+dQiKxHb7jEVXSM+4g0vuI5gt8jhReUhLxr3R3
        RkOS49PG/u8c/BX5HF71rzKf4yXwcPAeMRJyZioG3F3BFZc8kH7CMLlggm7ZR5rlzsqM6m
        EZlFvAXUkMe8FGk6DArVUFkKjuzNifQ=
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-PwsyEarLN_OkBlwcut1VBg-5;
 Thu, 08 Apr 2021 16:16:33 +0200
X-MC-Unique: PwsyEarLN_OkBlwcut1VBg-5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H1BNWP53fQEw5dcJt6rW4iZcYYv7oI7YdamxWIYFksoJ5HONIgX4KILsZ4FizkSsjxEes1v6zJg6HNnczv56oimpYZ7jTbjNy+Ft3nrMLQfpeT1aG8HtY8M99ExZQ/BJJ4XKdHYoE9fZ2YNDY2zvo4Md+6s55+fab6OYACHODShf8VKu1Izk4DBvouAGEQ0U8hG00JUazOXdVnoiBuIcCx/4GdxO6CqfVG0UdvfxNQjiUiDVOBvWrQtwWmWprhG0OIKX6n5Uidvyh1kEEl4xxSDmWW2ZWycIKL4AU2LZtFACpTqQ8RD66ld3reqkGAIBNlfFEheMvjNOgtv5biflHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i8SkvN5sNCcLK7KC5Wzzfa3EoWG186cgQIpcgTHH+5w=;
 b=AUd6ezg1NJYfOV5K9jk7Fzg1LVAi38sAjCgOEPrK0vgKdvMzzFDO4c0HsIn7BxuqpYpkxKcXikiz4Jc322Ik1OpYFoa2pMEN1r19VAKsThuAhiqfOt9kk79hFZ+4P5N/seBiw9bTeBzlnVn8+5ouO0webAapZNZsAzPjIQRV54Hnv9Zq/RAXCJL/p4VmmFinH2OwSyN1tqVIDHh0NL0XdUn13UKliwb92Wm6mDp64PaW5lAqfY6ng9c6sgTT1eyP4Mw9d2jkE2/ql4HHodA7138Uhvf57oZvFQ2yln2fUnMmfiU31LLeRQxK+xNoQhFKNwANyejpbaITNv2T3ff6Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Thu, 8 Apr
 2021 14:16:23 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:16:23 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 09/18] crypto: Extend akcipher API to pass signature parameters
Date:   Thu,  8 Apr 2021 16:15:07 +0200
Message-ID: <20210408141516.11369-10-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:16:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6625fefa-0cf7-4f10-070f-08d8fa98e223
X-MS-TrafficTypeDiagnostic: AM0PR04MB6289:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB6289AD33A81D8EDD5089AC7BE0749@AM0PR04MB6289.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lvqTKoLG3BzX0WNJCNUhU2ZI+WENaCD4khtEGlQmLmjfsLXtNxjhCIR/LEl27EIAEIVxRrWUgTxDmwsL2PWbxobfHdbijI+rIe7WCSUrQAPOMrGVW3EGEadZIU96NPPx+ebz7kj22spvSMKkYsfXytMJzxpoQgPAhS1PNbddMPRBTPJXxBsE/3pKn9Gs1k51uw+9/09Mtze9WhMr40G4neE3STm6U9cU2Kd3RyQ5Z832Qyr9qMWPhY3kYz4sh8ULI+lZQ1CgsmHxuL4frcdj7OaEQR6GHyrkrW92xGRDDB2V4n+tGn0g39EPykp/uQbduTRGcHiyafgArRTzXjT7lOP85f3pflXUNXY41sxbyaRkH20FYDeL644nyjlY0w9aZd5dELZ3QVXSqHV48LH3JH/2Yn2bI7y5N/wlCFmLvyWFO5AluaSHKwdiCgtqKI8j5qZPfec4C4NStTjuYbsvKinYHWgbkPcGMaTqFz2OdcSQDUyoMqAbBL9kpnzJNxzUy+HsA9y4yXOOeSZBNsKHkLKbY7vtIMRKioi5k2lKwHE5YT2XJWMwNHLzlKY2gS7cXdt0rubTycUDvNiytAEOQ02+JO7B8WX1Ray9l0tEBs74RSzdkhTmNVQvPkIHCHjQZARBhw6ejtM2/5F7Pm36hDLG/zzU+eA+ZeGtJH0vLvFQQ0QQBDJ05TZ3jFH1hneg
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(376002)(136003)(39860400002)(186003)(83380400001)(16526019)(478600001)(6486002)(38100700001)(36756003)(5660300002)(4326008)(6916009)(1076003)(66476007)(316002)(2906002)(66556008)(26005)(38350700001)(2616005)(6666004)(956004)(8676002)(44832011)(8936002)(6506007)(86362001)(52116002)(66946007)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?L9dZG+J/fuP+3kksHz6J4aSrWOHxTdl5z2IIrAL0h2FKkxPTCxbPjp+C+m8i?=
 =?us-ascii?Q?15BGYXbondubPvrGLL3qPn5uQooHqrtA6GiAqSvDACmQi5ZKSHMbaZ2ntsCh?=
 =?us-ascii?Q?4V7BWVeNwIZn/ZkkztAdzXJ2YrzXBLgqaws4Bfsx/hhg8nT+uEV00y+yFOHD?=
 =?us-ascii?Q?f+fW6LGbjxb8Z6CMofCeKpsDLgbiKgXuegxy1gAZp+r5RI4c1NHk60WJO3Ej?=
 =?us-ascii?Q?XY3wZmfUjo5mcx+LrXjA+3YhHeepMM1rVUvAr3chPREbaupYWomIphDRYPZH?=
 =?us-ascii?Q?CWDr/+ElbGmHQGvij0Vsx201HYQV+9cgPluLJq5ItIz3hdMPw37F/CZraI/Z?=
 =?us-ascii?Q?+aLiWFmlVW7fg45rLvHPr9+fM2Vg96EFAYXUdZDMCFQZ0TmoV9jTxyLt1eVo?=
 =?us-ascii?Q?1YYofHaQriNNneUMyYw9f79uHKlhhfJEvTCO+I8ja/ZUbE13zWP8dybBEpPc?=
 =?us-ascii?Q?GuSvHOXqc1hx3l4/pwecd8tl2OWmeAQt9DPaATg9zZi4XXvLl36RGpBZmBQz?=
 =?us-ascii?Q?IGZo7WKn0QU5u5XYevEcGljSrjDUuR2SgALEQJ8jrATKnOTp2f3vkUxNGM9E?=
 =?us-ascii?Q?oEneV7RoJOR/d+VZxw+Mf3l8lXp5vqVPKtUvA+e95wc+OU1WoukKJ5ylHzYd?=
 =?us-ascii?Q?T3fEslP898lwdsJQB49ghgA8lCWnDYbFdl9Foz1v0mZ6caEkNQOypGUgk+UA?=
 =?us-ascii?Q?Uj9e4sbMVXlQoIexnrK6qYAVlWBhrO4bAWo8Wd2VeXFtx3NvW6GwoZBo4Y9Q?=
 =?us-ascii?Q?GvatNMI49w1qUWz6y03kRIq5DKexnVnXMvvpebKTCAEHmlFu2mf1Zv6Fi4rg?=
 =?us-ascii?Q?XUoPe7DqVSC9AHO73qfbPPlGBXR4MPD0+wgc7qHmdThC++oa6m+UfKhjf1mt?=
 =?us-ascii?Q?pC4piRjUQO4XTNLHu9X4ylGv8XMsyALxBME2yuMrD9U1wBiOFqnmu12ZGZLa?=
 =?us-ascii?Q?g7zfOz1o9NnOZf3X472jz3aNikcmPcrm0G2fOuOhrRvY5akspiC6ux+bss9M?=
 =?us-ascii?Q?+6jSgqxodrOVa5Qvbci5Y73EMrHanE2W4yB2cn6/ttBn1dN/cOXrKbKnSxVB?=
 =?us-ascii?Q?g51dItyu16eLOFDebd7dl+DedilG/vQXNB54AebgMzQwK0gRPWupUIvm6R9t?=
 =?us-ascii?Q?3tr52MmGrKBucnpXbCP2ZyK9z0ZPrHFhvGbzlAiWYEcCgElv9dR3/QU2fXV2?=
 =?us-ascii?Q?GomaBLK9bSmzuhWWKqZZpFP08RhrjpAP9bUS5XwPTvT3zU5tb3qTUW0r/3tY?=
 =?us-ascii?Q?hRxrTL/P3inyK7PDpOY59mAyi9fhbXW6mbuEoDltaxPmtmfq2RWzxwc8Pddq?=
 =?us-ascii?Q?oWlIi/pnG/PJ+UML25fSWiez?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6625fefa-0cf7-4f10-070f-08d8fa98e223
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:16:22.0238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kcB8x4LJF2MVKAxUpSTtgy4sEhv+vEJ925+tGDKL/vGExQQqgtS80G+eLX/p4yEbzQeTyj5hJLD9r2V7hJhXKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6289
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

