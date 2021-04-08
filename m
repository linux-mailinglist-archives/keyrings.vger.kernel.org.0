Return-Path: <keyrings-owner@vger.kernel.org>
X-Original-To: lists+keyrings@lfdr.de
Delivered-To: lists+keyrings@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6194A3586D8
	for <lists+keyrings@lfdr.de>; Thu,  8 Apr 2021 16:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232048AbhDHORm (ORCPT <rfc822;lists+keyrings@lfdr.de>);
        Thu, 8 Apr 2021 10:17:42 -0400
Received: from de-smtp-delivery-102.mimecast.com ([62.140.7.102]:35073 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232054AbhDHORQ (ORCPT
        <rfc822;keyrings@vger.kernel.org>); Thu, 8 Apr 2021 10:17:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1617891425;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DWSSzP5QXhI7WRhos++wXtpxy/9BblHdAqI5QoxPlPY=;
        b=RiwTC4Nd53V0nXvAtyjhyou6SdpaEqw9u0oZep2LGnLNtaL6r1zT9KfY8vBnaEc2LQ4y+Y
        NvfrUW9/r6MkC+YlTJWMz4NFI9+2Li870qv+w9M4zC3ZI9do8jokNV+2vNZ0TV4Tg08YLk
        vvIisa6l9+TGN2hj+bpL8NB13ZwP+kE=
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2051.outbound.protection.outlook.com [104.47.0.51]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-26-sRhzaybBPhqKB_esGrPGOw-1; Thu, 08 Apr 2021 16:16:53 +0200
X-MC-Unique: sRhzaybBPhqKB_esGrPGOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YK/19zV/q98+dyZkJx76wRPhNF96MRU5Ao7xrz9hNQE6JB4S5fCvZ4uk6pXoN74VAl8/slvZhda5txasTIuAvo/b7lcw9pnG+XcDaQewTFIfrlnMtxgpzMaAsMHUeb7C7v2LaFOnNN4U5NcJLrhxKC9ODv4lIwLK7byo7Fyquv0FhEBua1Pxdc8bxbrwiwkTQatqJtG26NPz3i3/k8UFK75mmqCZ1Z9YYeVKfG6zF2yVo8Ixw/2qJNEp/BhnFP6VW0raaWq9yDqsbnQHJBJXjNaFQ35noJwDsfhHVCqiyq6kjMrUlZkL+nb+lnBDj6rx89cJ4c2ZQ8LzLBAp5o67og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huqGSLffEZrdFn84hJb0MF2BX6fnQrDe+V+X+XzDV7k=;
 b=ZFznT/6qdsV0oD3dI4tQNur5JSTAHuv0g43CKiuMmE/KJ3QBPJQ7caj0dsGgHExpWB6taIFD6ZRCSEG0KyA0rDQMXawdFM2tq1OegawrOlQs0ZNRLS1R8rx9WYTQR4cBTwNWOxkuaaQXf0Lyjcca/uYfQzex+qki9lxD4tuvigSEIxtWfZVYlGkaOgNf/vHVgZrh5kcTi3MK7Nb8w7RpJ+U9NV1Nq3TWi5o229CQwTHRe4WNZUndBbNw3uKK/rZVZs+g92FDjepsqD/PUhFRwGoOnGlMC6Zy4U8J1QemvOwwpqD/1Q05k8tbg352TsDtxhs0pTWAg3aoEB14XCXcMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=suse.com;
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com (2603:10a6:208:128::18)
 by AM0PR04MB4833.eurprd04.prod.outlook.com (2603:10a6:208:c2::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Thu, 8 Apr
 2021 14:16:52 +0000
Received: from AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d]) by AM0PR04MB5650.eurprd04.prod.outlook.com
 ([fe80::756a:86b8:8283:733d%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 14:16:52 +0000
From:   Varad Gautam <varad.gautam@suse.com>
To:     linux-crypto@vger.kernel.org
CC:     varad.gautam@suse.com, dhowells@redhat.com,
        herbert@gondor.apana.org.au, davem@davemloft.net, vt@altlinux.org,
        tianjia.zhang@linux.alibaba.com, keyrings@vger.kernel.org,
        linux-kernel@vger.kernel.org, jarkko@kernel.org
Subject: [PATCH v2 16/18] crypto: rsa-psspad: Implement signature verify callback
Date:   Thu,  8 Apr 2021 16:15:14 +0200
Message-ID: <20210408141516.11369-17-varad.gautam@suse.com>
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
Received: from xps13.suse.cz (95.90.93.216) by ZR0P278CA0137.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16 via Frontend Transport; Thu, 8 Apr 2021 14:16:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 835ba732-e120-4355-dbeb-08d8fa98f4b5
X-MS-TrafficTypeDiagnostic: AM0PR04MB4833:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR04MB4833626CB01CF3090D5CB5F7E0749@AM0PR04MB4833.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:546;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IhEqgx0SzwGU7PxoMQOcCQRKF+H82EQWhANSv+XW1mcI71AzjW/BHa+c5WKA5cb3PjfOGjwb9KHrNAIZ3N5NuTuSSc3wbe/k9zj8ex2BrZxXujw5wG3MHF5obcP3yuYljcAOXxHFkuH58/HuLWKC5T4YjowZ/fQi99zKOOK8xsq6IDRJv2+eyvGQHpCdbZeb2DibeF7jZ/UhXwgWViPZkStFAhp72hnUSbgvGk1CWldeq0G07euT3E5dy7u1RXpdR3gdjRaQBrDdj5Olo1tK5jafeHYCo4t41ccEap4zObBF9ErwDnuZvaU1f8J1rKs2wL1mzvg/b1ors4a/bgQ5Ct913AkLhuYIVkmSXOJYRZcnhrjxOIjHVLHOE4x+O2Df3ZJ5d0aZozLMm7Lvbfj2hqbE0lKG7xHz+K0IpLIm3gL2I1InSK0iOLx8uX5xIsmVY9vtLxoASjB42tj1OMA4G1vD6LUf5wXam6M+stdTAqpj5sdC/FXHGdfVBJR4wSSNbT6MmBDbUTu9PE6PPFhj1ydpePSUhJnjl+Y3OOVvc1iB3x0VgDnuvjR3CpKvqoaamOBOtnjLuOr2eHAyB4VIgasSjxSITHthV4hxdesG9JBhC46CNVZLs7xqatdaou7wTL9YnYyZPzrPcCD1BglhQ3mxisNVy528GEvSWcmMUo8tGdg2MwbwwFkVrq4kQgdmaKOA1o1XYWc0OlrN+pAJiR2D7JcBGJfzACLAXJNqNkD98GvxP9BpO8aUXau64RTk
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5650.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(136003)(346002)(396003)(376002)(478600001)(36756003)(2616005)(83380400001)(966005)(38350700001)(956004)(6916009)(316002)(6512007)(52116002)(6506007)(38100700001)(6486002)(2906002)(66946007)(44832011)(1076003)(15650500001)(86362001)(186003)(4326008)(16526019)(8936002)(8676002)(6666004)(26005)(66556008)(5660300002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?NNDZBXjoCmFE1i91tuNaSQhz0xp4I/QZd83W+bZM6Sk+9c5thgoYdyp+ZWdB?=
 =?us-ascii?Q?8RVlzJEUCgONif0sECabHBWv66fXrTuuGEglikDKV7XEeFg5Oq/8/DcqoLhF?=
 =?us-ascii?Q?idfXJFfd1vykL7yVruUfeqrLw6h1SpmB1u/228lpBZiLJ5Ftkajip2X4t4gy?=
 =?us-ascii?Q?NzQ8ZvSKtFvazNvJ/dkgLwlPftXBCkaQTlli4e7rdKWpTkHk9pxU7ZlTta6s?=
 =?us-ascii?Q?FIY9csG8ZlNUR/CLQGR3aLUJKAR9qPqxxa5Sd8o/jtKisMr587UNr7abgFGh?=
 =?us-ascii?Q?C1D6XorLt9c9ocGgSoyAVKFjareJXFROGBbLECT6CqIR/fldAFV6cJXIxgei?=
 =?us-ascii?Q?vQXgpBwcnDJtSSoRiXFJfOz37VUY0d+INNreiullyDvHmhJH62fhUmfhyRRP?=
 =?us-ascii?Q?zeN8ju/g1MYQUUFsF3dATuguwLOYPySYpEgCyTXubLnIUY0IxLtrvoREnK+o?=
 =?us-ascii?Q?QfrpT3XcO6nJmvwA3IrzdoJB6Lx1KmgvreQ8t2BRh1x9HSeJESK3txVvksml?=
 =?us-ascii?Q?oKWPyCqMPHj9Az2Usky89j/nmZsxAsoKr25BHV2h0RxloL7K38QIwE/Aeu+a?=
 =?us-ascii?Q?NVwpvtNHFvHEuogJUFspo0rYHwCfTOOfjCv1pPDaNRizx6zbmnOnISAcKPu9?=
 =?us-ascii?Q?8Wp/odpe1GkGYUoR3sg63ww0CdWUqAxejNkupot0FCtnNnSy0U5DH1hklkwf?=
 =?us-ascii?Q?XJZiICkEGxrttdjJsQTCK9VTdxK/2dTamfbloj/bWbE6a6pNg8yYFoeIBHqZ?=
 =?us-ascii?Q?Nx0MC/cODmdw1Ltx90jW9mT2SPXPXXMDJktH7/f8C4hkd8SWwIMiNnpTGyNC?=
 =?us-ascii?Q?Psg+xwUOLUe40T44gUFukNwytQJNPIwtTlBv5ESFeOelUDg10n4t7A8gTYM4?=
 =?us-ascii?Q?DHo4kvJadew5vLIiqgGvwzJHjCR8dzsI0j0vFjYGTkWkiBZUQpb6VAQRJEen?=
 =?us-ascii?Q?ace03+nClshPfPZkvIWc1N4IjbbSwHDUi+/HxQ93r1CXBpWgsPKt3+XmBXT4?=
 =?us-ascii?Q?rX/wLcv30UeBlDf8LS+Q12E52PX3Poqlpa6u0+exicmRy0RhTQqYvo4kUKsU?=
 =?us-ascii?Q?UDQLsNuEQNl1JqZRIAnjjyDtgS/YLlkSiUtdk9FRd0HYuQiiYfY/UhuMoE/e?=
 =?us-ascii?Q?WjuCZDS8Ay9BVyefr7R2cJjZmIWxdUpsibkWQrjVAkYLSshHBmJ3cOR2xdgS?=
 =?us-ascii?Q?YVJrPNaKN2E9BlnEcmwU6kX8m7T+8Wqm0/D1tsj9VsYQ7CYR+8F1zKZFF6fU?=
 =?us-ascii?Q?Uo4c/XlA/OaH/F6zCagLaVmH7957F/KQdVaY0ninfjnlhob0bID1ViCk/Qws?=
 =?us-ascii?Q?QHlejD9Hl+wWK50bto+mE40s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835ba732-e120-4355-dbeb-08d8fa98f4b5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5650.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 14:16:52.2685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YdfLK66g6YLxVDDvu4vRkprGAwE5955KTi76zAHxhxuik3gVC6ysFXkjkPnZEC7nMOLNzDZNDTIm811W/TaMwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4833
Precedence: bulk
List-ID: <keyrings.vger.kernel.org>
X-Mailing-List: keyrings@vger.kernel.org

The RSA output must be processed as per the EMSA-PSS-VERIFY operation
from RFC8017, which forms the core of the PSS signature verification.

Implement the verification callback, which operates on the RSA output
buffer.

Reference: https://tools.ietf.org/html/rfc8017#section-9.1.2
Signed-off-by: Varad Gautam <varad.gautam@suse.com>
---
v2: Allow mgf_hash_algo to be different from digest hash algorithm.

 crypto/rsa-psspad.c | 114 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/crypto/rsa-psspad.c b/crypto/rsa-psspad.c
index 4ba4d69f6ce17..87e90479a4fa7 100644
--- a/crypto/rsa-psspad.c
+++ b/crypto/rsa-psspad.c
@@ -8,6 +8,7 @@
=20
 #include <crypto/hash.h>
 #include <crypto/internal/akcipher.h>
+#include <crypto/internal/rsa.h>
 #include <crypto/internal/rsa-common.h>
 #include <crypto/public_key.h>
=20
@@ -107,7 +108,118 @@ static int pkcs1_mgf1(u8 *seed, unsigned int seed_len=
,
=20
 static int psspad_verify_complete(struct akcipher_request *req, int err)
 {
-	return -EOPNOTSUPP;
+	struct crypto_akcipher *tfm =3D crypto_akcipher_reqtfm(req);
+	struct rsapad_tfm_ctx *ctx =3D akcipher_tfm_ctx(tfm);
+	struct rsapad_akciper_req_ctx *req_ctx =3D akcipher_request_ctx(req);
+	struct akcipher_instance *inst =3D akcipher_alg_instance(tfm);
+	struct rsapad_inst_ctx *ictx =3D akcipher_instance_ctx(inst);
+	const struct rsa_asn1_template *digest_info =3D ictx->digest_info;
+	struct crypto_shash *hash_tfm =3D NULL;
+	struct shash_desc *desc =3D NULL;
+	struct rsa_mpi_key *pkey =3D akcipher_tfm_ctx(ctx->child);
+
+	u8 *em, *h, *salt, *maskeddb;
+	unsigned int em_len, em_bits, h_len, s_len, maskeddb_len;
+	u8 *m_hash, *db_mask, *db, *h_;
+	static u8 zeroes[8] =3D { 0 };
+	unsigned int pos;
+
+	if (err)
+		goto out;
+
+	err =3D -EINVAL;
+	if (!digest_info)
+		goto out;
+
+	em =3D req_ctx->out_buf;
+	em_len =3D ctx->key_size;
+	em_bits =3D mpi_get_nbits(pkey->n) - 1;
+	if ((em_bits & 0x7) =3D=3D 0) {
+		em_len--;
+		em++;
+	}
+
+	h_len =3D req->dst_len;
+	s_len =3D ictx->salt_len;
+
+	if (em_len < h_len + s_len + 2)
+		goto out;
+
+	if (em[em_len - 1] !=3D 0xbc)
+		goto out;
+
+	maskeddb =3D em;
+	maskeddb_len =3D em_len - h_len - 1;
+	h =3D em + maskeddb_len;
+
+	if (em[0] & ~((u8) 0xff >> (8 * em_len - em_bits)))
+		goto out;
+
+	db_mask =3D kzalloc(maskeddb_len, GFP_KERNEL);
+	if (!db_mask) {
+		err =3D -ENOMEM;
+		goto out;
+	}
+
+	err =3D psspad_setup_shash(&hash_tfm, &desc, ictx->mgf_hash_algo);
+	if (err < 0)
+		goto out_db_mask;
+
+	err =3D pkcs1_mgf1(h, h_len, desc, db_mask, maskeddb_len);
+	if (err < 0)
+		goto out_shash;
+
+	for (pos =3D 0; pos < maskeddb_len; pos++)
+		maskeddb[pos] ^=3D db_mask[pos];
+	db =3D maskeddb;
+
+	db[0] &=3D ((u8) 0xff >> (8 * em_len - em_bits));
+
+	err =3D -EINVAL;
+	for (pos =3D 0; pos < em_len - h_len - s_len - 2; pos++) {
+		if (db[pos] !=3D 0)
+			goto out_shash;
+	}
+	if (db[pos] !=3D 0x01)
+		goto out_shash;
+
+	salt =3D db + (maskeddb_len - s_len);
+
+	m_hash =3D req_ctx->out_buf + ctx->key_size;
+	sg_pcopy_to_buffer(req->src,
+			   sg_nents_for_len(req->src, req->src_len + req->dst_len),
+			   m_hash,
+			   req->dst_len, ctx->key_size);
+
+	if (strcmp(ictx->mgf_hash_algo, digest_info->name) !=3D 0) {
+		psspad_free_shash(hash_tfm, desc);
+		err =3D psspad_setup_shash(&hash_tfm, &desc, digest_info->name);
+		if (err < 0)
+			goto out_db_mask;
+	}
+
+	err =3D crypto_shash_init(desc);
+	if (!err)
+		err =3D crypto_shash_update(desc, zeroes, 8);
+	if (!err)
+		err =3D crypto_shash_update(desc, m_hash, h_len);
+	if (!err)
+		err =3D crypto_shash_finup(desc, salt, s_len, m_hash);
+	if (err < 0)
+		goto out_shash;
+
+	h_ =3D m_hash;
+
+	if (memcmp(h_, h, h_len) !=3D 0)
+		err =3D -EKEYREJECTED;
+
+out_shash:
+	psspad_free_shash(hash_tfm, desc);
+out_db_mask:
+	kfree(db_mask);
+out:
+	kfree_sensitive(req_ctx->out_buf);
+	return err;
 }
=20
 static void psspad_verify_complete_cb(struct crypto_async_request *child_a=
sync_req,
--=20
2.30.2

