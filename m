Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8B083586DF
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:17:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232182AbhDHOSE (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:18:04 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:52979 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232091AbhDHOR0 (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891434;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=izg8V+cMAU0CJTDlxfWbsq1f/plw234ZS+maxSMN81c=;
        b=X0S70+Hg8VWa2GWyjmraAr+F36Qm2nif+Tb3J4/7WO4O6icGtILCV4weQsYCKIIY72ctms
        OfOuHLr5wQQwriX90rhoiR31NdSaZ4ppzCQlE8vPB0KDtbwUmjGkuLp+rMD2/+m0wZCfzY
        OhFcnyCotBOstxofvxMB6Zg5ceLa4hQ=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-54HrX2WrNKSsTDtXY3XT5w-3; Thu, 08 Apr 2021 16:17:03 +0200
X-MC-Unique: 54HrX2WrNKSsTDtXY3XT5w-3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HEC9+focFd1EzDMxs5lbLUWoU9HmIkxIadR0iHjH/hGrCRc3rnXK1JKDofWmCMbzM0qWUIWDQLmrlb5iCSm7Z7mGI1Wbwp+J9i+40wYMmITb2KYvKDrvXCVcXfle3bW8YjzB6Ar4QPyebO98RCRloMAPwvz/8qUbyBV6KP+f2ZkWza4Nsl+RTfOscNBU6N5uwzAmbUi3kYQIx6yAPhQJgxWD6JNA7UfaBXgobz39kiLiBwxpc3Lqsf8157Wmr6+dDdvwW2UeoUcVN7OTVqsDVubdP9Xqm64vj9eyvAyG4F7+G8tzxxRAlqgSU0v+5cIapEFKJN3kuuTuwxCk/Balig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3isiNpQLPrO3+BBiER53A7gJdG2+eYaUagS52qvxwc=;
 b=ClD4pBtJGD1MOl3Ww1tHO3Q/gdNXkaQ1G92WsC3NRP1r0J/DAmU7Bguyo9aI382I/q7FsmINq55GHPFUDa+Dl/UwMgIcQa9o8RAaSB9MhR84ryGlK2RkhSN8FPv/AtYaW4jQENfvdcPxlIUPJyx0sbogkoM7JxwuUyCnO8IYBhpwIwQ9LsF1N6XWbxxcjxDe3EdPx4268o2PtUJvfqVQcjelwvyIVyUtpQed1MP6acN556+GMUKA9gzKejArEjr8t/5z1ET1hgdHhPeVfPxM8msqo8VozR/MBrHrvWToAPQPmxdffTBro4n+4DDtEqjRqPAz3n4ICY1c192zuiZKWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR0402MB3572.eurprd04.prod.outlook.com (2603:10a6:208:22::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 14:16:46 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:16:46 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 13/18] crypto: rsa-psspad: Get signature parameters from a given signature
Date:   Thu,  8 Apr 2021 16:15:11 +0200
Message-ID: <20210408141516.11369-14-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:16:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 842a4e0b-6cd7-46f9-f33b-08d8fa98f131
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3572:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR0402MB3572A5714713DE5CE8DAFBBDE0749@AM0PR0402MB3572.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1BjMF+QTzcVFscR1F9snupiFutzZ7ENb6rbSimkiT09NiijxVtIz61pgm5SeO9IfAFJVC9Mv+h/d07axNLZs0kKm54IgApEhIBgJxhxvmO8qtBOCGVk0aoEPYe6sznuzeVrvvHMPpqk7XfCqFz9z8MEUXgUhB+FGzywhKZJlFDaCUekxroimpjvCiC4KgcekSg089sZSijuwVQ3EAtqx44Tfq6zZ1nJTteFbiazomM0POUwLZbVLicuGaWb8elHijHtNXdGNVuGHu+w/1h+afPGlgmbLdQCHAjshxQab9JsVMJQiXsoCXvopQ3VJearcXvrRb3GbP8mLqLp0Wlzv+ZuO8Rsv6B75reDz7sjAKEBsNQ1riZbtALJ1eFEvl3LcA4KqxCH/4hJ2T8qQz51E4HT460KCCXMPj9kOT3tEHIph7b4jz7Kd1+rOJBt6LiSlD0i5m6POKa2xDoAprP2adNBTb8Lj34FPcIJw6iJxVAsWPelY3/dhnVMrKxR9wvOwYTjuJS0DmkBhrb9035hkL30grjUT560V7dFhsMVUI/PPQi0h/Vvjy3v8YQhM15bN0QNdWiM3EN92V5xH5k5hLo/0Jfx1FeIfIy0tUiko5U+SqLtG0WZqDSR5tr8hQM+cNYKh+oBaUYA+oHYqYPitMdDNF+MBdTVfZyd9BmKoqHBFNCBxc2d4vntMGptYPBOC
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(136003)(396003)(376002)(346002)(366004)(16526019)(186003)(38100700001)(2616005)(956004)(38350700001)(52116002)(6512007)(2906002)(36756003)(44832011)(6916009)(83380400001)(6666004)(8936002)(26005)(66476007)(66556008)(66946007)(4326008)(316002)(1076003)(6506007)(6486002)(478600001)(5660300002)(86362001)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?GsZ/TaakOZ6qnNA23YXi2nNrSKcShYW0wafGwjS85lGEckZJ8OktbaV4QHEk?=
 =?us-ascii?Q?Gmp7UgUl2SpCQV4jc7TdpOlnQ/T5N4pFlKWsON9714qr9ShJU5JGhtYSsd2G?=
 =?us-ascii?Q?6e2ILOD9SSqk+xNJpj6JBxFvHPA/+stZSoce3T3cLPhp7oMK3L2NtCGnHyyQ?=
 =?us-ascii?Q?11a8XfG5i1MGrAqz9ff7j8SrQT6sMbAYTiNumggEA3rynY9aMte6k0lR5ugl?=
 =?us-ascii?Q?wwkGf1Xx6ZYnbmO7IgNSBgJ9lTY9kvZFkbaUEayaz1X2WqLbJzCHFn50nyU8?=
 =?us-ascii?Q?Jo0MvdfoiRoY3PGm7SmlbH6RXBd+b0Sq7fUd8DUjq1tVxyyxMhNeIyZ1EHC9?=
 =?us-ascii?Q?PokZnad6q5qopas6q1YtqC7QE3Rax9DJg7XUOM7pMVidBwKW1qVkrhdLdLhu?=
 =?us-ascii?Q?J8eg2Ptdkpf2HNiM6QLqgRNqVivj+bB4ZCWKRAXMGYyQmulf27S0/d7Yg4h2?=
 =?us-ascii?Q?xGEdD2WwCHwZOift0z1YGQXXT1cIqEU13j/e4CZRdQZ+fYMuVh7WN2/pY5c2?=
 =?us-ascii?Q?3HjgVEZTREy08WPcuOYQ9QeIKEGEpMmSnoH9MdkWGWTod311BYrMx80imLXQ?=
 =?us-ascii?Q?gMbvnx0pB0Qeva9ROxVY14DaOAKw9Oxte/NSleO7xjBmdCqG35Fp9FiG0tME?=
 =?us-ascii?Q?LbtOBM0Pq/1J7GA7mfvSaEyIbKPYKQzeRV9vCFuoj1HESK4WJj7mqpMo39TD?=
 =?us-ascii?Q?ytqrKWSy5woBiMxVAFI2JGSVioQH6AVwghNQT0DrM918KRUUjNvfjEeqRu3m?=
 =?us-ascii?Q?miC9cVzQclIJvn055Z04Ngc8d122o5f43aKMjiSKM23QF2D0XqoxctPJsNED?=
 =?us-ascii?Q?FRpZcUBcWeeueEywcK4dZxWYfOCh3PE+lUiXfmzA42lZtM5DrPHzvzQPinMw?=
 =?us-ascii?Q?p5TbwQFQR2BGtuu3kMyOKjc1IkL5rY2Ofddzl8dyu4NwECHDwAfI1x4kehVN?=
 =?us-ascii?Q?tS7zdEs1X4Jg7qARGR4gbtvrcKZ2CTUDNRq5opUVtI1rxl9DmRJbwg8flsKA?=
 =?us-ascii?Q?AXvbWseCblAB0owhH1BqUbS0Pzhl/PbIozt4m+0KFypx21bdGcEEs/xs4eXp?=
 =?us-ascii?Q?IjBiVHSHxT7B2EuPWl8R5Zpa0IthOWeBa0d3KUiU+L6lVvlMsxpuxqlLN2AV?=
 =?us-ascii?Q?TuCuRhIPY0+zQDZ/f/ktXSdKRq5k99DHZdEGmjTvYvCD6aDa2wK15RaK6mZr?=
 =?us-ascii?Q?RHrmid9jV0Ely3mkCcXr6YaG3Etvj8aFqrjWFLbkZvFp2ZuQh2dDu2McMWeY?=
 =?us-ascii?Q?DvwhOwmcNctCbQaA1moO12QJ2Q3RqKQ10jespvBwfM2b1Rt6mShBecD8ACyt?=
 =?us-ascii?Q?XfFnPax/b1/avo7wodrBESC3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 842a4e0b-6cd7-46f9-f33b-08d8fa98f131
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:16:46.2650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QvWFPT5k5b4UEPymrSDEOJtQp1fW6T+Jhr3tJcIDOfcEQVlmWzinn9zLhJVn5XIk5DTTq1u+SNs7BedlXw1i8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3572
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

Implement akcipher_alg->set_sig_params for rsassa-psspad to receive the
salt length and MGF hash function for the signature being verified.

Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
v2: Set mgf_hash_algo in psspad_set_sig_params. v1 assumed this to be the s=
ame
  as the digest hash.

 crypto/rsa-psspad.c                  | 21 ++++++++++++++++++++-
 include/crypto/internal/rsa-common.h |  2 ++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/crypto/rsa-psspad.c b/crypto/rsa-psspad.c
index 855e82ca071a7..eec303bb55b2d 100644
--- a/crypto/rsa-psspad.c
+++ b/crypto/rsa-psspad.c
@@ -9,6 +9,7 @@
 #include <crypto/hash.h>
 #include <crypto/internal/akcipher.h>
 #include <crypto/internal/rsa-common.h>
+#include <crypto/public_key.h>
=20
 static int psspad_setup_shash(struct crypto_shash **hash_tfm, struct shash=
_desc **desc,
 			      const char *hash_algo)
@@ -33,6 +34,23 @@ static void psspad_free_shash(struct crypto_shash *hash_=
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
@@ -48,7 +66,8 @@ static struct akcipher_alg psspad_alg =3D {
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

