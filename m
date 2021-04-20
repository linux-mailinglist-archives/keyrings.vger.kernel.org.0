Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B996A3657F7
	for <lists+keyrings@lfdr.de>; Tue, 20 Apr 2021 13:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbhDTLre (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Tue, 20 Apr 2021 07:47:34 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:50792 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232256AbhDTLrP (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Tue, 20 Apr 2021 07:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1618919202;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4lFyc3yLWpXiOfYcEJyfMrliRSHRYKPlDmfuDpz+W3k=;
        b=dqnpTUTxr3A2AlxnPn965hlVP1Uxra3QjJGL4wNMlWhtDlo75MQKO7lpE1joHZ/83DpFCW
        Eh15bE+Myiqe1ZbGPXmvYn68fge+Upmjfew7HgPT0fL0iI10I9yWWSnuuuDN/QX2hfO+iB
        FRxN3VYJp5yje0tjmifUwkOzg0wQ9bA=
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-8-A22MImTFMCCI7oQGfa0qEg-3; Tue, 20 Apr 2021 13:46:41 +0200
X-MC-Unique: A22MImTFMCCI7oQGfa0qEg-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0G7O2gXeNnZXGAjdzC1A0OPO51w03aKuOf35fOEPrLMBDrbfR9EwJez0LMhr38aFjiAuXiGv24r/wzsMrzOpf6Hmezs4MImyFJCvStMd1DSpkDW49vDKYa2Nq+JPqpz65/Cj8nFVQP/YgShSTDmpiDnll1ZJesIiq0W8nDIuK6+p5AUFIXkZ4e5p330J8WTHLoqO0oF0vZXmBQM+hateTmwQebjQcK8n5aNpW8O85zJMWbDMadeVQIMbRmt5HTIKH2ZwI7uafcghW7Ii4XNTItcK5yMNcLy18d7qBap82PqHQHNh6fq9B4WR7fs1lMcwXKB3lb7V/cdcSq9hu9sEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Xk/V8iT4HWlbPgVyGyWskiP9ND3eRaEKtYh4i7AFzc=;
 b=jiXFMrvXyYtB21TDzJQP0rxqcLg196Gk5skcAl7hqxn7+d7EU827Z0NH9IMdxi43Xde9pgB78HpypfT9jpYi0VLPdxoOfzL8hU4aSqdFqtzgX/cuSbaMI8qhBW8dlmySsAeyljSayWcUB1P8Qlx7g4cLSuaiae1fCUAbZLIm0Oe2+nCgLiCkCxR8qF0f1Z/gMAsQALVAj0f0jbbFUwFM3upxn85e3LYjAOQBUSJ+jvcJ+x5r2zuJzIChiNwWVF2k8iFiPxr9GecI0v9oj49N6FV0IPtALpGDCdpUJ6QaOQE5vVNyRv7oCML34CEAX38KZn94B8zgAgehFejunpyg7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR0402MB3396.eurprd04.prod.outlook.com (2603:10a6:208:20::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 11:46:40 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 11:46:40 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v3 13/18] crypto: rsa-psspad: Get signature parameters from a given signature
Date:   Tue, 20 Apr 2021 13:41:18 +0200
Message-ID: <20210420114124.9684-14-varad.gautam@suse.com>
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
Received: from xps13.suse.de (95.90.93.216) by PR3P189CA0083.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:b4::28) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16 via Frontend Transport; Tue, 20 Apr 2021 11:46:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 661fa924-3b1b-46eb-16a3-08d903f1f5ed
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3396:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB33969FE9DE96345528AD96EDE0489@AM0PR0402MB3396.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:466;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cTsMG0MZzkSSy7u2fu4EZwvkg4m1dZQ6K2PMuV3YDSkGKJI4eAEoM56tRSDb1pB+THIlFTUu5wIq2G5mxjx+Xd2iLtmtk1UxCEqRBmgt1NRwE33Sz5Potbo7TuUaZTX4ZTqqHU/7tSHS8ZtDHs8K5t6j3t5+pmfb4UqVCZ9vT2ImKeQa0Nxf9v5OnNdAziWQUNcAEXY2kijWt7oou12OoglP4ZB2mZBOB0q4DWVpJ/dEidATbdcuS4vPasmJ+4OgC5cbRy2+AZECY8kgNukOZDUp1ideA/nht/+ENpXttLCdw1qYAEtKT2P/vMjn+MLdxDSE6YT/iFFjm2k/I6bsrBrLgB4lABAPLoMrjG25lpJBr90elNWy6BYMy8k8lxwXvmJ+QDQjGHT687cISW2XcP+R3CdceD3upRnOfbMNQq4WDmyR/pJ7EylZzkTfP1bm/9CDbKFZ1z5DhkotFCjhXlTeQCRClFRECqmEj3/eL+cBvs/KjEv2t0DlNBAZkUam304pVj+HUdHtmz63339IXSAmNFB+r3wuh6fOzcfVsrXnA+g0Ea6NTBFQ3Q3VmkUXXSLqEOwqD3tlbzwO0FE1N5DSxBIxM9mEutZEMrb/0LpcLzEERmrv3hQu+5ezQvIan1Nq581OTkIWZXM72EccTQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39850400004)(396003)(376002)(366004)(346002)(6506007)(8676002)(52116002)(4326008)(1076003)(186003)(66946007)(316002)(6486002)(956004)(44832011)(66556008)(66476007)(86362001)(36756003)(16526019)(2616005)(5660300002)(478600001)(6512007)(6916009)(26005)(2906002)(6666004)(38100700002)(8936002)(83380400001)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?OyeZwPMsSg7lUQnSzKB9PNqpkV5ZXBqrMYtIMtsykyxUMosgquNgyq8Hh7Cs?=
 =?us-ascii?Q?ln7H7A739zumnMPk53+BwDMDz40u0SOvN+8OijngaBX6Mi2cjrZUsw1o3h+k?=
 =?us-ascii?Q?QLhYfaaLCzjfWVEe+4+84exYSVuSl+0kIodkziOtltGU0uosFnlAAchzbkkg?=
 =?us-ascii?Q?9UfxDmV+D8OehS3mZz6datztT2PEO3Fn8O84RIbWsASEngK0lPIEzra1dBqk?=
 =?us-ascii?Q?9PV08SN3C4Rasq7PDdalDtzI/LF4Q6gWJAfNCA45WeqlfgywZNgSsCLbKjTy?=
 =?us-ascii?Q?oIMAEgceI14lnGLmirYXaflTHDQgu0onBAMKZmAWYY1imL5vsB4TwDYJhFqz?=
 =?us-ascii?Q?OiZN5biJyIDAB2Ykw5cFeNrSKgV/WRGOHfwWdCCvflvfyjN0UkVMu1FWpmU4?=
 =?us-ascii?Q?TzlRSes1BsDPTBh6tCpguNhXxGB6NDmxRGFVu8rw5Uprby0+d/3u62+toIOT?=
 =?us-ascii?Q?/mOJAYSKJbn3LNVZTpPSnuN9SrNJwK+WjYXYbSKL2mBlDc6iCmSMz7SnzC1K?=
 =?us-ascii?Q?97Zs0gGNrfQod+4lOK2TikV3zyqPBkD5y2jXdm5m3f98LLTiPNRzDF5WJTQW?=
 =?us-ascii?Q?DDsqUQsQTr8Ou8CWRGf86w2orlU8fEkEvmxihJljNDn3+bBevpC4dIUszgut?=
 =?us-ascii?Q?+aKC51m94xMYlvRxAFO9sXUZTeZz5vDH5EJ0HoNqTzxj1fNIz38Pmvx/r0eu?=
 =?us-ascii?Q?gD1ppYioSiAqtLIF33+J9yCrOrCXhQUsCFSm/1CIFjiNR8qd3AFdWpWbcdfJ?=
 =?us-ascii?Q?VsEfuJOLrb1xCjC1E0Jl4ay9Bq0XNtRwgkFqau9qBjP2cgEQjNJxS2RuzGpO?=
 =?us-ascii?Q?St91J2EoyoaBo+qcqsimaY368UDzKLcqWOkWwtP4I9buqPTTe2ZvQVLrikFN?=
 =?us-ascii?Q?QeiPbvGACKfxbCj9RuPZ96mZKH5MGl1Usuwvu96zNVy69eCId1Wa8/ulc1W7?=
 =?us-ascii?Q?pSLY0CTm2ZXXVKebdNBFYB90VlSqrDG/7ohjvSh4NFFYNCj9XTYjODc8zCMb?=
 =?us-ascii?Q?fU8F+Aywv9RD5ncUAdogIybuMcr4DHEEjVv3ZhsRXZ6YbFW5o114lH09dj8Z?=
 =?us-ascii?Q?LY/jj01JIMVCtkjQTyoixyosT1VusPWwz6q8O7CObhvBm0FxsLqBg/lCV9vg?=
 =?us-ascii?Q?4PuFbXb1uDenoKWPNwyz09UOT0o5LoasdDvm6vCoGhSFD38CIqqLiQZuESE5?=
 =?us-ascii?Q?cX1il0JsXK69aDtjkQc70opguQwK01FOJEStpd/XndTVYKqZYROCQ3IKWqT3?=
 =?us-ascii?Q?Vjv3k+dW3hxpGzhJc8OEI+m2BvzGknMFNjJ9AlSoTgW9L/gYOG2fkx7OWqqI?=
 =?us-ascii?Q?GdMfNAh6q/Clurc7PjLZZbWy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 661fa924-3b1b-46eb-16a3-08d903f1f5ed
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 11:46:39.9532
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEYfCyuDCDNHR4b4LYnwRQ8ADlIajyszbUQ0SfJD4bUtD9YVa3R3wZpnZtgUM3l9P338ZUOUO9uFT8VITBxazw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3396
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Implement akcipher_alg->set_sig_params for rsassa-psspad to receive the
salt length and MGF hash function for the signature being verified.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
 crypto/rsa-psspad.c                  | 21 ++++++++++++++++++++-
 include/crypto/internal/rsa-common.h |  2 ++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/crypto/rsa-psspad.c b/crypto/rsa-psspad.c
index 40bb6d1dd2067..0a9c0f9e9f0fe 100644
--- a/crypto/rsa-psspad.c
+++ b/crypto/rsa-psspad.c
@@ -9,6 +9,7 @@
 #include <crypto/hash.h>
 #include <crypto/internal/akcipher.h>
 #include <crypto/internal/rsa-common.h>
+#include <crypto/public_key.h>
=20
 static bool psspad_check_hash_algo(const char *hash_algo)
 {
@@ -52,6 +53,23 @@ static void psspad_free_shash(struct crypto_shash *hash_=
tfm, struct shash_desc *
 	crypto_free_shash(hash_tfm);
 }
=20
+static int psspad_set_sig_params(struct crypto_akcipher *tfm,
+				 const void *sig,
+				 unsigned int siglen)
+{
+	struct akcipher_instance *inst =3D akcipher_alg_instance(tfm);
+	struct rsapad_inst_ctx *ictx =3D akcipher_instance_ctx(inst);
+	const struct public_key_signature *s =3D sig;
+
+	if (!sig)
+		return -EINVAL;
+
+	ictx->salt_len =3D s->salt_length;
+	ictx->mgf_hash_algo =3D s->mgf_hash_algo;
+
+	return 0;
+}
+
 static int psspad_s_v_e_d(struct akcipher_request *req)
 {
 	return -EOPNOTSUPP;
@@ -67,7 +85,8 @@ static struct akcipher_alg psspad_alg =3D {
 	.verify =3D psspad_s_v_e_d,
 	.set_pub_key =3D rsapad_set_pub_key,
 	.set_priv_key =3D rsapad_set_priv_key,
-	.max_size =3D rsapad_get_max_size
+	.max_size =3D rsapad_get_max_size,
+	.set_sig_params =3D psspad_set_sig_params
 };
=20
 static int psspad_create(struct crypto_template *tmpl, struct rtattr **tb)
diff --git a/include/crypto/internal/rsa-common.h b/include/crypto/internal=
/rsa-common.h
index 4fa3cf5a989cc..8b7ba0174d5bf 100644
--- a/include/crypto/internal/rsa-common.h
+++ b/include/crypto/internal/rsa-common.h
@@ -26,6 +26,8 @@ struct rsapad_tfm_ctx {
 struct rsapad_inst_ctx {
 	struct crypto_akcipher_spawn spawn;
 	const struct rsa_asn1_template *digest_info;
+	u16 salt_len;
+	const char *mgf_hash_algo;
 };
=20
 struct rsapad_akciper_req_ctx {
--=20
2.30.2

